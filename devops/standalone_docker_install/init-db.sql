-- Standalone ComparIA schema (post-migration state, as of 2026_04).
-- Consolidated from:
--   devops/instances/postgres/schema.sql
--   utils/database/migrations/2026_04_simplify_db.sql
--   utils/database/migrations/2026_04_archived.sql
-- Role-specific GRANTs are omitted: the standalone Postgres user owns everything.
-- Mounted into /docker-entrypoint-initdb.d/ at first postgres startup.

-- CONVERSATIONS
CREATE TABLE IF NOT EXISTS conversations (
    id SERIAL PRIMARY KEY,
    timestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    model_a_name VARCHAR(500),
    model_b_name VARCHAR(500),
    conversation_a JSONB,
    conversation_b JSONB,
    conv_turns INT,
    system_prompt_a TEXT,
    system_prompt_b TEXT,
    conversation_pair_id VARCHAR UNIQUE,
    conv_a_id VARCHAR(500),
    conv_b_id VARCHAR(500),
    session_hash VARCHAR(255),
    visitor_id VARCHAR(255),
    ip VARCHAR(255),
    model_pair_name TEXT,
    opening_msg TEXT,
    archived BOOLEAN DEFAULT FALSE,
    archived_reason VARCHAR(255),
    archived_at TIMESTAMP,
    mode VARCHAR(255),
    custom_models_selection JSONB,
    short_summary TEXT,
    keywords JSONB,
    categories JSONB,
    languages JSONB,
    pii_analyzed BOOLEAN DEFAULT FALSE,
    contains_pii BOOLEAN,
    conversation_a_pii_removed JSONB,
    conversation_b_pii_removed JSONB,
    total_conv_a_output_tokens INT,
    total_conv_b_output_tokens INT,
    ip_map VARCHAR(255),
    postprocess_failed BOOLEAN DEFAULT FALSE,
    -- archived has DEFAULT FALSE: the backend code doesn't supply it on insert,
    -- and the 2026_04_archived migration's removal of the default broke insertions
    -- here (NULL archived → row filtered out by `WHERE archived = FALSE`).
    cohorts TEXT,
    country_portal VARCHAR(255),
    cached_response_a BOOLEAN DEFAULT FALSE,
    cached_response_b BOOLEAN DEFAULT FALSE,
    contains_spam BOOLEAN DEFAULT NULL
);

-- LOGS
CREATE TABLE IF NOT EXISTS logs (
    time TIMESTAMP NOT NULL,
    level VARCHAR(50) NOT NULL,
    message TEXT NOT NULL,
    query_params JSONB,
    path_params JSONB,
    session_hash VARCHAR(255),
    extra JSONB
);

-- REACTIONS
CREATE TABLE IF NOT EXISTS reactions (
    id SERIAL PRIMARY KEY,
    timestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    refers_to_model VARCHAR(500),
    msg_index INT NOT NULL,
    model_pos CHAR(1) CHECK (model_pos IN ('a', 'b')),
    current_conv_turn_when_reacting INT NOT NULL,
    system_prompt TEXT,
    conversation_pair_id VARCHAR NOT NULL,
    refers_to_conv_id VARCHAR(500) NOT NULL,
    session_hash VARCHAR(255),
    response_content TEXT,
    question_content TEXT,
    liked BOOLEAN,
    disliked BOOLEAN,
    comment TEXT,
    -- Bayes Impact / Impulse Healthtech clinical criteria
    accuracy BOOLEAN,
    completeness BOOLEAN,
    actionable BOOLEAN,
    safety BOOLEAN,
    discordance BOOLEAN,
    reasoning_error BOOLEAN,
    clinical_risk BOOLEAN,
    msg_rank INT NOT NULL,
    question_id VARCHAR(500),
    archived BOOLEAN DEFAULT FALSE,
    archived_reason VARCHAR(255),
    archived_at TIMESTAMP,
    CONSTRAINT unique_conversation_pair UNIQUE (refers_to_conv_id, msg_index)
);

-- VOTES
CREATE TABLE IF NOT EXISTS votes (
    id SERIAL PRIMARY KEY,
    timestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    chosen_model_name VARCHAR(500),
    both_equal BOOLEAN,
    conversation_pair_id VARCHAR NOT NULL,
    session_hash VARCHAR(255),
    conv_comments_a TEXT,
    conv_comments_b TEXT,
    -- Bayes Impact / Impulse Healthtech clinical criteria (per side a/b)
    conv_accuracy_a BOOLEAN,
    conv_accuracy_b BOOLEAN,
    conv_completeness_a BOOLEAN,
    conv_completeness_b BOOLEAN,
    conv_actionable_a BOOLEAN,
    conv_actionable_b BOOLEAN,
    conv_safety_a BOOLEAN,
    conv_safety_b BOOLEAN,
    conv_discordance_a BOOLEAN,
    conv_discordance_b BOOLEAN,
    conv_reasoning_error_a BOOLEAN,
    conv_reasoning_error_b BOOLEAN,
    conv_clinical_risk_a BOOLEAN,
    conv_clinical_risk_b BOOLEAN,
    archived BOOLEAN DEFAULT FALSE,
    archived_reason VARCHAR(255),
    archived_at TIMESTAMP
);
