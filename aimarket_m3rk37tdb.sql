--
-- PostgreSQL database dump
--

-- Dumped from database version 16.8 (Ubuntu 16.8-0ubuntu0.24.04.1)
-- Dumped by pg_dump version 16.8 (Ubuntu 16.8-0ubuntu0.24.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: aimarket_m3rk37tdb; Type: SCHEMA; Schema: -; Owner: aimarket_m3rk37t_user
--

CREATE SCHEMA aimarket_m3rk37tdb;


ALTER SCHEMA aimarket_m3rk37tdb OWNER TO aimarket_m3rk37t_user;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: accounts_memberresource; Type: TABLE; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

CREATE TABLE aimarket_m3rk37tdb.accounts_memberresource (
    id bigint NOT NULL,
    title character varying(100) NOT NULL,
    description text NOT NULL,
    file character varying(100) NOT NULL,
    thumbnail character varying(100) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    is_active boolean NOT NULL
);


ALTER TABLE aimarket_m3rk37tdb.accounts_memberresource OWNER TO aimarket_m3rk37t_user;

--
-- Name: accounts_memberresource_id_seq; Type: SEQUENCE; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

CREATE SEQUENCE aimarket_m3rk37tdb.accounts_memberresource_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE aimarket_m3rk37tdb.accounts_memberresource_id_seq OWNER TO aimarket_m3rk37t_user;

--
-- Name: accounts_memberresource_id_seq; Type: SEQUENCE OWNED BY; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

ALTER SEQUENCE aimarket_m3rk37tdb.accounts_memberresource_id_seq OWNED BY aimarket_m3rk37tdb.accounts_memberresource.id;


--
-- Name: accounts_profile; Type: TABLE; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

CREATE TABLE aimarket_m3rk37tdb.accounts_profile (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    user_id bigint NOT NULL,
    bio text
);


ALTER TABLE aimarket_m3rk37tdb.accounts_profile OWNER TO aimarket_m3rk37t_user;

--
-- Name: accounts_profile_id_seq; Type: SEQUENCE; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

CREATE SEQUENCE aimarket_m3rk37tdb.accounts_profile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE aimarket_m3rk37tdb.accounts_profile_id_seq OWNER TO aimarket_m3rk37t_user;

--
-- Name: accounts_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

ALTER SEQUENCE aimarket_m3rk37tdb.accounts_profile_id_seq OWNED BY aimarket_m3rk37tdb.accounts_profile.id;


--
-- Name: accounts_stripecustomer; Type: TABLE; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

CREATE TABLE aimarket_m3rk37tdb.accounts_stripecustomer (
    id character(32) NOT NULL,
    stripe_customer_id character varying(100) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE aimarket_m3rk37tdb.accounts_stripecustomer OWNER TO aimarket_m3rk37t_user;

--
-- Name: accounts_subscription; Type: TABLE; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

CREATE TABLE aimarket_m3rk37tdb.accounts_subscription (
    id character(32) NOT NULL,
    stripe_subscription_id character varying(100) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE aimarket_m3rk37tdb.accounts_subscription OWNER TO aimarket_m3rk37t_user;

--
-- Name: accounts_tokenusage; Type: TABLE; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

CREATE TABLE aimarket_m3rk37tdb.accounts_tokenusage (
    id bigint NOT NULL,
    prompt_tokens_used bigint NOT NULL,
    asset_tokens_used bigint NOT NULL,
    last_reset_date timestamp with time zone NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE aimarket_m3rk37tdb.accounts_tokenusage OWNER TO aimarket_m3rk37t_user;

--
-- Name: accounts_tokenusage_id_seq; Type: SEQUENCE; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

CREATE SEQUENCE aimarket_m3rk37tdb.accounts_tokenusage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE aimarket_m3rk37tdb.accounts_tokenusage_id_seq OWNER TO aimarket_m3rk37t_user;

--
-- Name: accounts_tokenusage_id_seq; Type: SEQUENCE OWNED BY; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

ALTER SEQUENCE aimarket_m3rk37tdb.accounts_tokenusage_id_seq OWNED BY aimarket_m3rk37tdb.accounts_tokenusage.id;


--
-- Name: assets_asset; Type: TABLE; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

CREATE TABLE aimarket_m3rk37tdb.assets_asset (
    id character(32) NOT NULL,
    title character varying(255) NOT NULL,
    file_name character varying(255) NOT NULL,
    file_url character varying(1000) NOT NULL,
    file_type character varying(50) NOT NULL,
    mime_type character varying(100) NOT NULL,
    size bigint NOT NULL,
    content text NOT NULL,
    token_count bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    project_id character(32) NOT NULL
);


ALTER TABLE aimarket_m3rk37tdb.assets_asset OWNER TO aimarket_m3rk37t_user;

--
-- Name: assets_assetprocessingjob; Type: TABLE; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

CREATE TABLE aimarket_m3rk37tdb.assets_assetprocessingjob (
    id character(32) NOT NULL,
    status character varying(50) NOT NULL,
    error_message text,
    attempts bigint NOT NULL,
    last_heart_beat timestamp with time zone NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    asset_id character(32) NOT NULL,
    project_id character(32) NOT NULL
);


ALTER TABLE aimarket_m3rk37tdb.assets_assetprocessingjob OWNER TO aimarket_m3rk37t_user;

--
-- Name: auth_group; Type: TABLE; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

CREATE TABLE aimarket_m3rk37tdb.auth_group (
    id bigint NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE aimarket_m3rk37tdb.auth_group OWNER TO aimarket_m3rk37t_user;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

CREATE SEQUENCE aimarket_m3rk37tdb.auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE aimarket_m3rk37tdb.auth_group_id_seq OWNER TO aimarket_m3rk37t_user;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

ALTER SEQUENCE aimarket_m3rk37tdb.auth_group_id_seq OWNED BY aimarket_m3rk37tdb.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

CREATE TABLE aimarket_m3rk37tdb.auth_group_permissions (
    id bigint NOT NULL,
    group_id bigint NOT NULL,
    permission_id bigint NOT NULL
);


ALTER TABLE aimarket_m3rk37tdb.auth_group_permissions OWNER TO aimarket_m3rk37t_user;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

CREATE SEQUENCE aimarket_m3rk37tdb.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE aimarket_m3rk37tdb.auth_group_permissions_id_seq OWNER TO aimarket_m3rk37t_user;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

ALTER SEQUENCE aimarket_m3rk37tdb.auth_group_permissions_id_seq OWNED BY aimarket_m3rk37tdb.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

CREATE TABLE aimarket_m3rk37tdb.auth_permission (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id bigint NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE aimarket_m3rk37tdb.auth_permission OWNER TO aimarket_m3rk37t_user;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

CREATE SEQUENCE aimarket_m3rk37tdb.auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE aimarket_m3rk37tdb.auth_permission_id_seq OWNER TO aimarket_m3rk37t_user;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

ALTER SEQUENCE aimarket_m3rk37tdb.auth_permission_id_seq OWNED BY aimarket_m3rk37tdb.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

CREATE TABLE aimarket_m3rk37tdb.auth_user (
    id bigint NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE aimarket_m3rk37tdb.auth_user OWNER TO aimarket_m3rk37t_user;

--
-- Name: auth_user_groups; Type: TABLE; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

CREATE TABLE aimarket_m3rk37tdb.auth_user_groups (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    group_id bigint NOT NULL
);


ALTER TABLE aimarket_m3rk37tdb.auth_user_groups OWNER TO aimarket_m3rk37t_user;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

CREATE SEQUENCE aimarket_m3rk37tdb.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE aimarket_m3rk37tdb.auth_user_groups_id_seq OWNER TO aimarket_m3rk37t_user;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

ALTER SEQUENCE aimarket_m3rk37tdb.auth_user_groups_id_seq OWNED BY aimarket_m3rk37tdb.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

CREATE SEQUENCE aimarket_m3rk37tdb.auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE aimarket_m3rk37tdb.auth_user_id_seq OWNER TO aimarket_m3rk37t_user;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

ALTER SEQUENCE aimarket_m3rk37tdb.auth_user_id_seq OWNED BY aimarket_m3rk37tdb.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

CREATE TABLE aimarket_m3rk37tdb.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    permission_id bigint NOT NULL
);


ALTER TABLE aimarket_m3rk37tdb.auth_user_user_permissions OWNER TO aimarket_m3rk37t_user;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

CREATE SEQUENCE aimarket_m3rk37tdb.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE aimarket_m3rk37tdb.auth_user_user_permissions_id_seq OWNER TO aimarket_m3rk37t_user;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

ALTER SEQUENCE aimarket_m3rk37tdb.auth_user_user_permissions_id_seq OWNED BY aimarket_m3rk37tdb.auth_user_user_permissions.id;


--
-- Name: blog_category; Type: TABLE; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

CREATE TABLE aimarket_m3rk37tdb.blog_category (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(50) NOT NULL
);


ALTER TABLE aimarket_m3rk37tdb.blog_category OWNER TO aimarket_m3rk37t_user;

--
-- Name: blog_category_id_seq; Type: SEQUENCE; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

CREATE SEQUENCE aimarket_m3rk37tdb.blog_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE aimarket_m3rk37tdb.blog_category_id_seq OWNER TO aimarket_m3rk37t_user;

--
-- Name: blog_category_id_seq; Type: SEQUENCE OWNED BY; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

ALTER SEQUENCE aimarket_m3rk37tdb.blog_category_id_seq OWNED BY aimarket_m3rk37tdb.blog_category.id;


--
-- Name: blog_post; Type: TABLE; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

CREATE TABLE aimarket_m3rk37tdb.blog_post (
    id bigint NOT NULL,
    title character varying(200) NOT NULL,
    slug character varying(50) NOT NULL,
    status character varying(10) NOT NULL,
    featured boolean NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    publish_date timestamp with time zone,
    content text NOT NULL,
    image character varying(100) DEFAULT NULL::character varying,
    external_image_url character varying(500) DEFAULT NULL::character varying,
    youtube_url character varying(200) DEFAULT NULL::character varying,
    thumbnail character varying(100) DEFAULT NULL::character varying,
    ad_type character varying(10) NOT NULL,
    ad_code text NOT NULL,
    ad_image character varying(100) DEFAULT NULL::character varying,
    ad_url character varying(200) NOT NULL,
    meta_title character varying(60) NOT NULL,
    meta_description character varying(160) NOT NULL,
    meta_keywords character varying(255) NOT NULL,
    category_id bigint NOT NULL
);


ALTER TABLE aimarket_m3rk37tdb.blog_post OWNER TO aimarket_m3rk37t_user;

--
-- Name: blog_post_id_seq; Type: SEQUENCE; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

CREATE SEQUENCE aimarket_m3rk37tdb.blog_post_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE aimarket_m3rk37tdb.blog_post_id_seq OWNER TO aimarket_m3rk37t_user;

--
-- Name: blog_post_id_seq; Type: SEQUENCE OWNED BY; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

ALTER SEQUENCE aimarket_m3rk37tdb.blog_post_id_seq OWNED BY aimarket_m3rk37tdb.blog_post.id;


--
-- Name: content_generation_aiconfig; Type: TABLE; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

CREATE TABLE aimarket_m3rk37tdb.content_generation_aiconfig (
    id character(32) NOT NULL,
    name character varying(100) NOT NULL,
    model_name character varying(100) NOT NULL,
    fallback_model character varying(100) NOT NULL,
    temperature double precision NOT NULL,
    max_tokens bigint NOT NULL,
    is_active boolean NOT NULL
);


ALTER TABLE aimarket_m3rk37tdb.content_generation_aiconfig OWNER TO aimarket_m3rk37t_user;

--
-- Name: content_generation_contentgenerationjob; Type: TABLE; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

CREATE TABLE aimarket_m3rk37tdb.content_generation_contentgenerationjob (
    id character(32) NOT NULL,
    status character varying(20) NOT NULL,
    started_at timestamp with time zone NOT NULL,
    completed_at timestamp with time zone,
    prompts_total bigint NOT NULL,
    prompts_completed bigint NOT NULL,
    error_message text,
    project_id character(32) NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE aimarket_m3rk37tdb.content_generation_contentgenerationjob OWNER TO aimarket_m3rk37t_user;

--
-- Name: content_generation_prompttemplate; Type: TABLE; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

CREATE TABLE aimarket_m3rk37tdb.content_generation_prompttemplate (
    id character(32) NOT NULL,
    name character varying(100) NOT NULL,
    content_type character varying(20) NOT NULL,
    system_prompt text NOT NULL,
    description text,
    is_active boolean NOT NULL,
    is_default boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    user_id bigint
);


ALTER TABLE aimarket_m3rk37tdb.content_generation_prompttemplate OWNER TO aimarket_m3rk37t_user;

--
-- Name: content_templates_template; Type: TABLE; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

CREATE TABLE aimarket_m3rk37tdb.content_templates_template (
    id character(32) NOT NULL,
    title character varying(255) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    user_id bigint NOT NULL,
    keywords text NOT NULL,
    description text
);


ALTER TABLE aimarket_m3rk37tdb.content_templates_template OWNER TO aimarket_m3rk37t_user;

--
-- Name: content_templates_templateprompt; Type: TABLE; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

CREATE TABLE aimarket_m3rk37tdb.content_templates_templateprompt (
    id character(32) NOT NULL,
    name character varying(255) NOT NULL,
    prompt text,
    token_count bigint NOT NULL,
    "order" bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    template_id character(32) NOT NULL
);


ALTER TABLE aimarket_m3rk37tdb.content_templates_templateprompt OWNER TO aimarket_m3rk37t_user;

--
-- Name: core_contactmessage; Type: TABLE; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

CREATE TABLE aimarket_m3rk37tdb.core_contactmessage (
    id bigint NOT NULL,
    first_name character varying(100) DEFAULT NULL::character varying,
    subject character varying(50) NOT NULL,
    message text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    is_read boolean NOT NULL,
    status character varying(20) NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE aimarket_m3rk37tdb.core_contactmessage OWNER TO aimarket_m3rk37t_user;

--
-- Name: core_contactmessage_id_seq; Type: SEQUENCE; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

CREATE SEQUENCE aimarket_m3rk37tdb.core_contactmessage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE aimarket_m3rk37tdb.core_contactmessage_id_seq OWNER TO aimarket_m3rk37t_user;

--
-- Name: core_contactmessage_id_seq; Type: SEQUENCE OWNED BY; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

ALTER SEQUENCE aimarket_m3rk37tdb.core_contactmessage_id_seq OWNED BY aimarket_m3rk37tdb.core_contactmessage.id;


--
-- Name: core_tag; Type: TABLE; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

CREATE TABLE aimarket_m3rk37tdb.core_tag (
    id character(32) NOT NULL,
    name character varying(50) NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE aimarket_m3rk37tdb.core_tag OWNER TO aimarket_m3rk37t_user;

--
-- Name: core_taggeditem; Type: TABLE; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

CREATE TABLE aimarket_m3rk37tdb.core_taggeditem (
    id character(32) NOT NULL,
    object_id character(32) NOT NULL,
    content_type_id bigint NOT NULL,
    tag_id character(32) NOT NULL
);


ALTER TABLE aimarket_m3rk37tdb.core_taggeditem OWNER TO aimarket_m3rk37t_user;

--
-- Name: django_admin_log; Type: TABLE; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

CREATE TABLE aimarket_m3rk37tdb.django_admin_log (
    id bigint NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag integer NOT NULL,
    change_message text NOT NULL,
    content_type_id bigint,
    user_id bigint NOT NULL
);


ALTER TABLE aimarket_m3rk37tdb.django_admin_log OWNER TO aimarket_m3rk37t_user;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

CREATE SEQUENCE aimarket_m3rk37tdb.django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE aimarket_m3rk37tdb.django_admin_log_id_seq OWNER TO aimarket_m3rk37t_user;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

ALTER SEQUENCE aimarket_m3rk37tdb.django_admin_log_id_seq OWNED BY aimarket_m3rk37tdb.django_admin_log.id;


--
-- Name: django_celery_results_chordcounter; Type: TABLE; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

CREATE TABLE aimarket_m3rk37tdb.django_celery_results_chordcounter (
    id bigint NOT NULL,
    group_id character varying(255) NOT NULL,
    sub_tasks text NOT NULL,
    count bigint NOT NULL
);


ALTER TABLE aimarket_m3rk37tdb.django_celery_results_chordcounter OWNER TO aimarket_m3rk37t_user;

--
-- Name: django_celery_results_chordcounter_id_seq; Type: SEQUENCE; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

CREATE SEQUENCE aimarket_m3rk37tdb.django_celery_results_chordcounter_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE aimarket_m3rk37tdb.django_celery_results_chordcounter_id_seq OWNER TO aimarket_m3rk37t_user;

--
-- Name: django_celery_results_chordcounter_id_seq; Type: SEQUENCE OWNED BY; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

ALTER SEQUENCE aimarket_m3rk37tdb.django_celery_results_chordcounter_id_seq OWNED BY aimarket_m3rk37tdb.django_celery_results_chordcounter.id;


--
-- Name: django_celery_results_groupresult; Type: TABLE; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

CREATE TABLE aimarket_m3rk37tdb.django_celery_results_groupresult (
    id bigint NOT NULL,
    group_id character varying(255) NOT NULL,
    date_created timestamp with time zone NOT NULL,
    date_done timestamp with time zone NOT NULL,
    content_type character varying(128) NOT NULL,
    content_encoding character varying(64) NOT NULL,
    result text
);


ALTER TABLE aimarket_m3rk37tdb.django_celery_results_groupresult OWNER TO aimarket_m3rk37t_user;

--
-- Name: django_celery_results_groupresult_id_seq; Type: SEQUENCE; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

CREATE SEQUENCE aimarket_m3rk37tdb.django_celery_results_groupresult_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE aimarket_m3rk37tdb.django_celery_results_groupresult_id_seq OWNER TO aimarket_m3rk37t_user;

--
-- Name: django_celery_results_groupresult_id_seq; Type: SEQUENCE OWNED BY; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

ALTER SEQUENCE aimarket_m3rk37tdb.django_celery_results_groupresult_id_seq OWNED BY aimarket_m3rk37tdb.django_celery_results_groupresult.id;


--
-- Name: django_celery_results_taskresult; Type: TABLE; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

CREATE TABLE aimarket_m3rk37tdb.django_celery_results_taskresult (
    id bigint NOT NULL,
    task_id character varying(255) NOT NULL,
    status character varying(50) NOT NULL,
    content_type character varying(128) NOT NULL,
    content_encoding character varying(64) NOT NULL,
    result text,
    date_done timestamp with time zone NOT NULL,
    traceback text,
    meta text,
    task_args text,
    task_kwargs text,
    task_name character varying(255) DEFAULT NULL::character varying,
    worker character varying(100) DEFAULT NULL::character varying,
    date_created timestamp with time zone NOT NULL,
    periodic_task_name character varying(255) DEFAULT NULL::character varying,
    date_started timestamp with time zone
);


ALTER TABLE aimarket_m3rk37tdb.django_celery_results_taskresult OWNER TO aimarket_m3rk37t_user;

--
-- Name: django_celery_results_taskresult_id_seq; Type: SEQUENCE; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

CREATE SEQUENCE aimarket_m3rk37tdb.django_celery_results_taskresult_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE aimarket_m3rk37tdb.django_celery_results_taskresult_id_seq OWNER TO aimarket_m3rk37t_user;

--
-- Name: django_celery_results_taskresult_id_seq; Type: SEQUENCE OWNED BY; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

ALTER SEQUENCE aimarket_m3rk37tdb.django_celery_results_taskresult_id_seq OWNED BY aimarket_m3rk37tdb.django_celery_results_taskresult.id;


--
-- Name: django_content_type; Type: TABLE; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

CREATE TABLE aimarket_m3rk37tdb.django_content_type (
    id bigint NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE aimarket_m3rk37tdb.django_content_type OWNER TO aimarket_m3rk37t_user;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

CREATE SEQUENCE aimarket_m3rk37tdb.django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE aimarket_m3rk37tdb.django_content_type_id_seq OWNER TO aimarket_m3rk37t_user;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

ALTER SEQUENCE aimarket_m3rk37tdb.django_content_type_id_seq OWNED BY aimarket_m3rk37tdb.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

CREATE TABLE aimarket_m3rk37tdb.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE aimarket_m3rk37tdb.django_migrations OWNER TO aimarket_m3rk37t_user;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

CREATE SEQUENCE aimarket_m3rk37tdb.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE aimarket_m3rk37tdb.django_migrations_id_seq OWNER TO aimarket_m3rk37t_user;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

ALTER SEQUENCE aimarket_m3rk37tdb.django_migrations_id_seq OWNED BY aimarket_m3rk37tdb.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

CREATE TABLE aimarket_m3rk37tdb.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE aimarket_m3rk37tdb.django_session OWNER TO aimarket_m3rk37t_user;

--
-- Name: docs_documentationcategory; Type: TABLE; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

CREATE TABLE aimarket_m3rk37tdb.docs_documentationcategory (
    id character(32) NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(50) NOT NULL,
    description text,
    "order" bigint NOT NULL
);


ALTER TABLE aimarket_m3rk37tdb.docs_documentationcategory OWNER TO aimarket_m3rk37t_user;

--
-- Name: docs_documentationpage; Type: TABLE; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

CREATE TABLE aimarket_m3rk37tdb.docs_documentationpage (
    id character(32) NOT NULL,
    title character varying(200) NOT NULL,
    slug character varying(50) NOT NULL,
    content text NOT NULL,
    "order" bigint NOT NULL,
    is_published boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    category_id character(32) NOT NULL
);


ALTER TABLE aimarket_m3rk37tdb.docs_documentationpage OWNER TO aimarket_m3rk37t_user;

--
-- Name: projects_asset; Type: TABLE; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

CREATE TABLE aimarket_m3rk37tdb.projects_asset (
    id character(32) NOT NULL,
    title character varying(255) NOT NULL,
    file_name character varying(255) NOT NULL,
    file_url text NOT NULL,
    file_type character varying(50) NOT NULL,
    mime_type character varying(100) NOT NULL,
    size bigint NOT NULL,
    content text NOT NULL,
    token_count bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    project_id character(32) NOT NULL
);


ALTER TABLE aimarket_m3rk37tdb.projects_asset OWNER TO aimarket_m3rk37t_user;

--
-- Name: projects_assetprocessingjob; Type: TABLE; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

CREATE TABLE aimarket_m3rk37tdb.projects_assetprocessingjob (
    id character(32) NOT NULL,
    status character varying(50) NOT NULL,
    error_message text,
    attempts bigint NOT NULL,
    last_heart_beat timestamp with time zone NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    asset_id character(32) NOT NULL,
    project_id character(32) NOT NULL
);


ALTER TABLE aimarket_m3rk37tdb.projects_assetprocessingjob OWNER TO aimarket_m3rk37t_user;

--
-- Name: projects_generatedcontent; Type: TABLE; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

CREATE TABLE aimarket_m3rk37tdb.projects_generatedcontent (
    id character(32) NOT NULL,
    name character varying(255) NOT NULL,
    result text NOT NULL,
    "order" bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    project_id character(32) NOT NULL
);


ALTER TABLE aimarket_m3rk37tdb.projects_generatedcontent OWNER TO aimarket_m3rk37t_user;

--
-- Name: projects_project; Type: TABLE; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

CREATE TABLE aimarket_m3rk37tdb.projects_project (
    id character(32) NOT NULL,
    title character varying(255) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    user_id bigint NOT NULL,
    keywords text NOT NULL,
    language_preference character varying(10) NOT NULL
);


ALTER TABLE aimarket_m3rk37tdb.projects_project OWNER TO aimarket_m3rk37t_user;

--
-- Name: projects_prompt; Type: TABLE; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

CREATE TABLE aimarket_m3rk37tdb.projects_prompt (
    id character(32) NOT NULL,
    name character varying(255) NOT NULL,
    prompt text,
    token_count bigint NOT NULL,
    "order" bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    project_id character(32) NOT NULL,
    keywords text NOT NULL
);


ALTER TABLE aimarket_m3rk37tdb.projects_prompt OWNER TO aimarket_m3rk37t_user;

--
-- Name: prompt_generator_generatedprompt; Type: TABLE; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

CREATE TABLE aimarket_m3rk37tdb.prompt_generator_generatedprompt (
    id character(32) NOT NULL,
    name character varying(100) NOT NULL,
    prompt_text text NOT NULL,
    parameters_used text NOT NULL,
    token_count bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    user_id bigint NOT NULL,
    template_id character(32) DEFAULT NULL::bpchar
);


ALTER TABLE aimarket_m3rk37tdb.prompt_generator_generatedprompt OWNER TO aimarket_m3rk37t_user;

--
-- Name: prompt_generator_generatorcategory; Type: TABLE; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

CREATE TABLE aimarket_m3rk37tdb.prompt_generator_generatorcategory (
    id character(32) NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    icon character varying(50) NOT NULL,
    is_active boolean NOT NULL,
    "order" bigint NOT NULL
);


ALTER TABLE aimarket_m3rk37tdb.prompt_generator_generatorcategory OWNER TO aimarket_m3rk37t_user;

--
-- Name: prompt_generator_generatorparameter; Type: TABLE; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

CREATE TABLE aimarket_m3rk37tdb.prompt_generator_generatorparameter (
    id character(32) NOT NULL,
    name character varying(50) NOT NULL,
    display_name character varying(100) NOT NULL,
    description text,
    parameter_type character varying(20) NOT NULL,
    options text,
    default_value character varying(200) NOT NULL,
    is_required boolean NOT NULL,
    "order" bigint NOT NULL,
    template_id character(32) NOT NULL
);


ALTER TABLE aimarket_m3rk37tdb.prompt_generator_generatorparameter OWNER TO aimarket_m3rk37t_user;

--
-- Name: prompt_generator_generatortemplate; Type: TABLE; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

CREATE TABLE aimarket_m3rk37tdb.prompt_generator_generatortemplate (
    id character(32) NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    template_text text NOT NULL,
    is_featured boolean NOT NULL,
    is_active boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    category_id character(32) NOT NULL
);


ALTER TABLE aimarket_m3rk37tdb.prompt_generator_generatortemplate OWNER TO aimarket_m3rk37t_user;

--
-- Name: prompts_prompt; Type: TABLE; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

CREATE TABLE aimarket_m3rk37tdb.prompts_prompt (
    id character(32) NOT NULL,
    name character varying(255) NOT NULL,
    prompt text,
    token_count bigint NOT NULL,
    "order" bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    project_id character(32) NOT NULL
);


ALTER TABLE aimarket_m3rk37tdb.prompts_prompt OWNER TO aimarket_m3rk37t_user;

--
-- Name: seo_optimization_keywordtracking; Type: TABLE; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

CREATE TABLE aimarket_m3rk37tdb.seo_optimization_keywordtracking (
    id character(32) NOT NULL,
    keyword character varying(100) NOT NULL,
    relevance_score double precision NOT NULL,
    is_primary boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE aimarket_m3rk37tdb.seo_optimization_keywordtracking OWNER TO aimarket_m3rk37t_user;

--
-- Name: seo_optimization_keywordtracking_projects; Type: TABLE; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

CREATE TABLE aimarket_m3rk37tdb.seo_optimization_keywordtracking_projects (
    id bigint NOT NULL,
    keywordtracking_id character(32) NOT NULL,
    project_id character(32) NOT NULL
);


ALTER TABLE aimarket_m3rk37tdb.seo_optimization_keywordtracking_projects OWNER TO aimarket_m3rk37t_user;

--
-- Name: seo_optimization_keywordtracking_projects_id_seq; Type: SEQUENCE; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

CREATE SEQUENCE aimarket_m3rk37tdb.seo_optimization_keywordtracking_projects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE aimarket_m3rk37tdb.seo_optimization_keywordtracking_projects_id_seq OWNER TO aimarket_m3rk37t_user;

--
-- Name: seo_optimization_keywordtracking_projects_id_seq; Type: SEQUENCE OWNED BY; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

ALTER SEQUENCE aimarket_m3rk37tdb.seo_optimization_keywordtracking_projects_id_seq OWNED BY aimarket_m3rk37tdb.seo_optimization_keywordtracking_projects.id;


--
-- Name: seo_optimization_seoanalysis; Type: TABLE; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

CREATE TABLE aimarket_m3rk37tdb.seo_optimization_seoanalysis (
    id character(32) NOT NULL,
    readability_score double precision NOT NULL,
    keyword_density text NOT NULL,
    suggested_keywords text NOT NULL,
    meta_description text NOT NULL,
    seo_score bigint NOT NULL,
    improvement_suggestions text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    content_id character(32) NOT NULL,
    project_id character(32) NOT NULL
);


ALTER TABLE aimarket_m3rk37tdb.seo_optimization_seoanalysis OWNER TO aimarket_m3rk37t_user;

--
-- Name: subscriptions_subscription; Type: TABLE; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

CREATE TABLE aimarket_m3rk37tdb.subscriptions_subscription (
    id bigint NOT NULL,
    stripe_subscription_id character varying(100) DEFAULT NULL::character varying,
    stripe_customer_id character varying(100) DEFAULT NULL::character varying,
    subscription_type character varying(10) NOT NULL,
    payment_status character varying(20) NOT NULL,
    start_date timestamp with time zone NOT NULL,
    end_date timestamp with time zone,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE aimarket_m3rk37tdb.subscriptions_subscription OWNER TO aimarket_m3rk37t_user;

--
-- Name: subscriptions_subscription_id_seq; Type: SEQUENCE; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

CREATE SEQUENCE aimarket_m3rk37tdb.subscriptions_subscription_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE aimarket_m3rk37tdb.subscriptions_subscription_id_seq OWNER TO aimarket_m3rk37t_user;

--
-- Name: subscriptions_subscription_id_seq; Type: SEQUENCE OWNED BY; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

ALTER SEQUENCE aimarket_m3rk37tdb.subscriptions_subscription_id_seq OWNED BY aimarket_m3rk37tdb.subscriptions_subscription.id;


--
-- Name: subscriptions_userprofile; Type: TABLE; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

CREATE TABLE aimarket_m3rk37tdb.subscriptions_userprofile (
    id bigint NOT NULL,
    signup_date timestamp with time zone NOT NULL,
    user_id bigint NOT NULL,
    trial_ended_email_sent boolean NOT NULL,
    trial_reminder_1_day_sent boolean NOT NULL,
    trial_reminder_3_days_sent boolean NOT NULL
);


ALTER TABLE aimarket_m3rk37tdb.subscriptions_userprofile OWNER TO aimarket_m3rk37t_user;

--
-- Name: subscriptions_userprofile_id_seq; Type: SEQUENCE; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

CREATE SEQUENCE aimarket_m3rk37tdb.subscriptions_userprofile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE aimarket_m3rk37tdb.subscriptions_userprofile_id_seq OWNER TO aimarket_m3rk37t_user;

--
-- Name: subscriptions_userprofile_id_seq; Type: SEQUENCE OWNED BY; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

ALTER SEQUENCE aimarket_m3rk37tdb.subscriptions_userprofile_id_seq OWNED BY aimarket_m3rk37tdb.subscriptions_userprofile.id;


--
-- Name: accounts_memberresource; Type: TABLE; Schema: public; Owner: aimarket_m3rk37t_user
--

CREATE TABLE public.accounts_memberresource (
    id bigint NOT NULL,
    title character varying(100) NOT NULL,
    description text NOT NULL,
    file character varying(100) NOT NULL,
    thumbnail character varying(100) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    is_active boolean NOT NULL
);


ALTER TABLE public.accounts_memberresource OWNER TO aimarket_m3rk37t_user;

--
-- Name: accounts_memberresource_id_seq; Type: SEQUENCE; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE public.accounts_memberresource ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.accounts_memberresource_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: accounts_profile; Type: TABLE; Schema: public; Owner: aimarket_m3rk37t_user
--

CREATE TABLE public.accounts_profile (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    user_id integer NOT NULL,
    bio text
);


ALTER TABLE public.accounts_profile OWNER TO aimarket_m3rk37t_user;

--
-- Name: accounts_profile_id_seq; Type: SEQUENCE; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE public.accounts_profile ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.accounts_profile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: accounts_stripecustomer; Type: TABLE; Schema: public; Owner: aimarket_m3rk37t_user
--

CREATE TABLE public.accounts_stripecustomer (
    id uuid NOT NULL,
    stripe_customer_id character varying(100) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.accounts_stripecustomer OWNER TO aimarket_m3rk37t_user;

--
-- Name: accounts_subscription; Type: TABLE; Schema: public; Owner: aimarket_m3rk37t_user
--

CREATE TABLE public.accounts_subscription (
    id uuid NOT NULL,
    stripe_subscription_id character varying(100) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.accounts_subscription OWNER TO aimarket_m3rk37t_user;

--
-- Name: accounts_tokenusage; Type: TABLE; Schema: public; Owner: aimarket_m3rk37t_user
--

CREATE TABLE public.accounts_tokenusage (
    id bigint NOT NULL,
    prompt_tokens_used integer NOT NULL,
    asset_tokens_used integer NOT NULL,
    last_reset_date timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.accounts_tokenusage OWNER TO aimarket_m3rk37t_user;

--
-- Name: accounts_tokenusage_id_seq; Type: SEQUENCE; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE public.accounts_tokenusage ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.accounts_tokenusage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: assets_asset; Type: TABLE; Schema: public; Owner: aimarket_m3rk37t_user
--

CREATE TABLE public.assets_asset (
    id uuid NOT NULL,
    title character varying(255) NOT NULL,
    file_name character varying(255) NOT NULL,
    file_url character varying(1000) NOT NULL,
    file_type character varying(50) NOT NULL,
    mime_type character varying(100) NOT NULL,
    size bigint NOT NULL,
    content text NOT NULL,
    token_count integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    project_id uuid NOT NULL
);


ALTER TABLE public.assets_asset OWNER TO aimarket_m3rk37t_user;

--
-- Name: assets_assetprocessingjob; Type: TABLE; Schema: public; Owner: aimarket_m3rk37t_user
--

CREATE TABLE public.assets_assetprocessingjob (
    id uuid NOT NULL,
    status character varying(50) NOT NULL,
    error_message text,
    attempts integer NOT NULL,
    last_heart_beat timestamp with time zone NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    asset_id uuid NOT NULL,
    project_id uuid NOT NULL
);


ALTER TABLE public.assets_assetprocessingjob OWNER TO aimarket_m3rk37t_user;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: aimarket_m3rk37t_user
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO aimarket_m3rk37t_user;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE public.auth_group ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: aimarket_m3rk37t_user
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO aimarket_m3rk37t_user;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE public.auth_group_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: aimarket_m3rk37t_user
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO aimarket_m3rk37t_user;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE public.auth_permission ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: aimarket_m3rk37t_user
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO aimarket_m3rk37t_user;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: aimarket_m3rk37t_user
--

CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO aimarket_m3rk37t_user;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE public.auth_user_groups ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE public.auth_user ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: aimarket_m3rk37t_user
--

CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO aimarket_m3rk37t_user;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE public.auth_user_user_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: blog_category; Type: TABLE; Schema: public; Owner: aimarket_m3rk37t_user
--

CREATE TABLE public.blog_category (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(50) NOT NULL
);


ALTER TABLE public.blog_category OWNER TO aimarket_m3rk37t_user;

--
-- Name: blog_category_id_seq; Type: SEQUENCE; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE public.blog_category ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.blog_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: blog_post; Type: TABLE; Schema: public; Owner: aimarket_m3rk37t_user
--

CREATE TABLE public.blog_post (
    id bigint NOT NULL,
    title character varying(200) NOT NULL,
    slug character varying(50) NOT NULL,
    status character varying(10) NOT NULL,
    featured boolean NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    publish_date timestamp with time zone,
    content text NOT NULL,
    image character varying(100),
    external_image_url character varying(500),
    youtube_url character varying(200),
    thumbnail character varying(100),
    ad_type character varying(10) NOT NULL,
    ad_code text NOT NULL,
    ad_image character varying(100),
    ad_url character varying(200) NOT NULL,
    meta_title character varying(60) NOT NULL,
    meta_description character varying(160) NOT NULL,
    meta_keywords character varying(255) NOT NULL,
    category_id bigint NOT NULL
);


ALTER TABLE public.blog_post OWNER TO aimarket_m3rk37t_user;

--
-- Name: blog_post_id_seq; Type: SEQUENCE; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE public.blog_post ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.blog_post_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: content_generation_aiconfig; Type: TABLE; Schema: public; Owner: aimarket_m3rk37t_user
--

CREATE TABLE public.content_generation_aiconfig (
    id uuid NOT NULL,
    name character varying(100) NOT NULL,
    model_name character varying(100) NOT NULL,
    fallback_model character varying(100) NOT NULL,
    temperature double precision NOT NULL,
    max_tokens integer NOT NULL,
    is_active boolean NOT NULL
);


ALTER TABLE public.content_generation_aiconfig OWNER TO aimarket_m3rk37t_user;

--
-- Name: content_generation_contentgenerationjob; Type: TABLE; Schema: public; Owner: aimarket_m3rk37t_user
--

CREATE TABLE public.content_generation_contentgenerationjob (
    id uuid NOT NULL,
    status character varying(20) NOT NULL,
    started_at timestamp with time zone NOT NULL,
    completed_at timestamp with time zone,
    prompts_total integer NOT NULL,
    prompts_completed integer NOT NULL,
    error_message text,
    project_id uuid NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.content_generation_contentgenerationjob OWNER TO aimarket_m3rk37t_user;

--
-- Name: content_generation_prompttemplate; Type: TABLE; Schema: public; Owner: aimarket_m3rk37t_user
--

CREATE TABLE public.content_generation_prompttemplate (
    id uuid NOT NULL,
    name character varying(100) NOT NULL,
    content_type character varying(20) NOT NULL,
    system_prompt text NOT NULL,
    description text,
    is_active boolean NOT NULL,
    is_default boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    user_id integer
);


ALTER TABLE public.content_generation_prompttemplate OWNER TO aimarket_m3rk37t_user;

--
-- Name: content_templates_template; Type: TABLE; Schema: public; Owner: aimarket_m3rk37t_user
--

CREATE TABLE public.content_templates_template (
    id uuid NOT NULL,
    title character varying(255) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    user_id integer NOT NULL,
    keywords text NOT NULL,
    description text
);


ALTER TABLE public.content_templates_template OWNER TO aimarket_m3rk37t_user;

--
-- Name: content_templates_templateprompt; Type: TABLE; Schema: public; Owner: aimarket_m3rk37t_user
--

CREATE TABLE public.content_templates_templateprompt (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    prompt text,
    token_count integer NOT NULL,
    "order" integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    template_id uuid NOT NULL
);


ALTER TABLE public.content_templates_templateprompt OWNER TO aimarket_m3rk37t_user;

--
-- Name: core_contactmessage; Type: TABLE; Schema: public; Owner: aimarket_m3rk37t_user
--

CREATE TABLE public.core_contactmessage (
    id bigint NOT NULL,
    first_name character varying(100),
    subject character varying(50) NOT NULL,
    message text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    is_read boolean NOT NULL,
    status character varying(20) NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.core_contactmessage OWNER TO aimarket_m3rk37t_user;

--
-- Name: core_contactmessage_id_seq; Type: SEQUENCE; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE public.core_contactmessage ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.core_contactmessage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: core_tag; Type: TABLE; Schema: public; Owner: aimarket_m3rk37t_user
--

CREATE TABLE public.core_tag (
    id uuid NOT NULL,
    name character varying(50) NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.core_tag OWNER TO aimarket_m3rk37t_user;

--
-- Name: core_taggeditem; Type: TABLE; Schema: public; Owner: aimarket_m3rk37t_user
--

CREATE TABLE public.core_taggeditem (
    id uuid NOT NULL,
    object_id uuid NOT NULL,
    content_type_id integer NOT NULL,
    tag_id uuid NOT NULL
);


ALTER TABLE public.core_taggeditem OWNER TO aimarket_m3rk37t_user;

--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: aimarket_m3rk37t_user
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO aimarket_m3rk37t_user;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE public.django_admin_log ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_celery_results_chordcounter; Type: TABLE; Schema: public; Owner: aimarket_m3rk37t_user
--

CREATE TABLE public.django_celery_results_chordcounter (
    id integer NOT NULL,
    group_id character varying(255) NOT NULL,
    sub_tasks text NOT NULL,
    count integer NOT NULL,
    CONSTRAINT django_celery_results_chordcounter_count_check CHECK ((count >= 0))
);


ALTER TABLE public.django_celery_results_chordcounter OWNER TO aimarket_m3rk37t_user;

--
-- Name: django_celery_results_chordcounter_id_seq; Type: SEQUENCE; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE public.django_celery_results_chordcounter ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_celery_results_chordcounter_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_celery_results_groupresult; Type: TABLE; Schema: public; Owner: aimarket_m3rk37t_user
--

CREATE TABLE public.django_celery_results_groupresult (
    id integer NOT NULL,
    group_id character varying(255) NOT NULL,
    date_created timestamp with time zone NOT NULL,
    date_done timestamp with time zone NOT NULL,
    content_type character varying(128) NOT NULL,
    content_encoding character varying(64) NOT NULL,
    result text
);


ALTER TABLE public.django_celery_results_groupresult OWNER TO aimarket_m3rk37t_user;

--
-- Name: django_celery_results_groupresult_id_seq; Type: SEQUENCE; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE public.django_celery_results_groupresult ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_celery_results_groupresult_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_celery_results_taskresult; Type: TABLE; Schema: public; Owner: aimarket_m3rk37t_user
--

CREATE TABLE public.django_celery_results_taskresult (
    id integer NOT NULL,
    task_id character varying(255) NOT NULL,
    status character varying(50) NOT NULL,
    content_type character varying(128) NOT NULL,
    content_encoding character varying(64) NOT NULL,
    result text,
    date_done timestamp with time zone NOT NULL,
    traceback text,
    meta text,
    task_args text,
    task_kwargs text,
    task_name character varying(255),
    worker character varying(100),
    date_created timestamp with time zone NOT NULL,
    periodic_task_name character varying(255),
    date_started timestamp with time zone
);


ALTER TABLE public.django_celery_results_taskresult OWNER TO aimarket_m3rk37t_user;

--
-- Name: django_celery_results_taskresult_id_seq; Type: SEQUENCE; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE public.django_celery_results_taskresult ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_celery_results_taskresult_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: aimarket_m3rk37t_user
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO aimarket_m3rk37t_user;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE public.django_content_type ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: aimarket_m3rk37t_user
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO aimarket_m3rk37t_user;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE public.django_migrations ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: aimarket_m3rk37t_user
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO aimarket_m3rk37t_user;

--
-- Name: docs_documentationcategory; Type: TABLE; Schema: public; Owner: aimarket_m3rk37t_user
--

CREATE TABLE public.docs_documentationcategory (
    id uuid NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(50) NOT NULL,
    description text,
    "order" integer NOT NULL
);


ALTER TABLE public.docs_documentationcategory OWNER TO aimarket_m3rk37t_user;

--
-- Name: docs_documentationpage; Type: TABLE; Schema: public; Owner: aimarket_m3rk37t_user
--

CREATE TABLE public.docs_documentationpage (
    id uuid NOT NULL,
    title character varying(200) NOT NULL,
    slug character varying(50) NOT NULL,
    content text NOT NULL,
    "order" integer NOT NULL,
    is_published boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    category_id uuid NOT NULL
);


ALTER TABLE public.docs_documentationpage OWNER TO aimarket_m3rk37t_user;

--
-- Name: projects_asset; Type: TABLE; Schema: public; Owner: aimarket_m3rk37t_user
--

CREATE TABLE public.projects_asset (
    id uuid NOT NULL,
    title character varying(255) NOT NULL,
    file_name character varying(255) NOT NULL,
    file_url text NOT NULL,
    file_type character varying(50) NOT NULL,
    mime_type character varying(100) NOT NULL,
    size bigint NOT NULL,
    content text NOT NULL,
    token_count integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    project_id uuid NOT NULL
);


ALTER TABLE public.projects_asset OWNER TO aimarket_m3rk37t_user;

--
-- Name: projects_assetprocessingjob; Type: TABLE; Schema: public; Owner: aimarket_m3rk37t_user
--

CREATE TABLE public.projects_assetprocessingjob (
    id uuid NOT NULL,
    status character varying(50) NOT NULL,
    error_message text,
    attempts integer NOT NULL,
    last_heart_beat timestamp with time zone NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    asset_id uuid NOT NULL,
    project_id uuid NOT NULL
);


ALTER TABLE public.projects_assetprocessingjob OWNER TO aimarket_m3rk37t_user;

--
-- Name: projects_generatedcontent; Type: TABLE; Schema: public; Owner: aimarket_m3rk37t_user
--

CREATE TABLE public.projects_generatedcontent (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    result text NOT NULL,
    "order" integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    project_id uuid NOT NULL
);


ALTER TABLE public.projects_generatedcontent OWNER TO aimarket_m3rk37t_user;

--
-- Name: projects_project; Type: TABLE; Schema: public; Owner: aimarket_m3rk37t_user
--

CREATE TABLE public.projects_project (
    id uuid NOT NULL,
    title character varying(255) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    user_id integer NOT NULL,
    keywords text NOT NULL,
    language_preference character varying(10) NOT NULL
);


ALTER TABLE public.projects_project OWNER TO aimarket_m3rk37t_user;

--
-- Name: projects_prompt; Type: TABLE; Schema: public; Owner: aimarket_m3rk37t_user
--

CREATE TABLE public.projects_prompt (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    prompt text,
    token_count integer NOT NULL,
    "order" integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    project_id uuid NOT NULL,
    keywords text NOT NULL
);


ALTER TABLE public.projects_prompt OWNER TO aimarket_m3rk37t_user;

--
-- Name: prompt_generator_generatedprompt; Type: TABLE; Schema: public; Owner: aimarket_m3rk37t_user
--

CREATE TABLE public.prompt_generator_generatedprompt (
    id uuid NOT NULL,
    name character varying(100) NOT NULL,
    prompt_text text NOT NULL,
    parameters_used jsonb NOT NULL,
    token_count integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    user_id integer NOT NULL,
    template_id uuid
);


ALTER TABLE public.prompt_generator_generatedprompt OWNER TO aimarket_m3rk37t_user;

--
-- Name: prompt_generator_generatorcategory; Type: TABLE; Schema: public; Owner: aimarket_m3rk37t_user
--

CREATE TABLE public.prompt_generator_generatorcategory (
    id uuid NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    icon character varying(50) NOT NULL,
    is_active boolean NOT NULL,
    "order" integer NOT NULL
);


ALTER TABLE public.prompt_generator_generatorcategory OWNER TO aimarket_m3rk37t_user;

--
-- Name: prompt_generator_generatorparameter; Type: TABLE; Schema: public; Owner: aimarket_m3rk37t_user
--

CREATE TABLE public.prompt_generator_generatorparameter (
    id uuid NOT NULL,
    name character varying(50) NOT NULL,
    display_name character varying(100) NOT NULL,
    description text,
    parameter_type character varying(20) NOT NULL,
    options text,
    default_value character varying(200) NOT NULL,
    is_required boolean NOT NULL,
    "order" integer NOT NULL,
    template_id uuid NOT NULL
);


ALTER TABLE public.prompt_generator_generatorparameter OWNER TO aimarket_m3rk37t_user;

--
-- Name: prompt_generator_generatortemplate; Type: TABLE; Schema: public; Owner: aimarket_m3rk37t_user
--

CREATE TABLE public.prompt_generator_generatortemplate (
    id uuid NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    template_text text NOT NULL,
    is_featured boolean NOT NULL,
    is_active boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    category_id uuid NOT NULL
);


ALTER TABLE public.prompt_generator_generatortemplate OWNER TO aimarket_m3rk37t_user;

--
-- Name: prompts_prompt; Type: TABLE; Schema: public; Owner: aimarket_m3rk37t_user
--

CREATE TABLE public.prompts_prompt (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    prompt text,
    token_count integer NOT NULL,
    "order" integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    project_id uuid NOT NULL
);


ALTER TABLE public.prompts_prompt OWNER TO aimarket_m3rk37t_user;

--
-- Name: seo_optimization_keywordtracking; Type: TABLE; Schema: public; Owner: aimarket_m3rk37t_user
--

CREATE TABLE public.seo_optimization_keywordtracking (
    id uuid NOT NULL,
    keyword character varying(100) NOT NULL,
    relevance_score double precision NOT NULL,
    is_primary boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.seo_optimization_keywordtracking OWNER TO aimarket_m3rk37t_user;

--
-- Name: seo_optimization_keywordtracking_projects; Type: TABLE; Schema: public; Owner: aimarket_m3rk37t_user
--

CREATE TABLE public.seo_optimization_keywordtracking_projects (
    id bigint NOT NULL,
    keywordtracking_id uuid NOT NULL,
    project_id uuid NOT NULL
);


ALTER TABLE public.seo_optimization_keywordtracking_projects OWNER TO aimarket_m3rk37t_user;

--
-- Name: seo_optimization_keywordtracking_projects_id_seq; Type: SEQUENCE; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE public.seo_optimization_keywordtracking_projects ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.seo_optimization_keywordtracking_projects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: seo_optimization_seoanalysis; Type: TABLE; Schema: public; Owner: aimarket_m3rk37t_user
--

CREATE TABLE public.seo_optimization_seoanalysis (
    id uuid NOT NULL,
    readability_score double precision NOT NULL,
    keyword_density jsonb NOT NULL,
    suggested_keywords jsonb NOT NULL,
    meta_description text NOT NULL,
    seo_score integer NOT NULL,
    improvement_suggestions jsonb NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    content_id uuid NOT NULL,
    project_id uuid NOT NULL
);


ALTER TABLE public.seo_optimization_seoanalysis OWNER TO aimarket_m3rk37t_user;

--
-- Name: subscriptions_subscription; Type: TABLE; Schema: public; Owner: aimarket_m3rk37t_user
--

CREATE TABLE public.subscriptions_subscription (
    id bigint NOT NULL,
    stripe_subscription_id character varying(100),
    stripe_customer_id character varying(100),
    subscription_type character varying(10) NOT NULL,
    payment_status character varying(20) NOT NULL,
    start_date timestamp with time zone NOT NULL,
    end_date timestamp with time zone,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.subscriptions_subscription OWNER TO aimarket_m3rk37t_user;

--
-- Name: subscriptions_subscription_id_seq; Type: SEQUENCE; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE public.subscriptions_subscription ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.subscriptions_subscription_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: subscriptions_userprofile; Type: TABLE; Schema: public; Owner: aimarket_m3rk37t_user
--

CREATE TABLE public.subscriptions_userprofile (
    id bigint NOT NULL,
    signup_date timestamp with time zone NOT NULL,
    user_id integer NOT NULL,
    trial_ended_email_sent boolean NOT NULL,
    trial_reminder_1_day_sent boolean NOT NULL,
    trial_reminder_3_days_sent boolean NOT NULL
);


ALTER TABLE public.subscriptions_userprofile OWNER TO aimarket_m3rk37t_user;

--
-- Name: subscriptions_userprofile_id_seq; Type: SEQUENCE; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE public.subscriptions_userprofile ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.subscriptions_userprofile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: accounts_memberresource id; Type: DEFAULT; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY aimarket_m3rk37tdb.accounts_memberresource ALTER COLUMN id SET DEFAULT nextval('aimarket_m3rk37tdb.accounts_memberresource_id_seq'::regclass);


--
-- Name: accounts_profile id; Type: DEFAULT; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY aimarket_m3rk37tdb.accounts_profile ALTER COLUMN id SET DEFAULT nextval('aimarket_m3rk37tdb.accounts_profile_id_seq'::regclass);


--
-- Name: accounts_tokenusage id; Type: DEFAULT; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY aimarket_m3rk37tdb.accounts_tokenusage ALTER COLUMN id SET DEFAULT nextval('aimarket_m3rk37tdb.accounts_tokenusage_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY aimarket_m3rk37tdb.auth_group ALTER COLUMN id SET DEFAULT nextval('aimarket_m3rk37tdb.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY aimarket_m3rk37tdb.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('aimarket_m3rk37tdb.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY aimarket_m3rk37tdb.auth_permission ALTER COLUMN id SET DEFAULT nextval('aimarket_m3rk37tdb.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY aimarket_m3rk37tdb.auth_user ALTER COLUMN id SET DEFAULT nextval('aimarket_m3rk37tdb.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY aimarket_m3rk37tdb.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('aimarket_m3rk37tdb.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY aimarket_m3rk37tdb.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('aimarket_m3rk37tdb.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: blog_category id; Type: DEFAULT; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY aimarket_m3rk37tdb.blog_category ALTER COLUMN id SET DEFAULT nextval('aimarket_m3rk37tdb.blog_category_id_seq'::regclass);


--
-- Name: blog_post id; Type: DEFAULT; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY aimarket_m3rk37tdb.blog_post ALTER COLUMN id SET DEFAULT nextval('aimarket_m3rk37tdb.blog_post_id_seq'::regclass);


--
-- Name: core_contactmessage id; Type: DEFAULT; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY aimarket_m3rk37tdb.core_contactmessage ALTER COLUMN id SET DEFAULT nextval('aimarket_m3rk37tdb.core_contactmessage_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY aimarket_m3rk37tdb.django_admin_log ALTER COLUMN id SET DEFAULT nextval('aimarket_m3rk37tdb.django_admin_log_id_seq'::regclass);


--
-- Name: django_celery_results_chordcounter id; Type: DEFAULT; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY aimarket_m3rk37tdb.django_celery_results_chordcounter ALTER COLUMN id SET DEFAULT nextval('aimarket_m3rk37tdb.django_celery_results_chordcounter_id_seq'::regclass);


--
-- Name: django_celery_results_groupresult id; Type: DEFAULT; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY aimarket_m3rk37tdb.django_celery_results_groupresult ALTER COLUMN id SET DEFAULT nextval('aimarket_m3rk37tdb.django_celery_results_groupresult_id_seq'::regclass);


--
-- Name: django_celery_results_taskresult id; Type: DEFAULT; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY aimarket_m3rk37tdb.django_celery_results_taskresult ALTER COLUMN id SET DEFAULT nextval('aimarket_m3rk37tdb.django_celery_results_taskresult_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY aimarket_m3rk37tdb.django_content_type ALTER COLUMN id SET DEFAULT nextval('aimarket_m3rk37tdb.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY aimarket_m3rk37tdb.django_migrations ALTER COLUMN id SET DEFAULT nextval('aimarket_m3rk37tdb.django_migrations_id_seq'::regclass);


--
-- Name: seo_optimization_keywordtracking_projects id; Type: DEFAULT; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY aimarket_m3rk37tdb.seo_optimization_keywordtracking_projects ALTER COLUMN id SET DEFAULT nextval('aimarket_m3rk37tdb.seo_optimization_keywordtracking_projects_id_seq'::regclass);


--
-- Name: subscriptions_subscription id; Type: DEFAULT; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY aimarket_m3rk37tdb.subscriptions_subscription ALTER COLUMN id SET DEFAULT nextval('aimarket_m3rk37tdb.subscriptions_subscription_id_seq'::regclass);


--
-- Name: subscriptions_userprofile id; Type: DEFAULT; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY aimarket_m3rk37tdb.subscriptions_userprofile ALTER COLUMN id SET DEFAULT nextval('aimarket_m3rk37tdb.subscriptions_userprofile_id_seq'::regclass);


--
-- Data for Name: accounts_memberresource; Type: TABLE DATA; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

COPY aimarket_m3rk37tdb.accounts_memberresource (id, title, description, file, thumbnail, created_at, is_active) FROM stdin;
1	Testing Downlaod	this is a test to ensure it appears where it should	member_resources/blogwriting_1.pdf	member_resources/thumbnails/pexels-picturemechaniq-1749303.jpg	2025-04-24 06:31:14.486834+00	t
\.


--
-- Data for Name: accounts_profile; Type: TABLE DATA; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

COPY aimarket_m3rk37tdb.accounts_profile (id, created_at, updated_at, user_id, bio) FROM stdin;
1	2025-04-21 10:57:33.473109+00	2025-04-24 07:27:34.685184+00	2	
2	2025-04-21 16:32:18.534275+00	2025-04-24 15:48:59.473549+00	3	I run the Show Your Spot social network
3	2025-04-24 14:05:07.673773+00	2025-04-24 14:05:07.673857+00	1	
\.


--
-- Data for Name: accounts_stripecustomer; Type: TABLE DATA; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

COPY aimarket_m3rk37tdb.accounts_stripecustomer (id, stripe_customer_id, created_at, user_id) FROM stdin;
\.


--
-- Data for Name: accounts_subscription; Type: TABLE DATA; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

COPY aimarket_m3rk37tdb.accounts_subscription (id, stripe_subscription_id, created_at, user_id) FROM stdin;
\.


--
-- Data for Name: accounts_tokenusage; Type: TABLE DATA; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

COPY aimarket_m3rk37tdb.accounts_tokenusage (id, prompt_tokens_used, asset_tokens_used, last_reset_date, user_id) FROM stdin;
1	0	0	2025-04-22 23:08:57.319475+00	1
2	317	31720	2025-04-22 23:08:57.342385+00	2
3	113	2914	2025-04-22 23:08:57.358926+00	3
\.


--
-- Data for Name: assets_asset; Type: TABLE DATA; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

COPY aimarket_m3rk37tdb.assets_asset (id, title, file_name, file_url, file_type, mime_type, size, content, token_count, created_at, updated_at, project_id) FROM stdin;
20c4254423fc4bdfb4067c3d083dbd09	AI Marketing Platform alternative uses not just social media.pdf	6f38c34a-761c-44d9-99dd-7b900ca6aa28/e67fb769-839f-400f-a8b5-08832b35eaad_AI Marketing Platform alternative uses not just social media.pdf	/media/6f38c34a-761c-44d9-99dd-7b900ca6aa28/e67fb769-839f-400f-a8b5-08832b35eaad_AI Marketing Platform alternative uses not just social media.pdf	pdf	application/pdf	254006	AI\n \nMarketing\n \nPlatform\n \nalternative\n \nuses\n \nnot\n \njust\n \nsocial\n \nmedia\n \nI'd\n \nbe\n \nhappy\n \nto\n \nbrainstorm\n \nsome\n \nnon-traditional\n \nmarketing\n \napplications\n \nfor\n \nyour\n \nAI\n \nMarketing\n \nPlatform.\n \nBefore\n \ndiving\n \ninto\n \nideas,\n \nI\n \nunderstand\n \nyou\n \nwant\n \nto\n \nexplore\n \nuses\n \nbeyond\n \ntypical\n \nsocial\n \nmedia\n \ncontent\n \ngeneration,\n \nespecially\n \naround\n \ncustomer\n \nfeedback\n \nand\n \nreviews.\n \nYour\n \nplatform\n \nhas\n \nseveral\n \nkey\n \ncapabilities\n \nthat\n \nmake\n \nit\n \nversatile:\n \n1.\n \nIt\n \ncan\n \nprocess\n \nvarious\n \nfile\n \ntypes\n \n(text,\n \nPDF,\n \naudio,\n \nvideo)\n \n2.\n \nIt\n \nallows\n \ncustom\n \nprompts\n \n3.\n \nIt\n \ngenerates\n \ncontent\n \nbased\n \non\n \nuploaded\n \nassets\n \n4.\n \nIt's\n \norganized\n \nby\n \nprojects\n \nand\n \ntemplates\n \nHere\n \nare\n \nsome\n \ninnovative\n \nmarketing\n \napplications\n \nthat\n \ngo\n \nbeyond\n \nsocial\n \nmedia\n \nposts:\n \nCustomer\n \nFeedback\n \n&\n \nReviews\n \nApplications\n \n1.\n \nVoice\n \nof\n \nCustomer\n \n(VOC)\n \nContent\n \nCreation\n \n \n \n \nUpload\n \ncustomer\n \nsurvey\n \nresponses,\n \nreviews,\n \nor\n \nfeedback\n \n \n \nGenerate\n \nexecutive\n \nsummaries\n \nhighlighting\n \nrecurring\n \nthemes\n \n \n \nCreate\n \ndata-driven\n \nmarketing\n \nclaims\n \nbased\n \non\n \nactual\n \ncustomer\n \nlanguage\n \n2.\n \nReview\n \nResponse\n \nGenerator\n \n \n \n \nFeed\n \nin\n \ncustomer\n \nreviews\n \n(positive\n \nand\n \nnegative)\n \n \n \nGenerate\n \npersonalized\n \nresponse\n \ntemplates\n \nthat\n \naddress\n \nspecific\n \nconcerns\n \n \n \nCreate\n \ntiered\n \nresponse\n \nstrategies\n \n(for\n \n1-star\n \nvs\n \n5-star\n \nreviews)\n \n3.\n \nCustomer\n \nTestimonial\n \nTransformer\n \n \n \n \nTransform\n \nlengthy\n \ncustomer\n \nfeedback\n \ninto\n \nconcise\n \ntestimonials\n \n \n \nGenerate\n \npermission\n \nrequest\n \nemails\n \nto\n \nuse\n \nthese\n \ntestimonials\n \n \n \nCreate\n \ndifferent\n \ntestimonial\n \nformats\n \nfor\n \nvarious\n \nplatforms\n \n(website,\n \ncase\n \nstudies,\n \npitch\n \ndecks)\n \n4.\n \nProduct\n \nDevelopment\n \nInsights\n \n \n \n \nAnalyze\n \ncustomer\n \nfeature\n \nrequests\n \nand\n \nfeedback\n \n \n \nGenerate\n \nprioritized\n \nproduct\n \nroadmap\n \nsuggestions\n \n \n \nCreate\n \ncommunications\n \nexplaining\n \nhow\n \ncustomer\n \nfeedback\n \ninfluenced\n \nproduct\n \ndecisions\n \nOther\n \nNon-Traditional\n \nMarketing\n \nApplications\n \n5.\n \nEvent\n \n&\n \nWebinar\n \nContent\n \nSuite\n \n  \n \nUpload\n \nwebinar\n \ntranscripts\n \nor\n \nevent\n \nrecordings\n \n \n \nGenerate\n \nmulti-format\n \ncontent:\n \nfollow-up\n \nemails,\n \nblog\n \nrecaps,\n \nsocial\n \nhighlights,\n \nspeaker\n \nthank-you\n \nnotes\n \n6.\n \nCrisis\n \nCommunication\n \nToolkit\n \n \n \n \nUpload\n \nnews\n \narticles\n \nabout\n \ncompany/industry\n \nissues\n \n \n \nGenerate\n \ntiered\n \nresponse\n \nstatements\n \nfor\n \ndifferent\n \nstakeholders\n \n \n \nCreate\n \nFAQ\n \ndocuments\n \nand\n \ninternal\n \ntalking\n \npoints\n \n7.\n \nSales\n \nEnablement\n \nContent\n \n \n \n \nUpload\n \ncustomer\n \ncalls,\n \ndemos,\n \nor\n \nsales\n \nmeetings\n \n \n \nGenerate\n \nobjection\n \nhandling\n \nscripts\n \nbased\n \non\n \nreal\n \nconversations\n \n \n \nCreate\n \npersonalized\n \nfollow-up\n \nemails\n \nbased\n \non\n \nspecific\n \nprospect\n \nconcerns\n \n8.\n \nCompetitive\n \nIntelligence\n \nDigests\n \n \n \n \nUpload\n \ncompetitor\n \npress\n \nreleases,\n \nmarketing\n \nmaterials,\n \nor\n \nproduct\n \ndescriptions\n \n \n \nGenerate\n \ncompetitive\n \nanalysis\n \nsummaries\n \n \n \nCreate\n \nsales\n \nbattle\n \ncards\n \nhighlighting\n \nyour\n \nadvantages\n \n9.\n \nInternal\n \nCommunications\n \nEnhancement\n \n \n \n \nTransform\n \ntechnical\n \nor\n \ncomplex\n \nannouncements\n \ninto\n \nemployee-friendly\n \ncommunications\n \n \n \nGenerate\n \ndepartment-specific\n \nversions\n \nof\n \ncompany\n \nupdates\n \n \n \nCreate\n \nengaging\n \ninternal\n \nnewsletter\n \ncontent\n \n10.\n \nLocalization\n \n&\n \nMarket\n \nAdaptation\n \n \n \n \nUpload\n \ncore\n \nmarketing\n \nmaterials\n \n \n \nGenerate\n \nculturally-adapted\n \nversions\n \nfor\n \ndifferent\n \nmarkets\n \n \n \nCreate\n \nregion-specific\n \nreferences\n \nand\n \nexamples\n \n11.\n \nInvestor\n \nRelations\n \nContent\n \n \n \n \nTransform\n \nfinancial\n \ndata\n \nand\n \ncompany\n \nupdates\n \ninto\n \ninvestor-ready\n \ncommunications\n \n \n \nGenerate\n \nearnings\n \ncall\n \npreparation\n \nmaterials\n \n \n \nCreate\n \nshareholder\n \nupdate\n \nletters\n \nand\n \npresentations\n \n12.\n \nRecruitment\n \nMarketing\n \n \n \n \nUpload\n \njob\n \ndescriptions\n \nand\n \ncompany\n \nvalues\n \n \n \nGenerate\n \nvaried\n \njob\n \npostings\n \nfor\n \ndifferent\n \nplatforms\n \n \n \nCreate\n \ncandidate\n \noutreach\n \nmessages\n \nand\n \nfollow-up\n \nsequences\n \nWould\n \nyou\n \nlike\n \nme\n \nto\n \nelaborate\n \non\n \nany\n \nof\n \nthese\n \nspecific\n \napplications?\n \nOr\n \nwould\n \nyou\n \nlike\n \nme\n \nto\n \nexplore\n \na\n \nparticular\n \ndirection\n \nfurther?\n \n  \nAbsolutely!\n \nHeres\n \na\n \nuser-focused\n \nexplanation\n \nof\n \nhow\n \nyou\n \ncan\n \nuse\n \nthe\n \nsite\n \nfor\n \neach\n \napplication:\n \nCustomer\n \nFeedback\n \n&\n \nReviews\n \nApplications\n \nVoice\n \nof\n \nCustomer\n \n(VOC)\n \nContent\n \nCreation\n \nWith\n \nthis\n \nsite,\n \nyou\n \ncan\n \neasily\n \nupload\n \nyour\n \ncustomer\n \nsurvey\n \nresponses,\n \nreviews,\n \nor\n \nfeedback.\n \nThe\n \nplatform\n \nwill\n \nanalyze\n \nall\n \nthe\n \ninput\n \nand\n \ngenerate\n \nexecutive\n \nsummaries\n \nfor\n \nyou,\n \nhighlighting\n \nthe\n \nrecurring\n \nthemes\n \nand\n \nsentiments\n \nthat\n \nmatter\n \nmost.\n \nThis\n \nmakes\n \nit\n \nsimple\n \nto\n \nspot\n \nwhat\n \nyour\n \ncustomers\n \nloveand\n \nwhat\n \nthey\n \nwant\n \nimproved.\n \nPlus,\n \nyou\n \ncan\n \nturn\n \nreal\n \ncustomer\n \nlanguage\n \ninto\n \npowerful,\n \ndata-driven\n \nmarketing\n \nclaims,\n \nhelping\n \nyou\n \ncraft\n \nmessaging\n \nthat\n \ntruly\n \nresonates\n \nbecause\n \nits\n \nbased\n \non\n \nwhat\n \nyour\n \naudience\n \nis\n \nactually\n \nsaying.\n \nReview\n \nResponse\n \nGenerator\n \nManaging\n \nreviews\n \ncan\n \nbe\n \noverwhelming,\n \nbut\n \nthis\n \ntool\n \nstreamlines\n \nthe\n \nprocess.\n \nSimply\n \nfeed\n \nin\n \nyour\n \npositive\n \nand\n \nnegative\n \ncustomer\n \nreviews,\n \nand\n \nthe\n \nsite\n \nwill\n \ngenerate\n \npersonalized\n \nresponse\n \ntemplates\n \ntailored\n \nto\n \neach\n \nsituation.\n \nWhether\n \nyoure\n \ndealing\n \nwith\n \na\n \n1-star\n \ncomplaint\n \nor\n \na\n \nglowing\n \n5-star\n \nreview,\n \nyoull\n \nget\n \ntiered\n \nresponse\n \nstrategies\n \nto\n \naddress\n \neach\n \nappropriately.\n \nThis\n \nhelps\n \nyou\n \nmaintain\n \na\n \nprofessional,\n \nempathetic,\n \nand\n \nconsistent\n \nvoice\n \nacross\n \nall\n \nyour\n \nreview\n \nplatformssaving\n \nyou\n \ntime\n \nand\n \nprotecting\n \nyour\n \nbrand\n \nreputation.\n \nCustomer\n \nTestimonial\n \nTransformer\n \nIf\n \nyou\n \nhave\n \nlong,\n \ndetailed\n \ncustomer\n \nfeedback,\n \nyou\n \ncan\n \nuse\n \nthis\n \nfeature\n \nto\n \ntransform\n \nit\n \ninto\n \nconcise,\n \nimpactful\n \ntestimonials\n \nperfect\n \nfor\n \nyour\n \nwebsite,\n \ncase\n \nstudies,\n \nor\n \npitch\n \ndecks.\n \nThe\n \nsite\n \nalso\n \nhelps\n \nyou\n \ndraft\n \npermission\n \nrequest\n \nemails,\n \nmaking\n \nit\n \neasy\n \nto\n \nsecure\n \nconsent\n \nbefore\n \nsharing\n \ncustomer\n \nstories.\n \nPlus,\n \nyou\n \ncan\n \ngenerate\n \ndifferent\n \ntestimonial\n \nformats\n \ntailored\n \nfor\n \nvarious\n \nplatforms,\n \nensuring\n \nyour\n \nbest\n \ncustomer\n \nfeedback\n \nis\n \nalways\n \nready\n \nto\n \nshine\n \nwherever\n \nyou\n \nneed\n \nit.\n \n \nProduct\n \nDevelopment\n \nInsights\n \nYou\n \ncan\n \nupload\n \ncustomer\n \nfeature\n \nrequests\n \nand\n \nfeedback\n \nto\n \nthis\n \nsite,\n \nand\n \nit\n \nwill\n \nanalyze\n \neverything\n \nto\n \nhighlight\n \nthe\n \nmost\n \ncommon\n \nand\n \nimpactful\n \nsuggestions.\n \nThe\n \nplatform\n \ncan\n \nthen\n \nhelp\n \nyou\n \nprioritize\n \nyour\n \nproduct\n \nroadmap\n \nbased\n \non\n \nreal\n \ncustomer\n \nneeds,\n \nensuring\n \nyour\n \ndevelopment\n \nefforts\n \nare\n \nfocused\n \nwhere\n \ntheyll\n \nhave\n \nthe\n \nmost\n \nimpact.\n \nAdditionally,\n \nyou\n \ncan\n \ngenerate\n \nclear\n communications\n \nto\n \nshow\n \nyour\n \ncustomers\n \nhow\n \ntheir\n \nfeedback\n \nshaped\n \nyour\n \ndecisionsbuilding\n \ntrust\n \nand\n \nencouraging\n \nongoing\n \nengagement.\n \nOther\n \nNon-Traditional\n \nMarketing\n \nApplications\n \nEvent\n \n&\n \nWebinar\n \nContent\n \nSuite\n \nAfter\n \nhosting\n \na\n \nwebinar\n \nor\n \nevent,\n \nsimply\n \nupload\n \nyour\n \ntranscripts\n \nor\n \nrecordings.\n \nThe\n \nsite\n \nwill\n \ngenerate\n \na\n \nsuite\n \nof\n \ncontent\n \nfor\n \nyou:\n \nfollow-up\n \nemails\n \nto\n \nattendees,\n \nblog\n \nrecaps,\n \nsocial\n \nmedia\n \nhighlights,\n \nand\n \nthank-you\n \nnotes\n \nfor\n \nspeakers.\n \nThis\n \nmeans\n \nyou\n \ncan\n \nmaximize\n \nthe\n \nvalue\n \nof\n \nyour\n \nevents\n \nand\n \nkeep\n \nyour\n \naudience\n \nengaged,\n \nwithout\n \nspending\n \nhours\n \nrepurposing\n \ncontent\n \nyourself.\n \nCrisis\n \nCommunication\n \nToolkit\n \nIf\n \nyour\n \ncompany\n \nfaces\n \na\n \ncrisis\n \nor\n \npublic\n \nissue,\n \nyou\n \ncan\n \nupload\n \nrelevant\n \nnews\n \narticles\n \nto\n \nthe\n \nplatform.\n \nIt\n \nwill\n \nhelp\n \nyou\n \ncraft\n \ntiered\n \nresponse\n \nstatements\n \nfor\n \ndifferent\n \nstakeholders,\n \nfrom\n \ncustomers\n \nto\n \nthe\n \nmedia.\n \nYou\n \ncan\n \nalso\n \ngenerate\n \nFAQ\n \ndocuments\n \nand\n \ninternal\n \ntalking\n \npoints,\n \nensuring\n \nyour\n \nentire\n \nteam\n \nis\n \naligned\n \nand\n \nready\n \nto\n \nrespond\n \nwith\n \nclear,\n \nconsistent\n \nmessaging.\n \nSales\n \nEnablement\n \nContent\n \nUpload\n \nrecordings\n \nof\n \nyour\n \ncustomer\n \ncalls,\n \ndemos,\n \nor\n \nsales\n \nmeetings,\n \nand\n \nthe\n \nsite\n \nwill\n \nanalyze\n \nthem\n \nto\n \ncreate\n \nobjection-handling\n \nscripts\n \nand\n \npersonalized\n \nfollow-up\n \nemails.\n \nThis\n \nhelps\n \nyour\n \nsales\n \nteam\n \naddress\n \nreal\n \nprospect\n \nconcerns\n \nmore\n \neffectively,\n \nand\n \nensures\n \nevery\n \nfollow-up\n \nis\n \nrelevant\n \nand\n \nimpactfulhelping\n \nyou\n \nclose\n \nmore\n \ndeals.\n \nCompetitive\n \nIntelligence\n \nDigests\n \nStay\n \nahead\n \nof\n \nthe\n \ncompetition\n \nby\n \nuploading\n \ncompetitor\n \npress\n \nreleases,\n \nmarketing\n \nmaterials,\n \nor\n \nproduct\n \ndescriptions.\n \nThe\n \nplatform\n \nwill\n \nsummarize\n \nkey\n \ninsights\n \nand\n \ngenerate\n \nsales\n \nbattle\n \ncards\n \nthat\n \nhighlight\n \nyour\n \ncompanys\n \nadvantages.\n \nThis\n \ngives\n \nyour\n \nteam\n \nthe\n \nedge\n \nthey\n \nneed\n \nto\n \nrespond\n \nquickly\n \nand\n \nconfidently\n \nin\n \nthe\n \nmarket.\n \nInternal\n \nCommunications\n \nEnhancement\n \nWhen\n \nyou\n \nhave\n \ncomplex\n \nor\n \ntechnical\n \nannouncements,\n \nyou\n \ncan\n \nuse\n \nthe\n \nsite\n \nto\n \ntransform\n \nthem\n \ninto\n \nclear,\n \nemployee-friendly\n \ncommunications.\n \nIt\n \ncan\n \nalso\n \ncreate\n \ndepartment-specific\n \nversions\n \nof\n \nupdates\n \nand\n \nengaging\n \ncontent\n \nfor\n \ninternal\n \nnewsletters,\n \nmaking\n \nit\n \neasier\n \nto\n \nkeep\n \nyour\n \nwhole\n \norganization\n \ninformed\n \nand\n \nmotivated.\n Localization\n \n&\n \nMarket\n \nAdaptation\n \nExpanding\n \ninto\n \nnew\n \nmarkets?\n \nUpload\n \nyour\n \ncore\n \nmarketing\n \nmaterials\n \nand\n \nlet\n \nthe\n \nsite\n \ngenerate\n \nculturally\n \nadapted\n \nversions\n \nfor\n \ndifferent\n \nregions.\n \nYoull\n \nget\n \ncontent\n \nwith\n \nregion-specific\n \nreferences\n \nand\n \nexamples,\n \nensuring\n \nyour\n \nmessage\n \nconnects\n \nwith\n \nlocal\n \naudiences\n \nand\n \navoids\n \ncommon\n \ntranslation\n \npitfalls.\n \nInvestor\n \nRelations\n \nContent\n \nYou\n \ncan\n \nupload\n \nyour\n \nfinancial\n \ndata\n \nand\n \ncompany\n \nupdates,\n \nand\n \nthe\n \nplatform\n \nwill\n \ntransform\n \nthem\n \ninto\n \ninvestor-ready\n \ncommunications.\n \nGenerate\n \nearnings\n \ncall\n \nprep\n \nmaterials,\n \nshareholder\n \nupdate\n \nletters,\n \nand\n \npresentations\n \nwith\n \neasehelping\n \nyou\n \nkeep\n \nyour\n \ninvestors\n \ninformed\n \nand\n \nengaged\n \nwith\n \nless\n \neffort.\n \nRecruitment\n \nMarketing\n \nUpload\n \nyour\n \njob\n \ndescriptions\n \nand\n \ncompany\n \nvalues,\n \nand\n \nthe\n \nsite\n \nwill\n \ngenerate\n \ntailored\n \njob\n \npostings\n \nfor\n \ndifferent\n \nplatforms.\n \nYou\n \ncan\n \nalso\n \ncreate\n \npersonalized\n \ncandidate\n \noutreach\n \nmessages\n \nand\n \nfollow-up\n \nsequences,\n \nmaking\n \nyour\n \nrecruitment\n \nprocess\n \nmore\n \neffective\n \nand\n \nensuring\n \nyou\n \nattract\n \nthe\n \nbest\n \ntalent\n \nwith\n \nmessaging\n \nthat\n \nreflects\n \nyour\n \nunique\n \nculture.\n \nIn\n \nshort,\n \nthis\n \nsite\n \nis\n \nyour\n \nall-in-one\n \nsolution\n \nfor\n \ntransforming\n \nraw\n \nbusiness\n \ninputs\n \ninto\n \npolished,\n \nactionable\n \ncontenthelping\n \nyou\n \nsave\n \ntime,\n \nimprove\n \ncommunication,\n \nand\n \ndrive\n \nbetter\n \nresults\n \nacross\n \nevery\n \narea\n \nof\n \nyour\n \norganization.\n \n \n \nPerfectly\n \nclearand\n \na\n \nbrilliant\n \ncontent\n \nmarketing\n \nstrategy\n \ntoo.\n \nThese\n \narticles\n \nwill\n \nposition\n \naimarketingplatform.app\n \nas\n \nmore\n \nthan\n \njust\n \na\n \ncontent\n \ntooltheyll\n \nshow\n \nit\n \nas\n \nan\n \nindispensable\n \nbusiness\n \ncompanion\n.\n \nBelow\n \nare\n \nthe\n \ntwo\n \nseparate,\n \nblog-ready\n \narticles\n \nas\n \nrequested.\n \nI'll\n \ninclude:\n \n \n \nA\n \nclickable\n \ninternal\n \nTOC\n \nat\n \nthe\n \ntop\n \n(using\n \nMarkdown-style\n \n#\n \nheaders\n \nfor\n \neach\n \nsection)\n \n \n \n \nBenefit-driven\n \nexplanations\n \nfrom\n \nthe\n \nuser's\n \nperspective\n \n \n \n \nEmphasis\n \non\n \ntime-saving\n,\n \nROI\n,\n \nand\n \nworkflow\n \nsimplification\n \n \n  \n \nArticle\n \n1:\n \n10\n \nPowerful\n \nWays\n \nAI\n \nMarketing\n \nGoes\n \nBeyond\n \nSocial\n \nMedia\n \nPosts\n \n \nTable\n \nof\n \nContents\n \n1.\n \nCustomer\n \nFeedback\n \nto\n \nContent\n \nGold\n \n \n2.\n \nTurn\n \nTestimonials\n \ninto\n \nMarketing\n \nTools\n \n \n3.\n \nGenerate\n \nReview\n \nResponses\n \nwith\n \nEase\n \n \n4.\n \nUncover\n \nProduct\n \nDevelopment\n \nInsights\n \n \n5.\n \nEffortless\n \nEvent\n \nand\n \nWebinar\n \nFollow-Ups\n \n \n6.\n \nCrisis\n \nComms\n \nYou\n \nCan\n \nTrust\n \n \n7.\n \nSales\n \nEnablement\n \nAssets\n \nfrom\n \nReal\n \nData\n \n \n8.\n \nKnow\n \nYour\n \nCompetition,\n \nStay\n \nAhead\n \n \n9.\n \nSupercharge\n \nInternal\n \nCommunications\n \n \n10.\n \nGo\n \nGlobal\n \nwith\n \nSmarter\n \nLocalization\n \n \n \n#\n \nCustomer\n \nFeedback\n \nto\n \nContent\n \nGold\n \nUpload\n \nyour\n \ncustomer\n \nreviews,\n \nsurvey\n \nresponses,\n \nor\n \nsupport\n \nticketsand\n \nlet\n \nthe\n \nplatform\n \nturn\n \nthem\n \ninto\n \nmarketing\n \nclaims,\n \nsummaries\n,\n \nand\n \ncopy\n \nusing\n \nyour\n \ncustomers\n \nown\n \nwords\n.\n \n \nSave\n \ntime:\n \nNo\n \nmore\n \nmanually\n \nhunting\n \nfor\n \ntrends.\n \n \nWhy\n \nit\n \nhelps:\n \nCreate\n \nauthentic,\n \ndata-backed\n \nmessaging\n \nthat\n \nresonates.\n \n \n#\n \nTurn\n \nTestimonials\n \ninto\n \nMarketing\n \nTools\n \nTake\n \nlong-winded\n \ncustomer\n \nfeedback\n \nand\n \ncondense\n \nit\n \ninto\n \nsharp,\n \nversatile\n \ntestimonialsideal\n \nfor\n \nyour\n \nwebsite,\n \nlanding\n \npages,\n \nand\n \nsocial\n \nmedia.\n  \nSave\n \ntime:\n \nSkip\n \nthe\n \nediting\n \nheadache.\n \n \nWhy\n \nit\n \nhelps:\n \nYou\n \nturn\n \ngenuine\n \npraise\n \ninto\n \npersuasive\n \nproof.\n \n \n#\n \nGenerate\n \nReview\n \nResponses\n \nwith\n \nEase\n \nGot\n \nreviews\n \npiling\n \nup\n \non\n \nGoogle,\n \nTrustpilot,\n \nor\n \nFacebook?\n \nFeed\n \nthem\n \ninto\n \nyour\n \ndashboard\n \nand\n \ninstantly\n \nget\n \npersonalized,\n \nprofessional\n \nresponses\n \ntailored\n \nby\n \nsentiment\n \n(e.g.,\n \n1-star\n \nvs.\n \n5-star).\n \n \nSave\n \ntime:\n \nSay\n \ngoodbye\n \nto\n \nwriters\n \nblock.\n \n \nWhy\n \nit\n \nhelps:\n \nProtect\n \nyour\n \nreputation\n \nwhile\n \nshowing\n \ncustomers\n \ntheyre\n \nheard.\n \n \n#\n \nUncover\n \nProduct\n \nDevelopment\n \nInsights\n \nYour\n \ncustomers\n \nare\n \ngiving\n \nyou\n \na\n \nroadmapyou\n \njust\n \nneed\n \nto\n \nlisten.\n \nThe\n \nplatform\n \nhelps\n \nyou\n \nspot\n \nrecurring\n \nfeature\n \nrequests\n \nand\n \npain\n \npoints,\n \nthen\n \nturns\n \nthem\n \ninto\n \nproduct\n \npriorities\n \nand\n \ncustomer\n \nmessaging\n.\n \n \nSave\n \ntime:\n \nGet\n \nsummarized\n \ninsights\n \nfrom\n \npages\n \nof\n \nfeedback.\n \n \nWhy\n \nit\n \nhelps:\n \nBuild\n \nwhat\n \npeople\n \nactually\n \nwantand\n \ntell\n \nthem\n \nyou\n \ndid.\n \n \n#\n \nEffortless\n \nEvent\n \nand\n \nWebinar\n \nFollow-Ups\n \nUpload\n \nyour\n \nwebinar\n \ntranscripts\n \nor\n \nrecordings.\n \nYoull\n \nget\n \nfollow-up\n \nemails,\n \nblog\n \nposts,\n \nthank-you\n \nmessages,\n \nand\n \nsocial\n \nmedia\n \nclips\n \nin\n \nminutes.\n \n \nSave\n \ntime:\n \nOne\n \nevent\n \n=\n \na\n \nweek\n \nof\n \ncontent.\n \n \nWhy\n \nit\n \nhelps:\n \nExtend\n \nyour\n \nevents\n \nshelf\n \nlife\n \nand\n \nengage\n \nyour\n \naudience\n \npost-event.\n \n \n#\n \nCrisis\n \nComms\n \nYou\n \nCan\n \nTrust\n \nWhether\n \nit's\n \nindustry\n \nnews,\n \nbad\n \nPR,\n \nor\n \nan\n \ninternal\n \nmishapupload\n \nthe\n \ncontext\n \nand\n \nget\n \ntiered\n \nresponses,\n \nFAQs,\n \nand\n \nstaff\n \ntalking\n \npoints\n.\n \n \nSave\n \ntime:\n \nCrisis\n \nresponse\n \nin\n \nminutes,\n \nnot\n \ndays.\n \n \nWhy\n \nit\n \nhelps:\n \nStay\n \nproactive\n \nand\n \nprofessional\n \nwhen\n \nit\n \nmatters\n \nmost.\n \n \n#\n \nSales\n \nEnablement\n \nAssets\n \nfrom\n \nReal\n \nData\n Upload\n \nsales\n \ncalls,\n \ndemos,\n \nor\n \ndiscovery\n \nmeeting\n \ntranscripts.\n \nGet\n \nobjection-handling\n \nscripts\n \nand\n \nfollow-up\n \nemail\n \nsequences\n \ntailored\n \nto\n \nthe\n \ncustomers\n \nconcerns.\n \n \nSave\n \ntime:\n \nPrep\n \nyour\n \nsales\n \nteam\n \nwithout\n \nhours\n \nof\n \nnote-taking.\n \n \nWhy\n \nit\n \nhelps:\n \nClose\n \nmore\n \ndeals\n \nwith\n \nmessaging\n \nthat\n \nsticks.\n \n \n#\n \nKnow\n \nYour\n \nCompetition,\n \nStay\n \nAhead\n \nFeed\n \nthe\n \nplatform\n \ncompetitor\n \npress\n \nreleases,\n \nmarketing\n \nmaterials,\n \nor\n \nfeature\n \nlists.\n \nInstantly\n \nreceive\n \ncompetitive\n \nsummaries\n \nand\n \nsales\n \nbattle\n \ncards\n.\n \n \nSave\n \ntime:\n \nNo\n \nmore\n \nmanual\n \ncompetitor\n \nresearch.\n \n \nWhy\n \nit\n \nhelps:\n \nEquip\n \nyour\n \nteam\n \nwith\n \nreasons\n \nwhy\n \nyou\n \nwin.\n \n \n#\n \nSupercharge\n \nInternal\n \nCommunications\n \nGot\n \ncomplex\n \ninternal\n \nupdates\n \nor\n \nannouncements?\n \nLet\n \nthe\n \nplatform\n \nturn\n \nthem\n \ninto\n \ndigestible,\n \ndepartment-specific\n \nmessages\n \nand\n \nengaging\n \ninternal\n \nnewsletter\n \ncontent\n.\n \n \nSave\n \ntime:\n \nOne\n \nmessage,\n \nmultiple\n \nversions.\n \n \nWhy\n \nit\n \nhelps:\n \nEnsure\n \nalignment\n \nwithout\n \noverwhelming\n \nyour\n \nteam.\n \n \n#\n \nGo\n \nGlobal\n \nwith\n \nSmarter\n \nLocalization\n \nUpload\n \nyour\n \ncore\n \nmarketing\n \nmaterials,\n \nand\n \nthe\n \nplatform\n \nwill\n \ngenerate\n \nlocalized,\n \nculturally-relevant\n \nversions\nwith\n \nappropriate\n \ntone,\n \nslang,\n \nand\n \nexamples.\n \n \nSave\n \ntime:\n \nSkip\n \nmultiple\n \nagency\n \nrevisions.\n \n \nWhy\n \nit\n \nhelps:\n \nSpeak\n \nyour\n \ncustomers'\n \nlanguageliterally.\n \n \n \n \nUp\n \nNext:\n \nAnother\n \n10\n \nWays\n \nAI\n \nMarketing\n \nMakes\n \nYour\n \nLife\n \nEasier\n \n \n \n \n \n \nArticle\n \n2:\n \nAnother\n \n10\n \nSurprising\n \nWays\n \nAI\n \nMarketing\n \nCan\n \nPower\n \nYour\n \nBusiness\n \n Table\n \nof\n \nContents\n \n1.\n \nVoiceDesk:\n \nYour\n \nBrand\n \nVoice,\n \nEverywhere\n \n \n2.\n \nPlanning\n \nCampaigns\n \nwith\n \nAI\n \nPrecision\n \n \n3.\n \nOnboarding\n \nMade\n \nSimple\n \n \n4.\n \nKnowledge\n \nBase\n \nAutomation\n \n \n5.\n \nActivate\n \nYour\n \nCommunity\n \n \n6.\n \nCompliant\n \nMarketing\n \nfor\n \nRegulated\n \nIndustries\n \n \n7.\n \nPartner\n \n&\n \nAffiliate\n \nMarketing\n \nKits\n \n \n8.\n \nExecutive\n \nThought\n \nLeadership\n \non\n \nAutopilot\n \n \n9.\n \nBuild\n \nCampaign\n \nBriefs\n \nin\n \nMinutes\n \n \n10.\n \nTrain\n \n&\n \nEnable\n \nYour\n \nTeams\n \nwith\n \nAI\n \n \n \n#\n \nVoiceDesk:\n \nYour\n \nBrand\n \nVoice,\n \nEverywhere\n \nUpload\n \nexamples\n \nof\n \nyour\n \nbest\n \ncontent,\n \nand\n \ntrain\n \nthe\n \nAI\n \nto\n \nmatch\n \nyour\n \ntone.\n \nFriendly?\n \nBold?\n \nCorporate?\n \nYou\n \ndecide.\n \n \nSave\n \ntime:\n \nNo\n \nmore\n \ncopy/paste\n \nstyle\n \nguides.\n \n \nWhy\n \nit\n \nhelps:\n \nEnsure\n \nbrand\n \nconsistency\n \nacross\n \nevery\n \nchannel,\n \neven\n \nwhen\n \nyour\n \nteam\n \nscales.\n \n \n#\n \nPlanning\n \nCampaigns\n \nwith\n \nAI\n \nPrecision\n \nbrainstorm\n \nideas,\n \nschedule\n \nposts,\n \nand\n \ntrack\n \ncampaign\n \nresultsall\n \npowered\n \nby\n \nAI\n \nsuggestions.\n \n \nSave\n \ntime:\n \nAI\n \nhandles\n \nideation\n \nand\n \nplanning.\n \n \nWhy\n \nit\n \nhelps:\n \nNever\n \nrun\n \nout\n \nof\n \ncontent\n \nideas\n \nor\n \nmiss\n \nan\n \nimportant\n \ndate\n \nagain.\n \n \n#\n \nOnboarding\n \nMade\n \nSimple\n Upload\n \nyour\n \nonboarding\n \nscripts\n \nor\n \nplaybooks.\n \nInstantly\n \ncreate\n \nemails,\n \nwalkthroughs,\n \nor\n \nchecklists\n \ntailored\n \nto\n \neach\n \ncustomer\n \nsegment.\n \n \nSave\n \ntime:\n \nReuse\n \nthe\n \nsame\n \ncontent\n \nstructure\n \nacross\n \nsegments.\n \n \nWhy\n \nit\n \nhelps:\n \nMake\n \ncustomers\n \nfeel\n \nseen,\n \nfast.\n \n \n#\n \nKnowledge\n \nBase\n \nAutomation\n \nFeed\n \nsupport\n \ntickets\n \nand\n \nFAQs\n \ninto\n \nthe\n \nplatform\n \nand\n \nlet\n \nit\n \ngenerate\n \nstep-by-step\n \nhelp\n \narticles\n,\n \nvideo\n \nscripts\n,\n \nand\n \nchatbot\n \nreplies\n.\n \n \nSave\n \ntime:\n \nFrom\n \ntickets\n \nto\n \ndocs\n \nin\n \na\n \nfew\n \nclicks.\n \n \nWhy\n \nit\n \nhelps:\n \nHelp\n \nyour\n \ncustomers\n \nhelp\n \nthemselves.\n \n \n#\n \nActivate\n \nYour\n \nCommunity\n \nGenerate\n \ndiscussion\n \nprompts,\n \nhighlight\n \nsummaries,\n \nand\n \nrecap\n \nemails\n \nfor\n \nyour\n \nReddit,\n \nDiscord,\n \nor\n \nFacebook\n \ngroups.\n \n \nSave\n \ntime:\n \nOne\n \nweekly\n \nprompt\n \n=\n \nengaged\n \ncommunity.\n \n \nWhy\n \nit\n \nhelps:\n \nKeep\n \nconversations\n \ngoing\n \nwithout\n \nhiring\n \na\n \ncommunity\n \nmanager.\n \n \n#\n \nCompliant\n \nMarketing\n \nfor\n \nRegulated\n \nIndustries\n \nMarketing\n \nin\n \nfinance\n \nor\n \nhealthcare?\n \nLet\n \nthe\n \nplatform\n \nreword\n \nyour\n \ncontent\n \nto\n \nmeet\n \ncompliance\n \nstandards\n \nwithout\n \nlosing\n \nimpact.\n \n \nSave\n \ntime:\n \nFewer\n \nlegal\n \nreviews.\n \n \nWhy\n \nit\n \nhelps:\n \nMarket\n \nboldly\n \nwithout\n \nbreaking\n \nthe\n \nrules.\n \n \n#\n \nPartner\n \n&\n \nAffiliate\n \nMarketing\n \nKits\n \nCreate\n \npre-made\n \nemail\n \ntemplates,\n \nbanner\n \nads,\n \nand\n \nlanding\n \npage\n \ncontent\n \nthat\n \naffiliates\n \nor\n \npartners\n \ncan\n \ncustomize\n \nand\n \ndeploy.\n \n \nSave\n \ntime:\n \nOne-click\n \ntoolkits\n \ninstead\n \nof\n \nback-and-forth\n \nemails.\n \n \nWhy\n \nit\n \nhelps:\n \nEmpower\n \nyour\n \npartners\n \nto\n \npromote\n \nyou\n \nbetter.\n \n \n#\n \nExecutive\n \nThought\n \nLeadership\n \non\n \nAutopilot\n Upload\n \nfounder\n \ninterviews,\n \nvoice\n \nmemos,\n \nor\n \npodcast\n \nappearances.\n \nThe\n \nplatform\n \nturns\n \nthem\n \ninto\n \nLinkedIn\n \nposts,\n \nop-eds,\n \nand\n \nslides\n.\n \n \nSave\n \ntime:\n \nGhostwriting\n \nwithout\n \nthe\n \nghost.\n \n \nWhy\n \nit\n \nhelps:\n \nPosition\n \nyour\n \nleadership\n \nwithout\n \nburning\n \ntheir\n \ntime.\n \n \n#\n \nBuild\n \nCampaign\n \nBriefs\n \nin\n \nMinutes\n \nStart\n \nwith\n \nraw\n \nideas\n \nor\n \nresearch\n \nlinks,\n \nand\n \ngenerate\n \npolished\n \ncreative\n \nbriefs,\n \nslide\n \ndecks,\n \nand\n \nmarketing\n \ntimelines\n \nfor\n \nyour\n \nteam.\n \n \nSave\n \ntime:\n \nSkip\n \nhours\n \nof\n \nformatting\n \nand\n \nstructure.\n \n \nWhy\n \nit\n \nhelps:\n \nAlign\n \nstakeholders\n \nfaster,\n \nwithout\n \nbottlenecks.\n \n \n#\n \nTrain\n \n&\n \nEnable\n \nYour\n \nTeams\n \nwith\n \nAI\n \nTurn\n \ntraining\n \ndocs\n \ninto\n \ncheat\n \nsheets,\n \nlesson\n \nsummaries,\n \nor\n \neven\n \nonboarding\n \nquizzes\n.\n \n \nSave\n \ntime:\n \nOne\n \nsource\n \n=\n \nmulti-format\n \ntraining.\n \n \nWhy\n \nit\n \nhelps:\n \nKeep\n \nyour\n \nteam\n \nsharp\n \nand\n \nconsistent.\n \n \nLet\n \nme\n \nknow\n \nif\n \nyou'd\n \nlike\n \nthese\n \nas\n \ndownloadable\n \nPDFs\n \nor\n \nturned\n \ninto\n \nformatted\n \nWordPress\n \nblog\n \nposts\n \nwith\n \nfeatured\n \nimages\n \nand\n \nSEO\n \nmetadata!\n \n 	5815	2025-04-25 13:27:50.413567+00	2025-04-25 13:27:50.413641+00	6f38c34a761c44d999dd7b900ca6aa28
2545dc8894c6490d9c10d012f55f3796	ai marketing platform notes and doodles.pdf	6f38c34a-761c-44d9-99dd-7b900ca6aa28/d934a2a7-6bc2-4520-aba9-e8eaa574ecc3_ai marketing platform notes and doodles.pdf	/media/6f38c34a-761c-44d9-99dd-7b900ca6aa28/d934a2a7-6bc2-4520-aba9-e8eaa574ecc3_ai marketing platform notes and doodles.pdf	pdf	application/pdf	93767	Ai\n \npowered...\n \n \n"AI\n \nthat\n \nspeaks\n \nyour\n \naudiences\n \nlanguage\n \n\n \nnot\n \njust\n \nyours."\n \nPosition\n \nthe\n \nplatform\n \nas:\n \n \n \nA\n \ncontent\n \nclarity\n \ntool\n \n(help\n \npeople\n \nwrite\n \nbetter\n \nprompts)\n \n \n \n \nA\n \nmarketing\n \namplifier\n \n(get\n \nengaging\n \nposts\n \ninstantly)\n \n \n \n \nAn\n \neducation\n \nhub\n \nfor\n \nAI-powered\n \ncontent\n \ncreation\n \n \n \nContent\n \nmarketing\n \n \nContent\n \ncreation\n \n \nGet\n \nthe\n \nideas\n \nyou\n \nneed\n \nto\n \nignite\n \nyour\n \ncreativity\n \nand\n \nsharpen\n \nyour\n \nsales\n \npitch.\n \n \nCraft\n \ncompelling\n \ncampaigns\n \n \nDrive\n \nROI\n \n \nServes\n \nup\n \nreadymade\n \n \n \nWrite\n \ncontent\n \nthat\n \ngrows\n \nyour\n \nweb\n \ntraffic\n \n \n \nMake\n \nsure\n \nyour\n \ncontent\n \nis\n \noptimised\n \nwell\n \n \nRepeatable\n \ncontent\n \ncreation\n \nprocess\n \n \n \nUse\n \ntemplates\n \nto\n \nbuild\n \nrepeatable\n \nwork\n \nflows\n \n \nProblems\n \nI\n \nam\n \nSolving:\n \n \nScattered\n \nnotes\n \nand\n \nassets\n \n\n \nCreators\n \noften\n \njuggle\n \nmultiple\n \ndocuments,\n \ndrafts,\n \nand\n \nmessages.\n \n \nDifferent\n \nformats\n \n\n \nYouTube,\n \nemails,\n \nLinkedIn,\n \netc.,\n \nall\n \nrequire\n \nslightly\n \ndifferent\n \nformats,\n \nmaking\n \ncontent\n \ncreation\n \nrepetitive.\n \n \nManual\n \nwork\n \n\n \nCreators\n \nwaste\n \ntime\n \nreformatting\n \nthe\n \nsame\n \ncontent\n \nacross\n \nplatforms.\n \n \nNot\n \noptimized\n \nfor\n \nefficiency\n \n\n \nThis\n \nentire\n \nprocess\n \nis\n \nripe\n \nfor\n \nAI\n \nautomation\n \nto\n \nstreamline\n \nworkflows\n \nand\n \nsave\n \ntime.\n \n I\n \nhave\n \nbuilt\n \na\n \nfull-stack\n \nAI-powered\n \napplication\n \nthat\n \nautomates\n \nmarketing\n \nworkflows\n \nfor\n \ncreators.\n \nYou\n \ncan:\n \n \n \nUpload\n \nvideos\n \nand\n \ntext\n \nfiles,\n \nand\n \nautomatically\n \nsummarize\n \nthem\n \nusing\n \nOpenAI,\n \nWhisper\n \nand\n \nother\n \nAI-powered\n \ntools.\n \n \nGenerate\n \ntailored\n \ncontent\n \nfor\n \nmultiple\n \nsocial\n \nmedia\n \nplatforms\n \nand\n \nemail\n \ncampaigns,\n \nsaving\n \ncreators\n \ncountless\n \nhours.\n \n \n \n \n \nThe\n \nability\n \nto\n \nautomate\n \nrepetitive\n \nworkflows\n \nand\n \nstreamline\n \nprocesses\n \n \nthe\n \nway\n \nwe\n \ncreate,\n \nwork\n \nand\n \ncollaborate\n \nis\n \nalways\n \nchanging\n \nand\n \nthe\n \nintroduction\n \nof\n \nAI\n \nhas\n \nreally\n \nhelped\n \nus\n \namplify\n \nour\n \nauthentic\n \nvoice\n \n \nharness\n \nthe\n \nfull\n \npotential\n \nof\n \nAI\n \n \nkeeping\n \nthe\n \ncomplexity\n \nof\n \nAI\n \nsimple\n \n \n \n \nDifference\n \nBetween\n \nPrompt\n \nEngineering\n \nand\n \nPrompt\n \nMarketing\n \nis\n \nwhat\n \nwe\n \nteach\n \non\n \nthe\n \nplatform\n \n \n \nSince\n \nthe\n \nexplosion\n \nof\n \nAI,\n \nthe\n \nword\n \n'prompt'\n \nhas\n \ntaken\n \non\n \na\n \nwhole\n \nnew\n \nlevel\n \nof\n \nimportance.\n \nBut\n \nnot\n \nall\n \nprompts\n \nare\n \ncreated\n \nequal\n \n\n \nand\n \ndepending\n \non\n \nhow\n \nyou\n \nuse\n \nthem,\n \nyou\n \nmight\n \nbe\n \npracticing\n \nprompt\n \nengineering\n \nor\n \nprompt\n \nmarketing.\n \n \nThese\n \ntwo\n \napproaches\n \nare\n \nboth\n \nvaluable,\n \nthey\n \nwork\n \ntogether\n \nin\n \nmany\n \ncases,\n \nbut\n \nthey\n \nserve\n \nvery\n \ndifferent\n \npurposes.\n \nHeres\n \na\n \nbreakdown\n \nof\n \nwhat\n \neach\n \none\n \nmeans,\n \nwhen\n \nto\n \nuse\n \nthem,\n \nand\n \nhow\n \nthey\n \nwork\n \nin\n \nreal-life\n \nsituations.\n \n \nWhat\n \nis\n \nPrompt\n \nEngineering?\n \n \nPrompt\n \nengineering\n \nis\n \nthe\n \nprocess\n \nof\n \ndesigning\n \nprompts\n \nthat\n \nget\n \naccurate,\n \nuseful,\n \nand\n \nconsistent\n \nresponses\n \nfrom\n \nan\n \nAI.\n \nThis\n \ntechnique\n \nis\n \nespecially\n \nimportant\n \nin\n \nsoftware\n \ndevelopment,\n \nautomation,\n \nand\n \nAI-powered\n \napps\n \nlike\n \nthe\n \nAI\n \nMarketing\n \nPlatform.\n \n \nThe\n \nGoal:\n \nTo\n \nget\n \nthe\n \nAI\n \nto\n \nperform\n \na\n \nspecific\n \ntask\n \ncorrectly\n \nand\n \nreliably.\n \n \nUse\n \nCases:\n \n AI-powered\n \ncustomer\n \nsupport\n \ntools\n \n \nAI\n \nassistants\n \nfor\n \nmarketing\n \ncontent\n \n \nAutomation\n \nin\n \nemail\n \nor\n \ncode\n \ngeneration\n \n \nAI-based\n \ntutoring\n \nor\n \nmedical\n \nsymptom\n \ncheckers\n \n \nExample:\n \n \nSay\n \nyoure\n \nbuilding\n \na\n \ntravel\n \nplanning\n \napp\n \nusing\n \nChatGPT.\n \nHeres\n \na\n \nwell-engineered\n \nprompt:\n \n \n"You\n \nare\n \nan\n \nexpert\n \ntravel\n \nadvisor.\n \nGenerate\n \na\n \n7-day\n \ntravel\n \nitinerary\n \nfor\n \na\n \nsolo\n \nfemale\n \ntraveller\n \nin\n \nBali.\n \nFocus\n \non\n \nwellness,\n \nsafety,\n \nand\n \nlocal\n \nculture.\n \nInclude\n \ndaily\n \nactivities,\n \nrecommended\n \nareas\n \nto\n \nstay,\n \nand\n \nestimated\n \ncosts."\n \n \nThis\n \nis\n \nprompt\n \nengineering\n \nbecause\n \nit\n \nsets\n \nthe\n \nrole,\n \nscope,\n \nand\n \nexpectations\n \nfor\n \nthe\n \nAI,\n \nleading\n \nto\n \nhigh-quality,\n \nconsistent\n \nresults\n \nevery\n \ntime.\n \nOur\n \nAI\n \nplatform\n \nhas\n \nbeen\n \nengineered\n \nto\n \nuse\n \nyour\n \nown\n \ncontent\n \nto\n \nhelp\n \nwith\n \nprompt\n \nengineering.\n \nIt\n \nwill\n \nuse\n \nwhat\n \nyou\n \nprovide\n \nand\n \nturn\n \nit\n \ninto\n \ncontent\n \nyou\n \ncan\n \nuse\n \nin\n \nprompt\n \nmarketing.\n \n \nWhat\n \nis\n \nPrompt\n \nMarketing?\n \n \nPrompt\n \nmarketing\n \nis\n \nthe\n \nuse\n \nof\n \nprompts\n \nas\n \ncontent\n \n\n \ndesigned\n \nto\n \nspark\n \nreflection,\n \nstorytelling,\n \nor\n \ninteraction\n \nfrom\n \nyour\n \naudience.\n \nIts\n \na\n \ncreative\n \nand\n \nemotional\n \ntool,\n \noften\n \nused\n \nby\n \ncontent\n \ncreators,\n \ninfluencers,\n \nand\n \nmarketers.\n \n \nThe\n \nGoal:\n \nTo\n \nget\n \nyour\n \naudience\n \nto\n \nthink,\n \nwrite,\n \nor\n \nengage.\n \n \nUse\n \nCases:\n \n \nInstagram\n \ncaptions\n \nfor\n \nself-help\n \nor\n \njournaling\n \npages\n \n \nX\n \n(aka\n \nTwitter)\n \nengagement\n \nprompts\n \n \nEmail\n \nnewsletter\n \ninspiration\n \n \n \nExample:\n \nImagine\n \nyou're\n \na\n \nlife\n \ncoach\n \non\n \nInstagram.\n \nYou\n \nmight\n \npost:\n \n \nJournal\n \nPrompt:\n \nWhats\n \none\n \nbelief\n \nyouve\n \noutgrown\n \nin\n \nthe\n \npast\n \nyear,\n \nand\n \nhow\n \ndid\n \nit\n \nchange\n \nyour\n \nlife?\n \n(Add\n \na\n \nbeautiful\n \ngraphic,\n \nhashtags,\n \nand\n \na\n \ncall\n \nto\n \ncomment\n \nor\n \nsave)\n \n This\n \nisnt\n \nfor\n \nthe\n \nAI\n \n\n \nits\n \nfor\n \nyour\n \naudience.\n \nThe\n \ngoal\n \nis\n \nemotional\n \nconnection,\n \nreflection,\n \nand\n \nengagement.\n \nThats\n \nprompt\n \nmarketing.\n \n \nSide-by-Side\n \nComparison\n \n \nPrompt\n \nEngineering\n \n                \n \nPrompt\n \nMarketing\n \nGets\n \nAI\n \nto\n \ndo\n \nwhat\n \nyou\n \nwant\n     \n \n \nGets\n \nyour\n \naudience\n \nto\n \nreflect\n \nor\n \nrespond\n \nPrecise,\n \ninstructional,\n \nrole-based\n \n \nEmotional,\n \nopen-ended,\n \nrelatable\n \nUsed\n \nin\n \nAI\n \ntools,\n \napps,\n \ncoding\n \nprojects\n \n \nUsed\n \non\n \nsocial\n \nmedia,\n \nnewsletters,\n \njournals\n \nRequires\n \nclarity,\n \nstructure,\n \ntesting\n \n \nRequires\n \nempathy,\n \ncreativity,\n \ntiming\n \nExample:\n \nWrite\n \nSEO\n \nmeta\n \ndescriptions...\n \n \nExample:\n \nWhat\n \ndoes\n \nsuccess\n \nlook\n \nlike\n \nto\n \nyou?\n \n \n \n \nReal-Life\n \nContexts\n \n \nPrompt\n \nEngineering\n \nin\n \nAction:\n \n \nYou\n \nneed\n \ncontent\n \nfor\n \nyour\n \nblog.\n \nYou\n \nwrite\n \nprompts\n \nlike:\n \n \n"Write\n \nan\n \nSEO-optimized\n \nblog\n \npost\n \noutline\n \nfor\n \nthe\n \nkeyword:\n \n'benefits\n \nof\n \ncold\n \nshowers'.\n \nInclude\n \nan\n \nintroduction,\n \n5\n \nmain\n \npoints,\n \nand\n \na\n \nconclusion."\n \n \nHere,\n \nyou're\n \nrelying\n \non\n \nthe\n \nAI\n \nto\n \ncreate\n \nthe\n \ncontent\n \nfor\n \nyou.\n \n \n \nPrompt\n \nMarketing\n \nin\n \nAction:\n \n \nYou\n \nrun\n \na\n \nFacebook\n \npage\n \nfor\n \nwellness.\n \nYou\n \ntweet:\n \n \n"Write\n \nabout\n \na\n \ntime\n \nwhen\n \nyou\n \nchose\n \npeace\n \nover\n \nbeing\n \nright.\n \nWhat\n \nhappened?"\n \n#writingprompt\n \n#selfreflection\n \n \nThis\n \ngets\n \npeople\n \nwriting,\n \ncommenting,\n \nand\n \nthinking.\n \nIts\n \ncontent\n \nfor\n \npeople,\n \nnot\n \nthe\n \nAI.\n \n \n \nOne\n \nSource\n \n \n \nMultiple\n \nOutcomes\n \n \nLets\n \nsay\n \nyou\n \nupload\n \nor\n \nwrite\n \na\n \nblog\n \npost\n \nin\n \nthe\n \nplatform\n \nabout\n \n"Building\n \nSelf-Trust\n \nAfter\n \nBurnout".\n \n \nWith\n \nPrompt\n \nEngineering,\n \nyou\n \ncould\n \nask\n \nthe\n \nAI:\n \n Summarise\n \nthis\n \nblog\n \npost\n \ninto\n \na\n \nTwitter\n \nthread\n \nwith\n \na\n \nreflective\n \ntone,\n \nusing\n \nthe\n \nvoice\n \nof\n \na\n \nmindset\n \ncoach.\n \n \nWith\n \nPrompt\n \nMarketing,\n \nyou\n \ncould\n \ngenerate\n \naudience-facing\n \nprompts\n \nlike:\n \n \nJournal\n \nPrompt:\n \nWhen\n \nwas\n \nthe\n \nlast\n \ntime\n \nyou\n \ntrusted\n \nyour\n \ninstincts\n \nwithout\n \nsecond-guessing\n \nyourself?\n \n \nInstagram\n \nCaption\n \nIdea:\n \nLearning\n \nto\n \ntrust\n \nyourself\n \nagain\n \nisnt\n \na\n \none-time\n \ndecision\n \n\n \nits\n \na\n \ndaily\n \nconversation.\n \nSave\n \nthis\n \nfor\n \nthe\n \nnext\n \ntime\n \nself-doubt\n \ncreeps\n \nin.\n \n \n \nWith\n \nthe\n \nAI\n \nMarketing\n \nPlatform\n \nnot\n \nonly\n \ncan\n \nyou\n \nget\n \nit\n \nto\n \nwrite\n \nthe\n \nSEO\n \noptimized\n \nblog\n \nfor\n \nyou\n \nbut\n \nyou\n \ncan\n \nalso\n \nprompt\n \nit\n \nto\n \nuse\n \nthat\n \ncontent\n \nto\n \ncreate\n \nyour\n \ntweets,\n \nyour\n \nInstagram\n \npost\n \nor\n \nan\n \nintroduction\n \nyou\n \ncan\n \nput\n \non\n \nLinkedIn\n \nwhen\n \nyou\n \nlink\n \nto\n \nyour\n \nblog\n \npost.\n \n \nOur\n \nplatform\n \nwas\n \nbuilt\n \nto\n \ntake\n \nadvantage\n \nof\n \nboth\n \nprompt\n \nengineering\n \nand\n \nprompt\n \nmarketing.\n \n \nWant\n \nto\n \nturn\n \na\n \nblog\n \npost\n \ninto\n \na\n \ntweet\n \nthread?\n \n \n \nThats\n \nprompt\n \nengineering.\n \n \nWant\n \nyour\n \naudience\n \nto\n \nreflect,\n \ncomment,\n \nor\n \njournal?\n \n \n \nThats\n \nprompt\n \nmarketing.\n \n \nWant\n \nto\n \ndo\n \nboth\n \nin\n \none\n \nworkflow?\n \n \n \nThats\n \nwhere\n \nbeing\n \na\n \nmember\n \nof\n \nour\n \nplatform\n \nhelps.\n \n \nWith\n \nthe\n \nAI\n \nMarketing\n \nPlatform,\n \nyou\n \ndont\n \nhave\n \nto\n \nchoose\n \n\n \nyou\n \ncan:\n \n \nGenerate\n \ncontent\n \nwith\n \nAI\n \n(engineering)\n \n \nCreate\n \ncontent\n \nfor\n \nyour\n \naudience\n \n(marketing)\n \n \nRepurpose\n \neverything\n \ninto\n \nmultiple\n \nformats,\n \nfast\n \n \n \nRemember...\n \n \nPrompt\n \nengineering\n \nand\n \nprompt\n \nmarketing\n \nare\n \nboth\n \npowerful\n \n\n \nthey\n \njust\n \nserve\n \ndifferent\n \npurposes.\n \n \nUse\n \nprompt\n \nengineering\n \nwhen\n \nyou\n \nwant\n \nto\n \nuse\n \nAI\n \neffectively.\n \n \nUse\n \nprompt\n \nmarketing\n \nwhen\n \nyou\n \nwant\n \nto\n \nconnect\n \nwith\n \nyour\n \naudience.\n \n \n \n 	2613	2025-04-25 13:27:48.578101+00	2025-04-25 13:27:48.578175+00	6f38c34a761c44d999dd7b900ca6aa28
4177f0dbce7348e283b956fb38988710	Tech VA and MVP Development Support.pdf	54c1f50b-6730-4a7b-878f-e8d4c3a6ca80/f43010df-3591-4f6b-80db-d775b1abe547_Tech VA and MVP Development Support.pdf	/media/54c1f50b-6730-4a7b-878f-e8d4c3a6ca80/f43010df-3591-4f6b-80db-d775b1abe547_Tech VA and MVP Development Support.pdf	pdf	application/pdf	142285	[Content not available due to encoding issues]	2294	2025-04-22 12:02:14.940899+00	2025-04-22 12:02:14.940962+00	54c1f50b67304a7b878fe8d4c3a6ca80
4ae719a6f0b84983b6f13a110d0adedc	11 - Addiction, Trauma _ Healing.pdf	54c1f50b-6730-4a7b-878f-e8d4c3a6ca80/53061c03-9224-47df-a40f-dcc7d140b509_11 - Addiction, Trauma _ Healing.pdf	/media/54c1f50b-6730-4a7b-878f-e8d4c3a6ca80/53061c03-9224-47df-a40f-dcc7d140b509_11 - Addiction, Trauma _ Healing.pdf	pdf	application/pdf	1259507	[Content not available due to encoding issues]	19792	2025-04-22 12:02:03.687693+00	2025-04-22 12:02:03.688893+00	54c1f50b67304a7b878fe8d4c3a6ca80
87ae69956f954c8da88eb372391ecddd	Articles for inspirational guidance written by chatgpt.pdf	54c1f50b-6730-4a7b-878f-e8d4c3a6ca80/17feba77-4684-4757-87ad-b0cf94ecf2e4_Articles for inspirational guidance written by chatgpt.pdf	/media/54c1f50b-6730-4a7b-878f-e8d4c3a6ca80/17feba77-4684-4757-87ad-b0cf94ecf2e4_Articles for inspirational guidance written by chatgpt.pdf	pdf	application/pdf	212521	[Content not available due to encoding issues]	9634	2025-04-22 12:14:25.116417+00	2025-04-22 12:14:25.116481+00	54c1f50b67304a7b878fe8d4c3a6ca80
c20ca9d37ef143a7bd0e77b27eff05a7	Create Social Content.txt	6f38c34a-761c-44d9-99dd-7b900ca6aa28/87ed8b6b-8827-4b51-8cee-117ec85dc33b_Create Social Content.txt	/media/6f38c34a-761c-44d9-99dd-7b900ca6aa28/87ed8b6b-8827-4b51-8cee-117ec85dc33b_Create Social Content.txt	text	text/plain	2936	Create Social Content\nIn Seconds\nSay goodbye to hours spent editing. Just upload your text, audio, or videoour AI handles the rest, turning your content into ready-to-post social media material effortlessly.\n\nAi powered...\n\n"AI that speaks your audiences language  not just yours."\nPosition the platform as:\nA content clarity tool (help people write better prompts)\n\n\nA marketing amplifier (get engaging posts instantly)\n\n\nAn education hub for AI-powered content creation\n\n\n\nContent marketing \nContent creation \nGet the ideas you need to ignite your creativity and sharpen your sales pitch.\n\nCraft compelling campaigns\n\nDrive ROI\n\nServes up readymade \n\nWrite content that grows your web traffic \n\nMake sure your content is optimised well\n\nRepeatable content creation process \n\nUse templates to build repeatable work flows\n\nProblems I am Solving:\n\nScattered notes and assets  Creators often juggle multiple documents, drafts, and messages.\n\nDifferent formats  YouTube, emails, LinkedIn, etc., all require slightly different formats, making content creation repetitive.\n\nManual work  Creators waste time reformatting the same content across platforms.\n\nNot optimized for efficiency  This entire process is ripe for AI automation to streamline workflows and save time.\n\nI have built a full-stack AI-powered application that automates marketing workflows for creators. You can:\n\n\nUpload videos and text files, and automatically summarize them using OpenAI, Whisper and other AI-powered tools.\n\nGenerate tailored content for multiple social media platforms and email campaigns, saving creators countless hours.\n\n\n\n\nThe ability to automate repetitive workflows and streamline processes\n\nthe way we create, work and collaborate is always changing and the introduction of AI has really helped us amplify our authentic voice\n\nharness the full potential of AI\n\nkeeping the complexity of AI simple \n\n\nOur AI analyzes your content and generates clear, impactful messaging that resonates with your audience.\n\nUpload Your Content\nStart by uploading any text, audio, or video you own. Our platform supports a variety of media formats.\n\nReady To Go\nGet fully-formed marketing materials, perfectly matched to your audience and platform.\n\nAI powered Marketing platform\nAI Powered\nLet our AI analyze and summarize your content into clear, impactful messaging.\n\nAI Marketing platform logo\nYour Voice\nUse custom prompts to guide the tone, style, or focusensuring the content sounds like you.\n\nThe features include\nThe ability to upload assets - pdf, audio, video\nThe ability to include prompts and learn about prompt engineering and prompt marketing\nAn SEO inspector that will ensure your content is SEO compliant and let you know how it ranks\nTraining and resources on prompt engineering and prompt marketing\nsave time if you have writers block\n	531	2025-04-25 13:28:06.533449+00	2025-04-25 13:28:06.533511+00	6f38c34a761c44d999dd7b900ca6aa28
f3cce23d608d4b928f4d5d35878dd955	AIM Platform keywords.txt	6f38c34a-761c-44d9-99dd-7b900ca6aa28/0c2c3196-cf30-480b-8782-f030baa9660a_AIM Platform keywords.txt	/media/6f38c34a-761c-44d9-99dd-7b900ca6aa28/0c2c3196-cf30-480b-8782-f030baa9660a_AIM Platform keywords.txt	text	text/plain	3804	The AI Marketing platform is a creative assistant. It is not a done-for-you tool, which makes it far more ethical, realistic, and empowering. It won't replace you. AI lacks context, emotion and brand nuance. \nThis is an AI content creation assistant that will remove the heavy lifting of content repurposing while you stay in the driver's seat. It goal is to make life easier and content repurposing faster.\n\n\nThe AI Marketing Platform is your creative assistant  not a done-for-you tool.\nIts built to support you, not replace you. Unlike humans, AI lacks context, emotion, and brand nuance  and thats where you come in.\n\nThink of it as your behind-the-scenes teammate, handling the heavy lifting of content repurposing so you can stay in the drivers seat and keep your voice front and center. Its ethical, empowering, and designed to help you create with more ease, not less authenticity.\n\n\nThe AI Marketing Platform isnt here to replace you  its here to back you up.\nThink of it as your creative assistant, not a done-for-you machine.\n\nAI can help with the heavy lifting  sorting, summarizing, repurposing  but its your voice, your insight, and your brand that make the content truly work. This platform is here to make things faster and easier, while keeping you in control.\n\n---\n\nPositioning: AI Powered Assistant\n\n---\n\n###  Best Target Users (based on your platform and homepage content)\n\n**1. Content Creators who repurpose a lot of material**  \nPodcasters, YouTubers, live streamers, and course creators who want to turn long-form content into multiple smaller pieces.\n\n**2. Virtual Assistants and Freelancers**  \nEspecially those who manage content for others. Theyll love the time-saving workflows but still want room for editing/personalization.\n\n**3. Small Business Owners with limited time or teams**  \nThey cant always afford a full marketing team, but they still want to show up consistently and professionally across platforms.\n\n**4. Community Builders / Coaches / Educators**  \nPeople who run communities (like Facebook Groups or Discords) and regularly do webinars, workshops, or write educational content.\n\n**5. Solopreneurs / Personal Brands**  \nPeople growing their brand online who want to maintain their unique tone while producing more content without burnout.\n\n---\n\n###  Keyword Suggestions (Grouped by Intent)\n\n####  High-intent / Long-tail keywords (what they might search when ready to try a solution like yours)\n\n- AI content creation assistant  \n- AI marketing assistant for small business  \n- repurpose YouTube videos to social media  \n- create marketing content from customer feedback  \n- AI to generate content ideas  \n- AI assistant for freelancers  \n- best AI tool for content repurposing  \n- summarize podcast to blog post  \n- write social media captions with AI  \n- AI-powered content templates  \n\n####  Informational keywords (to capture awareness traffic or blog post ideas)\n\n- how to repurpose video content  \n- content creation workflow with AI  \n- what is prompt marketing  \n- how to use AI for content strategy  \n- turning testimonials into marketing copy  \n- how to respond to reviews with AI  \n- AI tools for content creators 2025  \n- using AI to write blog posts ethically  \n\n####  Brand-positioning/short-tail keywords (these support general awareness and SEO tagging)\n\n- AI marketing platform  \n- content repurposing tool  \n- ethical AI assistant  \n- AI content workflow  \n- creative AI tools  \n- productivity tools for creators  \n- AI-powered marketing workflow  \n\n---\n\nLet me know if youd like blog post ideas around those keywords too  they'd fit beautifully into your content strategy and could help with SEO!	775	2025-04-25 13:28:06.548822+00	2025-04-25 13:28:06.548918+00	6f38c34a761c44d999dd7b900ca6aa28
fe10ad8c87964eefbef624f7af9c8dba	Information on pen and i publishing.pdf	729d679a-5082-403a-8b48-a7f56cb06f0b/9cce5e61-9334-4dc0-be4e-273d46a25338_Information on pen and i publishing.pdf	/media/729d679a-5082-403a-8b48-a7f56cb06f0b/9cce5e61-9334-4dc0-be4e-273d46a25338_Information on pen and i publishing.pdf	pdf	application/pdf	261812	[Content not available due to encoding issues]	2914	2025-04-22 11:22:28.018368+00	2025-04-22 11:22:28.018428+00	729d679a5082403a8b48a7f56cb06f0b
\.


--
-- Data for Name: assets_assetprocessingjob; Type: TABLE DATA; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

COPY aimarket_m3rk37tdb.assets_assetprocessingjob (id, status, error_message, attempts, last_heart_beat, created_at, updated_at, asset_id, project_id) FROM stdin;
1a781ebb74b54ff9ae2ab4556d987dc5	completed	\N	0	2025-04-25 13:28:06.554933+00	2025-04-25 13:28:06.555021+00	2025-04-25 13:28:06.555046+00	f3cce23d608d4b928f4d5d35878dd955	6f38c34a761c44d999dd7b900ca6aa28
7965ef5df4f241a49dc73578dc8ab47e	completed	\N	0	2025-04-22 12:02:03.702611+00	2025-04-22 12:02:03.70272+00	2025-04-22 12:02:03.702744+00	4ae719a6f0b84983b6f13a110d0adedc	54c1f50b67304a7b878fe8d4c3a6ca80
98cafc90ba7c406e8bf7a7d19766821a	completed	\N	0	2025-04-22 11:22:28.02476+00	2025-04-22 11:22:28.024826+00	2025-04-22 11:22:28.024844+00	fe10ad8c87964eefbef624f7af9c8dba	729d679a5082403a8b48a7f56cb06f0b
9d15cdc2584745d88232fe5ce311ed54	completed	\N	0	2025-04-25 13:27:50.421558+00	2025-04-25 13:27:50.421638+00	2025-04-25 13:27:50.421657+00	20c4254423fc4bdfb4067c3d083dbd09	6f38c34a761c44d999dd7b900ca6aa28
b83ef62b3e4246d69f8cb463dd5e14b6	completed	\N	0	2025-04-25 13:28:06.53767+00	2025-04-25 13:28:06.537727+00	2025-04-25 13:28:06.537747+00	c20ca9d37ef143a7bd0e77b27eff05a7	6f38c34a761c44d999dd7b900ca6aa28
babac6057fc545e88675aefb316b1134	completed	\N	0	2025-04-25 13:27:48.587747+00	2025-04-25 13:27:48.587815+00	2025-04-25 13:27:48.587837+00	2545dc8894c6490d9c10d012f55f3796	6f38c34a761c44d999dd7b900ca6aa28
ea26c33c511d4deca1817d09648d32ca	completed	\N	0	2025-04-22 12:14:25.121588+00	2025-04-22 12:14:25.121676+00	2025-04-22 12:14:25.121718+00	87ae69956f954c8da88eb372391ecddd	54c1f50b67304a7b878fe8d4c3a6ca80
f46a413521834f809e6ca67ff6e51e0b	completed	\N	0	2025-04-22 12:02:14.946078+00	2025-04-22 12:02:14.946143+00	2025-04-22 12:02:14.946164+00	4177f0dbce7348e283b956fb38988710	54c1f50b67304a7b878fe8d4c3a6ca80
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

COPY aimarket_m3rk37tdb.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

COPY aimarket_m3rk37tdb.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

COPY aimarket_m3rk37tdb.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add subscription	7	add_subscription
26	Can change subscription	7	change_subscription
27	Can delete subscription	7	delete_subscription
28	Can view subscription	7	view_subscription
29	Can add user profile	8	add_userprofile
30	Can change user profile	8	change_userprofile
31	Can delete user profile	8	delete_userprofile
32	Can view user profile	8	view_userprofile
33	Can add profile	9	add_profile
34	Can change profile	9	change_profile
35	Can delete profile	9	delete_profile
36	Can view profile	9	view_profile
37	Can add stripe customer	10	add_stripecustomer
38	Can change stripe customer	10	change_stripecustomer
39	Can delete stripe customer	10	delete_stripecustomer
40	Can view stripe customer	10	view_stripecustomer
41	Can add subscription	11	add_subscription
42	Can change subscription	11	change_subscription
43	Can delete subscription	11	delete_subscription
44	Can view subscription	11	view_subscription
45	Can add asset	12	add_asset
46	Can change asset	12	change_asset
47	Can delete asset	12	delete_asset
48	Can view asset	12	view_asset
49	Can add project	13	add_project
50	Can change project	13	change_project
51	Can delete project	13	delete_project
52	Can view project	13	view_project
53	Can add generated content	14	add_generatedcontent
54	Can change generated content	14	change_generatedcontent
55	Can delete generated content	14	delete_generatedcontent
56	Can view generated content	14	view_generatedcontent
57	Can add asset processing job	15	add_assetprocessingjob
58	Can change asset processing job	15	change_assetprocessingjob
59	Can delete asset processing job	15	delete_assetprocessingjob
60	Can view asset processing job	15	view_assetprocessingjob
61	Can add prompt	16	add_prompt
62	Can change prompt	16	change_prompt
63	Can delete prompt	16	delete_prompt
64	Can view prompt	16	view_prompt
65	Can add template	17	add_template
66	Can change template	17	change_template
67	Can delete template	17	delete_template
68	Can view template	17	view_template
69	Can add template prompt	18	add_templateprompt
70	Can change template prompt	18	change_templateprompt
71	Can delete template prompt	18	delete_templateprompt
72	Can view template prompt	18	view_templateprompt
73	Can add AI Configuration	19	add_aiconfig
74	Can change AI Configuration	19	change_aiconfig
75	Can delete AI Configuration	19	delete_aiconfig
76	Can view AI Configuration	19	view_aiconfig
77	Can add content generation job	20	add_contentgenerationjob
78	Can change content generation job	20	change_contentgenerationjob
79	Can delete content generation job	20	delete_contentgenerationjob
80	Can view content generation job	20	view_contentgenerationjob
81	Can add prompt	21	add_prompt
82	Can change prompt	21	change_prompt
83	Can delete prompt	21	delete_prompt
84	Can view prompt	21	view_prompt
85	Can add asset	22	add_asset
86	Can change asset	22	change_asset
87	Can delete asset	22	delete_asset
88	Can view asset	22	view_asset
89	Can add asset processing job	23	add_assetprocessingjob
90	Can change asset processing job	23	change_assetprocessingjob
91	Can delete asset processing job	23	delete_assetprocessingjob
92	Can view asset processing job	23	view_assetprocessingjob
93	Can add category	24	add_category
94	Can change category	24	change_category
95	Can delete category	24	delete_category
96	Can view category	24	view_category
97	Can add post	25	add_post
98	Can change post	25	change_post
99	Can delete post	25	delete_post
100	Can view post	25	view_post
101	Can add tag	26	add_tag
102	Can change tag	26	change_tag
103	Can delete tag	26	delete_tag
104	Can view tag	26	view_tag
105	Can add tagged item	27	add_taggeditem
106	Can change tagged item	27	change_taggeditem
107	Can delete tagged item	27	delete_taggeditem
108	Can view tagged item	27	view_taggeditem
109	Can add documentation page	28	add_documentationpage
110	Can change documentation page	28	change_documentationpage
111	Can delete documentation page	28	delete_documentationpage
112	Can view documentation page	28	view_documentationpage
113	Can add documentation category	29	add_documentationcategory
114	Can change documentation category	29	change_documentationcategory
115	Can delete documentation category	29	delete_documentationcategory
116	Can view documentation category	29	view_documentationcategory
117	Can add token usage	30	add_tokenusage
118	Can change token usage	30	change_tokenusage
119	Can delete token usage	30	delete_tokenusage
120	Can view token usage	30	view_tokenusage
121	Can add member resource	31	add_memberresource
122	Can change member resource	31	change_memberresource
123	Can delete member resource	31	delete_memberresource
124	Can view member resource	31	view_memberresource
125	Can add SEO Analysis	32	add_seoanalysis
126	Can change SEO Analysis	32	change_seoanalysis
127	Can delete SEO Analysis	32	delete_seoanalysis
128	Can view SEO Analysis	32	view_seoanalysis
129	Can add keyword tracking	33	add_keywordtracking
130	Can change keyword tracking	33	change_keywordtracking
131	Can delete keyword tracking	33	delete_keywordtracking
132	Can view keyword tracking	33	view_keywordtracking
133	Can add Contact Message	34	add_contactmessage
134	Can change Contact Message	34	change_contactmessage
135	Can delete Contact Message	34	delete_contactmessage
136	Can view Contact Message	34	view_contactmessage
137	Can add Prompt Template	35	add_prompttemplate
138	Can change Prompt Template	35	change_prompttemplate
139	Can delete Prompt Template	35	delete_prompttemplate
140	Can view Prompt Template	35	view_prompttemplate
141	Can add task result	36	add_taskresult
142	Can change task result	36	change_taskresult
143	Can delete task result	36	delete_taskresult
144	Can view task result	36	view_taskresult
145	Can add chord counter	37	add_chordcounter
146	Can change chord counter	37	change_chordcounter
147	Can delete chord counter	37	delete_chordcounter
148	Can view chord counter	37	view_chordcounter
149	Can add group result	38	add_groupresult
150	Can change group result	38	change_groupresult
151	Can delete group result	38	delete_groupresult
152	Can view group result	38	view_groupresult
153	Can add generator category	39	add_generatorcategory
154	Can change generator category	39	change_generatorcategory
155	Can delete generator category	39	delete_generatorcategory
156	Can view generator category	39	view_generatorcategory
157	Can add generator template	40	add_generatortemplate
158	Can change generator template	40	change_generatortemplate
159	Can delete generator template	40	delete_generatortemplate
160	Can view generator template	40	view_generatortemplate
161	Can add generator parameter	41	add_generatorparameter
162	Can change generator parameter	41	change_generatorparameter
163	Can delete generator parameter	41	delete_generatorparameter
164	Can view generator parameter	41	view_generatorparameter
165	Can add generated prompt	42	add_generatedprompt
166	Can change generated prompt	42	change_generatedprompt
167	Can delete generated prompt	42	delete_generatedprompt
168	Can view generated prompt	42	view_generatedprompt
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

COPY aimarket_m3rk37tdb.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$1000000$wPRBxC6fIIFBiJGgM11XVH$037wfW4qMlJ1mTuKfr7S+pd8eGJ/1ISqKy9wrST4w0Y=	\N	t	aimarket			admin@aimarketingplatform.app	t	t	2025-04-16 13:25:33.488547+00
2	pbkdf2_sha256$1000000$idSUs26fWjFgy3swFgWdJL$VN7SibT79rpIa5CWfSjoQRJsj6+5u/OUc33zNIJlSXc=	2025-05-07 21:32:39.292245+00	t	manager			admin@aimarketingplatform.app	t	t	2025-04-16 13:26:10.98716+00
3	pbkdf2_sha256$1000000$wfD04WtLYoq9cjV9RsLZpw$YT9XVtekm5VL9PbpWbCIq0XW5ggXdYOw0txcs7qoosc=	2025-04-24 21:19:16.276469+00	f	evamandy			eva@showyourspot.com	f	t	2025-04-21 16:32:17.142665+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

COPY aimarket_m3rk37tdb.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

COPY aimarket_m3rk37tdb.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: blog_category; Type: TABLE DATA; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

COPY aimarket_m3rk37tdb.blog_category (id, name, slug) FROM stdin;
1	documentation	documentation
2	Prompts	prompts
3	AI Marketing	ai-marketing
\.


--
-- Data for Name: blog_post; Type: TABLE DATA; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

COPY aimarket_m3rk37tdb.blog_post (id, title, slug, status, featured, created, updated, publish_date, content, image, external_image_url, youtube_url, thumbnail, ad_type, ad_code, ad_image, ad_url, meta_title, meta_description, meta_keywords, category_id) FROM stdin;
2	made up	made-up	draft	f	2025-04-21 17:38:07.174193+00	2025-04-21 17:38:20.492543+00	2025-04-21 17:37:41+00	<p>dd</p>	blog/images/aimarketing-dashboard.png	\N	\N		none							1
3	Difference Between Prompt Engineering and Prompt Marketing	prompt-engineering-prompt-marketing-differences	published	t	2025-04-22 15:52:23.885178+00	2025-04-23 08:19:32.521467+00	2025-04-22 15:43:19+00	<p>Since the explosion of AI, the word 'prompt' has taken on a whole new level of importance. But not all prompts are created equal &mdash; and depending on how you use them, you might be practicing prompt engineering or prompt marketing.</p>\r\n<p>These two approaches are both valuable, they work together in many cases, but they serve very different purposes. Here&rsquo;s a breakdown of what each one means, when to use them, and how they work in real-life situations.</p>\r\n<h2><strong>What is Prompt Engineering?</strong></h2>\r\n<p>Prompt engineering is the process of designing prompts that get accurate, useful, and consistent responses from an AI. This technique is especially important in software development, automation, and AI-powered apps like the AI Marketing Platform.</p>\r\n<p>The Goal: To get the AI to perform a specific task correctly and reliably.</p>\r\n<p><em><strong>Use Cases:</strong></em></p>\r\n<ul>\r\n<li>AI-powered customer support tools</li>\r\n<li>AI assistants for marketing content</li>\r\n<li>Automation in email or code generation</li>\r\n<li>AI-based tutoring or medical symptom checkers</li>\r\n</ul>\r\n<p>&nbsp;</p>\r\n<p><em><strong>Example:</strong></em></p>\r\n<p>Say you&rsquo;re building a travel planning app using ChatGPT. Here&rsquo;s a well-engineered prompt:</p>\r\n<p><em>"You are an expert travel advisor. Generate a 7-day travel itinerary for a solo female traveller in Bali. Focus on wellness, safety, and local culture. Include daily activities, recommended areas to stay, and estimated costs."</em></p>\r\n<p>This is prompt engineering because it sets the role, scope, and expectations for the AI, leading to high-quality, consistent results every time. Our AI platform has been engineered to use your own content to help with prompt engineering. It will use what you provide and turn it into content you can use in prompt marketing.</p>\r\n<h2><strong>What is Prompt Marketing?</strong></h2>\r\n<p>Prompt marketing is the use of prompts as content &mdash; designed to spark reflection, storytelling, or interaction from your audience. It&rsquo;s a creative and emotional tool, often used by content creators, influencers, and marketers.</p>\r\n<p><em><strong>The Goal:</strong></em> To get your audience to think, write, or engage.</p>\r\n<p><em><strong>Use Cases:</strong></em></p>\r\n<ul>\r\n<li>Instagram captions for self-help or journaling pages</li>\r\n<li>X (aka Twitter) engagement prompts</li>\r\n<li>Email newsletter inspiration</li>\r\n</ul>\r\n<p><br><em><strong>Example: </strong></em>Imagine you're a life coach on Instagram. You might post:</p>\r\n<p><em>&ldquo;Journal Prompt: What&rsquo;s one belief you&rsquo;ve outgrown in the past year, and how did it change your life?&rdquo;</em><br>(Add a beautiful graphic, hashtags, and a call to comment or save)</p>\r\n<p>This isn&rsquo;t for the AI &mdash; it&rsquo;s for your audience. The goal is emotional connection, reflection, and engagement. That&rsquo;s prompt marketing.</p>\r\n<p><strong>Side-by-Side Comparison</strong></p>\r\n<table style="border-collapse: collapse; width: 90.1181%; height: 134.375px;" border="1"><colgroup><col style="width: 50.0783%;"><col style="width: 49.9041%;"></colgroup>\r\n<tbody>\r\n<tr style="height: 22.3958px;">\r\n<td style="height: 22.3958px;"><strong>Prompt Engineering</strong></td>\r\n<td style="height: 22.3958px;"><strong>Prompt Marketing</strong></td>\r\n</tr>\r\n<tr style="height: 22.3958px;">\r\n<td style="height: 22.3958px;">Gets AI to do what you want &nbsp;</td>\r\n<td style="height: 22.3958px;">Gets your audience to reflect or respond</td>\r\n</tr>\r\n<tr style="height: 22.3958px;">\r\n<td style="height: 22.3958px;">Precise, instructional, role-based&nbsp; &nbsp; &nbsp;</td>\r\n<td style="height: 22.3958px;">Emotional, open-ended, relatable</td>\r\n</tr>\r\n<tr style="height: 22.3958px;">\r\n<td style="height: 22.3958px;">Used in AI tools, apps, coding projects</td>\r\n<td style="height: 22.3958px;">Used on social media, newsletters, journals</td>\r\n</tr>\r\n<tr style="height: 22.3958px;">\r\n<td style="height: 22.3958px;">Requires clarity, structure, testing</td>\r\n<td style="height: 22.3958px;">Requires empathy, creativity, timing</td>\r\n</tr>\r\n<tr style="height: 22.3958px;">\r\n<td style="height: 22.3958px;">Example: &ldquo;Write SEO meta descriptions&hellip;&rdquo;&nbsp; &nbsp; &nbsp;</td>\r\n<td style="height: 22.3958px;">Example: &ldquo;What does success look like to you?&rdquo;</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>&nbsp;</p>\r\n<p><strong>Real-Life Contexts</strong></p>\r\n<p>Prompt Engineering in Action:</p>\r\n<p>You need content for your blog. You write prompts like:</p>\r\n<p>"Write an SEO-optimized blog post outline for the keyword: 'benefits of cold showers'. Include an introduction, 5 main points, and a conclusion."</p>\r\n<p>Here, you're relying on the AI to create the content for you.</p>\r\n<p><br><strong>Prompt Marketing in Action:</strong></p>\r\n<p>You run a Facebook page for wellness. You tweet:</p>\r\n<p>"Write about a time when you chose peace over being right. What happened?" #writingprompt #selfreflection</p>\r\n<p>This gets people writing, commenting, and thinking. It&rsquo;s content for people, not the AI.</p>\r\n<h2><strong>One Source, Multiple Outcomes</strong></h2>\r\n<p>Let&rsquo;s say you upload or write a blog post in the platform about "Building Self-Trust After Burnout".</p>\r\n<p>With <strong>Prompt Engineering</strong>, you could ask the AI:</p>\r\n<p><em>&ldquo;Summarise this blog post into a Twitter thread with a reflective tone, using the voice of a mindset coach.&rdquo;</em></p>\r\n<p>With <strong>Prompt Marketing</strong>, you could generate audience-facing prompts like:</p>\r\n<p><em>&ldquo;Journal Prompt: When was the last time you trusted your instincts without second-guessing yourself?&rdquo;</em></p>\r\n<p><em>&ldquo;Instagram Caption Idea: Learning to trust yourself again isn&rsquo;t a one-time decision &mdash; it&rsquo;s a daily conversation. Save this for the next time self-doubt creeps in.&rdquo;</em></p>\r\n<p><br>With the AI Marketing Platform not only can you get it to write the SEO optimized blog for you but you can also prompt it to use that content to create your tweets, your Instagram post or an introduction you can put on LinkedIn when you link to your blog post.</p>\r\n<p><strong>Our platform was built to take advantage of both prompt engineering and prompt marketing.</strong></p>\r\n<p>Want to turn a blog post into a tweet thread?&nbsp; That&rsquo;s prompt engineering.</p>\r\n<p>Want your audience to reflect, comment, or journal?&nbsp; That&rsquo;s prompt marketing.</p>\r\n<p>Want to do both in one workflow?&nbsp; That&rsquo;s where being a member of our platform helps.</p>\r\n<p>With the AI Marketing Platform, you don&rsquo;t have to choose &mdash; you can:</p>\r\n<p><strong>Generate content with AI (engineering)</strong></p>\r\n<p><strong>Create content for your audience (marketing)</strong></p>\r\n<p>Repurpose everything into multiple formats, fast</p>\r\n<p>Try it for free at&nbsp;<a href="https://www.aimarketingplatform.app">aimarketingplatform.app</a></p>\r\n<p><br><strong>Remember...</strong></p>\r\n<p>Prompt engineering and prompt marketing are both powerful &mdash; they just serve different purposes.</p>\r\n<p><strong>Use prompt engineering</strong> when you want to use AI effectively.</p>\r\n<p><strong>Use prompt marketing</strong> when you want to connect with your audience.</p>\r\n<p>If you're a creator, coach, or entrepreneur, you might actually use both &mdash; engineering great prompts behind the scenes, and marketing with great prompts in front of your audience.</p>	blog/images/prompt-engineering-vs-prompt-marketing.png	https://aimarketingplatform.app/media/blog/images/ai-marketing-prompts-inprojects.png	\N		none							2
4	AI Marketing Platform Goes Beyond Social Media	ai-marketing-platform-goes-beyond-social-media	published	t	2025-04-22 20:51:51.32509+00	2025-04-22 20:55:23.330933+00	2025-04-12 20:36:58+00	<p>The AI Marketing Platform is not just a great tool for creating content for your social media pages. It can go above and beyond in terms of content marketing. Here are a few other ways you can use the platform to support your business:</p>\r\n<p><em><strong>Customer Feedback to Content Gold</strong></em><br>Upload your customer reviews, survey responses, or support tickets&mdash;and let the platform turn them into marketing claims, summaries, and copy using your customer&rsquo;s own words. You can turn real customer language into powerful, data-driven marketing claims, helping you craft messaging that truly resonates because it&rsquo;s based on what your audience is actually saying.<br>&nbsp;<br><em><strong>Save time:</strong></em> No more manually hunting for trends.<br><em><strong>Why it helps: </strong></em>Create authentic, data-backed messaging that resonates.</p>\r\n<p><strong>Turn Testimonials into Marketing Tools</strong><br>Take long-winded customer feedback (after gaining their permission of course!) and condense it into sharp, versatile testimonials&mdash;ideal for your website, landing pages, and social media.</p>\r\n<p><em><strong>Save time:</strong></em> Skip the editing headache.<br><em><strong>Why it helps:</strong></em> You turn genuine praise into persuasive proof.</p>\r\n<p><strong>Generate Review Responses with Ease</strong><br>Got reviews piling up on Google, Trustpilot, or Facebook? Feed them into your dashboard and instantly get personalized, professional responses tailored by sentiment (e.g., 1-star vs. 5-star). Whether you&rsquo;re dealing with a 1-star complaint or a glowing 5-star review, you&rsquo;ll get tiered response strategies to address each appropriately. This helps you maintain a professional, empathetic, and consistent voice across all your review platforms&mdash;saving you time and protecting your brand reputation.</p>\r\n<p><em><strong>Save time: </strong></em>Say goodbye to writer&rsquo;s block. Eliminate the need to write custom responses for every review&mdash;especially during high-volume periods.<br><em><strong>Why it helps: </strong></em>Protect your reputation while showing customers they&rsquo;re heard.</p>\r\n<p><strong>Activate Your Community</strong><br>Generate discussion prompts, highlight summaries, and recap emails for your Reddit, Discord, or Facebook groups.<br><br><em><strong>Save time:</strong></em> One weekly prompt = engaged community.<br><em><strong>Why it helps:</strong></em> Keep conversations going without hiring a community manager.</p>\r\n<p><strong>Onboarding Made Simple</strong><br>Upload your onboarding scripts or playbooks. Instantly create emails, walkthroughs, or checklists tailored to each customer segment. This is how we managed to create all of our onboarding content. Nice and fast. Nice and simple.<br><br><em><strong>Save time:&nbsp;</strong></em>Reuse the same content structure across segments.<br><em><strong>Why it helps:</strong></em> Make customers feel seen, fast.</p>\r\n<p><strong>Uncover Product Development Insights</strong><br>Your customers are giving you a roadmap&mdash;you just need to listen. The platform helps you spot recurring feature requests and pain points, then turns them into product priorities and customer messaging.</p>\r\n<p><em><strong>Save time:</strong></em> Get summarized insights from pages of feedback.<br><em><strong>Why it helps:</strong></em> Build what people actually want&mdash;and tell them you did.</p>\r\n<p><strong>Effortless Event and Webinar Follow-Ups</strong><br>Upload your webinar transcripts or recordings. You&rsquo;ll get follow-up emails, blog posts, thank-you messages, and social media clips in minutes.&nbsp;</p>\r\n<p><em><strong>Save time:</strong></em> One event = a week of content.<br><em><strong>Why it helps:</strong></em> Extend your event&rsquo;s shelf life and engage your audience post-event.</p>\r\n<p><strong>Crisis Comms You Can Trust</strong><br>Whether it's industry news, bad PR, or an internal mishap&mdash;upload the context and get tiered responses, FAQs, and staff talking points.</p>\r\n<p><em><strong>Save time:</strong></em> Crisis response in minutes, not days.<br><em><strong>Why it helps: </strong></em>Stay proactive and professional when it matters most.</p>\r\n<p><strong>Sales Enablement Assets from Real Data</strong><br>Upload sales calls, demos, or discovery meeting transcripts. Get objection-handling scripts and follow-up email sequences tailored to the customer&rsquo;s concerns.<br><br><em><strong>Save time:&nbsp;</strong></em>Prep your sales team without hours of note-taking.<br><em><strong>Why it helps:</strong></em> Close more deals with messaging that sticks.</p>\r\n<p><strong>Supercharge Internal Communications</strong><br>Got complex internal updates or announcements? Let the platform turn them into digestible, department-specific messages and engaging internal newsletter content.</p>\r\n<p><em><strong>Save time:</strong></em> One message, multiple versions.<br><em><strong>Why it helps:</strong></em> Ensure alignment without overwhelming your team.</p>\r\n<p><strong>Partner &amp; Affiliate Marketing Kits<br></strong>Create pre-made email templates, banner ads, and landing page content that affiliates or partners can customize and deploy.<br><br><em><strong>Save time: </strong></em>One-click toolkits instead of back-and-forth emails.<br><em><strong>Why it helps:</strong></em> Empower your partners to promote you better.</p>\r\n<p><strong>Knowledge Base Automation</strong><br>Feed support tickets and FAQs into the platform and let it generate step-by-step help articles, video scripts, and chatbot replies.<br><br><em><strong>Save time:</strong></em> From tickets to docs in a few clicks.<br><em><strong>Why it helps:</strong></em> Help your customers help themselves.</p>\r\n<p>So. If you have only been using the AI Marketing Platform to send out social media content - that's great - but it is good to know it can be used for so much more.</p>	blog/images/ai-marketing-platform-ways-to-use.png	\N	\N		none							3
\.


--
-- Data for Name: content_generation_aiconfig; Type: TABLE DATA; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

COPY aimarket_m3rk37tdb.content_generation_aiconfig (id, name, model_name, fallback_model, temperature, max_tokens, is_active) FROM stdin;
756fc5d0d9cd426889b6d1185642e6b5	Default Config	gpt-4o	gpt-4o-mini	0.7	4000	t
\.


--
-- Data for Name: content_generation_contentgenerationjob; Type: TABLE DATA; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

COPY aimarket_m3rk37tdb.content_generation_contentgenerationjob (id, status, started_at, completed_at, prompts_total, prompts_completed, error_message, project_id, user_id) FROM stdin;
04af43df78b7407fa01a6ca1684917da	completed	2025-04-24 16:47:07.663598+00	2025-04-24 16:48:01.43319+00	2	1	\N	729d679a5082403a8b48a7f56cb06f0b	3
1407fc84357548a8bab37a1757559448	completed	2025-04-25 13:48:28.301442+00	2025-04-25 13:49:30.341303+00	2	1	\N	6f38c34a761c44d999dd7b900ca6aa28	2
177a5d1798b24a13873014236f6d697b	completed	2025-04-24 11:46:42.458793+00	2025-04-24 11:47:22.490463+00	2	1	\N	729d679a5082403a8b48a7f56cb06f0b	3
8dcee30f84c946718dc4f0fd45893639	completed	2025-04-25 13:57:44.073726+00	2025-04-25 13:58:18.108203+00	1	1	\N	6f38c34a761c44d999dd7b900ca6aa28	2
d8d41fd955f748d68673e8c23f30fe69	completed	2025-04-24 17:03:47.192305+00	2025-04-24 17:04:33.235846+00	3	3	\N	54c1f50b67304a7b878fe8d4c3a6ca80	2
\.


--
-- Data for Name: content_generation_prompttemplate; Type: TABLE DATA; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

COPY aimarket_m3rk37tdb.content_generation_prompttemplate (id, name, content_type, system_prompt, description, is_active, is_default, created_at, updated_at, user_id) FROM stdin;
6137c74d1ed640ca80e656e4ed8eb3df	Email Marketing	email	You are a professional email marketing specialist with expertise in creating engaging, effective email content.\n\nYour task is to create email content that follows these guidelines:\n1. Create a compelling subject line when requested\n2. Begin with a personalized, attention-grabbing opening\n3. Keep content concise and scannable with short paragraphs\n4. Use a clear structure with logical flow from introduction to call-to-action\n5. Include a specific, compelling call-to-action\n6. Maintain a consistent tone that matches the brand voice specified\n7. Use formatting (bold, italic, bullet points) judiciously to highlight key points\n8. Maintain the specific style or tone requested in the prompt\n\nFor email structure:\n- Compelling subject line (when requested)\n- Personalized greeting\n- Opening hook that states the value\n- Main content broken into scannable sections\n- Clear call-to-action\n- Professional sign-off\n\nCreate content that encourages opens, reads, and the desired conversion action.\n	Template optimized for email marketing content	t	t	2025-04-25 20:31:10.589198+00	2025-04-25 20:31:10.589286+00	\N
64d77127cea64f628cca2f91db6b631f	Blog Post	blog	You are a professional blog content creator with expertise in creating engaging, informative blog posts.\n\nYour task is to create a well-structured blog post that follows these guidelines:\n1. Begin with an attention-grabbing introduction that presents the main topic\n2. Include a clear structure with proper headings and subheadings (use markdown # and ## syntax)\n3. Break content into digestible paragraphs (5-6 sentences maximum per paragraph)\n4. Use a conversational yet authoritative tone that engages readers\n5. Include relevant examples, data points, or anecdotes to support main points\n6. Conclude with a summary and call-to-action where appropriate\n7. Format content using proper markdown for readability\n8. Maintain the specific style or tone requested in the prompt\n\nFor blog post structure:\n- Use # for the main title\n- Use ## for main section headings\n- Use ### for subsections\n- Break up text with bullet points or numbered lists where appropriate\n- Aim for a comprehensive yet concise article that delivers value to the reader\n\nAlways maintain a professional, clear writing style while keeping the reader engaged.\n	Template optimized for blog post creation	t	t	2025-04-25 20:31:10.5772+00	2025-04-25 20:31:10.577276+00	\N
89344a3d19d044d3ae9cd0f6de2f16f9	General Content	general	You are a professional content generation assistant with expertise in marketing and communication. \n    \nYour tasks include:\n1. Produce high-quality, well-structured content based on the user's instructions\n2. Use proper formatting with Markdown syntax\n3. Always include appropriate headings, paragraphs, and lists\n4. Create content that sounds natural, professional, and engaging\n5. Format titles with # or ## syntax rather than using hashtags in the text\n6. Ensure content has proper spacing and organization\n7. Never use emojis in your responses\n8. Always maintain the specific style or tone requested in the prompt\n\nFor titles and headings:\n- Use # For main titles\n- Use ## For section headings \n- Use ### For subsection headings\n\nFor formatting:\n- Use line breaks between paragraphs\n- Use bullet points (* or -) for lists\n- Use numbered lists (1. 2. 3.) for sequential steps\n- Use **bold** for emphasis\n- Use *italic* for subtle emphasis\n\nAlways maintain a professional, clear writing style unless otherwise specified.\n	Default template for general content creation	t	t	2025-04-25 20:31:10.571708+00	2025-04-25 20:31:10.571787+00	\N
f890701fe1474de3a941c9d0565a7d66	Social Media	social	You are a professional social media content creator with expertise in creating engaging, concise social posts.\n\nYour task is to create compelling social media content that follows these guidelines:\n1. Keep content brief, engaging, and to the point\n2. Create content that's appropriate for the specified platform (Twitter/X, Instagram, LinkedIn, Facebook, etc.)\n3. Use a conversational, authentic tone that encourages engagement \n4. Include engaging hooks and calls-to-action where appropriate\n5. Suggest relevant hashtags when requested\n6. Format content appropriately for the specified platform's constraints\n7. Maintain the specific style or tone requested in the prompt\n\nFor social media best practices:\n- Twitter/X: 280 characters max, use hashtags sparingly, focus on concise messaging\n- Instagram: Visual-focused captions, more liberal use of hashtags, casual tone often works well\n- LinkedIn: Professional tone, industry insights, longer-form content acceptable\n- Facebook: Conversational, community-focused, questions and engagement drivers work well\n\nCreate content that will stand out in crowded feeds while delivering value to the audience.\n	Template optimized for social media content	t	t	2025-04-25 20:31:10.583315+00	2025-04-25 20:31:10.583391+00	\N
\.


--
-- Data for Name: content_templates_template; Type: TABLE DATA; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

COPY aimarket_m3rk37tdb.content_templates_template (id, title, created_at, updated_at, user_id, keywords, description) FROM stdin;
86a5d851fc4241d09dc307b8102503a6	Monthly Messages	2025-04-22 13:50:07.313119+00	2025-04-22 13:50:07.31319+00	3		monthly social media messages
d310a10c351f4665a781beaf94b3f448	Regular Pen And I Content	2025-04-19 15:31:02.356194+00	2025-04-19 15:31:02.356303+00	2	journal prompts, memoir prompts	Social media content for pen and i publishing
\.


--
-- Data for Name: content_templates_templateprompt; Type: TABLE DATA; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

COPY aimarket_m3rk37tdb.content_templates_templateprompt (id, name, prompt, token_count, "order", created_at, updated_at, template_id) FROM stdin;
22fe4ca1a4254a97839d23017f80c413	Memoir Writing Prompt	Give me 2 creative memoir writing prompts with a theme of healing and growth that are short and engaging enough to share on Instagram and X or Twitter. They should inspire self-reflection and personal storytelling, and each should be under 280 characters.	49	0	2025-04-22 14:03:55.822038+00	2025-04-22 18:10:39.37132+00	86a5d851fc4241d09dc307b8102503a6
3781086ff0ea4933a23c80104b3d7694	is it showing	yes or no	3	0	2025-04-22 18:04:59.245048+00	2025-04-22 18:05:58.467051+00	d310a10c351f4665a781beaf94b3f448
528304e077bd40e289842a0f92095024	Monthly Travel Prompt	You are an expert travel advisor. Generate a 7-day travel itinerary for a solo female traveller in Bali. Focus on wellness, safety, and local culture. Include daily activities, recommended areas to stay, and estimated costs. Keep activities to mainly outdoors as she loves walking and water activities. Add a few things to do with friends as she will be meeting friends out in Bali. What do you recommend.	81	2	2025-04-22 18:14:15.608502+00	2025-04-22 18:14:15.608575+00	86a5d851fc4241d09dc307b8102503a6
9f0ad5fc8d5241d989bf3d98cfff6760	Monthly Motivational Messages	Give me 3 unique journal prompts and 3 creative memoir writing prompts that are short and engaging enough to share on Instagram and X or Twitter. They should inspire self-reflection and personal storytelling, and each should be under 280 characters.	49	1	2025-04-22 14:01:15.649719+00	2025-04-22 18:10:39.375461+00	86a5d851fc4241d09dc307b8102503a6
\.


--
-- Data for Name: core_contactmessage; Type: TABLE DATA; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

COPY aimarket_m3rk37tdb.core_contactmessage (id, first_name, subject, message, created_at, is_read, status, user_id) FROM stdin;
\.


--
-- Data for Name: core_tag; Type: TABLE DATA; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

COPY aimarket_m3rk37tdb.core_tag (id, name, user_id) FROM stdin;
5bd71b241d1c4667a016192803061925	AIM platform	2
7e742b563d164090ac5fcbb263787b42	journal prompts	2
6bb686f8cb0146119e98b4353e31b651	journal writing	2
d870bf15518445789056dc50607587f3	journal writing	3
c2c29e44e52449c885c9c96977f0fb6a	memoir prompts	2
535bafe6f79d4dce87bc358910060d18	memoir writing	3
db0293c03f84469894309a3b7782048a	monthly messages	3
1392c0a79e31417aa3f12db21f291868	Pen And I	3
9619159fca164e4fb59572687a778dfb	prompt writing tips	2
6103a101f0cc4c47a93d091b87d37587	smith	3
c1b2c296db544d5590072b85fa966d26	strategy	2
329c424c9cf140b4b550505da9598dc9	test	2
\.


--
-- Data for Name: core_taggeditem; Type: TABLE DATA; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

COPY aimarket_m3rk37tdb.core_taggeditem (id, object_id, content_type_id, tag_id) FROM stdin;
1c9e2a74396142e8a209ceff21abb23a	729d679a5082403a8b48a7f56cb06f0b	13	1392c0a79e31417aa3f12db21f291868
59837454397e4253a9adfb8d9fd021de	54c1f50b67304a7b878fe8d4c3a6ca80	13	329c424c9cf140b4b550505da9598dc9
0401c22c4aa74f0f94c522a9072bbabd	729d679a5082403a8b48a7f56cb06f0b	13	535bafe6f79d4dce87bc358910060d18
be86204cb8944e9caa8bdffb119a02c7	6f38c34a761c44d999dd7b900ca6aa28	13	5bd71b241d1c4667a016192803061925
75012a3f334941dfa2f653eb9217a1c2	8b7a930135a1489f87535ba303971483	13	6103a101f0cc4c47a93d091b87d37587
8f77692d9367401f88add5ae58d26ed6	d310a10c351f4665a781beaf94b3f448	17	7e742b563d164090ac5fcbb263787b42
ebc298d1b4b74711932245c6f9c861a5	6f38c34a761c44d999dd7b900ca6aa28	13	c1b2c296db544d5590072b85fa966d26
819bce57c3754ef8b6714a43223975d0	d310a10c351f4665a781beaf94b3f448	17	c2c29e44e52449c885c9c96977f0fb6a
ee25d99073af424996ffca239d00c3f5	729d679a5082403a8b48a7f56cb06f0b	13	d870bf15518445789056dc50607587f3
2ecb9cdea8574bf1a2745dfe53175762	86a5d851fc4241d09dc307b8102503a6	17	db0293c03f84469894309a3b7782048a
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

COPY aimarket_m3rk37tdb.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2025-04-16 13:32:17.669209+00	1	documentation	1	[{"added": {}}]	24	2
2	2025-04-18 17:46:15.627243+00	1	Adding A Blog Post	1	[{"added": {}}]	25	2
3	2025-04-21 10:57:33.486905+00	1	manager's Profile	1	[{"added": {}}]	9	2
4	2025-04-21 10:59:31.495988+00	89554f8e-e65c-44de-94db-e23ac7d5f02c	getting-started	1	[{"added": {}}]	29	2
5	2025-04-21 11:00:19.269248+00	5b3b1e62-2f0d-44a8-b40b-d577d22c5e9f	Creating Templates	1	[{"added": {}}]	29	2
6	2025-04-21 11:00:37.819723+00	f835e705-915e-49fd-9371-55389909a30c	Creating Projects	1	[{"added": {}}]	29	2
7	2025-04-21 11:00:56.916381+00	89554f8e-e65c-44de-94db-e23ac7d5f02c	Getting Started	2	[{"changed": {"fields": ["Name"]}}]	29	2
8	2025-04-21 11:01:05.949943+00	f835e705-915e-49fd-9371-55389909a30c	Creating Projects	2	[{"changed": {"fields": ["Order"]}}]	29	2
9	2025-04-21 11:01:05.969892+00	5b3b1e62-2f0d-44a8-b40b-d577d22c5e9f	Creating Templates	2	[{"changed": {"fields": ["Order"]}}]	29	2
10	2025-04-21 11:02:03.974017+00	dce632d0-6026-4be8-8083-9d654608dd1a	Creating Prompts	1	[{"added": {}}]	29	2
11	2025-04-21 11:02:17.759555+00	1a325f50-35c4-478b-abc3-c1f2b3d2f12c	Export Content	1	[{"added": {}}]	29	2
12	2025-04-21 11:02:29.309257+00	dce632d0-6026-4be8-8083-9d654608dd1a	Creating Prompts	2	[{"changed": {"fields": ["Order"]}}]	29	2
13	2025-04-21 11:02:29.313199+00	1a325f50-35c4-478b-abc3-c1f2b3d2f12c	Export Content	2	[{"changed": {"fields": ["Order"]}}]	29	2
14	2025-04-21 11:05:12.211233+00	67ddcf16-d0e0-4e6d-9db7-0004ee6f5795	Uploading Content	1	[{"added": {}}]	29	2
15	2025-04-21 11:06:28.809972+00	dce632d0-6026-4be8-8083-9d654608dd1a	Creating Prompts	2	[{"changed": {"fields": ["Order"]}}]	29	2
16	2025-04-21 11:06:28.846409+00	1a325f50-35c4-478b-abc3-c1f2b3d2f12c	Export Content	2	[{"changed": {"fields": ["Order"]}}]	29	2
17	2025-04-21 11:07:11.548996+00	1a325f50-35c4-478b-abc3-c1f2b3d2f12c	Generate Content	2	[{"changed": {"fields": ["Name", "Slug"]}}]	29	2
18	2025-04-21 11:08:32.280161+00	ba785eb2-6c72-4cb4-91d5-82d0739f2ba9	AI Marketing Platform Docs	1	[{"added": {}}]	29	2
19	2025-04-21 11:08:48.049035+00	89554f8e-e65c-44de-94db-e23ac7d5f02c	Getting Started	2	[{"changed": {"fields": ["Order"]}}]	29	2
20	2025-04-21 11:08:48.088335+00	5b3b1e62-2f0d-44a8-b40b-d577d22c5e9f	Creating Templates	2	[{"changed": {"fields": ["Order"]}}]	29	2
21	2025-04-21 11:08:48.102692+00	f835e705-915e-49fd-9371-55389909a30c	Creating Projects	2	[{"changed": {"fields": ["Order"]}}]	29	2
22	2025-04-21 11:08:48.112069+00	67ddcf16-d0e0-4e6d-9db7-0004ee6f5795	Uploading Content	2	[{"changed": {"fields": ["Order"]}}]	29	2
23	2025-04-21 11:08:48.12281+00	dce632d0-6026-4be8-8083-9d654608dd1a	Creating Prompts	2	[{"changed": {"fields": ["Order"]}}]	29	2
24	2025-04-21 11:08:48.152131+00	1a325f50-35c4-478b-abc3-c1f2b3d2f12c	Generate Content	2	[{"changed": {"fields": ["Order"]}}]	29	2
25	2025-04-21 11:11:12.154992+00	281807ac-a4e8-4cc0-9929-d6981c06c946	Susbscriptions	1	[{"added": {}}]	29	2
26	2025-04-21 11:52:19.623223+00	3203fe55-677e-479a-9a50-9ea94c5525ad	What Is AI Marketing Platform?	1	[{"added": {}}]	28	2
27	2025-04-21 16:24:06.828374+00	3203fe55-677e-479a-9a50-9ea94c5525ad	What Is AI Marketing Platform?	2	[{"changed": {"fields": ["Content"]}}]	28	2
28	2025-04-21 16:28:15.995964+00	783a8b82-d3b6-43b4-9362-ae46f9fdb1a6	Getting Started with AI Marketing Platform	1	[{"added": {}}]	28	2
29	2025-04-21 17:38:07.182429+00	2	made up	1	[{"added": {}}]	25	2
30	2025-04-21 17:38:20.498678+00	2	made up	2	[{"changed": {"fields": ["Image"]}}]	25	2
31	2025-04-21 17:40:07.013196+00	783a8b82-d3b6-43b4-9362-ae46f9fdb1a6	Getting Started with AI Marketing Platform	2	[{"changed": {"fields": ["Content"]}}]	28	2
32	2025-04-21 18:15:41.435588+00	783a8b82-d3b6-43b4-9362-ae46f9fdb1a6	Getting Started with AI Marketing Platform	2	[{"changed": {"fields": ["Content"]}}]	28	2
33	2025-04-22 07:24:29.978087+00	783a8b82-d3b6-43b4-9362-ae46f9fdb1a6	Getting Started with AI Marketing Platform	2	[{"changed": {"fields": ["Content"]}}]	28	2
34	2025-04-22 07:26:45.727204+00	783a8b82-d3b6-43b4-9362-ae46f9fdb1a6	Getting Started with AI Marketing Platform	2	[{"changed": {"fields": ["Content"]}}]	28	2
35	2025-04-22 10:58:37.065952+00	783a8b82-d3b6-43b4-9362-ae46f9fdb1a6	Getting Started with AI Marketing Platform	2	[{"changed": {"fields": ["Content"]}}]	28	2
36	2025-04-22 11:10:15.221028+00	783a8b82-d3b6-43b4-9362-ae46f9fdb1a6	Getting Started with AI Marketing Platform	2	[]	28	2
37	2025-04-22 11:29:23.367676+00	2110b809-98e5-4c90-83c4-eb6fa8908713	Uploading Content to AI Marketing Platform	1	[{"added": {}}]	28	2
38	2025-04-22 11:42:53.972075+00	2110b809-98e5-4c90-83c4-eb6fa8908713	Uploading Content to AI Marketing Platform	2	[{"changed": {"fields": ["Content", "Order"]}}]	28	2
39	2025-04-22 12:53:54.336593+00	96c2fef2-30d2-47e6-87d7-29fd4a3e3ecf	Update Your Profile	1	[{"added": {}}]	28	2
40	2025-04-22 12:54:10.454151+00	2110b809-98e5-4c90-83c4-eb6fa8908713	Uploading Content to AI Marketing Platform	2	[{"changed": {"fields": ["Category"]}}]	28	2
41	2025-04-22 12:54:23.173209+00	783a8b82-d3b6-43b4-9362-ae46f9fdb1a6	Getting Started with AI Marketing Platform	2	[{"changed": {"fields": ["Category"]}}]	28	2
42	2025-04-22 13:35:59.666046+00	96c2fef2-30d2-47e6-87d7-29fd4a3e3ecf	Update Your Profile	2	[{"changed": {"fields": ["Content"]}}]	28	2
43	2025-04-22 14:10:24.35084+00	73029db1-c3d0-4c8e-9eed-3374cce53630	Adding Effective Prompts	1	[{"added": {}}]	28	2
44	2025-04-22 14:25:47.427635+00	73029db1-c3d0-4c8e-9eed-3374cce53630	Adding Effective Prompts	2	[{"changed": {"fields": ["Content"]}}]	28	2
45	2025-04-22 14:26:13.220248+00	2110b809-98e5-4c90-83c4-eb6fa8908713	Uploading Content to AI Marketing Platform	2	[{"changed": {"fields": ["Order"]}}]	28	2
46	2025-04-22 14:26:21.063701+00	783a8b82-d3b6-43b4-9362-ae46f9fdb1a6	Getting Started with AI Marketing Platform	2	[{"changed": {"fields": ["Order"]}}]	28	2
47	2025-04-22 14:26:21.069263+00	2110b809-98e5-4c90-83c4-eb6fa8908713	Uploading Content to AI Marketing Platform	2	[{"changed": {"fields": ["Order"]}}]	28	2
48	2025-04-22 14:36:44.267784+00	22fe4ca1-a425-4a97-839d-23017f80c413	Memoir Writing Prompt	2	[]	18	2
49	2025-04-22 14:36:53.703386+00	9f0ad5fc-8d52-41d9-89bf-3d98cfff6760	Monthly Motivational Messages	2	[{"changed": {"fields": ["Prompt"]}}]	18	2
50	2025-04-22 14:39:57.714352+00	8579cf19-7e20-4767-a49b-852ed0346469	Managing Prompts	1	[{"added": {}}]	28	2
51	2025-04-22 14:43:18.36609+00	3f6fd407-9001-4cf8-a035-c31c8a9f946d	Writing Effective Prompts	1	[{"added": {}}]	28	2
52	2025-04-22 14:44:52.290078+00	3f6fd407-9001-4cf8-a035-c31c8a9f946d	Writing Effective Prompts	2	[{"changed": {"fields": ["Content"]}}]	28	2
53	2025-04-22 14:45:06.461184+00	3f6fd407-9001-4cf8-a035-c31c8a9f946d	Writing Effective Prompts	2	[{"changed": {"fields": ["Content"]}}]	28	2
54	2025-04-22 14:46:36.186885+00	73029db1-c3d0-4c8e-9eed-3374cce53630	Adding Prompts	2	[{"changed": {"fields": ["Title", "Slug", "Content"]}}]	28	2
55	2025-04-22 14:47:12.524861+00	73029db1-c3d0-4c8e-9eed-3374cce53630	Adding Prompts	2	[{"changed": {"fields": ["Content"]}}]	28	2
56	2025-04-22 14:50:20.401605+00	8579cf19-7e20-4767-a49b-852ed0346469	Managing Prompts	2	[{"changed": {"fields": ["Content"]}}]	28	2
57	2025-04-22 14:56:59.386929+00	3f6fd407-9001-4cf8-a035-c31c8a9f946d	Writing Effective Prompts	2	[{"changed": {"fields": ["Content"]}}]	28	2
58	2025-04-22 15:43:10.042099+00	2	Prompts	1	[{"added": {}}]	24	2
59	2025-04-22 15:52:23.892059+00	3	Difference Between Prompt Engineering and Prompt Marketing	1	[{"added": {}}]	25	2
60	2025-04-22 15:52:54.257532+00	1	Adding A Blog Post	3		25	2
61	2025-04-22 20:11:09.840838+00	3	Difference Between Prompt Engineering and Prompt Marketing	2	[{"changed": {"fields": ["Status", "Blog Content"]}}]	25	2
62	2025-04-22 20:13:33.636993+00	3	Difference Between Prompt Engineering and Prompt Marketing	2	[{"changed": {"fields": ["External image url"]}}]	25	2
63	2025-04-22 20:15:59.731431+00	3	Difference Between Prompt Engineering and Prompt Marketing	2	[{"changed": {"fields": ["Blog Content"]}}]	25	2
64	2025-04-22 20:19:33.881911+00	3	Difference Between Prompt Engineering and Prompt Marketing	2	[{"changed": {"fields": ["Blog Content"]}}]	25	2
65	2025-04-22 20:20:11.428263+00	3	Difference Between Prompt Engineering and Prompt Marketing	2	[{"changed": {"fields": ["Blog Content"]}}]	25	2
66	2025-04-22 20:36:48.745154+00	3	AI Marketing	1	[{"added": {}}]	24	2
67	2025-04-22 20:51:51.332921+00	4	AI Marketing Platform Goes Beyond Social Media	1	[{"added": {}}]	25	2
68	2025-04-22 20:55:23.339419+00	4	AI Marketing Platform Goes Beyond Social Media	2	[{"changed": {"fields": ["Image"]}}]	25	2
69	2025-04-22 20:55:47.594446+00	3	Difference Between Prompt Engineering and Prompt Marketing	2	[{"changed": {"fields": ["Image"]}}]	25	2
70	2025-04-23 08:19:32.528362+00	3	Difference Between Prompt Engineering and Prompt Marketing	2	[{"changed": {"fields": ["Slug"]}}]	25	2
71	2025-04-23 09:26:48.28221+00	96c2fef2-30d2-47e6-87d7-29fd4a3e3ecf	Update Your Profile	2	[{"changed": {"fields": ["Order"]}}]	28	2
72	2025-04-23 09:31:42.696482+00	73029db1-c3d0-4c8e-9eed-3374cce53630	Adding Prompts	2	[{"changed": {"fields": ["Order"]}}]	28	2
73	2025-04-23 09:31:42.701059+00	3f6fd407-9001-4cf8-a035-c31c8a9f946d	Writing Effective Prompts	2	[{"changed": {"fields": ["Order"]}}]	28	2
74	2025-04-24 06:31:14.492755+00	1	Testing Downlaod	1	[{"added": {}}]	31	2
75	2025-04-24 11:03:09.990505+00	281807ac-a4e8-4cc0-9929-d6981c06c946	Subscriptions	2	[{"changed": {"fields": ["Name", "Slug"]}}]	29	2
76	2025-04-24 11:31:59.831166+00	9b169283-2ac2-4996-b3c5-01e630e356f6	Subscriptions	1	[{"added": {}}]	28	2
77	2025-04-24 11:42:19.437827+00	9b169283-2ac2-4996-b3c5-01e630e356f6	Subscriptions	2	[{"changed": {"fields": ["Content"]}}]	28	2
78	2025-04-24 12:10:59.521808+00	53ccbc40-4c4f-47c9-a59b-6fca126532ea	Generate Content	1	[{"added": {}}]	28	2
79	2025-04-24 12:20:09.214647+00	ab10f591-7567-4af3-924d-dce3c9253ca5	Content Inspector Tool	1	[{"added": {}}]	28	2
80	2025-04-24 12:24:45.837279+00	7eac3a6c-92d7-4087-99c5-b58af822d8f0	Example Prompt Techniques	1	[{"added": {}}]	28	2
81	2025-04-24 12:29:28.269535+00	5bf4d264-d563-4c03-82ac-c9d12b36c301	Best Practices	1	[{"added": {}}]	28	2
82	2025-04-24 12:30:03.656722+00	7eac3a6c-92d7-4087-99c5-b58af822d8f0	Example Prompt Techniques	2	[{"changed": {"fields": ["Order"]}}]	28	2
83	2025-04-24 12:30:03.680603+00	ab10f591-7567-4af3-924d-dce3c9253ca5	Content Inspector Tool	2	[{"changed": {"fields": ["Order"]}}]	28	2
84	2025-04-24 12:39:23.243571+00	9b169283-2ac2-4996-b3c5-01e630e356f6	Subscriptions	2	[{"changed": {"fields": ["Content"]}}]	28	2
85	2025-04-24 12:39:54.440689+00	9b169283-2ac2-4996-b3c5-01e630e356f6	Subscriptions	2	[{"changed": {"fields": ["Content"]}}]	28	2
86	2025-04-24 13:01:55.073393+00	53ccbc40-4c4f-47c9-a59b-6fca126532ea	Generate Content	2	[{"changed": {"fields": ["Content"]}}]	28	2
87	2025-04-24 13:13:21.195127+00	53ccbc40-4c4f-47c9-a59b-6fca126532ea	Generate Content	2	[]	28	2
88	2025-04-24 14:05:07.684569+00	3	aimarket's Profile	1	[{"added": {}}]	9	2
89	2025-04-24 16:44:12.039862+00	53ccbc40-4c4f-47c9-a59b-6fca126532ea	Generate Content	2	[{"changed": {"fields": ["Content"]}}]	28	2
\.


--
-- Data for Name: django_celery_results_chordcounter; Type: TABLE DATA; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

COPY aimarket_m3rk37tdb.django_celery_results_chordcounter (id, group_id, sub_tasks, count) FROM stdin;
\.


--
-- Data for Name: django_celery_results_groupresult; Type: TABLE DATA; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

COPY aimarket_m3rk37tdb.django_celery_results_groupresult (id, group_id, date_created, date_done, content_type, content_encoding, result) FROM stdin;
\.


--
-- Data for Name: django_celery_results_taskresult; Type: TABLE DATA; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

COPY aimarket_m3rk37tdb.django_celery_results_taskresult (id, task_id, status, content_type, content_encoding, result, date_done, traceback, meta, task_args, task_kwargs, task_name, worker, date_created, periodic_task_name, date_started) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

COPY aimarket_m3rk37tdb.django_content_type (id, app_label, model) FROM stdin;
31	accounts	memberresource
9	accounts	profile
10	accounts	stripecustomer
11	accounts	subscription
30	accounts	tokenusage
1	admin	logentry
22	assets	asset
23	assets	assetprocessingjob
3	auth	group
2	auth	permission
4	auth	user
24	blog	category
25	blog	post
5	contenttypes	contenttype
19	content_generation	aiconfig
20	content_generation	contentgenerationjob
35	content_generation	prompttemplate
17	content_templates	template
18	content_templates	templateprompt
34	core	contactmessage
26	core	tag
27	core	taggeditem
37	django_celery_results	chordcounter
38	django_celery_results	groupresult
36	django_celery_results	taskresult
29	docs	documentationcategory
28	docs	documentationpage
12	projects	asset
15	projects	assetprocessingjob
14	projects	generatedcontent
13	projects	project
16	projects	prompt
21	prompts	prompt
42	prompt_generator	generatedprompt
39	prompt_generator	generatorcategory
41	prompt_generator	generatorparameter
40	prompt_generator	generatortemplate
33	seo_optimization	keywordtracking
32	seo_optimization	seoanalysis
6	sessions	session
7	subscriptions	subscription
8	subscriptions	userprofile
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

COPY aimarket_m3rk37tdb.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2025-04-16 13:21:49.194216+00
2	auth	0001_initial	2025-04-16 13:21:49.995765+00
3	accounts	0001_initial	2025-04-16 13:21:50.450583+00
4	admin	0001_initial	2025-04-16 13:21:50.679005+00
5	admin	0002_logentry_remove_auto_add	2025-04-16 13:21:50.703476+00
6	admin	0003_logentry_add_action_flag_choices	2025-04-16 13:21:50.726268+00
7	projects	0001_initial	2025-04-16 13:21:51.460314+00
8	assets	0001_initial	2025-04-16 13:21:51.78703+00
9	assets	0002_alter_asset_file_type_alter_asset_file_url_and_more	2025-04-16 13:21:51.946253+00
10	assets	0003_alter_asset_file_type	2025-04-16 13:21:51.967802+00
11	contenttypes	0002_remove_content_type_name	2025-04-16 13:21:52.074055+00
12	auth	0002_alter_permission_name_max_length	2025-04-16 13:21:52.124783+00
13	auth	0003_alter_user_email_max_length	2025-04-16 13:21:52.15741+00
14	auth	0004_alter_user_username_opts	2025-04-16 13:21:52.181898+00
15	auth	0005_alter_user_last_login_null	2025-04-16 13:21:52.251996+00
16	auth	0006_require_contenttypes_0002	2025-04-16 13:21:52.256547+00
17	auth	0007_alter_validators_add_error_messages	2025-04-16 13:21:52.280496+00
18	auth	0008_alter_user_username_max_length	2025-04-16 13:21:52.314388+00
19	auth	0009_alter_user_last_name_max_length	2025-04-16 13:21:52.352802+00
20	auth	0010_alter_group_name_max_length	2025-04-16 13:21:52.397492+00
21	auth	0011_update_proxy_permissions	2025-04-16 13:21:52.436787+00
22	auth	0012_alter_user_first_name_max_length	2025-04-16 13:21:52.474271+00
23	blog	0001_initial	2025-04-16 13:21:52.640791+00
24	content_generation	0001_inital	2025-04-16 13:21:52.846408+00
25	content_templates	0001_initial	2025-04-16 13:21:53.064351+00
26	prompts	0001_initial	2025-04-16 13:21:53.183138+00
27	sessions	0001_initial	2025-04-16 13:21:53.233594+00
28	subscriptions	0001_initial	2025-04-16 13:21:53.500253+00
29	content_templates	0002_template_keywords	2025-04-19 15:26:53.80231+00
30	content_templates	0003_template_description_alter_templateprompt_template	2025-04-19 15:26:53.925199+00
31	core	0001_initial	2025-04-19 15:26:54.800909+00
32	projects	0002_prompt_keywords	2025-04-19 15:26:54.913485+00
33	projects	0003_project_keywords	2025-04-19 15:26:55.052745+00
34	docs	0001_initial	2025-04-20 07:16:41.94764+00
35	accounts	0002_profile_bio	2025-04-22 13:16:46.168973+00
36	accounts	0003_tokenusage	2025-04-22 23:08:57.299299+00
37	accounts	0004_initialize_token_usage	2025-04-22 23:08:57.36299+00
38	accounts	0005_memberresource	2025-04-22 23:27:36.425966+00
39	seo_optimization	0001_initial	2025-04-24 05:41:34.318401+00
40	core	0002_contactmessage	2025-04-24 14:00:36.816505+00
41	blog	0002_alter_post_content	2025-04-24 20:58:40.673009+00
42	docs	0002_alter_documentationpage_content	2025-04-24 20:58:40.688327+00
43	content_generation	0002_alter_aiconfig_fallback_model	2025-04-25 14:53:09.88953+00
44	content_generation	0003_prompttemplate	2025-04-25 20:30:47.835613+00
45	django_celery_results	0001_initial	2025-05-07 21:14:40.22761+00
46	django_celery_results	0002_add_task_name_args_kwargs	2025-05-07 21:14:40.272171+00
47	django_celery_results	0003_auto_20181106_1101	2025-05-07 21:14:40.280526+00
48	django_celery_results	0004_auto_20190516_0412	2025-05-07 21:14:40.388657+00
49	django_celery_results	0005_taskresult_worker	2025-05-07 21:14:40.42681+00
50	django_celery_results	0006_taskresult_date_created	2025-05-07 21:14:40.543503+00
51	django_celery_results	0007_remove_taskresult_hidden	2025-05-07 21:14:40.571086+00
52	django_celery_results	0008_chordcounter	2025-05-07 21:14:40.596998+00
53	django_celery_results	0009_groupresult	2025-05-07 21:14:41.000774+00
54	django_celery_results	0010_remove_duplicate_indices	2025-05-07 21:14:41.021641+00
55	django_celery_results	0011_taskresult_periodic_task_name	2025-05-07 21:14:41.050958+00
56	django_celery_results	0012_taskresult_date_started	2025-05-07 21:14:41.071354+00
57	django_celery_results	0013_taskresult_django_cele_periodi_1993cf_idx	2025-05-07 21:14:41.094733+00
58	django_celery_results	0014_alter_taskresult_status	2025-05-07 21:14:41.103788+00
59	projects	0004_project_language_preference	2025-05-07 21:14:41.164361+00
60	prompt_generator	0001_initial	2025-05-07 21:14:41.521106+00
61	subscriptions	0002_userprofile_trial_ended_email_sent_and_more	2025-05-07 21:14:41.662204+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

COPY aimarket_m3rk37tdb.django_session (session_key, session_data, expire_date) FROM stdin;
07q0ckqmrjb65n01md3mu71eyzxwqmik	.eJxVjDsOwjAQBe_iGlkO618o6XMGa-1d4wCypTipEHeHSCmgfTPzXiLgtpawdV7CTOIiQJx-t4jpwXUHdMd6azK1ui5zlLsiD9rl1Iif18P9OyjYy7dO3gIrtCPrAQ2plBG9Q47JA3A2xjgacoY0esqkPZwRDWvnUEVFVon3BwmROMI:1u7xkD:P86W_rp-GwHrtDT5rvGFzNqR2t1i7srzp0yvlfPPHUE	2025-05-08 14:40:05.691664+00
tf0hfmor1it62myol3vck3l2yeg5b1sf	.eJxVjDsOwjAQBe_iGlkO618o6XMGa-1d4wCypTipEHeHSCmgfTPzXiLgtpawdV7CTOIiQJx-t4jpwXUHdMd6azK1ui5zlLsiD9rl1Iif18P9OyjYy7dO3gIrtCPrAQ2plBG9Q47JA3A2xjgacoY0esqkPZwRDWvnUEVFVon3BwmROMI:1u83yW:lTbrKHpPieEVWNw5x8hVMQagQq32Ja70QQAGKtpYI1w	2025-05-08 21:19:16.287996+00
\.


--
-- Data for Name: docs_documentationcategory; Type: TABLE DATA; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

COPY aimarket_m3rk37tdb.docs_documentationcategory (id, name, slug, description, "order") FROM stdin;
1a325f5035c4478babc3c1f2b3d2f12c	Generate Content	generate-content		6
281807aca4e84cc09929d6981c06c946	Subscriptions	subscriptions		8
5b3b1e622f0d44a8b40bd577d22c5e9f	Creating Templates	creating-templates		2
67ddcf16d0e04e6d9db70004ee6f5795	Uploading Content	uploading-content	How the uploading content or assets works	4
89554f8ee65c44de94dbe23ac7d5f02c	Getting Started	getting-started		1
ba785eb26c724cb491d582d0739f2ba9	AI Marketing Platform Docs	ai-marketing-platform-docs		0
dce632d060264be880839d654608dd1a	Creating Prompts	creating-prompts		5
f835e705915e49fd937155389909a30c	Creating Projects	creating-projects		3
\.


--
-- Data for Name: docs_documentationpage; Type: TABLE DATA; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

COPY aimarket_m3rk37tdb.docs_documentationpage (id, title, slug, content, "order", is_published, created_at, updated_at, category_id) FROM stdin;
2110b80998e54c9083c4eb6fa8908713	Uploading Content to AI Marketing Platform	uploading-content-to-ai-marketing-platform	<p>Providing the AI with high-quality source material is crucial for generating effective content. This guide explains how to upload and manage your content files.</p>\r\n<h2>Supported File Types</h2>\r\n<p>AI Marketing Platform supports various file formats:</p>\r\n<h2>&nbsp;</h2>\r\n<table style="border-collapse: collapse; width: 52.2828%;" border="1"><colgroup><col style="width: 12.8733%;"><col style="width: 25.1943%;"><col style="width: 61.9056%;"></colgroup>\r\n<tbody>\r\n<tr>\r\n<td><strong>File Type</strong></td>\r\n<td><strong>Formats</strong></td>\r\n<td><strong>Usage</strong></td>\r\n</tr>\r\n<tr>\r\n<td>Text</td>\r\n<td>.txt, .md</td>\r\n<td>Direct text content</td>\r\n</tr>\r\n<tr>\r\n<td>Documents</td>\r\n<td>.pdf</td>\r\n<td>Text extraction from formatted documents</td>\r\n</tr>\r\n<tr>\r\n<td>Audio</td>\r\n<td>.mp3, .wav, .m4a, .ogg</td>\r\n<td>Transcription to text</td>\r\n</tr>\r\n<tr>\r\n<td>Video</td>\r\n<td>.mp4, .mov, .avi, .wmv</td>\r\n<td>Audio extraction and transcription</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h2>&nbsp;</h2>\r\n<h2>File Size Limits</h2>\r\n<ul>\r\n<li><strong>Text files</strong>: Up to 10MB</li>\r\n<li><strong>PDF documents</strong>: Up to 20MB</li>\r\n<li><strong>Audio files</strong>: Up to 25MB</li>\r\n<li><strong>Video files</strong>: Up to 100MB</li>\r\n</ul>\r\n<h2>&nbsp;</h2>\r\n<h2>Token Limits</h2>\r\n<p>Your subscription determines your total token limits. Tokens are units of text that the AI processes:</p>\r\n<ul>\r\n<li>Each account has a token limit for assets (your uploaded content)</li>\r\n<li>The dashboard displays your current usage as a percentage</li>\r\n<li style="font-weight: bold;"><strong>When approaching your limit, consider removing unused assets</strong></li>\r\n</ul>\r\n<h2>Uploading Files to a Project</h2>\r\n<ol>\r\n<li>Navigate to your project from the dashboard</li>\r\n<li>Select the "Upload Media" tab</li>\r\n<li>Upload files using one of these methods:\r\n<ul>\r\n<li><strong>Drag and drop</strong> files into the upload area</li>\r\n<li><strong>Click</strong> the upload area to open a file browser</li>\r\n<li>Select one or more files to upload</li>\r\n</ul>\r\n</li>\r\n</ol>\r\n<p>&nbsp;</p>\r\n<p><img src="https://aimarketingplatform.app/media/blog/images/aimarketing-uploadassets.png" alt="" width="1135" height="523"></p>\r\n<ol start="4">\r\n<li>After selecting files, click "Upload Files"<br><br><br><img src="https://aimarketingplatform.app/media/blog/images/aimarketing-uploadassets1.png" alt="" width="1181" height="540"><br><br></li>\r\n<li>A progress indicator will show the upload status and the files will appear in the "Uploaded Files" area.</li>\r\n<li>Once complete, your files will appear in the "Uploaded Files" section and will show you how many tokens you have used</li>\r\n</ol>\r\n<h2><img src="https://aimarketingplatform.app/media/blog/images/aimarketing-uploadassets2.png" alt="" width="1151" height="526"></h2>\r\n<h2>Processing of Files</h2>\r\n<p>Different file types undergo specific processing:</p>\r\n<ul>\r\n<li><strong>Text and Markdown</strong>: Available immediately</li>\r\n<li><strong>PDF</strong>: Text extraction may take a few moments</li>\r\n<li><strong>Audio and Video</strong>: Files undergo automatic transcription, which may take several minutes depending on length</li>\r\n</ul>\r\n<p>The status indicator next to each file shows:</p>\r\n<ul>\r\n<li><strong>Pending</strong>: File is queued for processing</li>\r\n<li><strong>In Progress</strong>: Processing is underway</li>\r\n<li><strong>Completed</strong>: File is ready for use</li>\r\n<li><strong>Failed</strong>: Processing encountered an error</li>\r\n</ul>\r\n<h2>Managing Uploaded Files</h2>\r\n<p>After uploading, you can:</p>\r\n<ul>\r\n<li><strong>View file details</strong>: Click on a file to see its information</li>\r\n<li><strong>Delete files</strong>: Remove unwanted files by clicking the delete (trash) icon</li>\r\n<li><strong>Track token usage</strong>: Monitor how many tokens each file consumes</li>\r\n</ul>\r\n<h2>Best Practices for Content Files</h2>\r\n<p>For optimal results:</p>\r\n<ol>\r\n<li><strong>Quality over quantity</strong>: Upload focused, relevant content rather than large, general files</li>\r\n<li><strong>Clean your text</strong>: Remove unnecessary formatting, headers, or footers from text files</li>\r\n<li><strong>Clear audio</strong>: For audio/video files, ensure clear speech with minimal background noise</li>\r\n<li><strong>Varied examples</strong>: Include different styles if you want the AI to generate diverse content</li>\r\n<li><strong>Representative content</strong>: Upload materials that truly represent your desired brand voice and style</li>\r\n</ol>\r\n<h2>Troubleshooting Upload Issues</h2>\r\n<p>If you encounter problems uploading files:</p>\r\n<ul>\r\n<li><strong>File not accepted</strong>: Verify the file is in a supported format</li>\r\n<li><strong>Upload fails</strong>: Check your internet connection and try again</li>\r\n<li><strong>Processing stuck</strong>: Large files may take longer; if stuck for more than 30 minutes, try uploading a smaller version</li>\r\n<li><strong>Failed transcription</strong>: Audio quality may be insufficient; try a cleaner recording</li>\r\n</ul>\r\n<p>By providing high-quality source material, you significantly improve the AI's ability to generate content that matches your style and needs.</p>	0	t	2025-04-22 11:29:23.356918+00	2025-04-22 14:26:21.066355+00	67ddcf16d0e04e6d9db70004ee6f5795
3203fe55677e479a9a509ea94c5525ad	What Is AI Marketing Platform?	what-is-ai-marketing-platform	<p>AI Marketing Platform has been developed by a Technical Virtual Assistant/Developer who has to regularly generate content, which can be time consuming. It started as a way to help her create content for her clients and is now a fully functional platform that others can join and use.</p>\r\n<p>The aim is to transform your content creation process using artificial intelligence or AI. This platform empowers content creators, influencers and business owners to generate high-quality, targeted content with amazing performance and productivity.</p>\r\n<h2>The Power of AI for Your Marketing Needs</h2>\r\n<p>Creating consistent, engaging content across multiple channels is challenging. AI Marketing Platform bridges this gap by leveraging advanced AI to go through your existing content and generate fresh, relevant material tailored to your specific needs.</p>\r\n<p>The content it creates is based on the prompts you provide and the site provides learning material that will help you use prompt engineering to produce the best prompts and ensure relevant results.</p>\r\n<h2>Key Benefits</h2>\r\n<ul>\r\n<li><strong>Save Time and Resources</strong>: Reduce content creation time from days to minutes</li>\r\n<li><strong>Maintain Consistent Brand Voice</strong>: Ensure all generated content aligns with brand guidelines</li>\r\n<li><strong>Scale Your Content Operation</strong>: Easily produce more content without expanding your team</li>\r\n<li><strong>Maximize Creative Output</strong>: Focus on strategy while AI handles the execution</li>\r\n<li><strong>Improve Content Quality</strong>: Use AI assistance to refine and enhance your messaging</li>\r\n</ul>\r\n<h2>How It Works</h2>\r\n<p>Our platform uses a simple, effective three-step process:</p>\r\n<ol>\r\n<li><strong>Upload Your Source Material</strong>: Add existing content (text files, articles, audio, or video) that represents your brand voice and knowledge base</li>\r\n<li><strong>Create Custom Prompts</strong>: Develop specific instructions for the AI to follow when generating your content</li>\r\n<li><strong>Generate Fresh Content</strong>: Let our AI go through your source materials and create new content following your prompts</li>\r\n</ol>\r\n<h2>Who Benefits from AI Marketing Platform?</h2>\r\n<ul>\r\n<li><strong>Virtual Assistants</strong>: Create consistent content across multiple channels for your clients</li>\r\n<li><strong>Influencers &amp; Content Creators</strong>: Break through writer's block and increase productivity</li>\r\n<li><strong>Small Business Owners</strong>: Maintain a professional content presence without dedicated staff</li>\r\n</ul>\r\n<p>AI Marketing Platform isn't about replacing human creativity&mdash;it's about enhancing it. By automating the time-consuming aspects of content creation, we free you to focus on doing anything else with the time you have.</p>\r\n<h2>What Kind Of Content Can Be Created?&nbsp;</h2>\r\n<p>You can use the AI Marketing Platform to generate a range of content to connect with existing clients/users but also to attract new ones via inbound marketing.&nbsp;</p>\r\n<ul>\r\n<li><strong>Social Media</strong>: Generate messages for your social media accounts focusing on your core market</li>\r\n<li><strong>Content</strong>: blog posts, LinkedIn posts, content for your newsletter</li>\r\n<li><strong>Landing Pages</strong>: Generate content sent via email, generate email replies and other messages</li>\r\n<li><strong>E-commerce Businesses</strong>: Generate product descriptions, email campaigns, and promotional content</li>\r\n</ul>\r\n<p>AI Marketing Platform is an aid. It saves you doing the heavy lifting and provides creative ideas based on your existing content.&nbsp;</p>\r\n<p>While you can use the AI Marketing Platform for generating a bunch of messages for X or Instagram, or creating blog and LinkedIn posts, it can do much more.</p>\r\n<ul>\r\n<li>\r\n<p><strong>Generate Review Responses </strong>- Feed them into your dashboard and instantly get professional responses tailored by sentiment (e.g., 1-star vs. 5-star).&nbsp;</p>\r\n</li>\r\n<li>\r\n<p><strong>Knowledge Base Automation</strong> - Feed support tickets and FAQs into the platform and let it generate step-by-step help articles, video scripts, and chatbot replies.</p>\r\n</li>\r\n<li>\r\n<p><strong>Activate Your Community</strong> - Generate discussion prompts, highlight summaries, and recap emails for your Reddit, Discord, or Facebook groups.</p>\r\n</li>\r\n<li>\r\n<p><strong>Event and Webinar Follow-Ups</strong> - Upload your webinar transcripts or recordings. You&rsquo;ll get follow-up emails, blog posts, thank-you messages, and social media clips in minutes.</p>\r\n</li>\r\n<li>\r\n<p><strong>Sales Enablement Assets&nbsp;</strong>- Upload sales calls, demos, or discovery meeting transcripts. Get objection-handling scripts and follow-up email sequences tailored to the customer&rsquo;s concerns.</p>\r\n</li>\r\n</ul>\r\n<p>Read the full blog post: <em>10 Powerful Ways AI Marketing Goes Beyond Social Media Posts.</em></p>\r\n<p><em><strong>NOT A MEMBER?</strong>&nbsp;</em><em>Ready to transform your content creation process? <a href="https://www.aimarketingplatform.app">Get started with AI Marketing Platform today</a>.</em></p>	0	t	2025-04-21 11:52:19.611157+00	2025-04-21 16:24:06.819642+00	ba785eb26c724cb491d582d0739f2ba9
3f6fd40790014cf8a035c31c8a9f946d	Writing Effective Prompts	writing-effective-prompts	<p class="whitespace-pre-wrap break-words">Prompt Engineering is all about writing effective prompts. The quality of your prompts directly impacts the quality of the generated content you receive.&nbsp;Follow these best practices:</p>\r\n<h3 class="text-lg font-bold text-text-100 mt-1 -mb-1.5">Basic Prompt Structure</h3>\r\n<p class="whitespace-pre-wrap break-words">A good prompt typically includes:</p>\r\n<p><strong>Context</strong>: Background information about what you're trying to create</p>\r\n<p><strong>Task</strong>: Specific instructions for what the AI should generate</p>\r\n<p><strong>Format</strong>: How the output should be structured</p>\r\n<p><strong>Tone</strong>: The desired writing style or voice</p>\r\n<p><strong>Length</strong>: How long the output should be</p>\r\n<h3 class="text-lg font-bold text-text-100 mt-1 -mb-1.5">Example Prompt Formula</h3>\r\n<div class="relative group/copy rounded-lg">\r\n<div class="">\r\n<pre class="code-block__code !my-0 !rounded-lg !text-sm !leading-relaxed"><code>Create a [<strong><em>type of content</em></strong>] about [<em><strong>topic</strong></em>] for [<em><strong>target audience</strong></em>]. \r\nThe tone should be [<em><strong>desired tone</strong></em>] and it should be approximately [<em><strong>length</strong></em>].\r\nInclude [<em><strong>specific elements</strong></em>] and emphasize [<em><strong>key points</strong></em>].\r\nFormat the content with [<em><strong>formatting instructions</strong></em>].</code></pre>\r\n</div>\r\n</div>\r\n<h3 class="text-lg font-bold text-text-100 mt-1 -mb-1.5">Example Prompt</h3>\r\n<div class="relative group/copy rounded-lg">\r\n<div class="">\r\n<pre class="code-block__code !my-0 !rounded-lg !text-sm !leading-relaxed"><code>Create a promotional email about our new fitness app for busy professionals.\r\nThe tone should be motivational but professional, and it should be approximately \r\n300-400 words. Include a compelling subject line, a clear call to action,\r\nand emphasize the time-saving benefits of the app. Format the content with\r\nshort paragraphs and bullet points for easy scanning.</code></pre>\r\n</div>\r\n</div>\r\n<h2 class="text-xl font-bold text-text-100 mt-1 -mb-0.5">Prompt Best Practices</h2>\r\n<p><strong>Be specific</strong>: Vague prompts lead to generic content</p>\r\n<p><strong>Mention the audience</strong>: Always specify who the content is for</p>\r\n<p><strong>Define the tone</strong>: Use descriptive adjectives (professional, friendly, authoritative)</p>\r\n<p><strong>Include formatting guidance</strong>: Specify if you want paragraphs, bullet points, etc.</p>\r\n<p><strong>Set parameters</strong>: Include word count or section guidelines</p>\r\n<p><strong>Use examples</strong>: When appropriate, include examples of what you're looking for</p>\r\n<h2 class="text-xl font-bold text-text-100 mt-1 -mb-0.5">Prompt Key Elements</h2>\r\n<p>Here are some common prompt types and the key elements to include in your prompt:</p>\r\n<p><strong>Blog Post:&nbsp;</strong>&nbsp;Topic, audience, tone, word count, section headings</p>\r\n<p><strong>Social Media:</strong> Platform, character limit, hashtag requirements, call to action<br><br><strong>Email: </strong>Subject line, purpose, tone, desired length, call to action<br><br><strong>Product Description:</strong>&nbsp; Key features, benefits, technical specs, target buyer<br><br><strong>Ad Copy:</strong> Platform, character limits, unique selling proposition, CTA</p>\r\n<p class="whitespace-pre-wrap break-words">&nbsp;</p>	0	t	2025-04-22 14:43:18.353877+00	2025-04-23 09:31:42.698759+00	dce632d060264be880839d654608dd1a
53ccbc404c4f47c9a59b6fca126532ea	Generate Content	generate-content	<p>This guide covers how to generate, manage, edit, export, and effectively use your AI-generated content.</p>\r\n<p>After adding all your prompts and once you are ready click on the <strong>3 Generate&nbsp;</strong>tab, which will take you into the area where you can then generate content. Simply click on the <strong>Generate Content</strong> button on the right. The system will process your assets and prompts.</p>\r\n<p>&nbsp;</p>\r\n<p><img src="https://aimarketingplatform.app/media/blog/images/aimarketing-generatedcontent.png" alt="generate content" width="908" height="401"></p>\r\n<p>You will see the countdown as your content is created. <em><strong>PLEASE BE PATIENT.</strong></em> Depending on what you are asking it may take a minute but it will appear and you will be able to watch as it counts the content it creates. Even if it takes a few minutes you will find that this is still far quicker than you could ever manage creating it yourself!</p>\r\n<p>A success message will appear once the platform has completed its work and your content will then show up.</p>\r\n<p><img src="https://aimarketingplatform.app/media/blog/images/aimarketing-generatedcontent4.png" alt="generated content image" width="1008" height="446"></p>\r\n<p>&nbsp;</p>\r\n<p>After you've successfully generated content with AI Marketing Platform, you'll want to export and use it in your marketing campaigns.&nbsp;</p>\r\n<h2>Accessing Generated Content</h2>\r\n<p>Your generated content is available in the "Generate" tab of your project, which is the third tab in the project workflow:</p>\r\n<p>Navigate to your project</p>\r\n<p>Click the "<em>Generate</em>" tab - tab 3</p>\r\n<p>Here you'll find all content generated from your prompts</p>\r\n<h2>Understanding the Generate Tab</h2>\r\n<p>The Generate tab displays:</p>\r\n<p>A list of all content pieces generated in the project</p>\r\n<p>Each item shows the name inherited from its originating prompt</p>\r\n<p>The date and time when the content was generated</p>\r\n<p>Options to copy or edit each content piece. The ability to export content is coming soon.</p>\r\n<p><strong>Note</strong>: Generation time varies based on the number of prompts and complexity of your content.</p>\r\n<h2>Working with Generated Content</h2>\r\n<h3>Viewing Content</h3>\r\n<p>Click on any content card to expand and view the full text of the generated content.</p>\r\n<h3>Editing Content</h3>\r\n<ol>\r\n<li>Click the edit (pencil) icon on a content card</li>\r\n<li>Make your desired changes in the editor</li>\r\n<li>Click "Save Changes" to update the content</li>\r\n</ol>\r\n<p><img src="https://aimarketingplatform.app/media/blog/images/aimarketing-generatedcontent-edit.png" alt="edit your content" width="920" height="633"></p>\r\n<p><strong>Editing is useful for:</strong></p>\r\n<p><strong>Refining AI-generated text:</strong> Always better to add your own voice if you can and you should always read what AI provides.</p>\r\n<p><strong>Correcting any inaccuracies:</strong> Make changes based on inaccurate results (it happens!)</p>\r\n<p><strong>Personalizing content for specific needs:</strong> Add enhancements so you can speak to a specific audience</p>\r\n<p><strong>Adding additional information:</strong> Forgot to include something in your prompt. Edit the article and add it here.</p>\r\n<p><strong>Improving your content inspection score:</strong> Based on your score you might choose to change or add keywords, amend sentences etc</p>\r\n<p>&nbsp;</p>\r\n<h3>Copying to Clipboard</h3>\r\n<p>Once you are ready to use your content this is the best way:</p>\r\n<p><strong>Click the copy (clipboard) icon</strong> on any content card</p>\r\n<p>The entire content is copied to your clipboard</p>\r\n<p>A confirmation message will appear</p>\r\n<p>Paste the content into your desired destination</p>\r\n<h2>Exporting Content&nbsp;</h2>\r\n<p>AI Marketing Platform provides users with the option to copy content or export it into a docx file.&nbsp;</p>\r\n<h3>Export Individual Content</h3>\r\n<p>From any content card:</p>\r\n<p>Click the export (download) icon</p>\r\n<p>The docx file will download to your computer</p>\r\n<h3>Batch Export</h3>\r\n<p>To export multiple content pieces at once:</p>\r\n<p>Use the checkboxes to select multiple content items</p>\r\n<p>Click "Select ALL" at the top of the page</p>\r\n<p>A zip file containing all selected content will download</p>\r\n<p><img src="https://aimarketingplatform.app/media/blog/images/aimarketing-generatedcontent-download.png" alt="batch downloads" width="900" height="248"></p>\r\n<h2>&nbsp;</h2>\r\n<h2>Using Your Generated Content</h2>\r\n<p>Here are some best practices for using AI-generated content effectively:</p>\r\n<h3>Review and Refine</h3>\r\n<p>Always review AI-generated content before publishing:</p>\r\n<p>Check for factual accuracy</p>\r\n<p>Ensure the tone matches your brand voice</p>\r\n<p>Verify that any statistics or claims are correct</p>\r\n<p>Look for opportunities to add personal insights</p>\r\n<h3>Attribution Requirements</h3>\r\n<p>AI Marketing Platform does not require attribution, but follow these guidelines:</p>\r\n<p>Check your local regulations regarding AI-generated content</p>\r\n<p>If using for professional services (legal, medical, financial), clearly indicate if content was AI-assisted</p>\r\n<p>For academic or research purposes, disclose the use of AI tools</p>\r\n<h3>Reformat for Different Channels</h3>\r\n<p>Adjust exported content for different platforms:</p>\r\n<p><strong>Social Media</strong>: Trim length, add hashtags, ensure character count fits platform limits</p>\r\n<p><strong>Website/Blog</strong>: Add SEO elements like meta descriptions and title tags</p>\r\n<p><strong>Email</strong>: Format for email-friendly reading with short paragraphs</p>\r\n<p><strong>Print Materials</strong>: Enhance with appropriate font styles and spacing</p>\r\n<h2>Content Management Best Practices</h2>\r\n<h3>Arranging Generated Content</h3>\r\n<p>Create a consistent file naming system when saving generated content</p>\r\n<p>Consider using a content calendar to plan publishing schedules</p>\r\n<p>Maintain a record of which AI content has been published and where</p>\r\n<h3>Version Control</h3>\r\n<p>Date your content if saving it into a document and making multiple versions</p>\r\n<p>Consider adding version numbers to filenames</p>\r\n<p>Keep notes on what changes were made between versions</p>\r\n<h3>Content Refresh Cycle</h3>\r\n<p>AI Marketing Platform makes it easy to refresh content periodically:</p>\r\n<p>Return to previous projects</p>\r\n<p>Update prompts if needed</p>\r\n<p>Generate new versions of content</p>\r\n<p>Compare with previous versions to see improvements</p>\r\n<h2>Troubleshooting Export Issues</h2>\r\n<p>If you encounter problems with exports:</p>\r\n<p><strong>Download fails</strong>: Try a different browser or clear your cache</p>\r\n<p><strong>Formatting issues</strong>: Try exporting in a different format</p>\r\n<p><strong>Content appears cut off</strong>: Check if there are character limits in your export format</p>\r\n<h2>Security and Data Protection</h2>\r\n<p>Downloaded content is not stored on our servers after export</p>\r\n<p>Consider the data protection policies if you are generating content for a client or business, especially when storing exports</p>\r\n<p>For sensitive content, ensure proper security measures for stored files</p>\r\n<p>By following these guidelines, you'll be able to effectively leverage the content generated by AI Marketing Platform across all your marketing channels.</p>	0	t	2025-04-24 12:10:59.511623+00	2025-04-24 16:44:12.034105+00	1a325f5035c4478babc3c1f2b3d2f12c
5bf4d264d5634c0382acc9d12b36c301	Best Practices	best-practices	<p>This guide presents strategies you can use to maximize your results with AI Marketing Platform. Following these best practices will help you create more effective content, streamline your workflow, and get the most value from your subscription.</p>\r\n<h2>Source Material Selection</h2>\r\n<p>The quality of your input materials directly affects the quality of generated content. Here's how to select optimal source material:</p>\r\n<h3>&nbsp;Best Practices for Text Assets</h3>\r\n<p><strong>Choose representative content</strong>: Select materials that accurately reflect your brand voice, style, and messaging standards.</p>\r\n<p><strong>Prioritize high-quality writing</strong>: Use professionally written content that's free of errors and represents your best work.</p>\r\n<p><strong>Include varied examples</strong>: Upload different types of content (blogs, emails, social posts) to give the AI a complete understanding of your style across formats.</p>\r\n<p><strong>Focus on relevance</strong>: Use materials related to your current project rather than generic content.</p>\r\n<p><strong>Clean your files</strong>: Before uploading, remove headers, footers, navigation elements, and formatting that isn't part of the actual content.<br><br></p>\r\n<h3>Best Practices for Audio/Video Assets</h3>\r\n<p><strong>Choose clear recordings</strong>: Select audio/video with minimal background noise and clear speech.</p>\r\n<p><strong>Prioritize content over production</strong>: A simple recording with clear, well-articulated content is better than a professional production with unfocused messaging.</p>\r\n<p><strong>Consider segmenting</strong>: Rather than uploading one long video, break content into logical segments focusing on specific topics.</p>\r\n<p><strong>Review transcriptions</strong>: Always check AI-generated transcriptions for accuracy and edit if necessary.<br><br></p>\r\n<h2>Project Organization Strategies</h2>\r\n<p>Effective project organization helps maintain clarity and efficiency as you scale your content production:</p>\r\n<p><strong>Organize by campaign</strong>: Create separate projects for different marketing campaigns.</p>\r\n<p><strong>Organize by content type</strong>: Group similar content types (all blog posts, all social media, etc.) in dedicated projects.</p>\r\n<p><strong>Organize by audience</strong>: Create projects targeting specific audience segments or personas.</p>\r\n<p><strong>Use descriptive naming</strong>: "Q2 2025 Email Sequence - Product Launch" is better than "Email Project."</p>\r\n<p><strong>Archive completed projects</strong>: Rather than deleting old projects, mark them as complete to maintain reference materials.<br><br></p>\r\n<h2>Prompt Engineering for Marketers</h2>\r\n<p>Creating effective prompts is perhaps the most important skill for getting quality content from AI Marketing Platform. Master these techniques for superior results:</p>\r\n<h3>The CLEAR Prompt Framework</h3>\r\n<p>For consistently effective prompts, follow the CLEAR framework:</p>\r\n<p><strong>Context</strong>: Provide relevant background information</p>\r\n<p><strong>Language</strong>: Specify desired tone, style, and terminology</p>\r\n<p><strong>Examples</strong>: Include specific examples or references</p>\r\n<p><strong>Audience</strong>: Define the target audience clearly</p>\r\n<p><strong>Requirements</strong>: State specific technical requirements (length, format, etc.)</p>\r\n<h3>Advanced Prompt Techniques for Marketing Content</h3>\r\n<p><strong>Persona-based prompting</strong>:</p>\r\n<pre><code>Create content as if you are a [specific marketing persona] writing to [target audience].\r\nFor example: "Create content as if you are a tech-savvy millennial marketing manager\r\nwriting to small business owners aged 45-60 who are hesitant about adopting new technology."\r\n</code></pre>\r\n<p><strong>Competitor comparison prompting</strong>:</p>\r\n<pre><code>Create content that highlights our key differentiators compared to [competitor]\r\nwithout directly mentioning them by name. Focus on our strengths in [specific areas].\r\n</code></pre>\r\n<p><strong>Customer journey prompting</strong>:</p>\r\n<pre><code>Write content for customers at the [awareness/consideration/decision] stage\r\nof the buying journey who are experiencing [specific pain point].\r\n</code></pre>\r\n<p><strong>Template adaptation prompting</strong>:</p>\r\n<pre><code>Adapt this template: [template text] to fit our product [product name]\r\nwhile maintaining the same structure and persuasive elements.\r\n</code></pre>\r\n<p><strong>Multilingual adaptation prompting</strong>:</p>\r\n<pre><code>Create content in [language] that maintains the same key messaging as our\r\nEnglish content but is culturally appropriate for [target market].\r\n</code></pre>\r\n<h3>Industry-Specific Prompt Examples</h3>\r\n<h4>For E-commerce:</h4>\r\n<pre><code>Create a product description for [product] targeting [customer segment].\r\nHighlight the following benefits: [list 3-5 benefits]. Include sensory\r\nlanguage that evokes [specific emotion]. End with a clear call-to-action\r\nthat emphasizes [key selling point].\r\n</code></pre>\r\n<h4>For B2B Services:</h4>\r\n<pre><code>Write a case study about how [service] helped a client in the [industry]\r\novercome [challenge]. Structure it with: 1) Client background (75 words),\r\n2) Challenge (100 words), 3) Solution implementation (150 words),\r\n4) Measurable results with specific metrics (100 words),\r\n5) Client testimonial (50 words).\r\n</code></pre>\r\n<h4>For Real Estate:</h4>\r\n<pre><code>Create a property listing for a [property type] in [location]. Highlight these\r\nkey features: [list features]. Use vivid language to describe the [specific area]\r\nand lifestyle benefits. Include neighborhood highlights and incorporate these\r\nkeywords: [list keywords].\r\n</code></pre>\r\n<h3>Iterative Prompt Refinement</h3>\r\n<p>For optimal results, use this proven refinement process:</p>\r\n<p><strong>Start with a basic prompt</strong>: Begin with a simple prompt based on the CLEAR framework</p>\r\n<p><strong>Review the output</strong>: Identify specific areas for improvement</p>\r\n<p><strong>Refine with specificity</strong>: Add detailed instructions addressing weak areas</p>\r\n<p><strong>Request variations</strong>: Generate multiple versions with slight prompt modifications</p>\r\n<p><strong>Combine elements</strong>: Take the best parts of multiple outputs for final content</p>\r\n<p>Example of iterative refinement:</p>\r\n<p><strong>Initial prompt</strong>: "Write a marketing email about our new fitness app."</p>\r\n<p><strong>Refined prompt</strong>: "Write a marketing email about our new fitness app 'FitLife Pro' targeting busy professionals aged 30-45. Use a motivational but professional tone. Include a subject line optimized for open rates, 3 key benefits (time efficiency, personalization, and progress tracking), and a clear CTA offering a 14-day free trial. Keep the email under 250 words with short paragraphs and bullet points for scannability."<br><br></p>\r\n<h2>Token Usage Optimization</h2>\r\n<p>Managing your token allowance effectively ensures you get maximum value from your subscription:</p>\r\n<p><strong>Delete unnecessary assets</strong>: Remove source files that are no longer needed after generating content.</p>\r\n<p><strong>Use targeted excerpts</strong>: Rather than uploading entire documents, extract the most relevant sections.</p>\r\n<p><strong>Consolidate similar assets</strong>: Combine multiple similar files into a single representative document.</p>\r\n<p><strong>Prioritize text over media</strong>: When possible, use text files rather than audio/video as they require fewer tokens.</p>\r\n<p><strong>Monitor token usage</strong>: Regularly check your dashboard to see which projects consume the most tokens.<br><br></p>\r\n<h2>Content Generation Workflow Optimization</h2>\r\n<p>Streamline your content creation process with these workflow tips:</p>\r\n<p><strong>Template first, customize later</strong>: Create template prompts that can be reused across projects, then customize for specific needs.</p>\r\n<p><strong>Batch similar content</strong>: Generate all social media posts at once, all email subject lines together, etc.</p>\r\n<p><strong>Progressive elaboration</strong>: Start with outlines, then generate section-by-section content rather than trying to create everything at once.</p>\r\n<p><strong>Content calendar integration</strong>: Arrange your projects around your content calendar for better planning.</p>\r\n<p><strong>Regular content audits</strong>: Periodically review generated content to identify improvement opportunities in your prompts and source materials.<br><br></p>\r\n<h2>Measuring and Improving Results</h2>\r\n<p>Track your AI content performance to continuously improve:</p>\r\n<p><strong>A/B test generated content</strong>: Compare performance metrics between AI-generated and human-written content.</p>\r\n<p><strong>Track prompt effectiveness</strong>: Note which prompts consistently produce better results.</p>\r\n<p><strong>Gather audience feedback</strong>: Collect responses to different AI-generated content pieces to guide refinement.</p>\r\n<p><strong>Document successful patterns</strong>: Create an internal library of effective prompts and approaches.</p>\r\n<p><strong>Review metrics that matter</strong>: Focus on engagement, conversion, and response metrics rather than just output volume.<br><br></p>\r\n<h2>Working with Your Marketing Team</h2>\r\n<p>Integrate AI Marketing Platform into your team's workflow:</p>\r\n<p><strong>Define clear roles</strong>: Determine who will manage projects, create prompts, review output, etc.</p>\r\n<p><strong>Establish content approval workflows</strong>: Create a systematic review process for AI-generated content.</p>\r\n<p><strong>Share knowledge</strong>: Create internal documentation of what works best for your specific brand and audience.</p>\r\n<p><strong>Hybrid creation approach</strong>: Use AI for first drafts, outlines, or idea generation, with human creativity adding the final polish.</p>\r\n<p><strong>Training and growth</strong>: Invest time in training team members on effective prompt engineering.</p>\r\n<p>By implementing these best practices, you'll maximize the value of AI Marketing Platform, creating better content more efficiently while maintaining your unique brand voice and marketing objectives.</p>	3	t	2025-04-24 12:29:28.265987+00	2025-04-24 12:29:28.266047+00	ba785eb26c724cb491d582d0739f2ba9
73029db1c3d04c8e9eed3374cce53630	Adding Prompts	adding-prompts	<p class="whitespace-pre-wrap break-words">Prompts are the instructions you give to the AI to generate content. Well-crafted prompts are essential for getting high-quality, relevant outputs.&nbsp; There is additional information available that will&nbsp; guide you towards creating effective prompts. Here is how you use and manage prompts on the plateform:&nbsp;&nbsp;</p>\r\n<h2 class="text-xl font-bold text-text-100 mt-1 -mb-0.5">Understanding Prompts</h2>\r\n<p class="whitespace-pre-wrap break-words">A prompt in AI Marketing Platform consists of:</p>\r\n<p><strong>Name</strong>: A descriptive title for your prompt</p>\r\n<p><strong>Prompt Text</strong>: The actual instructions for the AI to follow</p>\r\n<p class="whitespace-pre-wrap break-words">Here's an example:</p>\r\n<p class="whitespace-pre-wrap break-words"><em><strong>Name:</strong> Fitness App for Busy Professionals</em></p>\r\n<p class="whitespace-pre-wrap break-words"><em>Create a promotional email about our new fitness app for busy professionals.</em><br><em>The tone should be motivational but professional, and it should be approximately&nbsp;</em><br><em>300-400 words. Include a compelling subject line, a clear call to action,</em><br><em>and emphasize the time-saving benefits of the app. Format the content with</em><br><em>short paragraphs and bullet points for easy scanning.</em></p>\r\n<p class="whitespace-pre-wrap break-words">When you create a prompt, the AI uses it alongside your uploaded content and SEO keywords to generate new material tailored to your specifications.</p>\r\n<h2 class="text-xl font-bold text-text-100 mt-1 -mb-0.5">Adding Prompts</h2>\r\n<p class="whitespace-pre-wrap break-words">There are two ways to gain access to prompts.</p>\r\n<p class="whitespace-pre-wrap break-words"><em><strong>The first is via templates</strong></em>, these prompts are ones you use often and may want to repeat so you save them here and use them in your projects. For example on the 1st of each month you may want to send out a motivational message, so in TEMPLATES you keep a template that has prompts asking for new motivational messages.</p>\r\n<h2 class="text-xl font-bold text-text-100 mt-1 -mb-0.5">Accessing the Prompts Tab Via Templates</h2>\r\n<p>Navigate to your dashboard area</p>\r\n<p>Click the "Templates" tab on the sidebar and create your new template. Give it a name, add your keywords and tags. Then save it.</p>\r\n<p>Once you hit save, you will see the ability to add a new prompt<br><br></p>\r\n<p><img src="https://aimarketingplatform.app/media/blog/images/aimarketing-templates.png" alt="add prompt" width="1360" height="440"></p>\r\n<p class="whitespace-pre-wrap break-words">Now you can go ahead and add as many different prompts as you like. Keep in mind what message you are trying to get across and what the intention behind it is so you use your tokens wisely.</p>\r\n<p class="whitespace-pre-wrap break-words">&nbsp;</p>\r\n<p class="whitespace-pre-wrap break-words"><img src="https://aimarketingplatform.app/media/blog/images/aimarketing-prompt-addtemplate-prompt.png" alt="create prompt" width="1200" height="631"></p>\r\n<p class="whitespace-pre-wrap break-words">&nbsp;</p>\r\n<p class="whitespace-pre-wrap break-words">Once you have them all in place you can keep them there. Then at any time when you create a project you can add the template you create into your projects. We go into more detail in <strong>Creating Your Projects</strong> but this is what it will look like.</p>\r\n<p class="whitespace-pre-wrap break-words">&nbsp;</p>\r\n<p class="whitespace-pre-wrap break-words"><img src="https://aimarketingplatform.app/media/blog/images/ai-marketing-prompts-inprojects.png" alt="prompts in project" width="978" height="377"></p>\r\n<p class="whitespace-pre-wrap break-words">&nbsp;</p>\r\n<p class="whitespace-pre-wrap break-words"><em><strong>The second way to add prompts is when you are creating a project</strong></em>. You may have specific prompts just for this project that you want to add. For example your eCommerce store is having a one-off 50% sale and you need content for it.&nbsp;</p>\r\n<h2 class="text-xl font-bold text-text-100 mt-1 -mb-0.5">Accessing the Prompts Tab Via Projects</h2>\r\n<p>Navigate to your project</p>\r\n<p>Click the "Prompts" tab (the second tab in the project workflow) - see image above.</p>\r\n<p>Here you'll see all existing prompts or get started creating new ones</p>\r\n<h2 class="text-xl font-bold text-text-100 mt-1 -mb-0.5">Creating a New Prompt</h2>\r\n<p>From the Prompts tab, click "Add Prompt"</p>\r\n<p>Enter a descriptive name (e.g., "Email Newsletter Introduction")</p>\r\n<p>Write your prompt instructions in the text area</p>\r\n<p>Click "Save" to create the prompt<br><br></p>\r\n<p>The key differences:</p>\r\n<p><strong>TEMPLATE PROMPTS&nbsp;</strong>are evergreen. They stay there until you delete them. You can reuse them over and over again in as many projects as you like.</p>\r\n<p><strong>PROJECT PROMPTS</strong> are specific to that particular project. They are only used in that project and can not be shared with other projects.</p>	1	t	2025-04-22 14:10:24.343547+00	2025-04-23 09:31:42.691124+00	dce632d060264be880839d654608dd1a
783a8b82d3b643b49362ae46f9fdb1a6	Getting Started with AI Marketing Platform	getting-started-with-ai-marketing-platform	<p>Welcome to AI Marketing Platform! This guide will walk you through the essential steps to set up your account and begin creating AI-generated content.</p>\r\n<h2>Creating Your Account</h2>\r\n<p>Visit the <a href="https://aimarketingplatform.app/admin/"><em><strong><span style="text-decoration: underline;"><span style="color: rgb(132, 63, 161); text-decoration: underline;">AI Marketing Platform website</span></span></strong></em></a><br><br></p>\r\n<p>Click <em><strong>"<a href="https://aimarketingplatform.app/accounts/signup/">Sign Up</a>"</strong></em> in the top right corner<br><br></p>\r\n<p>Fill in your details:<br>- Username<br>- Email address<br>- Password</p>\r\n<p>Click "<em><strong>Create Account</strong></em>" to complete registration</p>\r\n<p>Verify your email address by clicking the link sent to your inbox</p>\r\n<p>&nbsp;</p>\r\n<h2>Understanding the Dashboard</h2>\r\n<p>After logging in, you'll be taken to your dashboard, which displays:</p>\r\n<ul>\r\n<li><strong>Recent Projects</strong>: Quick access to your most recently updated projects</li>\r\n<li><strong>Content Usage Statistics</strong>: Visual indicators showing your token usage for prompts and assets</li>\r\n<li><strong>Quick Actions</strong>: Create new projects or templates with one click<br><br><br></li>\r\n</ul>\r\n<p><img src="https://aimarketingplatform.app/media/blog/images/aimarketing-dashboard.png" alt="ai marketing platform dashboard" width="850" height="461"></p>\r\n<h2><br>Key Terminology</h2>\r\n<p>Before diving in, it's helpful to understand these core concepts:</p>\r\n<ul>\r\n<li><strong>Project</strong>: A container for organizing related content generation work</li>\r\n<li><strong>Asset</strong>: Your source material (text, audio, or video files) that the AI uses as reference</li>\r\n<li><strong>Prompt</strong>: Instructions you create to guide the AI's content generation</li>\r\n<li><strong>Template</strong>: Reusable collections of prompts you can apply to multiple projects</li>\r\n<li><strong>Generated Content</strong>: The final output created by the AI based on your assets and prompts</li>\r\n</ul>\r\n<h2>Creating Your First Project</h2>\r\n<ol>\r\n<li>From the Dashboard, click "Create Project"</li>\r\n<li>Enter a descriptive name for your project (e.g., "Q4 Email Campaign")</li>\r\n<li>Click "Create Project"</li>\r\n</ol>\r\n<p>You'll be redirected to the project detail page with three primary tabs:</p>\r\n<ul>\r\n<li><strong>Upload Media</strong>: Add your source content</li>\r\n<li><strong>Prompts</strong>: Create instructions for the AI</li>\r\n<li><strong>Generate</strong>: Produce and manage your AI-generated content</li>\r\n</ul>\r\n<p>&nbsp;</p>\r\n<h2><img src="https://aimarketingplatform.app/media/blog/images/aimarketing-createproject.png" alt="ai marketing platform my project" width="979" height="347"></h2>\r\n<p>&nbsp;</p>\r\n<p>This is what you see after clicking on the Create Project button. Here you can name your project. You should also use SEO related keywords because these will be used to help generate relevant content for you. Use the tags section so arrange your projects. The tags appear in your dashboard. Click on one and it brings up all projects with the same tag name.</p>\r\n<p>&nbsp;</p>\r\n<p><img src="https://aimarketingplatform.app/media/blog/images/aimarketing-createproject1.png" alt="ai marketing platform creating new ai project" width="958" height="437"></p>\r\n<p>&nbsp;</p>\r\n<p>Once your project has been created you will see it in the Projects Area</p>\r\n<h2><img src="https://aimarketingplatform.app/media/blog/images/aimarketing-createproject2.png" alt="ai marketing create project" width="933" height="341"></h2>\r\n<p>&nbsp;</p>\r\n<p>After creating your project you are automatically moved on to the next stage where you upload your content or assets. See the tags highlighted below. When you have several projects you can click on them to find all projects saved with the same tag.</p>\r\n<p>&nbsp;</p>\r\n<p><img src="https://aimarketingplatform.app/media/blog/images/aimarketing-uploadassets.png" alt="upload assets to AI marketing platform" width="1001" height="461"></p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<h2>Next Steps</h2>\r\n<p>Now that you've created your first project, you're ready to:</p>\r\n<ol>\r\n<li>Upload content files to provide source material</li>\r\n<li>Create custom prompts to guide the AI</li>\r\n<li>Generate your first AI-powered content</li>\r\n</ol>\r\n<h2>&nbsp;</h2>\r\n<p>&nbsp;</p>\r\n<h2>Getting Help</h2>\r\n<p>If you encounter any issues or have questions, we're here to help:</p>\r\n<ul>\r\n<li><strong>Documentation</strong>: Explore our comprehensive guides in the Help Center</li>\r\n<li><strong>Email Support</strong>: Contact admin@aimarketingplatform.app</li>\r\n<li><strong>Live Chat</strong>: Available Monday-Friday, 9am-5pm EST</li>\r\n</ul>\r\n<p>Welcome aboard! We're excited to see what you create with the AI Marketing Platform and what difference it makes to support your business.</p>	0	t	2025-04-21 16:28:15.98564+00	2025-04-22 14:26:21.056486+00	89554f8ee65c44de94dbe23ac7d5f02c
7eac3a6c92d7408799c5b58af822d8f0	Example Prompt Techniques	example-prompt-techniques	<h3 class="text-lg font-bold text-text-100 mt-1 -mb-1.5">Prompt Techniques for Marketing Content</h3>\r\n<p><strong>Persona-based prompting</strong>:</p>\r\n<div class="relative group/copy rounded-lg">\r\n<div class="">\r\n<pre class="code-block__code !my-0 !rounded-lg !text-sm !leading-relaxed"><code>Create content as if you are a [specific marketing persona] writing to [target audience].\r\nFor example: "Create content as if you are a tech-savvy millennial marketing manager\r\nwriting to small business owners aged 45-60 who are hesitant about adopting new technology."</code></pre>\r\n</div>\r\n</div>\r\n<p><strong>Competitor comparison prompting</strong>:</p>\r\n<div class="relative group/copy rounded-lg">\r\n<div class="">\r\n<pre class="code-block__code !my-0 !rounded-lg !text-sm !leading-relaxed"><code>Create content that highlights our key differentiators compared to [competitor]\r\nwithout directly mentioning them by name. Focus on our strengths in [specific areas].</code></pre>\r\n</div>\r\n</div>\r\n<p><strong>Customer journey prompting</strong>:</p>\r\n<div class="relative group/copy rounded-lg">\r\n<div class="">\r\n<pre class="code-block__code !my-0 !rounded-lg !text-sm !leading-relaxed"><code>Write content for customers at the [awareness/consideration/decision] stage\r\nof the buying journey who are experiencing [specific pain point].</code></pre>\r\n</div>\r\n</div>\r\n<p><strong>Template adaptation prompting</strong>:</p>\r\n<div class="relative group/copy rounded-lg">\r\n<div class="">\r\n<pre class="code-block__code !my-0 !rounded-lg !text-sm !leading-relaxed"><code>Adapt this template: [template text] to fit our product [product name]\r\nwhile maintaining the same structure and persuasive elements.</code></pre>\r\n</div>\r\n</div>\r\n<p><strong>Multilingual adaptation prompting</strong>:</p>\r\n<div class="relative group/copy rounded-lg">\r\n<div class="">\r\n<pre class="code-block__code !my-0 !rounded-lg !text-sm !leading-relaxed"><code>Create content in [language] that maintains the same key messaging as our\r\nEnglish content but is culturally appropriate for [target market].</code></pre>\r\n</div>\r\n</div>\r\n<h3 class="text-lg font-bold text-text-100 mt-1 -mb-1.5">Industry-Specific Prompt Examples</h3>\r\n<h4 class="text-base font-bold text-text-100 mt-1">For E-commerce:</h4>\r\n<div class="relative group/copy rounded-lg">\r\n<div class="">\r\n<pre class="code-block__code !my-0 !rounded-lg !text-sm !leading-relaxed"><code>Create a product description for [product] targeting [customer segment].\r\nHighlight the following benefits: [list 3-5 benefits]. Include sensory\r\nlanguage that evokes [specific emotion]. End with a clear call-to-action\r\nthat emphasizes [key selling point].</code></pre>\r\n</div>\r\n</div>\r\n<h4 class="text-base font-bold text-text-100 mt-1">For B2B Services:</h4>\r\n<div class="relative group/copy rounded-lg">\r\n<div class="">\r\n<pre class="code-block__code !my-0 !rounded-lg !text-sm !leading-relaxed"><code>Write a case study about how [service] helped a client in the [industry]\r\novercome [challenge]. Structure it with: 1) Client background (75 words),\r\n2) Challenge (100 words), 3) Solution implementation (150 words),\r\n4) Measurable results with specific metrics (100 words),\r\n5) Client testimonial (50 words).</code></pre>\r\n</div>\r\n</div>\r\n<h4 class="text-base font-bold text-text-100 mt-1">For Real Estate:</h4>\r\n<div class="relative group/copy rounded-lg">\r\n<div class="">\r\n<pre class="code-block__code !my-0 !rounded-lg !text-sm !leading-relaxed"><code>Create a property listing for a [property type] in [location]. Highlight these\r\nkey features: [list features]. Use vivid language to describe the [specific area]\r\nand lifestyle benefits. Include neighborhood highlights and incorporate these\r\nkeywords: [list keywords].</code></pre>\r\n</div>\r\n</div>\r\n<h3 class="text-lg font-bold text-text-100 mt-1 -mb-1.5">&nbsp;</h3>\r\n<h3 class="text-lg font-bold text-text-100 mt-1 -mb-1.5">Iterative Prompt Refinement</h3>\r\n<p class="whitespace-pre-wrap break-words">For optimal results, use this proven refinement process:</p>\r\n<p><strong>Start with a basic prompt</strong>: Begin with a simple prompt based on the CLEAR framework</p>\r\n<p><strong>Review the output</strong>: Identify specific areas for improvement</p>\r\n<p><strong>Refine with specificity</strong>: Add detailed instructions addressing weak areas</p>\r\n<p><strong>Request variations</strong>: Generate multiple versions with slight prompt modifications</p>\r\n<p><strong>Combine elements</strong>: Take the best parts of multiple outputs for final content</p>\r\n<p>&nbsp;</p>\r\n<p>Example of iterative refinement:</p>\r\n<p><strong>Initial prompt</strong>: "Write a marketing email about our new fitness app."</p>\r\n<p><strong>Refined prompt</strong>: "Write a marketing email about our new fitness app 'FitLife Pro' targeting busy professionals aged 30-45. Use a motivational but professional tone. Include a subject line optimized for open rates, 3 key benefits (time efficiency, personalization, and progress tracking), and a clear CTA offering a 14-day free trial. Keep the email under 250 words with short paragraphs and bullet points for scannability."</p>	2	t	2025-04-24 12:24:45.832404+00	2025-04-24 12:30:03.619023+00	dce632d060264be880839d654608dd1a
8579cf197e204767a49b852ed0346469	Managing Prompts	managing-prompts	<p>This part of the documentation covers editing and deleting prompts plus information on token limits.</p>\r\n<h3 class="text-lg font-bold text-text-100 mt-1 -mb-1.5">Editing Prompts</h3>\r\n<p>From the Prompts tab, click on the prompt you want to edit</p>\r\n<p>Make your changes to the name or prompt text</p>\r\n<p>Click "Save" to update</p>\r\n<h3 class="text-lg font-bold text-text-100 mt-1 -mb-1.5">Deleting Prompts</h3>\r\n<p>Locate the prompt in the list</p>\r\n<p>Click the delete (trash) icon next to the prompt</p>\r\n<p>Confirm deletion when prompted</p>\r\n<h2 class="text-xl font-bold text-text-100 mt-1 -mb-0.5">Token Limits</h2>\r\n<p class="whitespace-pre-wrap break-words">Each prompt consumes tokens from your account's quota:</p>\r\n<p>The system calculates tokens based on the length of your prompt text</p>\r\n<p>The token count is displayed when you create or edit a prompt</p>\r\n<p>There's a limit of 20,000 tokens per prompt</p>\r\n<p>Once you have "spent" a token it is not returned if you delete any prompts</p>\r\n<p>If you exceed the limit, you'll need to shorten your prompt</p>	5	t	2025-04-22 14:39:57.705388+00	2025-04-22 14:50:20.389947+00	dce632d060264be880839d654608dd1a
96c2fef230d247e687d729fd4a3e3ecf	Update Your Profile	update-your-profile	<h2 class="text-xl font-bold text-text-100 mt-1 -mb-0.5">&nbsp;</h2>\r\n<p class="whitespace-pre-wrap break-words">The profile area doesn't contain very much information at the time of writing this, but may be updated later. Right now you can change your email address and add information to your bio.</p>\r\n<p class="whitespace-pre-wrap break-words"><img src="https://aimarketingplatform.app/media/blog/images/aimarketing-profile.png" alt="update bio" width="1223" height="523"></p>\r\n<p class="whitespace-pre-wrap break-words">&nbsp;</p>	1	t	2025-04-22 12:53:54.334562+00	2025-04-23 09:26:48.276389+00	ba785eb26c724cb491d582d0739f2ba9
9b1692832ac24996b3c501e630e356f6	Subscriptions	subscriptions	<p>AI Marketing Platform provides a three (3) day free period, giving you time to use the services available before choosing an upgraded plan.</p>\r\n<p>When you join the platform you will receive a "Welcome" email. You will then be sent reminders during your three day period.</p>\r\n<p><img src="https://aimarketingplatform.app/media/blog/images/aimarketing-trialperiodday-email2.png" alt="" width="731" height="408"></p>\r\n<p>In your sidebar you will notice your subscription details, which will count down your three days for you.&nbsp; Once you become a member it will highlight your subscription date.</p>\r\n<p><img src="https://aimarketingplatform.app/media/blog/images/aimarketing-subscription.webp" alt="subscription" width="969" height="359"></p>\r\n<p>We use payment processor Stripe and so your details are 100% secure. Stripe take and keep all your information in their platform. At some point we may also introduce PayPal but for now Stripe is the main option.</p>\r\n<p>&nbsp;</p>\r\n<h2 class="text-2xl font-bold text-gray-900 mb-4">Cancel Your Subscription</h2>\r\n<p>You can cancel your subscription inside the members area. Just click the<strong> Manage Subscription</strong> button in the sidebar and it will take you into the correct area.</p>\r\n<p>As per our <a href="https://aimarketingplatform.app/policy/refund-policy/" target="_blank" rel="noopener"><em><strong>Refund Policy </strong></em></a>there are no refunds available. The Refund &amp; Cancellation Policy outlines the terms and conditions for subscription cancellations and refunds for AI Marketing Platform services. By subscribing to our services, you agree to the terms outlined in this policy. Once you cancel your subscription will continue until the end of your billing period.&nbsp;</p>	0	t	2025-04-24 11:31:59.823293+00	2025-04-24 12:39:54.436025+00	281807aca4e84cc09929d6981c06c946
ab10f59175674af3924ddce3c9253ca5	Content Inspector Tool	content-inspector-tool	<p>Once you have generated your content there is an opportunity to use the Content Inspector Tool. This tool will go through and give you insights into the content that you have and is particuarly useful for longer content like articles or blog posts.</p>\r\n<h2>Keyword Inspector Tool&nbsp;<span style="background-color: rgb(132, 63, 161);"><em>&nbsp;<span style="color: rgb(236, 240, 241);">[NEW FEATURE!]</span></em></span></h2>\r\n<p>Under each piece of generated content is the Keyword Inspector Tool. This tool will look through your content and provide an output of the best keywords available for you to use. You can use these keywords if you are adding the content as a blog post for example. The keywords can become tags and the meta description can be used with your blog post.</p>\r\n<p><img src="https://aimarketingplatform.app/media/blog/images/aimarketing-contentinspection.png" alt="" width="1040" height="273"></p>\r\n<p>&nbsp;</p>\r\n<p>The Keyword Inspector tool also lets you know if a piece of content can be improved. This can be your opportunity to add your own authentic voice to any content produced if you want to do that - and it is recommended. While AI is fast it is still best if you add your own touch to any content produced. This tool helps you get started faster than if you were thinking it up for yourself but it does not always have to be a one and done situation. You can add more to it and amend any content produced to fit your brand.</p>\r\n<p>Click on the <em><strong>VIEW&nbsp; RESULTS</strong></em> link to be taken to the full page.</p>\r\n<p><img src="https://aimarketingplatform.app/media/blog/images/aimarketing-contentinspection1.webp" alt="" width="1039" height="688"></p>\r\n<p>&nbsp;</p>	1	t	2025-04-24 12:20:09.209091+00	2025-04-24 12:30:03.67797+00	1a325f5035c4478babc3c1f2b3d2f12c
\.


--
-- Data for Name: projects_asset; Type: TABLE DATA; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

COPY aimarket_m3rk37tdb.projects_asset (id, title, file_name, file_url, file_type, mime_type, size, content, token_count, created_at, updated_at, project_id) FROM stdin;
\.


--
-- Data for Name: projects_assetprocessingjob; Type: TABLE DATA; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

COPY aimarket_m3rk37tdb.projects_assetprocessingjob (id, status, error_message, attempts, last_heart_beat, created_at, updated_at, asset_id, project_id) FROM stdin;
\.


--
-- Data for Name: projects_generatedcontent; Type: TABLE DATA; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

COPY aimarket_m3rk37tdb.projects_generatedcontent (id, name, result, "order", created_at, updated_at, project_id) FROM stdin;
45a446b860c7450db632183bc68b862e	addiction healing pdf	**Summary of "Addiction, Trauma, and Healing"**\n\nIn exploring the intricate connections between addiction and trauma, the book "Addiction, Trauma, and Healing" delves into how past traumatic experiences can significantly influence the development of addictive behaviors. The main points emphasize the cyclical nature of trauma and addiction, highlighting the need for holistic healing approaches that address both issues concurrently. \n\n**Key Points:**\n\n1. **Interconnection of Trauma and Addiction**: The work underscores that unresolved trauma often underlies addiction, creating a cycle where addiction serves as a coping mechanism for trauma-related distress.\n\n2. **Impact of Early Childhood Experiences**: Adverse childhood experiences (ACEs) are particularly influential in predisposing individuals to both trauma and subsequent addictive behaviors.\n\n3. **Biopsychosocial Approach**: Healing from addiction and trauma requires an integrated approach that considers biological, psychological, and social factors, emphasizing the need for comprehensive treatment strategies.\n\n4. **Role of Therapy and Support Systems**: Effective healing often involves therapeutic interventions like trauma-informed therapy and support systems that empower individuals to process and overcome their past.\n\n5. **Resilience and Recovery**: The text highlights the potential for resilience and recovery, noting that with proper support and intervention, individuals can break free from the cycle of addiction and heal from trauma.\n\n**Keywords**: trauma, addiction, healing, holistic approach, adverse childhood experiences, resilience, recovery, trauma-informed therapy, coping mechanisms, biopsychosocial model.\n\nThis summary reflects the core themes and insights from the book, providing a foundation for understanding how intertwined trauma and addiction are, and the pathways to healing.	1	2025-04-24 17:04:21.244075+00	2025-04-24 17:04:21.244139+00	54c1f50b67304a7b878fe8d4c3a6ca80
54e2105f70e04a68bca1bdfe7175fc9d	articles summary inspirational guidance	Based on the available prompt, here is a possible summary for a collection of articles intended for inspirational guidance:\n\n---\n\n**Summary of Inspirational Guidance Articles**\n\nThis PDF compilation contains a series of articles crafted by ChatGPT, each designed to provide inspirational guidance across various aspects of personal and professional growth. While the exact number of articles is unspecified, the collection is structured to cover a range of topics that aim to motivate and inspire readers to achieve their goals and improve their well-being.\n\n**Main Topics of Discussion:**\n1. Personal Development: Articles focus on cultivating self-awareness, resilience, and a growth mindset.\n2. Professional Growth: Guidance on career advancement, leadership skills, and workplace dynamics.\n3. Mindfulness and Well-being: Strategies for maintaining mental health, stress management, and mindfulness practices.\n4. Creative Inspiration: Encouragement for embracing creativity and innovation in daily life.\n\n**Main Keywords:**\n- Inspiration\n- Personal Growth\n- Mindfulness\n- Motivation\n- Resilience\n- Creativity\n- Leadership\n\nThese articles serve as a valuable resource for individuals seeking to enhance their life journey with practical advice and motivational insights.\n\n--- \n\nThis summary captures the essence of the content based on the given prompt, assuming the primary focus is on inspirational guidance.	2	2025-04-24 17:04:31.237866+00	2025-04-24 17:04:31.237934+00	54c1f50b67304a7b878fe8d4c3a6ca80
6ed4f13536224359838e4c044021f504	tech va summary	Unfortunately, I can't access the content of the PDF due to encoding issues, which prevents me from directly summarizing it. However, I can help you create a generic template for summarizing a document related to tech VA (Virtual Assistant) and MVP (Minimum Viable Product) development support. Here's how you might structure such a summary:\n\n---\n\n**Summary of Tech VA and MVP Development Support**\n\n**Topic Overview:**\nThe document provides an in-depth exploration of how virtual assistants can be integrated into MVP development processes to enhance efficiency and productivity. It outlines strategies for leveraging technology to streamline development and support for new products.\n\n**Key Highlights:**\n\n1. **Understanding Tech VA Roles:**\n   - Definition and scope of virtual assistants in tech development.\n   - Key responsibilities and tasks managed by tech VAs.\n   - Benefits of employing tech VAs in project management and development cycles.\n\n2. **MVP Development Process:**\n   - Explanation of the Minimum Viable Product concept.\n   - Steps involved in planning and executing MVPs.\n   - Importance of MVPs in testing product viability with minimal resources.\n\n3. **Integration of Tech VAs in MVP Development:**\n   - How tech VAs can support MVP development teams.\n   - Case studies or examples where tech VAs have been successfully integrated.\n   - Tools and technologies that facilitate collaboration between VAs and development teams.\n\n4. **Challenges and Solutions:**\n   - Common challenges faced when incorporating VAs into MVP projects.\n   - Proposed solutions and best practices to overcome these challenges.\n   - Future trends in tech VA and MVP development support.\n\n**Conclusion:**\nThe document emphasizes the growing importance of virtual assistants in the tech industry, particularly in supporting agile and lean development methodologies. By integrating tech VAs into MVP processes, companies can expedite product development and improve overall project outcomes.\n\n---\n\nThis template can be adjusted to fit the specific content of the PDF once the encoding issues are resolved.	0	2025-04-24 17:04:09.242161+00	2025-04-24 17:04:09.242234+00	54c1f50b67304a7b878fe8d4c3a6ca80
b9463d427ddd4a1299512ed73bfd21a9	Journal Prompt Blog	**Blog Post 1: Finding Clarity in Times of Uncertainty**\n\nFeeling stuck or unhappy with life can be overwhelming. It's like standing at a crossroads, unsure which path to take. However, this feeling can also be a powerful catalyst for change. Embracing it can lead to profound personal growth and transformation. Here, we'll explore some steps you can take to navigate these uncertain times and find clarity.\n\n**Understanding the Source of Unhappiness**\n\nBefore we can move forward, it's crucial to understand what's causing these feelings. Is it a particular situation, like a job or a relationship, or is it a more general sense of dissatisfaction? Taking the time to reflect on these questions can provide invaluable insights. \n\n**The Power of Journaling**\n\nJournaling can be a transformative tool. It allows you to explore your thoughts and feelings in a safe space. Start by writing about a time when you felt truly happy. What were you doing? Who were you with? This can help you identify what truly matters to you.\n\n**A Brief Story of Transformation**\n\nConsider the story of Emily. She felt trapped in her monotonous job and was constantly stressed. One day, she decided to journal her feelings every morning. Over time, she realized her unhappiness stemmed from a lack of creativity in her daily life. This realization led her to take a painting class, which not only rekindled her passion for art but also brought a new sense of fulfillment to her life.\n\n**Actionable Journal Prompt**\n\nReflect on a recent moment of joy. Write about where you were, what you were doing, and who you were with. Identify one small step you can take to incorporate more of these moments into your daily life.\n\n---\n\n**Blog Post 2: Embracing Change and Building a New Path**\n\nChange is often daunting, especially when you're feeling unhappy and uncertain about the future. Yet, it's through change that we discover new opportunities and paths to happiness. Let's explore how you can embrace change and start building a more fulfilling life.\n\n**Identifying the Need for Change**\n\nThe first step in embracing change is acknowledging the need for it. Ask yourself: What aspects of my life are no longer serving me? Be honest with yourself. Recognizing these areas is the foundation for creating meaningful change.\n\n**The Role of Mindset**\n\nYour mindset plays a critical role in how you perceive and handle change. Viewing change as an opportunity rather than a threat can make a significant difference. Consider adopting a growth mindset, where challenges are seen as opportunities to learn and grow.\n\n**A Story of Courageous Change**\n\nTake the example of Jake, who felt his life was in a rut. He had always dreamed of living abroad but was afraid to leave his comfort zone. After months of contemplation and journaling about his fears and dreams, he took the leap and moved to a new country. The experience was transformative, opening new doors and enriching his life in ways he never imagined.\n\n**Actionable Journal Prompt**\n\nThink about a change you've been contemplating, no matter how small. Write about your fears and the potential benefits. Identify one action, however minor, that you can take this week to move toward that change.\n\nBy taking these steps, you can start to navigate through your unhappiness and find a path that leads to a more fulfilling and joyful life. Remember, change begins with small steps, and journaling can be your guide along the way.	1	2025-04-24 16:47:59.376021+00	2025-04-24 16:47:59.376068+00	729d679a5082403a8b48a7f56cb06f0b
becc971312f04b00af77a143adfb60c4	LinkedIn post with tweets	**LinkedIn Post 1: The Balance Between AI Assistance and Authenticity**\n\nAs a content creator or influencer looking to grow your brand on LinkedIn, you might be exploring AI content creation tools to enhance your workflow. While AI can be a powerful ally in managing content creation, it should never replace your unique voice and brand identity.\n\nAI platforms can streamline your process by automating repetitive tasks, generating ideas, and optimizing content for different formats. For instance, imagine uploading your customer feedback and instantly receiving executive summaries that highlight key themes and sentiments. This saves you time and allows you to create data-driven messaging that resonates with your audience.\n\nHowever, the magic happens when you infuse these AI-generated insights with your personal touch. Your audience connects with the authenticity and passion that only you can provide. So, let AI handle the groundwork, but always remember to weave your story, values, and personality into your content. After all, your brand is uniquely yours.\n\n**LinkedIn Post 2: Amplify Your Brand with AI, Without Losing Your Voice**\n\nIn the fast-paced world of content creation, AI tools can be game-changers for influencers and brands aiming to amplify their presence on LinkedIn. But here's the crucial tip: AI should be your assistant, not your voice.\n\nAI-powered platforms offer incredible benefitslike transforming long customer testimonials into concise, impactful statements for your website and social media. They can even generate personalized response templates for customer reviews, ensuring you maintain a professional and empathetic tone.\n\nThese tools are designed to make your life easier by saving time and providing strategic insights. Yet, your brands authenticity is irreplaceable. Use AI for efficiency, but let your voice shine through in every post and interaction. Authentic engagement builds trust and loyaltyqualities AI can't replicate.\n\nStay true to your brands essence while harnessing AI's capabilities to scale your impact. It's the synergy of human creativity and AI efficiency that will set your brand apart.\n\n**Tweets Derived from the LinkedIn Posts:**\n\n1. "AI is a powerful tool for content creators, but let it assistnot replaceyour unique voice. Your brand is uniquely yours! #ContentCreation #BrandAuthenticity"\n\n2. "Streamline your content workflow with AI insights, but remember: Authenticity is key. Infuse your personal touch into every piece! #AIandBranding"\n\n3. "AI platforms can save you time by automating repetitive tasks, but the magic lies in blending these insights with your authentic voice. #ContentStrategy"\n\n4. "Transform customer feedback into data-driven messaging with AI, yet always weave your story and personality into your content. #BrandVoice"\n\n5. "Amplify your brand with AI without losing your voice. Let AI handle the groundwork, but keep your brand's essence alive! #AIforCreators"\n\n6. "AI can help craft personalized responses for reviews, maintaining professionalism. But your authentic engagement builds trust. #CustomerEngagement"\n\n7. "Use AI tools for efficiency, but let your unique voice shine through. It's the synergy of human creativity and AI that will set your brand apart. #AIandCreativity"	0	2025-04-25 13:58:14.119431+00	2025-04-25 13:58:14.119503+00	6f38c34a761c44d999dd7b900ca6aa28
\.


--
-- Data for Name: projects_project; Type: TABLE DATA; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

COPY aimarket_m3rk37tdb.projects_project (id, title, created_at, updated_at, user_id, keywords, language_preference) FROM stdin;
54c1f50b67304a7b878fe8d4c3a6ca80	testing	2025-04-22 12:01:49.18674+00	2025-04-22 12:01:49.186813+00	2	test	us
6f38c34a761c44d999dd7b900ca6aa28	AI Marketing Platform	2025-04-22 11:31:37.466981+00	2025-04-25 13:37:26.175834+00	2	AI content creation assistant, AI to generate content ideas, content creation workflow with AI, AI tools for content creators 2025 , ethical AI assistant, content repurposing tool	us
729d679a5082403a8b48a7f56cb06f0b	Pen And I Publishing	2025-04-22 07:06:23.128077+00	2025-04-22 07:06:23.128144+00	3	journal writing, memoir writing, journal prompts, memoir writing prompts, write memoir, journal writing tips	us
8b7a930135a1489f87535ba303971483	what am i doing	2025-04-25 07:04:49.404954+00	2025-04-25 07:04:49.405008+00	3	can i	us
\.


--
-- Data for Name: projects_prompt; Type: TABLE DATA; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

COPY aimarket_m3rk37tdb.projects_prompt (id, name, prompt, token_count, "order", created_at, updated_at, project_id, keywords) FROM stdin;
\.


--
-- Data for Name: prompt_generator_generatedprompt; Type: TABLE DATA; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

COPY aimarket_m3rk37tdb.prompt_generator_generatedprompt (id, name, prompt_text, parameters_used, token_count, created_at, user_id, template_id) FROM stdin;
\.


--
-- Data for Name: prompt_generator_generatorcategory; Type: TABLE DATA; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

COPY aimarket_m3rk37tdb.prompt_generator_generatorcategory (id, name, description, icon, is_active, "order") FROM stdin;
\.


--
-- Data for Name: prompt_generator_generatorparameter; Type: TABLE DATA; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

COPY aimarket_m3rk37tdb.prompt_generator_generatorparameter (id, name, display_name, description, parameter_type, options, default_value, is_required, "order", template_id) FROM stdin;
\.


--
-- Data for Name: prompt_generator_generatortemplate; Type: TABLE DATA; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

COPY aimarket_m3rk37tdb.prompt_generator_generatortemplate (id, name, description, template_text, is_featured, is_active, created_at, updated_at, category_id) FROM stdin;
\.


--
-- Data for Name: prompts_prompt; Type: TABLE DATA; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

COPY aimarket_m3rk37tdb.prompts_prompt (id, name, prompt, token_count, "order", created_at, updated_at, project_id) FROM stdin;
450a8d5245784fbaa1d9c4b6c77865bd	LinkedIn post with tweets	You are a social media expert who knows the best ways to build a brand on LinkedIn. Create two LinkedIn posts that will focus on how using an AI content creation assistant and help make their life easier but should never replace their own voice and their own brand. The article is for content creators/influencers looking to increase brand awareness. focus on the tools the AI Marketing platform have and how they can help with that but focus more on the pain points they have and how the platform solves them. I want two articles and then at least 7 Tweets that have been created from these articles.	117	0	2025-04-25 13:48:18.525695+00	2025-04-25 13:57:36.984971+00	6f38c34a761c44d999dd7b900ca6aa28
a7a40fc9d0114cf98b4021dfb90c7c91	tech va summary	provide a summary of the pdf tech va and mvp development support. what are the highlights of this pdf. what is the topic and summarise what is being said.	34	0	2025-04-24 17:03:39.298263+00	2025-04-24 17:03:39.29833+00	54c1f50b67304a7b878fe8d4c3a6ca80
aa3bd49811364928934801f92b3ed8c2	addiction healing pdf	provide a summary of the pdf addiction, trauma and healing. what are the main points and keywords to consider	21	0	2025-04-24 17:02:57.674054+00	2025-04-24 17:02:57.674112+00	54c1f50b67304a7b878fe8d4c3a6ca80
cc59642a9e6041b0818598bed5d23aba	articles summary inspirational guidance	provide a summary of my pdf articles for inspirational guidance written by chatgpt. what articles are contained. what is the main topic of discussion. how many articles does this pdf contain. what are the main keywords.	43	0	2025-04-24 17:03:17.837112+00	2025-04-24 17:03:17.83716+00	54c1f50b67304a7b878fe8d4c3a6ca80
\.


--
-- Data for Name: seo_optimization_keywordtracking; Type: TABLE DATA; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

COPY aimarket_m3rk37tdb.seo_optimization_keywordtracking (id, keyword, relevance_score, is_primary, created_at, updated_at, user_id) FROM stdin;
36f52837a2554782a8b84662e1f20016	life	3.84	f	2025-04-24 11:49:04.024341+00	2025-04-24 11:49:04.036113+00	3
64176332c1e14bd39e4d0b0019b0cb9f	change	4.32	f	2025-04-24 11:49:03.998646+00	2025-04-24 11:49:04.015649+00	3
7ce7f24293c04f3fb1b15a54a53080b0	transforming customer feedback	0.6000000000000001	f	2025-04-25 13:51:27.153229+00	2025-04-25 13:51:27.167356+00	2
7fad7f7275764fd78fe525b8d95f779a	customer feedback actionable	0	f	2025-04-25 13:51:27.174129+00	2025-04-25 13:51:27.174195+00	2
8bb10d3a10314a9c9517d8dd539bfbb3	joy	2.4000000000000004	f	2025-04-24 11:49:04.067051+00	2025-04-24 11:49:04.075276+00	3
b121796417ef4ea3b932d37379340f84	save time skip	0	f	2025-04-25 13:51:27.136773+00	2025-04-25 13:51:27.136829+00	2
d9edeaa064734b50a0573bb809aa78c1	save time	5.9399999999999995	f	2025-04-25 13:51:27.119507+00	2025-04-25 13:51:27.130707+00	2
dec98be392b2403688dabe3430e2a4a9	journal prompts	1.44	t	2025-04-24 11:49:04.046023+00	2025-04-24 11:51:17.829606+00	3
e8b6280fd307455d956c2fcbbb8e5b25	take	2.4000000000000004	f	2025-04-24 11:49:04.082991+00	2025-04-24 11:49:04.091361+00	3
e91deec3a8d34de3ad3bbcbbbfd8a8fc	feedback actionable insights	0	f	2025-04-25 13:51:27.184853+00	2025-04-25 13:51:27.184945+00	2
\.


--
-- Data for Name: seo_optimization_keywordtracking_projects; Type: TABLE DATA; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

COPY aimarket_m3rk37tdb.seo_optimization_keywordtracking_projects (id, keywordtracking_id, project_id) FROM stdin;
2	36f52837a2554782a8b84662e1f20016	729d679a5082403a8b48a7f56cb06f0b
1	64176332c1e14bd39e4d0b0019b0cb9f	729d679a5082403a8b48a7f56cb06f0b
8	7ce7f24293c04f3fb1b15a54a53080b0	6f38c34a761c44d999dd7b900ca6aa28
9	7fad7f7275764fd78fe525b8d95f779a	6f38c34a761c44d999dd7b900ca6aa28
4	8bb10d3a10314a9c9517d8dd539bfbb3	729d679a5082403a8b48a7f56cb06f0b
7	b121796417ef4ea3b932d37379340f84	6f38c34a761c44d999dd7b900ca6aa28
6	d9edeaa064734b50a0573bb809aa78c1	6f38c34a761c44d999dd7b900ca6aa28
3	dec98be392b2403688dabe3430e2a4a9	729d679a5082403a8b48a7f56cb06f0b
5	e8b6280fd307455d956c2fcbbb8e5b25	729d679a5082403a8b48a7f56cb06f0b
10	e91deec3a8d34de3ad3bbcbbbfd8a8fc	6f38c34a761c44d999dd7b900ca6aa28
\.


--
-- Data for Name: seo_optimization_seoanalysis; Type: TABLE DATA; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

COPY aimarket_m3rk37tdb.seo_optimization_seoanalysis (id, readability_score, keyword_density, suggested_keywords, meta_description, seo_score, improvement_suggestions, created_at, updated_at, content_id, project_id) FROM stdin;
\.


--
-- Data for Name: subscriptions_subscription; Type: TABLE DATA; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

COPY aimarket_m3rk37tdb.subscriptions_subscription (id, stripe_subscription_id, stripe_customer_id, subscription_type, payment_status, start_date, end_date, created_at, updated_at, user_id) FROM stdin;
1	\N	cus_SBhk8t0Jt95z8T	monthly	incomplete	2025-04-24 07:36:32.423252+00	\N	2025-04-24 07:36:32.424026+00	2025-04-24 07:36:32.424061+00	3
\.


--
-- Data for Name: subscriptions_userprofile; Type: TABLE DATA; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

COPY aimarket_m3rk37tdb.subscriptions_userprofile (id, signup_date, user_id, trial_ended_email_sent, trial_reminder_1_day_sent, trial_reminder_3_days_sent) FROM stdin;
1	2025-04-16 13:25:35.177318+00	1	f	f	f
2	2025-04-16 13:26:12.438091+00	2	f	f	f
3	2025-04-21 16:32:18.524167+00	3	f	f	f
\.


--
-- Data for Name: accounts_memberresource; Type: TABLE DATA; Schema: public; Owner: aimarket_m3rk37t_user
--

COPY public.accounts_memberresource (id, title, description, file, thumbnail, created_at, is_active) FROM stdin;
\.


--
-- Data for Name: accounts_profile; Type: TABLE DATA; Schema: public; Owner: aimarket_m3rk37t_user
--

COPY public.accounts_profile (id, created_at, updated_at, user_id, bio) FROM stdin;
\.


--
-- Data for Name: accounts_stripecustomer; Type: TABLE DATA; Schema: public; Owner: aimarket_m3rk37t_user
--

COPY public.accounts_stripecustomer (id, stripe_customer_id, created_at, user_id) FROM stdin;
\.


--
-- Data for Name: accounts_subscription; Type: TABLE DATA; Schema: public; Owner: aimarket_m3rk37t_user
--

COPY public.accounts_subscription (id, stripe_subscription_id, created_at, user_id) FROM stdin;
\.


--
-- Data for Name: accounts_tokenusage; Type: TABLE DATA; Schema: public; Owner: aimarket_m3rk37t_user
--

COPY public.accounts_tokenusage (id, prompt_tokens_used, asset_tokens_used, last_reset_date, user_id) FROM stdin;
\.


--
-- Data for Name: assets_asset; Type: TABLE DATA; Schema: public; Owner: aimarket_m3rk37t_user
--

COPY public.assets_asset (id, title, file_name, file_url, file_type, mime_type, size, content, token_count, created_at, updated_at, project_id) FROM stdin;
\.


--
-- Data for Name: assets_assetprocessingjob; Type: TABLE DATA; Schema: public; Owner: aimarket_m3rk37t_user
--

COPY public.assets_assetprocessingjob (id, status, error_message, attempts, last_heart_beat, created_at, updated_at, asset_id, project_id) FROM stdin;
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: aimarket_m3rk37t_user
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: aimarket_m3rk37t_user
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: aimarket_m3rk37t_user
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add permission	1	add_permission
2	Can change permission	1	change_permission
3	Can delete permission	1	delete_permission
4	Can view permission	1	view_permission
5	Can add group	2	add_group
6	Can change group	2	change_group
7	Can delete group	2	delete_group
8	Can view group	2	view_group
9	Can add user	3	add_user
10	Can change user	3	change_user
11	Can delete user	3	delete_user
12	Can view user	3	view_user
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add profile	5	add_profile
18	Can change profile	5	change_profile
19	Can delete profile	5	delete_profile
20	Can view profile	5	view_profile
21	Can add stripe customer	6	add_stripecustomer
22	Can change stripe customer	6	change_stripecustomer
23	Can delete stripe customer	6	delete_stripecustomer
24	Can view stripe customer	6	view_stripecustomer
25	Can add subscription	7	add_subscription
26	Can change subscription	7	change_subscription
27	Can delete subscription	7	delete_subscription
28	Can view subscription	7	view_subscription
29	Can add token usage	8	add_tokenusage
30	Can change token usage	8	change_tokenusage
31	Can delete token usage	8	delete_tokenusage
32	Can view token usage	8	view_tokenusage
33	Can add session	9	add_session
34	Can change session	9	change_session
35	Can delete session	9	delete_session
36	Can view session	9	view_session
37	Can add asset	10	add_asset
38	Can change asset	10	change_asset
39	Can delete asset	10	delete_asset
40	Can view asset	10	view_asset
41	Can add asset processing job	11	add_assetprocessingjob
42	Can change asset processing job	11	change_assetprocessingjob
43	Can delete asset processing job	11	delete_assetprocessingjob
44	Can view asset processing job	11	view_assetprocessingjob
45	Can add prompt	12	add_prompt
46	Can change prompt	12	change_prompt
47	Can delete prompt	12	delete_prompt
48	Can view prompt	12	view_prompt
49	Can add project	13	add_project
50	Can change project	13	change_project
51	Can delete project	13	delete_project
52	Can view project	13	view_project
53	Can add generated content	14	add_generatedcontent
54	Can change generated content	14	change_generatedcontent
55	Can delete generated content	14	delete_generatedcontent
56	Can view generated content	14	view_generatedcontent
57	Can add prompt	15	add_prompt
58	Can change prompt	15	change_prompt
59	Can delete prompt	15	delete_prompt
60	Can view prompt	15	view_prompt
61	Can add asset	16	add_asset
62	Can change asset	16	change_asset
63	Can delete asset	16	delete_asset
64	Can view asset	16	view_asset
65	Can add asset processing job	17	add_assetprocessingjob
66	Can change asset processing job	17	change_assetprocessingjob
67	Can delete asset processing job	17	delete_assetprocessingjob
68	Can view asset processing job	17	view_assetprocessingjob
69	Can add member resource	18	add_memberresource
70	Can change member resource	18	change_memberresource
71	Can delete member resource	18	delete_memberresource
72	Can view member resource	18	view_memberresource
73	Can add log entry	19	add_logentry
74	Can change log entry	19	change_logentry
75	Can delete log entry	19	delete_logentry
76	Can view log entry	19	view_logentry
77	Can add subscription	20	add_subscription
78	Can change subscription	20	change_subscription
79	Can delete subscription	20	delete_subscription
80	Can view subscription	20	view_subscription
81	Can add user profile	21	add_userprofile
82	Can change user profile	21	change_userprofile
83	Can delete user profile	21	delete_userprofile
84	Can view user profile	21	view_userprofile
85	Can add task result	22	add_taskresult
86	Can change task result	22	change_taskresult
87	Can delete task result	22	delete_taskresult
88	Can view task result	22	view_taskresult
89	Can add chord counter	23	add_chordcounter
90	Can change chord counter	23	change_chordcounter
91	Can delete chord counter	23	delete_chordcounter
92	Can view chord counter	23	view_chordcounter
93	Can add group result	24	add_groupresult
94	Can change group result	24	change_groupresult
95	Can delete group result	24	delete_groupresult
96	Can view group result	24	view_groupresult
97	Can add template	25	add_template
98	Can change template	25	change_template
99	Can delete template	25	delete_template
100	Can view template	25	view_template
101	Can add template prompt	26	add_templateprompt
102	Can change template prompt	26	change_templateprompt
103	Can delete template prompt	26	delete_templateprompt
104	Can view template prompt	26	view_templateprompt
105	Can add AI Configuration	27	add_aiconfig
106	Can change AI Configuration	27	change_aiconfig
107	Can delete AI Configuration	27	delete_aiconfig
108	Can view AI Configuration	27	view_aiconfig
109	Can add content generation job	28	add_contentgenerationjob
110	Can change content generation job	28	change_contentgenerationjob
111	Can delete content generation job	28	delete_contentgenerationjob
112	Can view content generation job	28	view_contentgenerationjob
113	Can add Prompt Template	29	add_prompttemplate
114	Can change Prompt Template	29	change_prompttemplate
115	Can delete Prompt Template	29	delete_prompttemplate
116	Can view Prompt Template	29	view_prompttemplate
117	Can add category	30	add_category
118	Can change category	30	change_category
119	Can delete category	30	delete_category
120	Can view category	30	view_category
121	Can add post	31	add_post
122	Can change post	31	change_post
123	Can delete post	31	delete_post
124	Can view post	31	view_post
125	Can add documentation category	32	add_documentationcategory
126	Can change documentation category	32	change_documentationcategory
127	Can delete documentation category	32	delete_documentationcategory
128	Can view documentation category	32	view_documentationcategory
129	Can add documentation page	33	add_documentationpage
130	Can change documentation page	33	change_documentationpage
131	Can delete documentation page	33	delete_documentationpage
132	Can view documentation page	33	view_documentationpage
133	Can add tag	34	add_tag
134	Can change tag	34	change_tag
135	Can delete tag	34	delete_tag
136	Can view tag	34	view_tag
137	Can add tagged item	35	add_taggeditem
138	Can change tagged item	35	change_taggeditem
139	Can delete tagged item	35	delete_taggeditem
140	Can view tagged item	35	view_taggeditem
141	Can add Contact Message	36	add_contactmessage
142	Can change Contact Message	36	change_contactmessage
143	Can delete Contact Message	36	delete_contactmessage
144	Can view Contact Message	36	view_contactmessage
145	Can add SEO Analysis	37	add_seoanalysis
146	Can change SEO Analysis	37	change_seoanalysis
147	Can delete SEO Analysis	37	delete_seoanalysis
148	Can view SEO Analysis	37	view_seoanalysis
149	Can add keyword tracking	38	add_keywordtracking
150	Can change keyword tracking	38	change_keywordtracking
151	Can delete keyword tracking	38	delete_keywordtracking
152	Can view keyword tracking	38	view_keywordtracking
153	Can add generator category	39	add_generatorcategory
154	Can change generator category	39	change_generatorcategory
155	Can delete generator category	39	delete_generatorcategory
156	Can view generator category	39	view_generatorcategory
157	Can add generator template	40	add_generatortemplate
158	Can change generator template	40	change_generatortemplate
159	Can delete generator template	40	delete_generatortemplate
160	Can view generator template	40	view_generatortemplate
161	Can add generator parameter	41	add_generatorparameter
162	Can change generator parameter	41	change_generatorparameter
163	Can delete generator parameter	41	delete_generatorparameter
164	Can view generator parameter	41	view_generatorparameter
165	Can add generated prompt	42	add_generatedprompt
166	Can change generated prompt	42	change_generatedprompt
167	Can delete generated prompt	42	delete_generatedprompt
168	Can view generated prompt	42	view_generatedprompt
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: aimarket_m3rk37t_user
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: aimarket_m3rk37t_user
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: aimarket_m3rk37t_user
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: blog_category; Type: TABLE DATA; Schema: public; Owner: aimarket_m3rk37t_user
--

COPY public.blog_category (id, name, slug) FROM stdin;
\.


--
-- Data for Name: blog_post; Type: TABLE DATA; Schema: public; Owner: aimarket_m3rk37t_user
--

COPY public.blog_post (id, title, slug, status, featured, created, updated, publish_date, content, image, external_image_url, youtube_url, thumbnail, ad_type, ad_code, ad_image, ad_url, meta_title, meta_description, meta_keywords, category_id) FROM stdin;
\.


--
-- Data for Name: content_generation_aiconfig; Type: TABLE DATA; Schema: public; Owner: aimarket_m3rk37t_user
--

COPY public.content_generation_aiconfig (id, name, model_name, fallback_model, temperature, max_tokens, is_active) FROM stdin;
\.


--
-- Data for Name: content_generation_contentgenerationjob; Type: TABLE DATA; Schema: public; Owner: aimarket_m3rk37t_user
--

COPY public.content_generation_contentgenerationjob (id, status, started_at, completed_at, prompts_total, prompts_completed, error_message, project_id, user_id) FROM stdin;
\.


--
-- Data for Name: content_generation_prompttemplate; Type: TABLE DATA; Schema: public; Owner: aimarket_m3rk37t_user
--

COPY public.content_generation_prompttemplate (id, name, content_type, system_prompt, description, is_active, is_default, created_at, updated_at, user_id) FROM stdin;
\.


--
-- Data for Name: content_templates_template; Type: TABLE DATA; Schema: public; Owner: aimarket_m3rk37t_user
--

COPY public.content_templates_template (id, title, created_at, updated_at, user_id, keywords, description) FROM stdin;
\.


--
-- Data for Name: content_templates_templateprompt; Type: TABLE DATA; Schema: public; Owner: aimarket_m3rk37t_user
--

COPY public.content_templates_templateprompt (id, name, prompt, token_count, "order", created_at, updated_at, template_id) FROM stdin;
\.


--
-- Data for Name: core_contactmessage; Type: TABLE DATA; Schema: public; Owner: aimarket_m3rk37t_user
--

COPY public.core_contactmessage (id, first_name, subject, message, created_at, is_read, status, user_id) FROM stdin;
\.


--
-- Data for Name: core_tag; Type: TABLE DATA; Schema: public; Owner: aimarket_m3rk37t_user
--

COPY public.core_tag (id, name, user_id) FROM stdin;
\.


--
-- Data for Name: core_taggeditem; Type: TABLE DATA; Schema: public; Owner: aimarket_m3rk37t_user
--

COPY public.core_taggeditem (id, object_id, content_type_id, tag_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: aimarket_m3rk37t_user
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_celery_results_chordcounter; Type: TABLE DATA; Schema: public; Owner: aimarket_m3rk37t_user
--

COPY public.django_celery_results_chordcounter (id, group_id, sub_tasks, count) FROM stdin;
\.


--
-- Data for Name: django_celery_results_groupresult; Type: TABLE DATA; Schema: public; Owner: aimarket_m3rk37t_user
--

COPY public.django_celery_results_groupresult (id, group_id, date_created, date_done, content_type, content_encoding, result) FROM stdin;
\.


--
-- Data for Name: django_celery_results_taskresult; Type: TABLE DATA; Schema: public; Owner: aimarket_m3rk37t_user
--

COPY public.django_celery_results_taskresult (id, task_id, status, content_type, content_encoding, result, date_done, traceback, meta, task_args, task_kwargs, task_name, worker, date_created, periodic_task_name, date_started) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: aimarket_m3rk37t_user
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	auth	permission
2	auth	group
3	auth	user
4	contenttypes	contenttype
5	accounts	profile
6	accounts	stripecustomer
7	accounts	subscription
8	accounts	tokenusage
9	sessions	session
10	projects	asset
11	projects	assetprocessingjob
12	projects	prompt
13	projects	project
14	projects	generatedcontent
15	prompts	prompt
16	assets	asset
17	assets	assetprocessingjob
18	accounts	memberresource
19	admin	logentry
20	subscriptions	subscription
21	subscriptions	userprofile
22	django_celery_results	taskresult
23	django_celery_results	chordcounter
24	django_celery_results	groupresult
25	content_templates	template
26	content_templates	templateprompt
27	content_generation	aiconfig
28	content_generation	contentgenerationjob
29	content_generation	prompttemplate
30	blog	category
31	blog	post
32	docs	documentationcategory
33	docs	documentationpage
34	core	tag
35	core	taggeditem
36	core	contactmessage
37	seo_optimization	seoanalysis
38	seo_optimization	keywordtracking
39	prompt_generator	generatorcategory
40	prompt_generator	generatortemplate
41	prompt_generator	generatorparameter
42	prompt_generator	generatedprompt
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: aimarket_m3rk37t_user
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2025-05-11 20:18:38.479193+00
2	auth	0001_initial	2025-05-11 20:18:38.550055+00
3	accounts	0001_initial	2025-05-11 20:18:38.591953+00
4	accounts	0002_profile_bio	2025-05-11 20:18:38.601562+00
5	accounts	0003_tokenusage	2025-05-11 20:18:38.618901+00
6	contenttypes	0002_remove_content_type_name	2025-05-11 20:23:36.425862+00
7	auth	0002_alter_permission_name_max_length	2025-05-11 20:23:36.434181+00
8	auth	0003_alter_user_email_max_length	2025-05-11 20:23:36.442165+00
9	auth	0004_alter_user_username_opts	2025-05-11 20:23:36.450217+00
10	auth	0005_alter_user_last_login_null	2025-05-11 20:23:36.458296+00
11	auth	0006_require_contenttypes_0002	2025-05-11 20:23:36.459784+00
12	auth	0007_alter_validators_add_error_messages	2025-05-11 20:23:36.466273+00
13	auth	0008_alter_user_username_max_length	2025-05-11 20:23:36.477114+00
14	auth	0009_alter_user_last_name_max_length	2025-05-11 20:23:36.485648+00
15	auth	0010_alter_group_name_max_length	2025-05-11 20:23:36.494634+00
16	auth	0011_update_proxy_permissions	2025-05-11 20:23:36.502333+00
17	auth	0012_alter_user_first_name_max_length	2025-05-11 20:23:36.510001+00
18	sessions	0001_initial	2025-05-11 20:24:14.961409+00
19	projects	0001_initial	2025-05-11 20:24:47.95965+00
20	prompts	0001_initial	2025-05-11 20:24:47.979136+00
21	assets	0001_initial	2025-05-11 20:25:05.021001+00
22	assets	0002_alter_asset_file_type_alter_asset_file_url_and_more	2025-05-11 20:25:05.086527+00
23	assets	0003_alter_asset_file_type	2025-05-11 20:25:05.100137+00
24	accounts	0004_initialize_token_usage	2025-05-11 20:25:15.657224+00
25	accounts	0005_memberresource	2025-05-11 20:25:15.6666+00
26	projects	0002_prompt_keywords	2025-05-11 20:25:26.988537+00
27	projects	0003_project_keywords	2025-05-11 20:25:27.007373+00
28	projects	0004_project_language_preference	2025-05-11 20:25:27.022978+00
29	admin	0001_initial	2025-05-11 20:25:43.102394+00
30	admin	0002_logentry_remove_auto_add	2025-05-11 20:25:43.113331+00
31	admin	0003_logentry_add_action_flag_choices	2025-05-11 20:25:43.122182+00
32	blog	0001_initial	2025-05-11 20:25:43.151275+00
33	blog	0002_alter_post_content	2025-05-11 20:25:43.155953+00
34	content_generation	0001_inital	2025-05-11 20:25:43.186314+00
35	content_generation	0002_alter_aiconfig_fallback_model	2025-05-11 20:25:43.188942+00
36	content_generation	0003_prompttemplate	2025-05-11 20:25:43.219854+00
37	content_templates	0001_initial	2025-05-11 20:25:43.268771+00
38	content_templates	0002_template_keywords	2025-05-11 20:25:43.284302+00
39	content_templates	0003_template_description_alter_templateprompt_template	2025-05-11 20:25:43.311296+00
40	core	0001_initial	2025-05-11 20:25:43.38038+00
41	core	0002_contactmessage	2025-05-11 20:25:43.415588+00
42	django_celery_results	0001_initial	2025-05-11 20:25:43.432253+00
43	django_celery_results	0002_add_task_name_args_kwargs	2025-05-11 20:25:43.440471+00
44	django_celery_results	0003_auto_20181106_1101	2025-05-11 20:25:43.443409+00
45	django_celery_results	0004_auto_20190516_0412	2025-05-11 20:25:43.476794+00
46	django_celery_results	0005_taskresult_worker	2025-05-11 20:25:43.484735+00
47	django_celery_results	0006_taskresult_date_created	2025-05-11 20:25:43.514217+00
48	django_celery_results	0007_remove_taskresult_hidden	2025-05-11 20:25:43.517966+00
49	django_celery_results	0008_chordcounter	2025-05-11 20:25:43.531425+00
50	django_celery_results	0009_groupresult	2025-05-11 20:25:43.615456+00
51	django_celery_results	0010_remove_duplicate_indices	2025-05-11 20:25:43.621585+00
52	django_celery_results	0011_taskresult_periodic_task_name	2025-05-11 20:25:43.625056+00
53	django_celery_results	0012_taskresult_date_started	2025-05-11 20:25:43.628039+00
54	django_celery_results	0013_taskresult_django_cele_periodi_1993cf_idx	2025-05-11 20:25:43.633262+00
55	django_celery_results	0014_alter_taskresult_status	2025-05-11 20:25:43.636037+00
56	docs	0001_initial	2025-05-11 20:25:43.661187+00
57	docs	0002_alter_documentationpage_content	2025-05-11 20:25:43.665443+00
58	prompt_generator	0001_initial	2025-05-11 20:25:43.722574+00
59	seo_optimization	0001_initial	2025-05-11 20:25:43.801972+00
60	subscriptions	0001_initial	2025-05-11 20:25:43.866161+00
61	subscriptions	0002_userprofile_trial_ended_email_sent_and_more	2025-05-11 20:25:43.917607+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: aimarket_m3rk37t_user
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
\.


--
-- Data for Name: docs_documentationcategory; Type: TABLE DATA; Schema: public; Owner: aimarket_m3rk37t_user
--

COPY public.docs_documentationcategory (id, name, slug, description, "order") FROM stdin;
\.


--
-- Data for Name: docs_documentationpage; Type: TABLE DATA; Schema: public; Owner: aimarket_m3rk37t_user
--

COPY public.docs_documentationpage (id, title, slug, content, "order", is_published, created_at, updated_at, category_id) FROM stdin;
\.


--
-- Data for Name: projects_asset; Type: TABLE DATA; Schema: public; Owner: aimarket_m3rk37t_user
--

COPY public.projects_asset (id, title, file_name, file_url, file_type, mime_type, size, content, token_count, created_at, updated_at, project_id) FROM stdin;
\.


--
-- Data for Name: projects_assetprocessingjob; Type: TABLE DATA; Schema: public; Owner: aimarket_m3rk37t_user
--

COPY public.projects_assetprocessingjob (id, status, error_message, attempts, last_heart_beat, created_at, updated_at, asset_id, project_id) FROM stdin;
\.


--
-- Data for Name: projects_generatedcontent; Type: TABLE DATA; Schema: public; Owner: aimarket_m3rk37t_user
--

COPY public.projects_generatedcontent (id, name, result, "order", created_at, updated_at, project_id) FROM stdin;
\.


--
-- Data for Name: projects_project; Type: TABLE DATA; Schema: public; Owner: aimarket_m3rk37t_user
--

COPY public.projects_project (id, title, created_at, updated_at, user_id, keywords, language_preference) FROM stdin;
\.


--
-- Data for Name: projects_prompt; Type: TABLE DATA; Schema: public; Owner: aimarket_m3rk37t_user
--

COPY public.projects_prompt (id, name, prompt, token_count, "order", created_at, updated_at, project_id, keywords) FROM stdin;
\.


--
-- Data for Name: prompt_generator_generatedprompt; Type: TABLE DATA; Schema: public; Owner: aimarket_m3rk37t_user
--

COPY public.prompt_generator_generatedprompt (id, name, prompt_text, parameters_used, token_count, created_at, user_id, template_id) FROM stdin;
\.


--
-- Data for Name: prompt_generator_generatorcategory; Type: TABLE DATA; Schema: public; Owner: aimarket_m3rk37t_user
--

COPY public.prompt_generator_generatorcategory (id, name, description, icon, is_active, "order") FROM stdin;
\.


--
-- Data for Name: prompt_generator_generatorparameter; Type: TABLE DATA; Schema: public; Owner: aimarket_m3rk37t_user
--

COPY public.prompt_generator_generatorparameter (id, name, display_name, description, parameter_type, options, default_value, is_required, "order", template_id) FROM stdin;
\.


--
-- Data for Name: prompt_generator_generatortemplate; Type: TABLE DATA; Schema: public; Owner: aimarket_m3rk37t_user
--

COPY public.prompt_generator_generatortemplate (id, name, description, template_text, is_featured, is_active, created_at, updated_at, category_id) FROM stdin;
\.


--
-- Data for Name: prompts_prompt; Type: TABLE DATA; Schema: public; Owner: aimarket_m3rk37t_user
--

COPY public.prompts_prompt (id, name, prompt, token_count, "order", created_at, updated_at, project_id) FROM stdin;
\.


--
-- Data for Name: seo_optimization_keywordtracking; Type: TABLE DATA; Schema: public; Owner: aimarket_m3rk37t_user
--

COPY public.seo_optimization_keywordtracking (id, keyword, relevance_score, is_primary, created_at, updated_at, user_id) FROM stdin;
\.


--
-- Data for Name: seo_optimization_keywordtracking_projects; Type: TABLE DATA; Schema: public; Owner: aimarket_m3rk37t_user
--

COPY public.seo_optimization_keywordtracking_projects (id, keywordtracking_id, project_id) FROM stdin;
\.


--
-- Data for Name: seo_optimization_seoanalysis; Type: TABLE DATA; Schema: public; Owner: aimarket_m3rk37t_user
--

COPY public.seo_optimization_seoanalysis (id, readability_score, keyword_density, suggested_keywords, meta_description, seo_score, improvement_suggestions, created_at, updated_at, content_id, project_id) FROM stdin;
\.


--
-- Data for Name: subscriptions_subscription; Type: TABLE DATA; Schema: public; Owner: aimarket_m3rk37t_user
--

COPY public.subscriptions_subscription (id, stripe_subscription_id, stripe_customer_id, subscription_type, payment_status, start_date, end_date, created_at, updated_at, user_id) FROM stdin;
\.


--
-- Data for Name: subscriptions_userprofile; Type: TABLE DATA; Schema: public; Owner: aimarket_m3rk37t_user
--

COPY public.subscriptions_userprofile (id, signup_date, user_id, trial_ended_email_sent, trial_reminder_1_day_sent, trial_reminder_3_days_sent) FROM stdin;
\.


--
-- Name: accounts_memberresource_id_seq; Type: SEQUENCE SET; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

SELECT pg_catalog.setval('aimarket_m3rk37tdb.accounts_memberresource_id_seq', 1, true);


--
-- Name: accounts_profile_id_seq; Type: SEQUENCE SET; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

SELECT pg_catalog.setval('aimarket_m3rk37tdb.accounts_profile_id_seq', 3, true);


--
-- Name: accounts_tokenusage_id_seq; Type: SEQUENCE SET; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

SELECT pg_catalog.setval('aimarket_m3rk37tdb.accounts_tokenusage_id_seq', 3, true);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

SELECT pg_catalog.setval('aimarket_m3rk37tdb.auth_group_id_seq', 1, true);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

SELECT pg_catalog.setval('aimarket_m3rk37tdb.auth_group_permissions_id_seq', 1, true);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

SELECT pg_catalog.setval('aimarket_m3rk37tdb.auth_permission_id_seq', 168, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

SELECT pg_catalog.setval('aimarket_m3rk37tdb.auth_user_groups_id_seq', 1, true);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

SELECT pg_catalog.setval('aimarket_m3rk37tdb.auth_user_id_seq', 3, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

SELECT pg_catalog.setval('aimarket_m3rk37tdb.auth_user_user_permissions_id_seq', 1, true);


--
-- Name: blog_category_id_seq; Type: SEQUENCE SET; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

SELECT pg_catalog.setval('aimarket_m3rk37tdb.blog_category_id_seq', 3, true);


--
-- Name: blog_post_id_seq; Type: SEQUENCE SET; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

SELECT pg_catalog.setval('aimarket_m3rk37tdb.blog_post_id_seq', 4, true);


--
-- Name: core_contactmessage_id_seq; Type: SEQUENCE SET; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

SELECT pg_catalog.setval('aimarket_m3rk37tdb.core_contactmessage_id_seq', 1, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

SELECT pg_catalog.setval('aimarket_m3rk37tdb.django_admin_log_id_seq', 89, true);


--
-- Name: django_celery_results_chordcounter_id_seq; Type: SEQUENCE SET; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

SELECT pg_catalog.setval('aimarket_m3rk37tdb.django_celery_results_chordcounter_id_seq', 1, true);


--
-- Name: django_celery_results_groupresult_id_seq; Type: SEQUENCE SET; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

SELECT pg_catalog.setval('aimarket_m3rk37tdb.django_celery_results_groupresult_id_seq', 1, true);


--
-- Name: django_celery_results_taskresult_id_seq; Type: SEQUENCE SET; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

SELECT pg_catalog.setval('aimarket_m3rk37tdb.django_celery_results_taskresult_id_seq', 1, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

SELECT pg_catalog.setval('aimarket_m3rk37tdb.django_content_type_id_seq', 42, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

SELECT pg_catalog.setval('aimarket_m3rk37tdb.django_migrations_id_seq', 61, true);


--
-- Name: seo_optimization_keywordtracking_projects_id_seq; Type: SEQUENCE SET; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

SELECT pg_catalog.setval('aimarket_m3rk37tdb.seo_optimization_keywordtracking_projects_id_seq', 10, true);


--
-- Name: subscriptions_subscription_id_seq; Type: SEQUENCE SET; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

SELECT pg_catalog.setval('aimarket_m3rk37tdb.subscriptions_subscription_id_seq', 1, true);


--
-- Name: subscriptions_userprofile_id_seq; Type: SEQUENCE SET; Schema: aimarket_m3rk37tdb; Owner: aimarket_m3rk37t_user
--

SELECT pg_catalog.setval('aimarket_m3rk37tdb.subscriptions_userprofile_id_seq', 3, true);


--
-- Name: accounts_memberresource_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aimarket_m3rk37t_user
--

SELECT pg_catalog.setval('public.accounts_memberresource_id_seq', 1, false);


--
-- Name: accounts_profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aimarket_m3rk37t_user
--

SELECT pg_catalog.setval('public.accounts_profile_id_seq', 1, false);


--
-- Name: accounts_tokenusage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aimarket_m3rk37t_user
--

SELECT pg_catalog.setval('public.accounts_tokenusage_id_seq', 1, false);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aimarket_m3rk37t_user
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aimarket_m3rk37t_user
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aimarket_m3rk37t_user
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 168, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aimarket_m3rk37t_user
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aimarket_m3rk37t_user
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, false);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aimarket_m3rk37t_user
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: blog_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aimarket_m3rk37t_user
--

SELECT pg_catalog.setval('public.blog_category_id_seq', 1, false);


--
-- Name: blog_post_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aimarket_m3rk37t_user
--

SELECT pg_catalog.setval('public.blog_post_id_seq', 1, false);


--
-- Name: core_contactmessage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aimarket_m3rk37t_user
--

SELECT pg_catalog.setval('public.core_contactmessage_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aimarket_m3rk37t_user
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_celery_results_chordcounter_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aimarket_m3rk37t_user
--

SELECT pg_catalog.setval('public.django_celery_results_chordcounter_id_seq', 1, false);


--
-- Name: django_celery_results_groupresult_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aimarket_m3rk37t_user
--

SELECT pg_catalog.setval('public.django_celery_results_groupresult_id_seq', 1, false);


--
-- Name: django_celery_results_taskresult_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aimarket_m3rk37t_user
--

SELECT pg_catalog.setval('public.django_celery_results_taskresult_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aimarket_m3rk37t_user
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 42, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aimarket_m3rk37t_user
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 61, true);


--
-- Name: seo_optimization_keywordtracking_projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aimarket_m3rk37t_user
--

SELECT pg_catalog.setval('public.seo_optimization_keywordtracking_projects_id_seq', 1, false);


--
-- Name: subscriptions_subscription_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aimarket_m3rk37t_user
--

SELECT pg_catalog.setval('public.subscriptions_subscription_id_seq', 1, false);


--
-- Name: subscriptions_userprofile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aimarket_m3rk37t_user
--

SELECT pg_catalog.setval('public.subscriptions_userprofile_id_seq', 1, false);


--
-- Name: accounts_memberresource accounts_memberresource_pkey; Type: CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.accounts_memberresource
    ADD CONSTRAINT accounts_memberresource_pkey PRIMARY KEY (id);


--
-- Name: accounts_profile accounts_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.accounts_profile
    ADD CONSTRAINT accounts_profile_pkey PRIMARY KEY (id);


--
-- Name: accounts_profile accounts_profile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.accounts_profile
    ADD CONSTRAINT accounts_profile_user_id_key UNIQUE (user_id);


--
-- Name: accounts_stripecustomer accounts_stripecustomer_pkey; Type: CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.accounts_stripecustomer
    ADD CONSTRAINT accounts_stripecustomer_pkey PRIMARY KEY (id);


--
-- Name: accounts_stripecustomer accounts_stripecustomer_stripe_customer_id_key; Type: CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.accounts_stripecustomer
    ADD CONSTRAINT accounts_stripecustomer_stripe_customer_id_key UNIQUE (stripe_customer_id);


--
-- Name: accounts_stripecustomer accounts_stripecustomer_user_id_key; Type: CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.accounts_stripecustomer
    ADD CONSTRAINT accounts_stripecustomer_user_id_key UNIQUE (user_id);


--
-- Name: accounts_subscription accounts_subscription_pkey; Type: CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.accounts_subscription
    ADD CONSTRAINT accounts_subscription_pkey PRIMARY KEY (id);


--
-- Name: accounts_subscription accounts_subscription_stripe_subscription_id_key; Type: CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.accounts_subscription
    ADD CONSTRAINT accounts_subscription_stripe_subscription_id_key UNIQUE (stripe_subscription_id);


--
-- Name: accounts_subscription accounts_subscription_user_id_key; Type: CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.accounts_subscription
    ADD CONSTRAINT accounts_subscription_user_id_key UNIQUE (user_id);


--
-- Name: accounts_tokenusage accounts_tokenusage_pkey; Type: CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.accounts_tokenusage
    ADD CONSTRAINT accounts_tokenusage_pkey PRIMARY KEY (id);


--
-- Name: accounts_tokenusage accounts_tokenusage_user_id_key; Type: CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.accounts_tokenusage
    ADD CONSTRAINT accounts_tokenusage_user_id_key UNIQUE (user_id);


--
-- Name: assets_asset assets_asset_pkey; Type: CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.assets_asset
    ADD CONSTRAINT assets_asset_pkey PRIMARY KEY (id);


--
-- Name: assets_assetprocessingjob assets_assetprocessingjob_asset_id_key; Type: CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.assets_assetprocessingjob
    ADD CONSTRAINT assets_assetprocessingjob_asset_id_key UNIQUE (asset_id);


--
-- Name: assets_assetprocessingjob assets_assetprocessingjob_pkey; Type: CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.assets_assetprocessingjob
    ADD CONSTRAINT assets_assetprocessingjob_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: blog_category blog_category_pkey; Type: CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.blog_category
    ADD CONSTRAINT blog_category_pkey PRIMARY KEY (id);


--
-- Name: blog_category blog_category_slug_key; Type: CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.blog_category
    ADD CONSTRAINT blog_category_slug_key UNIQUE (slug);


--
-- Name: blog_post blog_post_pkey; Type: CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.blog_post
    ADD CONSTRAINT blog_post_pkey PRIMARY KEY (id);


--
-- Name: blog_post blog_post_slug_key; Type: CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.blog_post
    ADD CONSTRAINT blog_post_slug_key UNIQUE (slug);


--
-- Name: content_generation_aiconfig content_generation_aiconfig_pkey; Type: CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.content_generation_aiconfig
    ADD CONSTRAINT content_generation_aiconfig_pkey PRIMARY KEY (id);


--
-- Name: content_generation_contentgenerationjob content_generation_contentgenerationjob_pkey; Type: CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.content_generation_contentgenerationjob
    ADD CONSTRAINT content_generation_contentgenerationjob_pkey PRIMARY KEY (id);


--
-- Name: content_generation_prompttemplate content_generation_promp_content_type_is_default__90ec271e_uniq; Type: CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.content_generation_prompttemplate
    ADD CONSTRAINT content_generation_promp_content_type_is_default__90ec271e_uniq UNIQUE (content_type, is_default, user_id);


--
-- Name: content_generation_prompttemplate content_generation_prompttemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.content_generation_prompttemplate
    ADD CONSTRAINT content_generation_prompttemplate_pkey PRIMARY KEY (id);


--
-- Name: content_templates_template content_templates_template_pkey; Type: CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.content_templates_template
    ADD CONSTRAINT content_templates_template_pkey PRIMARY KEY (id);


--
-- Name: content_templates_templateprompt content_templates_templateprompt_pkey; Type: CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.content_templates_templateprompt
    ADD CONSTRAINT content_templates_templateprompt_pkey PRIMARY KEY (id);


--
-- Name: core_contactmessage core_contactmessage_pkey; Type: CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.core_contactmessage
    ADD CONSTRAINT core_contactmessage_pkey PRIMARY KEY (id);


--
-- Name: core_tag core_tag_name_user_id_86822e89_uniq; Type: CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.core_tag
    ADD CONSTRAINT core_tag_name_user_id_86822e89_uniq UNIQUE (name, user_id);


--
-- Name: core_tag core_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.core_tag
    ADD CONSTRAINT core_tag_pkey PRIMARY KEY (id);


--
-- Name: core_taggeditem core_taggeditem_pkey; Type: CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.core_taggeditem
    ADD CONSTRAINT core_taggeditem_pkey PRIMARY KEY (id);


--
-- Name: core_taggeditem core_taggeditem_tag_id_content_type_id_object_id_c7bbfd47_uniq; Type: CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.core_taggeditem
    ADD CONSTRAINT core_taggeditem_tag_id_content_type_id_object_id_c7bbfd47_uniq UNIQUE (tag_id, content_type_id, object_id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_celery_results_chordcounter django_celery_results_chordcounter_group_id_key; Type: CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.django_celery_results_chordcounter
    ADD CONSTRAINT django_celery_results_chordcounter_group_id_key UNIQUE (group_id);


--
-- Name: django_celery_results_chordcounter django_celery_results_chordcounter_pkey; Type: CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.django_celery_results_chordcounter
    ADD CONSTRAINT django_celery_results_chordcounter_pkey PRIMARY KEY (id);


--
-- Name: django_celery_results_groupresult django_celery_results_groupresult_group_id_key; Type: CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.django_celery_results_groupresult
    ADD CONSTRAINT django_celery_results_groupresult_group_id_key UNIQUE (group_id);


--
-- Name: django_celery_results_groupresult django_celery_results_groupresult_pkey; Type: CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.django_celery_results_groupresult
    ADD CONSTRAINT django_celery_results_groupresult_pkey PRIMARY KEY (id);


--
-- Name: django_celery_results_taskresult django_celery_results_taskresult_pkey; Type: CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.django_celery_results_taskresult
    ADD CONSTRAINT django_celery_results_taskresult_pkey PRIMARY KEY (id);


--
-- Name: django_celery_results_taskresult django_celery_results_taskresult_task_id_key; Type: CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.django_celery_results_taskresult
    ADD CONSTRAINT django_celery_results_taskresult_task_id_key UNIQUE (task_id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: docs_documentationcategory docs_documentationcategory_pkey; Type: CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.docs_documentationcategory
    ADD CONSTRAINT docs_documentationcategory_pkey PRIMARY KEY (id);


--
-- Name: docs_documentationcategory docs_documentationcategory_slug_key; Type: CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.docs_documentationcategory
    ADD CONSTRAINT docs_documentationcategory_slug_key UNIQUE (slug);


--
-- Name: docs_documentationpage docs_documentationpage_pkey; Type: CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.docs_documentationpage
    ADD CONSTRAINT docs_documentationpage_pkey PRIMARY KEY (id);


--
-- Name: docs_documentationpage docs_documentationpage_slug_key; Type: CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.docs_documentationpage
    ADD CONSTRAINT docs_documentationpage_slug_key UNIQUE (slug);


--
-- Name: projects_asset projects_asset_pkey; Type: CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.projects_asset
    ADD CONSTRAINT projects_asset_pkey PRIMARY KEY (id);


--
-- Name: projects_assetprocessingjob projects_assetprocessingjob_asset_id_key; Type: CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.projects_assetprocessingjob
    ADD CONSTRAINT projects_assetprocessingjob_asset_id_key UNIQUE (asset_id);


--
-- Name: projects_assetprocessingjob projects_assetprocessingjob_pkey; Type: CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.projects_assetprocessingjob
    ADD CONSTRAINT projects_assetprocessingjob_pkey PRIMARY KEY (id);


--
-- Name: projects_generatedcontent projects_generatedcontent_pkey; Type: CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.projects_generatedcontent
    ADD CONSTRAINT projects_generatedcontent_pkey PRIMARY KEY (id);


--
-- Name: projects_project projects_project_pkey; Type: CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.projects_project
    ADD CONSTRAINT projects_project_pkey PRIMARY KEY (id);


--
-- Name: projects_prompt projects_prompt_pkey; Type: CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.projects_prompt
    ADD CONSTRAINT projects_prompt_pkey PRIMARY KEY (id);


--
-- Name: prompt_generator_generatedprompt prompt_generator_generatedprompt_pkey; Type: CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.prompt_generator_generatedprompt
    ADD CONSTRAINT prompt_generator_generatedprompt_pkey PRIMARY KEY (id);


--
-- Name: prompt_generator_generatorcategory prompt_generator_generatorcategory_pkey; Type: CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.prompt_generator_generatorcategory
    ADD CONSTRAINT prompt_generator_generatorcategory_pkey PRIMARY KEY (id);


--
-- Name: prompt_generator_generatorparameter prompt_generator_generatorparameter_pkey; Type: CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.prompt_generator_generatorparameter
    ADD CONSTRAINT prompt_generator_generatorparameter_pkey PRIMARY KEY (id);


--
-- Name: prompt_generator_generatortemplate prompt_generator_generatortemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.prompt_generator_generatortemplate
    ADD CONSTRAINT prompt_generator_generatortemplate_pkey PRIMARY KEY (id);


--
-- Name: prompts_prompt prompts_prompt_pkey; Type: CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.prompts_prompt
    ADD CONSTRAINT prompts_prompt_pkey PRIMARY KEY (id);


--
-- Name: seo_optimization_keywordtracking_projects seo_optimization_keyword_keywordtracking_id_proje_fbddc126_uniq; Type: CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.seo_optimization_keywordtracking_projects
    ADD CONSTRAINT seo_optimization_keyword_keywordtracking_id_proje_fbddc126_uniq UNIQUE (keywordtracking_id, project_id);


--
-- Name: seo_optimization_keywordtracking seo_optimization_keywordtracking_pkey; Type: CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.seo_optimization_keywordtracking
    ADD CONSTRAINT seo_optimization_keywordtracking_pkey PRIMARY KEY (id);


--
-- Name: seo_optimization_keywordtracking_projects seo_optimization_keywordtracking_projects_pkey; Type: CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.seo_optimization_keywordtracking_projects
    ADD CONSTRAINT seo_optimization_keywordtracking_projects_pkey PRIMARY KEY (id);


--
-- Name: seo_optimization_keywordtracking seo_optimization_keywordtracking_user_id_keyword_e0fca11b_uniq; Type: CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.seo_optimization_keywordtracking
    ADD CONSTRAINT seo_optimization_keywordtracking_user_id_keyword_e0fca11b_uniq UNIQUE (user_id, keyword);


--
-- Name: seo_optimization_seoanalysis seo_optimization_seoanalysis_pkey; Type: CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.seo_optimization_seoanalysis
    ADD CONSTRAINT seo_optimization_seoanalysis_pkey PRIMARY KEY (id);


--
-- Name: subscriptions_subscription subscriptions_subscription_pkey; Type: CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.subscriptions_subscription
    ADD CONSTRAINT subscriptions_subscription_pkey PRIMARY KEY (id);


--
-- Name: subscriptions_subscription subscriptions_subscription_user_id_key; Type: CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.subscriptions_subscription
    ADD CONSTRAINT subscriptions_subscription_user_id_key UNIQUE (user_id);


--
-- Name: subscriptions_userprofile subscriptions_userprofile_pkey; Type: CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.subscriptions_userprofile
    ADD CONSTRAINT subscriptions_userprofile_pkey PRIMARY KEY (id);


--
-- Name: subscriptions_userprofile subscriptions_userprofile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.subscriptions_userprofile
    ADD CONSTRAINT subscriptions_userprofile_user_id_key UNIQUE (user_id);


--
-- Name: accounts_stripecustomer_stripe_customer_id_e40a3d8e_like; Type: INDEX; Schema: public; Owner: aimarket_m3rk37t_user
--

CREATE INDEX accounts_stripecustomer_stripe_customer_id_e40a3d8e_like ON public.accounts_stripecustomer USING btree (stripe_customer_id varchar_pattern_ops);


--
-- Name: accounts_subscription_stripe_subscription_id_7a9223da_like; Type: INDEX; Schema: public; Owner: aimarket_m3rk37t_user
--

CREATE INDEX accounts_subscription_stripe_subscription_id_7a9223da_like ON public.accounts_subscription USING btree (stripe_subscription_id varchar_pattern_ops);


--
-- Name: assets_asset_project_id_e78590c8; Type: INDEX; Schema: public; Owner: aimarket_m3rk37t_user
--

CREATE INDEX assets_asset_project_id_e78590c8 ON public.assets_asset USING btree (project_id);


--
-- Name: assets_assetprocessingjob_project_id_1a22282e; Type: INDEX; Schema: public; Owner: aimarket_m3rk37t_user
--

CREATE INDEX assets_assetprocessingjob_project_id_1a22282e ON public.assets_assetprocessingjob USING btree (project_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: aimarket_m3rk37t_user
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: aimarket_m3rk37t_user
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: aimarket_m3rk37t_user
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: aimarket_m3rk37t_user
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: aimarket_m3rk37t_user
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: aimarket_m3rk37t_user
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: aimarket_m3rk37t_user
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: aimarket_m3rk37t_user
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: aimarket_m3rk37t_user
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: blog_category_slug_92643dc5_like; Type: INDEX; Schema: public; Owner: aimarket_m3rk37t_user
--

CREATE INDEX blog_category_slug_92643dc5_like ON public.blog_category USING btree (slug varchar_pattern_ops);


--
-- Name: blog_post_category_id_c326dbf8; Type: INDEX; Schema: public; Owner: aimarket_m3rk37t_user
--

CREATE INDEX blog_post_category_id_c326dbf8 ON public.blog_post USING btree (category_id);


--
-- Name: blog_post_slug_b95473f2_like; Type: INDEX; Schema: public; Owner: aimarket_m3rk37t_user
--

CREATE INDEX blog_post_slug_b95473f2_like ON public.blog_post USING btree (slug varchar_pattern_ops);


--
-- Name: content_generation_contentgenerationjob_project_id_7046bab9; Type: INDEX; Schema: public; Owner: aimarket_m3rk37t_user
--

CREATE INDEX content_generation_contentgenerationjob_project_id_7046bab9 ON public.content_generation_contentgenerationjob USING btree (project_id);


--
-- Name: content_generation_contentgenerationjob_user_id_9b5d1bd8; Type: INDEX; Schema: public; Owner: aimarket_m3rk37t_user
--

CREATE INDEX content_generation_contentgenerationjob_user_id_9b5d1bd8 ON public.content_generation_contentgenerationjob USING btree (user_id);


--
-- Name: content_generation_prompttemplate_user_id_ff86fc2f; Type: INDEX; Schema: public; Owner: aimarket_m3rk37t_user
--

CREATE INDEX content_generation_prompttemplate_user_id_ff86fc2f ON public.content_generation_prompttemplate USING btree (user_id);


--
-- Name: content_templates_template_user_id_2c4ed17e; Type: INDEX; Schema: public; Owner: aimarket_m3rk37t_user
--

CREATE INDEX content_templates_template_user_id_2c4ed17e ON public.content_templates_template USING btree (user_id);


--
-- Name: content_templates_templateprompt_template_id_6a9e40c5; Type: INDEX; Schema: public; Owner: aimarket_m3rk37t_user
--

CREATE INDEX content_templates_templateprompt_template_id_6a9e40c5 ON public.content_templates_templateprompt USING btree (template_id);


--
-- Name: core_contactmessage_user_id_7c4fed4e; Type: INDEX; Schema: public; Owner: aimarket_m3rk37t_user
--

CREATE INDEX core_contactmessage_user_id_7c4fed4e ON public.core_contactmessage USING btree (user_id);


--
-- Name: core_tag_user_id_1b670500; Type: INDEX; Schema: public; Owner: aimarket_m3rk37t_user
--

CREATE INDEX core_tag_user_id_1b670500 ON public.core_tag USING btree (user_id);


--
-- Name: core_taggeditem_content_type_id_21716738; Type: INDEX; Schema: public; Owner: aimarket_m3rk37t_user
--

CREATE INDEX core_taggeditem_content_type_id_21716738 ON public.core_taggeditem USING btree (content_type_id);


--
-- Name: core_taggeditem_tag_id_d2816503; Type: INDEX; Schema: public; Owner: aimarket_m3rk37t_user
--

CREATE INDEX core_taggeditem_tag_id_d2816503 ON public.core_taggeditem USING btree (tag_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: aimarket_m3rk37t_user
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: aimarket_m3rk37t_user
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_cele_date_cr_bd6c1d_idx; Type: INDEX; Schema: public; Owner: aimarket_m3rk37t_user
--

CREATE INDEX django_cele_date_cr_bd6c1d_idx ON public.django_celery_results_groupresult USING btree (date_created);


--
-- Name: django_cele_date_cr_f04a50_idx; Type: INDEX; Schema: public; Owner: aimarket_m3rk37t_user
--

CREATE INDEX django_cele_date_cr_f04a50_idx ON public.django_celery_results_taskresult USING btree (date_created);


--
-- Name: django_cele_date_do_caae0e_idx; Type: INDEX; Schema: public; Owner: aimarket_m3rk37t_user
--

CREATE INDEX django_cele_date_do_caae0e_idx ON public.django_celery_results_groupresult USING btree (date_done);


--
-- Name: django_cele_date_do_f59aad_idx; Type: INDEX; Schema: public; Owner: aimarket_m3rk37t_user
--

CREATE INDEX django_cele_date_do_f59aad_idx ON public.django_celery_results_taskresult USING btree (date_done);


--
-- Name: django_cele_periodi_1993cf_idx; Type: INDEX; Schema: public; Owner: aimarket_m3rk37t_user
--

CREATE INDEX django_cele_periodi_1993cf_idx ON public.django_celery_results_taskresult USING btree (periodic_task_name);


--
-- Name: django_cele_status_9b6201_idx; Type: INDEX; Schema: public; Owner: aimarket_m3rk37t_user
--

CREATE INDEX django_cele_status_9b6201_idx ON public.django_celery_results_taskresult USING btree (status);


--
-- Name: django_cele_task_na_08aec9_idx; Type: INDEX; Schema: public; Owner: aimarket_m3rk37t_user
--

CREATE INDEX django_cele_task_na_08aec9_idx ON public.django_celery_results_taskresult USING btree (task_name);


--
-- Name: django_cele_worker_d54dd8_idx; Type: INDEX; Schema: public; Owner: aimarket_m3rk37t_user
--

CREATE INDEX django_cele_worker_d54dd8_idx ON public.django_celery_results_taskresult USING btree (worker);


--
-- Name: django_celery_results_chordcounter_group_id_1f70858c_like; Type: INDEX; Schema: public; Owner: aimarket_m3rk37t_user
--

CREATE INDEX django_celery_results_chordcounter_group_id_1f70858c_like ON public.django_celery_results_chordcounter USING btree (group_id varchar_pattern_ops);


--
-- Name: django_celery_results_groupresult_group_id_a085f1a9_like; Type: INDEX; Schema: public; Owner: aimarket_m3rk37t_user
--

CREATE INDEX django_celery_results_groupresult_group_id_a085f1a9_like ON public.django_celery_results_groupresult USING btree (group_id varchar_pattern_ops);


--
-- Name: django_celery_results_taskresult_task_id_de0d95bf_like; Type: INDEX; Schema: public; Owner: aimarket_m3rk37t_user
--

CREATE INDEX django_celery_results_taskresult_task_id_de0d95bf_like ON public.django_celery_results_taskresult USING btree (task_id varchar_pattern_ops);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: aimarket_m3rk37t_user
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: aimarket_m3rk37t_user
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: docs_documentationcategory_slug_feecf28f_like; Type: INDEX; Schema: public; Owner: aimarket_m3rk37t_user
--

CREATE INDEX docs_documentationcategory_slug_feecf28f_like ON public.docs_documentationcategory USING btree (slug varchar_pattern_ops);


--
-- Name: docs_documentationpage_category_id_3c6b640b; Type: INDEX; Schema: public; Owner: aimarket_m3rk37t_user
--

CREATE INDEX docs_documentationpage_category_id_3c6b640b ON public.docs_documentationpage USING btree (category_id);


--
-- Name: docs_documentationpage_slug_0a16c6a4_like; Type: INDEX; Schema: public; Owner: aimarket_m3rk37t_user
--

CREATE INDEX docs_documentationpage_slug_0a16c6a4_like ON public.docs_documentationpage USING btree (slug varchar_pattern_ops);


--
-- Name: projects_asset_project_id_0a9e6578; Type: INDEX; Schema: public; Owner: aimarket_m3rk37t_user
--

CREATE INDEX projects_asset_project_id_0a9e6578 ON public.projects_asset USING btree (project_id);


--
-- Name: projects_assetprocessingjob_project_id_5f2741be; Type: INDEX; Schema: public; Owner: aimarket_m3rk37t_user
--

CREATE INDEX projects_assetprocessingjob_project_id_5f2741be ON public.projects_assetprocessingjob USING btree (project_id);


--
-- Name: projects_generatedcontent_project_id_5c4c02be; Type: INDEX; Schema: public; Owner: aimarket_m3rk37t_user
--

CREATE INDEX projects_generatedcontent_project_id_5c4c02be ON public.projects_generatedcontent USING btree (project_id);


--
-- Name: projects_project_user_id_719f19dd; Type: INDEX; Schema: public; Owner: aimarket_m3rk37t_user
--

CREATE INDEX projects_project_user_id_719f19dd ON public.projects_project USING btree (user_id);


--
-- Name: projects_prompt_project_id_33c7ce4b; Type: INDEX; Schema: public; Owner: aimarket_m3rk37t_user
--

CREATE INDEX projects_prompt_project_id_33c7ce4b ON public.projects_prompt USING btree (project_id);


--
-- Name: prompt_generator_generatedprompt_template_id_e79c3c1d; Type: INDEX; Schema: public; Owner: aimarket_m3rk37t_user
--

CREATE INDEX prompt_generator_generatedprompt_template_id_e79c3c1d ON public.prompt_generator_generatedprompt USING btree (template_id);


--
-- Name: prompt_generator_generatedprompt_user_id_0b610abf; Type: INDEX; Schema: public; Owner: aimarket_m3rk37t_user
--

CREATE INDEX prompt_generator_generatedprompt_user_id_0b610abf ON public.prompt_generator_generatedprompt USING btree (user_id);


--
-- Name: prompt_generator_generatorparameter_template_id_3f6c7b1d; Type: INDEX; Schema: public; Owner: aimarket_m3rk37t_user
--

CREATE INDEX prompt_generator_generatorparameter_template_id_3f6c7b1d ON public.prompt_generator_generatorparameter USING btree (template_id);


--
-- Name: prompt_generator_generatortemplate_category_id_a89ff823; Type: INDEX; Schema: public; Owner: aimarket_m3rk37t_user
--

CREATE INDEX prompt_generator_generatortemplate_category_id_a89ff823 ON public.prompt_generator_generatortemplate USING btree (category_id);


--
-- Name: prompts_prompt_project_id_6f306047; Type: INDEX; Schema: public; Owner: aimarket_m3rk37t_user
--

CREATE INDEX prompts_prompt_project_id_6f306047 ON public.prompts_prompt USING btree (project_id);


--
-- Name: seo_optimization_keywordtr_keywordtracking_id_3e4bcaad; Type: INDEX; Schema: public; Owner: aimarket_m3rk37t_user
--

CREATE INDEX seo_optimization_keywordtr_keywordtracking_id_3e4bcaad ON public.seo_optimization_keywordtracking_projects USING btree (keywordtracking_id);


--
-- Name: seo_optimization_keywordtracking_projects_project_id_fb6552f8; Type: INDEX; Schema: public; Owner: aimarket_m3rk37t_user
--

CREATE INDEX seo_optimization_keywordtracking_projects_project_id_fb6552f8 ON public.seo_optimization_keywordtracking_projects USING btree (project_id);


--
-- Name: seo_optimization_keywordtracking_user_id_2d953047; Type: INDEX; Schema: public; Owner: aimarket_m3rk37t_user
--

CREATE INDEX seo_optimization_keywordtracking_user_id_2d953047 ON public.seo_optimization_keywordtracking USING btree (user_id);


--
-- Name: seo_optimization_seoanalysis_content_id_c9bc5fc4; Type: INDEX; Schema: public; Owner: aimarket_m3rk37t_user
--

CREATE INDEX seo_optimization_seoanalysis_content_id_c9bc5fc4 ON public.seo_optimization_seoanalysis USING btree (content_id);


--
-- Name: seo_optimization_seoanalysis_project_id_a9fb91d2; Type: INDEX; Schema: public; Owner: aimarket_m3rk37t_user
--

CREATE INDEX seo_optimization_seoanalysis_project_id_a9fb91d2 ON public.seo_optimization_seoanalysis USING btree (project_id);


--
-- Name: accounts_profile accounts_profile_user_id_49a85d32_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.accounts_profile
    ADD CONSTRAINT accounts_profile_user_id_49a85d32_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_stripecustomer accounts_stripecustomer_user_id_92ab9700_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.accounts_stripecustomer
    ADD CONSTRAINT accounts_stripecustomer_user_id_92ab9700_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_subscription accounts_subscription_user_id_980c85f5_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.accounts_subscription
    ADD CONSTRAINT accounts_subscription_user_id_980c85f5_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_tokenusage accounts_tokenusage_user_id_cb0e661d_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.accounts_tokenusage
    ADD CONSTRAINT accounts_tokenusage_user_id_cb0e661d_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: assets_asset assets_asset_project_id_e78590c8_fk_projects_project_id; Type: FK CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.assets_asset
    ADD CONSTRAINT assets_asset_project_id_e78590c8_fk_projects_project_id FOREIGN KEY (project_id) REFERENCES public.projects_project(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: assets_assetprocessingjob assets_assetprocessi_project_id_1a22282e_fk_projects_; Type: FK CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.assets_assetprocessingjob
    ADD CONSTRAINT assets_assetprocessi_project_id_1a22282e_fk_projects_ FOREIGN KEY (project_id) REFERENCES public.projects_project(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: assets_assetprocessingjob assets_assetprocessingjob_asset_id_7260a00f_fk_assets_asset_id; Type: FK CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.assets_assetprocessingjob
    ADD CONSTRAINT assets_assetprocessingjob_asset_id_7260a00f_fk_assets_asset_id FOREIGN KEY (asset_id) REFERENCES public.assets_asset(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_post blog_post_category_id_c326dbf8_fk_blog_category_id; Type: FK CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.blog_post
    ADD CONSTRAINT blog_post_category_id_c326dbf8_fk_blog_category_id FOREIGN KEY (category_id) REFERENCES public.blog_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: content_generation_contentgenerationjob content_generation_c_project_id_7046bab9_fk_projects_; Type: FK CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.content_generation_contentgenerationjob
    ADD CONSTRAINT content_generation_c_project_id_7046bab9_fk_projects_ FOREIGN KEY (project_id) REFERENCES public.projects_project(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: content_generation_contentgenerationjob content_generation_c_user_id_9b5d1bd8_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.content_generation_contentgenerationjob
    ADD CONSTRAINT content_generation_c_user_id_9b5d1bd8_fk_auth_user FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: content_generation_prompttemplate content_generation_p_user_id_ff86fc2f_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.content_generation_prompttemplate
    ADD CONSTRAINT content_generation_p_user_id_ff86fc2f_fk_auth_user FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: content_templates_templateprompt content_templates_te_template_id_6a9e40c5_fk_content_t; Type: FK CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.content_templates_templateprompt
    ADD CONSTRAINT content_templates_te_template_id_6a9e40c5_fk_content_t FOREIGN KEY (template_id) REFERENCES public.content_templates_template(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: content_templates_template content_templates_template_user_id_2c4ed17e_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.content_templates_template
    ADD CONSTRAINT content_templates_template_user_id_2c4ed17e_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_contactmessage core_contactmessage_user_id_7c4fed4e_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.core_contactmessage
    ADD CONSTRAINT core_contactmessage_user_id_7c4fed4e_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_tag core_tag_user_id_1b670500_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.core_tag
    ADD CONSTRAINT core_tag_user_id_1b670500_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_taggeditem core_taggeditem_content_type_id_21716738_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.core_taggeditem
    ADD CONSTRAINT core_taggeditem_content_type_id_21716738_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_taggeditem core_taggeditem_tag_id_d2816503_fk_core_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.core_taggeditem
    ADD CONSTRAINT core_taggeditem_tag_id_d2816503_fk_core_tag_id FOREIGN KEY (tag_id) REFERENCES public.core_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: docs_documentationpage docs_documentationpa_category_id_3c6b640b_fk_docs_docu; Type: FK CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.docs_documentationpage
    ADD CONSTRAINT docs_documentationpa_category_id_3c6b640b_fk_docs_docu FOREIGN KEY (category_id) REFERENCES public.docs_documentationcategory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: projects_asset projects_asset_project_id_0a9e6578_fk_projects_project_id; Type: FK CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.projects_asset
    ADD CONSTRAINT projects_asset_project_id_0a9e6578_fk_projects_project_id FOREIGN KEY (project_id) REFERENCES public.projects_project(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: projects_assetprocessingjob projects_assetproces_asset_id_0b5f706d_fk_projects_; Type: FK CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.projects_assetprocessingjob
    ADD CONSTRAINT projects_assetproces_asset_id_0b5f706d_fk_projects_ FOREIGN KEY (asset_id) REFERENCES public.projects_asset(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: projects_assetprocessingjob projects_assetproces_project_id_5f2741be_fk_projects_; Type: FK CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.projects_assetprocessingjob
    ADD CONSTRAINT projects_assetproces_project_id_5f2741be_fk_projects_ FOREIGN KEY (project_id) REFERENCES public.projects_project(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: projects_generatedcontent projects_generatedco_project_id_5c4c02be_fk_projects_; Type: FK CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.projects_generatedcontent
    ADD CONSTRAINT projects_generatedco_project_id_5c4c02be_fk_projects_ FOREIGN KEY (project_id) REFERENCES public.projects_project(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: projects_project projects_project_user_id_719f19dd_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.projects_project
    ADD CONSTRAINT projects_project_user_id_719f19dd_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: projects_prompt projects_prompt_project_id_33c7ce4b_fk_projects_project_id; Type: FK CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.projects_prompt
    ADD CONSTRAINT projects_prompt_project_id_33c7ce4b_fk_projects_project_id FOREIGN KEY (project_id) REFERENCES public.projects_project(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prompt_generator_generatortemplate prompt_generator_gen_category_id_a89ff823_fk_prompt_ge; Type: FK CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.prompt_generator_generatortemplate
    ADD CONSTRAINT prompt_generator_gen_category_id_a89ff823_fk_prompt_ge FOREIGN KEY (category_id) REFERENCES public.prompt_generator_generatorcategory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prompt_generator_generatorparameter prompt_generator_gen_template_id_3f6c7b1d_fk_prompt_ge; Type: FK CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.prompt_generator_generatorparameter
    ADD CONSTRAINT prompt_generator_gen_template_id_3f6c7b1d_fk_prompt_ge FOREIGN KEY (template_id) REFERENCES public.prompt_generator_generatortemplate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prompt_generator_generatedprompt prompt_generator_gen_template_id_e79c3c1d_fk_prompt_ge; Type: FK CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.prompt_generator_generatedprompt
    ADD CONSTRAINT prompt_generator_gen_template_id_e79c3c1d_fk_prompt_ge FOREIGN KEY (template_id) REFERENCES public.prompt_generator_generatortemplate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prompt_generator_generatedprompt prompt_generator_gen_user_id_0b610abf_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.prompt_generator_generatedprompt
    ADD CONSTRAINT prompt_generator_gen_user_id_0b610abf_fk_auth_user FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prompts_prompt prompts_prompt_project_id_6f306047_fk_projects_project_id; Type: FK CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.prompts_prompt
    ADD CONSTRAINT prompts_prompt_project_id_6f306047_fk_projects_project_id FOREIGN KEY (project_id) REFERENCES public.projects_project(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: seo_optimization_keywordtracking_projects seo_optimization_key_keywordtracking_id_3e4bcaad_fk_seo_optim; Type: FK CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.seo_optimization_keywordtracking_projects
    ADD CONSTRAINT seo_optimization_key_keywordtracking_id_3e4bcaad_fk_seo_optim FOREIGN KEY (keywordtracking_id) REFERENCES public.seo_optimization_keywordtracking(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: seo_optimization_keywordtracking_projects seo_optimization_key_project_id_fb6552f8_fk_projects_; Type: FK CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.seo_optimization_keywordtracking_projects
    ADD CONSTRAINT seo_optimization_key_project_id_fb6552f8_fk_projects_ FOREIGN KEY (project_id) REFERENCES public.projects_project(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: seo_optimization_keywordtracking seo_optimization_key_user_id_2d953047_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.seo_optimization_keywordtracking
    ADD CONSTRAINT seo_optimization_key_user_id_2d953047_fk_auth_user FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: seo_optimization_seoanalysis seo_optimization_seo_content_id_c9bc5fc4_fk_projects_; Type: FK CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.seo_optimization_seoanalysis
    ADD CONSTRAINT seo_optimization_seo_content_id_c9bc5fc4_fk_projects_ FOREIGN KEY (content_id) REFERENCES public.projects_generatedcontent(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: seo_optimization_seoanalysis seo_optimization_seo_project_id_a9fb91d2_fk_projects_; Type: FK CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.seo_optimization_seoanalysis
    ADD CONSTRAINT seo_optimization_seo_project_id_a9fb91d2_fk_projects_ FOREIGN KEY (project_id) REFERENCES public.projects_project(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: subscriptions_subscription subscriptions_subscription_user_id_a353e93d_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.subscriptions_subscription
    ADD CONSTRAINT subscriptions_subscription_user_id_a353e93d_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: subscriptions_userprofile subscriptions_userprofile_user_id_8c793a48_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: aimarket_m3rk37t_user
--

ALTER TABLE ONLY public.subscriptions_userprofile
    ADD CONSTRAINT subscriptions_userprofile_user_id_8c793a48_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

GRANT ALL ON SCHEMA public TO aimarket_m3rk37t_user;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO aimarket_m3rk37t_user;


--
-- PostgreSQL database dump complete
--

