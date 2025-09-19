--
-- PostgreSQL database dump
--

-- Dumped from database version 14.18 (Homebrew)
-- Dumped by pg_dump version 14.18 (Homebrew)

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: active_storage_attachments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.active_storage_attachments (
    id bigint NOT NULL,
    name character varying(191) NOT NULL,
    record_type character varying(191) NOT NULL,
    record_id bigint NOT NULL,
    blob_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL
);


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.active_storage_attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.active_storage_attachments_id_seq OWNED BY public.active_storage_attachments.id;


--
-- Name: active_storage_blobs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.active_storage_blobs (
    id bigint NOT NULL,
    key character varying(191) NOT NULL,
    filename character varying(191) NOT NULL,
    content_type character varying(191),
    metadata text,
    byte_size bigint NOT NULL,
    checksum character varying(191),
    created_at timestamp without time zone NOT NULL,
    service_name character varying NOT NULL
);


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.active_storage_blobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.active_storage_blobs_id_seq OWNED BY public.active_storage_blobs.id;


--
-- Name: active_storage_variant_records; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.active_storage_variant_records (
    id bigint NOT NULL,
    blob_id bigint NOT NULL,
    variation_digest character varying NOT NULL
);


--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.active_storage_variant_records_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.active_storage_variant_records_id_seq OWNED BY public.active_storage_variant_records.id;


--
-- Name: admin_action_call_infos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.admin_action_call_infos (
    id bigint NOT NULL,
    controller_name character varying NOT NULL,
    action_name character varying NOT NULL,
    call_count integer DEFAULT 0 NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: admin_action_call_infos_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.admin_action_call_infos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: admin_action_call_infos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.admin_action_call_infos_id_seq OWNED BY public.admin_action_call_infos.id;


--
-- Name: affiliate_credits; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.affiliate_credits (
    id integer NOT NULL,
    oauth_application_id integer,
    basis_points integer,
    amount_cents integer,
    affiliate_user_id integer,
    seller_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    purchase_id integer,
    link_id integer,
    affiliate_credit_success_balance_id integer,
    affiliate_credit_chargeback_balance_id integer,
    affiliate_credit_refund_balance_id integer,
    affiliate_id integer,
    fee_cents bigint DEFAULT 0 NOT NULL
);


--
-- Name: affiliate_credits_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.affiliate_credits_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: affiliate_credits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.affiliate_credits_id_seq OWNED BY public.affiliate_credits.id;


--
-- Name: affiliate_partial_refunds; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.affiliate_partial_refunds (
    id integer NOT NULL,
    amount_cents integer DEFAULT 0,
    purchase_id integer NOT NULL,
    total_credit_cents integer DEFAULT 0,
    affiliate_user_id integer,
    seller_id integer,
    affiliate_id integer,
    balance_id integer,
    affiliate_credit_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    fee_cents bigint DEFAULT 0
);


--
-- Name: affiliate_partial_refunds_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.affiliate_partial_refunds_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: affiliate_partial_refunds_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.affiliate_partial_refunds_id_seq OWNED BY public.affiliate_partial_refunds.id;


--
-- Name: affiliate_requests; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.affiliate_requests (
    id bigint NOT NULL,
    seller_id bigint NOT NULL,
    name character varying(100) NOT NULL,
    email character varying NOT NULL,
    promotion_text text NOT NULL,
    locale character varying DEFAULT 'en'::character varying NOT NULL,
    state character varying,
    state_transitioned_at timestamp without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: affiliate_requests_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.affiliate_requests_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: affiliate_requests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.affiliate_requests_id_seq OWNED BY public.affiliate_requests.id;


--
-- Name: affiliates; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.affiliates (
    id integer NOT NULL,
    seller_id integer,
    affiliate_user_id integer,
    affiliate_basis_points integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone,
    flags integer DEFAULT 0 NOT NULL,
    destination_url character varying(2083),
    type character varying NOT NULL
);


--
-- Name: affiliates_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.affiliates_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: affiliates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.affiliates_id_seq OWNED BY public.affiliates.id;


--
-- Name: affiliates_links; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.affiliates_links (
    id integer NOT NULL,
    affiliate_id integer,
    link_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    affiliate_basis_points integer,
    destination_url character varying,
    flags bigint DEFAULT 0 NOT NULL
);


--
-- Name: affiliates_links_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.affiliates_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: affiliates_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.affiliates_links_id_seq OWNED BY public.affiliates_links.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: asset_previews; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.asset_previews (
    id bigint NOT NULL,
    link_id bigint,
    guid character varying,
    oembed text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone,
    "position" integer,
    unsplash_url character varying
);


--
-- Name: asset_previews_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.asset_previews_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: asset_previews_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.asset_previews_id_seq OWNED BY public.asset_previews.id;


--
-- Name: audience_members; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.audience_members (
    id bigint NOT NULL,
    seller_id bigint NOT NULL,
    email character varying NOT NULL,
    details json,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    customer boolean DEFAULT false NOT NULL,
    follower boolean DEFAULT false NOT NULL,
    affiliate boolean DEFAULT false NOT NULL,
    min_paid_cents integer,
    max_paid_cents integer,
    min_created_at timestamp without time zone,
    max_created_at timestamp without time zone,
    min_purchase_created_at timestamp without time zone,
    max_purchase_created_at timestamp without time zone,
    follower_created_at timestamp without time zone,
    min_affiliate_created_at timestamp without time zone,
    max_affiliate_created_at timestamp without time zone
);


--
-- Name: audience_members_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.audience_members_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: audience_members_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.audience_members_id_seq OWNED BY public.audience_members.id;


--
-- Name: australia_backtax_email_infos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.australia_backtax_email_infos (
    id bigint NOT NULL,
    user_id bigint,
    email_name character varying,
    sent_at timestamp(6) without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: australia_backtax_email_infos_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.australia_backtax_email_infos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: australia_backtax_email_infos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.australia_backtax_email_infos_id_seq OWNED BY public.australia_backtax_email_infos.id;


--
-- Name: backtax_agreements; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.backtax_agreements (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    jurisdiction character varying,
    signature character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    flags bigint DEFAULT 0 NOT NULL
);


--
-- Name: backtax_agreements_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.backtax_agreements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: backtax_agreements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.backtax_agreements_id_seq OWNED BY public.backtax_agreements.id;


--
-- Name: backtax_collections; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.backtax_collections (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    backtax_agreement_id bigint NOT NULL,
    amount_cents integer,
    amount_cents_usd integer,
    currency character varying,
    stripe_transfer_id character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: backtax_collections_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.backtax_collections_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: backtax_collections_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.backtax_collections_id_seq OWNED BY public.backtax_collections.id;


--
-- Name: balance_transactions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.balance_transactions (
    id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    user_id integer,
    merchant_account_id integer,
    balance_id integer,
    purchase_id integer,
    dispute_id integer,
    refund_id integer,
    credit_id integer,
    occurred_at timestamp without time zone,
    issued_amount_currency character varying,
    issued_amount_gross_cents integer,
    issued_amount_net_cents integer,
    holding_amount_currency character varying,
    holding_amount_gross_cents integer,
    holding_amount_net_cents integer
);


--
-- Name: balance_transactions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.balance_transactions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: balance_transactions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.balance_transactions_id_seq OWNED BY public.balance_transactions.id;


--
-- Name: balances; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.balances (
    id integer NOT NULL,
    user_id integer,
    date date,
    amount_cents integer DEFAULT 0,
    state character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    merchant_account_id integer DEFAULT 1,
    currency character varying DEFAULT 'usd'::character varying,
    holding_currency character varying DEFAULT 'usd'::character varying,
    holding_amount_cents integer DEFAULT 0
);


--
-- Name: balances_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.balances_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: balances_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.balances_id_seq OWNED BY public.balances.id;


--
-- Name: bank_accounts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bank_accounts (
    id integer NOT NULL,
    user_id integer,
    bank_number character varying,
    account_number bytea,
    state character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    account_number_last_four character varying,
    account_holder_full_name character varying,
    deleted_at timestamp without time zone,
    type character varying DEFAULT 'AchAccount'::character varying,
    branch_code character varying,
    account_type character varying,
    stripe_bank_account_id character varying,
    stripe_fingerprint character varying,
    stripe_connect_account_id character varying,
    country character varying(191),
    credit_card_id integer
);


--
-- Name: bank_accounts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.bank_accounts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bank_accounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.bank_accounts_id_seq OWNED BY public.bank_accounts.id;


--
-- Name: banks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.banks (
    id integer NOT NULL,
    routing_number character varying,
    name character varying
);


--
-- Name: banks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.banks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: banks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.banks_id_seq OWNED BY public.banks.id;


--
-- Name: base_variant_integrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.base_variant_integrations (
    id bigint NOT NULL,
    base_variant_id bigint NOT NULL,
    integration_id bigint NOT NULL,
    deleted_at timestamp without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: base_variant_integrations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.base_variant_integrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: base_variant_integrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.base_variant_integrations_id_seq OWNED BY public.base_variant_integrations.id;


--
-- Name: base_variants; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.base_variants (
    id integer NOT NULL,
    variant_category_id integer,
    price_difference_cents integer,
    name character varying,
    max_purchase_count integer,
    deleted_at timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    type character varying DEFAULT 'Variant'::character varying,
    link_id integer,
    custom_sku character varying,
    flags integer DEFAULT 0 NOT NULL,
    description character varying,
    position_in_category integer,
    customizable_price boolean,
    subscription_price_change_effective_date date,
    subscription_price_change_message text,
    duration_in_minutes integer
);


--
-- Name: base_variants_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.base_variants_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: base_variants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.base_variants_id_seq OWNED BY public.base_variants.id;


--
-- Name: base_variants_product_files; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.base_variants_product_files (
    id integer NOT NULL,
    base_variant_id integer,
    product_file_id integer
);


--
-- Name: base_variants_product_files_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.base_variants_product_files_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: base_variants_product_files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.base_variants_product_files_id_seq OWNED BY public.base_variants_product_files.id;


--
-- Name: base_variants_purchases; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.base_variants_purchases (
    id integer NOT NULL,
    purchase_id integer,
    base_variant_id integer
);


--
-- Name: base_variants_purchases_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.base_variants_purchases_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: base_variants_purchases_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.base_variants_purchases_id_seq OWNED BY public.base_variants_purchases.id;


--
-- Name: blocked_customer_objects; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.blocked_customer_objects (
    id bigint NOT NULL,
    seller_id bigint NOT NULL,
    object_type character varying NOT NULL,
    object_value character varying NOT NULL,
    buyer_email character varying,
    blocked_at timestamp(6) without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: blocked_customer_objects_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.blocked_customer_objects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: blocked_customer_objects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.blocked_customer_objects_id_seq OWNED BY public.blocked_customer_objects.id;


--
-- Name: bundle_product_purchases; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bundle_product_purchases (
    id bigint NOT NULL,
    bundle_purchase_id bigint NOT NULL,
    product_purchase_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: bundle_product_purchases_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.bundle_product_purchases_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bundle_product_purchases_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.bundle_product_purchases_id_seq OWNED BY public.bundle_product_purchases.id;


--
-- Name: bundle_products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bundle_products (
    id bigint NOT NULL,
    bundle_id bigint NOT NULL,
    product_id bigint NOT NULL,
    variant_id bigint,
    quantity integer NOT NULL,
    deleted_at timestamp(6) without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    "position" integer
);


--
-- Name: bundle_products_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.bundle_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bundle_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.bundle_products_id_seq OWNED BY public.bundle_products.id;


--
-- Name: cached_sales_related_products_infos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cached_sales_related_products_infos (
    id bigint NOT NULL,
    product_id bigint NOT NULL,
    counts json,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: cached_sales_related_products_infos_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cached_sales_related_products_infos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cached_sales_related_products_infos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cached_sales_related_products_infos_id_seq OWNED BY public.cached_sales_related_products_infos.id;


--
-- Name: call_availabilities; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.call_availabilities (
    id bigint NOT NULL,
    call_id bigint NOT NULL,
    start_time timestamp(6) without time zone,
    end_time timestamp(6) without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: call_availabilities_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.call_availabilities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: call_availabilities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.call_availabilities_id_seq OWNED BY public.call_availabilities.id;


--
-- Name: call_limitation_infos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.call_limitation_infos (
    id bigint NOT NULL,
    call_id bigint NOT NULL,
    minimum_notice_in_minutes integer,
    maximum_calls_per_day integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: call_limitation_infos_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.call_limitation_infos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: call_limitation_infos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.call_limitation_infos_id_seq OWNED BY public.call_limitation_infos.id;


--
-- Name: calls; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.calls (
    id bigint NOT NULL,
    purchase_id bigint,
    call_url character varying(1024),
    start_time timestamp(6) without time zone,
    end_time timestamp(6) without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    google_calendar_event_id character varying
);


--
-- Name: calls_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.calls_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: calls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.calls_id_seq OWNED BY public.calls.id;


--
-- Name: cart_products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cart_products (
    id bigint NOT NULL,
    cart_id bigint NOT NULL,
    product_id bigint NOT NULL,
    option_id bigint,
    affiliate_id bigint,
    accepted_offer_id bigint,
    price bigint NOT NULL,
    quantity integer NOT NULL,
    recurrence character varying,
    recommended_by character varying,
    rent boolean DEFAULT false NOT NULL,
    url_parameters json,
    referrer text NOT NULL,
    recommender_model_name character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    deleted_at timestamp(6) without time zone,
    call_start_time timestamp(6) without time zone,
    accepted_offer_details json,
    pay_in_installments boolean DEFAULT false NOT NULL
);


--
-- Name: cart_products_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cart_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cart_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cart_products_id_seq OWNED BY public.cart_products.id;


--
-- Name: carts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.carts (
    id bigint NOT NULL,
    user_id bigint,
    order_id bigint,
    return_url text,
    discount_codes json,
    reject_ppp_discount boolean DEFAULT false NOT NULL,
    deleted_at timestamp(6) without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    email character varying,
    browser_guid character varying,
    ip_address character varying
);


--
-- Name: carts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.carts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: carts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.carts_id_seq OWNED BY public.carts.id;


--
-- Name: charge_purchases; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.charge_purchases (
    id bigint NOT NULL,
    charge_id bigint NOT NULL,
    purchase_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: charge_purchases_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.charge_purchases_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: charge_purchases_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.charge_purchases_id_seq OWNED BY public.charge_purchases.id;


--
-- Name: charges; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.charges (
    id bigint NOT NULL,
    order_id bigint NOT NULL,
    seller_id bigint NOT NULL,
    processor character varying,
    processor_transaction_id character varying,
    payment_method_fingerprint character varying,
    credit_card_id bigint,
    merchant_account_id bigint,
    amount_cents bigint,
    gumroad_amount_cents bigint,
    processor_fee_cents bigint,
    processor_fee_currency character varying,
    paypal_order_id character varying,
    stripe_payment_intent_id character varying,
    stripe_setup_intent_id character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    disputed_at timestamp(6) without time zone,
    dispute_reversed_at timestamp(6) without time zone,
    flags bigint DEFAULT 0 NOT NULL
);


--
-- Name: charges_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.charges_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: charges_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.charges_id_seq OWNED BY public.charges.id;


--
-- Name: collaborator_invitations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.collaborator_invitations (
    id bigint NOT NULL,
    collaborator_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: collaborator_invitations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.collaborator_invitations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: collaborator_invitations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.collaborator_invitations_id_seq OWNED BY public.collaborator_invitations.id;


--
-- Name: comments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.comments (
    id bigint NOT NULL,
    commentable_id bigint,
    commentable_type character varying,
    author_id bigint,
    author_name character varying,
    content text,
    comment_type character varying,
    json_data text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    deleted_at timestamp without time zone,
    purchase_id bigint,
    ancestry character varying,
    ancestry_depth integer DEFAULT 0 NOT NULL
);


--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.comments_id_seq OWNED BY public.comments.id;


--
-- Name: commission_files; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.commission_files (
    id bigint NOT NULL,
    url character varying(1024),
    commission_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: commission_files_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.commission_files_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: commission_files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.commission_files_id_seq OWNED BY public.commission_files.id;


--
-- Name: commissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.commissions (
    id bigint NOT NULL,
    status character varying,
    deposit_purchase_id bigint,
    completion_purchase_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: commissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.commissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: commissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.commissions_id_seq OWNED BY public.commissions.id;


--
-- Name: communities; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.communities (
    id bigint NOT NULL,
    resource_type character varying NOT NULL,
    resource_id bigint NOT NULL,
    seller_id bigint NOT NULL,
    deleted_at timestamp(6) without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: communities_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.communities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: communities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.communities_id_seq OWNED BY public.communities.id;


--
-- Name: community_chat_messages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.community_chat_messages (
    id bigint NOT NULL,
    community_id bigint NOT NULL,
    user_id bigint NOT NULL,
    content text NOT NULL,
    deleted_at timestamp(6) without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: community_chat_messages_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.community_chat_messages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: community_chat_messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.community_chat_messages_id_seq OWNED BY public.community_chat_messages.id;


--
-- Name: community_chat_recap_runs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.community_chat_recap_runs (
    id bigint NOT NULL,
    recap_frequency character varying NOT NULL,
    from_date timestamp(6) without time zone NOT NULL,
    to_date timestamp(6) without time zone NOT NULL,
    recaps_count integer DEFAULT 0 NOT NULL,
    finished_at timestamp(6) without time zone,
    notified_at timestamp(6) without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: community_chat_recap_runs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.community_chat_recap_runs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: community_chat_recap_runs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.community_chat_recap_runs_id_seq OWNED BY public.community_chat_recap_runs.id;


--
-- Name: community_chat_recaps; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.community_chat_recaps (
    id bigint NOT NULL,
    community_chat_recap_run_id bigint NOT NULL,
    community_id bigint,
    seller_id bigint,
    summarized_message_count integer DEFAULT 0 NOT NULL,
    summary text,
    status character varying DEFAULT 'pending'::character varying NOT NULL,
    error_message character varying,
    input_token_count integer DEFAULT 0 NOT NULL,
    output_token_count integer DEFAULT 0 NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: community_chat_recaps_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.community_chat_recaps_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: community_chat_recaps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.community_chat_recaps_id_seq OWNED BY public.community_chat_recaps.id;


--
-- Name: community_notification_settings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.community_notification_settings (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    seller_id bigint NOT NULL,
    recap_frequency character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: community_notification_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.community_notification_settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: community_notification_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.community_notification_settings_id_seq OWNED BY public.community_notification_settings.id;


--
-- Name: computed_sales_analytics_days; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.computed_sales_analytics_days (
    id integer NOT NULL,
    key character varying(191) NOT NULL,
    data text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: computed_sales_analytics_days_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.computed_sales_analytics_days_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: computed_sales_analytics_days_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.computed_sales_analytics_days_id_seq OWNED BY public.computed_sales_analytics_days.id;


--
-- Name: consumption_events; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.consumption_events (
    id bigint NOT NULL,
    product_file_id bigint,
    url_redirect_id bigint,
    purchase_id bigint,
    event_type character varying,
    platform character varying,
    flags integer DEFAULT 0 NOT NULL,
    json_data text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    link_id bigint,
    consumed_at timestamp without time zone,
    media_location_basis_points integer
);


--
-- Name: consumption_events_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.consumption_events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: consumption_events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.consumption_events_id_seq OWNED BY public.consumption_events.id;


--
-- Name: credit_cards; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.credit_cards (
    id integer NOT NULL,
    card_type character varying,
    expiry_month integer,
    expiry_year integer,
    stripe_customer_id character varying,
    visual character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    stripe_fingerprint character varying,
    cvc_check_failed boolean,
    card_country character varying,
    stripe_card_id character varying,
    card_bin character varying,
    preorder_id integer,
    card_data_handling_mode character varying,
    charge_processor_id character varying,
    braintree_customer_id character varying,
    funding_type character varying(191),
    paypal_billing_agreement_id character varying(191),
    processor_payment_method_id character varying,
    json_data json
);


--
-- Name: credit_cards_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.credit_cards_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: credit_cards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.credit_cards_id_seq OWNED BY public.credit_cards.id;


--
-- Name: credits; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.credits (
    id integer NOT NULL,
    user_id integer,
    amount_cents integer,
    balance_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    crediting_user_id integer,
    chargebacked_purchase_id integer,
    merchant_account_id integer DEFAULT 1,
    dispute_id integer,
    returned_payment_id integer,
    refund_id integer,
    financing_paydown_purchase_id integer,
    fee_retention_refund_id integer,
    backtax_agreement_id bigint,
    json_data text
);


--
-- Name: credits_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.credits_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: credits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.credits_id_seq OWNED BY public.credits.id;


--
-- Name: custom_domains; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.custom_domains (
    id integer NOT NULL,
    user_id integer,
    domain character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    ssl_certificate_issued_at timestamp without time zone,
    deleted_at timestamp without time zone,
    state character varying DEFAULT 'unverified'::character varying NOT NULL,
    failed_verification_attempts_count integer DEFAULT 0 NOT NULL,
    product_id bigint
);


--
-- Name: custom_domains_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.custom_domains_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: custom_domains_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.custom_domains_id_seq OWNED BY public.custom_domains.id;


--
-- Name: custom_fields; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.custom_fields (
    id bigint NOT NULL,
    field_type character varying,
    name character varying,
    required boolean DEFAULT false,
    global boolean DEFAULT false,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    seller_id bigint NOT NULL,
    flags bigint DEFAULT 0 NOT NULL
);


--
-- Name: custom_fields_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.custom_fields_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: custom_fields_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.custom_fields_id_seq OWNED BY public.custom_fields.id;


--
-- Name: custom_fields_products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.custom_fields_products (
    id bigint NOT NULL,
    custom_field_id bigint NOT NULL,
    product_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: custom_fields_products_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.custom_fields_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: custom_fields_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.custom_fields_products_id_seq OWNED BY public.custom_fields_products.id;


--
-- Name: devices; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.devices (
    id integer NOT NULL,
    token character varying NOT NULL,
    app_version character varying,
    device_type character varying DEFAULT 'ios'::character varying NOT NULL,
    user_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    app_type character varying DEFAULT 'consumer'::character varying NOT NULL
);


--
-- Name: devices_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.devices_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: devices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.devices_id_seq OWNED BY public.devices.id;


--
-- Name: discover_search_suggestions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.discover_search_suggestions (
    id bigint NOT NULL,
    discover_search_id bigint,
    deleted_at timestamp(6) without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: discover_search_suggestions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.discover_search_suggestions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: discover_search_suggestions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.discover_search_suggestions_id_seq OWNED BY public.discover_search_suggestions.id;


--
-- Name: discover_searches; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.discover_searches (
    id bigint NOT NULL,
    query character varying,
    taxonomy_id bigint,
    user_id bigint,
    ip_address character varying,
    browser_guid character varying,
    autocomplete boolean DEFAULT false NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    clicked_resource_type character varying,
    clicked_resource_id bigint
);


--
-- Name: discover_searches_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.discover_searches_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: discover_searches_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.discover_searches_id_seq OWNED BY public.discover_searches.id;


--
-- Name: dispute_evidences; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dispute_evidences (
    id bigint NOT NULL,
    dispute_id bigint NOT NULL,
    purchased_at timestamp(6) without time zone,
    customer_purchase_ip character varying,
    customer_email character varying,
    customer_name character varying,
    billing_address character varying,
    shipping_address character varying,
    shipped_at timestamp(6) without time zone,
    shipping_carrier character varying,
    shipping_tracking_number character varying,
    uncategorized_text text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    product_description text,
    cancellation_policy_disclosure text,
    refund_policy_disclosure text,
    cancellation_rebuttal text,
    refund_refusal_explanation text,
    seller_contacted_at timestamp(6) without time zone,
    seller_submitted_at timestamp(6) without time zone,
    resolved_at timestamp(6) without time zone,
    resolution character varying DEFAULT 'unknown'::character varying,
    error_message character varying,
    access_activity_log text,
    reason_for_winning text
);


--
-- Name: dispute_evidences_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dispute_evidences_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dispute_evidences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dispute_evidences_id_seq OWNED BY public.dispute_evidences.id;


--
-- Name: disputes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.disputes (
    id integer NOT NULL,
    purchase_id integer,
    charge_processor_id character varying,
    charge_processor_dispute_id character varying,
    reason character varying,
    state character varying,
    initiated_at timestamp without time zone,
    closed_at timestamp without time zone,
    formalized_at timestamp without time zone,
    won_at timestamp without time zone,
    lost_at timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    service_charge_id integer,
    seller_id bigint,
    event_created_at timestamp(6) without time zone,
    charge_id bigint
);


--
-- Name: disputes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.disputes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: disputes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.disputes_id_seq OWNED BY public.disputes.id;


--
-- Name: dropbox_files; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dropbox_files (
    id integer NOT NULL,
    state character varying,
    dropbox_url character varying(2000),
    expires_at timestamp without time zone,
    deleted_at timestamp without time zone,
    user_id integer,
    product_file_id integer,
    link_id integer,
    json_data text,
    s3_url character varying(2000),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: dropbox_files_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dropbox_files_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dropbox_files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dropbox_files_id_seq OWNED BY public.dropbox_files.id;


--
-- Name: email_info_charges; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.email_info_charges (
    id bigint NOT NULL,
    email_info_id bigint NOT NULL,
    charge_id bigint NOT NULL
);


--
-- Name: email_info_charges_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.email_info_charges_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: email_info_charges_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.email_info_charges_id_seq OWNED BY public.email_info_charges.id;


--
-- Name: email_infos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.email_infos (
    id bigint NOT NULL,
    purchase_id bigint,
    installment_id bigint,
    type character varying,
    email_name character varying,
    state character varying,
    sent_at timestamp without time zone,
    delivered_at timestamp without time zone,
    opened_at timestamp without time zone
);


--
-- Name: email_infos_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.email_infos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: email_infos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.email_infos_id_seq OWNED BY public.email_infos.id;


--
-- Name: events; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.events (
    id integer NOT NULL,
    visit_id integer,
    ip_address character varying,
    event_name character varying,
    user_id integer,
    link_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    referrer character varying,
    parent_referrer character varying,
    language character varying,
    browser character varying,
    is_mobile boolean DEFAULT false,
    email character varying,
    purchase_id integer,
    price_cents integer,
    credit_card_id integer,
    card_type character varying,
    card_visual character varying,
    purchase_state character varying,
    billing_zip character varying,
    chargeback boolean DEFAULT false,
    refunded boolean DEFAULT false,
    view_url character varying,
    fingerprint character varying,
    ip_country character varying,
    ip_longitude double precision,
    ip_latitude double precision,
    is_modal boolean,
    friend_actions text,
    browser_fingerprint character varying,
    browser_plugins character varying,
    browser_guid character varying,
    referrer_domain character varying,
    ip_state character varying,
    active_test_path_assignments character varying,
    service_charge_id integer
);


--
-- Name: events_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.events_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.events_id_seq OWNED BY public.events.id;


--
-- Name: followers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.followers (
    id integer NOT NULL,
    followed_id integer NOT NULL,
    email character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    follower_user_id integer,
    source character varying,
    source_product_id integer,
    confirmed_at timestamp without time zone,
    deleted_at timestamp without time zone
);


--
-- Name: followers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.followers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: followers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.followers_id_seq OWNED BY public.followers.id;


--
-- Name: friendly_id_slugs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.friendly_id_slugs (
    id integer NOT NULL,
    slug character varying(191) NOT NULL,
    sluggable_id integer NOT NULL,
    sluggable_type character varying(50),
    scope character varying(191),
    created_at timestamp without time zone
);


--
-- Name: friendly_id_slugs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.friendly_id_slugs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: friendly_id_slugs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.friendly_id_slugs_id_seq OWNED BY public.friendly_id_slugs.id;


--
-- Name: gifts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.gifts (
    id bigint NOT NULL,
    giftee_purchase_id bigint,
    gifter_purchase_id bigint,
    link_id bigint,
    state character varying,
    gift_note text,
    giftee_email character varying,
    gifter_email character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    flags bigint DEFAULT 0 NOT NULL
);


--
-- Name: gifts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.gifts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: gifts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.gifts_id_seq OWNED BY public.gifts.id;


--
-- Name: gumroad_daily_analytics; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.gumroad_daily_analytics (
    id bigint NOT NULL,
    period_ended_at timestamp(6) without time zone NOT NULL,
    gumroad_price_cents integer NOT NULL,
    gumroad_fee_cents integer NOT NULL,
    creators_with_sales integer NOT NULL,
    gumroad_discover_price_cents integer NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: gumroad_daily_analytics_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.gumroad_daily_analytics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: gumroad_daily_analytics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.gumroad_daily_analytics_id_seq OWNED BY public.gumroad_daily_analytics.id;


--
-- Name: imported_customers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.imported_customers (
    id integer NOT NULL,
    email character varying,
    purchase_date timestamp without time zone,
    link_id integer,
    importing_user_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    deleted_at timestamp without time zone
);


--
-- Name: imported_customers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.imported_customers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: imported_customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.imported_customers_id_seq OWNED BY public.imported_customers.id;


--
-- Name: installment_events; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.installment_events (
    id integer NOT NULL,
    event_id integer,
    installment_id integer
);


--
-- Name: installment_events_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.installment_events_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: installment_events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.installment_events_id_seq OWNED BY public.installment_events.id;


--
-- Name: installment_rules; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.installment_rules (
    id integer NOT NULL,
    installment_id integer,
    delayed_delivery_time integer,
    to_be_published_at timestamp without time zone,
    version integer DEFAULT 0 NOT NULL,
    deleted_at timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    time_period character varying
);


--
-- Name: installment_rules_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.installment_rules_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: installment_rules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.installment_rules_id_seq OWNED BY public.installment_rules.id;


--
-- Name: installments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.installments (
    id integer NOT NULL,
    link_id integer,
    message text,
    url text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    name character varying,
    published_at timestamp without time zone,
    deleted_at timestamp without time zone,
    flags integer DEFAULT 0 NOT NULL,
    seller_id integer,
    installment_type character varying,
    json_data text,
    customer_count integer,
    workflow_id integer,
    call_to_action_text character varying(2083),
    call_to_action_url character varying(2083),
    cover_image_url character varying,
    base_variant_id integer,
    slug character varying,
    installment_events_count integer DEFAULT 0
);


--
-- Name: installments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.installments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: installments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.installments_id_seq OWNED BY public.installments.id;


--
-- Name: integrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.integrations (
    id bigint NOT NULL,
    api_key character varying,
    json_data text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    flags bigint DEFAULT 0 NOT NULL,
    type character varying
);


--
-- Name: integrations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.integrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: integrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.integrations_id_seq OWNED BY public.integrations.id;


--
-- Name: invites; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.invites (
    id integer NOT NULL,
    sender_id integer,
    receiver_email character varying,
    receiver_id integer,
    invite_state character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: invites_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.invites_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: invites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.invites_id_seq OWNED BY public.invites.id;


--
-- Name: large_sellers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.large_sellers (
    id integer NOT NULL,
    user_id integer NOT NULL,
    sales_count integer DEFAULT 0 NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: large_sellers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.large_sellers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: large_sellers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.large_sellers_id_seq OWNED BY public.large_sellers.id;


--
-- Name: last_read_community_chat_messages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.last_read_community_chat_messages (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    community_id bigint NOT NULL,
    community_chat_message_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: last_read_community_chat_messages_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.last_read_community_chat_messages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: last_read_community_chat_messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.last_read_community_chat_messages_id_seq OWNED BY public.last_read_community_chat_messages.id;


--
-- Name: legacy_permalinks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.legacy_permalinks (
    id bigint NOT NULL,
    permalink character varying NOT NULL,
    product_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: legacy_permalinks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.legacy_permalinks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: legacy_permalinks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.legacy_permalinks_id_seq OWNED BY public.legacy_permalinks.id;


--
-- Name: licenses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.licenses (
    id integer NOT NULL,
    link_id integer,
    purchase_id integer,
    serial character varying,
    trial_expires_at timestamp without time zone,
    uses integer DEFAULT 0,
    json_data character varying,
    deleted_at timestamp without time zone,
    flags integer DEFAULT 0,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    imported_customer_id integer,
    disabled_at timestamp without time zone
);


--
-- Name: licenses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.licenses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: licenses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.licenses_id_seq OWNED BY public.licenses.id;


--
-- Name: links; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.links (
    id bigint NOT NULL,
    user_id bigint,
    name character varying NOT NULL,
    unique_permalink character varying,
    preview_url text,
    description text,
    purchase_type integer DEFAULT 0,
    created_at timestamp without time zone,
    updated_at timestamp(6) without time zone,
    purchase_disabled_at timestamp without time zone,
    deleted_at timestamp without time zone,
    price_cents integer,
    price_currency_type character varying DEFAULT 'usd'::character varying,
    customizable_price boolean,
    max_purchase_count integer,
    bad_card_counter integer DEFAULT 0,
    require_shipping boolean DEFAULT false,
    last_partner_sync timestamp without time zone,
    preview_oembed text,
    showcaseable boolean DEFAULT false,
    custom_receipt text,
    custom_filetype character varying,
    filetype character varying DEFAULT 'link'::character varying,
    filegroup character varying DEFAULT 'url'::character varying,
    size bigint,
    bitrate integer,
    framerate integer,
    pagelength integer,
    duration integer,
    width integer,
    height integer,
    custom_permalink character varying,
    common_color character varying,
    suggested_price_cents integer,
    banned_at timestamp without time zone,
    risk_score integer,
    risk_score_updated_at timestamp without time zone,
    draft boolean DEFAULT false,
    flags bigint DEFAULT 0 NOT NULL,
    subscription_duration integer,
    json_data text,
    external_mapping_id character varying,
    affiliate_application_id bigint,
    rental_price_cents integer,
    duration_in_months integer,
    migrated_to_tiered_pricing_at timestamp without time zone,
    free_trial_duration_unit integer,
    free_trial_duration_amount integer,
    content_updated_at timestamp without time zone,
    taxonomy_id bigint,
    native_type character varying DEFAULT 'digital'::character varying NOT NULL,
    discover_fee_per_thousand integer DEFAULT 100 NOT NULL
);


--
-- Name: links_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.links_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.links_id_seq OWNED BY public.links.id;


--
-- Name: media_locations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.media_locations (
    id bigint NOT NULL,
    product_file_id bigint NOT NULL,
    url_redirect_id bigint NOT NULL,
    purchase_id bigint NOT NULL,
    product_id bigint NOT NULL,
    consumed_at timestamp without time zone,
    platform character varying,
    location integer NOT NULL,
    content_length integer,
    unit character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: media_locations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.media_locations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: media_locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.media_locations_id_seq OWNED BY public.media_locations.id;


--
-- Name: merchant_accounts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.merchant_accounts (
    id bigint NOT NULL,
    user_id bigint,
    acquirer_id character varying,
    acquirer_merchant_id character varying,
    charge_processor_id character varying,
    charge_processor_merchant_id character varying,
    json_data text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone,
    charge_processor_verified_at timestamp without time zone,
    country character varying DEFAULT 'US'::character varying,
    currency character varying DEFAULT 'usd'::character varying,
    charge_processor_deleted_at timestamp without time zone,
    charge_processor_alive_at timestamp without time zone
);


--
-- Name: merchant_accounts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.merchant_accounts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: merchant_accounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.merchant_accounts_id_seq OWNED BY public.merchant_accounts.id;


--
-- Name: oauth_access_grants; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.oauth_access_grants (
    id integer NOT NULL,
    resource_owner_id integer NOT NULL,
    application_id integer NOT NULL,
    token character varying NOT NULL,
    expires_in integer NOT NULL,
    redirect_uri character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    revoked_at timestamp without time zone,
    scopes character varying DEFAULT ''::character varying NOT NULL
);


--
-- Name: oauth_access_grants_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.oauth_access_grants_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: oauth_access_grants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.oauth_access_grants_id_seq OWNED BY public.oauth_access_grants.id;


--
-- Name: oauth_access_tokens; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.oauth_access_tokens (
    id integer NOT NULL,
    resource_owner_id integer,
    application_id integer NOT NULL,
    token character varying NOT NULL,
    refresh_token character varying,
    expires_in integer,
    revoked_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    scopes character varying
);


--
-- Name: oauth_access_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.oauth_access_tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: oauth_access_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.oauth_access_tokens_id_seq OWNED BY public.oauth_access_tokens.id;


--
-- Name: oauth_applications; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.oauth_applications (
    id integer NOT NULL,
    name character varying NOT NULL,
    uid character varying NOT NULL,
    secret character varying NOT NULL,
    redirect_uri character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    owner_id integer,
    owner_type character varying DEFAULT 'User'::character varying,
    affiliate_basis_points integer,
    deleted_at timestamp without time zone,
    scopes character varying DEFAULT ''::character varying NOT NULL,
    confidential boolean DEFAULT false NOT NULL
);


--
-- Name: oauth_applications_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.oauth_applications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: oauth_applications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.oauth_applications_id_seq OWNED BY public.oauth_applications.id;


--
-- Name: offer_codes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.offer_codes (
    id integer NOT NULL,
    link_id integer,
    name character varying,
    amount_cents integer,
    max_purchase_count integer,
    deleted_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    amount_percentage integer,
    user_id integer,
    currency_type character varying,
    code character varying,
    universal boolean DEFAULT false NOT NULL,
    valid_at timestamp without time zone,
    expires_at timestamp without time zone,
    minimum_quantity integer,
    duration_in_months integer,
    minimum_amount_cents integer,
    flags bigint DEFAULT 0 NOT NULL
);


--
-- Name: offer_codes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.offer_codes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: offer_codes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.offer_codes_id_seq OWNED BY public.offer_codes.id;


--
-- Name: offer_codes_products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.offer_codes_products (
    id bigint NOT NULL,
    offer_code_id bigint,
    product_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: offer_codes_products_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.offer_codes_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: offer_codes_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.offer_codes_products_id_seq OWNED BY public.offer_codes_products.id;


--
-- Name: order_purchases; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.order_purchases (
    id bigint NOT NULL,
    order_id bigint NOT NULL,
    purchase_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: order_purchases_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.order_purchases_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: order_purchases_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.order_purchases_id_seq OWNED BY public.order_purchases.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.orders (
    id bigint NOT NULL,
    purchaser_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    flags bigint DEFAULT 0 NOT NULL,
    review_reminder_scheduled_at timestamp(6) without time zone
);


--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: payment_options; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.payment_options (
    id integer NOT NULL,
    subscription_id integer,
    price_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone,
    flags integer DEFAULT 0 NOT NULL,
    product_installment_plan_id bigint
);


--
-- Name: payment_options_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.payment_options_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: payment_options_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.payment_options_id_seq OWNED BY public.payment_options.id;


--
-- Name: payments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.payments (
    id bigint NOT NULL,
    user_id bigint,
    state character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    txn_id character varying,
    processor_fee_cents integer,
    correlation_id character varying,
    processor character varying,
    amount_cents bigint,
    payment_address character varying,
    payout_period_end_date date,
    bank_account_id bigint,
    amount_cents_in_local_currency integer,
    stripe_connect_account_id character varying,
    stripe_transfer_id character varying,
    stripe_internal_transfer_id character varying,
    currency character varying DEFAULT 'usd'::character varying,
    flags integer DEFAULT 0 NOT NULL,
    json_data text,
    failure_reason character varying(191),
    processor_reversing_payout_id character varying
);


--
-- Name: payments_balances; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.payments_balances (
    id integer NOT NULL,
    payment_id integer,
    balance_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: payments_balances_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.payments_balances_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: payments_balances_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.payments_balances_id_seq OWNED BY public.payments_balances.id;


--
-- Name: payments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.payments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: payments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.payments_id_seq OWNED BY public.payments.id;


--
-- Name: post_email_blasts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.post_email_blasts (
    id bigint NOT NULL,
    post_id bigint NOT NULL,
    seller_id bigint NOT NULL,
    requested_at timestamp(6) without time zone,
    started_at timestamp(6) without time zone,
    first_email_delivered_at timestamp(6) without time zone,
    last_email_delivered_at timestamp(6) without time zone,
    delivery_count integer DEFAULT 0,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    completed_at timestamp(6) without time zone
);


--
-- Name: post_email_blasts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.post_email_blasts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: post_email_blasts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.post_email_blasts_id_seq OWNED BY public.post_email_blasts.id;


--
-- Name: preorder_links; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.preorder_links (
    id bigint NOT NULL,
    link_id bigint,
    state character varying,
    release_at timestamp without time zone,
    url character varying,
    custom_filetype character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: preorder_links_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.preorder_links_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: preorder_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.preorder_links_id_seq OWNED BY public.preorder_links.id;


--
-- Name: preorders; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.preorders (
    id integer NOT NULL,
    preorder_link_id integer NOT NULL,
    seller_id integer NOT NULL,
    purchaser_id integer,
    state character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: preorders_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.preorders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: preorders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.preorders_id_seq OWNED BY public.preorders.id;


--
-- Name: prices; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.prices (
    id integer NOT NULL,
    link_id integer,
    price_cents integer DEFAULT 0 NOT NULL,
    currency character varying DEFAULT 'usd'::character varying,
    recurrence character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone,
    flags integer DEFAULT 0 NOT NULL,
    variant_id integer,
    suggested_price_cents integer
);


--
-- Name: prices_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.prices_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: prices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.prices_id_seq OWNED BY public.prices.id;


--
-- Name: processor_payment_intents; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.processor_payment_intents (
    id bigint NOT NULL,
    purchase_id bigint NOT NULL,
    intent_id character varying NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: processor_payment_intents_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.processor_payment_intents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: processor_payment_intents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.processor_payment_intents_id_seq OWNED BY public.processor_payment_intents.id;


--
-- Name: product_cached_values; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.product_cached_values (
    id bigint NOT NULL,
    product_id bigint NOT NULL,
    expired boolean DEFAULT false NOT NULL,
    successful_sales_count integer,
    remaining_for_sale_count integer,
    monthly_recurring_revenue numeric(10,2),
    revenue_pending numeric(10,2),
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    total_usd_cents bigint DEFAULT 0
);


--
-- Name: product_cached_values_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.product_cached_values_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: product_cached_values_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.product_cached_values_id_seq OWNED BY public.product_cached_values.id;


--
-- Name: product_files; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.product_files (
    id bigint NOT NULL,
    link_id bigint,
    url character varying(1024),
    filetype character varying,
    filegroup character varying,
    size bigint,
    bitrate integer,
    framerate integer,
    pagelength integer,
    duration integer,
    width integer,
    height integer,
    flags bigint DEFAULT 0 NOT NULL,
    json_data text,
    deleted_at timestamp(6) without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    "position" integer,
    installment_id bigint,
    display_name character varying(1024),
    deleted_from_cdn_at timestamp(6) without time zone,
    description text,
    folder_id bigint,
    stampable_pdf boolean
);


--
-- Name: product_files_archives; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.product_files_archives (
    id bigint NOT NULL,
    deleted_at timestamp(6) without time zone,
    link_id bigint,
    installment_id bigint,
    product_files_archive_state character varying,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    url character varying(1024),
    deleted_from_cdn_at timestamp(6) without time zone,
    variant_id bigint,
    digest character varying,
    folder_id character varying
);


--
-- Name: product_files_archives_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.product_files_archives_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: product_files_archives_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.product_files_archives_id_seq OWNED BY public.product_files_archives.id;


--
-- Name: product_files_files_archives; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.product_files_files_archives (
    id integer NOT NULL,
    product_file_id integer,
    product_files_archive_id integer
);


--
-- Name: product_files_files_archives_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.product_files_files_archives_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: product_files_files_archives_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.product_files_files_archives_id_seq OWNED BY public.product_files_files_archives.id;


--
-- Name: product_files_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.product_files_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: product_files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.product_files_id_seq OWNED BY public.product_files.id;


--
-- Name: product_folders; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.product_folders (
    id bigint NOT NULL,
    product_id bigint,
    name character varying NOT NULL,
    "position" integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    deleted_at timestamp without time zone
);


--
-- Name: product_folders_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.product_folders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: product_folders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.product_folders_id_seq OWNED BY public.product_folders.id;


--
-- Name: product_installment_plans; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.product_installment_plans (
    id bigint NOT NULL,
    link_id bigint NOT NULL,
    number_of_installments integer NOT NULL,
    recurrence character varying NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    deleted_at timestamp(6) without time zone
);


--
-- Name: product_installment_plans_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.product_installment_plans_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: product_installment_plans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.product_installment_plans_id_seq OWNED BY public.product_installment_plans.id;


--
-- Name: product_integrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.product_integrations (
    id bigint NOT NULL,
    product_id bigint NOT NULL,
    integration_id bigint NOT NULL,
    deleted_at timestamp without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: product_integrations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.product_integrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: product_integrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.product_integrations_id_seq OWNED BY public.product_integrations.id;


--
-- Name: product_review_responses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.product_review_responses (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    product_review_id bigint NOT NULL,
    message text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: product_review_responses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.product_review_responses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: product_review_responses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.product_review_responses_id_seq OWNED BY public.product_review_responses.id;


--
-- Name: product_review_stats; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.product_review_stats (
    id integer NOT NULL,
    link_id integer,
    reviews_count integer DEFAULT 0 NOT NULL,
    average_rating double precision DEFAULT 0.0 NOT NULL,
    ratings_of_one_count integer DEFAULT 0,
    ratings_of_two_count integer DEFAULT 0,
    ratings_of_three_count integer DEFAULT 0,
    ratings_of_four_count integer DEFAULT 0,
    ratings_of_five_count integer DEFAULT 0,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: product_review_stats_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.product_review_stats_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: product_review_stats_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.product_review_stats_id_seq OWNED BY public.product_review_stats.id;


--
-- Name: product_review_videos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.product_review_videos (
    id bigint NOT NULL,
    product_review_id bigint NOT NULL,
    approval_status character varying DEFAULT 'pending_review'::character varying,
    deleted_at timestamp(6) without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: product_review_videos_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.product_review_videos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: product_review_videos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.product_review_videos_id_seq OWNED BY public.product_review_videos.id;


--
-- Name: product_reviews; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.product_reviews (
    id bigint NOT NULL,
    purchase_id bigint,
    rating integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    link_id bigint,
    message text,
    has_message boolean DEFAULT false NOT NULL,
    deleted_at timestamp(6) without time zone
);


--
-- Name: product_reviews_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.product_reviews_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: product_reviews_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.product_reviews_id_seq OWNED BY public.product_reviews.id;


--
-- Name: product_taggings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.product_taggings (
    id integer NOT NULL,
    tag_id integer,
    product_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: product_taggings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.product_taggings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: product_taggings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.product_taggings_id_seq OWNED BY public.product_taggings.id;


--
-- Name: public_files; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.public_files (
    id bigint NOT NULL,
    seller_id bigint,
    resource_type character varying NOT NULL,
    resource_id bigint NOT NULL,
    public_id character varying NOT NULL,
    display_name character varying NOT NULL,
    original_file_name character varying NOT NULL,
    file_type character varying,
    file_group character varying,
    deleted_at timestamp(6) without time zone,
    scheduled_for_deletion_at timestamp(6) without time zone,
    json_data text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: public_files_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.public_files_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: public_files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.public_files_id_seq OWNED BY public.public_files.id;


--
-- Name: purchase_custom_field_files; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.purchase_custom_field_files (
    id bigint NOT NULL,
    url character varying,
    purchase_custom_field_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: purchase_custom_field_files_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.purchase_custom_field_files_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: purchase_custom_field_files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.purchase_custom_field_files_id_seq OWNED BY public.purchase_custom_field_files.id;


--
-- Name: purchase_custom_fields; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.purchase_custom_fields (
    id bigint NOT NULL,
    purchase_id bigint NOT NULL,
    field_type character varying NOT NULL,
    name character varying NOT NULL,
    value text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    bundle_product_id bigint,
    custom_field_id bigint,
    flags bigint DEFAULT 0 NOT NULL
);


--
-- Name: purchase_custom_fields_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.purchase_custom_fields_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: purchase_custom_fields_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.purchase_custom_fields_id_seq OWNED BY public.purchase_custom_fields.id;


--
-- Name: purchase_early_fraud_warnings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.purchase_early_fraud_warnings (
    id bigint NOT NULL,
    purchase_id bigint,
    processor_id character varying NOT NULL,
    dispute_id bigint,
    refund_id bigint,
    fraud_type character varying NOT NULL,
    actionable boolean NOT NULL,
    charge_risk_level character varying NOT NULL,
    processor_created_at timestamp(6) without time zone NOT NULL,
    resolution character varying DEFAULT 'unknown'::character varying,
    resolved_at timestamp(6) without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    resolution_message character varying,
    charge_id bigint
);


--
-- Name: purchase_early_fraud_warnings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.purchase_early_fraud_warnings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: purchase_early_fraud_warnings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.purchase_early_fraud_warnings_id_seq OWNED BY public.purchase_early_fraud_warnings.id;


--
-- Name: purchase_integrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.purchase_integrations (
    id bigint NOT NULL,
    purchase_id bigint NOT NULL,
    integration_id bigint NOT NULL,
    deleted_at timestamp without time zone,
    discord_user_id character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: purchase_integrations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.purchase_integrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: purchase_integrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.purchase_integrations_id_seq OWNED BY public.purchase_integrations.id;


--
-- Name: purchase_offer_code_discounts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.purchase_offer_code_discounts (
    id bigint NOT NULL,
    purchase_id bigint NOT NULL,
    offer_code_id bigint NOT NULL,
    offer_code_amount integer NOT NULL,
    offer_code_is_percent boolean DEFAULT false NOT NULL,
    pre_discount_minimum_price_cents integer NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    duration_in_months integer
);


--
-- Name: purchase_offer_code_discounts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.purchase_offer_code_discounts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: purchase_offer_code_discounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.purchase_offer_code_discounts_id_seq OWNED BY public.purchase_offer_code_discounts.id;


--
-- Name: purchase_refund_policies; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.purchase_refund_policies (
    id bigint NOT NULL,
    purchase_id bigint NOT NULL,
    title character varying NOT NULL,
    fine_print text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    max_refund_period_in_days integer
);


--
-- Name: purchase_refund_policies_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.purchase_refund_policies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: purchase_refund_policies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.purchase_refund_policies_id_seq OWNED BY public.purchase_refund_policies.id;


--
-- Name: purchase_sales_tax_infos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.purchase_sales_tax_infos (
    id integer NOT NULL,
    purchase_id integer,
    elected_country_code character varying,
    card_country_code character varying,
    ip_country_code character varying,
    country_code character varying,
    postal_code character varying,
    ip_address character varying,
    business_vat_id character varying(191),
    state_code character varying
);


--
-- Name: purchase_sales_tax_infos_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.purchase_sales_tax_infos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: purchase_sales_tax_infos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.purchase_sales_tax_infos_id_seq OWNED BY public.purchase_sales_tax_infos.id;


--
-- Name: purchase_taxjar_infos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.purchase_taxjar_infos (
    id bigint NOT NULL,
    purchase_id bigint NOT NULL,
    combined_tax_rate numeric(8,7),
    county_tax_rate numeric(8,7),
    city_tax_rate numeric(8,7),
    state_tax_rate numeric(8,7),
    jurisdiction_state character varying,
    jurisdiction_county character varying,
    jurisdiction_city character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    gst_tax_rate numeric(8,7),
    pst_tax_rate numeric(8,7),
    qst_tax_rate numeric(8,7)
);


--
-- Name: purchase_taxjar_infos_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.purchase_taxjar_infos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: purchase_taxjar_infos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.purchase_taxjar_infos_id_seq OWNED BY public.purchase_taxjar_infos.id;


--
-- Name: purchase_wallet_types; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.purchase_wallet_types (
    id bigint NOT NULL,
    purchase_id bigint NOT NULL,
    wallet_type character varying NOT NULL
);


--
-- Name: purchase_wallet_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.purchase_wallet_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: purchase_wallet_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.purchase_wallet_types_id_seq OWNED BY public.purchase_wallet_types.id;


--
-- Name: purchases; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.purchases (
    id bigint NOT NULL,
    seller_id bigint,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    fee_cents integer,
    link_id bigint,
    email text,
    price_cents integer,
    displayed_price_cents integer,
    displayed_price_currency_type character varying DEFAULT 'usd'::character varying,
    rate_converted_to_usd character varying,
    street_address character varying,
    city character varying,
    state character varying,
    zip_code character varying,
    country character varying,
    full_name character varying,
    credit_card_id bigint,
    purchaser_id bigint,
    purchaser_type character varying DEFAULT 'User'::character varying,
    session_id character varying,
    ip_address character varying,
    is_mobile boolean,
    stripe_refunded boolean,
    stripe_transaction_id character varying,
    stripe_fingerprint character varying,
    stripe_card_id character varying,
    can_contact boolean DEFAULT true,
    referrer character varying,
    stripe_status character varying,
    variants text,
    chargeback_date timestamp without time zone,
    webhook_failed boolean DEFAULT false,
    failed boolean DEFAULT false,
    card_type character varying,
    card_visual character varying,
    purchase_state character varying,
    processor_fee_cents integer,
    succeeded_at timestamp without time zone,
    card_country character varying,
    stripe_error_code character varying,
    browser_guid character varying,
    error_code character varying,
    card_bin character varying,
    custom_fields text,
    ip_country character varying,
    ip_state character varying,
    purchase_success_balance_id bigint,
    purchase_chargeback_balance_id bigint,
    purchase_refund_balance_id bigint,
    flags bigint DEFAULT 0 NOT NULL,
    offer_code_id bigint,
    subscription_id bigint,
    preorder_id bigint,
    card_expiry_month integer,
    card_expiry_year integer,
    tax_cents integer DEFAULT 0,
    affiliate_credit_cents integer DEFAULT 0,
    credit_card_zipcode character varying,
    json_data character varying,
    card_data_handling_mode character varying,
    charge_processor_id character varying,
    total_transaction_cents integer,
    gumroad_tax_cents integer,
    zip_tax_rate_id bigint,
    quantity integer DEFAULT 1 NOT NULL,
    merchant_account_id bigint,
    shipping_cents integer DEFAULT 0,
    affiliate_id bigint,
    processor_fee_cents_currency character varying DEFAULT 'usd'::character varying,
    stripe_partially_refunded boolean DEFAULT false,
    paypal_order_id character varying(191),
    rental_expired boolean,
    processor_payment_intent_id character varying,
    processor_setup_intent_id character varying,
    price_id bigint,
    recommended_by character varying,
    deleted_at timestamp without time zone
);


--
-- Name: purchases_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.purchases_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: purchases_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.purchases_id_seq OWNED BY public.purchases.id;


--
-- Name: purchasing_power_parity_infos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.purchasing_power_parity_infos (
    id bigint NOT NULL,
    purchase_id bigint NOT NULL,
    factor integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: purchasing_power_parity_infos_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.purchasing_power_parity_infos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: purchasing_power_parity_infos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.purchasing_power_parity_infos_id_seq OWNED BY public.purchasing_power_parity_infos.id;


--
-- Name: recommended_purchase_infos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.recommended_purchase_infos (
    id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    purchase_id integer,
    recommended_link_id integer,
    recommended_by_link_id integer,
    recommendation_type character varying,
    flags integer DEFAULT 0 NOT NULL,
    discover_fee_per_thousand integer,
    recommender_model_name character varying
);


--
-- Name: recommended_purchase_infos_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.recommended_purchase_infos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: recommended_purchase_infos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.recommended_purchase_infos_id_seq OWNED BY public.recommended_purchase_infos.id;


--
-- Name: recurring_services; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.recurring_services (
    id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    user_id integer,
    type character varying(191),
    price_cents integer,
    recurrence integer,
    failed_at timestamp without time zone,
    cancelled_at timestamp without time zone,
    state character varying(191),
    json_data character varying(191)
);


--
-- Name: recurring_services_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.recurring_services_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: recurring_services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.recurring_services_id_seq OWNED BY public.recurring_services.id;


--
-- Name: refund_policies; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.refund_policies (
    id bigint NOT NULL,
    seller_id bigint NOT NULL,
    product_id bigint,
    title character varying,
    fine_print text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    max_refund_period_in_days integer
);


--
-- Name: refund_policies_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.refund_policies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: refund_policies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.refund_policies_id_seq OWNED BY public.refund_policies.id;


--
-- Name: refunds; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.refunds (
    id bigint NOT NULL,
    amount_cents integer DEFAULT 0,
    purchase_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    refunding_user_id bigint,
    creator_tax_cents integer,
    gumroad_tax_cents integer,
    total_transaction_cents integer,
    json_data text,
    link_id bigint,
    status character varying(191) DEFAULT 'succeeded'::character varying,
    processor_refund_id character varying(191),
    fee_cents integer,
    flags bigint DEFAULT 0 NOT NULL,
    seller_id bigint
);


--
-- Name: refunds_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.refunds_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: refunds_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.refunds_id_seq OWNED BY public.refunds.id;


--
-- Name: resource_subscriptions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.resource_subscriptions (
    id integer NOT NULL,
    oauth_application_id integer NOT NULL,
    user_id integer NOT NULL,
    resource_name character varying NOT NULL,
    post_url character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    deleted_at timestamp without time zone,
    content_type character varying DEFAULT 'application/x-www-form-urlencoded'::character varying
);


--
-- Name: resource_subscriptions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.resource_subscriptions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: resource_subscriptions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.resource_subscriptions_id_seq OWNED BY public.resource_subscriptions.id;


--
-- Name: rich_contents; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.rich_contents (
    id bigint NOT NULL,
    entity_id bigint NOT NULL,
    entity_type character varying NOT NULL,
    description json NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    deleted_at timestamp without time zone,
    title character varying,
    "position" integer DEFAULT 0 NOT NULL
);


--
-- Name: rich_contents_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.rich_contents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: rich_contents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.rich_contents_id_seq OWNED BY public.rich_contents.id;


--
-- Name: sales_export_chunks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sales_export_chunks (
    id bigint NOT NULL,
    export_id bigint NOT NULL,
    purchase_ids text,
    custom_fields text,
    purchases_data text,
    processed boolean DEFAULT false NOT NULL,
    revision character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: sales_export_chunks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sales_export_chunks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sales_export_chunks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sales_export_chunks_id_seq OWNED BY public.sales_export_chunks.id;


--
-- Name: sales_exports; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sales_exports (
    id bigint NOT NULL,
    recipient_id bigint NOT NULL,
    query text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: sales_exports_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sales_exports_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sales_exports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sales_exports_id_seq OWNED BY public.sales_exports.id;


--
-- Name: sales_related_products_infos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sales_related_products_infos (
    id bigint NOT NULL,
    smaller_product_id bigint NOT NULL,
    larger_product_id bigint NOT NULL,
    sales_count integer DEFAULT 0 NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: sales_related_products_infos_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sales_related_products_infos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sales_related_products_infos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sales_related_products_infos_id_seq OWNED BY public.sales_related_products_infos.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


--
-- Name: self_service_affiliate_products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.self_service_affiliate_products (
    id bigint NOT NULL,
    seller_id bigint NOT NULL,
    product_id bigint NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    affiliate_basis_points integer NOT NULL,
    destination_url character varying(2083),
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: self_service_affiliate_products_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.self_service_affiliate_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: self_service_affiliate_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.self_service_affiliate_products_id_seq OWNED BY public.self_service_affiliate_products.id;


--
-- Name: seller_profile_sections; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.seller_profile_sections (
    id bigint NOT NULL,
    seller_id bigint NOT NULL,
    header character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    flags bigint DEFAULT 0 NOT NULL,
    json_data json,
    type character varying DEFAULT 'SellerProfileProductsSection'::character varying NOT NULL,
    product_id bigint
);


--
-- Name: seller_profile_sections_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.seller_profile_sections_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: seller_profile_sections_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.seller_profile_sections_id_seq OWNED BY public.seller_profile_sections.id;


--
-- Name: seller_profiles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.seller_profiles (
    id bigint NOT NULL,
    seller_id bigint NOT NULL,
    highlight_color character varying,
    background_color character varying,
    font character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    json_data json
);


--
-- Name: seller_profiles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.seller_profiles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: seller_profiles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.seller_profiles_id_seq OWNED BY public.seller_profiles.id;


--
-- Name: sent_abandoned_cart_emails; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sent_abandoned_cart_emails (
    id bigint NOT NULL,
    cart_id bigint NOT NULL,
    installment_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: sent_abandoned_cart_emails_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sent_abandoned_cart_emails_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sent_abandoned_cart_emails_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sent_abandoned_cart_emails_id_seq OWNED BY public.sent_abandoned_cart_emails.id;


--
-- Name: sent_email_infos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sent_email_infos (
    id integer NOT NULL,
    key character varying(40) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: sent_email_infos_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sent_email_infos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sent_email_infos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sent_email_infos_id_seq OWNED BY public.sent_email_infos.id;


--
-- Name: sent_post_emails; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sent_post_emails (
    id bigint NOT NULL,
    post_id bigint NOT NULL,
    email character varying NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: sent_post_emails_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sent_post_emails_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sent_post_emails_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sent_post_emails_id_seq OWNED BY public.sent_post_emails.id;


--
-- Name: service_charges; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.service_charges (
    id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    user_id integer,
    recurring_service_id integer,
    charge_cents integer,
    charge_cents_currency character varying(191) DEFAULT 'usd'::character varying,
    state character varying(191),
    succeeded_at timestamp without time zone,
    credit_card_id integer,
    card_expiry_month integer,
    card_expiry_year integer,
    card_data_handling_mode character varying(191),
    card_bin character varying(191),
    card_type character varying(191),
    card_country character varying(191),
    card_zip_code character varying(191),
    card_visual character varying(191),
    charge_processor_id character varying(191),
    charge_processor_fee_cents integer,
    charge_processor_fee_cents_currency character varying(191) DEFAULT 'usd'::character varying,
    charge_processor_transaction_id character varying(191),
    charge_processor_fingerprint character varying(191),
    charge_processor_card_id character varying(191),
    charge_processor_status character varying(191),
    charge_processor_error_code character varying(191),
    charge_processor_refunded boolean DEFAULT false NOT NULL,
    chargeback_date timestamp without time zone,
    json_data character varying(191),
    error_code character varying(191),
    merchant_account_id integer,
    browser_guid character varying(191),
    ip_address character varying(191),
    ip_country character varying(191),
    ip_state character varying(191),
    session_id character varying(191),
    flags integer DEFAULT 0 NOT NULL,
    discount_code character varying(100),
    processor_payment_intent_id character varying
);


--
-- Name: service_charges_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.service_charges_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: service_charges_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.service_charges_id_seq OWNED BY public.service_charges.id;


--
-- Name: shipments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.shipments (
    id integer NOT NULL,
    purchase_id integer,
    ship_state character varying,
    shipped_at timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    tracking_number character varying,
    carrier character varying,
    tracking_url character varying(2083)
);


--
-- Name: shipments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.shipments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: shipments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.shipments_id_seq OWNED BY public.shipments.id;


--
-- Name: shipping_destinations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.shipping_destinations (
    id integer NOT NULL,
    link_id integer,
    user_id integer,
    country_code character varying NOT NULL,
    one_item_rate_cents integer NOT NULL,
    multiple_items_rate_cents integer NOT NULL,
    flags integer DEFAULT 0 NOT NULL,
    json_data text,
    deleted_at timestamp without time zone,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone
);


--
-- Name: shipping_destinations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.shipping_destinations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: shipping_destinations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.shipping_destinations_id_seq OWNED BY public.shipping_destinations.id;


--
-- Name: signup_events; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.signup_events (
    id bigint NOT NULL,
    visit_id integer,
    ip_address character varying,
    user_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    referrer character varying,
    parent_referrer character varying,
    language character varying,
    browser character varying,
    is_mobile boolean DEFAULT false,
    email character varying,
    view_url character varying,
    fingerprint character varying,
    ip_country character varying,
    ip_longitude double precision,
    ip_latitude double precision,
    is_modal boolean,
    browser_fingerprint character varying,
    browser_plugins character varying,
    browser_guid character varying,
    referrer_domain character varying,
    ip_state character varying,
    active_test_path_assignments character varying,
    event_name character varying,
    link_id integer,
    purchase_id integer,
    price_cents integer,
    credit_card_id integer,
    card_type character varying,
    card_visual character varying,
    purchase_state boolean DEFAULT false,
    billing_zip character varying,
    chargeback boolean DEFAULT false,
    refunded boolean
);


--
-- Name: signup_events_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.signup_events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: signup_events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.signup_events_id_seq OWNED BY public.signup_events.id;


--
-- Name: skus_variants; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.skus_variants (
    id integer NOT NULL,
    variant_id integer,
    sku_id integer
);


--
-- Name: skus_variants_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.skus_variants_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: skus_variants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.skus_variants_id_seq OWNED BY public.skus_variants.id;


--
-- Name: staff_picked_products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.staff_picked_products (
    id bigint NOT NULL,
    product_id bigint NOT NULL,
    deleted_at timestamp(6) without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: staff_picked_products_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.staff_picked_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: staff_picked_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.staff_picked_products_id_seq OWNED BY public.staff_picked_products.id;


--
-- Name: stamped_pdfs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.stamped_pdfs (
    id bigint NOT NULL,
    url_redirect_id bigint,
    product_file_id bigint,
    url character varying(1024),
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    deleted_at timestamp(6) without time zone,
    deleted_from_cdn_at timestamp(6) without time zone
);


--
-- Name: stamped_pdfs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.stamped_pdfs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: stamped_pdfs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.stamped_pdfs_id_seq OWNED BY public.stamped_pdfs.id;


--
-- Name: stripe_apple_pay_domains; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.stripe_apple_pay_domains (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    domain character varying NOT NULL,
    stripe_id character varying NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: stripe_apple_pay_domains_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.stripe_apple_pay_domains_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: stripe_apple_pay_domains_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.stripe_apple_pay_domains_id_seq OWNED BY public.stripe_apple_pay_domains.id;


--
-- Name: subscription_events; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.subscription_events (
    id bigint NOT NULL,
    subscription_id bigint NOT NULL,
    event_type integer NOT NULL,
    occurred_at timestamp(6) without time zone NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    seller_id bigint
);


--
-- Name: subscription_events_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.subscription_events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: subscription_events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.subscription_events_id_seq OWNED BY public.subscription_events.id;


--
-- Name: subscription_plan_changes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.subscription_plan_changes (
    id bigint NOT NULL,
    subscription_id bigint NOT NULL,
    base_variant_id bigint,
    recurrence character varying(191) NOT NULL,
    perceived_price_cents integer NOT NULL,
    deleted_at timestamp(6) without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    quantity integer DEFAULT 1 NOT NULL,
    flags bigint DEFAULT 0 NOT NULL,
    effective_on date,
    notified_subscriber_at timestamp(6) without time zone
);


--
-- Name: subscription_plan_changes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.subscription_plan_changes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: subscription_plan_changes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.subscription_plan_changes_id_seq OWNED BY public.subscription_plan_changes.id;


--
-- Name: subscriptions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.subscriptions (
    id bigint NOT NULL,
    link_id bigint,
    user_id bigint,
    cancelled_at timestamp(6) without time zone,
    failed_at timestamp(6) without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    flags bigint DEFAULT 0 NOT NULL,
    user_requested_cancellation_at timestamp(6) without time zone,
    charge_occurrence_count integer,
    ended_at timestamp(6) without time zone,
    last_payment_option_id bigint,
    credit_card_id bigint,
    deactivated_at timestamp(6) without time zone,
    free_trial_ends_at timestamp(6) without time zone,
    seller_id bigint,
    token character varying,
    token_expires_at timestamp(6) without time zone
);


--
-- Name: subscriptions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.subscriptions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: subscriptions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.subscriptions_id_seq OWNED BY public.subscriptions.id;


--
-- Name: subtitle_files; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.subtitle_files (
    id bigint NOT NULL,
    url character varying(1024),
    language character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    product_file_id bigint,
    deleted_at timestamp(6) without time zone,
    size integer,
    deleted_from_cdn_at timestamp(6) without time zone
);


--
-- Name: subtitle_files_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.subtitle_files_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: subtitle_files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.subtitle_files_id_seq OWNED BY public.subtitle_files.id;


--
-- Name: tags; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tags (
    id integer NOT NULL,
    name character varying(100),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    humanized_name character varying(191),
    flagged_at timestamp(6) without time zone
);


--
-- Name: tags_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tags_id_seq OWNED BY public.tags.id;


--
-- Name: taxonomies; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.taxonomies (
    id bigint NOT NULL,
    parent_id bigint,
    slug character varying NOT NULL
);


--
-- Name: taxonomies_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.taxonomies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: taxonomies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.taxonomies_id_seq OWNED BY public.taxonomies.id;


--
-- Name: taxonomy_hierarchies; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.taxonomy_hierarchies (
    ancestor_id bigint NOT NULL,
    descendant_id bigint NOT NULL,
    generations integer NOT NULL
);


--
-- Name: taxonomy_stats; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.taxonomy_stats (
    id bigint NOT NULL,
    taxonomy_id bigint NOT NULL,
    creators_count integer DEFAULT 0 NOT NULL,
    products_count integer DEFAULT 0 NOT NULL,
    sales_count integer DEFAULT 0 NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    recent_sales_count integer DEFAULT 0
);


--
-- Name: taxonomy_stats_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.taxonomy_stats_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: taxonomy_stats_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.taxonomy_stats_id_seq OWNED BY public.taxonomy_stats.id;


--
-- Name: team_invitations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.team_invitations (
    id bigint NOT NULL,
    seller_id bigint NOT NULL,
    email character varying NOT NULL,
    role character varying NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    expires_at timestamp(6) without time zone NOT NULL,
    accepted_at timestamp(6) without time zone,
    deleted_at timestamp(6) without time zone
);


--
-- Name: team_invitations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.team_invitations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: team_invitations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.team_invitations_id_seq OWNED BY public.team_invitations.id;


--
-- Name: team_memberships; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.team_memberships (
    id bigint NOT NULL,
    seller_id bigint NOT NULL,
    user_id bigint NOT NULL,
    role character varying NOT NULL,
    last_accessed_at timestamp without time zone,
    deleted_at timestamp without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: team_memberships_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.team_memberships_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: team_memberships_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.team_memberships_id_seq OWNED BY public.team_memberships.id;


--
-- Name: third_party_analytics; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.third_party_analytics (
    id integer NOT NULL,
    user_id integer,
    link_id integer,
    analytics_code text,
    deleted_at timestamp(6) without time zone,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    name character varying,
    location character varying DEFAULT 'receipt'::character varying
);


--
-- Name: third_party_analytics_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.third_party_analytics_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: third_party_analytics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.third_party_analytics_id_seq OWNED BY public.third_party_analytics.id;


--
-- Name: thumbnails; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.thumbnails (
    id bigint NOT NULL,
    product_id integer,
    deleted_at timestamp(6) without time zone,
    guid character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    unsplash_url character varying
);


--
-- Name: thumbnails_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.thumbnails_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: thumbnails_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.thumbnails_id_seq OWNED BY public.thumbnails.id;


--
-- Name: tips; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tips (
    id bigint NOT NULL,
    purchase_id bigint NOT NULL,
    value_cents integer NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    value_usd_cents integer DEFAULT 0 NOT NULL
);


--
-- Name: tips_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tips_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tips_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tips_id_seq OWNED BY public.tips.id;


--
-- Name: top_sellers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.top_sellers (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    sales_usd bigint DEFAULT 0 NOT NULL,
    sales_count bigint DEFAULT 0 NOT NULL,
    rank integer NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: top_sellers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.top_sellers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: top_sellers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.top_sellers_id_seq OWNED BY public.top_sellers.id;


--
-- Name: tos_agreements; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tos_agreements (
    id integer NOT NULL,
    user_id integer,
    ip character varying,
    created_at timestamp(6) without time zone
);


--
-- Name: tos_agreements_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tos_agreements_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tos_agreements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tos_agreements_id_seq OWNED BY public.tos_agreements.id;


--
-- Name: transcoded_videos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.transcoded_videos (
    id bigint NOT NULL,
    link_id bigint,
    original_video_key character varying(1024),
    transcoded_video_key character varying(2048),
    job_id character varying,
    state character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    product_file_id bigint,
    flags integer DEFAULT 0 NOT NULL,
    deleted_from_cdn_at timestamp(6) without time zone,
    deleted_at timestamp(6) without time zone,
    last_accessed_at timestamp(6) without time zone,
    streamable_type character varying,
    streamable_id bigint
);


--
-- Name: transcoded_videos_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.transcoded_videos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: transcoded_videos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.transcoded_videos_id_seq OWNED BY public.transcoded_videos.id;


--
-- Name: upsell_purchases; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.upsell_purchases (
    id bigint NOT NULL,
    upsell_id bigint NOT NULL,
    purchase_id bigint NOT NULL,
    selected_product_id bigint,
    upsell_variant_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: upsell_purchases_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.upsell_purchases_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: upsell_purchases_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.upsell_purchases_id_seq OWNED BY public.upsell_purchases.id;


--
-- Name: upsell_variants; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.upsell_variants (
    id bigint NOT NULL,
    upsell_id bigint NOT NULL,
    selected_variant_id bigint NOT NULL,
    offered_variant_id bigint NOT NULL,
    deleted_at timestamp(6) without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: upsell_variants_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.upsell_variants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: upsell_variants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.upsell_variants_id_seq OWNED BY public.upsell_variants.id;


--
-- Name: upsells; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.upsells (
    id bigint NOT NULL,
    seller_id bigint NOT NULL,
    product_id bigint NOT NULL,
    variant_id bigint,
    offer_code_id bigint,
    name character varying,
    cross_sell boolean NOT NULL,
    text character varying,
    description text,
    deleted_at timestamp(6) without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    universal boolean DEFAULT false NOT NULL,
    flags integer DEFAULT 0 NOT NULL
);


--
-- Name: upsells_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.upsells_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: upsells_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.upsells_id_seq OWNED BY public.upsells.id;


--
-- Name: upsells_selected_products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.upsells_selected_products (
    id bigint NOT NULL,
    upsell_id bigint NOT NULL,
    selected_product_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: upsells_selected_products_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.upsells_selected_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: upsells_selected_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.upsells_selected_products_id_seq OWNED BY public.upsells_selected_products.id;


--
-- Name: url_redirects; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.url_redirects (
    id bigint NOT NULL,
    uses integer DEFAULT 0,
    expires_at timestamp(6) without time zone,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    purchase_id bigint,
    token character varying NOT NULL,
    link_id bigint,
    flags integer DEFAULT 0 NOT NULL,
    installment_id bigint,
    subscription_id bigint,
    preorder_id bigint,
    imported_customer_id bigint,
    rental_first_viewed_at timestamp(6) without time zone
);


--
-- Name: url_redirects_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.url_redirects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: url_redirects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.url_redirects_id_seq OWNED BY public.url_redirects.id;


--
-- Name: user_compliance_info; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_compliance_info (
    id bigint NOT NULL,
    user_id integer,
    full_name character varying,
    street_address character varying,
    city character varying,
    state character varying,
    zip_code character varying,
    country character varying,
    telephone_number character varying,
    vertical character varying,
    is_business boolean,
    has_sold_before boolean,
    individual_tax_id bytea,
    json_data text,
    flags integer DEFAULT 0 NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    business_name character varying,
    business_street_address character varying,
    business_city character varying,
    business_state character varying,
    business_zip_code character varying,
    business_country character varying,
    business_type character varying,
    business_tax_id bytea,
    birthday date,
    deleted_at timestamp(6) without time zone,
    dba character varying,
    verticals text,
    first_name character varying,
    last_name character varying,
    stripe_identity_document_id character varying
);


--
-- Name: user_compliance_info_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.user_compliance_info_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_compliance_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.user_compliance_info_id_seq OWNED BY public.user_compliance_info.id;


--
-- Name: user_compliance_info_requests; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_compliance_info_requests (
    id integer NOT NULL,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    user_id integer,
    field_needed character varying,
    due_at timestamp(6) without time zone,
    state character varying,
    provided_at timestamp(6) without time zone,
    json_data text,
    flags integer DEFAULT 0 NOT NULL
);


--
-- Name: user_compliance_info_requests_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.user_compliance_info_requests_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_compliance_info_requests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.user_compliance_info_requests_id_seq OWNED BY public.user_compliance_info_requests.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    email character varying DEFAULT ''::character varying,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying,
    last_sign_in_ip character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    google_uid character varying,
    username character varying,
    user_risk_state character varying,
    external_id character varying,
    name character varying,
    provider character varying,
    confirmed_at timestamp(6) without time zone,
    confirmation_token character varying,
    confirmation_sent_at timestamp(6) without time zone,
    unconfirmed_email character varying,
    tier_state integer DEFAULT 0,
    flags bigint DEFAULT 1 NOT NULL,
    locale character varying DEFAULT 'en'::character varying,
    timezone character varying DEFAULT 'Pacific Time (US & Canada)'::character varying NOT NULL,
    currency_type character varying DEFAULT 'usd'::character varying,
    recommendation_type character varying DEFAULT 'trending'::character varying NOT NULL,
    facebook_meta_tag character varying,
    google_analytics_id character varying,
    support_email character varying,
    bio text,
    profile_picture_url character varying,
    country character varying,
    verified boolean,
    payment_notification boolean DEFAULT true,
    facebook_uid character varying,
    twitter_user_id character varying,
    twitter_handle character varying,
    twitter_oauth_token character varying,
    twitter_oauth_secret character varying,
    facebook_id character varying,
    purchasing_power_parity_limit integer,
    kindle_email character varying,
    payment_address character varying,
    deleted_at timestamp(6) without time zone,
    account_created_ip character varying,
    notification_endpoint text,
    json_data text,
    tos_violation_reason character varying,
    google_analytics_domains character varying,
    facebook_pixel_id character varying,
    split_payment_by_cents integer,
    last_active_sessions_invalidated_at timestamp(6) without time zone,
    otp_secret_key character varying,
    orientation_priority_tag character varying,
    facebook_access_token character varying,
    manage_pages boolean,
    banned_at timestamp(6) without time zone,
    weekly_notification boolean,
    state character varying,
    city character varying,
    zip_code character varying,
    street_address character varying
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: utm_link_driven_sales; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.utm_link_driven_sales (
    id bigint NOT NULL,
    utm_link_id bigint NOT NULL,
    utm_link_visit_id bigint NOT NULL,
    purchase_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: utm_link_driven_sales_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.utm_link_driven_sales_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: utm_link_driven_sales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.utm_link_driven_sales_id_seq OWNED BY public.utm_link_driven_sales.id;


--
-- Name: utm_link_visits; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.utm_link_visits (
    id bigint NOT NULL,
    utm_link_id bigint NOT NULL,
    user_id bigint,
    referrer character varying,
    ip_address character varying NOT NULL,
    user_agent character varying,
    browser_guid character varying NOT NULL,
    country_code character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: utm_link_visits_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.utm_link_visits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: utm_link_visits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.utm_link_visits_id_seq OWNED BY public.utm_link_visits.id;


--
-- Name: utm_links; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.utm_links (
    id bigint NOT NULL,
    seller_id bigint NOT NULL,
    title character varying NOT NULL,
    target_resource_type character varying NOT NULL,
    target_resource_id bigint,
    permalink character varying NOT NULL,
    utm_campaign character varying(200) NOT NULL,
    utm_medium character varying(200) NOT NULL,
    utm_source character varying(200) NOT NULL,
    utm_term character varying(200),
    utm_content character varying(200),
    first_click_at timestamp(6) without time zone,
    last_click_at timestamp(6) without time zone,
    total_clicks integer DEFAULT 0 NOT NULL,
    unique_clicks integer DEFAULT 0 NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    deleted_at timestamp(6) without time zone,
    disabled_at timestamp(6) without time zone,
    ip_address character varying,
    browser_guid character varying
);


--
-- Name: utm_links_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.utm_links_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: utm_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.utm_links_id_seq OWNED BY public.utm_links.id;


--
-- Name: variant_categories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.variant_categories (
    id integer NOT NULL,
    link_id integer,
    deleted_at timestamp(6) without time zone,
    title character varying,
    flags integer DEFAULT 0 NOT NULL
);


--
-- Name: variant_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.variant_categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: variant_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.variant_categories_id_seq OWNED BY public.variant_categories.id;


--
-- Name: versions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.versions (
    id bigint NOT NULL,
    item_type character varying(191) NOT NULL,
    item_id bigint NOT NULL,
    event character varying(191) NOT NULL,
    whodunnit character varying(191),
    object text,
    created_at timestamp(6) without time zone,
    remote_ip character varying(191),
    request_path text,
    request_uuid character varying(191),
    object_changes text
);


--
-- Name: versions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.versions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: versions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.versions_id_seq OWNED BY public.versions.id;


--
-- Name: video_files; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.video_files (
    id bigint NOT NULL,
    record_type character varying NOT NULL,
    record_id bigint NOT NULL,
    url character varying,
    filetype character varying,
    width integer,
    height integer,
    duration integer,
    bitrate integer,
    framerate integer,
    size integer,
    flags integer DEFAULT 0,
    deleted_at timestamp(6) without time zone,
    deleted_from_cdn_at timestamp(6) without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    user_id bigint NOT NULL
);


--
-- Name: video_files_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.video_files_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: video_files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.video_files_id_seq OWNED BY public.video_files.id;


--
-- Name: wishlist_followers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.wishlist_followers (
    id bigint NOT NULL,
    wishlist_id bigint NOT NULL,
    follower_user_id bigint NOT NULL,
    deleted_at timestamp(6) without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: wishlist_followers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.wishlist_followers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wishlist_followers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.wishlist_followers_id_seq OWNED BY public.wishlist_followers.id;


--
-- Name: wishlist_products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.wishlist_products (
    id bigint NOT NULL,
    wishlist_id bigint NOT NULL,
    product_id bigint NOT NULL,
    variant_id bigint,
    recurrence character varying,
    quantity integer NOT NULL,
    rent boolean NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    deleted_at timestamp(6) without time zone
);


--
-- Name: wishlist_products_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.wishlist_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wishlist_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.wishlist_products_id_seq OWNED BY public.wishlist_products.id;


--
-- Name: wishlists; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.wishlists (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    name character varying NOT NULL,
    deleted_at timestamp(6) without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    followers_last_contacted_at timestamp(6) without time zone,
    description text,
    flags integer DEFAULT 0 NOT NULL,
    recommendable boolean DEFAULT false NOT NULL,
    follower_count integer DEFAULT 0 NOT NULL,
    recent_follower_count integer DEFAULT 0 NOT NULL
);


--
-- Name: wishlists_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.wishlists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wishlists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.wishlists_id_seq OWNED BY public.wishlists.id;


--
-- Name: workflows; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.workflows (
    id integer NOT NULL,
    name character varying(1024),
    seller_id integer,
    link_id integer,
    workflow_type character varying,
    published_at timestamp(6) without time zone,
    deleted_at timestamp(6) without time zone,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    base_variant_id integer,
    json_data text,
    first_published_at timestamp(6) without time zone,
    flags bigint DEFAULT 0 NOT NULL
);


--
-- Name: workflows_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.workflows_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: workflows_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.workflows_id_seq OWNED BY public.workflows.id;


--
-- Name: yearly_stats; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.yearly_stats (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    analytics_data json NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: yearly_stats_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.yearly_stats_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: yearly_stats_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.yearly_stats_id_seq OWNED BY public.yearly_stats.id;


--
-- Name: zip_tax_rates; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.zip_tax_rates (
    id integer NOT NULL,
    combined_rate numeric(8,7),
    county_rate numeric(8,7),
    city_rate numeric(8,7),
    state character varying,
    state_rate numeric(8,7),
    tax_region_code character varying,
    tax_region_name character varying,
    zip_code character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    special_rate numeric(8,7),
    flags integer DEFAULT 0 NOT NULL,
    country character varying NOT NULL,
    user_id integer,
    deleted_at timestamp(6) without time zone,
    json_data text
);


--
-- Name: zip_tax_rates_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.zip_tax_rates_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zip_tax_rates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.zip_tax_rates_id_seq OWNED BY public.zip_tax_rates.id;


--
-- Name: active_storage_attachments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_attachments ALTER COLUMN id SET DEFAULT nextval('public.active_storage_attachments_id_seq'::regclass);


--
-- Name: active_storage_blobs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_blobs ALTER COLUMN id SET DEFAULT nextval('public.active_storage_blobs_id_seq'::regclass);


--
-- Name: active_storage_variant_records id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_variant_records ALTER COLUMN id SET DEFAULT nextval('public.active_storage_variant_records_id_seq'::regclass);


--
-- Name: admin_action_call_infos id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin_action_call_infos ALTER COLUMN id SET DEFAULT nextval('public.admin_action_call_infos_id_seq'::regclass);


--
-- Name: affiliate_credits id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.affiliate_credits ALTER COLUMN id SET DEFAULT nextval('public.affiliate_credits_id_seq'::regclass);


--
-- Name: affiliate_partial_refunds id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.affiliate_partial_refunds ALTER COLUMN id SET DEFAULT nextval('public.affiliate_partial_refunds_id_seq'::regclass);


--
-- Name: affiliate_requests id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.affiliate_requests ALTER COLUMN id SET DEFAULT nextval('public.affiliate_requests_id_seq'::regclass);


--
-- Name: affiliates id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.affiliates ALTER COLUMN id SET DEFAULT nextval('public.affiliates_id_seq'::regclass);


--
-- Name: affiliates_links id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.affiliates_links ALTER COLUMN id SET DEFAULT nextval('public.affiliates_links_id_seq'::regclass);


--
-- Name: asset_previews id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.asset_previews ALTER COLUMN id SET DEFAULT nextval('public.asset_previews_id_seq'::regclass);


--
-- Name: audience_members id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.audience_members ALTER COLUMN id SET DEFAULT nextval('public.audience_members_id_seq'::regclass);


--
-- Name: australia_backtax_email_infos id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.australia_backtax_email_infos ALTER COLUMN id SET DEFAULT nextval('public.australia_backtax_email_infos_id_seq'::regclass);


--
-- Name: backtax_agreements id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.backtax_agreements ALTER COLUMN id SET DEFAULT nextval('public.backtax_agreements_id_seq'::regclass);


--
-- Name: backtax_collections id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.backtax_collections ALTER COLUMN id SET DEFAULT nextval('public.backtax_collections_id_seq'::regclass);


--
-- Name: balance_transactions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.balance_transactions ALTER COLUMN id SET DEFAULT nextval('public.balance_transactions_id_seq'::regclass);


--
-- Name: balances id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.balances ALTER COLUMN id SET DEFAULT nextval('public.balances_id_seq'::regclass);


--
-- Name: bank_accounts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bank_accounts ALTER COLUMN id SET DEFAULT nextval('public.bank_accounts_id_seq'::regclass);


--
-- Name: banks id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.banks ALTER COLUMN id SET DEFAULT nextval('public.banks_id_seq'::regclass);


--
-- Name: base_variant_integrations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.base_variant_integrations ALTER COLUMN id SET DEFAULT nextval('public.base_variant_integrations_id_seq'::regclass);


--
-- Name: base_variants id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.base_variants ALTER COLUMN id SET DEFAULT nextval('public.base_variants_id_seq'::regclass);


--
-- Name: base_variants_product_files id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.base_variants_product_files ALTER COLUMN id SET DEFAULT nextval('public.base_variants_product_files_id_seq'::regclass);


--
-- Name: base_variants_purchases id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.base_variants_purchases ALTER COLUMN id SET DEFAULT nextval('public.base_variants_purchases_id_seq'::regclass);


--
-- Name: blocked_customer_objects id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.blocked_customer_objects ALTER COLUMN id SET DEFAULT nextval('public.blocked_customer_objects_id_seq'::regclass);


--
-- Name: bundle_product_purchases id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bundle_product_purchases ALTER COLUMN id SET DEFAULT nextval('public.bundle_product_purchases_id_seq'::regclass);


--
-- Name: bundle_products id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bundle_products ALTER COLUMN id SET DEFAULT nextval('public.bundle_products_id_seq'::regclass);


--
-- Name: cached_sales_related_products_infos id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cached_sales_related_products_infos ALTER COLUMN id SET DEFAULT nextval('public.cached_sales_related_products_infos_id_seq'::regclass);


--
-- Name: call_availabilities id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.call_availabilities ALTER COLUMN id SET DEFAULT nextval('public.call_availabilities_id_seq'::regclass);


--
-- Name: call_limitation_infos id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.call_limitation_infos ALTER COLUMN id SET DEFAULT nextval('public.call_limitation_infos_id_seq'::regclass);


--
-- Name: calls id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.calls ALTER COLUMN id SET DEFAULT nextval('public.calls_id_seq'::regclass);


--
-- Name: cart_products id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cart_products ALTER COLUMN id SET DEFAULT nextval('public.cart_products_id_seq'::regclass);


--
-- Name: carts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.carts ALTER COLUMN id SET DEFAULT nextval('public.carts_id_seq'::regclass);


--
-- Name: charge_purchases id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.charge_purchases ALTER COLUMN id SET DEFAULT nextval('public.charge_purchases_id_seq'::regclass);


--
-- Name: charges id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.charges ALTER COLUMN id SET DEFAULT nextval('public.charges_id_seq'::regclass);


--
-- Name: collaborator_invitations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.collaborator_invitations ALTER COLUMN id SET DEFAULT nextval('public.collaborator_invitations_id_seq'::regclass);


--
-- Name: comments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments ALTER COLUMN id SET DEFAULT nextval('public.comments_id_seq'::regclass);


--
-- Name: commission_files id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.commission_files ALTER COLUMN id SET DEFAULT nextval('public.commission_files_id_seq'::regclass);


--
-- Name: commissions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.commissions ALTER COLUMN id SET DEFAULT nextval('public.commissions_id_seq'::regclass);


--
-- Name: communities id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.communities ALTER COLUMN id SET DEFAULT nextval('public.communities_id_seq'::regclass);


--
-- Name: community_chat_messages id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.community_chat_messages ALTER COLUMN id SET DEFAULT nextval('public.community_chat_messages_id_seq'::regclass);


--
-- Name: community_chat_recap_runs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.community_chat_recap_runs ALTER COLUMN id SET DEFAULT nextval('public.community_chat_recap_runs_id_seq'::regclass);


--
-- Name: community_chat_recaps id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.community_chat_recaps ALTER COLUMN id SET DEFAULT nextval('public.community_chat_recaps_id_seq'::regclass);


--
-- Name: community_notification_settings id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.community_notification_settings ALTER COLUMN id SET DEFAULT nextval('public.community_notification_settings_id_seq'::regclass);


--
-- Name: computed_sales_analytics_days id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.computed_sales_analytics_days ALTER COLUMN id SET DEFAULT nextval('public.computed_sales_analytics_days_id_seq'::regclass);


--
-- Name: consumption_events id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.consumption_events ALTER COLUMN id SET DEFAULT nextval('public.consumption_events_id_seq'::regclass);


--
-- Name: credit_cards id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.credit_cards ALTER COLUMN id SET DEFAULT nextval('public.credit_cards_id_seq'::regclass);


--
-- Name: credits id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.credits ALTER COLUMN id SET DEFAULT nextval('public.credits_id_seq'::regclass);


--
-- Name: custom_domains id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.custom_domains ALTER COLUMN id SET DEFAULT nextval('public.custom_domains_id_seq'::regclass);


--
-- Name: custom_fields id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.custom_fields ALTER COLUMN id SET DEFAULT nextval('public.custom_fields_id_seq'::regclass);


--
-- Name: custom_fields_products id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.custom_fields_products ALTER COLUMN id SET DEFAULT nextval('public.custom_fields_products_id_seq'::regclass);


--
-- Name: devices id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.devices ALTER COLUMN id SET DEFAULT nextval('public.devices_id_seq'::regclass);


--
-- Name: discover_search_suggestions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.discover_search_suggestions ALTER COLUMN id SET DEFAULT nextval('public.discover_search_suggestions_id_seq'::regclass);


--
-- Name: discover_searches id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.discover_searches ALTER COLUMN id SET DEFAULT nextval('public.discover_searches_id_seq'::regclass);


--
-- Name: dispute_evidences id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dispute_evidences ALTER COLUMN id SET DEFAULT nextval('public.dispute_evidences_id_seq'::regclass);


--
-- Name: disputes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.disputes ALTER COLUMN id SET DEFAULT nextval('public.disputes_id_seq'::regclass);


--
-- Name: dropbox_files id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dropbox_files ALTER COLUMN id SET DEFAULT nextval('public.dropbox_files_id_seq'::regclass);


--
-- Name: email_info_charges id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.email_info_charges ALTER COLUMN id SET DEFAULT nextval('public.email_info_charges_id_seq'::regclass);


--
-- Name: email_infos id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.email_infos ALTER COLUMN id SET DEFAULT nextval('public.email_infos_id_seq'::regclass);


--
-- Name: events id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.events ALTER COLUMN id SET DEFAULT nextval('public.events_id_seq'::regclass);


--
-- Name: followers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.followers ALTER COLUMN id SET DEFAULT nextval('public.followers_id_seq'::regclass);


--
-- Name: friendly_id_slugs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.friendly_id_slugs ALTER COLUMN id SET DEFAULT nextval('public.friendly_id_slugs_id_seq'::regclass);


--
-- Name: gifts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.gifts ALTER COLUMN id SET DEFAULT nextval('public.gifts_id_seq'::regclass);


--
-- Name: gumroad_daily_analytics id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.gumroad_daily_analytics ALTER COLUMN id SET DEFAULT nextval('public.gumroad_daily_analytics_id_seq'::regclass);


--
-- Name: imported_customers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.imported_customers ALTER COLUMN id SET DEFAULT nextval('public.imported_customers_id_seq'::regclass);


--
-- Name: installment_events id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.installment_events ALTER COLUMN id SET DEFAULT nextval('public.installment_events_id_seq'::regclass);


--
-- Name: installment_rules id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.installment_rules ALTER COLUMN id SET DEFAULT nextval('public.installment_rules_id_seq'::regclass);


--
-- Name: installments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.installments ALTER COLUMN id SET DEFAULT nextval('public.installments_id_seq'::regclass);


--
-- Name: integrations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.integrations ALTER COLUMN id SET DEFAULT nextval('public.integrations_id_seq'::regclass);


--
-- Name: invites id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.invites ALTER COLUMN id SET DEFAULT nextval('public.invites_id_seq'::regclass);


--
-- Name: large_sellers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.large_sellers ALTER COLUMN id SET DEFAULT nextval('public.large_sellers_id_seq'::regclass);


--
-- Name: last_read_community_chat_messages id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.last_read_community_chat_messages ALTER COLUMN id SET DEFAULT nextval('public.last_read_community_chat_messages_id_seq'::regclass);


--
-- Name: legacy_permalinks id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.legacy_permalinks ALTER COLUMN id SET DEFAULT nextval('public.legacy_permalinks_id_seq'::regclass);


--
-- Name: licenses id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.licenses ALTER COLUMN id SET DEFAULT nextval('public.licenses_id_seq'::regclass);


--
-- Name: links id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.links ALTER COLUMN id SET DEFAULT nextval('public.links_id_seq'::regclass);


--
-- Name: media_locations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.media_locations ALTER COLUMN id SET DEFAULT nextval('public.media_locations_id_seq'::regclass);


--
-- Name: merchant_accounts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.merchant_accounts ALTER COLUMN id SET DEFAULT nextval('public.merchant_accounts_id_seq'::regclass);


--
-- Name: oauth_access_grants id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.oauth_access_grants ALTER COLUMN id SET DEFAULT nextval('public.oauth_access_grants_id_seq'::regclass);


--
-- Name: oauth_access_tokens id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.oauth_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.oauth_access_tokens_id_seq'::regclass);


--
-- Name: oauth_applications id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.oauth_applications ALTER COLUMN id SET DEFAULT nextval('public.oauth_applications_id_seq'::regclass);


--
-- Name: offer_codes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.offer_codes ALTER COLUMN id SET DEFAULT nextval('public.offer_codes_id_seq'::regclass);


--
-- Name: offer_codes_products id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.offer_codes_products ALTER COLUMN id SET DEFAULT nextval('public.offer_codes_products_id_seq'::regclass);


--
-- Name: order_purchases id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_purchases ALTER COLUMN id SET DEFAULT nextval('public.order_purchases_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Name: payment_options id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payment_options ALTER COLUMN id SET DEFAULT nextval('public.payment_options_id_seq'::regclass);


--
-- Name: payments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payments ALTER COLUMN id SET DEFAULT nextval('public.payments_id_seq'::regclass);


--
-- Name: payments_balances id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payments_balances ALTER COLUMN id SET DEFAULT nextval('public.payments_balances_id_seq'::regclass);


--
-- Name: post_email_blasts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.post_email_blasts ALTER COLUMN id SET DEFAULT nextval('public.post_email_blasts_id_seq'::regclass);


--
-- Name: preorder_links id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.preorder_links ALTER COLUMN id SET DEFAULT nextval('public.preorder_links_id_seq'::regclass);


--
-- Name: preorders id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.preorders ALTER COLUMN id SET DEFAULT nextval('public.preorders_id_seq'::regclass);


--
-- Name: prices id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.prices ALTER COLUMN id SET DEFAULT nextval('public.prices_id_seq'::regclass);


--
-- Name: processor_payment_intents id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.processor_payment_intents ALTER COLUMN id SET DEFAULT nextval('public.processor_payment_intents_id_seq'::regclass);


--
-- Name: product_cached_values id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_cached_values ALTER COLUMN id SET DEFAULT nextval('public.product_cached_values_id_seq'::regclass);


--
-- Name: product_files id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_files ALTER COLUMN id SET DEFAULT nextval('public.product_files_id_seq'::regclass);


--
-- Name: product_files_archives id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_files_archives ALTER COLUMN id SET DEFAULT nextval('public.product_files_archives_id_seq'::regclass);


--
-- Name: product_files_files_archives id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_files_files_archives ALTER COLUMN id SET DEFAULT nextval('public.product_files_files_archives_id_seq'::regclass);


--
-- Name: product_folders id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_folders ALTER COLUMN id SET DEFAULT nextval('public.product_folders_id_seq'::regclass);


--
-- Name: product_installment_plans id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_installment_plans ALTER COLUMN id SET DEFAULT nextval('public.product_installment_plans_id_seq'::regclass);


--
-- Name: product_integrations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_integrations ALTER COLUMN id SET DEFAULT nextval('public.product_integrations_id_seq'::regclass);


--
-- Name: product_review_responses id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_review_responses ALTER COLUMN id SET DEFAULT nextval('public.product_review_responses_id_seq'::regclass);


--
-- Name: product_review_stats id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_review_stats ALTER COLUMN id SET DEFAULT nextval('public.product_review_stats_id_seq'::regclass);


--
-- Name: product_review_videos id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_review_videos ALTER COLUMN id SET DEFAULT nextval('public.product_review_videos_id_seq'::regclass);


--
-- Name: product_reviews id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_reviews ALTER COLUMN id SET DEFAULT nextval('public.product_reviews_id_seq'::regclass);


--
-- Name: product_taggings id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_taggings ALTER COLUMN id SET DEFAULT nextval('public.product_taggings_id_seq'::regclass);


--
-- Name: public_files id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.public_files ALTER COLUMN id SET DEFAULT nextval('public.public_files_id_seq'::regclass);


--
-- Name: purchase_custom_field_files id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.purchase_custom_field_files ALTER COLUMN id SET DEFAULT nextval('public.purchase_custom_field_files_id_seq'::regclass);


--
-- Name: purchase_custom_fields id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.purchase_custom_fields ALTER COLUMN id SET DEFAULT nextval('public.purchase_custom_fields_id_seq'::regclass);


--
-- Name: purchase_early_fraud_warnings id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.purchase_early_fraud_warnings ALTER COLUMN id SET DEFAULT nextval('public.purchase_early_fraud_warnings_id_seq'::regclass);


--
-- Name: purchase_integrations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.purchase_integrations ALTER COLUMN id SET DEFAULT nextval('public.purchase_integrations_id_seq'::regclass);


--
-- Name: purchase_offer_code_discounts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.purchase_offer_code_discounts ALTER COLUMN id SET DEFAULT nextval('public.purchase_offer_code_discounts_id_seq'::regclass);


--
-- Name: purchase_refund_policies id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.purchase_refund_policies ALTER COLUMN id SET DEFAULT nextval('public.purchase_refund_policies_id_seq'::regclass);


--
-- Name: purchase_sales_tax_infos id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.purchase_sales_tax_infos ALTER COLUMN id SET DEFAULT nextval('public.purchase_sales_tax_infos_id_seq'::regclass);


--
-- Name: purchase_taxjar_infos id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.purchase_taxjar_infos ALTER COLUMN id SET DEFAULT nextval('public.purchase_taxjar_infos_id_seq'::regclass);


--
-- Name: purchase_wallet_types id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.purchase_wallet_types ALTER COLUMN id SET DEFAULT nextval('public.purchase_wallet_types_id_seq'::regclass);


--
-- Name: purchases id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.purchases ALTER COLUMN id SET DEFAULT nextval('public.purchases_id_seq'::regclass);


--
-- Name: purchasing_power_parity_infos id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.purchasing_power_parity_infos ALTER COLUMN id SET DEFAULT nextval('public.purchasing_power_parity_infos_id_seq'::regclass);


--
-- Name: recommended_purchase_infos id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.recommended_purchase_infos ALTER COLUMN id SET DEFAULT nextval('public.recommended_purchase_infos_id_seq'::regclass);


--
-- Name: recurring_services id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.recurring_services ALTER COLUMN id SET DEFAULT nextval('public.recurring_services_id_seq'::regclass);


--
-- Name: refund_policies id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.refund_policies ALTER COLUMN id SET DEFAULT nextval('public.refund_policies_id_seq'::regclass);


--
-- Name: refunds id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.refunds ALTER COLUMN id SET DEFAULT nextval('public.refunds_id_seq'::regclass);


--
-- Name: resource_subscriptions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.resource_subscriptions ALTER COLUMN id SET DEFAULT nextval('public.resource_subscriptions_id_seq'::regclass);


--
-- Name: rich_contents id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rich_contents ALTER COLUMN id SET DEFAULT nextval('public.rich_contents_id_seq'::regclass);


--
-- Name: sales_export_chunks id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sales_export_chunks ALTER COLUMN id SET DEFAULT nextval('public.sales_export_chunks_id_seq'::regclass);


--
-- Name: sales_exports id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sales_exports ALTER COLUMN id SET DEFAULT nextval('public.sales_exports_id_seq'::regclass);


--
-- Name: sales_related_products_infos id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sales_related_products_infos ALTER COLUMN id SET DEFAULT nextval('public.sales_related_products_infos_id_seq'::regclass);


--
-- Name: self_service_affiliate_products id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.self_service_affiliate_products ALTER COLUMN id SET DEFAULT nextval('public.self_service_affiliate_products_id_seq'::regclass);


--
-- Name: seller_profile_sections id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.seller_profile_sections ALTER COLUMN id SET DEFAULT nextval('public.seller_profile_sections_id_seq'::regclass);


--
-- Name: seller_profiles id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.seller_profiles ALTER COLUMN id SET DEFAULT nextval('public.seller_profiles_id_seq'::regclass);


--
-- Name: sent_abandoned_cart_emails id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sent_abandoned_cart_emails ALTER COLUMN id SET DEFAULT nextval('public.sent_abandoned_cart_emails_id_seq'::regclass);


--
-- Name: sent_email_infos id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sent_email_infos ALTER COLUMN id SET DEFAULT nextval('public.sent_email_infos_id_seq'::regclass);


--
-- Name: sent_post_emails id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sent_post_emails ALTER COLUMN id SET DEFAULT nextval('public.sent_post_emails_id_seq'::regclass);


--
-- Name: service_charges id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.service_charges ALTER COLUMN id SET DEFAULT nextval('public.service_charges_id_seq'::regclass);


--
-- Name: shipments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.shipments ALTER COLUMN id SET DEFAULT nextval('public.shipments_id_seq'::regclass);


--
-- Name: shipping_destinations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.shipping_destinations ALTER COLUMN id SET DEFAULT nextval('public.shipping_destinations_id_seq'::regclass);


--
-- Name: signup_events id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.signup_events ALTER COLUMN id SET DEFAULT nextval('public.signup_events_id_seq'::regclass);


--
-- Name: skus_variants id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.skus_variants ALTER COLUMN id SET DEFAULT nextval('public.skus_variants_id_seq'::regclass);


--
-- Name: staff_picked_products id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.staff_picked_products ALTER COLUMN id SET DEFAULT nextval('public.staff_picked_products_id_seq'::regclass);


--
-- Name: stamped_pdfs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stamped_pdfs ALTER COLUMN id SET DEFAULT nextval('public.stamped_pdfs_id_seq'::regclass);


--
-- Name: stripe_apple_pay_domains id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stripe_apple_pay_domains ALTER COLUMN id SET DEFAULT nextval('public.stripe_apple_pay_domains_id_seq'::regclass);


--
-- Name: subscription_events id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subscription_events ALTER COLUMN id SET DEFAULT nextval('public.subscription_events_id_seq'::regclass);


--
-- Name: subscription_plan_changes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subscription_plan_changes ALTER COLUMN id SET DEFAULT nextval('public.subscription_plan_changes_id_seq'::regclass);


--
-- Name: subscriptions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subscriptions ALTER COLUMN id SET DEFAULT nextval('public.subscriptions_id_seq'::regclass);


--
-- Name: subtitle_files id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subtitle_files ALTER COLUMN id SET DEFAULT nextval('public.subtitle_files_id_seq'::regclass);


--
-- Name: tags id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tags ALTER COLUMN id SET DEFAULT nextval('public.tags_id_seq'::regclass);


--
-- Name: taxonomies id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.taxonomies ALTER COLUMN id SET DEFAULT nextval('public.taxonomies_id_seq'::regclass);


--
-- Name: taxonomy_stats id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.taxonomy_stats ALTER COLUMN id SET DEFAULT nextval('public.taxonomy_stats_id_seq'::regclass);


--
-- Name: team_invitations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.team_invitations ALTER COLUMN id SET DEFAULT nextval('public.team_invitations_id_seq'::regclass);


--
-- Name: team_memberships id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.team_memberships ALTER COLUMN id SET DEFAULT nextval('public.team_memberships_id_seq'::regclass);


--
-- Name: third_party_analytics id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.third_party_analytics ALTER COLUMN id SET DEFAULT nextval('public.third_party_analytics_id_seq'::regclass);


--
-- Name: thumbnails id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thumbnails ALTER COLUMN id SET DEFAULT nextval('public.thumbnails_id_seq'::regclass);


--
-- Name: tips id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tips ALTER COLUMN id SET DEFAULT nextval('public.tips_id_seq'::regclass);


--
-- Name: top_sellers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.top_sellers ALTER COLUMN id SET DEFAULT nextval('public.top_sellers_id_seq'::regclass);


--
-- Name: tos_agreements id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tos_agreements ALTER COLUMN id SET DEFAULT nextval('public.tos_agreements_id_seq'::regclass);


--
-- Name: transcoded_videos id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transcoded_videos ALTER COLUMN id SET DEFAULT nextval('public.transcoded_videos_id_seq'::regclass);


--
-- Name: upsell_purchases id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.upsell_purchases ALTER COLUMN id SET DEFAULT nextval('public.upsell_purchases_id_seq'::regclass);


--
-- Name: upsell_variants id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.upsell_variants ALTER COLUMN id SET DEFAULT nextval('public.upsell_variants_id_seq'::regclass);


--
-- Name: upsells id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.upsells ALTER COLUMN id SET DEFAULT nextval('public.upsells_id_seq'::regclass);


--
-- Name: upsells_selected_products id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.upsells_selected_products ALTER COLUMN id SET DEFAULT nextval('public.upsells_selected_products_id_seq'::regclass);


--
-- Name: url_redirects id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.url_redirects ALTER COLUMN id SET DEFAULT nextval('public.url_redirects_id_seq'::regclass);


--
-- Name: user_compliance_info id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_compliance_info ALTER COLUMN id SET DEFAULT nextval('public.user_compliance_info_id_seq'::regclass);


--
-- Name: user_compliance_info_requests id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_compliance_info_requests ALTER COLUMN id SET DEFAULT nextval('public.user_compliance_info_requests_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: utm_link_driven_sales id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.utm_link_driven_sales ALTER COLUMN id SET DEFAULT nextval('public.utm_link_driven_sales_id_seq'::regclass);


--
-- Name: utm_link_visits id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.utm_link_visits ALTER COLUMN id SET DEFAULT nextval('public.utm_link_visits_id_seq'::regclass);


--
-- Name: utm_links id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.utm_links ALTER COLUMN id SET DEFAULT nextval('public.utm_links_id_seq'::regclass);


--
-- Name: variant_categories id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.variant_categories ALTER COLUMN id SET DEFAULT nextval('public.variant_categories_id_seq'::regclass);


--
-- Name: versions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.versions ALTER COLUMN id SET DEFAULT nextval('public.versions_id_seq'::regclass);


--
-- Name: video_files id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.video_files ALTER COLUMN id SET DEFAULT nextval('public.video_files_id_seq'::regclass);


--
-- Name: wishlist_followers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wishlist_followers ALTER COLUMN id SET DEFAULT nextval('public.wishlist_followers_id_seq'::regclass);


--
-- Name: wishlist_products id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wishlist_products ALTER COLUMN id SET DEFAULT nextval('public.wishlist_products_id_seq'::regclass);


--
-- Name: wishlists id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wishlists ALTER COLUMN id SET DEFAULT nextval('public.wishlists_id_seq'::regclass);


--
-- Name: workflows id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.workflows ALTER COLUMN id SET DEFAULT nextval('public.workflows_id_seq'::regclass);


--
-- Name: yearly_stats id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.yearly_stats ALTER COLUMN id SET DEFAULT nextval('public.yearly_stats_id_seq'::regclass);


--
-- Name: zip_tax_rates id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.zip_tax_rates ALTER COLUMN id SET DEFAULT nextval('public.zip_tax_rates_id_seq'::regclass);


--
-- Name: active_storage_attachments active_storage_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT active_storage_attachments_pkey PRIMARY KEY (id);


--
-- Name: active_storage_blobs active_storage_blobs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_blobs
    ADD CONSTRAINT active_storage_blobs_pkey PRIMARY KEY (id);


--
-- Name: active_storage_variant_records active_storage_variant_records_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_variant_records
    ADD CONSTRAINT active_storage_variant_records_pkey PRIMARY KEY (id);


--
-- Name: admin_action_call_infos admin_action_call_infos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin_action_call_infos
    ADD CONSTRAINT admin_action_call_infos_pkey PRIMARY KEY (id);


--
-- Name: affiliate_credits affiliate_credits_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.affiliate_credits
    ADD CONSTRAINT affiliate_credits_pkey PRIMARY KEY (id);


--
-- Name: affiliate_partial_refunds affiliate_partial_refunds_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.affiliate_partial_refunds
    ADD CONSTRAINT affiliate_partial_refunds_pkey PRIMARY KEY (id);


--
-- Name: affiliate_requests affiliate_requests_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.affiliate_requests
    ADD CONSTRAINT affiliate_requests_pkey PRIMARY KEY (id);


--
-- Name: affiliates_links affiliates_links_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.affiliates_links
    ADD CONSTRAINT affiliates_links_pkey PRIMARY KEY (id);


--
-- Name: affiliates affiliates_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.affiliates
    ADD CONSTRAINT affiliates_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: asset_previews asset_previews_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.asset_previews
    ADD CONSTRAINT asset_previews_pkey PRIMARY KEY (id);


--
-- Name: audience_members audience_members_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.audience_members
    ADD CONSTRAINT audience_members_pkey PRIMARY KEY (id);


--
-- Name: australia_backtax_email_infos australia_backtax_email_infos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.australia_backtax_email_infos
    ADD CONSTRAINT australia_backtax_email_infos_pkey PRIMARY KEY (id);


--
-- Name: backtax_agreements backtax_agreements_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.backtax_agreements
    ADD CONSTRAINT backtax_agreements_pkey PRIMARY KEY (id);


--
-- Name: backtax_collections backtax_collections_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.backtax_collections
    ADD CONSTRAINT backtax_collections_pkey PRIMARY KEY (id);


--
-- Name: balance_transactions balance_transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.balance_transactions
    ADD CONSTRAINT balance_transactions_pkey PRIMARY KEY (id);


--
-- Name: balances balances_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.balances
    ADD CONSTRAINT balances_pkey PRIMARY KEY (id);


--
-- Name: bank_accounts bank_accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bank_accounts
    ADD CONSTRAINT bank_accounts_pkey PRIMARY KEY (id);


--
-- Name: banks banks_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.banks
    ADD CONSTRAINT banks_pkey PRIMARY KEY (id);


--
-- Name: base_variant_integrations base_variant_integrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.base_variant_integrations
    ADD CONSTRAINT base_variant_integrations_pkey PRIMARY KEY (id);


--
-- Name: base_variants base_variants_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.base_variants
    ADD CONSTRAINT base_variants_pkey PRIMARY KEY (id);


--
-- Name: base_variants_product_files base_variants_product_files_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.base_variants_product_files
    ADD CONSTRAINT base_variants_product_files_pkey PRIMARY KEY (id);


--
-- Name: base_variants_purchases base_variants_purchases_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.base_variants_purchases
    ADD CONSTRAINT base_variants_purchases_pkey PRIMARY KEY (id);


--
-- Name: blocked_customer_objects blocked_customer_objects_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.blocked_customer_objects
    ADD CONSTRAINT blocked_customer_objects_pkey PRIMARY KEY (id);


--
-- Name: bundle_product_purchases bundle_product_purchases_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bundle_product_purchases
    ADD CONSTRAINT bundle_product_purchases_pkey PRIMARY KEY (id);


--
-- Name: bundle_products bundle_products_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bundle_products
    ADD CONSTRAINT bundle_products_pkey PRIMARY KEY (id);


--
-- Name: cached_sales_related_products_infos cached_sales_related_products_infos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cached_sales_related_products_infos
    ADD CONSTRAINT cached_sales_related_products_infos_pkey PRIMARY KEY (id);


--
-- Name: call_availabilities call_availabilities_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.call_availabilities
    ADD CONSTRAINT call_availabilities_pkey PRIMARY KEY (id);


--
-- Name: call_limitation_infos call_limitation_infos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.call_limitation_infos
    ADD CONSTRAINT call_limitation_infos_pkey PRIMARY KEY (id);


--
-- Name: calls calls_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.calls
    ADD CONSTRAINT calls_pkey PRIMARY KEY (id);


--
-- Name: cart_products cart_products_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cart_products
    ADD CONSTRAINT cart_products_pkey PRIMARY KEY (id);


--
-- Name: carts carts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.carts
    ADD CONSTRAINT carts_pkey PRIMARY KEY (id);


--
-- Name: charge_purchases charge_purchases_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.charge_purchases
    ADD CONSTRAINT charge_purchases_pkey PRIMARY KEY (id);


--
-- Name: charges charges_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.charges
    ADD CONSTRAINT charges_pkey PRIMARY KEY (id);


--
-- Name: collaborator_invitations collaborator_invitations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.collaborator_invitations
    ADD CONSTRAINT collaborator_invitations_pkey PRIMARY KEY (id);


--
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: commission_files commission_files_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.commission_files
    ADD CONSTRAINT commission_files_pkey PRIMARY KEY (id);


--
-- Name: commissions commissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.commissions
    ADD CONSTRAINT commissions_pkey PRIMARY KEY (id);


--
-- Name: communities communities_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.communities
    ADD CONSTRAINT communities_pkey PRIMARY KEY (id);


--
-- Name: community_chat_messages community_chat_messages_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.community_chat_messages
    ADD CONSTRAINT community_chat_messages_pkey PRIMARY KEY (id);


--
-- Name: community_chat_recap_runs community_chat_recap_runs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.community_chat_recap_runs
    ADD CONSTRAINT community_chat_recap_runs_pkey PRIMARY KEY (id);


--
-- Name: community_chat_recaps community_chat_recaps_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.community_chat_recaps
    ADD CONSTRAINT community_chat_recaps_pkey PRIMARY KEY (id);


--
-- Name: community_notification_settings community_notification_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.community_notification_settings
    ADD CONSTRAINT community_notification_settings_pkey PRIMARY KEY (id);


--
-- Name: computed_sales_analytics_days computed_sales_analytics_days_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.computed_sales_analytics_days
    ADD CONSTRAINT computed_sales_analytics_days_pkey PRIMARY KEY (id);


--
-- Name: consumption_events consumption_events_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.consumption_events
    ADD CONSTRAINT consumption_events_pkey PRIMARY KEY (id);


--
-- Name: credit_cards credit_cards_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.credit_cards
    ADD CONSTRAINT credit_cards_pkey PRIMARY KEY (id);


--
-- Name: credits credits_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.credits
    ADD CONSTRAINT credits_pkey PRIMARY KEY (id);


--
-- Name: custom_domains custom_domains_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.custom_domains
    ADD CONSTRAINT custom_domains_pkey PRIMARY KEY (id);


--
-- Name: custom_fields custom_fields_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.custom_fields
    ADD CONSTRAINT custom_fields_pkey PRIMARY KEY (id);


--
-- Name: custom_fields_products custom_fields_products_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.custom_fields_products
    ADD CONSTRAINT custom_fields_products_pkey PRIMARY KEY (id);


--
-- Name: devices devices_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.devices
    ADD CONSTRAINT devices_pkey PRIMARY KEY (id);


--
-- Name: discover_search_suggestions discover_search_suggestions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.discover_search_suggestions
    ADD CONSTRAINT discover_search_suggestions_pkey PRIMARY KEY (id);


--
-- Name: discover_searches discover_searches_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.discover_searches
    ADD CONSTRAINT discover_searches_pkey PRIMARY KEY (id);


--
-- Name: dispute_evidences dispute_evidences_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dispute_evidences
    ADD CONSTRAINT dispute_evidences_pkey PRIMARY KEY (id);


--
-- Name: disputes disputes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.disputes
    ADD CONSTRAINT disputes_pkey PRIMARY KEY (id);


--
-- Name: dropbox_files dropbox_files_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dropbox_files
    ADD CONSTRAINT dropbox_files_pkey PRIMARY KEY (id);


--
-- Name: email_info_charges email_info_charges_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.email_info_charges
    ADD CONSTRAINT email_info_charges_pkey PRIMARY KEY (id);


--
-- Name: email_infos email_infos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.email_infos
    ADD CONSTRAINT email_infos_pkey PRIMARY KEY (id);


--
-- Name: events events_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


--
-- Name: followers followers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.followers
    ADD CONSTRAINT followers_pkey PRIMARY KEY (id);


--
-- Name: friendly_id_slugs friendly_id_slugs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.friendly_id_slugs
    ADD CONSTRAINT friendly_id_slugs_pkey PRIMARY KEY (id);


--
-- Name: gifts gifts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.gifts
    ADD CONSTRAINT gifts_pkey PRIMARY KEY (id);


--
-- Name: gumroad_daily_analytics gumroad_daily_analytics_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.gumroad_daily_analytics
    ADD CONSTRAINT gumroad_daily_analytics_pkey PRIMARY KEY (id);


--
-- Name: imported_customers imported_customers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.imported_customers
    ADD CONSTRAINT imported_customers_pkey PRIMARY KEY (id);


--
-- Name: installment_events installment_events_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.installment_events
    ADD CONSTRAINT installment_events_pkey PRIMARY KEY (id);


--
-- Name: installment_rules installment_rules_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.installment_rules
    ADD CONSTRAINT installment_rules_pkey PRIMARY KEY (id);


--
-- Name: installments installments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.installments
    ADD CONSTRAINT installments_pkey PRIMARY KEY (id);


--
-- Name: integrations integrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.integrations
    ADD CONSTRAINT integrations_pkey PRIMARY KEY (id);


--
-- Name: invites invites_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.invites
    ADD CONSTRAINT invites_pkey PRIMARY KEY (id);


--
-- Name: large_sellers large_sellers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.large_sellers
    ADD CONSTRAINT large_sellers_pkey PRIMARY KEY (id);


--
-- Name: last_read_community_chat_messages last_read_community_chat_messages_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.last_read_community_chat_messages
    ADD CONSTRAINT last_read_community_chat_messages_pkey PRIMARY KEY (id);


--
-- Name: legacy_permalinks legacy_permalinks_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.legacy_permalinks
    ADD CONSTRAINT legacy_permalinks_pkey PRIMARY KEY (id);


--
-- Name: licenses licenses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.licenses
    ADD CONSTRAINT licenses_pkey PRIMARY KEY (id);


--
-- Name: links links_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.links
    ADD CONSTRAINT links_pkey PRIMARY KEY (id);


--
-- Name: media_locations media_locations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.media_locations
    ADD CONSTRAINT media_locations_pkey PRIMARY KEY (id);


--
-- Name: merchant_accounts merchant_accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.merchant_accounts
    ADD CONSTRAINT merchant_accounts_pkey PRIMARY KEY (id);


--
-- Name: oauth_access_grants oauth_access_grants_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.oauth_access_grants
    ADD CONSTRAINT oauth_access_grants_pkey PRIMARY KEY (id);


--
-- Name: oauth_access_tokens oauth_access_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.oauth_access_tokens
    ADD CONSTRAINT oauth_access_tokens_pkey PRIMARY KEY (id);


--
-- Name: oauth_applications oauth_applications_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.oauth_applications
    ADD CONSTRAINT oauth_applications_pkey PRIMARY KEY (id);


--
-- Name: offer_codes offer_codes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.offer_codes
    ADD CONSTRAINT offer_codes_pkey PRIMARY KEY (id);


--
-- Name: offer_codes_products offer_codes_products_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.offer_codes_products
    ADD CONSTRAINT offer_codes_products_pkey PRIMARY KEY (id);


--
-- Name: order_purchases order_purchases_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_purchases
    ADD CONSTRAINT order_purchases_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: payment_options payment_options_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payment_options
    ADD CONSTRAINT payment_options_pkey PRIMARY KEY (id);


--
-- Name: payments_balances payments_balances_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payments_balances
    ADD CONSTRAINT payments_balances_pkey PRIMARY KEY (id);


--
-- Name: payments payments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_pkey PRIMARY KEY (id);


--
-- Name: post_email_blasts post_email_blasts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.post_email_blasts
    ADD CONSTRAINT post_email_blasts_pkey PRIMARY KEY (id);


--
-- Name: preorder_links preorder_links_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.preorder_links
    ADD CONSTRAINT preorder_links_pkey PRIMARY KEY (id);


--
-- Name: preorders preorders_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.preorders
    ADD CONSTRAINT preorders_pkey PRIMARY KEY (id);


--
-- Name: prices prices_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.prices
    ADD CONSTRAINT prices_pkey PRIMARY KEY (id);


--
-- Name: processor_payment_intents processor_payment_intents_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.processor_payment_intents
    ADD CONSTRAINT processor_payment_intents_pkey PRIMARY KEY (id);


--
-- Name: product_cached_values product_cached_values_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_cached_values
    ADD CONSTRAINT product_cached_values_pkey PRIMARY KEY (id);


--
-- Name: product_files_archives product_files_archives_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_files_archives
    ADD CONSTRAINT product_files_archives_pkey PRIMARY KEY (id);


--
-- Name: product_files_files_archives product_files_files_archives_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_files_files_archives
    ADD CONSTRAINT product_files_files_archives_pkey PRIMARY KEY (id);


--
-- Name: product_files product_files_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_files
    ADD CONSTRAINT product_files_pkey PRIMARY KEY (id);


--
-- Name: product_folders product_folders_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_folders
    ADD CONSTRAINT product_folders_pkey PRIMARY KEY (id);


--
-- Name: product_installment_plans product_installment_plans_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_installment_plans
    ADD CONSTRAINT product_installment_plans_pkey PRIMARY KEY (id);


--
-- Name: product_integrations product_integrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_integrations
    ADD CONSTRAINT product_integrations_pkey PRIMARY KEY (id);


--
-- Name: product_review_responses product_review_responses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_review_responses
    ADD CONSTRAINT product_review_responses_pkey PRIMARY KEY (id);


--
-- Name: product_review_stats product_review_stats_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_review_stats
    ADD CONSTRAINT product_review_stats_pkey PRIMARY KEY (id);


--
-- Name: product_review_videos product_review_videos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_review_videos
    ADD CONSTRAINT product_review_videos_pkey PRIMARY KEY (id);


--
-- Name: product_reviews product_reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_reviews
    ADD CONSTRAINT product_reviews_pkey PRIMARY KEY (id);


--
-- Name: product_taggings product_taggings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_taggings
    ADD CONSTRAINT product_taggings_pkey PRIMARY KEY (id);


--
-- Name: public_files public_files_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.public_files
    ADD CONSTRAINT public_files_pkey PRIMARY KEY (id);


--
-- Name: purchase_custom_field_files purchase_custom_field_files_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.purchase_custom_field_files
    ADD CONSTRAINT purchase_custom_field_files_pkey PRIMARY KEY (id);


--
-- Name: purchase_custom_fields purchase_custom_fields_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.purchase_custom_fields
    ADD CONSTRAINT purchase_custom_fields_pkey PRIMARY KEY (id);


--
-- Name: purchase_early_fraud_warnings purchase_early_fraud_warnings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.purchase_early_fraud_warnings
    ADD CONSTRAINT purchase_early_fraud_warnings_pkey PRIMARY KEY (id);


--
-- Name: purchase_integrations purchase_integrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.purchase_integrations
    ADD CONSTRAINT purchase_integrations_pkey PRIMARY KEY (id);


--
-- Name: purchase_offer_code_discounts purchase_offer_code_discounts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.purchase_offer_code_discounts
    ADD CONSTRAINT purchase_offer_code_discounts_pkey PRIMARY KEY (id);


--
-- Name: purchase_refund_policies purchase_refund_policies_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.purchase_refund_policies
    ADD CONSTRAINT purchase_refund_policies_pkey PRIMARY KEY (id);


--
-- Name: purchase_sales_tax_infos purchase_sales_tax_infos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.purchase_sales_tax_infos
    ADD CONSTRAINT purchase_sales_tax_infos_pkey PRIMARY KEY (id);


--
-- Name: purchase_taxjar_infos purchase_taxjar_infos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.purchase_taxjar_infos
    ADD CONSTRAINT purchase_taxjar_infos_pkey PRIMARY KEY (id);


--
-- Name: purchase_wallet_types purchase_wallet_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.purchase_wallet_types
    ADD CONSTRAINT purchase_wallet_types_pkey PRIMARY KEY (id);


--
-- Name: purchases purchases_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.purchases
    ADD CONSTRAINT purchases_pkey PRIMARY KEY (id);


--
-- Name: purchasing_power_parity_infos purchasing_power_parity_infos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.purchasing_power_parity_infos
    ADD CONSTRAINT purchasing_power_parity_infos_pkey PRIMARY KEY (id);


--
-- Name: recommended_purchase_infos recommended_purchase_infos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.recommended_purchase_infos
    ADD CONSTRAINT recommended_purchase_infos_pkey PRIMARY KEY (id);


--
-- Name: recurring_services recurring_services_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.recurring_services
    ADD CONSTRAINT recurring_services_pkey PRIMARY KEY (id);


--
-- Name: refund_policies refund_policies_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.refund_policies
    ADD CONSTRAINT refund_policies_pkey PRIMARY KEY (id);


--
-- Name: refunds refunds_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.refunds
    ADD CONSTRAINT refunds_pkey PRIMARY KEY (id);


--
-- Name: resource_subscriptions resource_subscriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.resource_subscriptions
    ADD CONSTRAINT resource_subscriptions_pkey PRIMARY KEY (id);


--
-- Name: rich_contents rich_contents_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rich_contents
    ADD CONSTRAINT rich_contents_pkey PRIMARY KEY (id);


--
-- Name: sales_export_chunks sales_export_chunks_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sales_export_chunks
    ADD CONSTRAINT sales_export_chunks_pkey PRIMARY KEY (id);


--
-- Name: sales_exports sales_exports_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sales_exports
    ADD CONSTRAINT sales_exports_pkey PRIMARY KEY (id);


--
-- Name: sales_related_products_infos sales_related_products_infos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sales_related_products_infos
    ADD CONSTRAINT sales_related_products_infos_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: self_service_affiliate_products self_service_affiliate_products_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.self_service_affiliate_products
    ADD CONSTRAINT self_service_affiliate_products_pkey PRIMARY KEY (id);


--
-- Name: seller_profile_sections seller_profile_sections_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.seller_profile_sections
    ADD CONSTRAINT seller_profile_sections_pkey PRIMARY KEY (id);


--
-- Name: seller_profiles seller_profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.seller_profiles
    ADD CONSTRAINT seller_profiles_pkey PRIMARY KEY (id);


--
-- Name: sent_abandoned_cart_emails sent_abandoned_cart_emails_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sent_abandoned_cart_emails
    ADD CONSTRAINT sent_abandoned_cart_emails_pkey PRIMARY KEY (id);


--
-- Name: sent_email_infos sent_email_infos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sent_email_infos
    ADD CONSTRAINT sent_email_infos_pkey PRIMARY KEY (id);


--
-- Name: sent_post_emails sent_post_emails_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sent_post_emails
    ADD CONSTRAINT sent_post_emails_pkey PRIMARY KEY (id);


--
-- Name: service_charges service_charges_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.service_charges
    ADD CONSTRAINT service_charges_pkey PRIMARY KEY (id);


--
-- Name: shipments shipments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.shipments
    ADD CONSTRAINT shipments_pkey PRIMARY KEY (id);


--
-- Name: shipping_destinations shipping_destinations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.shipping_destinations
    ADD CONSTRAINT shipping_destinations_pkey PRIMARY KEY (id);


--
-- Name: signup_events signup_events_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.signup_events
    ADD CONSTRAINT signup_events_pkey PRIMARY KEY (id);


--
-- Name: skus_variants skus_variants_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.skus_variants
    ADD CONSTRAINT skus_variants_pkey PRIMARY KEY (id);


--
-- Name: staff_picked_products staff_picked_products_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.staff_picked_products
    ADD CONSTRAINT staff_picked_products_pkey PRIMARY KEY (id);


--
-- Name: stamped_pdfs stamped_pdfs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stamped_pdfs
    ADD CONSTRAINT stamped_pdfs_pkey PRIMARY KEY (id);


--
-- Name: stripe_apple_pay_domains stripe_apple_pay_domains_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stripe_apple_pay_domains
    ADD CONSTRAINT stripe_apple_pay_domains_pkey PRIMARY KEY (id);


--
-- Name: subscription_events subscription_events_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subscription_events
    ADD CONSTRAINT subscription_events_pkey PRIMARY KEY (id);


--
-- Name: subscription_plan_changes subscription_plan_changes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subscription_plan_changes
    ADD CONSTRAINT subscription_plan_changes_pkey PRIMARY KEY (id);


--
-- Name: subscriptions subscriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subscriptions
    ADD CONSTRAINT subscriptions_pkey PRIMARY KEY (id);


--
-- Name: subtitle_files subtitle_files_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subtitle_files
    ADD CONSTRAINT subtitle_files_pkey PRIMARY KEY (id);


--
-- Name: tags tags_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- Name: taxonomies taxonomies_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.taxonomies
    ADD CONSTRAINT taxonomies_pkey PRIMARY KEY (id);


--
-- Name: taxonomy_stats taxonomy_stats_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.taxonomy_stats
    ADD CONSTRAINT taxonomy_stats_pkey PRIMARY KEY (id);


--
-- Name: team_invitations team_invitations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.team_invitations
    ADD CONSTRAINT team_invitations_pkey PRIMARY KEY (id);


--
-- Name: team_memberships team_memberships_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.team_memberships
    ADD CONSTRAINT team_memberships_pkey PRIMARY KEY (id);


--
-- Name: third_party_analytics third_party_analytics_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.third_party_analytics
    ADD CONSTRAINT third_party_analytics_pkey PRIMARY KEY (id);


--
-- Name: thumbnails thumbnails_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thumbnails
    ADD CONSTRAINT thumbnails_pkey PRIMARY KEY (id);


--
-- Name: tips tips_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tips
    ADD CONSTRAINT tips_pkey PRIMARY KEY (id);


--
-- Name: top_sellers top_sellers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.top_sellers
    ADD CONSTRAINT top_sellers_pkey PRIMARY KEY (id);


--
-- Name: tos_agreements tos_agreements_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tos_agreements
    ADD CONSTRAINT tos_agreements_pkey PRIMARY KEY (id);


--
-- Name: transcoded_videos transcoded_videos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transcoded_videos
    ADD CONSTRAINT transcoded_videos_pkey PRIMARY KEY (id);


--
-- Name: upsell_purchases upsell_purchases_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.upsell_purchases
    ADD CONSTRAINT upsell_purchases_pkey PRIMARY KEY (id);


--
-- Name: upsell_variants upsell_variants_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.upsell_variants
    ADD CONSTRAINT upsell_variants_pkey PRIMARY KEY (id);


--
-- Name: upsells upsells_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.upsells
    ADD CONSTRAINT upsells_pkey PRIMARY KEY (id);


--
-- Name: upsells_selected_products upsells_selected_products_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.upsells_selected_products
    ADD CONSTRAINT upsells_selected_products_pkey PRIMARY KEY (id);


--
-- Name: url_redirects url_redirects_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.url_redirects
    ADD CONSTRAINT url_redirects_pkey PRIMARY KEY (id);


--
-- Name: user_compliance_info user_compliance_info_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_compliance_info
    ADD CONSTRAINT user_compliance_info_pkey PRIMARY KEY (id);


--
-- Name: user_compliance_info_requests user_compliance_info_requests_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_compliance_info_requests
    ADD CONSTRAINT user_compliance_info_requests_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: utm_link_driven_sales utm_link_driven_sales_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.utm_link_driven_sales
    ADD CONSTRAINT utm_link_driven_sales_pkey PRIMARY KEY (id);


--
-- Name: utm_link_visits utm_link_visits_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.utm_link_visits
    ADD CONSTRAINT utm_link_visits_pkey PRIMARY KEY (id);


--
-- Name: utm_links utm_links_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.utm_links
    ADD CONSTRAINT utm_links_pkey PRIMARY KEY (id);


--
-- Name: variant_categories variant_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.variant_categories
    ADD CONSTRAINT variant_categories_pkey PRIMARY KEY (id);


--
-- Name: versions versions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.versions
    ADD CONSTRAINT versions_pkey PRIMARY KEY (id);


--
-- Name: video_files video_files_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.video_files
    ADD CONSTRAINT video_files_pkey PRIMARY KEY (id);


--
-- Name: wishlist_followers wishlist_followers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wishlist_followers
    ADD CONSTRAINT wishlist_followers_pkey PRIMARY KEY (id);


--
-- Name: wishlist_products wishlist_products_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wishlist_products
    ADD CONSTRAINT wishlist_products_pkey PRIMARY KEY (id);


--
-- Name: wishlists wishlists_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wishlists
    ADD CONSTRAINT wishlists_pkey PRIMARY KEY (id);


--
-- Name: workflows workflows_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.workflows
    ADD CONSTRAINT workflows_pkey PRIMARY KEY (id);


--
-- Name: yearly_stats yearly_stats_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.yearly_stats
    ADD CONSTRAINT yearly_stats_pkey PRIMARY KEY (id);


--
-- Name: zip_tax_rates zip_tax_rates_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.zip_tax_rates
    ADD CONSTRAINT zip_tax_rates_pkey PRIMARY KEY (id);


--
-- Name: idx_admin_action_infos_ctrl_action; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX idx_admin_action_infos_ctrl_action ON public.admin_action_call_infos USING btree (controller_name, action_name);


--
-- Name: idx_affiliate_credits_on_affiliate_credit_chargeback_balance_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_affiliate_credits_on_affiliate_credit_chargeback_balance_id ON public.affiliate_credits USING btree (affiliate_credit_chargeback_balance_id);


--
-- Name: idx_affiliate_credits_refund_balance; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_affiliate_credits_refund_balance ON public.affiliate_credits USING btree (affiliate_credit_refund_balance_id);


--
-- Name: idx_affiliate_credits_success_balance; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_affiliate_credits_success_balance ON public.affiliate_credits USING btree (affiliate_credit_success_balance_id);


--
-- Name: idx_audience_on_seller_and_follower_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_audience_on_seller_and_follower_created_at ON public.audience_members USING btree (seller_id, follower_created_at);


--
-- Name: idx_audience_on_seller_and_minmax_affiliate_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_audience_on_seller_and_minmax_affiliate_created_at ON public.audience_members USING btree (seller_id, min_affiliate_created_at, max_affiliate_created_at);


--
-- Name: idx_audience_on_seller_and_minmax_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_audience_on_seller_and_minmax_created_at ON public.audience_members USING btree (seller_id, min_created_at, max_created_at);


--
-- Name: idx_audience_on_seller_and_minmax_paid_cents; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_audience_on_seller_and_minmax_paid_cents ON public.audience_members USING btree (seller_id, min_paid_cents, max_paid_cents);


--
-- Name: idx_audience_on_seller_and_minmax_purchase_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_audience_on_seller_and_minmax_purchase_created_at ON public.audience_members USING btree (seller_id, min_purchase_created_at, max_purchase_created_at);


--
-- Name: idx_audience_on_seller_and_types; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_audience_on_seller_and_types ON public.audience_members USING btree (seller_id, customer, follower, affiliate);


--
-- Name: idx_blocked_customer_objects_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX idx_blocked_customer_objects_unique ON public.blocked_customer_objects USING btree (seller_id, object_type, object_value);


--
-- Name: idx_community_notifications_user_seller; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX idx_community_notifications_user_seller ON public.community_notification_settings USING btree (user_id, seller_id);


--
-- Name: idx_media_locations_purchase_file_consumed; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_media_locations_purchase_file_consumed ON public.media_locations USING btree (purchase_id, product_file_id, consumed_at);


--
-- Name: idx_on_community_chat_message_id_f9e10450e2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_on_community_chat_message_id_f9e10450e2 ON public.last_read_community_chat_messages USING btree (community_chat_message_id);


--
-- Name: idx_on_link_id_has_message_created_at_2fcf6c0c64; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_on_link_id_has_message_created_at_2fcf6c0c64 ON public.product_reviews USING btree (link_id, has_message, created_at);


--
-- Name: idx_on_recap_frequency_from_date_to_date_2ed29d569d; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX idx_on_recap_frequency_from_date_to_date_2ed29d569d ON public.community_chat_recap_runs USING btree (recap_frequency, from_date, to_date);


--
-- Name: idx_on_resource_type_resource_id_seller_id_deleted__23a67b41cb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX idx_on_resource_type_resource_id_seller_id_deleted__23a67b41cb ON public.communities USING btree (resource_type, resource_id, seller_id, deleted_at);


--
-- Name: idx_on_user_id_community_id_45efa2a41c; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX idx_on_user_id_community_id_45efa2a41c ON public.last_read_community_chat_messages USING btree (user_id, community_id);


--
-- Name: idx_on_utm_link_visit_id_purchase_id_c31951f65f; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX idx_on_utm_link_visit_id_purchase_id_c31951f65f ON public.utm_link_driven_sales USING btree (utm_link_visit_id, purchase_id);


--
-- Name: idx_product_files_archives_archive; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_product_files_archives_archive ON public.product_files_files_archives USING btree (product_files_archive_id);


--
-- Name: idx_purchase_custom_field_files; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_purchase_custom_field_files ON public.purchase_custom_field_files USING btree (purchase_custom_field_id);


--
-- Name: idx_purchases_seller_state_created; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_purchases_seller_state_created ON public.purchases USING btree (seller_id, purchase_state, created_at);


--
-- Name: idx_url_redirects_installment_customer; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_url_redirects_installment_customer ON public.url_redirects USING btree (installment_id, imported_customer_id);


--
-- Name: idx_utm_links_target_resource; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_utm_links_target_resource ON public.utm_links USING btree (target_resource_type, target_resource_id);


--
-- Name: index_ach_accounts_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_ach_accounts_on_user_id ON public.bank_accounts USING btree (user_id);


--
-- Name: index_active_storage_attachments_on_blob_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_active_storage_attachments_on_blob_id ON public.active_storage_attachments USING btree (blob_id);


--
-- Name: index_active_storage_attachments_uniqueness; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_active_storage_attachments_uniqueness ON public.active_storage_attachments USING btree (record_type, record_id, name, blob_id);


--
-- Name: index_active_storage_blobs_on_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_active_storage_blobs_on_key ON public.active_storage_blobs USING btree (key);


--
-- Name: index_active_storage_variant_records_uniqueness; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_active_storage_variant_records_uniqueness ON public.active_storage_variant_records USING btree (blob_id, variation_digest);


--
-- Name: index_affiliate_credits_on_affiliate_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_affiliate_credits_on_affiliate_id ON public.affiliate_credits USING btree (affiliate_id);


--
-- Name: index_affiliate_credits_on_affiliate_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_affiliate_credits_on_affiliate_user_id ON public.affiliate_credits USING btree (affiliate_user_id);


--
-- Name: index_affiliate_credits_on_link_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_affiliate_credits_on_link_id ON public.affiliate_credits USING btree (link_id);


--
-- Name: index_affiliate_credits_on_oauth_application_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_affiliate_credits_on_oauth_application_id ON public.affiliate_credits USING btree (oauth_application_id);


--
-- Name: index_affiliate_credits_on_purchase_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_affiliate_credits_on_purchase_id ON public.affiliate_credits USING btree (purchase_id);


--
-- Name: index_affiliate_credits_on_seller_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_affiliate_credits_on_seller_id ON public.affiliate_credits USING btree (seller_id);


--
-- Name: index_affiliate_partial_refunds_on_affiliate_credit_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_affiliate_partial_refunds_on_affiliate_credit_id ON public.affiliate_partial_refunds USING btree (affiliate_credit_id);


--
-- Name: index_affiliate_partial_refunds_on_affiliate_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_affiliate_partial_refunds_on_affiliate_id ON public.affiliate_partial_refunds USING btree (affiliate_id);


--
-- Name: index_affiliate_partial_refunds_on_affiliate_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_affiliate_partial_refunds_on_affiliate_user_id ON public.affiliate_partial_refunds USING btree (affiliate_user_id);


--
-- Name: index_affiliate_partial_refunds_on_balance_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_affiliate_partial_refunds_on_balance_id ON public.affiliate_partial_refunds USING btree (balance_id);


--
-- Name: index_affiliate_partial_refunds_on_purchase_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_affiliate_partial_refunds_on_purchase_id ON public.affiliate_partial_refunds USING btree (purchase_id);


--
-- Name: index_affiliate_partial_refunds_on_seller_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_affiliate_partial_refunds_on_seller_id ON public.affiliate_partial_refunds USING btree (seller_id);


--
-- Name: index_affiliate_requests_on_seller_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_affiliate_requests_on_seller_id ON public.affiliate_requests USING btree (seller_id);


--
-- Name: index_affiliates_links_on_affiliate_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_affiliates_links_on_affiliate_id ON public.affiliates_links USING btree (affiliate_id);


--
-- Name: index_affiliates_links_on_link_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_affiliates_links_on_link_id ON public.affiliates_links USING btree (link_id);


--
-- Name: index_affiliates_on_affiliate_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_affiliates_on_affiliate_user_id ON public.affiliates USING btree (affiliate_user_id);


--
-- Name: index_affiliates_on_seller_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_affiliates_on_seller_id ON public.affiliates USING btree (seller_id);


--
-- Name: index_asset_previews_on_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_asset_previews_on_deleted_at ON public.asset_previews USING btree (deleted_at);


--
-- Name: index_asset_previews_on_link_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_asset_previews_on_link_id ON public.asset_previews USING btree (link_id);


--
-- Name: index_audience_members_on_seller_id_and_email; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_audience_members_on_seller_id_and_email ON public.audience_members USING btree (seller_id, email);


--
-- Name: index_australia_backtax_email_infos_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_australia_backtax_email_infos_on_user_id ON public.australia_backtax_email_infos USING btree (user_id);


--
-- Name: index_backtax_agreements_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_backtax_agreements_on_user_id ON public.backtax_agreements USING btree (user_id);


--
-- Name: index_backtax_collections_on_backtax_agreement_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_backtax_collections_on_backtax_agreement_id ON public.backtax_collections USING btree (backtax_agreement_id);


--
-- Name: index_backtax_collections_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_backtax_collections_on_user_id ON public.backtax_collections USING btree (user_id);


--
-- Name: index_balance_transactions_on_balance_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_balance_transactions_on_balance_id ON public.balance_transactions USING btree (balance_id);


--
-- Name: index_balance_transactions_on_credit_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_balance_transactions_on_credit_id ON public.balance_transactions USING btree (credit_id);


--
-- Name: index_balance_transactions_on_dispute_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_balance_transactions_on_dispute_id ON public.balance_transactions USING btree (dispute_id);


--
-- Name: index_balance_transactions_on_merchant_account_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_balance_transactions_on_merchant_account_id ON public.balance_transactions USING btree (merchant_account_id);


--
-- Name: index_balance_transactions_on_purchase_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_balance_transactions_on_purchase_id ON public.balance_transactions USING btree (purchase_id);


--
-- Name: index_balance_transactions_on_refund_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_balance_transactions_on_refund_id ON public.balance_transactions USING btree (refund_id);


--
-- Name: index_balance_transactions_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_balance_transactions_on_user_id ON public.balance_transactions USING btree (user_id);


--
-- Name: index_banks_on_routing_number; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_banks_on_routing_number ON public.banks USING btree (routing_number);


--
-- Name: index_base_variant_integrations_on_base_variant_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_base_variant_integrations_on_base_variant_id ON public.base_variant_integrations USING btree (base_variant_id);


--
-- Name: index_base_variant_integrations_on_integration_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_base_variant_integrations_on_integration_id ON public.base_variant_integrations USING btree (integration_id);


--
-- Name: index_base_variants_on_link_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_base_variants_on_link_id ON public.base_variants USING btree (link_id);


--
-- Name: index_base_variants_product_files_on_base_variant_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_base_variants_product_files_on_base_variant_id ON public.base_variants_product_files USING btree (base_variant_id);


--
-- Name: index_base_variants_product_files_on_product_file_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_base_variants_product_files_on_product_file_id ON public.base_variants_product_files USING btree (product_file_id);


--
-- Name: index_blocked_customer_objects_on_buyer_email; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_blocked_customer_objects_on_buyer_email ON public.blocked_customer_objects USING btree (buyer_email);


--
-- Name: index_blocked_customer_objects_on_seller_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_blocked_customer_objects_on_seller_id ON public.blocked_customer_objects USING btree (seller_id);


--
-- Name: index_bundle_product_purchases_on_bundle_purchase_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_bundle_product_purchases_on_bundle_purchase_id ON public.bundle_product_purchases USING btree (bundle_purchase_id);


--
-- Name: index_bundle_product_purchases_on_product_purchase_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_bundle_product_purchases_on_product_purchase_id ON public.bundle_product_purchases USING btree (product_purchase_id);


--
-- Name: index_bundle_products_on_bundle_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_bundle_products_on_bundle_id ON public.bundle_products USING btree (bundle_id);


--
-- Name: index_bundle_products_on_product_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_bundle_products_on_product_id ON public.bundle_products USING btree (product_id);


--
-- Name: index_bundle_products_on_variant_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_bundle_products_on_variant_id ON public.bundle_products USING btree (variant_id);


--
-- Name: index_cached_sales_related_products_infos_on_product_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_cached_sales_related_products_infos_on_product_id ON public.cached_sales_related_products_infos USING btree (product_id);


--
-- Name: index_call_availabilities_on_call_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_call_availabilities_on_call_id ON public.call_availabilities USING btree (call_id);


--
-- Name: index_call_limitation_infos_on_call_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_call_limitation_infos_on_call_id ON public.call_limitation_infos USING btree (call_id);


--
-- Name: index_calls_on_purchase_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_calls_on_purchase_id ON public.calls USING btree (purchase_id);


--
-- Name: index_cart_products_on_cart_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_cart_products_on_cart_id ON public.cart_products USING btree (cart_id);


--
-- Name: index_cart_products_on_cart_id_and_product_id_and_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_cart_products_on_cart_id_and_product_id_and_deleted_at ON public.cart_products USING btree (cart_id, product_id, deleted_at);


--
-- Name: index_cart_products_on_product_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_cart_products_on_product_id ON public.cart_products USING btree (product_id);


--
-- Name: index_carts_on_browser_guid; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_carts_on_browser_guid ON public.carts USING btree (browser_guid);


--
-- Name: index_carts_on_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_carts_on_created_at ON public.carts USING btree (created_at);


--
-- Name: index_carts_on_email; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_carts_on_email ON public.carts USING btree (email);


--
-- Name: index_carts_on_order_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_carts_on_order_id ON public.carts USING btree (order_id);


--
-- Name: index_carts_on_updated_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_carts_on_updated_at ON public.carts USING btree (updated_at);


--
-- Name: index_carts_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_carts_on_user_id ON public.carts USING btree (user_id);


--
-- Name: index_charge_purchases_on_charge_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_charge_purchases_on_charge_id ON public.charge_purchases USING btree (charge_id);


--
-- Name: index_charge_purchases_on_purchase_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_charge_purchases_on_purchase_id ON public.charge_purchases USING btree (purchase_id);


--
-- Name: index_charges_on_credit_card_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_charges_on_credit_card_id ON public.charges USING btree (credit_card_id);


--
-- Name: index_charges_on_merchant_account_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_charges_on_merchant_account_id ON public.charges USING btree (merchant_account_id);


--
-- Name: index_charges_on_order_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_charges_on_order_id ON public.charges USING btree (order_id);


--
-- Name: index_charges_on_paypal_order_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_charges_on_paypal_order_id ON public.charges USING btree (paypal_order_id);


--
-- Name: index_charges_on_processor_transaction_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_charges_on_processor_transaction_id ON public.charges USING btree (processor_transaction_id);


--
-- Name: index_charges_on_seller_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_charges_on_seller_id ON public.charges USING btree (seller_id);


--
-- Name: index_collaborator_invitations_on_collaborator_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_collaborator_invitations_on_collaborator_id ON public.collaborator_invitations USING btree (collaborator_id);


--
-- Name: index_comments_on_ancestry; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_comments_on_ancestry ON public.comments USING btree (ancestry);


--
-- Name: index_comments_on_commentable_id_and_commentable_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_comments_on_commentable_id_and_commentable_type ON public.comments USING btree (commentable_id, commentable_type);


--
-- Name: index_comments_on_purchase_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_comments_on_purchase_id ON public.comments USING btree (purchase_id);


--
-- Name: index_commission_files_on_commission_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_commission_files_on_commission_id ON public.commission_files USING btree (commission_id);


--
-- Name: index_commissions_on_completion_purchase_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_commissions_on_completion_purchase_id ON public.commissions USING btree (completion_purchase_id);


--
-- Name: index_commissions_on_deposit_purchase_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_commissions_on_deposit_purchase_id ON public.commissions USING btree (deposit_purchase_id);


--
-- Name: index_communities_on_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_communities_on_deleted_at ON public.communities USING btree (deleted_at);


--
-- Name: index_communities_on_resource; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_communities_on_resource ON public.communities USING btree (resource_type, resource_id);


--
-- Name: index_communities_on_seller_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_communities_on_seller_id ON public.communities USING btree (seller_id);


--
-- Name: index_community_chat_messages_on_community_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_community_chat_messages_on_community_id ON public.community_chat_messages USING btree (community_id);


--
-- Name: index_community_chat_messages_on_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_community_chat_messages_on_deleted_at ON public.community_chat_messages USING btree (deleted_at);


--
-- Name: index_community_chat_messages_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_community_chat_messages_on_user_id ON public.community_chat_messages USING btree (user_id);


--
-- Name: index_community_chat_recap_runs_on_recap_frequency; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_community_chat_recap_runs_on_recap_frequency ON public.community_chat_recap_runs USING btree (recap_frequency);


--
-- Name: index_community_chat_recaps_on_community_chat_recap_run_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_community_chat_recaps_on_community_chat_recap_run_id ON public.community_chat_recaps USING btree (community_chat_recap_run_id);


--
-- Name: index_community_chat_recaps_on_community_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_community_chat_recaps_on_community_id ON public.community_chat_recaps USING btree (community_id);


--
-- Name: index_community_chat_recaps_on_seller_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_community_chat_recaps_on_seller_id ON public.community_chat_recaps USING btree (seller_id);


--
-- Name: index_community_chat_recaps_on_status; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_community_chat_recaps_on_status ON public.community_chat_recaps USING btree (status);


--
-- Name: index_community_notification_settings_on_recap_frequency; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_community_notification_settings_on_recap_frequency ON public.community_notification_settings USING btree (recap_frequency);


--
-- Name: index_community_notification_settings_on_seller_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_community_notification_settings_on_seller_id ON public.community_notification_settings USING btree (seller_id);


--
-- Name: index_community_notification_settings_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_community_notification_settings_on_user_id ON public.community_notification_settings USING btree (user_id);


--
-- Name: index_computed_sales_analytics_days_on_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_computed_sales_analytics_days_on_key ON public.computed_sales_analytics_days USING btree (key);


--
-- Name: index_consumption_events_on_link_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_consumption_events_on_link_id ON public.consumption_events USING btree (link_id);


--
-- Name: index_consumption_events_on_product_file_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_consumption_events_on_product_file_id ON public.consumption_events USING btree (product_file_id);


--
-- Name: index_consumption_events_on_purchase_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_consumption_events_on_purchase_id ON public.consumption_events USING btree (purchase_id);


--
-- Name: index_credit_cards_on_preorder_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_credit_cards_on_preorder_id ON public.credit_cards USING btree (preorder_id);


--
-- Name: index_credit_cards_on_stripe_fingerprint; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_credit_cards_on_stripe_fingerprint ON public.credit_cards USING btree (stripe_fingerprint);


--
-- Name: index_credits_on_balance_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_credits_on_balance_id ON public.credits USING btree (balance_id);


--
-- Name: index_credits_on_dispute_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_credits_on_dispute_id ON public.credits USING btree (dispute_id);


--
-- Name: index_custom_domains_on_domain; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_custom_domains_on_domain ON public.custom_domains USING btree (domain);


--
-- Name: index_custom_domains_on_product_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_custom_domains_on_product_id ON public.custom_domains USING btree (product_id);


--
-- Name: index_custom_domains_on_ssl_certificate_issued_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_custom_domains_on_ssl_certificate_issued_at ON public.custom_domains USING btree (ssl_certificate_issued_at);


--
-- Name: index_custom_domains_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_custom_domains_on_user_id ON public.custom_domains USING btree (user_id);


--
-- Name: index_custom_fields_on_seller_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_custom_fields_on_seller_id ON public.custom_fields USING btree (seller_id);


--
-- Name: index_custom_fields_products_on_custom_field_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_custom_fields_products_on_custom_field_id ON public.custom_fields_products USING btree (custom_field_id);


--
-- Name: index_custom_fields_products_on_product_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_custom_fields_products_on_product_id ON public.custom_fields_products USING btree (product_id);


--
-- Name: index_devices_on_app_type_and_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_devices_on_app_type_and_user_id ON public.devices USING btree (app_type, user_id);


--
-- Name: index_devices_on_token_and_device_type; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_devices_on_token_and_device_type ON public.devices USING btree (token, device_type);


--
-- Name: index_devices_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_devices_on_user_id ON public.devices USING btree (user_id);


--
-- Name: index_discover_search_suggestions_on_discover_search_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_discover_search_suggestions_on_discover_search_id ON public.discover_search_suggestions USING btree (discover_search_id);


--
-- Name: index_discover_searches_on_browser_guid; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_discover_searches_on_browser_guid ON public.discover_searches USING btree (browser_guid);


--
-- Name: index_discover_searches_on_clicked_resource; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_discover_searches_on_clicked_resource ON public.discover_searches USING btree (clicked_resource_type, clicked_resource_id);


--
-- Name: index_discover_searches_on_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_discover_searches_on_created_at ON public.discover_searches USING btree (created_at);


--
-- Name: index_discover_searches_on_ip_address; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_discover_searches_on_ip_address ON public.discover_searches USING btree (ip_address);


--
-- Name: index_discover_searches_on_query; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_discover_searches_on_query ON public.discover_searches USING btree (query);


--
-- Name: index_discover_searches_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_discover_searches_on_user_id ON public.discover_searches USING btree (user_id);


--
-- Name: index_dispute_evidences_on_dispute_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_dispute_evidences_on_dispute_id ON public.dispute_evidences USING btree (dispute_id);


--
-- Name: index_dispute_evidences_on_resolved_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_dispute_evidences_on_resolved_at ON public.dispute_evidences USING btree (resolved_at);


--
-- Name: index_disputes_on_charge_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_disputes_on_charge_id ON public.disputes USING btree (charge_id);


--
-- Name: index_disputes_on_purchase_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_disputes_on_purchase_id ON public.disputes USING btree (purchase_id);


--
-- Name: index_disputes_on_seller_id_and_event_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_disputes_on_seller_id_and_event_created_at ON public.disputes USING btree (seller_id, event_created_at);


--
-- Name: index_disputes_on_seller_id_and_lost_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_disputes_on_seller_id_and_lost_at ON public.disputes USING btree (seller_id, lost_at);


--
-- Name: index_disputes_on_seller_id_and_won_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_disputes_on_seller_id_and_won_at ON public.disputes USING btree (seller_id, won_at);


--
-- Name: index_disputes_on_service_charge_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_disputes_on_service_charge_id ON public.disputes USING btree (service_charge_id);


--
-- Name: index_dropbox_files_on_link_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_dropbox_files_on_link_id ON public.dropbox_files USING btree (link_id);


--
-- Name: index_dropbox_files_on_product_file_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_dropbox_files_on_product_file_id ON public.dropbox_files USING btree (product_file_id);


--
-- Name: index_dropbox_files_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_dropbox_files_on_user_id ON public.dropbox_files USING btree (user_id);


--
-- Name: index_email_info_charges_on_charge_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_email_info_charges_on_charge_id ON public.email_info_charges USING btree (charge_id);


--
-- Name: index_email_info_charges_on_email_info_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_email_info_charges_on_email_info_id ON public.email_info_charges USING btree (email_info_id);


--
-- Name: index_email_infos_on_installment_id_and_purchase_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_email_infos_on_installment_id_and_purchase_id ON public.email_infos USING btree (installment_id, purchase_id);


--
-- Name: index_email_infos_on_purchase_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_email_infos_on_purchase_id ON public.email_infos USING btree (purchase_id);


--
-- Name: index_events_on_browser_guid; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_events_on_browser_guid ON public.events USING btree (browser_guid);


--
-- Name: index_events_on_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_events_on_created_at ON public.events USING btree (created_at);


--
-- Name: index_events_on_event_name_and_link_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_events_on_event_name_and_link_id ON public.events USING btree (event_name, link_id, created_at);


--
-- Name: index_events_on_ip_address; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_events_on_ip_address ON public.events USING btree (ip_address);


--
-- Name: index_events_on_link_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_events_on_link_id ON public.events USING btree (link_id);


--
-- Name: index_events_on_purchase_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_events_on_purchase_id ON public.events USING btree (purchase_id);


--
-- Name: index_events_on_service_charge_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_events_on_service_charge_id ON public.events USING btree (service_charge_id);


--
-- Name: index_events_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_events_on_user_id ON public.events USING btree (user_id);


--
-- Name: index_events_on_visit_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_events_on_visit_id ON public.events USING btree (visit_id);


--
-- Name: index_followers_on_email_and_followed_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_followers_on_email_and_followed_id ON public.followers USING btree (email, followed_id);


--
-- Name: index_followers_on_followed_id_and_confirmed_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_followers_on_followed_id_and_confirmed_at ON public.followers USING btree (followed_id, confirmed_at);


--
-- Name: index_followers_on_followed_id_and_email; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_followers_on_followed_id_and_email ON public.followers USING btree (followed_id, email);


--
-- Name: index_friendly_id_slugs_on_slug_and_sluggable_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_friendly_id_slugs_on_slug_and_sluggable_type ON public.friendly_id_slugs USING btree (slug, sluggable_type);


--
-- Name: index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope ON public.friendly_id_slugs USING btree (slug, sluggable_type, scope);


--
-- Name: index_friendly_id_slugs_on_sluggable_type_and_sluggable_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_friendly_id_slugs_on_sluggable_type_and_sluggable_id ON public.friendly_id_slugs USING btree (sluggable_type, sluggable_id);


--
-- Name: index_gifts_on_giftee_email; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_gifts_on_giftee_email ON public.gifts USING btree (giftee_email);


--
-- Name: index_gifts_on_giftee_purchase_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_gifts_on_giftee_purchase_id ON public.gifts USING btree (giftee_purchase_id);


--
-- Name: index_gifts_on_gifter_email; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_gifts_on_gifter_email ON public.gifts USING btree (gifter_email);


--
-- Name: index_gifts_on_gifter_purchase_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_gifts_on_gifter_purchase_id ON public.gifts USING btree (gifter_purchase_id);


--
-- Name: index_gumroad_daily_analytics_on_period_ended_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_gumroad_daily_analytics_on_period_ended_at ON public.gumroad_daily_analytics USING btree (period_ended_at);


--
-- Name: index_imported_customers_on_email; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_imported_customers_on_email ON public.imported_customers USING btree (email);


--
-- Name: index_imported_customers_on_importing_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_imported_customers_on_importing_user_id ON public.imported_customers USING btree (importing_user_id);


--
-- Name: index_imported_customers_on_link_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_imported_customers_on_link_id ON public.imported_customers USING btree (link_id);


--
-- Name: index_imported_customers_on_link_id_and_purchase_date; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_imported_customers_on_link_id_and_purchase_date ON public.imported_customers USING btree (link_id, purchase_date);


--
-- Name: index_installment_events_on_event_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_installment_events_on_event_id ON public.installment_events USING btree (event_id);


--
-- Name: index_installment_events_on_installment_id_and_event_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_installment_events_on_installment_id_and_event_id ON public.installment_events USING btree (installment_id, event_id);


--
-- Name: index_installment_rules_on_installment_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_installment_rules_on_installment_id ON public.installment_rules USING btree (installment_id);


--
-- Name: index_installments_on_base_variant_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_installments_on_base_variant_id ON public.installments USING btree (base_variant_id);


--
-- Name: index_installments_on_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_installments_on_created_at ON public.installments USING btree (created_at);


--
-- Name: index_installments_on_link_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_installments_on_link_id ON public.installments USING btree (link_id);


--
-- Name: index_installments_on_seller_id_and_link_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_installments_on_seller_id_and_link_id ON public.installments USING btree (seller_id, link_id);


--
-- Name: index_installments_on_slug; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_installments_on_slug ON public.installments USING btree (slug);


--
-- Name: index_installments_on_workflow_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_installments_on_workflow_id ON public.installments USING btree (workflow_id);


--
-- Name: index_invites_on_receiver_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_invites_on_receiver_id ON public.invites USING btree (receiver_id);


--
-- Name: index_invites_on_sender_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_invites_on_sender_id ON public.invites USING btree (sender_id);


--
-- Name: index_large_sellers_on_updated_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_large_sellers_on_updated_at ON public.large_sellers USING btree (updated_at);


--
-- Name: index_large_sellers_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_large_sellers_on_user_id ON public.large_sellers USING btree (user_id);


--
-- Name: index_larger_product_id_and_sales_count; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_larger_product_id_and_sales_count ON public.sales_related_products_infos USING btree (larger_product_id, sales_count);


--
-- Name: index_last_read_community_chat_messages_on_community_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_last_read_community_chat_messages_on_community_id ON public.last_read_community_chat_messages USING btree (community_id);


--
-- Name: index_last_read_community_chat_messages_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_last_read_community_chat_messages_on_user_id ON public.last_read_community_chat_messages USING btree (user_id);


--
-- Name: index_legacy_permalinks_on_permalink; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_legacy_permalinks_on_permalink ON public.legacy_permalinks USING btree (permalink);


--
-- Name: index_legacy_permalinks_on_product_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_legacy_permalinks_on_product_id ON public.legacy_permalinks USING btree (product_id);


--
-- Name: index_licenses_on_imported_customer_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_licenses_on_imported_customer_id ON public.licenses USING btree (imported_customer_id);


--
-- Name: index_licenses_on_link_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_licenses_on_link_id ON public.licenses USING btree (link_id);


--
-- Name: index_licenses_on_purchase_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_licenses_on_purchase_id ON public.licenses USING btree (purchase_id);


--
-- Name: index_licenses_on_serial; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_licenses_on_serial ON public.licenses USING btree (serial);


--
-- Name: index_links_on_banned_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_links_on_banned_at ON public.links USING btree (banned_at);


--
-- Name: index_links_on_custom_permalink; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_links_on_custom_permalink ON public.links USING btree (custom_permalink);


--
-- Name: index_links_on_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_links_on_deleted_at ON public.links USING btree (deleted_at);


--
-- Name: index_links_on_showcaseable; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_links_on_showcaseable ON public.links USING btree (showcaseable);


--
-- Name: index_links_on_taxonomy_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_links_on_taxonomy_id ON public.links USING btree (taxonomy_id);


--
-- Name: index_links_on_unique_permalink; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_links_on_unique_permalink ON public.links USING btree (unique_permalink);


--
-- Name: index_links_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_links_on_user_id ON public.links USING btree (user_id);


--
-- Name: index_links_on_user_id_and_updated_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_links_on_user_id_and_updated_at ON public.links USING btree (user_id, updated_at);


--
-- Name: index_media_locations_on_product_file_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_media_locations_on_product_file_id ON public.media_locations USING btree (product_file_id);


--
-- Name: index_media_locations_on_product_id_and_updated_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_media_locations_on_product_id_and_updated_at ON public.media_locations USING btree (product_id, updated_at);


--
-- Name: index_media_locations_on_purchase_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_media_locations_on_purchase_id ON public.media_locations USING btree (purchase_id);


--
-- Name: index_merchant_accounts_on_charge_processor_merchant_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_merchant_accounts_on_charge_processor_merchant_id ON public.merchant_accounts USING btree (charge_processor_merchant_id);


--
-- Name: index_merchant_accounts_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_merchant_accounts_on_user_id ON public.merchant_accounts USING btree (user_id);


--
-- Name: index_oauth_access_grants_on_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_oauth_access_grants_on_created_at ON public.oauth_access_grants USING btree (created_at);


--
-- Name: index_oauth_access_grants_on_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_oauth_access_grants_on_token ON public.oauth_access_grants USING btree (token);


--
-- Name: index_oauth_access_tokens_on_refresh_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_oauth_access_tokens_on_refresh_token ON public.oauth_access_tokens USING btree (refresh_token);


--
-- Name: index_oauth_access_tokens_on_resource_owner_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_oauth_access_tokens_on_resource_owner_id ON public.oauth_access_tokens USING btree (resource_owner_id);


--
-- Name: index_oauth_access_tokens_on_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_oauth_access_tokens_on_token ON public.oauth_access_tokens USING btree (token);


--
-- Name: index_oauth_applications_on_owner_id_and_owner_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_oauth_applications_on_owner_id_and_owner_type ON public.oauth_applications USING btree (owner_id, owner_type);


--
-- Name: index_oauth_applications_on_uid; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_oauth_applications_on_uid ON public.oauth_applications USING btree (uid);


--
-- Name: index_offer_codes_on_code_and_link_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_offer_codes_on_code_and_link_id ON public.offer_codes USING btree (code, link_id);


--
-- Name: index_offer_codes_on_link_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_offer_codes_on_link_id ON public.offer_codes USING btree (link_id);


--
-- Name: index_offer_codes_on_name_and_link_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_offer_codes_on_name_and_link_id ON public.offer_codes USING btree (name, link_id);


--
-- Name: index_offer_codes_on_universal; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_offer_codes_on_universal ON public.offer_codes USING btree (universal);


--
-- Name: index_offer_codes_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_offer_codes_on_user_id ON public.offer_codes USING btree (user_id);


--
-- Name: index_offer_codes_products_on_offer_code_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_offer_codes_products_on_offer_code_id ON public.offer_codes_products USING btree (offer_code_id);


--
-- Name: index_offer_codes_products_on_product_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_offer_codes_products_on_product_id ON public.offer_codes_products USING btree (product_id);


--
-- Name: index_on_user_merchant_account_date; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_on_user_merchant_account_date ON public.balances USING btree (user_id, merchant_account_id, date);


--
-- Name: index_order_purchases_on_order_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_order_purchases_on_order_id ON public.order_purchases USING btree (order_id);


--
-- Name: index_order_purchases_on_purchase_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_order_purchases_on_purchase_id ON public.order_purchases USING btree (purchase_id);


--
-- Name: index_orders_on_purchaser_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_orders_on_purchaser_id ON public.orders USING btree (purchaser_id);


--
-- Name: index_payment_options_on_price_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_payment_options_on_price_id ON public.payment_options USING btree (price_id);


--
-- Name: index_payment_options_on_product_installment_plan_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_payment_options_on_product_installment_plan_id ON public.payment_options USING btree (product_installment_plan_id);


--
-- Name: index_payment_options_on_subscription_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_payment_options_on_subscription_id ON public.payment_options USING btree (subscription_id);


--
-- Name: index_payments_balances_on_balance_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_payments_balances_on_balance_id ON public.payments_balances USING btree (balance_id);


--
-- Name: index_payments_balances_on_payment_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_payments_balances_on_payment_id ON public.payments_balances USING btree (payment_id);


--
-- Name: index_payments_on_stripe_transfer_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_payments_on_stripe_transfer_id ON public.payments USING btree (stripe_transfer_id);


--
-- Name: index_payments_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_payments_on_user_id ON public.payments USING btree (user_id);


--
-- Name: index_post_email_blasts_on_post_id_and_requested_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_post_email_blasts_on_post_id_and_requested_at ON public.post_email_blasts USING btree (post_id, requested_at);


--
-- Name: index_post_email_blasts_on_requested_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_post_email_blasts_on_requested_at ON public.post_email_blasts USING btree (requested_at);


--
-- Name: index_post_email_blasts_on_seller_id_and_requested_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_post_email_blasts_on_seller_id_and_requested_at ON public.post_email_blasts USING btree (seller_id, requested_at);


--
-- Name: index_preorder_links_on_link_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_preorder_links_on_link_id ON public.preorder_links USING btree (link_id);


--
-- Name: index_preorders_on_preorder_link_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_preorders_on_preorder_link_id ON public.preorders USING btree (preorder_link_id);


--
-- Name: index_preorders_on_purchaser_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_preorders_on_purchaser_id ON public.preorders USING btree (purchaser_id);


--
-- Name: index_preorders_on_seller_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_preorders_on_seller_id ON public.preorders USING btree (seller_id);


--
-- Name: index_prices_on_link_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_prices_on_link_id ON public.prices USING btree (link_id);


--
-- Name: index_prices_on_variant_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_prices_on_variant_id ON public.prices USING btree (variant_id);


--
-- Name: index_processor_payment_intents_on_intent_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_processor_payment_intents_on_intent_id ON public.processor_payment_intents USING btree (intent_id);


--
-- Name: index_processor_payment_intents_on_purchase_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_processor_payment_intents_on_purchase_id ON public.processor_payment_intents USING btree (purchase_id);


--
-- Name: index_product_cached_values_on_expired; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_product_cached_values_on_expired ON public.product_cached_values USING btree (expired);


--
-- Name: index_product_cached_values_on_product_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_product_cached_values_on_product_id ON public.product_cached_values USING btree (product_id);


--
-- Name: index_product_files_archives_on_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_product_files_archives_on_deleted_at ON public.product_files_archives USING btree (deleted_at);


--
-- Name: index_product_files_archives_on_deleted_from_cdn_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_product_files_archives_on_deleted_from_cdn_at ON public.product_files_archives USING btree (deleted_from_cdn_at);


--
-- Name: index_product_files_archives_on_folder_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_product_files_archives_on_folder_id ON public.product_files_archives USING btree (folder_id);


--
-- Name: index_product_files_archives_on_installment_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_product_files_archives_on_installment_id ON public.product_files_archives USING btree (installment_id);


--
-- Name: index_product_files_archives_on_link_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_product_files_archives_on_link_id ON public.product_files_archives USING btree (link_id);


--
-- Name: index_product_files_archives_on_variant_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_product_files_archives_on_variant_id ON public.product_files_archives USING btree (variant_id);


--
-- Name: index_product_files_on_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_product_files_on_deleted_at ON public.product_files USING btree (deleted_at);


--
-- Name: index_product_files_on_deleted_from_cdn_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_product_files_on_deleted_from_cdn_at ON public.product_files USING btree (deleted_from_cdn_at);


--
-- Name: index_product_files_on_installment_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_product_files_on_installment_id ON public.product_files USING btree (installment_id);


--
-- Name: index_product_files_on_link_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_product_files_on_link_id ON public.product_files USING btree (link_id);


--
-- Name: index_product_files_on_url; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_product_files_on_url ON public.product_files USING btree (url);


--
-- Name: index_product_folders_on_product_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_product_folders_on_product_id ON public.product_folders USING btree (product_id);


--
-- Name: index_product_installment_plans_on_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_product_installment_plans_on_deleted_at ON public.product_installment_plans USING btree (deleted_at);


--
-- Name: index_product_installment_plans_on_link_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_product_installment_plans_on_link_id ON public.product_installment_plans USING btree (link_id);


--
-- Name: index_product_integrations_on_integration_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_product_integrations_on_integration_id ON public.product_integrations USING btree (integration_id);


--
-- Name: index_product_integrations_on_product_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_product_integrations_on_product_id ON public.product_integrations USING btree (product_id);


--
-- Name: index_product_review_responses_on_product_review_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_product_review_responses_on_product_review_id ON public.product_review_responses USING btree (product_review_id);


--
-- Name: index_product_review_responses_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_product_review_responses_on_user_id ON public.product_review_responses USING btree (user_id);


--
-- Name: index_product_review_stats_on_link_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_product_review_stats_on_link_id ON public.product_review_stats USING btree (link_id);


--
-- Name: index_product_review_videos_on_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_product_review_videos_on_deleted_at ON public.product_review_videos USING btree (deleted_at);


--
-- Name: index_product_review_videos_on_product_review_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_product_review_videos_on_product_review_id ON public.product_review_videos USING btree (product_review_id);


--
-- Name: index_product_reviews_on_purchase_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_product_reviews_on_purchase_id ON public.product_reviews USING btree (purchase_id);


--
-- Name: index_product_taggings_on_product_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_product_taggings_on_product_id ON public.product_taggings USING btree (product_id);


--
-- Name: index_product_taggings_on_tag_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_product_taggings_on_tag_id ON public.product_taggings USING btree (tag_id);


--
-- Name: index_public_files_on_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_public_files_on_deleted_at ON public.public_files USING btree (deleted_at);


--
-- Name: index_public_files_on_file_group; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_public_files_on_file_group ON public.public_files USING btree (file_group);


--
-- Name: index_public_files_on_file_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_public_files_on_file_type ON public.public_files USING btree (file_type);


--
-- Name: index_public_files_on_public_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_public_files_on_public_id ON public.public_files USING btree (public_id);


--
-- Name: index_public_files_on_resource; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_public_files_on_resource ON public.public_files USING btree (resource_type, resource_id);


--
-- Name: index_public_files_on_scheduled_for_deletion_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_public_files_on_scheduled_for_deletion_at ON public.public_files USING btree (scheduled_for_deletion_at);


--
-- Name: index_public_files_on_seller_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_public_files_on_seller_id ON public.public_files USING btree (seller_id);


--
-- Name: index_purchase_chargeback_balance_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_purchase_chargeback_balance_id ON public.purchases USING btree (purchase_chargeback_balance_id);


--
-- Name: index_purchase_custom_fields_on_custom_field_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_purchase_custom_fields_on_custom_field_id ON public.purchase_custom_fields USING btree (custom_field_id);


--
-- Name: index_purchase_custom_fields_on_purchase_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_purchase_custom_fields_on_purchase_id ON public.purchase_custom_fields USING btree (purchase_id);


--
-- Name: index_purchase_early_fraud_warnings_on_charge_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_purchase_early_fraud_warnings_on_charge_id ON public.purchase_early_fraud_warnings USING btree (charge_id);


--
-- Name: index_purchase_early_fraud_warnings_on_processor_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_purchase_early_fraud_warnings_on_processor_id ON public.purchase_early_fraud_warnings USING btree (processor_id);


--
-- Name: index_purchase_early_fraud_warnings_on_purchase_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_purchase_early_fraud_warnings_on_purchase_id ON public.purchase_early_fraud_warnings USING btree (purchase_id);


--
-- Name: index_purchase_integrations_on_integration_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_purchase_integrations_on_integration_id ON public.purchase_integrations USING btree (integration_id);


--
-- Name: index_purchase_integrations_on_purchase_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_purchase_integrations_on_purchase_id ON public.purchase_integrations USING btree (purchase_id);


--
-- Name: index_purchase_offer_code_discounts_on_offer_code_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_purchase_offer_code_discounts_on_offer_code_id ON public.purchase_offer_code_discounts USING btree (offer_code_id);


--
-- Name: index_purchase_offer_code_discounts_on_purchase_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_purchase_offer_code_discounts_on_purchase_id ON public.purchase_offer_code_discounts USING btree (purchase_id);


--
-- Name: index_purchase_refund_balance_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_purchase_refund_balance_id ON public.purchases USING btree (purchase_refund_balance_id);


--
-- Name: index_purchase_refund_policies_on_purchase_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_purchase_refund_policies_on_purchase_id ON public.purchase_refund_policies USING btree (purchase_id);


--
-- Name: index_purchase_sales_tax_infos_on_purchase_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_purchase_sales_tax_infos_on_purchase_id ON public.purchase_sales_tax_infos USING btree (purchase_id);


--
-- Name: index_purchase_success_balance_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_purchase_success_balance_id ON public.purchases USING btree (purchase_success_balance_id);


--
-- Name: index_purchase_taxjar_infos_on_purchase_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_purchase_taxjar_infos_on_purchase_id ON public.purchase_taxjar_infos USING btree (purchase_id);


--
-- Name: index_purchase_wallet_types_on_purchase_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_purchase_wallet_types_on_purchase_id ON public.purchase_wallet_types USING btree (purchase_id);


--
-- Name: index_purchase_wallet_types_on_wallet_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_purchase_wallet_types_on_wallet_type ON public.purchase_wallet_types USING btree (wallet_type);


--
-- Name: index_purchases_on_affiliate_id_and_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_purchases_on_affiliate_id_and_created_at ON public.purchases USING btree (affiliate_id, created_at);


--
-- Name: index_purchases_on_browser_guid; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_purchases_on_browser_guid ON public.purchases USING btree (browser_guid);


--
-- Name: index_purchases_on_card_type_visual_date_fingerprint; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_purchases_on_card_type_visual_date_fingerprint ON public.purchases USING btree (card_type, card_visual, created_at, stripe_fingerprint);


--
-- Name: index_purchases_on_card_type_visual_fingerprint; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_purchases_on_card_type_visual_fingerprint ON public.purchases USING btree (card_type, card_visual, stripe_fingerprint);


--
-- Name: index_purchases_on_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_purchases_on_created_at ON public.purchases USING btree (created_at);


--
-- Name: index_purchases_on_email_long; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_purchases_on_email_long ON public.purchases USING btree (email);


--
-- Name: index_purchases_on_full_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_purchases_on_full_name ON public.purchases USING btree (full_name);


--
-- Name: index_purchases_on_ip_address; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_purchases_on_ip_address ON public.purchases USING btree (ip_address);


--
-- Name: index_purchases_on_link_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_purchases_on_link_id ON public.purchases USING btree (link_id);


--
-- Name: index_purchases_on_link_id_and_purchase_state_and_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_purchases_on_link_id_and_purchase_state_and_created_at ON public.purchases USING btree (link_id, purchase_state, created_at);


--
-- Name: index_purchases_on_offer_code_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_purchases_on_offer_code_id ON public.purchases USING btree (offer_code_id);


--
-- Name: index_purchases_on_paypal_order_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_purchases_on_paypal_order_id ON public.purchases USING btree (paypal_order_id);


--
-- Name: index_purchases_on_preorder_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_purchases_on_preorder_id ON public.purchases USING btree (preorder_id);


--
-- Name: index_purchases_on_purchase_state_and_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_purchases_on_purchase_state_and_created_at ON public.purchases USING btree (purchase_state, created_at);


--
-- Name: index_purchases_on_purchaser_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_purchases_on_purchaser_id ON public.purchases USING btree (purchaser_id);


--
-- Name: index_purchases_on_rental_expired; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_purchases_on_rental_expired ON public.purchases USING btree (rental_expired);


--
-- Name: index_purchases_on_seller_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_purchases_on_seller_id ON public.purchases USING btree (seller_id);


--
-- Name: index_purchases_on_seller_id_and_chargeback_date; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_purchases_on_seller_id_and_chargeback_date ON public.purchases USING btree (seller_id, chargeback_date);


--
-- Name: index_purchases_on_seller_id_and_succeeded_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_purchases_on_seller_id_and_succeeded_at ON public.purchases USING btree (seller_id, succeeded_at);


--
-- Name: index_purchases_on_stripe_fingerprint; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_purchases_on_stripe_fingerprint ON public.purchases USING btree (stripe_fingerprint);


--
-- Name: index_purchases_on_stripe_transaction_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_purchases_on_stripe_transaction_id ON public.purchases USING btree (stripe_transaction_id);


--
-- Name: index_purchases_on_subscription_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_purchases_on_subscription_id ON public.purchases USING btree (subscription_id);


--
-- Name: index_purchases_variants_on_purchase_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_purchases_variants_on_purchase_id ON public.base_variants_purchases USING btree (purchase_id);


--
-- Name: index_purchases_variants_on_variant_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_purchases_variants_on_variant_id ON public.base_variants_purchases USING btree (base_variant_id);


--
-- Name: index_purchasing_power_parity_infos_on_purchase_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_purchasing_power_parity_infos_on_purchase_id ON public.purchasing_power_parity_infos USING btree (purchase_id);


--
-- Name: index_recommended_purchase_infos_on_purchase_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_recommended_purchase_infos_on_purchase_id ON public.recommended_purchase_infos USING btree (purchase_id);


--
-- Name: index_recommended_purchase_infos_on_recommended_by_link_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_recommended_purchase_infos_on_recommended_by_link_id ON public.recommended_purchase_infos USING btree (recommended_by_link_id);


--
-- Name: index_recommended_purchase_infos_on_recommended_link_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_recommended_purchase_infos_on_recommended_link_id ON public.recommended_purchase_infos USING btree (recommended_link_id);


--
-- Name: index_recurring_services_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_recurring_services_on_user_id ON public.recurring_services USING btree (user_id);


--
-- Name: index_refund_policies_on_product_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_refund_policies_on_product_id ON public.refund_policies USING btree (product_id);


--
-- Name: index_refund_policies_on_seller_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_refund_policies_on_seller_id ON public.refund_policies USING btree (seller_id);


--
-- Name: index_refunds_on_link_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_refunds_on_link_id ON public.refunds USING btree (link_id);


--
-- Name: index_refunds_on_processor_refund_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_refunds_on_processor_refund_id ON public.refunds USING btree (processor_refund_id);


--
-- Name: index_refunds_on_purchase_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_refunds_on_purchase_id ON public.refunds USING btree (purchase_id);


--
-- Name: index_refunds_on_seller_id_and_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_refunds_on_seller_id_and_created_at ON public.refunds USING btree (seller_id, created_at);


--
-- Name: index_resource_subscriptions_on_oauth_application_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_resource_subscriptions_on_oauth_application_id ON public.resource_subscriptions USING btree (oauth_application_id);


--
-- Name: index_resource_subscriptions_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_resource_subscriptions_on_user_id ON public.resource_subscriptions USING btree (user_id);


--
-- Name: index_rich_contents_on_entity_id_and_entity_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_rich_contents_on_entity_id_and_entity_type ON public.rich_contents USING btree (entity_id, entity_type);


--
-- Name: index_sales_export_chunks_on_export_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_sales_export_chunks_on_export_id ON public.sales_export_chunks USING btree (export_id);


--
-- Name: index_sales_exports_on_recipient_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_sales_exports_on_recipient_id ON public.sales_exports USING btree (recipient_id);


--
-- Name: index_self_service_affiliate_products_on_product_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_self_service_affiliate_products_on_product_id ON public.self_service_affiliate_products USING btree (product_id);


--
-- Name: index_self_service_affiliate_products_on_seller_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_self_service_affiliate_products_on_seller_id ON public.self_service_affiliate_products USING btree (seller_id);


--
-- Name: index_seller_profile_sections_on_product_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_seller_profile_sections_on_product_id ON public.seller_profile_sections USING btree (product_id);


--
-- Name: index_seller_profile_sections_on_seller_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_seller_profile_sections_on_seller_id ON public.seller_profile_sections USING btree (seller_id);


--
-- Name: index_seller_profiles_on_seller_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_seller_profiles_on_seller_id ON public.seller_profiles USING btree (seller_id);


--
-- Name: index_sent_abandoned_cart_emails_on_cart_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_sent_abandoned_cart_emails_on_cart_id ON public.sent_abandoned_cart_emails USING btree (cart_id);


--
-- Name: index_sent_abandoned_cart_emails_on_installment_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_sent_abandoned_cart_emails_on_installment_id ON public.sent_abandoned_cart_emails USING btree (installment_id);


--
-- Name: index_sent_email_infos_on_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_sent_email_infos_on_created_at ON public.sent_email_infos USING btree (created_at);


--
-- Name: index_sent_email_infos_on_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_sent_email_infos_on_key ON public.sent_email_infos USING btree (key);


--
-- Name: index_sent_post_emails_on_post_id_and_email; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_sent_post_emails_on_post_id_and_email ON public.sent_post_emails USING btree (post_id, email);


--
-- Name: index_service_charges_on_card_type_visual_date_fingerprint; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_service_charges_on_card_type_visual_date_fingerprint ON public.service_charges USING btree (card_type, card_visual, created_at, charge_processor_fingerprint);


--
-- Name: index_service_charges_on_card_type_visual_fingerprint; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_service_charges_on_card_type_visual_fingerprint ON public.service_charges USING btree (card_type, card_visual, charge_processor_fingerprint);


--
-- Name: index_service_charges_on_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_service_charges_on_created_at ON public.service_charges USING btree (created_at);


--
-- Name: index_service_charges_on_recurring_service_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_service_charges_on_recurring_service_id ON public.service_charges USING btree (recurring_service_id);


--
-- Name: index_service_charges_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_service_charges_on_user_id ON public.service_charges USING btree (user_id);


--
-- Name: index_shipments_on_purchase_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_shipments_on_purchase_id ON public.shipments USING btree (purchase_id);


--
-- Name: index_shipping_destinations_on_link_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_shipping_destinations_on_link_id ON public.shipping_destinations USING btree (link_id);


--
-- Name: index_shipping_destinations_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_shipping_destinations_on_user_id ON public.shipping_destinations USING btree (user_id);


--
-- Name: index_skus_variants_on_sku_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_skus_variants_on_sku_id ON public.skus_variants USING btree (sku_id);


--
-- Name: index_skus_variants_on_variant_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_skus_variants_on_variant_id ON public.skus_variants USING btree (variant_id);


--
-- Name: index_smaller_and_larger_product_ids; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_smaller_and_larger_product_ids ON public.sales_related_products_infos USING btree (smaller_product_id, larger_product_id);


--
-- Name: index_smaller_product_id_and_sales_count; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_smaller_product_id_and_sales_count ON public.sales_related_products_infos USING btree (smaller_product_id, sales_count);


--
-- Name: index_staff_picked_products_on_product_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_staff_picked_products_on_product_id ON public.staff_picked_products USING btree (product_id);


--
-- Name: index_stamped_pdfs_on_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_stamped_pdfs_on_created_at ON public.stamped_pdfs USING btree (created_at);


--
-- Name: index_stamped_pdfs_on_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_stamped_pdfs_on_deleted_at ON public.stamped_pdfs USING btree (deleted_at);


--
-- Name: index_stamped_pdfs_on_deleted_from_cdn_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_stamped_pdfs_on_deleted_from_cdn_at ON public.stamped_pdfs USING btree (deleted_from_cdn_at);


--
-- Name: index_stamped_pdfs_on_product_file_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_stamped_pdfs_on_product_file_id ON public.stamped_pdfs USING btree (product_file_id);


--
-- Name: index_stamped_pdfs_on_url; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_stamped_pdfs_on_url ON public.stamped_pdfs USING btree (url);


--
-- Name: index_stamped_pdfs_on_url_redirect_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_stamped_pdfs_on_url_redirect_id ON public.stamped_pdfs USING btree (url_redirect_id);


--
-- Name: index_stripe_apple_pay_domains_on_domain; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_stripe_apple_pay_domains_on_domain ON public.stripe_apple_pay_domains USING btree (domain);


--
-- Name: index_stripe_apple_pay_domains_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_stripe_apple_pay_domains_on_user_id ON public.stripe_apple_pay_domains USING btree (user_id);


--
-- Name: index_subscription_events_on_seller_id_and_occurred_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_subscription_events_on_seller_id_and_occurred_at ON public.subscription_events USING btree (seller_id, occurred_at);


--
-- Name: index_subscription_events_on_subscription_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_subscription_events_on_subscription_id ON public.subscription_events USING btree (subscription_id);


--
-- Name: index_subscription_plan_changes_on_base_variant_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_subscription_plan_changes_on_base_variant_id ON public.subscription_plan_changes USING btree (base_variant_id);


--
-- Name: index_subscription_plan_changes_on_subscription_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_subscription_plan_changes_on_subscription_id ON public.subscription_plan_changes USING btree (subscription_id);


--
-- Name: index_subscriptions_on_cancelled_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_subscriptions_on_cancelled_at ON public.subscriptions USING btree (cancelled_at);


--
-- Name: index_subscriptions_on_deactivated_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_subscriptions_on_deactivated_at ON public.subscriptions USING btree (deactivated_at);


--
-- Name: index_subscriptions_on_ended_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_subscriptions_on_ended_at ON public.subscriptions USING btree (ended_at);


--
-- Name: index_subscriptions_on_failed_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_subscriptions_on_failed_at ON public.subscriptions USING btree (failed_at);


--
-- Name: index_subscriptions_on_link_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_subscriptions_on_link_id ON public.subscriptions USING btree (link_id);


--
-- Name: index_subscriptions_on_link_id_and_flags; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_subscriptions_on_link_id_and_flags ON public.subscriptions USING btree (link_id, flags);


--
-- Name: index_subscriptions_on_seller_id_and_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_subscriptions_on_seller_id_and_created_at ON public.subscriptions USING btree (seller_id, created_at);


--
-- Name: index_subscriptions_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_subscriptions_on_user_id ON public.subscriptions USING btree (user_id);


--
-- Name: index_subtitle_files_on_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_subtitle_files_on_deleted_at ON public.subtitle_files USING btree (deleted_at);


--
-- Name: index_subtitle_files_on_product_file_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_subtitle_files_on_product_file_id ON public.subtitle_files USING btree (product_file_id);


--
-- Name: index_subtitle_files_on_url; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_subtitle_files_on_url ON public.subtitle_files USING btree (url);


--
-- Name: index_tags_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_tags_on_name ON public.tags USING btree (name);


--
-- Name: index_taxonomies_on_parent_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_taxonomies_on_parent_id ON public.taxonomies USING btree (parent_id);


--
-- Name: index_taxonomy_stats_on_taxonomy_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_taxonomy_stats_on_taxonomy_id ON public.taxonomy_stats USING btree (taxonomy_id);


--
-- Name: index_team_invitations_on_seller_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_team_invitations_on_seller_id ON public.team_invitations USING btree (seller_id);


--
-- Name: index_team_memberships_on_seller_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_team_memberships_on_seller_id ON public.team_memberships USING btree (seller_id);


--
-- Name: index_team_memberships_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_team_memberships_on_user_id ON public.team_memberships USING btree (user_id);


--
-- Name: index_third_party_analytics_on_link_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_third_party_analytics_on_link_id ON public.third_party_analytics USING btree (link_id);


--
-- Name: index_third_party_analytics_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_third_party_analytics_on_user_id ON public.third_party_analytics USING btree (user_id);


--
-- Name: index_thumbnails_on_product_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_thumbnails_on_product_id ON public.thumbnails USING btree (product_id);


--
-- Name: index_tips_on_purchase_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_tips_on_purchase_id ON public.tips USING btree (purchase_id);


--
-- Name: index_top_sellers_on_rank; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_top_sellers_on_rank ON public.top_sellers USING btree (rank);


--
-- Name: index_top_sellers_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_top_sellers_on_user_id ON public.top_sellers USING btree (user_id);


--
-- Name: index_tos_agreements_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_tos_agreements_on_user_id ON public.tos_agreements USING btree (user_id);


--
-- Name: index_transcoded_videos_on_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_transcoded_videos_on_deleted_at ON public.transcoded_videos USING btree (deleted_at);


--
-- Name: index_transcoded_videos_on_deleted_from_cdn_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_transcoded_videos_on_deleted_from_cdn_at ON public.transcoded_videos USING btree (deleted_from_cdn_at);


--
-- Name: index_transcoded_videos_on_job_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_transcoded_videos_on_job_id ON public.transcoded_videos USING btree (job_id);


--
-- Name: index_transcoded_videos_on_last_accessed_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_transcoded_videos_on_last_accessed_at ON public.transcoded_videos USING btree (last_accessed_at);


--
-- Name: index_transcoded_videos_on_link_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_transcoded_videos_on_link_id ON public.transcoded_videos USING btree (link_id);


--
-- Name: index_transcoded_videos_on_original_video_key; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_transcoded_videos_on_original_video_key ON public.transcoded_videos USING btree (original_video_key);


--
-- Name: index_transcoded_videos_on_product_file_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_transcoded_videos_on_product_file_id ON public.transcoded_videos USING btree (product_file_id);


--
-- Name: index_transcoded_videos_on_streamable_type_and_streamable_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_transcoded_videos_on_streamable_type_and_streamable_id ON public.transcoded_videos USING btree (streamable_type, streamable_id);


--
-- Name: index_transcoded_videos_on_transcoded_video_key; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_transcoded_videos_on_transcoded_video_key ON public.transcoded_videos USING btree (transcoded_video_key);


--
-- Name: index_upsell_purchases_on_purchase_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_upsell_purchases_on_purchase_id ON public.upsell_purchases USING btree (purchase_id);


--
-- Name: index_upsell_purchases_on_selected_product_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_upsell_purchases_on_selected_product_id ON public.upsell_purchases USING btree (selected_product_id);


--
-- Name: index_upsell_purchases_on_upsell_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_upsell_purchases_on_upsell_id ON public.upsell_purchases USING btree (upsell_id);


--
-- Name: index_upsell_purchases_on_upsell_variant_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_upsell_purchases_on_upsell_variant_id ON public.upsell_purchases USING btree (upsell_variant_id);


--
-- Name: index_upsell_variants_on_offered_variant_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_upsell_variants_on_offered_variant_id ON public.upsell_variants USING btree (offered_variant_id);


--
-- Name: index_upsell_variants_on_selected_variant_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_upsell_variants_on_selected_variant_id ON public.upsell_variants USING btree (selected_variant_id);


--
-- Name: index_upsell_variants_on_upsell_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_upsell_variants_on_upsell_id ON public.upsell_variants USING btree (upsell_id);


--
-- Name: index_upsells_on_offer_code_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_upsells_on_offer_code_id ON public.upsells USING btree (offer_code_id);


--
-- Name: index_upsells_on_offered_product_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_upsells_on_offered_product_id ON public.upsells USING btree (product_id);


--
-- Name: index_upsells_on_offered_variant_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_upsells_on_offered_variant_id ON public.upsells USING btree (variant_id);


--
-- Name: index_upsells_on_seller_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_upsells_on_seller_id ON public.upsells USING btree (seller_id);


--
-- Name: index_upsells_selected_products_on_product_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_upsells_selected_products_on_product_id ON public.upsells_selected_products USING btree (selected_product_id);


--
-- Name: index_upsells_selected_products_on_upsell_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_upsells_selected_products_on_upsell_id ON public.upsells_selected_products USING btree (upsell_id);


--
-- Name: index_url_redirects_on_imported_customer_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_url_redirects_on_imported_customer_id ON public.url_redirects USING btree (imported_customer_id);


--
-- Name: index_url_redirects_on_installment_id_and_purchase_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_url_redirects_on_installment_id_and_purchase_id ON public.url_redirects USING btree (installment_id, purchase_id);


--
-- Name: index_url_redirects_on_installment_id_and_subscription_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_url_redirects_on_installment_id_and_subscription_id ON public.url_redirects USING btree (installment_id, subscription_id);


--
-- Name: index_url_redirects_on_preorder_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_url_redirects_on_preorder_id ON public.url_redirects USING btree (preorder_id);


--
-- Name: index_url_redirects_on_purchase_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_url_redirects_on_purchase_id ON public.url_redirects USING btree (purchase_id);


--
-- Name: index_url_redirects_on_subscription_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_url_redirects_on_subscription_id ON public.url_redirects USING btree (subscription_id);


--
-- Name: index_url_redirects_on_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_url_redirects_on_token ON public.url_redirects USING btree (token);


--
-- Name: index_user_compliance_info_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_user_compliance_info_on_user_id ON public.user_compliance_info USING btree (user_id);


--
-- Name: index_user_compliance_info_requests_on_user_id_and_state; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_user_compliance_info_requests_on_user_id_and_state ON public.user_compliance_info_requests USING btree (user_id, state);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: index_users_on_google_uid; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_users_on_google_uid ON public.users USING btree (google_uid);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- Name: index_utm_link_driven_sales_on_purchase_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_utm_link_driven_sales_on_purchase_id ON public.utm_link_driven_sales USING btree (purchase_id);


--
-- Name: index_utm_link_driven_sales_on_utm_link_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_utm_link_driven_sales_on_utm_link_id ON public.utm_link_driven_sales USING btree (utm_link_id);


--
-- Name: index_utm_link_driven_sales_on_utm_link_visit_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_utm_link_driven_sales_on_utm_link_visit_id ON public.utm_link_driven_sales USING btree (utm_link_visit_id);


--
-- Name: index_utm_link_visits_on_browser_guid; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_utm_link_visits_on_browser_guid ON public.utm_link_visits USING btree (browser_guid);


--
-- Name: index_utm_link_visits_on_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_utm_link_visits_on_created_at ON public.utm_link_visits USING btree (created_at);


--
-- Name: index_utm_link_visits_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_utm_link_visits_on_user_id ON public.utm_link_visits USING btree (user_id);


--
-- Name: index_utm_link_visits_on_utm_link_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_utm_link_visits_on_utm_link_id ON public.utm_link_visits USING btree (utm_link_id);


--
-- Name: index_utm_links_on_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_utm_links_on_deleted_at ON public.utm_links USING btree (deleted_at);


--
-- Name: index_utm_links_on_permalink; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_utm_links_on_permalink ON public.utm_links USING btree (permalink);


--
-- Name: index_utm_links_on_seller_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_utm_links_on_seller_id ON public.utm_links USING btree (seller_id);


--
-- Name: index_utm_links_on_utm_campaign; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_utm_links_on_utm_campaign ON public.utm_links USING btree (utm_campaign);


--
-- Name: index_utm_links_on_utm_fields_and_target_resource; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_utm_links_on_utm_fields_and_target_resource ON public.utm_links USING btree (seller_id, utm_source, utm_medium, utm_campaign, utm_term, utm_content, target_resource_type, target_resource_id);


--
-- Name: index_variant_categories_on_link_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_variant_categories_on_link_id ON public.variant_categories USING btree (link_id);


--
-- Name: index_variants_on_variant_category_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_variants_on_variant_category_id ON public.base_variants USING btree (variant_category_id);


--
-- Name: index_versions_on_item_type_and_item_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_versions_on_item_type_and_item_id ON public.versions USING btree (item_type, item_id);


--
-- Name: index_video_files_on_record; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_video_files_on_record ON public.video_files USING btree (record_type, record_id);


--
-- Name: index_video_files_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_video_files_on_user_id ON public.video_files USING btree (user_id);


--
-- Name: index_wishlist_followers_on_follower_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_wishlist_followers_on_follower_user_id ON public.wishlist_followers USING btree (follower_user_id);


--
-- Name: index_wishlist_followers_on_wishlist_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_wishlist_followers_on_wishlist_id ON public.wishlist_followers USING btree (wishlist_id);


--
-- Name: index_wishlist_products_on_product_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_wishlist_products_on_product_id ON public.wishlist_products USING btree (product_id);


--
-- Name: index_wishlist_products_on_variant_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_wishlist_products_on_variant_id ON public.wishlist_products USING btree (variant_id);


--
-- Name: index_wishlist_products_on_wishlist_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_wishlist_products_on_wishlist_id ON public.wishlist_products USING btree (wishlist_id);


--
-- Name: index_wishlists_on_recommendable_and_recent_follower_count; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_wishlists_on_recommendable_and_recent_follower_count ON public.wishlists USING btree (recommendable, recent_follower_count);


--
-- Name: index_wishlists_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_wishlists_on_user_id ON public.wishlists USING btree (user_id);


--
-- Name: index_workflows_on_base_variant_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_workflows_on_base_variant_id ON public.workflows USING btree (base_variant_id);


--
-- Name: index_workflows_on_link_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_workflows_on_link_id ON public.workflows USING btree (link_id);


--
-- Name: index_workflows_on_seller_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_workflows_on_seller_id ON public.workflows USING btree (seller_id);


--
-- Name: index_workflows_on_workflow_type_and_published_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_workflows_on_workflow_type_and_published_at ON public.workflows USING btree (workflow_type, published_at);


--
-- Name: index_yearly_stats_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_yearly_stats_on_user_id ON public.yearly_stats USING btree (user_id);


--
-- Name: index_zip_tax_rates_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_zip_tax_rates_on_user_id ON public.zip_tax_rates USING btree (user_id);


--
-- Name: index_zip_tax_rates_on_zip_code; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_zip_tax_rates_on_zip_code ON public.zip_tax_rates USING btree (zip_code);


--
-- Name: taxonomy_anc_desc_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX taxonomy_anc_desc_idx ON public.taxonomy_hierarchies USING btree (ancestor_id, descendant_id, generations);


--
-- Name: taxonomy_desc_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX taxonomy_desc_idx ON public.taxonomy_hierarchies USING btree (descendant_id);


--
-- PostgreSQL database dump complete
--

