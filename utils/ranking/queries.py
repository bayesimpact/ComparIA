"""
Database queries for fetching vote and reaction data for ranking computation.

Uses psycopg2 with RealDictCursor, matching the existing pattern
from backend/arena/persistence.py and backend/utils/countries.py.
"""

import logging

from psycopg2.extras import RealDictCursor

from utils.storage.db import db_cursor
from utils.storage.queries import get_reactions_db_query, get_votes_db_query
from utils.utils import configure_logger

logger = configure_logger(logging.getLogger("ranking.queries"))


def fetch_votes() -> list[dict]:
    """
    Fetch all non-archived votes joined with conversations for country_portal.

    Returns:
        List of dicts with keys: model_a_name, model_b_name, chosen_model_name,
        both_equal, conv_{accuracy,completeness,actionable,safety}_{a,b},
        conv_{discordance,reasoning_error,clinical_risk}_{a,b}, country_portal.
    """
    with db_cursor("get votes", logger, cursor_factory=RealDictCursor) as cursor:
        cursor.execute(
            get_votes_db_query(
                columns={
                    "v": (
                        "chosen_model_name",
                        "both_equal",
                        "conv_accuracy_a",
                        "conv_accuracy_b",
                        "conv_completeness_a",
                        "conv_completeness_b",
                        "conv_actionable_a",
                        "conv_actionable_b",
                        "conv_safety_a",
                        "conv_safety_b",
                        "conv_discordance_a",
                        "conv_discordance_b",
                        "conv_reasoning_error_a",
                        "conv_reasoning_error_b",
                        "conv_clinical_risk_a",
                        "conv_clinical_risk_b",
                    ),
                    "c": (
                        "model_a_name",
                        "model_b_name",
                        "country_portal",
                    ),
                },
                exclude_pii=False,
            )
        )
        return [dict(row) for row in cursor.fetchall()]

    return []


def fetch_reactions() -> list[dict]:
    """
    Fetch all non-archived reactions joined with conversations for country_portal.

    Returns:
        List of dicts with keys: model_a_name, model_b_name, refers_to_model,
        liked, disliked, country_portal.
    """
    with db_cursor("get reactions", logger, cursor_factory=RealDictCursor) as cursor:
        cursor.execute(
            get_reactions_db_query(
                columns={
                    "r": (
                        "refers_to_model",
                        "liked",
                        "disliked",
                        "accuracy",
                        "completeness",
                        "actionable",
                        "safety",
                        "discordance",
                        "reasoning_error",
                        "clinical_risk",
                    ),
                    "c": (
                        "model_a_name",
                        "model_b_name",
                        "country_portal",
                    ),
                },
                exclude_pii=False,
            )
        )

        return [dict(row) for row in cursor.fetchall()]

    return []
