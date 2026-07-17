import base64
import logging

import httpx
from fastapi import APIRouter, HTTPException, status
from pydantic import BaseModel

from backend.config import settings

logger = logging.getLogger("languia")

router = APIRouter(prefix="/newsletter", tags=["newsletter"])

# Reused across requests to avoid a fresh TCP+TLS handshake to Mailchimp every time.
_mailchimp_client = httpx.AsyncClient()


class NewsletterSubscribeBody(BaseModel):
    email: str
    # Hidden honeypot field: real users leave it empty, most spam bots fill it.
    website_url: str = ""


@router.post("/subscribe")
async def subscribe(body: NewsletterSubscribeBody) -> dict:
    """Add an email to the Bayes Impact Mailchimp audience, tagged "Compar:IA"."""
    if body.website_url:
        return {"status": "subscribed"}

    if not (
        settings.MAILCHIMP_API_KEY
        and settings.MAILCHIMP_AUDIENCE_ID
        and settings.MAILCHIMP_DC
    ):
        logger.error("Mailchimp not configured, skipping newsletter subscription")
        raise HTTPException(
            status_code=status.HTTP_503_SERVICE_UNAVAILABLE,
            detail="L'inscription à la newsletter n'est pas disponible pour le moment.",
        )

    auth = base64.b64encode(f"anystring:{settings.MAILCHIMP_API_KEY}".encode()).decode()

    response = await _mailchimp_client.post(
        f"https://{settings.MAILCHIMP_DC}.api.mailchimp.com/3.0/lists/{settings.MAILCHIMP_AUDIENCE_ID}/members",
        headers={"Authorization": f"Basic {auth}"},
        json={
            "email_address": body.email,
            "status": "subscribed",
            "tags": ["Compar:IA"],
        },
    )

    # Mailchimp returns 400 "Member Exists" for an already-subscribed address.
    if response.status_code == status.HTTP_400_BAD_REQUEST:
        try:
            error = response.json()
        except ValueError:
            error = {}
        if error.get("title") == "Member Exists":
            return {"status": "already_subscribed"}

    if response.is_error:
        logger.error(f"Mailchimp subscription failed: {response.status_code} {response.text}")
        raise HTTPException(
            status_code=status.HTTP_502_BAD_GATEWAY,
            detail="L'inscription a échoué, veuillez réessayer.",
        )

    return {"status": "subscribed"}
