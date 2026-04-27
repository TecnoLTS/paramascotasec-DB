--
-- PostgreSQL database dump
--

\restrict salPJqGkoSfOQEhqOP3pTa1ruKfCiMniFYbZhhQVb7aK5s5SfYXfkVJdnCvX07u

-- Dumped from database version 16.13
-- Dumped by pg_dump version 16.13

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

ALTER TABLE IF EXISTS ONLY public."PosMovement" DROP CONSTRAINT IF EXISTS pos_movement_shift_fk;
ALTER TABLE IF EXISTS ONLY public."Variation" DROP CONSTRAINT IF EXISTS "Variation_product_id_fkey";
ALTER TABLE IF EXISTS ONLY public."Order" DROP CONSTRAINT IF EXISTS "Order_user_id_fkey";
ALTER TABLE IF EXISTS ONLY public."OrderItem" DROP CONSTRAINT IF EXISTS "OrderItem_product_id_fkey";
ALTER TABLE IF EXISTS ONLY public."OrderItem" DROP CONSTRAINT IF EXISTS "OrderItem_order_id_fkey";
ALTER TABLE IF EXISTS ONLY public."Image" DROP CONSTRAINT IF EXISTS "Image_product_id_fkey";
DROP INDEX IF EXISTS public.idx_quotation_tenant_status;
DROP INDEX IF EXISTS public.idx_quotation_tenant_created;
DROP INDEX IF EXISTS public.idx_quotation_tenant_converted_order;
DROP INDEX IF EXISTS public.idx_pos_shift_tenant_status;
DROP INDEX IF EXISTS public.idx_pos_shift_tenant_opened_at;
DROP INDEX IF EXISTS public.idx_pos_movement_shift;
DROP INDEX IF EXISTS public."Variation_product_id_idx";
DROP INDEX IF EXISTS public."User_tenant_id_idx";
DROP INDEX IF EXISTS public."User_tenant_email_uidx";
DROP INDEX IF EXISTS public."User_tenant_email_idx";
DROP INDEX IF EXISTS public."User_email_key";
DROP INDEX IF EXISTS public."Setting_tenant_id_idx";
DROP INDEX IF EXISTS public."Quotation_tenant_status_idx";
DROP INDEX IF EXISTS public."Quotation_tenant_created_idx";
DROP INDEX IF EXISTS public."Quotation_tenant_converted_order_idx";
DROP INDEX IF EXISTS public."PurchaseInvoice_tenant_issued_idx";
DROP INDEX IF EXISTS public."PurchaseInvoice_tenant_external_key_uidx";
DROP INDEX IF EXISTS public."PurchaseInvoiceItem_tenant_product_idx";
DROP INDEX IF EXISTS public."PurchaseInvoiceItem_tenant_invoice_idx";
DROP INDEX IF EXISTS public."Product_tenant_slug_uidx";
DROP INDEX IF EXISTS public."Product_tenant_slug_idx";
DROP INDEX IF EXISTS public."Product_tenant_published_idx";
DROP INDEX IF EXISTS public."Product_tenant_legacy_id_idx";
DROP INDEX IF EXISTS public."Product_tenant_id_idx";
DROP INDEX IF EXISTS public."Product_tenant_created_idx";
DROP INDEX IF EXISTS public."Product_slug_key";
DROP INDEX IF EXISTS public."Product_catalog_listing_idx";
DROP INDEX IF EXISTS public."ProductReferenceCatalog_tenant_id_idx";
DROP INDEX IF EXISTS public."ProductReferenceCatalog_tenant_catalog_idx";
DROP INDEX IF EXISTS public."Order_tenant_user_idx";
DROP INDEX IF EXISTS public."Order_tenant_status_norm_idx";
DROP INDEX IF EXISTS public."Order_tenant_status_idx";
DROP INDEX IF EXISTS public."Order_tenant_id_idx";
DROP INDEX IF EXISTS public."Order_tenant_created_idx";
DROP INDEX IF EXISTS public."Order_tenant_created_active_idx";
DROP INDEX IF EXISTS public."OrderItem_product_id_idx";
DROP INDEX IF EXISTS public."OrderItem_order_id_idx";
DROP INDEX IF EXISTS public."InventoryLot_tenant_purchase_invoice_item_idx";
DROP INDEX IF EXISTS public."InventoryLot_tenant_purchase_invoice_idx";
DROP INDEX IF EXISTS public."InventoryLot_tenant_product_remaining_idx";
DROP INDEX IF EXISTS public."InventoryLot_tenant_product_received_idx";
DROP INDEX IF EXISTS public."InventoryLotAllocation_tenant_product_idx";
DROP INDEX IF EXISTS public."InventoryLotAllocation_tenant_order_item_idx";
DROP INDEX IF EXISTS public."InventoryLotAllocation_tenant_lot_idx";
DROP INDEX IF EXISTS public."Image_product_id_idx";
DROP INDEX IF EXISTS public."DiscountCode_tenant_window_idx";
DROP INDEX IF EXISTS public."DiscountCode_tenant_code_uidx";
DROP INDEX IF EXISTS public."DiscountCode_tenant_active_idx";
DROP INDEX IF EXISTS public."DiscountAudit_tenant_order_idx";
DROP INDEX IF EXISTS public."DiscountAudit_tenant_created_idx";
DROP INDEX IF EXISTS public."DiscountAudit_tenant_code_idx";
DROP INDEX IF EXISTS public."ContactMessage_tenant_status_idx";
DROP INDEX IF EXISTS public."ContactMessage_tenant_created_idx";
DROP INDEX IF EXISTS public."AuthSecurityEvent_tenant_user_idx";
DROP INDEX IF EXISTS public."AuthSecurityEvent_tenant_event_idx";
DROP INDEX IF EXISTS public."AuthSecurityEvent_tenant_email_idx";
DROP INDEX IF EXISTS public."AuthSecurityEvent_tenant_created_idx";
ALTER TABLE IF EXISTS ONLY public."Variation" DROP CONSTRAINT IF EXISTS "Variation_pkey";
ALTER TABLE IF EXISTS ONLY public."User" DROP CONSTRAINT IF EXISTS "User_pkey";
ALTER TABLE IF EXISTS ONLY public."Tenant" DROP CONSTRAINT IF EXISTS "Tenant_pkey";
ALTER TABLE IF EXISTS ONLY public."Setting" DROP CONSTRAINT IF EXISTS "Setting_pkey";
ALTER TABLE IF EXISTS ONLY public."Quotation" DROP CONSTRAINT IF EXISTS "Quotation_pkey";
ALTER TABLE IF EXISTS ONLY public."PurchaseInvoice" DROP CONSTRAINT IF EXISTS "PurchaseInvoice_pkey";
ALTER TABLE IF EXISTS ONLY public."PurchaseInvoiceItem" DROP CONSTRAINT IF EXISTS "PurchaseInvoiceItem_pkey";
ALTER TABLE IF EXISTS ONLY public."Product" DROP CONSTRAINT IF EXISTS "Product_pkey";
ALTER TABLE IF EXISTS ONLY public."ProductReferenceCatalog" DROP CONSTRAINT IF EXISTS "ProductReferenceCatalog_pkey";
ALTER TABLE IF EXISTS ONLY public."PosShift" DROP CONSTRAINT IF EXISTS "PosShift_pkey";
ALTER TABLE IF EXISTS ONLY public."PosMovement" DROP CONSTRAINT IF EXISTS "PosMovement_pkey";
ALTER TABLE IF EXISTS ONLY public."Order" DROP CONSTRAINT IF EXISTS "Order_pkey";
ALTER TABLE IF EXISTS ONLY public."OrderItem" DROP CONSTRAINT IF EXISTS "OrderItem_pkey";
ALTER TABLE IF EXISTS ONLY public."InventoryLot" DROP CONSTRAINT IF EXISTS "InventoryLot_pkey";
ALTER TABLE IF EXISTS ONLY public."InventoryLotAllocation" DROP CONSTRAINT IF EXISTS "InventoryLotAllocation_pkey";
ALTER TABLE IF EXISTS ONLY public."Image" DROP CONSTRAINT IF EXISTS "Image_pkey";
ALTER TABLE IF EXISTS ONLY public."DiscountCode" DROP CONSTRAINT IF EXISTS "DiscountCode_pkey";
ALTER TABLE IF EXISTS ONLY public."DiscountAudit" DROP CONSTRAINT IF EXISTS "DiscountAudit_pkey";
ALTER TABLE IF EXISTS ONLY public."ContactMessage" DROP CONSTRAINT IF EXISTS "ContactMessage_pkey";
ALTER TABLE IF EXISTS ONLY public."AuthSecurityEvent" DROP CONSTRAINT IF EXISTS "AuthSecurityEvent_pkey";
ALTER TABLE IF EXISTS public."PosMovement" ALTER COLUMN id DROP DEFAULT;
DROP TABLE IF EXISTS public."Variation";
DROP TABLE IF EXISTS public."User";
DROP TABLE IF EXISTS public."Tenant";
DROP TABLE IF EXISTS public."Setting";
DROP TABLE IF EXISTS public."Quotation";
DROP TABLE IF EXISTS public."PurchaseInvoiceItem";
DROP TABLE IF EXISTS public."PurchaseInvoice";
DROP TABLE IF EXISTS public."ProductReferenceCatalog";
DROP TABLE IF EXISTS public."Product";
DROP TABLE IF EXISTS public."PosShift";
DROP SEQUENCE IF EXISTS public."PosMovement_id_seq";
DROP TABLE IF EXISTS public."PosMovement";
DROP TABLE IF EXISTS public."OrderItem";
DROP TABLE IF EXISTS public."Order";
DROP TABLE IF EXISTS public."InventoryLotAllocation";
DROP TABLE IF EXISTS public."InventoryLot";
DROP TABLE IF EXISTS public."Image";
DROP TABLE IF EXISTS public."DiscountCode";
DROP TABLE IF EXISTS public."DiscountAudit";
DROP TABLE IF EXISTS public."ContactMessage";
DROP TABLE IF EXISTS public."AuthSecurityEvent";
-- *not* dropping schema, since initdb creates it
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS '';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: AuthSecurityEvent; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."AuthSecurityEvent" (
    id text NOT NULL,
    tenant_id text NOT NULL,
    user_id text,
    email text,
    event_type text NOT NULL,
    status text DEFAULT 'info'::text NOT NULL,
    ip_address text,
    user_agent text,
    metadata jsonb DEFAULT '{}'::jsonb,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public."AuthSecurityEvent" OWNER TO postgres;

--
-- Name: ContactMessage; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ContactMessage" (
    id text NOT NULL,
    tenant_id text NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    phone text,
    subject text NOT NULL,
    message text NOT NULL,
    source text DEFAULT 'web'::text NOT NULL,
    status text DEFAULT 'new'::text NOT NULL,
    ip_address text,
    user_agent text,
    metadata jsonb DEFAULT '{}'::jsonb,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public."ContactMessage" OWNER TO postgres;

--
-- Name: DiscountAudit; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."DiscountAudit" (
    id text NOT NULL,
    tenant_id text NOT NULL,
    discount_code_id text,
    code text,
    action text NOT NULL,
    reason text,
    order_id text,
    amount numeric(12,2),
    payload jsonb,
    user_id text,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public."DiscountAudit" OWNER TO postgres;

--
-- Name: DiscountCode; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."DiscountCode" (
    id text NOT NULL,
    tenant_id text NOT NULL,
    code text NOT NULL,
    name text,
    description text,
    type text NOT NULL,
    value numeric(12,2) NOT NULL,
    min_subtotal numeric(12,2) DEFAULT 0 NOT NULL,
    max_discount numeric(12,2),
    max_uses integer,
    used_count integer DEFAULT 0 NOT NULL,
    starts_at timestamp without time zone,
    ends_at timestamp without time zone,
    is_active boolean DEFAULT true NOT NULL,
    created_by text,
    metadata jsonb,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public."DiscountCode" OWNER TO postgres;

--
-- Name: Image; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Image" (
    id text NOT NULL,
    url text NOT NULL,
    product_id text,
    kind text,
    width integer,
    height integer
);


ALTER TABLE public."Image" OWNER TO postgres;

--
-- Name: InventoryLot; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."InventoryLot" (
    id text NOT NULL,
    tenant_id text NOT NULL,
    product_id text NOT NULL,
    source_type text NOT NULL,
    source_ref text,
    unit_cost numeric(12,4) DEFAULT 0 NOT NULL,
    initial_quantity integer NOT NULL,
    remaining_quantity integer NOT NULL,
    metadata jsonb,
    received_at timestamp without time zone DEFAULT now() NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    purchase_invoice_id text,
    purchase_invoice_item_id text
);


ALTER TABLE public."InventoryLot" OWNER TO postgres;

--
-- Name: InventoryLotAllocation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."InventoryLotAllocation" (
    id text NOT NULL,
    tenant_id text NOT NULL,
    lot_id text NOT NULL,
    order_item_id text NOT NULL,
    product_id text NOT NULL,
    quantity integer NOT NULL,
    unit_cost numeric(12,4) DEFAULT 0 NOT NULL,
    metadata jsonb,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public."InventoryLotAllocation" OWNER TO postgres;

--
-- Name: Order; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Order" (
    id text NOT NULL,
    user_id text,
    status text DEFAULT 'pending'::text NOT NULL,
    total numeric(10,2) NOT NULL,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    shipping_address jsonb,
    billing_address jsonb,
    payment_method text,
    invoice_number text,
    invoice_html text,
    invoice_created_at timestamp(3) without time zone,
    invoice_data jsonb,
    payment_details jsonb,
    items_subtotal numeric(12,2),
    vat_subtotal numeric(12,2),
    vat_rate numeric(6,2),
    vat_amount numeric(12,2),
    shipping numeric(12,2),
    shipping_base numeric(12,2),
    shipping_tax_rate numeric(6,2),
    shipping_tax_amount numeric(12,2),
    order_notes text,
    tenant_id text,
    discount_code text,
    discount_total numeric(12,2) DEFAULT 0,
    discount_snapshot jsonb,
    delivery_method text
);


ALTER TABLE public."Order" OWNER TO postgres;

--
-- Name: OrderItem; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."OrderItem" (
    id text NOT NULL,
    order_id text NOT NULL,
    product_id text NOT NULL,
    quantity integer NOT NULL,
    price numeric(10,2) NOT NULL,
    product_name text,
    product_image text,
    unit_cost numeric(12,4) DEFAULT 0 NOT NULL,
    cost_total numeric(12,4) DEFAULT 0 NOT NULL,
    price_net numeric(12,4) DEFAULT 0 NOT NULL,
    net_total numeric(12,4) DEFAULT 0 NOT NULL,
    tax_rate numeric(6,2) DEFAULT 0 NOT NULL,
    tax_amount numeric(12,4) DEFAULT 0 NOT NULL
);


ALTER TABLE public."OrderItem" OWNER TO postgres;

--
-- Name: PosMovement; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."PosMovement" (
    id bigint NOT NULL,
    tenant_id character varying(120) NOT NULL,
    shift_id character varying(64) NOT NULL,
    type character varying(20) NOT NULL,
    amount numeric(12,2) NOT NULL,
    description text,
    created_by_user_id character varying(64) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public."PosMovement" OWNER TO postgres;

--
-- Name: PosMovement_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."PosMovement_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."PosMovement_id_seq" OWNER TO postgres;

--
-- Name: PosMovement_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."PosMovement_id_seq" OWNED BY public."PosMovement".id;


--
-- Name: PosShift; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."PosShift" (
    id character varying(64) NOT NULL,
    tenant_id character varying(120) NOT NULL,
    opened_by_user_id character varying(64) NOT NULL,
    opened_at timestamp with time zone DEFAULT now() NOT NULL,
    opening_cash numeric(12,2) DEFAULT 0 NOT NULL,
    status character varying(20) DEFAULT 'open'::character varying NOT NULL,
    open_notes text,
    closed_by_user_id character varying(64),
    closed_at timestamp with time zone,
    closing_cash numeric(12,2),
    close_notes text,
    expected_cash numeric(12,2),
    difference_cash numeric(12,2),
    summary_json text
);


ALTER TABLE public."PosShift" OWNER TO postgres;

--
-- Name: Product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Product" (
    id text NOT NULL,
    legacy_id text,
    category text NOT NULL,
    name text NOT NULL,
    gender text,
    is_new boolean DEFAULT false NOT NULL,
    is_sale boolean DEFAULT false NOT NULL,
    price numeric(12,4) NOT NULL,
    original_price numeric(12,4) NOT NULL,
    brand text,
    sold integer DEFAULT 0 NOT NULL,
    quantity integer NOT NULL,
    description text NOT NULL,
    action text,
    slug text NOT NULL,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(3) without time zone NOT NULL,
    cost numeric(10,2) DEFAULT 0 NOT NULL,
    product_type text,
    attributes jsonb,
    tenant_id text,
    is_published boolean DEFAULT true NOT NULL
);


ALTER TABLE public."Product" OWNER TO postgres;

--
-- Name: ProductReferenceCatalog; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ProductReferenceCatalog" (
    id text NOT NULL,
    tenant_id text NOT NULL,
    catalog_key text NOT NULL,
    label text NOT NULL,
    payload jsonb DEFAULT '{}'::jsonb,
    sort_order integer DEFAULT 0 NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public."ProductReferenceCatalog" OWNER TO postgres;

--
-- Name: PurchaseInvoice; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."PurchaseInvoice" (
    id text NOT NULL,
    tenant_id text NOT NULL,
    supplier_name text NOT NULL,
    supplier_document text,
    invoice_number text NOT NULL,
    external_key text NOT NULL,
    issued_at date NOT NULL,
    subtotal numeric(12,4) DEFAULT 0 NOT NULL,
    tax_total numeric(12,4) DEFAULT 0 NOT NULL,
    total numeric(12,4) DEFAULT 0 NOT NULL,
    notes text,
    metadata jsonb,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public."PurchaseInvoice" OWNER TO postgres;

--
-- Name: PurchaseInvoiceItem; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."PurchaseInvoiceItem" (
    id text NOT NULL,
    purchase_invoice_id text NOT NULL,
    tenant_id text NOT NULL,
    product_id text NOT NULL,
    product_name_snapshot text,
    quantity integer NOT NULL,
    unit_cost numeric(12,4) DEFAULT 0 NOT NULL,
    line_total numeric(12,4) DEFAULT 0 NOT NULL,
    metadata jsonb,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public."PurchaseInvoiceItem" OWNER TO postgres;

--
-- Name: Quotation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Quotation" (
    id text NOT NULL,
    tenant_id text NOT NULL,
    status text DEFAULT 'quoted'::text NOT NULL,
    customer_name text NOT NULL,
    customer_document_type text,
    customer_document_number text,
    customer_email text,
    customer_phone text,
    customer_address jsonb,
    delivery_method text DEFAULT 'pickup'::text NOT NULL,
    payment_method text,
    discount_code text,
    notes text,
    items jsonb DEFAULT '[]'::jsonb NOT NULL,
    quote_snapshot jsonb DEFAULT '{}'::jsonb NOT NULL,
    created_by_user_id text,
    converted_order_id text,
    valid_until timestamp without time zone,
    converted_at timestamp without time zone,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public."Quotation" OWNER TO postgres;

--
-- Name: Setting; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Setting" (
    key text NOT NULL,
    value text NOT NULL,
    tenant_id text
);


ALTER TABLE public."Setting" OWNER TO postgres;

--
-- Name: Tenant; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Tenant" (
    id text NOT NULL,
    name text,
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public."Tenant" OWNER TO postgres;

--
-- Name: User; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."User" (
    id text NOT NULL,
    email text NOT NULL,
    name text,
    password text NOT NULL,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(3) without time zone NOT NULL,
    email_verified boolean DEFAULT false NOT NULL,
    verification_token text,
    role text DEFAULT 'customer'::text NOT NULL,
    addresses jsonb,
    profile jsonb,
    active_token_id text,
    document_type text,
    document_number text,
    business_name text,
    otp_code text,
    otp_expires_at timestamp without time zone,
    otp_attempts integer,
    tenant_id text,
    failed_login_attempts integer,
    login_locked_until timestamp without time zone,
    last_login_at timestamp without time zone
);


ALTER TABLE public."User" OWNER TO postgres;

--
-- Name: Variation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Variation" (
    id text NOT NULL,
    color text NOT NULL,
    color_code text,
    color_image text,
    image text,
    product_id text NOT NULL
);


ALTER TABLE public."Variation" OWNER TO postgres;

--
-- Name: PosMovement id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PosMovement" ALTER COLUMN id SET DEFAULT nextval('public."PosMovement_id_seq"'::regclass);


--
-- Data for Name: AuthSecurityEvent; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."AuthSecurityEvent" (id, tenant_id, user_id, email, event_type, status, ip_address, user_agent, metadata, created_at) FROM stdin;
40e778f1de958dd83a74	paramascotasec	user_admin	admin@example.com	admin_mfa_email_sent	success	192.168.100.51	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	{"delivery": "email"}	2026-04-06 18:18:45.221241
56a432bdf43a23740534	paramascotasec	user_admin	admin@example.com	admin_mfa_invalid	failure	192.168.100.51	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	{}	2026-04-06 18:18:55.953578
6b50c58ef8854aefe8d4	paramascotasec	user_admin	admin@example.com	admin_mfa_invalid	failure	192.168.100.51	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	{}	2026-04-06 18:19:00.860962
97d5155a114b816b1bfe	paramascotasec	user_admin	admin@example.com	admin_mfa_verified	success	192.168.100.51	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	{}	2026-04-06 18:19:11.806166
f3b0d7f4c761389e0bb6	paramascotasec	user_admin	admin@example.com	login_success	success	192.168.100.51	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	{}	2026-04-06 18:19:11.868923
c29020c5155304fd2e3b	paramascotasec	user_admin	admin@example.com	admin_mfa_email_sent	success	192.168.100.51	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	{"delivery": "email"}	2026-04-08 08:31:23.113339
1923068da8b1d9166537	paramascotasec	user_admin	admin@example.com	admin_mfa_expired	failure	192.168.100.51	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	{}	2026-04-08 14:24:02.967026
67733f3b9b98dbf2dd91	paramascotasec	user_admin	admin@example.com	admin_mfa_email_sent	success	192.168.100.51	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	{"delivery": "email"}	2026-04-08 14:31:10.976679
d9c9770e673d9bb6b021	paramascotasec	user_admin	admin@example.com	admin_mfa_verified	success	192.168.100.51	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	{}	2026-04-08 14:31:18.829755
3e86a6229d27a48b26cb	paramascotasec	user_admin	admin@example.com	login_success	success	192.168.100.51	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	{}	2026-04-08 14:31:18.83167
d6e3c923763a81b6135e	paramascotasec	user_admin	admin@example.com	admin_mfa_email_sent	success	192.168.100.51	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	{"delivery": "email"}	2026-04-08 21:18:21.485487
982ecfca8a1dbcb4a53f	paramascotasec	user_admin	admin@example.com	admin_mfa_verified	success	192.168.100.51	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	{}	2026-04-08 21:18:39.454376
91379121c5deb3c77dcb	paramascotasec	user_admin	admin@example.com	login_success	success	192.168.100.51	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	{}	2026-04-08 21:18:39.457249
426147a470d72800e0a7	paramascotasec	user_admin	admin@example.com	login_locked	blocked	192.168.100.51	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	{}	2026-04-08 21:56:59.424911
4981e2a67804428a96f9	paramascotasec	user_admin	admin@example.com	admin_mfa_email_sent	success	192.168.100.51	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	{"delivery": "email"}	2026-04-08 21:58:57.909111
8bffa233c0f98ac95d49	paramascotasec	user_admin	admin@example.com	admin_mfa_verified	success	192.168.100.51	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	{}	2026-04-08 21:59:10.52702
8b11d61e8da954014818	paramascotasec	user_admin	admin@example.com	login_success	success	192.168.100.51	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	{}	2026-04-08 21:59:10.532165
f494e88431484fed0cde	paramascotasec	user_admin	admin@example.com	admin_mfa_email_sent	success	192.168.100.51	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	{"delivery": "email"}	2026-04-08 22:39:03.967516
93e509d3552e1841b8b1	paramascotasec	user_admin	admin@example.com	admin_mfa_verified	success	192.168.100.51	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	{}	2026-04-08 22:39:16.728894
6f99a09a8eb36ba75d56	paramascotasec	user_admin	admin@example.com	login_success	success	192.168.100.51	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	{}	2026-04-08 22:39:16.731925
42202f33f024b8c7218a	paramascotasec	\N	admin@example.com	login_failed	failure	192.168.100.51	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	{"email": "admin@example.com", "reason": "user_not_found_or_invalid_password"}	2026-04-08 23:56:34.421402
a436047b8b9ff9ff6f8e	paramascotasec	\N	admin@example.com	login_failed	failure	192.168.100.51	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	{"email": "admin@example.com", "reason": "user_not_found_or_invalid_password"}	2026-04-08 23:56:40.395619
6605f50519f0f1d34eb5	paramascotasec	user_admin_evasquez	evasquez@paramascotasec.com	admin_mfa_email_sent	success	192.168.100.51	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	{"delivery": "email"}	2026-04-08 23:57:52.041515
a0d7d342eb29044cacee	paramascotasec	user_admin_evasquez	evasquez@paramascotasec.com	admin_mfa_verified	success	192.168.100.51	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	{}	2026-04-09 00:00:37.350705
44334a95e9c1bb22af1f	paramascotasec	user_admin_evasquez	evasquez@paramascotasec.com	login_success	success	192.168.100.51	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	{}	2026-04-09 00:00:37.355252
9ae5b684b97395810462	paramascotasec	user_admin_evasquez	evasquez@paramascotasec.com	admin_mfa_email_sent	success	192.168.100.51	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	{"delivery": "email"}	2026-04-09 01:21:21.373627
f92e3a0bc5be8900c1b6	paramascotasec	user_admin_evasquez	evasquez@paramascotasec.com	admin_mfa_verified	success	192.168.100.51	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	{}	2026-04-09 01:21:34.05404
baab3f7a0b53293c7c1c	paramascotasec	user_admin_evasquez	evasquez@paramascotasec.com	login_success	success	192.168.100.51	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	{}	2026-04-09 01:21:34.055728
6303dd71a60fb55d9ade	paramascotasec	user_admin_evasquez	evasquez@paramascotasec.com	admin_mfa_email_sent	success	192.168.100.51	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	{"delivery": "email"}	2026-04-09 08:46:02.644908
04c3d7fc118c38ba2972	paramascotasec	user_admin_evasquez	evasquez@paramascotasec.com	admin_mfa_verified	success	192.168.100.51	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	{}	2026-04-09 08:46:25.758671
84371424b8e59d34d24e	paramascotasec	user_admin_evasquez	evasquez@paramascotasec.com	login_success	success	192.168.100.51	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	{}	2026-04-09 08:46:25.760543
43bb19345e69fe2ff9c4	paramascotasec	user_admin_evasquez	evasquez@paramascotasec.com	admin_mfa_email_sent	success	192.168.100.51	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	{"delivery": "email"}	2026-04-09 14:47:57.994707
5403fd6668202233eaef	paramascotasec	user_admin_evasquez	evasquez@paramascotasec.com	admin_mfa_verified	success	192.168.100.51	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	{}	2026-04-09 14:48:16.694127
4aa98a275997ab180905	paramascotasec	user_admin_evasquez	evasquez@paramascotasec.com	login_success	success	192.168.100.51	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	{}	2026-04-09 14:48:16.695831
3729f631bcca4facbd39	paramascotasec	user_admin_evasquez	evasquez@paramascotasec.com	admin_mfa_email_sent	success	192.168.100.51	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	{"delivery": "email"}	2026-04-09 18:52:38.0831
3ddb530b4c121bde5420	paramascotasec	user_admin_evasquez	evasquez@paramascotasec.com	admin_mfa_verified	success	192.168.100.51	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	{}	2026-04-09 18:53:21.808092
1adcabf00ca59f19f2f2	paramascotasec	user_admin_evasquez	evasquez@paramascotasec.com	login_success	success	192.168.100.51	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	{}	2026-04-09 18:53:21.810096
e834e74bb84e572bb0f3	paramascotasec	user_admin_evasquez	evasquez@paramascotasec.com	admin_mfa_email_sent	success	192.168.100.51	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	{"delivery": "email"}	2026-04-11 12:43:43.205391
4883cb63da4260ef349f	paramascotasec	user_admin_evasquez	evasquez@paramascotasec.com	admin_mfa_verified	success	192.168.100.51	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	{}	2026-04-11 12:43:57.829233
21e98bcbe559cee683ba	paramascotasec	user_admin_evasquez	evasquez@paramascotasec.com	login_success	success	192.168.100.51	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	{}	2026-04-11 12:43:57.848107
887e5bba55b55f143c01	paramascotasec	user_admin_evasquez	evasquez@paramascotasec.com	admin_mfa_email_sent	success	192.168.100.51	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	{"delivery": "email"}	2026-04-11 15:47:00.896915
b089c22d4bc93156c604	paramascotasec	user_admin_evasquez	evasquez@paramascotasec.com	admin_mfa_verified	success	192.168.100.51	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	{}	2026-04-11 15:47:11.194647
6c95136e841d61964e22	paramascotasec	user_admin_evasquez	evasquez@paramascotasec.com	login_success	success	192.168.100.51	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	{}	2026-04-11 15:47:11.198587
37114591ab1197e634dc	paramascotasec	user_admin_evasquez	evasquez@paramascotasec.com	admin_mfa_email_sent	success	192.168.100.51	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	{"delivery": "email"}	2026-04-11 20:00:58.718181
cc0b9bd6e766b16eb7fd	paramascotasec	user_admin_evasquez	evasquez@paramascotasec.com	admin_mfa_verified	success	192.168.100.51	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	{}	2026-04-11 20:01:44.444903
216d29596cc058aa51ff	paramascotasec	user_admin_evasquez	evasquez@paramascotasec.com	login_success	success	192.168.100.51	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	{}	2026-04-11 20:01:44.451971
2591efade1175b24f789	paramascotasec	user_admin_evasquez	evasquez@paramascotasec.com	admin_mfa_email_sent	success	192.168.100.51	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	{"delivery": "email"}	2026-04-13 17:41:15.40838
d518e8e3d3bace7e6313	paramascotasec	user_admin_evasquez	evasquez@paramascotasec.com	admin_mfa_verified	success	192.168.100.51	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	{}	2026-04-13 17:41:31.123255
91223450737722053a7c	paramascotasec	user_admin_evasquez	evasquez@paramascotasec.com	login_success	success	192.168.100.51	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	{}	2026-04-13 17:41:31.125219
8be0854bd2dab0ac9635	paramascotasec	user_admin_gvasquez	gvasquez@paramascotasec.com	admin_mfa_email_sent	success	192.168.100.192	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	{"delivery": "email"}	2026-04-13 18:25:23.533816
f5460c6f61465ef826b9	paramascotasec	user_admin_gvasquez	gvasquez@paramascotasec.com	admin_mfa_verified	success	192.168.100.192	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	{}	2026-04-13 18:25:46.026066
83df76e9efdcf5d2cfed	paramascotasec	user_admin_gvasquez	gvasquez@paramascotasec.com	login_success	success	192.168.100.192	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	{}	2026-04-13 18:25:46.070512
60500e6157c41c82c080	paramascotasec	\N	evasquez@cardtechec.com	login_failed	failure	192.168.100.51	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	{"email": "evasquez@cardtechec.com", "reason": "user_not_found_or_invalid_password"}	2026-04-13 18:37:34.855663
071c698b99a8ef65357f	paramascotasec	\N	evasquez@cardtechec.com	login_failed	failure	192.168.100.51	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	{"email": "evasquez@cardtechec.com", "reason": "user_not_found_or_invalid_password"}	2026-04-13 18:37:40.963847
d62c2316c0819032c85f	paramascotasec	user_admin_evasquez	evasquez@paramascotasec.com	admin_mfa_email_sent	success	192.168.100.51	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	{"delivery": "email"}	2026-04-13 18:38:03.363218
a541d397aaf42a7c78f1	paramascotasec	user_admin_evasquez	evasquez@paramascotasec.com	admin_mfa_verified	success	192.168.100.51	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	{}	2026-04-13 18:38:13.566072
63c8caf7f62c5c600f3c	paramascotasec	user_admin_evasquez	evasquez@paramascotasec.com	login_success	success	192.168.100.51	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	{}	2026-04-13 18:38:13.570229
b35dc39b9477b393513a	paramascotasec	user_admin_evasquez	evasquez@paramascotasec.com	admin_mfa_email_sent	success	192.168.100.51	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	{"delivery": "email"}	2026-04-13 19:05:49.546518
1fbddffee62406706323	paramascotasec	user_admin_evasquez	evasquez@paramascotasec.com	admin_mfa_verified	success	192.168.100.51	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	{}	2026-04-13 19:06:02.138126
c26d2b044dd63f402984	paramascotasec	user_admin_evasquez	evasquez@paramascotasec.com	login_success	success	192.168.100.51	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	{}	2026-04-13 19:06:02.142424
1763a1d80e8b0673ffd9	paramascotasec	user_admin_evasquez	evasquez@paramascotasec.com	admin_mfa_email_sent	success	192.168.100.51	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36	{"delivery": "email"}	2026-04-16 19:21:41.895725
30752c434aa4f181534b	paramascotasec	user_admin_evasquez	evasquez@paramascotasec.com	admin_mfa_verified	success	192.168.100.51	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36	{}	2026-04-16 19:21:56.100984
68f6864b8cd441dbbf4c	paramascotasec	user_admin_evasquez	evasquez@paramascotasec.com	login_success	success	192.168.100.51	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36	{}	2026-04-16 19:21:56.102801
4d3f55bf16d0bdd3cb78	paramascotasec	user_admin_evasquez	evasquez@paramascotasec.com	admin_mfa_email_sent	success	192.168.100.51	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36	{"delivery": "email"}	2026-04-17 19:42:20.96303
8ee7919254c649ddf9f0	paramascotasec	user_admin_evasquez	evasquez@paramascotasec.com	admin_mfa_verified	success	192.168.100.51	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36	{}	2026-04-17 19:42:41.643876
ebf4393716c327186034	paramascotasec	user_admin_evasquez	evasquez@paramascotasec.com	login_success	success	192.168.100.51	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36	{}	2026-04-17 19:42:41.728806
80c1ed3d935acf92689d	paramascotasec	user_admin_evasquez	evasquez@paramascotasec.com	admin_mfa_email_sent	success	192.168.100.51	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36	{"delivery": "email"}	2026-04-19 15:34:50.81702
c108809b318fb6e5ed22	paramascotasec	user_admin_evasquez	evasquez@paramascotasec.com	admin_mfa_verified	success	192.168.100.51	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36	{}	2026-04-19 15:35:03.087059
d8dad7aa80f5b42f7aa4	paramascotasec	user_admin_evasquez	evasquez@paramascotasec.com	login_success	success	192.168.100.51	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36	{}	2026-04-19 15:35:03.088968
1bb6b84e96b5096adbae	paramascotasec	user_admin_evasquez	evasquez@paramascotasec.com	admin_mfa_email_sent	success	192.168.100.51	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36	{"delivery": "email"}	2026-04-20 14:14:17.806227
1177c027ef40a1b31e0b	paramascotasec	user_admin_evasquez	evasquez@paramascotasec.com	admin_mfa_verified	success	192.168.100.51	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36	{}	2026-04-20 14:14:39.514863
1c3d4dabccc7e6fc158f	paramascotasec	user_admin_evasquez	evasquez@paramascotasec.com	login_success	success	192.168.100.51	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36	{}	2026-04-20 14:14:39.516467
b7560743293db273034c	paramascotasec	user_admin_evasquez	evasquez@paramascotasec.com	admin_mfa_email_sent	success	192.168.100.51	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36	{"delivery": "email"}	2026-04-20 17:15:11.830819
cffa5e79f6e86b42c204	paramascotasec	user_admin_evasquez	evasquez@paramascotasec.com	admin_mfa_verified	success	192.168.100.51	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36	{}	2026-04-20 17:15:24.449782
b72624af58dda01a589c	paramascotasec	user_admin_evasquez	evasquez@paramascotasec.com	login_success	success	192.168.100.51	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36	{}	2026-04-20 17:15:24.451624
7f83aecf12b3c7de7eff	paramascotasec	user_admin_evasquez	evasquez@paramascotasec.com	admin_mfa_email_sent	success	157.100.141.155	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36	{"delivery": "email"}	2026-04-20 22:49:57.951241
52c79d4fd788b8ce0524	paramascotasec	user_admin_evasquez	evasquez@paramascotasec.com	admin_mfa_verified	success	157.100.141.155	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36	{}	2026-04-20 22:50:13.924024
6aafd6b4649ed956ac5d	paramascotasec	user_admin_evasquez	evasquez@paramascotasec.com	login_success	success	157.100.141.155	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36	{}	2026-04-20 22:50:13.931385
d1bf6a138716bf98dac4	paramascotasec	user_admin_gvasquez	gvasquez@paramascotasec.com	admin_mfa_email_sent	success	157.100.141.155	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36	{"delivery": "email"}	2026-04-21 07:31:19.227482
ad779e13236c1b006adf	paramascotasec	user_admin_evasquez	evasquez@paramascotasec.com	admin_mfa_email_sent	success	157.100.141.155	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36	{"delivery": "email"}	2026-04-24 16:16:26.324075
a08f8da7ae063744e920	paramascotasec	user_admin_evasquez	evasquez@paramascotasec.com	admin_mfa_verified	success	157.100.141.155	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36	{}	2026-04-24 16:17:09.539956
f159057a4f672649eb28	paramascotasec	user_admin_evasquez	evasquez@paramascotasec.com	login_success	success	157.100.141.155	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36	{}	2026-04-24 16:17:09.544449
eb581f704e9a801b3a07	paramascotasec	user_admin_gvasquez	gvasquez@paramascotasec.com	admin_mfa_email_sent	success	191.99.6.85	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36	{"delivery": "email"}	2026-04-24 16:49:29.555999
70088956a56df4f89a02	paramascotasec	user_admin_gvasquez	gvasquez@paramascotasec.com	admin_mfa_verified	success	191.99.6.85	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36	{}	2026-04-24 16:53:00.504101
c970779d5a779b3140cc	paramascotasec	user_admin_gvasquez	gvasquez@paramascotasec.com	login_success	success	191.99.6.85	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36	{}	2026-04-24 16:53:00.513798
e7f130d4fdb0bc9a66d9	paramascotasec	user_admin_evasquez	evasquez@paramascotasec.com	admin_mfa_email_sent	success	157.100.141.155	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36	{"delivery": "email"}	2026-04-24 19:17:31.291644
c2873f5c21f5d7b489b1	paramascotasec	user_admin_evasquez	evasquez@paramascotasec.com	admin_mfa_verified	success	157.100.141.155	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36	{}	2026-04-24 19:17:41.677425
11357b513174c8e6209f	paramascotasec	user_admin_evasquez	evasquez@paramascotasec.com	login_success	success	157.100.141.155	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36	{}	2026-04-24 19:17:41.682599
2097766dae04536c50ab	paramascotasec	user_admin_gvasquez	gvasquez@paramascotasec.com	admin_mfa_email_sent	success	201.183.62.229	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36	{"delivery": "email"}	2026-04-25 10:18:23.626937
6f6c350ecb9e085b1dc9	paramascotasec	user_admin_gvasquez	gvasquez@paramascotasec.com	admin_mfa_email_sent	success	201.183.62.47	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36	{"delivery": "email"}	2026-04-25 11:10:44.58236
3ff6d42bc43767362981	paramascotasec	user_admin_gvasquez	gvasquez@paramascotasec.com	admin_mfa_verified	success	201.183.62.47	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36	{}	2026-04-25 11:11:15.383805
ea19a189e251b2063276	paramascotasec	user_admin_gvasquez	gvasquez@paramascotasec.com	login_success	success	201.183.62.47	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36	{}	2026-04-25 11:11:15.389282
a14ac76f1fca8f783202	paramascotasec	user_admin_gvasquez	gvasquez@paramascotasec.com	admin_mfa_email_sent	success	201.183.62.47	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36	{"delivery": "email"}	2026-04-25 14:21:04.802828
c0a688b7a3b55541b2a4	paramascotasec	user_admin_gvasquez	gvasquez@paramascotasec.com	admin_mfa_verified	success	201.183.62.47	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36	{}	2026-04-25 14:26:35.299858
eecabe83c10896877591	paramascotasec	user_admin_gvasquez	gvasquez@paramascotasec.com	login_success	success	201.183.62.47	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36	{}	2026-04-25 14:26:35.314601
effbd1066803af5c2885	paramascotasec	user_admin_evasquez	evasquez@paramascotasec.com	admin_mfa_email_sent	success	157.100.141.155	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36	{"delivery": "email"}	2026-04-26 09:19:43.876121
921184d7aa81b3ca8ec6	paramascotasec	user_admin_evasquez	evasquez@paramascotasec.com	admin_mfa_verified	success	157.100.141.155	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36	{}	2026-04-26 09:20:03.703385
3f21517a4fd424338584	paramascotasec	user_admin_evasquez	evasquez@paramascotasec.com	login_success	success	157.100.141.155	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36	{}	2026-04-26 09:20:03.711344
0150ca4c567bac4e7a3e	paramascotasec	user_admin_evasquez	evasquez@paramascotasec.com	admin_mfa_email_sent	success	157.100.141.155	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36	{"delivery": "email"}	2026-04-26 09:24:31.582407
21d72c36df9a2ef2a7fa	paramascotasec	user_admin_evasquez	evasquez@paramascotasec.com	admin_mfa_email_sent	success	157.100.141.155	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36	{"delivery": "email"}	2026-04-26 21:01:42.245503
501f735e2286226cc741	paramascotasec	user_admin_evasquez	evasquez@paramascotasec.com	admin_mfa_verified	success	157.100.141.155	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36	{}	2026-04-26 21:01:54.633315
0116f2264018f2840d37	paramascotasec	user_admin_evasquez	evasquez@paramascotasec.com	login_success	success	157.100.141.155	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36	{}	2026-04-26 21:01:54.637082
269aed02424989a8b14d	paramascotasec	user_admin_evasquez	evasquez@paramascotasec.com	admin_mfa_email_sent	success	157.100.141.155	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36	{"delivery": "email"}	2026-04-27 00:20:45.923606
17eb1f11ca5f59c32ea8	paramascotasec	user_admin_evasquez	evasquez@paramascotasec.com	admin_mfa_verified	success	157.100.141.155	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36	{}	2026-04-27 00:20:59.446433
f183d5b4683b53af0ad8	paramascotasec	user_admin_evasquez	evasquez@paramascotasec.com	login_success	success	157.100.141.155	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36	{}	2026-04-27 00:20:59.45092
6d340c4de9253069ca53	paramascotasec	user_admin_gvasquez	gvasquez@paramascotasec.com	admin_mfa_email_sent	success	190.130.141.136	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36	{"delivery": "email"}	2026-04-27 09:24:01.36433
df9a7dd969a027e88fc6	paramascotasec	user_admin_gvasquez	gvasquez@paramascotasec.com	admin_mfa_verified	success	190.130.141.136	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36	{}	2026-04-27 09:24:24.087612
d6b31168eec0786d0caa	paramascotasec	user_admin_gvasquez	gvasquez@paramascotasec.com	login_success	success	190.130.141.136	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36	{}	2026-04-27 09:24:24.090271
113576f564a54802d077	paramascotasec	user_admin_evasquez	evasquez@paramascotasec.com	admin_mfa_email_sent	success	157.100.141.155	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:150.0) Gecko/20100101 Firefox/150.0	{"delivery": "email"}	2026-04-27 09:25:11.451762
f6f5963e6b5261f4112f	paramascotasec	user_admin_evasquez	evasquez@paramascotasec.com	admin_mfa_verified	success	157.100.141.155	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:150.0) Gecko/20100101 Firefox/150.0	{}	2026-04-27 09:25:28.254834
657be3b0e8f132f892e4	paramascotasec	user_admin_evasquez	evasquez@paramascotasec.com	login_success	success	157.100.141.155	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:150.0) Gecko/20100101 Firefox/150.0	{}	2026-04-27 09:25:28.260904
0abe27a58e815b22bed6	paramascotasec	user_admin_gvasquez	gvasquez@paramascotasec.com	admin_mfa_email_sent	success	190.130.141.136	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36	{"delivery": "email"}	2026-04-27 09:38:35.015686
d23736924f6c112f6bd9	paramascotasec	user_admin_gvasquez	gvasquez@paramascotasec.com	admin_mfa_verified	success	190.130.141.136	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36	{}	2026-04-27 09:38:56.839644
020c05ec6c9aa7fe440f	paramascotasec	user_admin_gvasquez	gvasquez@paramascotasec.com	login_success	success	190.130.141.136	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36	{}	2026-04-27 09:38:56.847962
8a4664015eb55e5399a7	paramascotasec	user_admin_evasquez	evasquez@paramascotasec.com	admin_mfa_email_sent	success	157.100.141.155	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36	{"delivery": "email"}	2026-04-27 12:34:26.879122
74850848f8f3582d4318	paramascotasec	user_admin_evasquez	evasquez@paramascotasec.com	admin_mfa_verified	success	157.100.141.155	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36	{}	2026-04-27 12:35:00.046002
0666647b15cdd0fc1f1c	paramascotasec	user_admin_evasquez	evasquez@paramascotasec.com	login_success	success	157.100.141.155	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36	{}	2026-04-27 12:35:00.055972
f6317645c06bb6816740	paramascotasec	user_admin_gvasquez	gvasquez@paramascotasec.com	admin_mfa_email_sent	success	190.130.141.136	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36	{"delivery": "email"}	2026-04-27 12:43:13.783433
6d2b5226ba6acf94d0cc	paramascotasec	user_admin_gvasquez	gvasquez@paramascotasec.com	admin_mfa_verified	success	190.130.141.136	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36	{}	2026-04-27 12:43:45.285674
de4d218fc2117cb92ca4	paramascotasec	user_admin_gvasquez	gvasquez@paramascotasec.com	login_success	success	190.130.141.136	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36	{}	2026-04-27 12:43:45.292261
\.


--
-- Data for Name: ContactMessage; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ContactMessage" (id, tenant_id, name, email, phone, subject, message, source, status, ip_address, user_agent, metadata, created_at, updated_at) FROM stdin;
contact_c9ac8098814c812b	paramascotasec	Prueba Contacto	edwin.eduardo.vm@gmail.com	0999999999	Prueba formulario	Mensaje de prueba desde el formulario de contacto para validar persistencia y correo.	contact_page	new	172.18.0.5	curl/8.5.0	{"referer": null, "tenant_domain": null}	2026-03-26 19:19:43.309075	2026-03-26 19:19:43.309075
contact_2aef5e00b6865b32	paramascotasec	Prueba Gateway	edwin.eduardo.vm@gmail.com	0988888888	Prueba gateway	Mensaje de prueba a través del gateway HTTPS para validar la ruta pública de contacto.	contact_page	new	172.18.0.1	curl/8.5.0	{"referer": null, "tenant_domain": null}	2026-03-26 19:20:40.021191	2026-03-26 19:20:40.021191
contact_1200840a86631949	paramascotasec	Edwin	edwin.eduardo.vm@gmail.com	0962782126	Asunto Test	Mensaje test	contact_page	new	192.168.100.51	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	{"referer": "https://paramascotasec.com/pages/contact", "tenant_domain": null}	2026-03-27 07:49:00.854141	2026-03-27 07:49:00.854141
contact_cc3bdccecaee0785	paramascotasec	asd	edwin.eduardo.vm@gmail.com	asdasd	sdasd	assadasdasdas	contact_page	new	192.168.100.51	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	{"referer": "https://paramascotasec.com/pages/contact", "tenant_domain": null}	2026-03-27 08:21:43.790117	2026-03-27 08:21:43.790117
contact_a18b76bca2e612ab	paramascotasec	asdasdasd	edwin.eduardo.vm@gmail.com	asd	asdasd asd	asdasdadasd	contact_page	new	192.168.100.51	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	{"referer": "https://paramascotasec.com/pages/contact", "tenant_domain": null}	2026-03-27 08:40:22.458571	2026-03-27 08:40:22.458571
contact_e2b4c4359b7b7965	paramascotasec	asdasd asdasd	edwin.eduardo.vm@gmail.com	sdasdasd222	asdasdas222	2222222222222222222222	contact_page	new	192.168.100.51	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	{"referer": "https://paramascotasec.com/pages/contact", "tenant_domain": null}	2026-03-27 09:15:26.947836	2026-03-27 09:15:26.947836
contact_42b53c372cbc7d4a	paramascotasec	asdasd asdasd	edwin.eduardo.vm@gmail.com	sdasdasd222	asdasdas222	2222222222222222222222	contact_page	new	192.168.100.51	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	{"referer": "https://paramascotasec.com/pages/contact", "tenant_domain": null}	2026-03-27 09:16:04.439716	2026-03-27 09:16:04.439716
contact_dbfac6f8f72a35c6	paramascotasec	Edwin	edwin.eduardo.vm@gmail.com	0962782126	Duda Asunto	Mensaje test	contact_page	new	172.18.0.2	curl/8.5.0	{"referer": null, "tenant_domain": null}	2026-03-27 09:18:27.747633	2026-03-27 09:18:27.747633
contact_0aef8525abb6235b	paramascotasec	Edwin	edwin.eduardo.vm@gmail.com	0962782126	Duda Asunto	Mensaje test	contact_page	new	172.18.0.1	curl/8.5.0	{"referer": null, "tenant_domain": null}	2026-03-27 09:24:01.817738	2026-03-27 09:24:01.817738
contact_b3f4ac2f42acf44d	paramascotasec	Edwin	edwin.eduardo.vm@gmail.com	0962782126	Duda Asunto	Mensaje test	contact_page	new	172.18.0.1	curl/8.5.0	{"referer": null, "tenant_domain": null}	2026-03-27 09:25:56.435462	2026-03-27 09:25:56.435462
contact_a08babc5eecf10a6	paramascotasec	Edwin	edwin.eduardo.vm@gmail.com	0962782126	Duda Asunto	Mensaje test	contact_page	new	172.18.0.1	curl/8.5.0	{"referer": null, "tenant_domain": null}	2026-03-27 09:28:37.911344	2026-03-27 09:28:37.911344
contact_2d587e0a7a0e00e9	paramascotasec	Edwin	edwin.eduardo.vm@gmail.com	0962782126	Duda Asunto	Mensaje test	contact_page	new	172.18.0.2	curl/8.5.0	{"referer": null, "tenant_domain": null}	2026-03-27 09:28:38.709045	2026-03-27 09:28:38.709045
contact_4f8eb1e31543fde3	paramascotasec	asdasdasd33	edwin.eduardo.vm@gmail.com	asdasasd33	sadas asdasd333	asdasd a 333	contact_page	new	192.168.100.51	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	{"referer": "https://paramascotasec.com/pages/contact", "tenant_domain": null}	2026-03-27 09:35:34.430338	2026-03-27 09:35:34.430338
contact_ea46372be58fd899	paramascotasec	sadasas asd4444	edwin.eduardo.vm@gmail.com	asdasdasd4	asdsadsa4444	sdas44adase4444	contact_page	new	192.168.100.51	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	{"referer": "https://paramascotasec.com/pages/contact", "tenant_domain": null}	2026-03-27 09:56:25.465297	2026-03-27 09:56:25.465297
contact_3d7e8e41e94b601e	paramascotasec	Info Test	info@paramascotasec.com	0990000000	Prueba doble entrega	Este mensaje valida que llegue un correo interno y otro de confirmación al remitente.	contact_page	new	172.18.0.2	curl/8.5.0	{"referer": null, "tenant_domain": null}	2026-03-27 10:01:28.421738	2026-03-27 10:01:28.421738
contact_8ca8c4bbefe64379	paramascotasec	Info Test	info@paramascotasec.com	0990000000	Prueba doble entrega	Este mensaje valida que llegue un correo interno y otro de confirmación al remitente.	contact_page	new	172.18.0.2	curl/8.5.0	{"referer": null, "tenant_domain": null}	2026-03-27 10:02:43.102048	2026-03-27 10:02:43.102048
contact_ea4dbfdbfd8d5967	paramascotasec	asasasdsad5	edwin.eduardo.vm@gmail.com	42343sada5555	sadasda55555	asdasd5555sdasd555555	contact_page	new	192.168.100.51	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	{"referer": "https://paramascotasec.com/pages/contact", "tenant_domain": null}	2026-03-27 10:10:00.431841	2026-03-27 10:10:00.431841
\.


--
-- Data for Name: DiscountAudit; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."DiscountAudit" (id, tenant_id, discount_code_id, code, action, reason, order_id, amount, payload, user_id, created_at) FROM stdin;
da_69ec087fb2b3d	paramascotasec	\N	BIENVENIDA10	quote_rejected	invalid_code	\N	\N	{"tax_rate": 0, "items_subtotal": 4.8, "items_cost_total": 3.7}	\N	2026-04-24 19:19:11.733216
\.


--
-- Data for Name: DiscountCode; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."DiscountCode" (id, tenant_id, code, name, description, type, value, min_subtotal, max_discount, max_uses, used_count, starts_at, ends_at, is_active, created_by, metadata, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: Image; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Image" (id, url, product_id, kind, width, height) FROM stdin;
img_69d44cfa2ab0e	/uploads/products/paramascotasec-saco-sv-hearts-ropa-ficha-20260407-f132a47158.jpg	prod_69d44cfa28313	gallery	1200	1500
img_69d44cfa2b8c4	/uploads/products/paramascotasec-saco-sv-hearts-ropa-ficha-20260407-3ddd953aa3.jpg	prod_69d44cfa28313	gallery	1200	1500
img_69d44cfa3500d	/uploads/products/paramascotasec-saco-sv-hearts-ropa-miniatura-20260407-639f0d0db4.jpg	prod_69d44cfa28313	thumb	640	800
img_69ef9274dbcc7	/uploads/products/paramascotasec-camiseta-seleccion-amarilla-ropa-l-amarillo-perro-ficha-20260411-80caee6afd.webp	prod_imp_69da92e21f250	gallery	1200	1500
img_69ef9274dc31c	/uploads/products/paramascotasec-camiseta-seleccion-amarilla-ropa-l-amarillo-perro-ficha-20260411-c30e8a1dad.webp	prod_imp_69da92e21f250	gallery	1200	1500
img_69ef9274dc969	/uploads/products/paramascotasec-camiseta-seleccion-amarilla-ropa-l-amarillo-perro-miniatura-20260411-753e5bdb8e.webp	prod_imp_69da92e21f250	thumb	640	800
img_69ef932acbab7	/uploads/products/paramascotasec-camiseta-seleccion-blanca-ropa-s-blanco-perro-ficha-20260411-5affeed23a.webp	prod_imp_69da92e2e7945	gallery	1200	1500
img_69ef932acc5c3	/uploads/products/paramascotasec-camiseta-seleccion-blanca-ropa-s-blanco-perro-ficha-20260411-19147dc4ad.webp	prod_imp_69da92e2e7945	gallery	1200	1500
img_69ef932acd6a9	/uploads/products/paramascotasec-camiseta-seleccion-blanca-ropa-s-blanco-perro-miniatura-20260411-b645d324d6.webp	prod_imp_69da92e2e7945	thumb	640	800
img_69ef95888a7b8	/uploads/products/paramascotasec-cat-chow-carne-1-5-kg-alimento-1-5kg-gato-ficha-20260419-7d651c997c.webp	prod_27de42b7f6c83	gallery	1200	1500
img_69ef95888b1ff	/uploads/products/paramascotasec-cat-chow-carne-1-5-kg-alimento-1-5kg-gato-miniatura-20260419-bbb1512eba.webp	prod_27de42b7f6c83	thumb	640	800
img_69ef9921f2803	/uploads/products/paramascotasec-cani-adulto-rmg-2-kg-alimento-2kg-perro-ficha-20260419-9e246b2f7e.webp	prod_bd5c3d5e886ba	gallery	1200	1500
img_69d8043e485e9	/uploads/products/paramascotasec-saco-woof-ropa-ficha-20260409-95a5319127.jpg	prod_69d8043e47fd0	gallery	1200	1500
img_69d8043e4892e	/uploads/products/paramascotasec-saco-woof-ropa-ficha-20260409-586673e256.jpg	prod_69d8043e47fd0	gallery	1200	1500
img_69d8043e48fee	/uploads/products/paramascotasec-saco-woof-ropa-miniatura-20260409-19d39d8ab2.jpg	prod_69d8043e47fd0	thumb	640	800
img_69ef9921f2d09	/uploads/products/paramascotasec-cani-adulto-rmg-2-kg-alimento-2kg-perro-miniatura-20260419-475eb60bc9.webp	prod_bd5c3d5e886ba	thumb	640	800
img_69da8a8ccc5f1	/uploads/products/paramascotasec-hoodie-huellas-ropa-ficha-20260411-35115d7d5e.jpg	prod_69da8a48d3468	gallery	1200	1500
img_69da8a8cccbbd	/uploads/products/paramascotasec-hoodie-huellas-ropa-ficha-20260411-26a0befecb.jpg	prod_69da8a48d3468	gallery	1200	1500
img_69da8a8ccd15b	/uploads/products/paramascotasec-hoodie-huellas-ropa-miniatura-20260411-0c1427d593.jpg	prod_69da8a48d3468	thumb	640	800
img_69da8d1acf81d	/uploads/products/paramascotasec-vestido-ropa-ficha-20260411-5fff4385f7.jpg	prod_69da8d1acf310	gallery	1200	1500
img_69da8d1acf9e8	/uploads/products/paramascotasec-vestido-ropa-ficha-20260411-6d2f7f6281.jpg	prod_69da8d1acf310	gallery	1200	1500
img_69da8d1acfcb1	/uploads/products/paramascotasec-vestido-ropa-miniatura-20260411-a3e9f53d79.jpg	prod_69da8d1acf310	thumb	640	800
img_69daf37f561a9	/uploads/products/paramascotasec-rollo-de-fundas-para-desecho-accesorios-azul-perro-y-gato-ficha-20260412-7fc20fde86.jpg	prod_imp_69dac080b8edb	gallery	1200	1500
img_69daf37f5649d	/uploads/products/paramascotasec-rollo-de-fundas-para-desecho-accesorios-azul-perro-y-gato-ficha-20260412-fb6cec55de.jpg	prod_imp_69dac080b8edb	gallery	1200	1500
img_69daf37f56714	/uploads/products/paramascotasec-rollo-de-fundas-para-desecho-accesorios-azul-perro-y-gato-miniatura-20260412-96bf7a0371.jpg	prod_imp_69dac080b8edb	thumb	640	800
img_69efa50b106cd	/uploads/products/paramascotasec-collar-con-cascabel-amarillo-accesorios-amarillo-m-perro-ficha-20260418-067e77e01b.webp	prod_63bb9f3ebaa4b	gallery	1200	1500
img_69daf4e5dccfe	/uploads/products/paramascotasec-juguete-interactivo-cat-towe-accesorios-azul-gato-ficha-20260412-8646240b79.jpg	prod_imp_69dac08147290	gallery	1200	1500
img_69daf4e5dea43	/uploads/products/paramascotasec-juguete-interactivo-cat-towe-accesorios-azul-gato-miniatura-20260412-4d48f0caa4.jpg	prod_imp_69dac08147290	thumb	640	800
img_69daf585cd6a5	/uploads/products/paramascotasec-plato-plegable-pequeno-accesorios-azul-perro-y-gato-ficha-20260412-51ac365e02.jpg	prod_imp_69dac081436fa	gallery	1200	1500
img_69daf585ceeeb	/uploads/products/paramascotasec-plato-plegable-pequeno-accesorios-azul-perro-y-gato-miniatura-20260412-c3068bb468.jpg	prod_imp_69dac081436fa	thumb	640	800
img_69daf79630d68	/uploads/products/paramascotasec-correa-extensible-de-3-metro-accesorios-azul-perro-y-gato-ficha-20260412-be02518d1b.jpg	prod_imp_69dac0814226c	gallery	1200	1500
img_69da9655a995a	/uploads/products/paramascotasec-camiseta-polo-verde-militar-ropa-s-verde-militar-perro-ficha-20260411-9e9b79a33a.jpg	prod_imp_69da92e1ee6dd	gallery	1200	1500
img_69da9655aa62c	/uploads/products/paramascotasec-camiseta-polo-verde-militar-ropa-s-verde-militar-perro-ficha-20260411-f65d2ba866.jpg	prod_imp_69da92e1ee6dd	gallery	1200	1500
img_69da9655acd6d	/uploads/products/paramascotasec-camiseta-polo-verde-militar-ropa-s-verde-militar-perro-miniatura-20260411-09c9a51b60.jpg	prod_imp_69da92e1ee6dd	thumb	640	800
img_69efa50b11220	/uploads/products/paramascotasec-collar-con-cascabel-amarillo-accesorios-amarillo-m-perro-miniatura-20260418-3124a6ad96.webp	prod_63bb9f3ebaa4b	thumb	640	800
img_69ef922716add	/uploads/products/paramascotasec-ropa-ficha-20260406-9155401988.webp	prod_69d4472545cf7	gallery	1200	1500
img_69ef922716de7	/uploads/products/paramascotasec-ropa-ficha-20260406-5d014130a6.webp	prod_69d4472545cf7	gallery	1200	1500
img_69ef922717291	/uploads/products/paramascotasec-ropa-miniatura-20260406-adf542cec7.webp	prod_69d4472545cf7	thumb	640	800
img_69ef9282a6583	/uploads/products/paramascotasec-camiseta-seleccion-amarilla-ropa-xs-amarillo-perro-ficha-20260411-42eb76ca87.webp	prod_imp_69da92e203e9b	gallery	1200	1500
img_69ef9282a6d74	/uploads/products/paramascotasec-camiseta-seleccion-amarilla-ropa-xs-amarillo-perro-ficha-20260411-3c5191f169.webp	prod_imp_69da92e203e9b	gallery	1200	1500
img_69ef81a073390	/uploads/products/paramascotasec-avant-adulto-raza-mediana-gr-alimento-2kg-perro-ficha-20260418-27ab22b8d2.webp	prod_d42ac32232628	gallery	1200	1500
img_69ef81a074f1f	/uploads/products/paramascotasec-avant-adulto-raza-mediana-gr-alimento-2kg-perro-miniatura-20260418-d0ac97afe9.webp	prod_d42ac32232628	thumb	640	800
img_69ef82b35ed78	/uploads/products/paramascotasec-cani-adulto-rp-9-kg-alimento-9kg-perro-ficha-20260419-a9435588dc.webp	prod_2a3165d055178	gallery	1200	1500
img_69ef82b35ff52	/uploads/products/paramascotasec-cani-adulto-rp-9-kg-alimento-9kg-perro-miniatura-20260419-931954b68f.webp	prod_2a3165d055178	thumb	640	800
img_69ef9282a78e3	/uploads/products/paramascotasec-camiseta-seleccion-amarilla-ropa-xs-amarillo-perro-miniatura-20260411-8bc8790b09.webp	prod_imp_69da92e203e9b	thumb	640	800
img_69ef95b79b93d	/uploads/products/paramascotasec-cat-chow-pescado-0-5-kg-alimento-0-5kg-gato-ficha-20260420-31b975ca97.webp	prod_91dc9a3465f00	gallery	1200	1500
img_69ef95b79c918	/uploads/products/paramascotasec-cat-chow-pescado-0-5-kg-alimento-0-5kg-gato-miniatura-20260420-ffb3322cbf.webp	prod_91dc9a3465f00	thumb	640	800
img_69da99460b3c1	/uploads/products/paramascotasec-camiseta-polo-azul-ropa-l-azul-perro-ficha-20260411-d95c1aafd9.jpg	prod_imp_69da92e1e48ba	gallery	1200	1500
img_69da99460badd	/uploads/products/paramascotasec-camiseta-polo-azul-ropa-l-azul-perro-ficha-20260411-1dd135d7e6.jpg	prod_imp_69da92e1e48ba	gallery	1200	1500
img_69da9946161cc	/uploads/products/paramascotasec-camiseta-polo-azul-ropa-l-azul-perro-miniatura-20260411-6a85bd37ef.jpg	prod_imp_69da92e1e48ba	thumb	640	800
img_69da998d75baa	/uploads/products/paramascotasec-camiseta-polo-azul-ropa-s-azul-perro-ficha-20260411-070c82afbc.jpg	prod_imp_69da92e1e3204	gallery	1200	1500
img_69da998d75e22	/uploads/products/paramascotasec-camiseta-polo-azul-ropa-s-azul-perro-ficha-20260411-7cb296e621.jpg	prod_imp_69da92e1e3204	gallery	1200	1500
img_69da998d76172	/uploads/products/paramascotasec-camiseta-polo-azul-ropa-s-azul-perro-miniatura-20260411-41db429c40.jpg	prod_imp_69da92e1e3204	thumb	640	800
img_69daf34f8d405	/uploads/products/paramascotasec-rollo-de-fundas-para-desecho-accesorios-amarillo-perro-y-gato-ficha-20260412-2bb7b237f5.jpg	prod_imp_69dac080e7ad7	gallery	1200	1500
img_69daf34f8eace	/uploads/products/paramascotasec-rollo-de-fundas-para-desecho-accesorios-amarillo-perro-y-gato-ficha-20260412-e764978b8a.jpg	prod_imp_69dac080e7ad7	gallery	1200	1500
img_69daf34f8ec5b	/uploads/products/paramascotasec-rollo-de-fundas-para-desecho-accesorios-amarillo-perro-y-gato-miniatura-20260412-636c729210.jpg	prod_imp_69dac080e7ad7	thumb	640	800
img_69daf38fe6532	/uploads/products/paramascotasec-rollo-de-fundas-para-desecho-accesorios-verde-perro-y-gato-ficha-20260412-5e1185e6fa.jpg	prod_imp_69dac080ce242	gallery	1200	1500
img_69daf38fe73fb	/uploads/products/paramascotasec-rollo-de-fundas-para-desecho-accesorios-verde-perro-y-gato-ficha-20260412-a4adada3ab.jpg	prod_imp_69dac080ce242	gallery	1200	1500
img_69daf38fe8bb7	/uploads/products/paramascotasec-rollo-de-fundas-para-desecho-accesorios-verde-perro-y-gato-miniatura-20260412-9d6fa6487d.jpg	prod_imp_69dac080ce242	thumb	640	800
img_69daf56027471	/uploads/products/paramascotasec-plato-plegable-pequeno-accesorios-rojo-perro-y-gato-ficha-20260412-867b343189.jpg	prod_imp_69dac08144b80	gallery	1200	1500
img_69ef923180e55	/uploads/products/paramascotasec-chaleco-rayita-rosa-ropa-ficha-20260407-9d8419a7bd.webp	prod_69d45126b222d	gallery	1200	1500
img_69ef923181b06	/uploads/products/paramascotasec-chaleco-rayita-rosa-ropa-ficha-20260407-e4bdb77f3f.webp	prod_69d45126b222d	gallery	1200	1500
img_69ef92318275b	/uploads/products/paramascotasec-chaleco-rayita-rosa-ropa-miniatura-20260407-fbef3d737b.webp	prod_69d45126b222d	thumb	640	800
img_69daf5602768c	/uploads/products/paramascotasec-plato-plegable-pequeno-accesorios-rojo-perro-y-gato-miniatura-20260412-e23f2eadb8.jpg	prod_imp_69dac08144b80	thumb	640	800
img_69daf79631aa1	/uploads/products/paramascotasec-correa-extensible-de-3-metro-accesorios-azul-perro-y-gato-miniatura-20260412-4e64299fe0.jpg	prod_imp_69dac0814226c	thumb	640	800
img_69daf84fe4682	/uploads/products/paramascotasec-correa-extensible-de-3-metro-accesorios-roja-perro-y-gato-ficha-20260412-ff9fad361b.jpg	prod_imp_69dac08140f18	gallery	1200	1500
img_69daf84fe532e	/uploads/products/paramascotasec-correa-extensible-de-3-metro-accesorios-roja-perro-y-gato-miniatura-20260412-19b13e6268.jpg	prod_imp_69dac08140f18	thumb	640	800
img_69daf373f2bf7	/uploads/products/paramascotasec-rollo-de-fundas-para-desecho-accesorios-rojo-perro-y-gato-ficha-20260412-74d6916e28.jpg	prod_imp_69dac080a9777	gallery	1200	1500
img_69efa41f42627	/uploads/products/paramascotasec-collar-con-cascabel-rosado-accesorios-s-rosa-perro-y-gato-ficha-20260427-c1bed938fc.webp	prod_69efa41f410d2	gallery	1200	1500
img_69efa41f43f7f	/uploads/products/paramascotasec-collar-con-cascabel-amarillo-miniatura-20260427-403a549714.webp	prod_69efa41f410d2	thumb	640	800
img_69efa5c386bcf	/uploads/products/paramascotasec-caollar-con-cascabel-rojo-accesorios-ficha-20260427-32c7a65d20.webp	prod_69efa49e505d5	gallery	1200	1500
img_69efa5c3874ee	/uploads/products/paramascotasec-caollar-con-cascabel-rojo-accesorios-miniatura-20260427-0cb6bd81de.webp	prod_69efa49e505d5	thumb	640	800
img_69daf373f319f	/uploads/products/paramascotasec-rollo-de-fundas-para-desecho-accesorios-rojo-perro-y-gato-ficha-20260412-2235bb12cf.jpg	prod_imp_69dac080a9777	gallery	1200	1500
img_69daf373f3ef3	/uploads/products/paramascotasec-rollo-de-fundas-para-desecho-accesorios-rojo-perro-y-gato-miniatura-20260412-3a4996415b.jpg	prod_imp_69dac080a9777	thumb	640	800
img_69da9cd812cc4	/uploads/products/paramascotasec-camiseta-polo-azul-ropa-l-azul-perro-ficha-20260411-d95c1aafd9.jpg	prod_69da9cd8105b8	gallery	1200	1500
img_69da9cd813249	/uploads/products/paramascotasec-camiseta-polo-azul-ropa-l-azul-perro-ficha-20260411-1dd135d7e6.jpg	prod_69da9cd8105b8	gallery	1200	1500
img_69da9cd813ad8	/uploads/products/paramascotasec-camiseta-polo-azul-ropa-l-azul-perro-miniatura-20260411-6a85bd37ef.jpg	prod_69da9cd8105b8	thumb	640	800
img_69daa8e2cecce	/uploads/products/paramascotasec-camiseta-polo-azul-ropa-ficha-20260411-d839338871.jpg	prod_69daa8e29aa44	gallery	1200	1500
img_69daa8e2e4b9b	/uploads/products/paramascotasec-camiseta-polo-azul-ropa-ficha-20260411-25d038a04c.jpg	prod_69daa8e29aa44	gallery	1200	1500
img_69daa8e31396d	/uploads/products/paramascotasec-camiseta-polo-azul-ropa-miniatura-20260411-59bc172db2.jpg	prod_69daa8e29aa44	thumb	640	800
img_69daf3fdc1716	/uploads/products/paramascotasec-kit-de-platos-plegables-gris-accesorios-350ml-gris-perro-y-gato-ficha-20260412-7dcc6733d6.jpg	prod_imp_69dac08145f91	gallery	1200	1500
img_69daf3fdc22c2	/uploads/products/paramascotasec-kit-de-platos-plegables-gris-accesorios-350ml-gris-perro-y-gato-ficha-20260412-76f0447934.jpg	prod_imp_69dac08145f91	gallery	1200	1500
img_69daf3fdc2ded	/uploads/products/paramascotasec-kit-de-platos-plegables-gris-accesorios-350ml-gris-perro-y-gato-miniatura-20260412-160e886e22.jpg	prod_imp_69dac08145f91	thumb	640	800
img_69ef92932321d	/uploads/products/paramascotasec-camiseta-seleccion-amarilla-ropa-m-amarillo-perro-ficha-20260411-fd2c68ce90.webp	prod_imp_69da92e21796d	gallery	1200	1500
img_69ef929323b60	/uploads/products/paramascotasec-camiseta-seleccion-amarilla-ropa-m-amarillo-perro-ficha-20260411-218b820459.webp	prod_imp_69da92e21796d	gallery	1200	1500
img_69ef9293247c0	/uploads/products/paramascotasec-camiseta-seleccion-amarilla-ropa-m-amarillo-perro-miniatura-20260411-f4518e842f.webp	prod_imp_69da92e21796d	thumb	640	800
img_69ef95c6e6c2a	/uploads/products/paramascotasec-cat-chow-pescado-1-5-kg-alimento-1-5kg-gato-ficha-20260420-15090b14eb.webp	prod_e6260031bdb45	gallery	1200	1500
img_69ef95c6ead23	/uploads/products/paramascotasec-cat-chow-pescado-1-5-kg-alimento-1-5kg-gato-miniatura-20260420-5504be060d.webp	prod_e6260031bdb45	thumb	640	800
img_69ef9a7a4955e	/uploads/products/paramascotasec-chiki-pollo-18-kg-alimento-18kg-perro-ficha-20260418-4b0ed5483b.webp	prod_957b581998bcd	gallery	1200	1500
img_69ef9a7a49bab	/uploads/products/paramascotasec-chiki-pollo-18-kg-alimento-18kg-perro-miniatura-20260418-fbdcf5642d.webp	prod_957b581998bcd	thumb	640	800
img_69daf4bd68c0d	/uploads/products/paramascotasec-juguete-interactivo-cat-towe-accesorios-verde-gato-ficha-20260412-0db68dc138.jpg	prod_imp_69dac0814865e	gallery	1200	1500
img_69daf4bd69d4c	/uploads/products/paramascotasec-juguete-interactivo-cat-towe-accesorios-verde-gato-miniatura-20260412-fcfae1c59c.jpg	prod_imp_69dac0814865e	thumb	640	800
img_69efa6a0c7756	/uploads/products/paramascotasec-collar-con-cascabel-azul-accesorios-ficha-20260427-790a7b28e3.webp	prod_69efa6a0c5623	gallery	1200	1500
img_69efa6a0c9dcc	/uploads/products/paramascotasec-collar-con-cascabel-azul-accesorios-miniatura-20260427-1ae3acf206.webp	prod_69efa6a0c5623	thumb	640	800
img_69daf887b6f8e	/uploads/products/paramascotasec-correa-extensible-de-3-metro-accesorios-verde-perro-y-gato-ficha-20260412-45c6132952.jpg	prod_imp_69dac0813fb90	gallery	1200	1500
img_69ef92589b708	/uploads/products/paramascotasec-camiseta-polo-azul-ropa-ficha-20260411-d839338871.webp	prod_69daa8a08a6d2	gallery	1200	1500
img_69ef92589c091	/uploads/products/paramascotasec-camiseta-polo-azul-ropa-ficha-20260411-25d038a04c.webp	prod_69daa8a08a6d2	gallery	1200	1500
img_69ef92589c9e9	/uploads/products/paramascotasec-camiseta-polo-azul-ropa-miniatura-20260411-59bc172db2.webp	prod_69daa8a08a6d2	thumb	640	800
img_69daf887b7f62	/uploads/products/paramascotasec-correa-extensible-de-3-metro-accesorios-verde-perro-y-gato-miniatura-20260412-a1f60b5876.jpg	prod_imp_69dac0813fb90	thumb	640	800
img_69dd7181ef5f3	/uploads/products/paramascotasec-dispensador-de-fundas-morado-accesorios-morado-perro-y-gato-ficha-20260413-570fba0a3d.jpg	prod_imp_69dac0810e042	gallery	1200	1500
img_69dd7181ef81e	/uploads/products/paramascotasec-dispensador-de-fundas-morado-accesorios-morado-perro-y-gato-miniatura-20260413-a0b899b1ee.jpg	prod_imp_69dac0810e042	thumb	640	800
img_69dd71e2d2a38	/uploads/products/paramascotasec-pelota-pequena-roja-accesorios-roja-perro-y-gato-ficha-20260413-91ced2845c.jpg	prod_imp_69dac0813d61e	gallery	1200	1500
img_69dd71e2d45e3	/uploads/products/paramascotasec-pelota-pequena-roja-accesorios-roja-perro-y-gato-miniatura-20260413-34d0913610.jpg	prod_imp_69dac0813d61e	thumb	640	800
img_69dd720cefad5	/uploads/products/paramascotasec-pelota-pequena-turquesa-accesorios-turquesa-perro-y-gato-ficha-20260413-8e6f03d1b6.jpg	prod_imp_69dac0813ad61	gallery	1200	1500
img_69dd720cefe73	/uploads/products/paramascotasec-pelota-pequena-turquesa-accesorios-turquesa-perro-y-gato-miniatura-20260413-ede605fa72.jpg	prod_imp_69dac0813ad61	thumb	640	800
img_69dd721fdb09b	/uploads/products/paramascotasec-dispensador-de-fundas-azul-accesorios-azul-perro-y-gato-ficha-20260413-4fb233aa3d.jpg	prod_imp_69dac08123bff	gallery	1200	1500
img_69dd721fde9ba	/uploads/products/paramascotasec-dispensador-de-fundas-azul-accesorios-azul-perro-y-gato-miniatura-20260413-32f04bb5b0.jpg	prod_imp_69dac08123bff	thumb	640	800
img_69dd7236c389f	/uploads/products/paramascotasec-dispensador-de-fundas-verde-accesorios-verde-perro-y-gato-ficha-20260413-a2f83539fb.jpg	prod_imp_69dac081306cf	gallery	1200	1500
img_69dd7236c3f3a	/uploads/products/paramascotasec-dispensador-de-fundas-verde-accesorios-verde-perro-y-gato-miniatura-20260413-cd29007bcb.jpg	prod_imp_69dac081306cf	thumb	640	800
img_69dd72475a91f	/uploads/products/paramascotasec-dispensador-de-fundas-blanco-accesorios-blanco-perro-y-gato-ficha-20260413-082791f60e.jpg	prod_imp_69dac08131b2e	gallery	1200	1500
img_69dd72475adb8	/uploads/products/paramascotasec-dispensador-de-fundas-blanco-accesorios-blanco-perro-y-gato-miniatura-20260413-c45ab68364.jpg	prod_imp_69dac08131b2e	thumb	640	800
img_69dd728d14cf5	/uploads/products/paramascotasec-set-collar-correa-huellitas-accesorios-azul-perro-y-gato-ficha-20260413-6466e5c4dd.jpg	prod_imp_69dac081348b2	gallery	1200	1500
img_69dd728d14e96	/uploads/products/paramascotasec-set-collar-correa-huellitas-accesorios-azul-perro-y-gato-miniatura-20260413-0d43be6163.jpg	prod_imp_69dac081348b2	thumb	640	800
img_69dd72e8216d1	/uploads/products/paramascotasec-set-collar-correa-huellitas-accesorios-rosa-perro-y-gato-ficha-20260413-60c625b9e7.jpg	prod_imp_69dac08135c21	gallery	1200	1500
img_69dd72e821f9f	/uploads/products/paramascotasec-set-collar-correa-huellitas-accesorios-rosa-perro-y-gato-miniatura-20260413-8a36173201.jpg	prod_imp_69dac08135c21	thumb	640	800
img_69dd72fd0c0f3	/uploads/products/paramascotasec-set-collar-correa-huellitas-accesorios-naranja-perro-y-gato-ficha-20260413-ddcec94d12.jpg	prod_imp_69dac081370a9	gallery	1200	1500
img_69dd72fd0e9c7	/uploads/products/paramascotasec-set-collar-correa-huellitas-accesorios-naranja-perro-y-gato-miniatura-20260413-ec09f321ed.jpg	prod_imp_69dac081370a9	thumb	640	800
img_69dd73173be98	/uploads/products/paramascotasec-dispensador-de-fundas-verde-accesorios-verde-fluorescente-perro-y-gato-ficha-20260413-6cbe524891.jpg	prod_imp_69dac08133152	gallery	1200	1500
img_69dd73173d652	/uploads/products/paramascotasec-dispensador-de-fundas-verde-accesorios-verde-fluorescente-perro-y-gato-miniatura-20260413-f0756748c0.jpg	prod_imp_69dac08133152	thumb	640	800
img_69dd734191666	/uploads/products/paramascotasec-pelota-pequena-verde-accesorios-verde-perro-y-gato-ficha-20260413-d3693e384a.jpg	prod_imp_69dac0813976a	gallery	1200	1500
img_69dd7341920bf	/uploads/products/paramascotasec-pelota-pequena-verde-accesorios-verde-perro-y-gato-miniatura-20260413-168c3ab214.jpg	prod_imp_69dac0813976a	thumb	640	800
img_69dd7d5deca27	/uploads/products/paramascotasec-collar-con-cascabel-rojo-accesorios-rojo-m-perro-ficha-20260413-351c9a75ff.jpg	prod_69dd7805760fb	gallery	1200	1500
img_69dd7d5ded605	/uploads/products/paramascotasec-collar-con-cascabel-rojo-accesorios-rojo-m-perro-miniatura-20260413-2355f2b8a0.jpg	prod_69dd7805760fb	thumb	640	800
img_69ef92f4cc612	/uploads/products/paramascotasec-camiseta-seleccion-azul-ropa-l-azul-perro-ficha-20260411-8960193d52.webp	prod_imp_69da92e2df7ca	gallery	1200	1500
img_69ef92f4cca90	/uploads/products/paramascotasec-camiseta-seleccion-azul-ropa-l-azul-perro-ficha-20260411-c7f8c8e68b.webp	prod_imp_69da92e2df7ca	gallery	1200	1500
img_69ef92f4cd22e	/uploads/products/paramascotasec-camiseta-seleccion-azul-ropa-l-azul-perro-miniatura-20260411-e0bb83ce1c.webp	prod_imp_69da92e2df7ca	thumb	640	800
img_69e17d79040d4	/uploads/products/paramascotasec-dispensador-de-fundas-naranj-accesorios-naranja-perro-y-gato-ficha-20260413-83f507b9da.jpg	prod_imp_69dac0810480c	gallery	1200	1500
img_69e17d790a431	/uploads/products/paramascotasec-dispensador-de-fundas-naranj-accesorios-naranja-perro-y-gato-miniatura-20260413-55fc5de941.jpg	prod_imp_69dac0810480c	thumb	640	800
img_69e17d8884379	/uploads/products/paramascotasec-pelota-pequena-amarilla-accesorios-amarilla-perro-y-gato-ficha-20260413-d30c4c2a5f.jpg	prod_imp_69dac0813c22e	gallery	1200	1500
img_69e17d888586f	/uploads/products/paramascotasec-pelota-pequena-amarilla-accesorios-amarilla-perro-y-gato-miniatura-20260413-f4327d646e.jpg	prod_imp_69dac0813c22e	thumb	640	800
img_69e1912e59181	/uploads/products/paramascotasec-arnes-cafe-accesorios-cafe-perro-ficha-20260417-283e70440a.jpg	prod_46aaf62fe476b	gallery	1200	1500
img_69e1912e593b1	/uploads/products/paramascotasec-arnes-cafe-accesorios-cafe-perro-ficha-20260417-25871d4929.jpg	prod_46aaf62fe476b	gallery	1200	1500
img_69e1912e596d9	/uploads/products/paramascotasec-arnes-cafe-accesorios-cafe-perro-miniatura-20260417-0959a58dd1.jpg	prod_46aaf62fe476b	thumb	640	800
img_69ef98c133a50	/uploads/products/paramascotasec-carnitas-perro-carne-100-g-alimento-100gr-perro-ficha-20260419-c020b012e6.webp	prod_2f5097856993e	gallery	1200	1500
img_69ef98c13fc73	/uploads/products/paramascotasec-carnitas-perro-carne-100-g-alimento-100gr-perro-miniatura-20260419-4fd7ed1ec7.webp	prod_2f5097856993e	thumb	640	800
img_69e191681a66f	/uploads/products/paramascotasec-arnes-turquesa-accesorios-turquesa-perro-ficha-20260417-072a9ec0de.jpg	prod_0b05e01b8fd59	gallery	1200	1500
img_69e191681b7fa	/uploads/products/paramascotasec-arnes-turquesa-accesorios-turquesa-perro-ficha-20260417-f57943790d.jpg	prod_0b05e01b8fd59	gallery	1200	1500
img_69e191681db68	/uploads/products/paramascotasec-arnes-turquesa-accesorios-turquesa-perro-miniatura-20260417-808ded41ca.jpg	prod_0b05e01b8fd59	thumb	640	800
img_69e2dc61bc986	/uploads/products/paramascotasec-collar-con-cascabel-rosado-accesorios-rosa-m-perro-ficha-20260418-f523b8ecf5.jpg	prod_15d19620b14e9	gallery	1200	1500
img_69e2dc61bdf08	/uploads/products/paramascotasec-collar-con-cascabel-rosado-accesorios-rosa-m-perro-miniatura-20260418-93fb8e32ea.jpg	prod_15d19620b14e9	thumb	640	800
img_69e2e09500feb	/uploads/products/paramascotasec-procan-adulto-raza-mediana-g-alimento-2kg-perro-ficha-20260418-61ffa378e8.jpg	prod_3a747a40080e3	gallery	1200	1500
img_69e2e095022fd	/uploads/products/paramascotasec-procan-adulto-raza-mediana-g-alimento-2kg-perro-miniatura-20260418-4f9a3f561c.jpg	prod_3a747a40080e3	thumb	640	800
img_69e2e09bbf2e4	/uploads/products/paramascotasec-procan-adulto-raza-mediana-g-alimento-4kg-perro-ficha-20260418-d6ce5aefe2.jpg	prod_798feb6864c87	gallery	1200	1500
img_69e2e09bc0576	/uploads/products/paramascotasec-procan-adulto-raza-mediana-g-alimento-4kg-perro-miniatura-20260418-63d10f4511.jpg	prod_798feb6864c87	thumb	640	800
img_69e2e0a1be9a7	/uploads/products/paramascotasec-procan-adulto-raza-mediana-g-alimento-30kg-perro-ficha-20260418-d8a9092fd6.jpg	prod_37ca518d75293	gallery	1200	1500
img_69e2e0a1bed49	/uploads/products/paramascotasec-procan-adulto-raza-mediana-g-alimento-30kg-perro-miniatura-20260418-d11d49bf32.jpg	prod_37ca518d75293	thumb	640	800
img_69e2e0a6d9ed1	/uploads/products/paramascotasec-procan-cachorro-raza-mediana-alimento-2kg-perro-ficha-20260418-42f3cfe756.jpg	prod_c7164cb8d142f	gallery	1200	1500
img_69e2e0a6da2f0	/uploads/products/paramascotasec-procan-cachorro-raza-mediana-alimento-2kg-perro-miniatura-20260418-f846b617b7.jpg	prod_c7164cb8d142f	thumb	640	800
img_69e2e123b81f7	/uploads/products/paramascotasec-procat-care-adulto-pollo-2-k-alimento-2kg-gato-ficha-20260418-33e512fb96.jpg	prod_54c64f6cb2fbb	gallery	1200	1500
img_69e2e123c201a	/uploads/products/paramascotasec-procat-care-adulto-pollo-2-k-alimento-2kg-gato-miniatura-20260418-7a549f9dc6.jpg	prod_54c64f6cb2fbb	thumb	640	800
img_69e2e3750ff32	/uploads/products/paramascotasec-compa-adulto-30-kg-alimento-30kg-perro-ficha-20260418-4528050aee.jpg	prod_4aaadb2e91ea6	gallery	1200	1500
img_69e2e37511ad9	/uploads/products/paramascotasec-compa-adulto-30-kg-alimento-30kg-perro-miniatura-20260418-606de6b104.jpg	prod_4aaadb2e91ea6	thumb	640	800
img_69e2e3eaa01dc	/uploads/products/paramascotasec-procan-cachorro-raza-mediana-alimento-4kg-perro-ficha-20260418-e4f3fa87ed.jpg	prod_0f15a001656dc	gallery	1200	1500
img_69e2e3eaa443a	/uploads/products/paramascotasec-procan-cachorro-raza-mediana-alimento-4kg-perro-miniatura-20260418-9f813d65de.jpg	prod_0f15a001656dc	thumb	640	800
img_69ef92fe5dc79	/uploads/products/paramascotasec-camiseta-seleccion-azul-ropa-m-azul-perro-ficha-20260411-e06d837c98.webp	prod_imp_69da92e2d910b	gallery	1200	1500
img_69ef92fe5e523	/uploads/products/paramascotasec-camiseta-seleccion-azul-ropa-m-azul-perro-ficha-20260411-fd38c201aa.webp	prod_imp_69da92e2d910b	gallery	1200	1500
img_69ef821c44340	/uploads/products/paramascotasec-avant-cachorro-raza-mediana-alimento-2kg-perro-ficha-20260418-61a8cb6653.webp	prod_32796f67d2779	gallery	1200	1500
img_69ef821c44a51	/uploads/products/paramascotasec-avant-cachorro-raza-mediana-alimento-2kg-perro-miniatura-20260418-fbe95b035a.webp	prod_32796f67d2779	thumb	640	800
img_69ef92fe5ed52	/uploads/products/paramascotasec-camiseta-seleccion-azul-ropa-m-azul-perro-miniatura-20260411-366fdc9510.webp	prod_imp_69da92e2d910b	thumb	640	800
img_69ef98d5c9837	/uploads/products/paramascotasec-carnitas-perro-cerdo-salmon-alimento-100gr-perro-ficha-20260419-e31ea7a769.webp	prod_c6f2b77c18a90	gallery	1200	1500
img_69ef98d5ca458	/uploads/products/paramascotasec-carnitas-perro-cerdo-salmon-alimento-100gr-perro-miniatura-20260419-a74462e507.webp	prod_c6f2b77c18a90	thumb	640	800
img_69ef9a970bfba	/uploads/products/paramascotasec-cepillo-vaporizador-aqua-gro-accesorios-m-amarillo-perro-y-gato-ficha-20260413-99d4e1953e.webp	prod_imp_69dac0813e7fe	gallery	1200	1500
img_69ef9a970c3b8	/uploads/products/paramascotasec-cepillo-vaporizador-aqua-gro-accesorios-m-amarillo-perro-y-gato-ficha-20260413-4c7f8f8b58.webp	prod_imp_69dac0813e7fe	gallery	1200	1500
img_69ef92676163e	/uploads/products/paramascotasec-camiseta-seleccion-amarilla-ropa-s-amarillo-perro-ficha-20260411-b5500fc597.webp	prod_imp_69da92e20fc1b	gallery	1200	1500
img_69ef926761e1a	/uploads/products/paramascotasec-camiseta-seleccion-amarilla-ropa-s-amarillo-perro-ficha-20260411-ea0c25cece.webp	prod_imp_69da92e20fc1b	gallery	1200	1500
img_69ef926762b84	/uploads/products/paramascotasec-camiseta-seleccion-amarilla-ropa-s-amarillo-perro-miniatura-20260411-c25bc5deb2.webp	prod_imp_69da92e20fc1b	thumb	640	800
img_69ef9309268ea	/uploads/products/paramascotasec-camiseta-seleccion-azul-ropa-s-azul-perro-ficha-20260411-c75cdeed04.webp	prod_imp_69da92e2cefe7	gallery	1200	1500
img_69ef930927047	/uploads/products/paramascotasec-camiseta-seleccion-azul-ropa-s-azul-perro-ficha-20260411-e852068894.webp	prod_imp_69da92e2cefe7	gallery	1200	1500
img_69ef930927a45	/uploads/products/paramascotasec-camiseta-seleccion-azul-ropa-s-azul-perro-miniatura-20260411-16ea37d913.webp	prod_imp_69da92e2cefe7	thumb	640	800
img_69ef98ec6ea5a	/uploads/products/paramascotasec-carnitas-perro-cordero-100-g-alimento-100gr-perro-ficha-20260419-b63cb4f4ba.webp	prod_24dd9543aa02c	gallery	1200	1500
img_69ef98ec6f2c4	/uploads/products/paramascotasec-carnitas-perro-cordero-100-g-alimento-100gr-perro-miniatura-20260419-8911b98226.webp	prod_24dd9543aa02c	thumb	640	800
img_69ef9a970c9ff	/uploads/products/paramascotasec-cepillo-vaporizador-aqua-gro-accesorios-m-amarillo-perro-y-gato-miniatura-20260413-7b65013459.webp	prod_imp_69dac0813e7fe	thumb	640	800
img_69e548fd05369	/uploads/products/paramascotasec-wellness-adult-dog-rpm-grain-alimento-2-5kg-perro-ficha-20260419-d688a6c893.jpg	prod_cbe02cc7a74d6	gallery	1200	1500
img_69e548fd0627e	/uploads/products/paramascotasec-wellness-adult-dog-rpm-grain-alimento-2-5kg-perro-miniatura-20260419-f1a602a2f1.jpg	prod_cbe02cc7a74d6	thumb	640	800
img_69efa4c231cc9	/uploads/products/paramascotasec-collar-con-cascabel-verde-accesorios-verde-m-perro-ficha-20260418-ca18a71eb9.webp	prod_31f9d29fcdbc8	gallery	1200	1500
img_69efa4c232871	/uploads/products/paramascotasec-collar-con-cascabel-verde-accesorios-verde-m-perro-miniatura-20260418-ca16db97d3.webp	prod_31f9d29fcdbc8	thumb	640	800
img_69ef82335ee25	/uploads/products/paramascotasec-avant-cachorro-raza-mediana-alimento-18kg-perro-ficha-20260419-a20e557b95.webp	prod_7a55cb584221f	gallery	1200	1500
img_69ef82335f6b7	/uploads/products/paramascotasec-avant-cachorro-raza-mediana-alimento-18kg-perro-miniatura-20260419-6eee3af074.webp	prod_7a55cb584221f	thumb	640	800
img_69e54aa6a426d	/uploads/products/paramascotasec-sachet-procan-trozos-adulto-alimento-85gr-perro-ficha-20260419-72433e0739.jpg	prod_406e26c552784	gallery	1200	1500
img_69e54aa6a479d	/uploads/products/paramascotasec-sachet-procan-trozos-adulto-alimento-85gr-perro-miniatura-20260419-596e0c34ca.jpg	prod_406e26c552784	thumb	640	800
img_69e54b0d08334	/uploads/products/paramascotasec-procat-care-alimento-humedo-alimento-85gr-gato-ficha-20260419-bcd3265d0f.jpg	prod_300008cdb421e	gallery	1200	1500
img_69e54b0d086ff	/uploads/products/paramascotasec-procat-care-alimento-humedo-alimento-85gr-gato-miniatura-20260419-7a87684c38.jpg	prod_300008cdb421e	thumb	640	800
img_69e54b337c69e	/uploads/products/paramascotasec-procat-care-alimento-humedo-alimento-85gr-gato-ficha-20260419-706430f901.jpg	prod_f5c9c76ea722e	gallery	1200	1500
img_69e54b33834a0	/uploads/products/paramascotasec-procat-care-alimento-humedo-alimento-85gr-gato-miniatura-20260419-876e17b3b2.jpg	prod_f5c9c76ea722e	thumb	640	800
img_69e68081273b9	/uploads/products/paramascotasec-collar-power-fit-negro-accesorios-l-negro-perro-ficha-20260420-41a35267a5.jpg	prod_7273bc805a4af	gallery	1200	1500
img_69e6808127883	/uploads/products/paramascotasec-collar-power-fit-negro-accesorios-l-negro-perro-miniatura-20260420-bfb2019741.jpg	prod_7273bc805a4af	thumb	640	800
img_69e6809ac6785	/uploads/products/paramascotasec-collar-power-fit-negro-accesorios-s-negro-perro-ficha-20260420-131f7b953a.jpg	prod_a91b53e3e4b4c	gallery	1200	1500
img_69e6809ac6bce	/uploads/products/paramascotasec-collar-power-fit-negro-accesorios-s-negro-perro-miniatura-20260420-a5c9f8763e.jpg	prod_a91b53e3e4b4c	thumb	640	800
img_69e680c63f8da	/uploads/products/paramascotasec-collar-power-fit-rojo-accesorios-m-rojo-perro-ficha-20260420-e84e6b9589.jpg	prod_84bf7763f797d	gallery	1200	1500
img_69e680c63fb12	/uploads/products/paramascotasec-collar-power-fit-rojo-accesorios-m-rojo-perro-miniatura-20260420-3e63bfe829.jpg	prod_84bf7763f797d	thumb	640	800
img_69e680e76f50b	/uploads/products/paramascotasec-collar-power-fit-rojo-con-de-accesorios-s-rojo-negro-perro-ficha-20260420-b3bd673971.jpg	prod_b9e23527b3c69	gallery	1200	1500
img_69e69decc802a	/uploads/products/paramascotasec-nutrapro-adulto-rpm-2-kg-alimento-2kg-perro-ficha-20260420-c1e9b12ed3.jpg	prod_c23e724e8ecfc	gallery	1200	1500
img_69ef91b3ac24a	/uploads/products/paramascotasec-chaleco-lazo-ropa-ficha-20260409-b2c6ffd9f5.webp	prod_69d7103e397c3	gallery	1200	1500
img_69ef91b3ac78f	/uploads/products/paramascotasec-chaleco-lazo-ropa-ficha-20260409-dab710b6fa.webp	prod_69d7103e397c3	gallery	1200	1500
img_69ef91b3ace64	/uploads/products/paramascotasec-chaleco-lazo-ropa-miniatura-20260409-c2a044c93d.webp	prod_69d7103e397c3	thumb	640	800
img_69e680e771ddd	/uploads/products/paramascotasec-collar-power-fit-rojo-con-de-accesorios-s-rojo-negro-perro-miniatura-20260420-09d8e8858d.jpg	prod_b9e23527b3c69	thumb	640	800
img_69e6810e8d55c	/uploads/products/paramascotasec-collar-power-fit-rojo-accesorios-l-rojo-perro-ficha-20260420-f7e8f7774f.jpg	prod_445a741c261fa	gallery	1200	1500
img_69e6810e8da00	/uploads/products/paramascotasec-collar-power-fit-rojo-accesorios-l-rojo-perro-miniatura-20260420-31d30a7e3e.jpg	prod_445a741c261fa	thumb	640	800
img_69e6812e072f0	/uploads/products/paramascotasec-collar-power-fit-negras-con-accesorios-s-negro-rojo-perro-ficha-20260420-72fa9b5332.jpg	prod_634e401b41491	gallery	1200	1500
img_69e6812e0810c	/uploads/products/paramascotasec-collar-power-fit-negras-con-accesorios-s-negro-rojo-perro-miniatura-20260420-d493458306.jpg	prod_634e401b41491	thumb	640	800
img_69e6814949293	/uploads/products/paramascotasec-collar-power-fit-negro-con-d-accesorios-m-negro-rojo-perro-ficha-20260420-6081658c88.jpg	prod_27777c05cc43a	gallery	1200	1500
img_69e681494c563	/uploads/products/paramascotasec-collar-power-fit-negro-con-d-accesorios-m-negro-rojo-perro-miniatura-20260420-6991bfcd1b.jpg	prod_27777c05cc43a	thumb	640	800
img_69e683ebb28a9	/uploads/products/paramascotasec-dermahealth-advance-care-2-e-cuidado-salud-200ml-perro-ficha-20260420-b349506d9e.jpg	prod_559e4a2487ec4	gallery	1200	1500
img_69e683ebb433e	/uploads/products/paramascotasec-dermahealth-advance-care-2-e-cuidado-salud-200ml-perro-miniatura-20260420-26b1308c62.jpg	prod_559e4a2487ec4	thumb	640	800
img_69e6868feef58	/uploads/products/paramascotasec-dispensador-de-fundas-gris-accesorios-gris-perro-ficha-20260420-6450015cca.jpg	prod_ad2d8ff694290	gallery	1200	1500
img_69e6868fef476	/uploads/products/paramascotasec-dispensador-de-fundas-gris-accesorios-gris-perro-miniatura-20260420-07d2a3b622.jpg	prod_ad2d8ff694290	thumb	640	800
img_69e6878168b47	/uploads/products/paramascotasec-dog-chow-adulto-rmg-2-kg-alimento-2kg-perro-ficha-20260420-582ed395d7.jpg	prod_da179b1a131b9	gallery	1200	1500
img_69e68781693b7	/uploads/products/paramascotasec-dog-chow-adulto-rmg-2-kg-alimento-2kg-perro-miniatura-20260420-e6ffa73677.jpg	prod_da179b1a131b9	thumb	640	800
img_69e687b44beaa	/uploads/products/paramascotasec-dog-chow-adulto-rp-2-kg-alimento-2kg-perro-ficha-20260420-733f2f49b2.jpg	prod_f74a174eae3ee	gallery	1200	1500
img_69e687b44c8c2	/uploads/products/paramascotasec-dog-chow-adulto-rp-2-kg-alimento-2kg-perro-miniatura-20260420-a71c43c86a.jpg	prod_f74a174eae3ee	thumb	640	800
img_69e687e98dd3c	/uploads/products/paramascotasec-dog-chow-cachorro-rp-2-kg-alimento-2kg-perro-ficha-20260420-8df6c2cc5b.jpg	prod_092e88b295775	gallery	1200	1500
img_69e687e98e2f9	/uploads/products/paramascotasec-dog-chow-cachorro-rp-2-kg-alimento-2kg-perro-miniatura-20260420-629cd12b02.jpg	prod_092e88b295775	thumb	640	800
img_69e68d8d1ac77	/uploads/products/paramascotasec-dog-chow-trozos-adulto-corde-alimento-100gr-perro-ficha-20260420-861eb2baa3.jpg	prod_ca237dae4e0df	gallery	1200	1500
img_69e68d8d1ecf9	/uploads/products/paramascotasec-dog-chow-trozos-adulto-corde-alimento-100gr-perro-miniatura-20260420-567915f9c7.jpg	prod_ca237dae4e0df	thumb	640	800
img_69e68e9cee40a	/uploads/products/paramascotasec-dog-chow-trozos-cachorro-pol-alimento-100gr-perro-ficha-20260420-2f3c6944ff.jpg	prod_9aa2a0293e2c7	gallery	1200	1500
img_69e68e9d07111	/uploads/products/paramascotasec-dog-chow-trozos-cachorro-pol-alimento-100gr-perro-miniatura-20260420-b1df2c840a.jpg	prod_9aa2a0293e2c7	thumb	640	800
img_69e68f3b9f587	/uploads/products/paramascotasec-dog-chow-trozos-adulto-salmo-alimento-100gr-perro-ficha-20260420-1f60bf759b.jpg	prod_a2d5c29becbd9	gallery	1200	1500
img_69e68f3b9fa15	/uploads/products/paramascotasec-dog-chow-trozos-adulto-salmo-alimento-100gr-perro-miniatura-20260420-e764c7b653.jpg	prod_a2d5c29becbd9	thumb	640	800
img_69e68faa02d28	/uploads/products/paramascotasec-dog-chow-trozos-adulto-pollo-alimento-100gr-perro-ficha-20260420-1c83103b8f.jpg	prod_b1c2f52f39a6c	gallery	1200	1500
img_69e68faa06f0b	/uploads/products/paramascotasec-dog-chow-trozos-adulto-pollo-alimento-100gr-perro-miniatura-20260420-4c717afc3a.jpg	prod_b1c2f52f39a6c	thumb	640	800
img_69e68fc61cbb8	/uploads/products/paramascotasec-dog-chow-trozos-adulto-carne-alimento-100gr-perro-ficha-20260420-8b4a051780.jpg	prod_30a73dd0b1c3c	gallery	1200	1500
img_69e68fc61d6c1	/uploads/products/paramascotasec-dog-chow-trozos-adulto-carne-alimento-100gr-perro-miniatura-20260420-c8d5af5d85.jpg	prod_30a73dd0b1c3c	thumb	640	800
img_69e6906906f63	/uploads/products/paramascotasec-felix-pouch-classic-salmon-8-alimento-85gr-gato-ficha-20260420-e8a1227a72.jpg	prod_a00658958d306	gallery	1200	1500
img_69e6906907461	/uploads/products/paramascotasec-felix-pouch-classic-salmon-8-alimento-85gr-gato-miniatura-20260420-35c361c790.jpg	prod_a00658958d306	thumb	640	800
img_69e69082eb1db	/uploads/products/paramascotasec-felix-pouch-pescado-blanco-8-alimento-85gr-blanco-gato-ficha-20260420-07faf05c93.jpg	prod_22d29e9c51e99	gallery	1200	1500
img_69e69082f2575	/uploads/products/paramascotasec-felix-pouch-pescado-blanco-8-alimento-85gr-blanco-gato-miniatura-20260420-0976081a56.jpg	prod_22d29e9c51e99	thumb	640	800
img_69e694617e79d	/uploads/products/paramascotasec-felix-pouch-classic-atun-85-alimento-85gr-gato-ficha-20260420-12e0a5834c.jpg	prod_dabe287b42e8f	gallery	1200	1500
img_69e6946194f8e	/uploads/products/paramascotasec-felix-pouch-classic-atun-85-alimento-85gr-gato-miniatura-20260420-0a41d731ef.jpg	prod_dabe287b42e8f	thumb	640	800
img_69e6956cb8bfd	/uploads/products/paramascotasec-felix-pouch-classic-pavo-85-alimento-85gr-gato-ficha-20260420-0853519f29.jpg	prod_c5a823e5b80f6	gallery	1200	1500
img_69e6956cb9158	/uploads/products/paramascotasec-felix-pouch-classic-pavo-85-alimento-85gr-gato-miniatura-20260420-21a4be4f53.jpg	prod_c5a823e5b80f6	thumb	640	800
img_69e6965058668	/uploads/products/paramascotasec-guerpo-adulto-rmg-25-kg-alimento-25kg-perro-ficha-20260420-aa2bb19074.jpg	prod_dcd22eff089c1	gallery	1200	1500
img_69e6965058e6e	/uploads/products/paramascotasec-guerpo-adulto-rmg-25-kg-alimento-25kg-perro-miniatura-20260420-86ab7efde1.jpg	prod_dcd22eff089c1	thumb	640	800
img_69e69d1567f39	/uploads/products/paramascotasec-juguete-interactivo-cat-towe-accesorios-rosa-gato-ficha-20260420-0f5f9c616a.jpg	prod_55881532f481c	gallery	1200	1500
img_69e69d156891a	/uploads/products/paramascotasec-juguete-interactivo-cat-towe-accesorios-rosa-gato-miniatura-20260420-f49fc97d1b.jpg	prod_55881532f481c	thumb	640	800
img_69e69decc8a66	/uploads/products/paramascotasec-nutrapro-adulto-rpm-2-kg-alimento-2kg-perro-miniatura-20260420-ffc27f5a31.jpg	prod_c23e724e8ecfc	thumb	640	800
img_69e69e15d331e	/uploads/products/paramascotasec-nutrapro-cachorro-rpm-2-kg-alimento-2kg-perro-ficha-20260420-6b94998efa.jpg	prod_60ec4689093f6	gallery	1200	1500
img_69e69e15d56af	/uploads/products/paramascotasec-nutrapro-cachorro-rpm-2-kg-alimento-2kg-perro-miniatura-20260420-7cdb8126b4.jpg	prod_60ec4689093f6	thumb	640	800
img_69e6acb080170	/uploads/products/paramascotasec-nutrapro-catchup-tuna-salmon-alimento-700gr-gato-ficha-20260420-37e0d82c55.jpg	prod_fb1df5d2356a4	gallery	1200	1500
img_69e6acb080577	/uploads/products/paramascotasec-nutrapro-catchup-tuna-salmon-alimento-700gr-gato-miniatura-20260420-ba7028224f.jpg	prod_fb1df5d2356a4	thumb	640	800
img_69e6aed5c1f6a	/uploads/products/paramascotasec-nutrapro-catchup-pollo-14-g-alimento-700gr-gato-ficha-20260420-f8794c8de5.jpg	prod_9bc6629e13c1c	gallery	1200	1500
img_69e6aed5c3280	/uploads/products/paramascotasec-nutrapro-catchup-pollo-14-g-alimento-700gr-gato-miniatura-20260420-ce1795b358.jpg	prod_9bc6629e13c1c	thumb	640	800
img_69e6aff84048c	/uploads/products/paramascotasec-nutrapro-gato-gatito-2-kg-alimento-2-kg-gato-ficha-20260420-7914092277.jpg	prod_8e5015db2ddea	gallery	1200	1500
img_69e6aff840950	/uploads/products/paramascotasec-nutrapro-gato-gatito-2-kg-alimento-2-kg-gato-miniatura-20260420-bae7d29950.jpg	prod_8e5015db2ddea	thumb	640	800
img_69e6b09aa3c5f	/uploads/products/paramascotasec-nutrapro-gato-gatito-7-5-kg-alimento-7-5-kg-gato-ficha-20260420-e9707d906d.jpg	prod_db804d20019c7	gallery	1200	1500
img_69e6b09aa6945	/uploads/products/paramascotasec-nutrapro-gato-gatito-7-5-kg-alimento-7-5-kg-gato-miniatura-20260420-9c6a1f24d8.jpg	prod_db804d20019c7	thumb	640	800
img_69e6b5540a141	/uploads/products/paramascotasec-nutrapro-snack-nugget-gato-p-alimento-100-gr-gris-gato-ficha-20260420-77f1418374.jpg	prod_93704d9430b90	gallery	1200	1500
img_69e6b55411dc3	/uploads/products/paramascotasec-nutrapro-snack-nugget-gato-p-alimento-100-gr-gris-gato-miniatura-20260420-b3faa147e4.jpg	prod_93704d9430b90	thumb	640	800
img_69e6b58d89dce	/uploads/products/paramascotasec-nutrapro-snack-nugget-gato-s-alimento-100-gr-gris-gato-ficha-20260420-8dfa92629b.jpg	prod_ddc6b6200e35c	gallery	1200	1500
img_69e6b58da3cf6	/uploads/products/paramascotasec-nutrapro-snack-nugget-gato-s-alimento-100-gr-gris-gato-miniatura-20260420-10b0dcb6f1.jpg	prod_ddc6b6200e35c	thumb	640	800
img_69e6b61133f69	/uploads/products/paramascotasec-plato-de-acero-inoxidable-co-accesorios-small-perro-ficha-20260420-d6df9047fd.jpg	prod_503a9b8fb5716	gallery	1200	1500
img_69e6b61136f30	/uploads/products/paramascotasec-plato-de-acero-inoxidable-co-accesorios-small-perro-miniatura-20260420-20c7167201.jpg	prod_503a9b8fb5716	thumb	640	800
img_69e6b62a2cc5f	/uploads/products/paramascotasec-plato-de-acero-inoxidable-co-accesorios-medium-perro-ficha-20260420-310b8d964d.jpg	prod_d1eb6ab7a109a	gallery	1200	1500
img_69e6b62a3243c	/uploads/products/paramascotasec-plato-de-acero-inoxidable-co-accesorios-medium-perro-miniatura-20260420-1ea6a24ea9.jpg	prod_d1eb6ab7a109a	thumb	640	800
img_69e6b7461b116	/uploads/products/paramascotasec-sachet-procan-trozos-cachorr-alimento-85-gr-gris-perro-ficha-20260420-5164cedecd.jpg	prod_2fa250b5d8c8a	gallery	1200	1500
img_69e6b7461cc2b	/uploads/products/paramascotasec-sachet-procan-trozos-cachorr-alimento-85-gr-gris-perro-miniatura-20260420-9d56c70c01.jpg	prod_2fa250b5d8c8a	thumb	640	800
img_69ef824185d0d	/uploads/products/paramascotasec-avant-adulto-raza-mediana-gr-alimento-18kg-perro-ficha-20260420-a8a8006561.webp	prod_5e719dfa02e40	gallery	1200	1500
img_69ef8241877fd	/uploads/products/paramascotasec-avant-adulto-raza-mediana-gr-alimento-18kg-perro-miniatura-20260420-dd4bd80e84.webp	prod_5e719dfa02e40	thumb	640	800
img_69ef93145d533	/uploads/products/paramascotasec-camiseta-seleccion-blanca-ropa-l-blanco-perro-ficha-20260411-ccbc2365a7.webp	prod_imp_69da92e2eb9ac	gallery	1200	1500
img_69ef93145ddb7	/uploads/products/paramascotasec-camiseta-seleccion-blanca-ropa-l-blanco-perro-ficha-20260411-f54a007432.webp	prod_imp_69da92e2eb9ac	gallery	1200	1500
img_69ef93145ebb5	/uploads/products/paramascotasec-camiseta-seleccion-blanca-ropa-l-blanco-perro-miniatura-20260411-a42fa123f5.webp	prod_imp_69da92e2eb9ac	thumb	640	800
img_69ebedb98d03b	/uploads/products/paramascotasec-camiseta-polo-azul-ropa-ficha-20260411-d839338871.jpg	prod_69ebedb98b13c	gallery	1200	1500
img_69ebedb98d70c	/uploads/products/paramascotasec-camiseta-polo-azul-ropa-ficha-20260411-25d038a04c.jpg	prod_69ebedb98b13c	gallery	1200	1500
img_69ebedb98dce8	/uploads/products/paramascotasec-camiseta-polo-azul-ropa-miniatura-20260411-59bc172db2.jpg	prod_69ebedb98b13c	thumb	640	800
img_69ef951057fc2	/uploads/products/paramascotasec-cat-chow-gatitos-0-5-kg-alimento-0-5kg-gato-ficha-20260419-53ea2a6a45.webp	prod_55db92cc9cf72	gallery	1200	1500
img_69ef951058c3e	/uploads/products/paramascotasec-cat-chow-gatitos-0-5-kg-alimento-0-5kg-gato-miniatura-20260419-25fadb3688.webp	prod_55db92cc9cf72	thumb	640	800
img_69ef91d88a54f	/uploads/products/paramascotasec-chaleco-peluche-ropa-ficha-20260411-52d5c1865a.webp	prod_69da8ba81e481	gallery	1200	1500
img_69ef91d88aa2f	/uploads/products/paramascotasec-chaleco-peluche-ropa-m-gris-perro-ficha-20260411-85caf11c18.webp	prod_69da8ba81e481	gallery	1200	1500
img_69ef91d88b696	/uploads/products/paramascotasec-chaleco-peluche-ropa-m-gris-perro-miniatura-20260411-3b0fb6944e.webp	prod_69da8ba81e481	thumb	640	800
img_69ef9901f2619	/uploads/products/paramascotasec-carnitas-pouch-perro-pavo-te-alimento-100gr-perro-ficha-20260419-b37187d274.webp	prod_2b961b24bbf10	gallery	1200	1500
img_69ef9901f3bfd	/uploads/products/paramascotasec-carnitas-pouch-perro-pavo-te-alimento-100gr-perro-miniatura-20260419-da07271320.webp	prod_2b961b24bbf10	thumb	640	800
img_69ed1613bb3fb	/uploads/products/paramascotasec-arnes-gris-accesorios-gris-perro-ficha-20260417-1e69d4d490.jpg	prod_67dac0d95debd	gallery	1200	1500
img_69ed1613bbc92	/uploads/products/paramascotasec-arnes-gris-accesorios-gris-perro-ficha-20260417-cf8f700933.jpg	prod_67dac0d95debd	gallery	1200	1500
img_69ed1613bc517	/uploads/products/paramascotasec-arnes-gris-accesorios-gris-perro-miniatura-20260417-8af2521799.jpg	prod_67dac0d95debd	thumb	640	800
img_69ef9eb5affec	/uploads/products/paramascotasec-collar-con-cascabel-amarillo-accesorios-rosa-m-perro-ficha-20260427-641b583011.webp	prod_69ef9e31b3a09	gallery	1200	1500
img_69ef9eb5b0e56	/uploads/products/paramascotasec-collar-con-cascabel-amarillo-accesorios-rosa-m-perro-miniatura-20260427-b53bfea8ff.webp	prod_69ef9e31b3a09	thumb	640	800
img_69ef93206e255	/uploads/products/paramascotasec-camiseta-seleccion-blanca-ropa-m-blanco-perro-ficha-20260411-519146fb31.webp	prod_imp_69da92e2e9040	gallery	1200	1500
img_69ef93206eb23	/uploads/products/paramascotasec-camiseta-seleccion-blanca-ropa-m-blanco-perro-ficha-20260411-e4091ec855.webp	prod_imp_69da92e2e9040	gallery	1200	1500
img_69ed247f2c861	/uploads/products/paramascotasec-basic-camiseta-ropa-ficha-20260409-fcc626622f.jpg	prod_69d80398d7ee8	gallery	1200	1500
img_69ed247f2cbaf	/uploads/products/paramascotasec-basic-camiseta-ropa-ficha-20260409-069a0c3dbc.jpg	prod_69d80398d7ee8	gallery	1200	1500
img_69ed247f2cf92	/uploads/products/paramascotasec-basic-camiseta-ropa-miniatura-20260409-76c34e98b8.jpg	prod_69d80398d7ee8	thumb	640	800
img_69ed24e1af039	/uploads/products/paramascotasec-camiseta-i-love-mommy-ropa-ficha-20260411-30a773937f.jpg	prod_69da8c730828f	gallery	1200	1500
img_69ed24e1aff15	/uploads/products/paramascotasec-camiseta-i-love-mommy-ropa-ficha-20260411-e33a937c7d.jpg	prod_69da8c730828f	gallery	1200	1500
img_69ed24e1b0851	/uploads/products/paramascotasec-camiseta-i-love-mommy-ropa-miniatura-20260411-114ead7f95.jpg	prod_69da8c730828f	thumb	640	800
img_69ed250e4e99e	/uploads/products/paramascotasec-camiseta-i-love-mommy-ropa-l-naranja-perro-ficha-20260419-66cd775f0d.jpg	prod_dc72eba5e2be0	gallery	1200	1500
img_69ed250e4f03c	/uploads/products/paramascotasec-camiseta-i-love-mommy-ropa-l-naranja-perro-ficha-20260419-195a5f0790.jpg	prod_dc72eba5e2be0	gallery	1200	1500
img_69ed250e4fce1	/uploads/products/paramascotasec-camiseta-i-love-mommy-ropa-l-naranja-perro-miniatura-20260419-35a99fadfe.jpg	prod_dc72eba5e2be0	thumb	640	800
img_69ef8266942ca	/uploads/products/paramascotasec-avant-gatitos-1-7-kg-alimento-1-7kg-gato-ficha-20260418-7c4e0e7fa2.webp	prod_28f91b7c55d4f	gallery	1200	1500
img_69ef826698d8d	/uploads/products/paramascotasec-avant-gatitos-1-7-kg-alimento-1-7kg-gato-miniatura-20260418-9741d316b0.webp	prod_28f91b7c55d4f	thumb	640	800
img_69eef2603b3e5	/uploads/products/paramascotasec-arenero-verde-accesorios-verde-gato-ficha-20260427-87ce4bab5e.webp	prod_imp_69dac08149875	gallery	1200	1500
img_69eef2603bf8f	/uploads/products/paramascotasec-arenero-verde-accesorios-verde-gato-ficha-20260412-835c926eac.webp	prod_imp_69dac08149875	gallery	1200	1500
img_69eef2603c695	/uploads/products/paramascotasec-arenero-verde-accesorios-verde-gato-miniatura-20260427-3baba25d7e.webp	prod_imp_69dac08149875	thumb	640	800
img_69ef7770322d4	/uploads/products/paramascotasec-camiseta-polo-azul-ropa-ficha-20260411-d839338871.webp	prod_69ec057ab9585	gallery	1200	1500
img_69ef777033330	/uploads/products/paramascotasec-camiseta-polo-azul-ropa-ficha-20260411-25d038a04c.webp	prod_69ec057ab9585	gallery	1200	1500
img_69ef777034a73	/uploads/products/paramascotasec-camiseta-polo-azul-ropa-miniatura-20260411-59bc172db2.webp	prod_69ec057ab9585	thumb	640	800
img_69ef77b178a05	/uploads/products/paramascotasec-camiseta-polo-corazon-morada-ropa-m-morado-perro-ficha-20260411-e9058996b6.webp	prod_imp_69da92e1f2edb	gallery	1200	1500
img_69ef77b178e8d	/uploads/products/paramascotasec-camiseta-polo-corazon-morada-ropa-m-morado-perro-ficha-20260411-a889fb75bb.webp	prod_imp_69da92e1f2edb	gallery	1200	1500
img_69ef77b1795a8	/uploads/products/paramascotasec-camiseta-polo-corazon-morada-ropa-m-morado-perro-miniatura-20260411-2fd037e2bd.webp	prod_imp_69da92e1f2edb	thumb	640	800
img_69ef781ec751f	/uploads/products/paramascotasec-camiseta-polo-kisses-rosa-ropa-s-rosa-perro-ficha-20260411-b7ff8533ca.webp	prod_imp_69da92e1e11a0	gallery	1200	1500
img_69ef781ec7e73	/uploads/products/paramascotasec-camiseta-polo-kisses-rosa-ropa-s-rosa-perro-ficha-20260411-2dc3509e7d.webp	prod_imp_69da92e1e11a0	gallery	1200	1500
img_69ef781ec8d8a	/uploads/products/paramascotasec-camiseta-polo-kisses-rosa-ropa-s-rosa-perro-miniatura-20260411-c081a80f2c.webp	prod_imp_69da92e1e11a0	thumb	640	800
img_69ef7862f1e24	/uploads/products/paramascotasec-camiseta-monster-ropa-xs-perro-ficha-20260410-b26faf457d.png	prod_69d83dbbf2679	gallery	1200	1500
img_69ef7862f2a82	/uploads/products/paramascotasec-camiseta-monster-ropa-xs-perro-miniatura-20260410-464aeb0a72.png	prod_69d83dbbf2679	thumb	640	800
img_69ef788c6d0ca	/uploads/products/paramascotasec-camiseta-polo-love-rosa-ropa-s-rosa-perro-ficha-20260411-cd7b59e127.webp	prod_imp_69da92e1d1fc9	gallery	1200	1500
img_69ef788c6d4fa	/uploads/products/paramascotasec-camiseta-polo-love-rosa-ropa-s-rosa-perro-ficha-20260411-d3692a1d3d.webp	prod_imp_69da92e1d1fc9	gallery	1200	1500
img_69ef788c6dc2a	/uploads/products/paramascotasec-camiseta-polo-love-rosa-ropa-s-rosa-perro-miniatura-20260411-5e6e0254f9.webp	prod_imp_69da92e1d1fc9	thumb	640	800
img_69ef789e83fd1	/uploads/products/paramascotasec-camiseta-polo-love-rosa-ropa-m-rosa-perro-ficha-20260411-1adb810428.webp	prod_imp_69da92e1d8d06	gallery	1200	1500
img_69ef789e84b82	/uploads/products/paramascotasec-camiseta-polo-love-rosa-ropa-m-rosa-perro-ficha-20260411-cec6222b3c.webp	prod_imp_69da92e1d8d06	gallery	1200	1500
img_69ef789e85439	/uploads/products/paramascotasec-camiseta-polo-love-rosa-ropa-m-rosa-perro-miniatura-20260411-0868bdad75.webp	prod_imp_69da92e1d8d06	thumb	640	800
img_69ef78afe84cb	/uploads/products/paramascotasec-camiseta-polo-love-rosa-ropa-l-rosa-perro-ficha-20260411-2d2688c1ee.webp	prod_imp_69da92e1dbb96	gallery	1200	1500
img_69ef78afe8d01	/uploads/products/paramascotasec-camiseta-polo-love-rosa-ropa-l-rosa-perro-ficha-20260411-2c5772c7a3.webp	prod_imp_69da92e1dbb96	gallery	1200	1500
img_69ef78afe92bf	/uploads/products/paramascotasec-camiseta-polo-love-rosa-ropa-l-rosa-perro-miniatura-20260411-94231d0a28.webp	prod_imp_69da92e1dbb96	thumb	640	800
img_69ef93206fc0e	/uploads/products/paramascotasec-camiseta-seleccion-blanca-ropa-m-blanco-perro-miniatura-20260411-108eb015ac.webp	prod_imp_69da92e2e9040	thumb	640	800
img_69ef9575530ea	/uploads/products/paramascotasec-cat-chow-carne-0-5-kg-alimento-0-5kg-gato-ficha-20260419-527f530fcc.webp	prod_11508fde64678	gallery	1200	1500
img_69ef95755391f	/uploads/products/paramascotasec-cat-chow-carne-0-5-kg-alimento-0-5kg-gato-miniatura-20260419-5a3ce8c1db.webp	prod_11508fde64678	thumb	640	800
img_69ef99129149a	/uploads/products/paramascotasec-cani-cachorro-rmg-2-kg-alimento-2kg-perro-ficha-20260419-6b95f05816.webp	prod_e6fcec1e5536e	gallery	1200	1500
img_69ef82781bc9f	/uploads/products/paramascotasec-avant-gatos-adultos-1-7-kg-alimento-1-7kg-gato-ficha-20260418-dbe70fd1de.webp	prod_1b9079e7dfd6d	gallery	1200	1500
img_69ef991291c4e	/uploads/products/paramascotasec-cani-cachorro-rmg-2-kg-alimento-2kg-perro-miniatura-20260419-7f9b32a243.webp	prod_e6fcec1e5536e	thumb	640	800
img_69ef9aeb4605e	/uploads/products/paramascotasec-collar-con-cascabel-accesorios-l-perro-y-gato-ficha-20260413-39fb3917f4.webp	prod_imp_69dac08138222	gallery	1200	1500
img_69ef9aeb46dac	/uploads/products/paramascotasec-collar-con-cascabel-accesorios-l-perro-y-gato-miniatura-20260413-5cd78d822c.webp	prod_imp_69dac08138222	thumb	640	800
img_69ef82781c76b	/uploads/products/paramascotasec-avant-gatos-adultos-1-7-kg-alimento-1-7kg-gato-miniatura-20260418-9ba2a723bb.webp	prod_1b9079e7dfd6d	thumb	640	800
img_69efa2d8f0e06	/uploads/products/paramascotasec-collar-power-fit-azul-accesorios-l-azul-perro-ficha-20260420-131f0be74c.webp	prod_7757b463a4bb0	gallery	1200	1500
img_69efa2d8f2331	/uploads/products/paramascotasec-collar-power-fit-azul-accesorios-l-azul-perro-miniatura-20260420-e9c17bb266.webp	prod_7757b463a4bb0	thumb	640	800
img_69efa4e3743d4	/uploads/products/paramascotasec-collar-con-cascabel-verde-fl-accesorios-verde-fluorescente-m-perro-ficha-20260418-dc05d01ab9.webp	prod_4887d1f2988c6	gallery	1200	1500
img_69efa4e374dd7	/uploads/products/paramascotasec-collar-con-cascabel-verde-fl-accesorios-verde-fluorescente-m-perro-miniatura-20260418-8625bef0da.webp	prod_4887d1f2988c6	thumb	640	800
\.


--
-- Data for Name: InventoryLot; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."InventoryLot" (id, tenant_id, product_id, source_type, source_ref, unit_cost, initial_quantity, remaining_quantity, metadata, received_at, created_at, updated_at, purchase_invoice_id, purchase_invoice_item_id) FROM stdin;
lot_69ebedb993015	paramascotasec	prod_69ebedb98b13c	purchase_invoice	pitem_69ebedb990557	5.8300	1	1	{"reason": "initial_stock", "purchase_invoice_number": "470"}	2026-04-24 17:24:57.569257	2026-04-24 17:24:57.569257	2026-04-24 17:24:57.569257	pinv_69da92e1d3f26	pitem_69ebedb990557
lot_69d83dbc738cd	paramascotasec	prod_69d83dbbf2679	purchase_invoice	pitem_69d83dbc468a2	4.5000	1	0	{"reason": "initial_stock", "purchase_invoice_number": "001-003-000001343"}	2026-04-09 19:00:59.983717	2026-04-09 19:00:59.983717	2026-04-27 09:46:54.404335	pinv_69d45126b3386	pitem_69d83dbc468a2
lot_69ec057abf0d9	paramascotasec	prod_69ec057ab9585	purchase_invoice	pitem_69ec057abd654	3.9600	1	1	{"reason": "initial_stock", "purchase_invoice_number": "470"}	2026-04-24 19:06:18.758945	2026-04-24 19:06:18.758945	2026-04-24 19:06:18.758945	pinv_69da92e1d3f26	pitem_69ec057abd654
lot_69da92e1e05de	paramascotasec	prod_imp_69da92e1dbb96	purchase_invoice	pitem_69da92e1de907	5.8300	1	0	{"reason": "misha_import", "invoice_number": "470", "import_line_key": "Misha Fashion Pets|470|misha-fashion-pets-camiseta-polo-love-rosa-l|1|5.83"}	2026-04-11 13:28:49.839253	2026-04-11 13:28:49.839253	2026-04-27 09:53:34.503876	pinv_69da92e1d3f26	pitem_69da92e1de907
lot_69dac0814a793	paramascotasec	prod_imp_69dac08149875	purchase_invoice	pitem_69dac08149eaf	5.2200	6	5	{"reason": "viba_pets_import", "invoice_number": "SIN-FACTURA-VIBA-2026-04-11", "import_line_key": "Viba Pets|SIN-FACTURA-VIBA-2026-04-11|VIBA-2026-04-11-028|6|5.2200"}	2026-04-11 16:43:28.661337	2026-04-11 16:43:28.661337	2026-04-25 11:33:57.957928	pinv_69dac080af7b7	pitem_69dac08149eaf
lot_69ef9e31c7a89	paramascotasec	prod_69ef9e31b3a09	purchase_invoice	pitem_69ef9e31c099e	0.0000	1	1	{"reason": "initial_stock", "purchase_invoice_number": "001-004-000000913"}	2026-04-27 12:34:41.735488	2026-04-27 12:34:41.735488	2026-04-27 12:34:41.735488	pinv_69ef9e31bbf1c	pitem_69ef9e31c099e
lot_seed_0420ea600d5b61a31b36bebedd16b3d1	paramascotasec	prod_1b9079e7dfd6d	bootstrap_opening	prod_1b9079e7dfd6d	6.2300	6	1	{"seed": "bootstrap_schema"}	2026-04-16 19:47:22.663	2026-04-17 19:32:24.330468	2026-04-25 15:12:37.000025	\N	\N
lot_69efa41f503d9	paramascotasec	prod_69efa41f410d2	purchase_invoice	pitem_69efa41f49575	0.0000	1	1	{"reason": "initial_stock", "purchase_invoice_number": "001-004-000000913"}	2026-04-27 12:59:59.266297	2026-04-27 12:59:59.266297	2026-04-27 12:59:59.266297	pinv_69ef9e31bbf1c	pitem_69efa41f49575
lot_69d80398db7d5	paramascotasec	prod_69d80398d7ee8	purchase_invoice	pitem_69d80398da86b	5.0000	1	0	{"reason": "initial_stock", "purchase_invoice_number": "001-003-000001343"}	2026-04-09 14:52:56.884348	2026-04-09 14:52:56.884348	2026-04-25 15:30:55.176212	pinv_69d45126b3386	pitem_69d80398da86b
lot_69efa49e5777e	paramascotasec	prod_69efa49e505d5	purchase_invoice	pitem_69efa49e52fd4	0.0000	1	1	{"reason": "initial_stock", "purchase_invoice_number": "001-004-000000913"}	2026-04-27 13:02:06.329093	2026-04-27 13:02:06.329093	2026-04-27 13:02:06.329093	pinv_69ef9e31bbf1c	pitem_69efa49e52fd4
lot_69d45126b4086	paramascotasec	prod_69d45126b222d	purchase_invoice	pitem_69d45126b37ec	5.5000	1	1	{"reason": "initial_stock", "purchase_invoice_number": "001-003-000001343"}	2026-04-06 19:34:46.729574	2026-04-06 19:34:46.729574	2026-04-24 16:15:19.303016	pinv_69d45126b3386	pitem_69d45126b37ec
lot_69d7103e505e1	paramascotasec	prod_69d7103e397c3	purchase_invoice	pitem_69d7103e49706	5.5000	1	1	{"reason": "initial_stock", "purchase_invoice_number": "001-003-000001343"}	2026-04-08 21:34:38.235251	2026-04-08 21:34:38.235251	2026-04-24 16:15:19.303016	pinv_69d45126b3386	pitem_69d7103e49706
lot_69d44725579ad	paramascotasec	prod_69d4472545cf7	purchase_invoice	pitem_69d447254efbf	5.0000	1	1	{"reason": "initial_stock", "purchase_invoice_number": "09999999999"}	2026-04-06 18:52:05.285821	2026-04-06 18:52:05.285821	2026-04-24 16:15:19.303016	pinv_69d4472549e15	pitem_69d447254efbf
lot_69d44cfa5ae40	paramascotasec	prod_69d44cfa28313	purchase_invoice	pitem_69d44cfa512c5	5.0000	1	1	{"reason": "initial_stock", "purchase_invoice_number": "999999999999"}	2026-04-06 19:16:58.164104	2026-04-06 19:16:58.164104	2026-04-24 16:15:19.303016	pinv_69d44cfa41dbe	pitem_69d44cfa512c5
lot_69d8043e541c1	paramascotasec	prod_69d8043e47fd0	purchase_invoice	pitem_69d8043e4e536	7.0000	1	1	{"reason": "initial_stock", "purchase_invoice_number": "001-003-000001343"}	2026-04-09 14:55:42.294667	2026-04-09 14:55:42.294667	2026-04-24 16:15:19.303016	pinv_69d45126b3386	pitem_69d8043e4e536
lot_69da8a48dd9ac	paramascotasec	prod_69da8a48d3468	purchase_invoice	pitem_69da8a48dc5d0	6.0000	1	1	{"reason": "initial_stock", "purchase_invoice_number": "001-003-000001343"}	2026-04-11 12:52:08.864948	2026-04-11 12:52:08.864948	2026-04-24 16:15:19.303016	pinv_69d45126b3386	pitem_69da8a48dc5d0
lot_69da8ba82088a	paramascotasec	prod_69da8ba81e481	purchase_invoice	pitem_69da8ba81fddc	7.0000	1	1	{"reason": "initial_stock", "purchase_invoice_number": "001-003-000001343"}	2026-04-11 12:58:00.12396	2026-04-11 12:58:00.12396	2026-04-24 16:15:19.303016	pinv_69d45126b3386	pitem_69da8ba81fddc
lot_69da8c730b043	paramascotasec	prod_69da8c730828f	purchase_invoice	pitem_69da8c730a404	7.0000	1	1	{"reason": "initial_stock", "purchase_invoice_number": "001-003-000001343"}	2026-04-11 13:01:23.033347	2026-04-11 13:01:23.033347	2026-04-24 16:15:19.303016	pinv_69d45126b3386	pitem_69da8c730a404
lot_69da8d1ad16ae	paramascotasec	prod_69da8d1acf310	purchase_invoice	pitem_69da8d1ad0dae	7.5000	1	1	{"reason": "initial_stock", "purchase_invoice_number": "001-003-000001343"}	2026-04-11 13:04:10.848593	2026-04-11 13:04:10.848593	2026-04-24 16:15:19.303016	pinv_69d45126b3386	pitem_69da8d1ad0dae
lot_69da92e1d723b	paramascotasec	prod_imp_69da92e1d1fc9	purchase_invoice	pitem_69da92e1d584c	3.9600	1	1	{"reason": "misha_import", "invoice_number": "470", "import_line_key": "Misha Fashion Pets|470|misha-fashion-pets-camiseta-polo-love-rosa-s|1|3.96"}	2026-04-11 13:28:49.839253	2026-04-11 13:28:49.839253	2026-04-24 16:15:19.303016	pinv_69da92e1d3f26	pitem_69da92e1d584c
lot_69da92e1dacc6	paramascotasec	prod_imp_69da92e1d8d06	purchase_invoice	pitem_69da92e1d9e4d	4.9000	1	1	{"reason": "misha_import", "invoice_number": "470", "import_line_key": "Misha Fashion Pets|470|misha-fashion-pets-camiseta-polo-love-rosa-m|1|4.90"}	2026-04-11 13:28:49.839253	2026-04-11 13:28:49.839253	2026-04-24 16:15:19.303016	pinv_69da92e1d3f26	pitem_69da92e1d9e4d
lot_69da92e1e2921	paramascotasec	prod_imp_69da92e1e11a0	purchase_invoice	pitem_69da92e1e2090	3.9600	1	1	{"reason": "misha_import", "invoice_number": "470", "import_line_key": "Misha Fashion Pets|470|misha-fashion-pets-camiseta-polo-kisses-rosa-s|1|3.96"}	2026-04-11 13:28:49.839253	2026-04-11 13:28:49.839253	2026-04-24 16:15:19.303016	pinv_69da92e1d3f26	pitem_69da92e1e2090
lot_69da92e1e438a	paramascotasec	prod_imp_69da92e1e3204	purchase_invoice	pitem_69da92e1e3cb4	3.9600	1	1	{"reason": "misha_import", "invoice_number": "470", "import_line_key": "Misha Fashion Pets|470|misha-fashion-pets-camiseta-polo-azul-s|1|3.96"}	2026-04-11 13:28:49.839253	2026-04-11 13:28:49.839253	2026-04-24 16:15:19.303016	pinv_69da92e1d3f26	pitem_69da92e1e3cb4
lot_69da92e1ec913	paramascotasec	prod_imp_69da92e1e48ba	purchase_invoice	pitem_69da92e1e5068	5.8300	1	1	{"reason": "misha_import", "invoice_number": "470", "import_line_key": "Misha Fashion Pets|470|misha-fashion-pets-camiseta-polo-azul-l|1|5.83"}	2026-04-11 13:28:49.839253	2026-04-11 13:28:49.839253	2026-04-24 16:15:19.303016	pinv_69da92e1d3f26	pitem_69da92e1e5068
lot_69da92e1f17ec	paramascotasec	prod_imp_69da92e1ee6dd	purchase_invoice	pitem_69da92e1efa93	3.9600	1	1	{"reason": "misha_import", "invoice_number": "470", "import_line_key": "Misha Fashion Pets|470|misha-fashion-pets-camiseta-polo-verde-militar-s|1|3.96"}	2026-04-11 13:28:49.839253	2026-04-11 13:28:49.839253	2026-04-24 16:15:19.303016	pinv_69da92e1d3f26	pitem_69da92e1efa93
lot_69da92e20230f	paramascotasec	prod_imp_69da92e1f2edb	purchase_invoice	pitem_69da92e200704	4.9000	1	1	{"reason": "misha_import", "invoice_number": "470", "import_line_key": "Misha Fashion Pets|470|misha-fashion-pets-camiseta-polo-corazon-morada-m|1|4.90"}	2026-04-11 13:28:49.839253	2026-04-11 13:28:49.839253	2026-04-24 16:15:19.303016	pinv_69da92e1d3f26	pitem_69da92e200704
lot_69da92e2174d5	paramascotasec	prod_imp_69da92e20fc1b	purchase_invoice	pitem_69da92e216c63	6.5300	2	2	{"reason": "misha_import", "invoice_number": "470", "import_line_key": "Misha Fashion Pets|470|misha-fashion-pets-camiseta-seleccion-amarilla-s|2|6.53"}	2026-04-11 13:28:49.839253	2026-04-11 13:28:49.839253	2026-04-24 16:15:19.303016	pinv_69da92e1d3f26	pitem_69da92e216c63
lot_69da92e21eb86	paramascotasec	prod_imp_69da92e21796d	purchase_invoice	pitem_69da92e21ca7b	8.0000	2	2	{"reason": "misha_import", "invoice_number": "481", "import_line_key": "Misha Fashion Pets|481|misha-fashion-pets-camiseta-seleccion-amarilla-m|2|8.00"}	2026-04-11 13:28:49.839253	2026-04-11 13:28:49.839253	2026-04-24 16:15:19.303016	pinv_69da92e21c882	pitem_69da92e21ca7b
lot_69da92e2cdd36	paramascotasec	prod_imp_69da92e21f250	purchase_invoice	pitem_69da92e2c9a5f	9.0000	1	1	{"reason": "misha_import", "invoice_number": "481", "import_line_key": "Misha Fashion Pets|481|misha-fashion-pets-camiseta-seleccion-amarilla-l|1|9.00"}	2026-04-11 13:28:49.839253	2026-04-11 13:28:49.839253	2026-04-24 16:15:19.303016	pinv_69da92e21c882	pitem_69da92e2c9a5f
lot_69da92e2d393d	paramascotasec	prod_imp_69da92e2cefe7	purchase_invoice	pitem_69da92e2cf7cb	6.5300	1	1	{"reason": "misha_import", "invoice_number": "470", "import_line_key": "Misha Fashion Pets|470|misha-fashion-pets-camiseta-seleccion-azul-s|1|6.53"}	2026-04-11 13:28:49.839253	2026-04-11 13:28:49.839253	2026-04-24 16:15:19.303016	pinv_69da92e1d3f26	pitem_69da92e2cf7cb
lot_69da92e2ddd20	paramascotasec	prod_imp_69da92e2d910b	purchase_invoice	pitem_69da92e2dd96f	7.4600	1	1	{"reason": "misha_import", "invoice_number": "470", "import_line_key": "Misha Fashion Pets|470|misha-fashion-pets-camiseta-seleccion-azul-m|1|7.46"}	2026-04-11 13:28:49.839253	2026-04-11 13:28:49.839253	2026-04-24 16:15:19.303016	pinv_69da92e1d3f26	pitem_69da92e2dd96f
lot_69da92e2e753f	paramascotasec	prod_imp_69da92e2df7ca	purchase_invoice	pitem_69da92e2e714d	8.4000	1	1	{"reason": "misha_import", "invoice_number": "470", "import_line_key": "Misha Fashion Pets|470|misha-fashion-pets-camiseta-seleccion-azul-l|1|8.40"}	2026-04-11 13:28:49.839253	2026-04-11 13:28:49.839253	2026-04-24 16:15:19.303016	pinv_69da92e1d3f26	pitem_69da92e2e714d
lot_69da92e2e8d5a	paramascotasec	prod_imp_69da92e2e7945	purchase_invoice	pitem_69da92e2e85b3	6.5300	1	1	{"reason": "misha_import", "invoice_number": "470", "import_line_key": "Misha Fashion Pets|470|misha-fashion-pets-camiseta-seleccion-blanca-s|1|6.53"}	2026-04-11 13:28:49.839253	2026-04-11 13:28:49.839253	2026-04-24 16:15:19.303016	pinv_69da92e1d3f26	pitem_69da92e2e85b3
lot_69da92e285c55	paramascotasec	prod_imp_69da92e21f250	purchase_invoice	pitem_69da92e23c203	8.4000	2	1	{"reason": "misha_import", "invoice_number": "470", "import_line_key": "Misha Fashion Pets|470|misha-fashion-pets-camiseta-seleccion-amarilla-l|2|8.40"}	2026-04-11 13:28:49.839253	2026-04-11 13:28:49.839253	2026-04-27 09:58:04.536019	pinv_69da92e1d3f26	pitem_69da92e23c203
lot_69da92e2090ec	paramascotasec	prod_imp_69da92e203e9b	purchase_invoice	pitem_69da92e205b1e	6.0600	2	0	{"reason": "misha_import", "invoice_number": "470", "import_line_key": "Misha Fashion Pets|470|misha-fashion-pets-camiseta-seleccion-amarilla-xs|2|6.06"}	2026-04-11 13:28:49.839253	2026-04-11 13:28:49.839253	2026-04-27 09:58:19.209158	pinv_69da92e1d3f26	pitem_69da92e205b1e
lot_69da92e21ad3e	paramascotasec	prod_imp_69da92e21796d	purchase_invoice	pitem_69da92e21a9b5	7.4600	2	0	{"reason": "misha_import", "invoice_number": "470", "import_line_key": "Misha Fashion Pets|470|misha-fashion-pets-camiseta-seleccion-amarilla-m|2|7.46"}	2026-04-11 13:28:49.839253	2026-04-11 13:28:49.839253	2026-04-27 09:58:34.766212	pinv_69da92e1d3f26	pitem_69da92e21a9b5
lot_69da92e2eb701	paramascotasec	prod_imp_69da92e2e9040	purchase_invoice	pitem_69da92e2eb2f4	7.4600	1	1	{"reason": "misha_import", "invoice_number": "470", "import_line_key": "Misha Fashion Pets|470|misha-fashion-pets-camiseta-seleccion-blanca-m|1|7.46"}	2026-04-11 13:28:49.839253	2026-04-11 13:28:49.839253	2026-04-24 16:15:19.303016	pinv_69da92e1d3f26	pitem_69da92e2eb2f4
lot_69da92e3157ff	paramascotasec	prod_imp_69da92e2eb9ac	purchase_invoice	pitem_69da92e312cc6	8.4000	1	1	{"reason": "misha_import", "invoice_number": "470", "import_line_key": "Misha Fashion Pets|470|misha-fashion-pets-camiseta-seleccion-blanca-l|1|8.40"}	2026-04-11 13:28:49.839253	2026-04-11 13:28:49.839253	2026-04-24 16:15:19.303016	pinv_69da92e1d3f26	pitem_69da92e312cc6
lot_69da9cd8159ee	paramascotasec	prod_69da9cd8105b8	purchase_invoice	pitem_69da9cd815294	3.4400	1	1	{"reason": "initial_stock", "purchase_invoice_number": "470"}	2026-04-11 14:11:20.066678	2026-04-11 14:11:20.066678	2026-04-24 16:15:19.303016	pinv_69da92e1d3f26	pitem_69da9cd815294
lot_69daa8a0916e5	paramascotasec	prod_69daa8a08a6d2	purchase_invoice	pitem_69daa8a08d6f7	3.9600	1	1	{"reason": "initial_stock", "purchase_invoice_number": "470"}	2026-04-11 15:01:36.566962	2026-04-11 15:01:36.566962	2026-04-24 16:15:19.303016	pinv_69da92e1d3f26	pitem_69daa8a08d6f7
lot_69daa8e3bb1d6	paramascotasec	prod_69daa8e29aa44	purchase_invoice	pitem_69daa8e3724c7	5.8300	1	1	{"reason": "initial_stock", "purchase_invoice_number": "470"}	2026-04-11 15:02:42.613604	2026-04-11 15:02:42.613604	2026-04-24 16:15:19.303016	pinv_69da92e1d3f26	pitem_69daa8e3724c7
lot_69dac080b6a38	paramascotasec	prod_imp_69dac080a9777	purchase_invoice	pitem_69dac080b171c	0.2400	5	5	{"reason": "viba_pets_import", "invoice_number": "SIN-FACTURA-VIBA-2026-04-11", "import_line_key": "Viba Pets|SIN-FACTURA-VIBA-2026-04-11|VIBA-2026-04-11-001|5|0.2400"}	2026-04-11 16:43:28.661337	2026-04-11 16:43:28.661337	2026-04-24 16:15:19.303016	pinv_69dac080af7b7	pitem_69dac080b171c
lot_69dac080c599c	paramascotasec	prod_imp_69dac080b8edb	purchase_invoice	pitem_69dac080baac5	0.2400	5	5	{"reason": "viba_pets_import", "invoice_number": "SIN-FACTURA-VIBA-2026-04-11", "import_line_key": "Viba Pets|SIN-FACTURA-VIBA-2026-04-11|VIBA-2026-04-11-002|5|0.2400"}	2026-04-11 16:43:28.661337	2026-04-11 16:43:28.661337	2026-04-24 16:15:19.303016	pinv_69dac080af7b7	pitem_69dac080baac5
lot_69dac080e4552	paramascotasec	prod_imp_69dac080ce242	purchase_invoice	pitem_69dac080d2df0	0.2400	7	7	{"reason": "viba_pets_import", "invoice_number": "SIN-FACTURA-VIBA-2026-04-11", "import_line_key": "Viba Pets|SIN-FACTURA-VIBA-2026-04-11|VIBA-2026-04-11-003|7|0.2400"}	2026-04-11 16:43:28.661337	2026-04-11 16:43:28.661337	2026-04-24 16:15:19.303016	pinv_69dac080af7b7	pitem_69dac080d2df0
lot_69dac08100d72	paramascotasec	prod_imp_69dac080e7ad7	purchase_invoice	pitem_69dac080ef8cc	0.2400	7	7	{"reason": "viba_pets_import", "invoice_number": "SIN-FACTURA-VIBA-2026-04-11", "import_line_key": "Viba Pets|SIN-FACTURA-VIBA-2026-04-11|VIBA-2026-04-11-004|7|0.2400"}	2026-04-11 16:43:28.661337	2026-04-11 16:43:28.661337	2026-04-24 16:15:19.303016	pinv_69dac080af7b7	pitem_69dac080ef8cc
lot_69dac0810af5e	paramascotasec	prod_imp_69dac0810480c	purchase_invoice	pitem_69dac08107c8a	0.2900	1	1	{"reason": "viba_pets_import", "invoice_number": "SIN-FACTURA-VIBA-2026-04-11", "import_line_key": "Viba Pets|SIN-FACTURA-VIBA-2026-04-11|VIBA-2026-04-11-005|1|0.2900"}	2026-04-11 16:43:28.661337	2026-04-11 16:43:28.661337	2026-04-24 16:15:19.303016	pinv_69dac080af7b7	pitem_69dac08107c8a
lot_69dac0811e9b3	paramascotasec	prod_imp_69dac0810e042	purchase_invoice	pitem_69dac08119fb0	0.2900	1	1	{"reason": "viba_pets_import", "invoice_number": "SIN-FACTURA-VIBA-2026-04-11", "import_line_key": "Viba Pets|SIN-FACTURA-VIBA-2026-04-11|VIBA-2026-04-11-006|1|0.2900"}	2026-04-11 16:43:28.661337	2026-04-11 16:43:28.661337	2026-04-24 16:15:19.303016	pinv_69dac080af7b7	pitem_69dac08119fb0
lot_69dac0813020c	paramascotasec	prod_imp_69dac08123bff	purchase_invoice	pitem_69dac0812d78a	0.2900	2	2	{"reason": "viba_pets_import", "invoice_number": "SIN-FACTURA-VIBA-2026-04-11", "import_line_key": "Viba Pets|SIN-FACTURA-VIBA-2026-04-11|VIBA-2026-04-11-007|2|0.2900"}	2026-04-11 16:43:28.661337	2026-04-11 16:43:28.661337	2026-04-24 16:15:19.303016	pinv_69dac080af7b7	pitem_69dac0812d78a
lot_69dac08131592	paramascotasec	prod_imp_69dac081306cf	purchase_invoice	pitem_69dac08130f05	0.2900	1	1	{"reason": "viba_pets_import", "invoice_number": "SIN-FACTURA-VIBA-2026-04-11", "import_line_key": "Viba Pets|SIN-FACTURA-VIBA-2026-04-11|VIBA-2026-04-11-008|1|0.2900"}	2026-04-11 16:43:28.661337	2026-04-11 16:43:28.661337	2026-04-24 16:15:19.303016	pinv_69dac080af7b7	pitem_69dac08130f05
lot_69dac08132b52	paramascotasec	prod_imp_69dac08131b2e	purchase_invoice	pitem_69dac08132137	0.2900	1	1	{"reason": "viba_pets_import", "invoice_number": "SIN-FACTURA-VIBA-2026-04-11", "import_line_key": "Viba Pets|SIN-FACTURA-VIBA-2026-04-11|VIBA-2026-04-11-009|1|0.2900"}	2026-04-11 16:43:28.661337	2026-04-11 16:43:28.661337	2026-04-24 16:15:19.303016	pinv_69dac080af7b7	pitem_69dac08132137
lot_69dac08134428	paramascotasec	prod_imp_69dac08133152	purchase_invoice	pitem_69dac08133c41	0.2900	1	1	{"reason": "viba_pets_import", "invoice_number": "SIN-FACTURA-VIBA-2026-04-11", "import_line_key": "Viba Pets|SIN-FACTURA-VIBA-2026-04-11|VIBA-2026-04-11-010|1|0.2900"}	2026-04-11 16:43:28.661337	2026-04-11 16:43:28.661337	2026-04-24 16:15:19.303016	pinv_69dac080af7b7	pitem_69dac08133c41
lot_69dac081357a4	paramascotasec	prod_imp_69dac081348b2	purchase_invoice	pitem_69dac08134f48	1.0200	2	2	{"reason": "viba_pets_import", "invoice_number": "SIN-FACTURA-VIBA-2026-04-11", "import_line_key": "Viba Pets|SIN-FACTURA-VIBA-2026-04-11|VIBA-2026-04-11-011|2|1.0200"}	2026-04-11 16:43:28.661337	2026-04-11 16:43:28.661337	2026-04-24 16:15:19.303016	pinv_69dac080af7b7	pitem_69dac08134f48
lot_69dac08136a54	paramascotasec	prod_imp_69dac08135c21	purchase_invoice	pitem_69dac08136290	1.0200	2	2	{"reason": "viba_pets_import", "invoice_number": "SIN-FACTURA-VIBA-2026-04-11", "import_line_key": "Viba Pets|SIN-FACTURA-VIBA-2026-04-11|VIBA-2026-04-11-012|2|1.0200"}	2026-04-11 16:43:28.661337	2026-04-11 16:43:28.661337	2026-04-24 16:15:19.303016	pinv_69dac080af7b7	pitem_69dac08136290
lot_69dac08137ddd	paramascotasec	prod_imp_69dac081370a9	purchase_invoice	pitem_69dac0813770c	1.0200	2	2	{"reason": "viba_pets_import", "invoice_number": "SIN-FACTURA-VIBA-2026-04-11", "import_line_key": "Viba Pets|SIN-FACTURA-VIBA-2026-04-11|VIBA-2026-04-11-013|2|1.0200"}	2026-04-11 16:43:28.661337	2026-04-11 16:43:28.661337	2026-04-24 16:15:19.303016	pinv_69dac080af7b7	pitem_69dac0813770c
lot_seed_43e6425652b825e098c6422200326801	paramascotasec	prod_4887d1f2988c6	bootstrap_opening	prod_4887d1f2988c6	0.0000	1	1	{"seed": "bootstrap_schema"}	2026-04-16 20:13:54.238	2026-04-17 19:32:24.330468	2026-04-24 16:15:19.303016	\N	\N
lot_69dac0813905b	paramascotasec	prod_imp_69dac08138222	purchase_invoice	pitem_69dac081388e0	0.0000	6	6	{"reason": "viba_pets_import", "invoice_number": "SIN-FACTURA-VIBA-2026-04-11", "import_line_key": "Viba Pets|SIN-FACTURA-VIBA-2026-04-11|VIBA-2026-04-11-014|6|0.0000"}	2026-04-11 16:43:28.661337	2026-04-11 16:43:28.661337	2026-04-24 16:15:19.303016	pinv_69dac080af7b7	pitem_69dac081388e0
lot_69dac0813a6a2	paramascotasec	prod_imp_69dac0813976a	purchase_invoice	pitem_69dac08139f85	0.8700	2	2	{"reason": "viba_pets_import", "invoice_number": "SIN-FACTURA-VIBA-2026-04-11", "import_line_key": "Viba Pets|SIN-FACTURA-VIBA-2026-04-11|VIBA-2026-04-11-015|2|0.8700"}	2026-04-11 16:43:28.661337	2026-04-11 16:43:28.661337	2026-04-24 16:15:19.303016	pinv_69dac080af7b7	pitem_69dac08139f85
lot_69dac0813ba34	paramascotasec	prod_imp_69dac0813ad61	purchase_invoice	pitem_69dac0813b394	0.8700	2	2	{"reason": "viba_pets_import", "invoice_number": "SIN-FACTURA-VIBA-2026-04-11", "import_line_key": "Viba Pets|SIN-FACTURA-VIBA-2026-04-11|VIBA-2026-04-11-016|2|0.8700"}	2026-04-11 16:43:28.661337	2026-04-11 16:43:28.661337	2026-04-24 16:15:19.303016	pinv_69dac080af7b7	pitem_69dac0813b394
lot_seed_1b6bcb86e19253afaae6660689bd2c02	paramascotasec	prod_30a73dd0b1c3c	bootstrap_opening	prod_30a73dd0b1c3c	0.9900	2	2	{"seed": "bootstrap_schema"}	2026-04-16 19:42:33.907	2026-04-17 19:32:24.330468	2026-04-24 16:15:19.303016	\N	\N
lot_69dac0813d076	paramascotasec	prod_imp_69dac0813c22e	purchase_invoice	pitem_69dac0813c8f4	0.8700	1	1	{"reason": "viba_pets_import", "invoice_number": "SIN-FACTURA-VIBA-2026-04-11", "import_line_key": "Viba Pets|SIN-FACTURA-VIBA-2026-04-11|VIBA-2026-04-11-017|1|0.8700"}	2026-04-11 16:43:28.661337	2026-04-11 16:43:28.661337	2026-04-24 16:15:19.303016	pinv_69dac080af7b7	pitem_69dac0813c8f4
lot_69dac0813e3f9	paramascotasec	prod_imp_69dac0813d61e	purchase_invoice	pitem_69dac0813dd0b	0.8700	1	1	{"reason": "viba_pets_import", "invoice_number": "SIN-FACTURA-VIBA-2026-04-11", "import_line_key": "Viba Pets|SIN-FACTURA-VIBA-2026-04-11|VIBA-2026-04-11-018|1|0.8700"}	2026-04-11 16:43:28.661337	2026-04-11 16:43:28.661337	2026-04-24 16:15:19.303016	pinv_69dac080af7b7	pitem_69dac0813dd0b
lot_69dac08140a4f	paramascotasec	prod_imp_69dac0813fb90	purchase_invoice	pitem_69dac081402e5	2.6100	2	2	{"reason": "viba_pets_import", "invoice_number": "SIN-FACTURA-VIBA-2026-04-11", "import_line_key": "Viba Pets|SIN-FACTURA-VIBA-2026-04-11|VIBA-2026-04-11-020|2|2.6100"}	2026-04-11 16:43:28.661337	2026-04-11 16:43:28.661337	2026-04-24 16:15:19.303016	pinv_69dac080af7b7	pitem_69dac081402e5
lot_69dac08141dab	paramascotasec	prod_imp_69dac08140f18	purchase_invoice	pitem_69dac08141563	2.6100	2	2	{"reason": "viba_pets_import", "invoice_number": "SIN-FACTURA-VIBA-2026-04-11", "import_line_key": "Viba Pets|SIN-FACTURA-VIBA-2026-04-11|VIBA-2026-04-11-021|2|2.6100"}	2026-04-11 16:43:28.661337	2026-04-11 16:43:28.661337	2026-04-24 16:15:19.303016	pinv_69dac080af7b7	pitem_69dac08141563
lot_69dac08143233	paramascotasec	prod_imp_69dac0814226c	purchase_invoice	pitem_69dac08142a13	2.6100	2	2	{"reason": "viba_pets_import", "invoice_number": "SIN-FACTURA-VIBA-2026-04-11", "import_line_key": "Viba Pets|SIN-FACTURA-VIBA-2026-04-11|VIBA-2026-04-11-022|2|2.6100"}	2026-04-11 16:43:28.661337	2026-04-11 16:43:28.661337	2026-04-24 16:15:19.303016	pinv_69dac080af7b7	pitem_69dac08142a13
lot_69dac08144732	paramascotasec	prod_imp_69dac081436fa	purchase_invoice	pitem_69dac08143e62	1.3000	4	4	{"reason": "viba_pets_import", "invoice_number": "SIN-FACTURA-VIBA-2026-04-11", "import_line_key": "Viba Pets|SIN-FACTURA-VIBA-2026-04-11|VIBA-2026-04-11-023|4|1.3000"}	2026-04-11 16:43:28.661337	2026-04-11 16:43:28.661337	2026-04-24 16:15:19.303016	pinv_69dac080af7b7	pitem_69dac08143e62
lot_69dac08145b32	paramascotasec	prod_imp_69dac08144b80	purchase_invoice	pitem_69dac08145205	1.3000	4	4	{"reason": "viba_pets_import", "invoice_number": "SIN-FACTURA-VIBA-2026-04-11", "import_line_key": "Viba Pets|SIN-FACTURA-VIBA-2026-04-11|VIBA-2026-04-11-024|4|1.3000"}	2026-04-11 16:43:28.661337	2026-04-11 16:43:28.661337	2026-04-24 16:15:19.303016	pinv_69dac080af7b7	pitem_69dac08145205
lot_69dac08146e38	paramascotasec	prod_imp_69dac08145f91	purchase_invoice	pitem_69dac081466a7	7.8200	6	6	{"reason": "viba_pets_import", "invoice_number": "SIN-FACTURA-VIBA-2026-04-11", "import_line_key": "Viba Pets|SIN-FACTURA-VIBA-2026-04-11|VIBA-2026-04-11-025|6|7.8200"}	2026-04-11 16:43:28.661337	2026-04-11 16:43:28.661337	2026-04-24 16:15:19.303016	pinv_69dac080af7b7	pitem_69dac081466a7
lot_69dac0814823b	paramascotasec	prod_imp_69dac08147290	purchase_invoice	pitem_69dac0814795b	4.3500	3	3	{"reason": "viba_pets_import", "invoice_number": "SIN-FACTURA-VIBA-2026-04-11", "import_line_key": "Viba Pets|SIN-FACTURA-VIBA-2026-04-11|VIBA-2026-04-11-026|3|4.3500"}	2026-04-11 16:43:28.661337	2026-04-11 16:43:28.661337	2026-04-24 16:15:19.303016	pinv_69dac080af7b7	pitem_69dac0814795b
lot_69dac0814946c	paramascotasec	prod_imp_69dac0814865e	purchase_invoice	pitem_69dac08148ced	4.3500	6	6	{"reason": "viba_pets_import", "invoice_number": "SIN-FACTURA-VIBA-2026-04-11", "import_line_key": "Viba Pets|SIN-FACTURA-VIBA-2026-04-11|VIBA-2026-04-11-027|6|4.3500"}	2026-04-11 16:43:28.661337	2026-04-11 16:43:28.661337	2026-04-24 16:15:19.303016	pinv_69dac080af7b7	pitem_69dac08148ced
lot_69dd78057d870	paramascotasec	prod_69dd7805760fb	purchase_invoice	pitem_69dd78057aff1	0.0000	1	1	{"reason": "initial_stock", "purchase_invoice_number": "000000000000"}	2026-04-13 18:11:01.483372	2026-04-13 18:11:01.483372	2026-04-24 16:15:19.303016	pinv_69dd780579265	pitem_69dd78057aff1
lot_seed_0cebc2d481503cd7d511cef6d67f8747	paramascotasec	prod_dc72eba5e2be0	bootstrap_opening	prod_dc72eba5e2be0	6.0000	1	1	{"seed": "bootstrap_schema"}	2026-04-16 19:39:34.071	2026-04-17 19:32:24.330468	2026-04-24 16:15:19.303016	\N	\N
lot_seed_fd7235473d292ce89b2a575d420864c9	paramascotasec	prod_55881532f481c	bootstrap_opening	prod_55881532f481c	4.3500	1	1	{"seed": "bootstrap_schema"}	2026-04-16 20:13:54.238	2026-04-17 19:32:24.330468	2026-04-24 16:15:19.303016	\N	\N
lot_seed_8614485f20d279a0c67f75ef352c8813	paramascotasec	prod_8194a00e4c505	bootstrap_opening	prod_8194a00e4c505	0.0100	1	1	{"seed": "bootstrap_schema"}	2026-04-16 19:42:33.907	2026-04-17 19:32:24.330468	2026-04-24 16:15:19.303016	\N	\N
lot_seed_ab62c5726d0c5c7c64f5779ee7eab53c	paramascotasec	prod_2a3165d055178	bootstrap_opening	prod_2a3165d055178	25.5800	7	7	{"seed": "bootstrap_schema"}	2026-04-16 19:42:33.907	2026-04-17 19:32:24.330468	2026-04-24 16:15:19.303016	\N	\N
lot_seed_649ebc06682eabff7f87dc85a99414ab	paramascotasec	prod_dabe287b42e8f	bootstrap_opening	prod_dabe287b42e8f	1.1200	4	4	{"seed": "bootstrap_schema"}	2026-04-16 19:42:33.907	2026-04-17 19:32:24.330468	2026-04-24 16:15:19.303016	\N	\N
lot_seed_16c00f309f4d8a5066dd8ac6323f9f33	paramascotasec	prod_15d19620b14e9	bootstrap_opening	prod_15d19620b14e9	0.0000	1	1	{"seed": "bootstrap_schema"}	2026-04-16 20:13:54.238	2026-04-17 19:32:24.330468	2026-04-24 16:15:19.303016	\N	\N
lot_seed_62b5ab76959eddc2f4c25bbe8b68b409	paramascotasec	prod_092e88b295775	bootstrap_opening	prod_092e88b295775	7.9000	4	4	{"seed": "bootstrap_schema"}	2026-04-16 19:42:33.907	2026-04-17 19:32:24.330468	2026-04-24 16:15:19.303016	\N	\N
lot_seed_4f3054f02a4a79c5900052186fc58bd6	paramascotasec	prod_da179b1a131b9	bootstrap_opening	prod_da179b1a131b9	7.6200	2	2	{"seed": "bootstrap_schema"}	2026-04-16 19:42:33.907	2026-04-17 19:32:24.330468	2026-04-24 16:15:19.303016	\N	\N
lot_seed_dcdb70372216552b84616ea7afbffe9f	paramascotasec	prod_31f9d29fcdbc8	bootstrap_opening	prod_31f9d29fcdbc8	0.0000	1	1	{"seed": "bootstrap_schema"}	2026-04-16 20:13:54.238	2026-04-17 19:32:24.330468	2026-04-24 16:15:19.303016	\N	\N
lot_seed_5ffc17601f38c798b5ded82c2bb603ea	paramascotasec	prod_0b05e01b8fd59	bootstrap_opening	prod_0b05e01b8fd59	5.6500	2	2	{"seed": "bootstrap_schema"}	2026-04-16 20:13:54.238	2026-04-17 19:32:24.330468	2026-04-24 16:15:19.303016	\N	\N
lot_seed_db867c94c142731742fc90dde747fa6a	paramascotasec	prod_9aa2a0293e2c7	bootstrap_opening	prod_9aa2a0293e2c7	0.9900	2	2	{"seed": "bootstrap_schema"}	2026-04-16 19:42:33.907	2026-04-17 19:32:24.330468	2026-04-24 16:15:19.303016	\N	\N
lot_seed_bf62c12abf40448ed9ce90c0da370299	paramascotasec	prod_ad2d8ff694290	bootstrap_opening	prod_ad2d8ff694290	0.2900	1	1	{"seed": "bootstrap_schema"}	2026-04-16 20:13:54.238	2026-04-17 19:32:24.330468	2026-04-24 16:15:19.303016	\N	\N
lot_seed_222b315f2ca41ee4483652ab934045fd	paramascotasec	prod_503a9b8fb5716	bootstrap_opening	prod_503a9b8fb5716	2.1700	6	6	{"seed": "bootstrap_schema"}	2026-04-16 20:13:54.238	2026-04-17 19:32:24.330468	2026-04-24 16:15:19.303016	\N	\N
lot_seed_d1ee7dbc78c2a453af765a1a94d8531f	paramascotasec	prod_67dac0d95debd	bootstrap_opening	prod_67dac0d95debd	5.6500	2	1	{"seed": "bootstrap_schema"}	2026-04-16 20:13:54.238	2026-04-17 19:32:24.330468	2026-04-25 14:29:23.753135	\N	\N
lot_69dac0813f54c	paramascotasec	prod_imp_69dac0813e7fe	purchase_invoice	pitem_69dac0813eea8	3.0400	6	4	{"reason": "viba_pets_import", "invoice_number": "SIN-FACTURA-VIBA-2026-04-11", "import_line_key": "Viba Pets|SIN-FACTURA-VIBA-2026-04-11|VIBA-2026-04-11-019|6|3.0400"}	2026-04-11 16:43:28.661337	2026-04-11 16:43:28.661337	2026-04-27 11:40:29.729883	pinv_69dac080af7b7	pitem_69dac0813eea8
lot_seed_badad7e85120ff9ef3030c0a94d77849	paramascotasec	prod_ca237dae4e0df	bootstrap_opening	prod_ca237dae4e0df	0.9900	6	6	{"seed": "bootstrap_schema"}	2026-04-16 19:42:33.907	2026-04-17 19:32:24.330468	2026-04-24 16:15:19.303016	\N	\N
lot_seed_094a90887b5db7af082e68a4546b7dfe	paramascotasec	prod_a00658958d306	bootstrap_opening	prod_a00658958d306	1.1200	4	4	{"seed": "bootstrap_schema"}	2026-04-16 19:42:33.907	2026-04-17 19:32:24.330468	2026-04-24 16:15:19.303016	\N	\N
lot_seed_950a9363441bef0524efc765aceac156	paramascotasec	prod_c6f2b77c18a90	bootstrap_opening	prod_c6f2b77c18a90	0.7200	5	5	{"seed": "bootstrap_schema"}	2026-04-16 19:42:33.907	2026-04-17 19:32:24.330468	2026-04-24 16:15:19.303016	\N	\N
lot_seed_55ae1067df8e95f8464a7f47792a9c38	paramascotasec	prod_e6260031bdb45	bootstrap_opening	prod_e6260031bdb45	8.9600	2	2	{"seed": "bootstrap_schema"}	2026-04-16 19:42:33.907	2026-04-17 19:32:24.330468	2026-04-24 16:15:19.303016	\N	\N
lot_seed_ac7b4be5afeb69146b6f726b81d55e7b	paramascotasec	prod_e6fcec1e5536e	bootstrap_opening	prod_e6fcec1e5536e	6.6200	7	7	{"seed": "bootstrap_schema"}	2026-04-16 19:42:33.907	2026-04-17 19:32:24.330468	2026-04-24 16:15:19.303016	\N	\N
lot_seed_d02ab7d11f236442b2a9b7a513dce235	paramascotasec	prod_24dd9543aa02c	bootstrap_opening	prod_24dd9543aa02c	0.7200	5	5	{"seed": "bootstrap_schema"}	2026-04-16 19:42:33.907	2026-04-17 19:32:24.330468	2026-04-24 16:15:19.303016	\N	\N
lot_seed_be68b2fc2008b357f9f7f21cd29be358	paramascotasec	prod_b1c2f52f39a6c	bootstrap_opening	prod_b1c2f52f39a6c	0.9900	3	3	{"seed": "bootstrap_schema"}	2026-04-16 19:42:33.907	2026-04-17 19:32:24.330468	2026-04-24 16:15:19.303016	\N	\N
lot_seed_0af3df1ef3adbf6897c6c120a4063e76	paramascotasec	prod_dcd22eff089c1	bootstrap_opening	prod_dcd22eff089c1	54.1800	1	1	{"seed": "bootstrap_schema"}	2026-04-16 19:42:33.907	2026-04-17 19:32:24.330468	2026-04-24 16:15:19.303016	\N	\N
lot_seed_5692f7fe1c2e9110b71b1df23f269e37	paramascotasec	prod_a2d5c29becbd9	bootstrap_opening	prod_a2d5c29becbd9	0.9900	2	2	{"seed": "bootstrap_schema"}	2026-04-16 19:42:33.907	2026-04-17 19:32:24.330468	2026-04-24 16:15:19.303016	\N	\N
lot_seed_75f945df1c6bff393de03d9705dc4d64	paramascotasec	prod_2b961b24bbf10	bootstrap_opening	prod_2b961b24bbf10	0.7200	3	3	{"seed": "bootstrap_schema"}	2026-04-16 19:42:33.907	2026-04-17 19:32:24.330468	2026-04-24 16:15:19.303016	\N	\N
lot_seed_e115c576dffcd3dc149f9dc729f8fa6d	paramascotasec	prod_22d29e9c51e99	bootstrap_opening	prod_22d29e9c51e99	1.1200	4	4	{"seed": "bootstrap_schema"}	2026-04-16 19:42:33.907	2026-04-17 19:32:24.330468	2026-04-24 16:15:19.303016	\N	\N
lot_seed_791722f007e40ad84261c5e5d20b0cf6	paramascotasec	prod_55db92cc9cf72	bootstrap_opening	prod_55db92cc9cf72	3.5100	2	2	{"seed": "bootstrap_schema"}	2026-04-16 19:42:33.907	2026-04-17 19:32:24.330468	2026-04-24 16:15:19.303016	\N	\N
lot_seed_ac33e32054b5d01dd2ef58ae75e4eeda	paramascotasec	prod_c5a823e5b80f6	bootstrap_opening	prod_c5a823e5b80f6	1.1200	4	4	{"seed": "bootstrap_schema"}	2026-04-16 19:42:33.907	2026-04-17 19:32:24.330468	2026-04-24 16:15:19.303016	\N	\N
lot_seed_442c66db1c20aa6eb8ab8cb8768098eb	paramascotasec	prod_27de42b7f6c83	bootstrap_opening	prod_27de42b7f6c83	8.9600	2	2	{"seed": "bootstrap_schema"}	2026-04-16 19:42:33.907	2026-04-17 19:32:24.330468	2026-04-24 16:15:19.303016	\N	\N
lot_seed_e3e2bd4e0e6bbf83a4ea688bc64c5488	paramascotasec	prod_f74a174eae3ee	bootstrap_opening	prod_f74a174eae3ee	7.6200	2	2	{"seed": "bootstrap_schema"}	2026-04-16 19:42:33.907	2026-04-17 19:32:24.330468	2026-04-24 16:15:19.303016	\N	\N
lot_seed_db7b9c8c2911696d1b3ad24fd4382e93	paramascotasec	prod_d1eb6ab7a109a	bootstrap_opening	prod_d1eb6ab7a109a	3.0400	5	5	{"seed": "bootstrap_schema"}	2026-04-16 20:13:54.238	2026-04-17 19:32:24.330468	2026-04-24 16:15:19.303016	\N	\N
lot_seed_66c99d452c5a59254b32f90742f0376e	paramascotasec	prod_db804d20019c7	bootstrap_opening	prod_db804d20019c7	21.9700	5	5	{"seed": "bootstrap_schema"}	2026-04-16 19:45:36.736	2026-04-17 19:32:24.330468	2026-04-24 16:15:19.303016	\N	\N
lot_seed_7bade9f0e22f9542af643f88681af287	paramascotasec	prod_ddc6b6200e35c	bootstrap_opening	prod_ddc6b6200e35c	0.7400	12	12	{"seed": "bootstrap_schema"}	2026-04-16 19:45:36.736	2026-04-17 19:32:24.330468	2026-04-24 16:15:19.303016	\N	\N
lot_seed_dda4b854f4a63947271ef38067e26d55	paramascotasec	prod_93704d9430b90	bootstrap_opening	prod_93704d9430b90	0.7400	12	12	{"seed": "bootstrap_schema"}	2026-04-16 19:45:36.736	2026-04-17 19:32:24.330468	2026-04-24 16:15:19.303016	\N	\N
lot_seed_d869aed87c61cdea19964e319d972553	paramascotasec	prod_60ec4689093f6	bootstrap_opening	prod_60ec4689093f6	6.4500	6	6	{"seed": "bootstrap_schema"}	2026-04-16 19:45:36.736	2026-04-17 19:32:24.330468	2026-04-24 16:15:19.303016	\N	\N
lot_seed_77794855443ae9a7de37a4ec44ff0302	paramascotasec	prod_cbe02cc7a74d6	bootstrap_opening	prod_cbe02cc7a74d6	15.3900	3	3	{"seed": "bootstrap_schema"}	2026-04-16 19:45:36.736	2026-04-17 19:32:24.330468	2026-04-24 16:15:19.303016	\N	\N
lot_seed_de4a610aaa0069ac3fc81ccd949adab5	paramascotasec	prod_9bc6629e13c1c	bootstrap_opening	prod_9bc6629e13c1c	0.5100	100	100	{"seed": "bootstrap_schema"}	2026-04-16 19:45:36.736	2026-04-17 19:32:24.330468	2026-04-24 16:15:19.303016	\N	\N
lot_seed_2406b34dfab39647fcba823b9d7fe65e	paramascotasec	prod_559e4a2487ec4	bootstrap_opening	prod_559e4a2487ec4	2.4700	5	5	{"seed": "bootstrap_schema"}	2026-04-16 19:45:36.736	2026-04-17 19:32:24.330468	2026-04-24 16:15:19.303016	\N	\N
lot_seed_05f2d6580f6f0fdbdc5c8586f42aee61	paramascotasec	prod_fb1df5d2356a4	bootstrap_opening	prod_fb1df5d2356a4	0.5100	50	50	{"seed": "bootstrap_schema"}	2026-04-16 19:45:36.736	2026-04-17 19:32:24.330468	2026-04-24 16:15:19.303016	\N	\N
lot_seed_deb2eb3008dac981692138a2986ddd4e	paramascotasec	prod_8e5015db2ddea	bootstrap_opening	prod_8e5015db2ddea	6.2500	5	5	{"seed": "bootstrap_schema"}	2026-04-16 19:45:36.736	2026-04-17 19:32:24.330468	2026-04-24 16:15:19.303016	\N	\N
lot_seed_c7ab67f3f957d148d6df319626939543	paramascotasec	prod_c23e724e8ecfc	bootstrap_opening	prod_c23e724e8ecfc	6.2200	6	6	{"seed": "bootstrap_schema"}	2026-04-16 19:45:36.736	2026-04-17 19:32:24.330468	2026-04-24 16:15:19.303016	\N	\N
lot_seed_f0b57bd4a0bc30087fa5d8cc7beb0a24	paramascotasec	prod_406e26c552784	bootstrap_opening	prod_406e26c552784	0.6600	36	36	{"seed": "bootstrap_schema"}	2026-04-16 19:47:22.663	2026-04-17 19:32:24.330468	2026-04-24 16:15:19.303016	\N	\N
lot_seed_2631c136de45b05b477e858e277c250b	paramascotasec	prod_37ca518d75293	bootstrap_opening	prod_37ca518d75293	36.5600	1	1	{"seed": "bootstrap_schema"}	2026-04-16 19:47:22.663	2026-04-17 19:32:24.330468	2026-04-24 16:15:19.303016	\N	\N
lot_seed_134696efc51decac3f6676e6b4398aba	paramascotasec	prod_c7164cb8d142f	bootstrap_opening	prod_c7164cb8d142f	4.5800	4	4	{"seed": "bootstrap_schema"}	2026-04-16 19:47:22.663	2026-04-17 19:32:24.330468	2026-04-24 16:15:19.303016	\N	\N
lot_seed_5a520eb4bd6f121e8fee6e9af7e9971d	paramascotasec	prod_f5c9c76ea722e	bootstrap_opening	prod_f5c9c76ea722e	0.8100	12	12	{"seed": "bootstrap_schema"}	2026-04-16 19:47:22.663	2026-04-17 19:32:24.330468	2026-04-24 16:15:19.303016	\N	\N
lot_seed_cbf3b592ba3c0a3db662ce8d880bc908	paramascotasec	prod_bd5c3d5e886ba	bootstrap_opening	prod_bd5c3d5e886ba	5.8600	7	5	{"seed": "bootstrap_schema"}	2026-04-16 19:42:33.907	2026-04-17 19:32:24.330468	2026-04-27 10:19:59.410592	\N	\N
lot_seed_8069c73786f5116baddca9c3dc2cede9	paramascotasec	prod_2f5097856993e	bootstrap_opening	prod_2f5097856993e	0.7200	3	2	{"seed": "bootstrap_schema"}	2026-04-16 19:42:33.907	2026-04-17 19:32:24.330468	2026-04-27 10:45:50.386479	\N	\N
lot_seed_5c3537febb8c86ef97425fe092d9145d	paramascotasec	prod_11508fde64678	bootstrap_opening	prod_11508fde64678	3.2900	2	0	{"seed": "bootstrap_schema"}	2026-04-16 19:42:33.907	2026-04-17 19:32:24.330468	2026-04-27 11:08:44.200833	\N	\N
lot_seed_c91076561c3fd8c04df0ad77d4e666a8	paramascotasec	prod_91dc9a3465f00	bootstrap_opening	prod_91dc9a3465f00	3.2900	2	1	{"seed": "bootstrap_schema"}	2026-04-16 19:42:33.907	2026-04-17 19:32:24.330468	2026-04-27 11:35:27.164968	\N	\N
lot_seed_af1cfbb2f312f97e293e7b4184bc36c6	paramascotasec	prod_5e719dfa02e40	bootstrap_opening	prod_5e719dfa02e40	49.4000	2	2	{"seed": "bootstrap_schema"}	2026-04-16 19:47:22.663	2026-04-17 19:32:24.330468	2026-04-24 16:15:19.303016	\N	\N
lot_seed_adc371a38f7a2c26b702e6974d88ac13	paramascotasec	prod_7a55cb584221f	bootstrap_opening	prod_7a55cb584221f	50.3900	1	1	{"seed": "bootstrap_schema"}	2026-04-16 19:47:22.663	2026-04-17 19:32:24.330468	2026-04-24 16:15:19.303016	\N	\N
lot_seed_6c97c7ab9b4db3ee219b29a01a362dd2	paramascotasec	prod_32796f67d2779	bootstrap_opening	prod_32796f67d2779	7.1800	4	4	{"seed": "bootstrap_schema"}	2026-04-16 19:47:22.663	2026-04-17 19:32:24.330468	2026-04-24 16:15:19.303016	\N	\N
lot_seed_907e6109e37c1420f26bd6943b2059cf	paramascotasec	prod_957b581998bcd	bootstrap_opening	prod_957b581998bcd	28.9700	1	1	{"seed": "bootstrap_schema"}	2026-04-16 19:47:22.663	2026-04-17 19:32:24.330468	2026-04-24 16:15:19.303016	\N	\N
lot_seed_7ee7015e6fb6545cde4fb1139c6c2663	paramascotasec	prod_300008cdb421e	bootstrap_opening	prod_300008cdb421e	0.8100	12	12	{"seed": "bootstrap_schema"}	2026-04-16 19:47:22.663	2026-04-17 19:32:24.330468	2026-04-24 16:15:19.303016	\N	\N
lot_seed_21a556a13a0e3296fb04f625b6bff05b	paramascotasec	prod_3a747a40080e3	bootstrap_opening	prod_3a747a40080e3	3.7000	6	6	{"seed": "bootstrap_schema"}	2026-04-16 19:47:22.663	2026-04-17 19:32:24.330468	2026-04-24 16:15:19.303016	\N	\N
lot_seed_662ae458287a3fd9313099427d666eee	paramascotasec	prod_4aaadb2e91ea6	bootstrap_opening	prod_4aaadb2e91ea6	27.4700	1	1	{"seed": "bootstrap_schema"}	2026-04-16 19:47:22.663	2026-04-17 19:32:24.330468	2026-04-24 16:15:19.303016	\N	\N
lot_seed_bb77b668382d75d64fe49a90343e9d29	paramascotasec	prod_2fa250b5d8c8a	bootstrap_opening	prod_2fa250b5d8c8a	0.6600	12	12	{"seed": "bootstrap_schema"}	2026-04-16 19:47:22.663	2026-04-17 19:32:24.330468	2026-04-24 16:15:19.303016	\N	\N
lot_seed_7a5d24438e16715ce89cda948fcaeaa3	paramascotasec	prod_28f91b7c55d4f	bootstrap_opening	prod_28f91b7c55d4f	6.2500	3	3	{"seed": "bootstrap_schema"}	2026-04-16 19:47:22.663	2026-04-17 19:32:24.330468	2026-04-24 16:15:19.303016	\N	\N
lot_seed_4cdb97f2379487416c05ef66a7962ee8	paramascotasec	prod_0f15a001656dc	bootstrap_opening	prod_0f15a001656dc	8.5700	5	5	{"seed": "bootstrap_schema"}	2026-04-16 19:47:22.663	2026-04-17 19:32:24.330468	2026-04-24 16:15:19.303016	\N	\N
lot_seed_ee3449e9dc19f4a65867f4757d6773e4	paramascotasec	prod_54c64f6cb2fbb	bootstrap_opening	prod_54c64f6cb2fbb	7.0000	4	4	{"seed": "bootstrap_schema"}	2026-04-16 19:47:22.663	2026-04-17 19:32:24.330468	2026-04-24 16:15:19.303016	\N	\N
lot_seed_656b40420ad6d5ff51050350dd5aefe4	paramascotasec	prod_798feb6864c87	bootstrap_opening	prod_798feb6864c87	7.0400	6	6	{"seed": "bootstrap_schema"}	2026-04-16 19:47:22.663	2026-04-17 19:32:24.330468	2026-04-24 16:15:19.303016	\N	\N
lot_seed_facc15de67ac70501e8a7d268378b024	paramascotasec	prod_63bb9f3ebaa4b	bootstrap_opening	prod_63bb9f3ebaa4b	0.0000	1	1	{"seed": "bootstrap_schema"}	2026-04-16 20:13:54.238	2026-04-17 19:32:24.330468	2026-04-24 16:15:19.303016	\N	\N
lot_seed_cf50440bc844a73cde8d64a20e19adef	paramascotasec	prod_7273bc805a4af	bootstrap_opening	prod_7273bc805a4af	2.1700	2	2	{"seed": "bootstrap_schema"}	2026-04-16 20:13:54.238	2026-04-17 19:32:24.330468	2026-04-24 16:15:19.303016	\N	\N
lot_seed_2078bf03bb12a0763ee4bf1c51b03b5b	paramascotasec	prod_445a741c261fa	bootstrap_opening	prod_445a741c261fa	2.1700	2	2	{"seed": "bootstrap_schema"}	2026-04-16 20:13:54.238	2026-04-17 19:32:24.330468	2026-04-24 16:15:19.303016	\N	\N
lot_seed_eea6ab94cc0ceaef15bbc48e1df3fc1b	paramascotasec	prod_a91b53e3e4b4c	bootstrap_opening	prod_a91b53e3e4b4c	1.3000	2	2	{"seed": "bootstrap_schema"}	2026-04-16 20:13:54.238	2026-04-17 19:32:24.330468	2026-04-24 16:15:19.303016	\N	\N
lot_seed_c6652b0bc98c079c5b08947073c9931f	paramascotasec	prod_27777c05cc43a	bootstrap_opening	prod_27777c05cc43a	1.7400	3	3	{"seed": "bootstrap_schema"}	2026-04-16 20:13:54.238	2026-04-17 19:32:24.330468	2026-04-24 16:15:19.303016	\N	\N
lot_seed_d98c55dc1beb5df156bc591b1987436a	paramascotasec	prod_7757b463a4bb0	bootstrap_opening	prod_7757b463a4bb0	2.1700	2	2	{"seed": "bootstrap_schema"}	2026-04-16 20:13:54.238	2026-04-17 19:32:24.330468	2026-04-24 16:15:19.303016	\N	\N
lot_seed_a458895bda827f8942df1caa3906e180	paramascotasec	prod_634e401b41491	bootstrap_opening	prod_634e401b41491	1.3000	2	2	{"seed": "bootstrap_schema"}	2026-04-16 20:13:54.238	2026-04-17 19:32:24.330468	2026-04-24 16:15:19.303016	\N	\N
lot_seed_ac24f91d01e654c22a962ef24aa4a0f5	paramascotasec	prod_84bf7763f797d	bootstrap_opening	prod_84bf7763f797d	1.7400	3	3	{"seed": "bootstrap_schema"}	2026-04-16 20:13:54.238	2026-04-17 19:32:24.330468	2026-04-24 16:15:19.303016	\N	\N
lot_seed_8d22697727ac5af54e4efdecac718dd7	paramascotasec	prod_b9e23527b3c69	bootstrap_opening	prod_b9e23527b3c69	1.3000	2	2	{"seed": "bootstrap_schema"}	2026-04-16 20:13:54.238	2026-04-17 19:32:24.330468	2026-04-24 16:15:19.303016	\N	\N
lot_seed_3b81cdbd1d1c5a64a5de253d172af9db	paramascotasec	prod_46aaf62fe476b	bootstrap_opening	prod_46aaf62fe476b	5.6500	2	2	{"seed": "bootstrap_schema"}	2026-04-16 20:13:54.238	2026-04-17 19:32:24.330468	2026-04-24 16:15:19.303016	\N	\N
lot_seed_63fb97906ccfae686cf4a2cc388f0f14	paramascotasec	prod_d42ac32232628	bootstrap_opening	prod_d42ac32232628	6.8600	4	3	{"seed": "bootstrap_schema"}	2026-04-16 19:47:22.663	2026-04-17 19:32:24.330468	2026-04-25 14:33:54.943303	\N	\N
lot_69efa6a0d320d	paramascotasec	prod_69efa6a0c5623	purchase_invoice	pitem_69efa6a0cf950	0.0000	1	1	{"reason": "initial_stock", "purchase_invoice_number": "001-004-000000913"}	2026-04-27 13:10:40.808265	2026-04-27 13:10:40.808265	2026-04-27 13:10:40.808265	pinv_69ef9e31bbf1c	pitem_69efa6a0cf950
\.


--
-- Data for Name: InventoryLotAllocation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."InventoryLotAllocation" (id, tenant_id, lot_id, order_item_id, product_id, quantity, unit_cost, metadata, created_at) FROM stdin;
\.


--
-- Data for Name: Order; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Order" (id, user_id, status, total, created_at, shipping_address, billing_address, payment_method, invoice_number, invoice_html, invoice_created_at, invoice_data, payment_details, items_subtotal, vat_subtotal, vat_rate, vat_amount, shipping, shipping_base, shipping_tax_rate, shipping_tax_amount, order_notes, tenant_id, discount_code, discount_total, discount_snapshot, delivery_method) FROM stdin;
\.


--
-- Data for Name: OrderItem; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."OrderItem" (id, order_id, product_id, quantity, price, product_name, product_image, unit_cost, cost_total, price_net, net_total, tax_rate, tax_amount) FROM stdin;
\.


--
-- Data for Name: PosMovement; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."PosMovement" (id, tenant_id, shift_id, type, amount, description, created_by_user_id, created_at) FROM stdin;
\.


--
-- Data for Name: PosShift; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."PosShift" (id, tenant_id, opened_by_user_id, opened_at, opening_cash, status, open_notes, closed_by_user_id, closed_at, closing_cash, close_notes, expected_cash, difference_cash, summary_json) FROM stdin;
\.


--
-- Data for Name: Product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Product" (id, legacy_id, category, name, gender, is_new, is_sale, price, original_price, brand, sold, quantity, description, action, slug, created_at, updated_at, cost, product_type, attributes, tenant_id, is_published) FROM stdin;
prod_69ec057ab9585	69ec057ab9589	ropa	Camiseta Polo Azul L	dog	t	f	9.3913	9.3913	ParaMascotas	0	1	Polo en tono azul con estilo moderno, ideal para paseos y aventuras diarias.	view	camiseta-polo-azul-l-69ec057ab959f	2026-04-24 19:06:18.759	2026-04-27 09:49:20.191	5.83	ropa	{"sku": "ROP-PARAMA-CAMISE-POLO-L-AZUL-PERRO", "size": "L", "color": "Azul", "gender": "Unisex", "lotCode": "LOT-20260324-MISH-CAMI-L-220", "species": "Perro", "taxRate": "15.00", "supplier": "Misha Fashion Pets", "taxExempt": "false", "variantLabel": "L", "purchaseTaxRate": "0.00", "storageLocation": "Principal", "variantBaseName": "Camiseta Polo Azul", "variantGroupKey": "paramascotas-ropa-dog-camiseta-polo-azul-perro"}	paramascotasec	t
prod_1b9079e7dfd6d	1b9079e7dfd6d	Alimento	Avant Premium Gatos Adultos 1.7 kg	cat	f	f	8.9000	8.9000	Avant	0	1	Nutricion completa para gatos adultos, formulada para mantener su vitalidad, energia y bienestar diario.	view	avant-gatos-adultos-1-7kg-1b9079e7dfd6d	2026-04-16 19:47:22.663	2026-04-27 10:36:24.107	6.23	Alimento	{"sku": "AVA-GA-1.7KG", "tag": "avant-gatos-adultos-1-7kg", "size": "1.7 kg", "lotCode": "LOT-20260418-DAG-AVAN-1-351", "species": "Gato", "taxRate": "0.00", "supplier": "DAG", "taxExempt": "true", "variantLabel": "1.7 kg", "expirationDate": "2027-08-06", "purchaseTaxRate": "0.00", "storageLocation": "Principal", "variantBaseName": "Avant Gatos Adultos 1.7 kg", "variantGroupKey": "avant-alimento-cat-avant-gatos-adultos-1-7-kg-gato", "expirationAlertDays": "30", "purchaseInvoiceDate": "2024-04-10", "purchaseInvoiceNumber": "003-100-000071559"}	paramascotasec	t
prod_imp_69dac08149875	VIBA-2026-04-11-028	accesorios	Arenero verde	cat	f	f	9.4783	9.4783	ParaMascotas	0	5	Arenero práctico y resistente, ideal para brindar comodidad y facilitar la limpieza diaria.	view	viba-2026-04-11-028-arenero-verde	2026-04-11 16:43:28.661	2026-04-27 00:21:36.236	5.22	accesorios	{"sku": "ACC-VIBA-ARENEROVERDE-VERDE-GATO", "color": "Verde", "lotCode": "LOT-20260412-VIBA-AREN-119", "species": "Gato", "taxRate": "15.00", "supplier": "Viba Pets", "taxExempt": "false", "variantLabel": "Verde", "purchaseTaxRate": "15.00", "storageLocation": "Principal", "variantBaseName": "Arenero", "variantGroupKey": "paramascotas-accesorios-cat-arenero-gato", "supplierDocument": "195144540001"}	paramascotasec	t
prod_22d29e9c51e99	22d29e9c51e99	Alimento	Felix pouch pescado blanco 85 g	cat	f	f	1.4500	1.4500	Purina	0	4	Una receta deliciosa de pescado blanco, ideal para variar sus comidas con mucho sabor.	view	felix-pouch-pescado-blanco-85g-22d29e9c51e99	2026-04-16 19:42:33.907	2026-04-24 18:58:11.802	1.12	Alimento	{"sku": "FLX-PBL-85G", "tag": "felix-pouch-pescado-blanco-85g", "size": "85 gr", "color": "Blanco", "lotCode": "LOT-20260420-SOLD-FELI-85GR-001", "species": "Gato", "taxRate": "0.00", "supplier": "Soldis", "taxExempt": "true", "variantLabel": "85 gr", "expirationDate": "2027-04-22", "purchaseTaxRate": "0.00", "storageLocation": "Principal", "variantBaseName": "Felix pouch pescado blanco 85 g", "variantGroupKey": "purina-alimento-cat-felix-pouch-pescado-blanco-85-g-gato", "expirationAlertDays": "30", "purchaseInvoiceDate": "2024-04-07", "purchaseInvoiceNotes": "Factura con 2 notas de credito", "purchaseInvoiceNumber": "001-501-000122471"}	paramascotasec	t
prod_69daa8a08a6d2	69daa8a08a6d3	ropa	Camiseta Polo Azul	dog	t	f	6.5217	6.5217	ParaMascotas	0	1	Polo en tono azul con estilo moderno, ideal para paseos y aventuras diarias.	view	camiseta-polo-azul-69daa8a08a6db	2026-04-11 15:01:36.567	2026-04-27 11:44:08.632	3.96	ropa	{"sku": "ROP-GENERI-CAMISE-POLO-S-AZUL-PERRO", "size": "S", "color": "Azul", "gender": "Unisex", "lotCode": "LOT-20260324-MISH-CAMI-S-145", "species": "Perro", "taxRate": "15.00", "supplier": "Misha Fashion Pets", "taxExempt": "false", "variantLabel": "S", "purchaseTaxRate": "0.00", "storageLocation": "Principal", "variantBaseName": "Camiseta Polo Azul", "variantGroupKey": "paramascotas-ropa-dog-camiseta-polo-azul-perro"}	paramascotasec	t
prod_2fa250b5d8c8a	2fa250b5d8c8a	Alimento	Sachet Procan Trozos Cachorro Cerdo 85 g	dog	f	f	1.0000	1.0000	DAG	0	12	Suaves trozos sabor cerdo especialmente formulados para cachorros, con gran sabor y excelente textura.	view	sachet-procan-trozos-cachorro-cerdo-85g-2fa250b5d8c8a	2026-04-16 19:47:22.663	2026-04-24 18:58:11.802	0.66	Alimento	{"sku": "PRO-SCC-85G", "tag": "sachet-procan-trozos-cachorro-cerdo-85g", "size": "85 gr", "color": "Gris", "lotCode": "LOT-20260420-DAG-SACH-85-001", "species": "Perro", "taxRate": "0.00", "supplier": "DAG", "taxExempt": "true", "variantLabel": "85 gr", "expirationDate": "2027-04-22", "purchaseTaxRate": "0.00", "storageLocation": "Principal", "variantBaseName": "Sachet Procan Trozos Cachorro Cerdo 85 g", "variantGroupKey": "dag-alimento-dog-sachet-procan-trozos-cachorro-cerdo-85-g-perro", "expirationAlertDays": "30", "purchaseInvoiceDate": "2024-04-10", "purchaseInvoiceNumber": "003-100-000071559"}	paramascotasec	t
prod_55db92cc9cf72	55db92cc9cf72	Alimento	Cat Chow Gatitos Pescado, Carne y Leche 0.5 kg	cat	f	f	4.4000	4.4000	Purina	0	2	Especialmente formulado para gatitos en crecimiento, con nutrientes esenciales para su desarrollo.	view	cat-chow-gatitos-0-5kg-55db92cc9cf72	2026-04-16 19:42:33.907	2026-04-27 11:55:44.35	3.51	Alimento	{"sku": "CCH-GAT-0.5KG", "tag": "cat-chow-gatitos-0-5kg", "size": "0.5 kg", "lotCode": "LOT-20260419-SOLD-CAT-0-001", "species": "Gato", "taxRate": "0.00", "supplier": "Soldis", "taxExempt": "true", "variantLabel": "0.5 kg", "expirationDate": "2027-07-01", "purchaseTaxRate": "0.00", "storageLocation": "Principal", "variantBaseName": "Cat Chow gatitos 0.5 kg", "variantGroupKey": "purina-alimento-cat-cat-chow-gatitos-0-5-kg-gato", "expirationAlertDays": "30", "purchaseInvoiceDate": "2024-04-07", "purchaseInvoiceNotes": "Factura con 2 notas de credito", "purchaseInvoiceNumber": "001-501-000122471"}	paramascotasec	t
prod_300008cdb421e	300008cdb421e	Alimento	Procat Care Alimento Humedo Higado 85 g	cat	f	f	1.1000	1.1000	ProCat	0	12	Irresistible alimento humedo sabor higado, perfecto para variar la alimentacion de tu gato con mucho sabor.	view	procat-care-alimento-humedo-higado-85g-300008cdb421e	2026-04-16 19:47:22.663	2026-04-24 18:58:11.802	0.81	Alimento	{"sku": "PCT-HUM-HIG-85G", "tag": "procat-care-alimento-humedo-higado-85g", "size": "85 gr", "lotCode": "LOT-20260419-DAG-PROC-85GR-001", "species": "Gato", "taxRate": "0.00", "supplier": "DAG", "taxExempt": "true", "variantLabel": "85 gr", "expirationDate": "2027-04-22", "purchaseTaxRate": "0.00", "storageLocation": "Principal", "variantBaseName": "Procat Care Alimento Humedo Higado 85 g", "variantGroupKey": "procat-alimento-cat-procat-care-alimento-humedo-higado-85-g-gato", "expirationAlertDays": "30", "purchaseInvoiceDate": "2024-04-10", "purchaseInvoiceNumber": "003-100-000071559"}	paramascotasec	t
prod_d42ac32232628	d42ac32232628	Alimento	Avant Premium Adulto Razas Medianas y Grandes 2 kg	dog	f	f	9.9000	9.9000	Avant	0	3	Nutricion premium para perros adultos en un formato practico, ideal para su energia y bienestar diario.	view	avant-adulto-raza-mediana-grande-2kg-d42ac32232628	2026-04-16 19:47:22.663	2026-04-27 10:32:48.465	6.86	Alimento	{"sku": "AVA-A-RMG-2KG", "tag": "avant-adulto-raza-mediana-grande-2kg", "size": "2 kg", "lotCode": "LOT-20260418-DAG-AVAN-2KG-897", "species": "Perro", "taxRate": "0.00", "supplier": "DAG", "taxExempt": "true", "variantLabel": "2 kg", "expirationDate": "2027-08-31", "purchaseTaxRate": "0.00", "storageLocation": "Principal", "variantBaseName": "Avant Adulto Raza Mediana/Grande", "variantGroupKey": "avant-alimento-dog-avant-adulto-raza-mediana-grande-perro", "expirationAlertDays": "30", "purchaseInvoiceDate": "2024-04-10", "purchaseInvoiceNumber": "003-100-000071559"}	paramascotasec	t
prod_imp_69dac08138222	VIBA-2026-04-11-014	accesorios	Collar con Cascabel Azul	dog	f	f	0.8696	0.8696	ParaMascotas	0	0	Collar ajustable con cascabel, ideal para que tu mascota luzca adorable y sea fácil de localizar.	view	viba-2026-04-11-014-collar-con-cascabel	2026-04-11 16:43:28.661	2026-04-27 12:21:38.316	0.00	accesorios	{"sku": "ACC-PARAMA-COLLAR-CASCAB-AZUL-PERRO", "size": "M", "color": "Azul", "lotCode": "LOT-20260413-VIBA-COLL-L-278", "species": "Perro", "taxRate": "15.00", "archived": "true", "supplier": "Viba Pets", "taxExempt": "false", "archivedAt": "2026-04-27T17:21:38+00:00", "archivedName": "Collar con Cascabel Azul", "variantLabel": "Azul", "purchaseTaxRate": "15.00", "storageLocation": "Principal", "variantBaseName": "Collar con cascabel Azul", "variantGroupKey": "paramascotas-accesorios-dog-collar-con-cascabel-azul-perro", "archivedLegacyId": "VIBA-2026-04-11-014", "supplierDocument": "195144540001", "archivedProductId": "prod_imp_69dac08138222"}	paramascotasec	f
prod_imp_69dac0813d61e	VIBA-2026-04-11-018	accesorios	Pelota pequeña roja	dog	f	f	1.7304	1.7304	ParaMascotas	0	1	Pelota resistente y divertida, ideal para juegos diarios y momentos de entretenimiento.	view	viba-2026-04-11-018-pelota-peque-na-roja	2026-04-11 16:43:28.661	2026-04-24 16:15:19.303	0.87	accesorios	{"sku": "ACC-VIBA-PELOTAPEQUENAROJA-ROJA-PERROYGATO", "color": "Roja", "lotCode": "LOT-20260413-VIBA-PELO-ROJA-970", "species": "Perro", "taxRate": "15.00", "supplier": "Viba Pets", "taxExempt": "false", "variantLabel": "ROJA", "purchaseTaxRate": "15.00", "storageLocation": "Principal", "variantBaseName": "Pelota pequeña roja", "variantGroupKey": "single:prod_imp_69dac0813d61e", "supplierDocument": "195144540001"}	paramascotasec	t
prod_406e26c552784	406e26c552784	Alimento	Sachet Procan Trozos Adulto Pollo 85 g	dog	f	f	1.0000	1.0000	Pro-Can	0	36	Jugosos trozos sabor pollo, ideales para consentir a tu perro con una comida humeda deliciosa y nutritiva.	view	sachet-procan-trozos-adulto-pollo-85g-406e26c552784	2026-04-16 19:47:22.663	2026-04-24 18:58:11.802	0.66	Alimento	{"sku": "PRO-SAP-85G", "tag": "sachet-procan-trozos-adulto-pollo-85g", "size": "85 gr", "lotCode": "LOT-20260419-DAG-SACH-85GR-001", "species": "Perro", "taxRate": "0.00", "supplier": "DAG", "taxExempt": "true", "variantLabel": "85 gr", "expirationDate": "2027-04-19", "purchaseTaxRate": "0.00", "storageLocation": "Principal", "variantBaseName": "Sachet Procan Trozos Adulto Pollo 85 g", "variantGroupKey": "pro-can-alimento-dog-sachet-procan-trozos-adulto-pollo-85-g-perro", "expirationAlertDays": "30", "purchaseInvoiceDate": "2024-04-10", "purchaseInvoiceNumber": "003-100-000071559"}	paramascotasec	t
prod_32796f67d2779	32796f67d2779	Alimento	Avant Premium Cachorro Razas Medianas y Grandes 2 kg	dog	f	f	10.1000	10.1000	Avant	0	4	Formula especial para cachorros, con nutrientes que fortalecen su crecimiento y desarrollo.	view	avant-cachorro-raza-mediana-grande-2kg-32796f67d2779	2026-04-16 19:47:22.663	2026-04-27 10:34:52.275	7.18	Alimento	{"sku": "AVA-C-RMG-2KG", "tag": "avant-cachorro-raza-mediana-grande-2kg", "size": "2 kg", "lotCode": "LOT-20260418-DAG-AVAN-2KG-576", "species": "Perro", "taxRate": "0.00", "supplier": "DAG", "taxExempt": "true", "variantLabel": "2 kg", "expirationDate": "2027-08-31", "purchaseTaxRate": "0.00", "storageLocation": "Principal", "variantBaseName": "Avant Cachorro Raza Mediana/Grande", "variantGroupKey": "avant-alimento-dog-avant-cachorro-raza-mediana-grande-perro", "expirationAlertDays": "30", "purchaseInvoiceDate": "2024-04-10", "purchaseInvoiceNumber": "003-100-000071559"}	paramascotasec	t
prod_503a9b8fb5716	503a9b8fb5716	accesorios	Plato de acero inoxidable con base antideslizante 18 cm	dog	f	f	3.9130	3.9130	ParaMascotas	0	6	Practico, resistente y elegante. Ideal para servir alimento o agua a tu mascota. Fabricado en acero inoxidable de alta durabilidad, facil de limpiar y con base antideslizante que brinda mayor estabilidad.	view	plato-acero-inoxidable-antideslizante-18cm-503a9b8fb5716	2026-04-16 20:13:54.238	2026-04-24 18:58:11.802	2.17	accesorios	{"sku": "ACC-PLA-AC-18", "tag": "plato-acero-inoxidable-antideslizante-18cm", "size": "18 cm", "lotCode": "LOT-20260420-VIBA-PLAT-18-258", "species": "Perro", "taxRate": "15.00", "supplier": "Viba Pets", "taxExempt": "false", "variantLabel": "18 cm", "purchaseTaxRate": "15.00", "storageLocation": "Principal", "variantBaseName": "Plato de acero inoxidable con base antideslizante", "variantGroupKey": "paramascotas-accesorios-dog-plato-de-acero-inoxidable-con-base-antideslizante-perro"}	paramascotasec	t
prod_69ef9e31b3a09	69ef9e31b3a11	accesorios	Collar con cascabel amarillo Rosa	dog	t	f	0.8696	0.8696	ParaMascotas	0	0	Collar ajustable con cascabel, ideal para que tu mascota luzca adorable y sea facil de localizar.	view	collar-con-cascabel-amarillo-rosa-69ef9e31b3a3b	2026-04-27 12:34:41.735	2026-04-27 12:45:15.104	0.00	accesorios	{"sku": "ACC-PARAMA-COLLAR-CASCAB-ROSA-PERRO", "tag": "collar-con-cascabel-amarillo", "size": "M", "color": "Rosa", "lotCode": "LOT-20260427-VIBA-COLL-ROSA-757", "species": "Perro", "taxRate": "15.00", "archived": "true", "supplier": "Viba Pets", "taxExempt": "false", "archivedAt": "2026-04-27T17:45:15+00:00", "archivedName": "Collar con cascabel amarillo Rosa", "variantLabel": "Rosa", "purchaseTaxRate": "15.00", "storageLocation": "Principal", "variantBaseName": "Collar con cascabel amarillo", "variantGroupKey": "paramascotas-accesorios-dog-collar-con-cascabel-amarillo-perro", "archivedLegacyId": "69ef9e31b3a11", "archivedProductId": "prod_69ef9e31b3a09"}	paramascotasec	f
prod_28f91b7c55d4f	28f91b7c55d4f	Alimento	Avant Premium Gatitos 1.7 kg	cat	f	f	8.9000	8.9000	Avant	0	3	Formula especial para gatitos en crecimiento, con nutrientes esenciales para un desarrollo fuerte y saludable.	view	avant-gatitos-1-7kg-28f91b7c55d4f	2026-04-16 19:47:22.663	2026-04-27 10:36:06.594	6.25	Alimento	{"sku": "AVA-GC-1.7KG", "tag": "avant-gatitos-1-7kg", "size": "1.7 kg", "lotCode": "LOT-20260418-DAG-AVAN-1-887", "species": "Gato", "taxRate": "0.00", "supplier": "DAG", "taxExempt": "true", "variantLabel": "1.7 kg", "expirationDate": "2027-09-01", "purchaseTaxRate": "0.00", "storageLocation": "Principal", "variantBaseName": "Avant Gatitos 1.7 kg", "variantGroupKey": "avant-alimento-cat-avant-gatitos-1-7-kg-gato", "expirationAlertDays": "30", "purchaseInvoiceDate": "2024-04-10", "purchaseInvoiceNumber": "003-100-000071559"}	paramascotasec	t
prod_69efa41f410d2	69efa41f410d6	accesorios	Collar con Cascabel Rosado	dog	t	f	0.8696	0.8696	ParaMascotas	0	1	Collar ajustable con cascabel, ideal para que tu mascota luzca adorable y sea facil de localizar.	view	collar-con-cascabel-rosado-69efa41f410f6	2026-04-27 12:59:59.266	2026-04-27 12:59:59.266	0.00	accesorios	{"sku": "ACC-PARAMA-COLLAR-CASCAB-ROSA-PERRO", "size": "S", "color": "Rosa", "lotCode": "LOT-20260427-VIBA-COLL-ROSA-901", "species": "Perro", "supplier": "Viba Pets", "taxExempt": "false", "variantLabel": "Rosa", "purchaseTaxRate": "15.00", "variantBaseName": "Collar con Cascabel Rosado", "variantGroupKey": "paramascotas-accesorios-dog-collar-con-cascabel-rosado-perro"}	paramascotasec	f
prod_69ebedb98b13c	69ebedb98b141	ropa	Camiseta Polo Azul L	dog	t	f	9.3913	9.3913	ParaMascotas	0	0	Polo en tono azul con estilo moderno, ideal para paseos y aventuras diarias.	view	camiseta-polo-azul-l-69ebedb98b32b	2026-04-24 17:24:57.569	2026-04-24 17:26:51.919	5.83	ropa	{"sku": "ROP-PARAMA-CAMISE-POLO-L-AZUL-PERRO", "size": "L", "color": "Azul", "gender": "Unisex", "lotCode": "LOT-20260324-MISH-CAMI-L-930", "species": "Perro", "taxRate": "15.00", "archived": "true", "supplier": "Misha Fashion Pets", "taxExempt": "false", "archivedAt": "2026-04-24T22:26:51+00:00", "archivedName": "Camiseta Polo Azul L", "variantLabel": "L", "purchaseTaxRate": "0.00", "storageLocation": "Principal", "variantBaseName": "Camiseta Polo Azul", "variantGroupKey": "paramascotas-ropa-dog-camiseta-polo-azul-perro", "archivedLegacyId": "69ebedb98b141", "archivedProductId": "prod_69ebedb98b13c"}	paramascotasec	f
prod_559e4a2487ec4	559e4a2487ec4	salud	DermaHealth Advance Care 2 en 1 200 ml	dog	f	f	3.8174	3.8174	DermaHealt	0	5	Shampoo y acondicionador 2 en 1, ideal para mantener el pelaje limpio, suave y saludable en cada bano.	view	dermahealth-advance-care-2-en-1-200ml-559e4a2487ec4	2026-04-16 19:45:36.736	2026-04-24 18:58:11.802	2.47	cuidado	{"sku": "DHC-2EN1-200ML", "tag": "dermahealth-advance-care-2-en-1-200ml", "size": "200 ml", "lotCode": "LOT-20260420-AGRI-DERM-200M-001", "species": "Perro", "taxRate": "15.00", "supplier": "Agripac", "taxExempt": "false", "variantLabel": "200 ml", "purchaseTaxRate": "15.00", "storageLocation": "Principal", "variantBaseName": "DermaHealth Advance Care 2 en 1 200 ml", "variantGroupKey": "dermahealt-salud-dog-dermahealth-advance-care-2-en-1-200-ml-perro", "purchaseInvoiceDate": "2026-04-09", "purchaseInvoiceNumber": "096-004-000060031"}	paramascotasec	t
prod_60ec4689093f6	60ec4689093f6	Alimento	NutraPro Cachorro RPM 2 kg	dog	f	f	8.7000	8.7000	NutraPro	0	6	Nutricion especializada para cachorros, ideal para acompanar su crecimiento fuerte, saludable y lleno de vitalidad.	view	nutrapro-cachorro-rpm-2kg-60ec4689093f6	2026-04-16 19:45:36.736	2026-04-24 18:58:11.802	6.45	Alimento	{"sku": "NTP-C-RPM-2KG", "tag": "nutrapro-cachorro-rpm-2kg", "size": "2 kg", "lotCode": "LOT-20260420-AGRI-NUTR-2KG-001", "species": "Perro", "taxRate": "0.00", "supplier": "Agripac", "taxExempt": "true", "variantLabel": "2 kg", "expirationDate": "2027-04-22", "purchaseTaxRate": "0.00", "storageLocation": "Principal", "variantBaseName": "NutraPro Cachorro RPM 2 kg", "variantGroupKey": "nutrapro-alimento-dog-nutrapro-cachorro-rpm-2-kg-perro", "expirationAlertDays": "30", "purchaseInvoiceDate": "2026-04-09", "purchaseInvoiceNumber": "096-004-000060031"}	paramascotasec	t
prod_69efa49e505d5	69efa49e505da	accesorios	Collar con Cascabel Rojo	dog	t	f	0.8696	0.8696	ParaMascotas	0	1	Collar ajustable con cascabel, ideal para que tu mascota luzca adorable y sea facil de localizar.	view	caollar-con-cascabel-rojo-69efa49e505f4	2026-04-27 13:02:06.329	2026-04-27 13:06:59.548	0.00	accesorios	{"sku": "ACC-PARAMA-CAOLLA-CASCAB-ROJO-PERRO", "size": "S", "color": "Rojo", "lotCode": "LOT-20260416-VIBA-CAOL-ROJO-189", "species": "Perro", "supplier": "Viba Pets", "taxExempt": "false", "variantLabel": "Rojo", "purchaseTaxRate": "15.00", "variantBaseName": "Caollar con Cascabel", "variantGroupKey": "paramascotas-accesorios-dog-caollar-con-cascabel-perro"}	paramascotasec	t
prod_15d19620b14e9	15d19620b14e9	accesorios	Collar con cascabel rosado	dog	f	f	0.8696	0.8696	ParaMascotas	0	0	Collar ajustable con cascabel, ideal para que tu mascota luzca adorable y sea facil de localizar.	view	collar-con-cascabel-rosado-15d19620b14e9	2026-04-16 20:13:54.238	2026-04-27 12:21:52.2	0.00	accesorios	{"sku": "ACC-COL-CAS-RS", "tag": "collar-con-cascabel-rosado", "size": "M", "color": "Rosa", "lotCode": "LOT-20260418-VIBA-COLL-ROSA-340", "species": "Perro", "taxRate": "15.00", "archived": "true", "supplier": "Viba Pets", "taxExempt": "false", "archivedAt": "2026-04-27T17:21:52+00:00", "archivedName": "Collar con cascabel rosado", "variantLabel": "ROSA", "purchaseTaxRate": "15.00", "storageLocation": "Principal", "variantBaseName": "Collar con cascabel rosado", "variantGroupKey": "single:prod_15d19620b14e9", "archivedLegacyId": "15d19620b14e9", "archivedProductId": "prod_15d19620b14e9"}	paramascotasec	f
prod_8e5015db2ddea	8e5015db2ddea	Alimento	NutraPro Gato / Gatito 2 kg	cat	f	f	8.2000	8.2000	NutraPro	0	5	Nutricion completa para gatos adultos y gatitos, formulada para apoyar su crecimiento, energia y bienestar diario.	view	nutrapro-gato-gatito-2kg-8e5015db2ddea	2026-04-16 19:45:36.736	2026-04-24 18:58:11.802	6.25	Alimento	{"sku": "NTP-G-2KG", "tag": "nutrapro-gato-gatito-2kg", "size": "2 kg", "lotCode": "LOT-20260420-AGRI-NUTR-2-001", "species": "Gato", "taxRate": "0.00", "supplier": "Agripac", "taxExempt": "true", "variantLabel": "2 kg", "expirationDate": "2027-04-22", "purchaseTaxRate": "0.00", "storageLocation": "Principal", "variantBaseName": "NutraPro Gato / Gatito", "variantGroupKey": "nutrapro-alimento-cat-nutrapro-gato-gatito-gato", "expirationAlertDays": "30", "purchaseInvoiceDate": "2026-04-09", "purchaseInvoiceNumber": "096-004-000060031"}	paramascotasec	t
prod_69efa6a0c5623	69efa6a0c5627	accesorios	Collar con Cascabel Azul	dog	t	f	0.8696	0.8696	ParaMascotas	0	1	Collar ajustable con cascabel, ideal para que tu mascota luzca adorable y sea facil de localizar.	view	collar-con-cascabel-azul-69efa6a0c5649	2026-04-27 13:10:40.808	2026-04-27 13:10:40.808	0.00	accesorios	{"sku": "ACC-PARAMA-COLLAR-CASCAB-AZUL-PERRO", "size": "S", "color": "Azul", "lotCode": "LOT-20260416-VIBA-COLL-AZUL-923", "species": "Perro", "supplier": "Viba Pets", "taxExempt": "false", "variantLabel": "Azul", "purchaseTaxRate": "15.00", "variantBaseName": "Collar con Cascabel", "variantGroupKey": "paramascotas-accesorios-dog-collar-con-cascabel-perro"}	paramascotasec	t
prod_7a55cb584221f	7a55cb584221f	Alimento	Avant Premium Cachorro Razas Medianas y Grandes 18 kg	dog	f	f	71.9000	71.9000	Avant	0	1	Nutricion especializada para cachorros de raza mediana y grande, ideal para acompanar su crecimiento fuerte y saludable.	view	avant-cachorro-raza-mediana-grande-18kg-7a55cb584221f	2026-04-16 19:47:22.663	2026-04-27 10:35:15.382	50.39	Alimento	{"sku": "AVA-C-RMG-18KG", "tag": "avant-cachorro-raza-mediana-grande-18kg", "size": "18 kg", "lotCode": "LOT-20260419-DAG-AVAN-18KG-001", "species": "Perro", "taxRate": "0.00", "supplier": "DAG", "taxExempt": "true", "variantLabel": "18 kg", "expirationDate": "2027-08-31", "purchaseTaxRate": "0.00", "storageLocation": "Principal", "variantBaseName": "Avant Cachorro Raza Mediana/Grande", "variantGroupKey": "avant-alimento-dog-avant-cachorro-raza-mediana-grande-perro", "expirationAlertDays": "30", "purchaseInvoiceDate": "2024-04-10", "purchaseInvoiceNumber": "003-100-000071559"}	paramascotasec	t
prod_dc72eba5e2be0	dc72eba5e2be0	ropa	Camiseta I Love Mommy	dog	t	f	10.4261	10.4261	ParaMascotas	0	1	Prenda ligera en naranja con estampado “I Love My Mommy”, ideal para mascotas con un look adorable, cómodo y tierno.	view	camiseta-i-love-mommy-naranja-dc72eba5e2be0	2026-04-16 19:39:34.071	2026-04-25 15:33:18.307	6.00	ropa	{"sku": "ROP-PARAMA-CAMISE-I-L-NARANJA-PERRO", "size": "L", "color": "Naranja", "gender": "Unisex", "lotCode": "LOT-20260319-PETS-CAMI-L-NAR-DC7", "species": "Perro", "taxRate": "15.00", "supplier": "Pets Factory", "taxExempt": "false", "variantLabel": "L", "purchaseTaxRate": "15.00", "storageLocation": "Principal", "variantBaseName": "Camiseta I Love Mommy", "variantGroupKey": "paramascotas-ropa-dog-camiseta-i-love-mommy-perro"}	paramascotasec	t
prod_93704d9430b90	93704d9430b90	Alimento	NutraPro Snack Nugget Gato Pollo / Higado 100 g	cat	f	f	1.2174	1.2174	NutraPro	0	12	Snack crujiente sabor pollo e higado, ideal para consentir a tu gato con un premio delicioso y nutritivo.	view	nutrapro-snack-nugget-gato-pollo-higado-100g-93704d9430b90	2026-04-16 19:45:36.736	2026-04-24 18:58:11.802	0.74	Alimento	{"sku": "NTP-SNK-PH-100G", "tag": "nutrapro-snack-nugget-gato-pollo-higado-100g", "size": "100 gr", "color": "Gris", "lotCode": "LOT-20260420-AGRI-NUTR-100-001", "species": "Gato", "taxRate": "15.00", "supplier": "Agripac", "taxExempt": "false", "variantLabel": "100 gr", "expirationDate": "2027-04-22", "purchaseTaxRate": "15.00", "storageLocation": "Principal", "variantBaseName": "NutraPro Snack Nugget Gato Pollo / Higado 100 g", "variantGroupKey": "nutrapro-alimento-cat-nutrapro-snack-nugget-gato-pollo-higado-100-g-gato", "expirationAlertDays": "30", "purchaseInvoiceDate": "2026-04-09", "purchaseInvoiceNumber": "096-004-000060031"}	paramascotasec	t
prod_9aa2a0293e2c7	9aa2a0293e2c7	Alimento	Dog Chow trozos cachorro pollo 100 g	dog	f	f	1.3000	1.3000	Dog-Chow	0	2	Trozos suaves de pollo especialmente formulados para cachorros en crecimiento.	view	dog-chow-trozos-cachorro-pollo-100g-9aa2a0293e2c7	2026-04-16 19:42:33.907	2026-04-24 18:58:11.802	0.99	Alimento	{"sku": "DCH-C-POL-100G", "tag": "dog-chow-trozos-cachorro-pollo-100g", "size": "100 gr", "lotCode": "LOT-20260420-SOLD-DOG-100G-001", "species": "Perro", "taxRate": "0.00", "supplier": "Soldis", "taxExempt": "true", "variantLabel": "100 gr", "expirationDate": "2027-04-22", "purchaseTaxRate": "0.00", "storageLocation": "Principal", "variantBaseName": "Dog Chow trozos cachorro pollo 100 g", "variantGroupKey": "dog-chow-alimento-dog-dog-chow-trozos-cachorro-pollo-100-g-perro", "expirationAlertDays": "30", "purchaseInvoiceDate": "2024-04-07", "purchaseInvoiceNotes": "Factura con 2 notas de credito", "purchaseInvoiceNumber": "001-501-000122471"}	paramascotasec	t
prod_37ca518d75293	37ca518d75293	Alimento	Procan Adulto Raza Mediana/Grande 30 kg	dog	f	f	45.7000	45.7000	Pro-Can	0	1	Nutricion completa para perros adultos de raza mediana y grande, ideal para mantener su energia, fuerza y bienestar todos los dias.	view	procan-adulto-raza-mediana-grande-30kg-37ca518d75293	2026-04-16 19:47:22.663	2026-04-24 18:58:11.802	36.56	Alimento	{"sku": "PRO-A-RMG-30KG", "tag": "procan-adulto-raza-mediana-grande-30kg", "size": "30 kg", "lotCode": "LOT-20260418-DAG-PROC-30KG-246", "species": "Perro", "taxRate": "0.00", "supplier": "DAG", "taxExempt": "true", "variantLabel": "30 kg", "expirationDate": "2027-04-17", "purchaseTaxRate": "0.00", "storageLocation": "Principal", "variantBaseName": "Procan Adulto Raza Mediana/Grande", "variantGroupKey": "pro-can-alimento-dog-procan-adulto-raza-mediana-grande-perro", "expirationAlertDays": "30", "purchaseInvoiceDate": "2024-04-10", "purchaseInvoiceNumber": "003-100-000071559"}	paramascotasec	t
prod_91dc9a3465f00	91dc9a3465f00	Alimento	Cat Chow Adultos Pescado 0.5 kg	cat	f	f	4.3000	4.3000	Purina	0	1	Todo el sabor y nutricion que tu gato necesita en una presentacion practica y conveniente.	view	cat-chow-pescado-0-5kg-91dc9a3465f00	2026-04-16 19:42:33.907	2026-04-27 11:58:31.633	3.29	Alimento	{"sku": "CCH-PES-0.5KG", "tag": "cat-chow-pescado-0-5kg", "size": "0.5 kg", "lotCode": "LOT-20260420-SOLD-CAT-0-001", "species": "Gato", "taxRate": "0.00", "supplier": "Soldis", "taxExempt": "true", "variantLabel": "0.5 kg", "expirationDate": "2027-04-01", "purchaseTaxRate": "0.00", "storageLocation": "Principal", "variantBaseName": "Cat Chow pescado", "variantGroupKey": "purina-alimento-cat-cat-chow-pescado-gato", "expirationAlertDays": "30", "purchaseInvoiceDate": "2024-04-07", "purchaseInvoiceNotes": "Factura con 2 notas de credito", "purchaseInvoiceNumber": "001-501-000122471"}	paramascotasec	t
prod_957b581998bcd	957b581998bcd	Alimento	Chiki Gatos Pollo 18 kg	dog	f	f	44.1000	44.1000	Chiki	0	1	Delicioso alimento sabor pollo, perfecto para brindar a tu peludo una dieta completa, nutritiva y llena de sabor.	view	chiki-pollo-18kg-957b581998bcd	2026-04-16 19:47:22.663	2026-04-27 12:18:50.295	28.97	Alimento	{"sku": "CHI-POL-18KG", "tag": "chiki-pollo-18kg", "size": "18 kg", "lotCode": "LOT-20260418-DAG-CHIK-18KG-122", "species": "Perro", "taxRate": "0.00", "supplier": "DAG", "taxExempt": "true", "variantLabel": "18 kg", "expirationDate": "2027-03-12", "purchaseTaxRate": "0.00", "storageLocation": "Principal", "variantBaseName": "Chiki Pollo 18 kg", "variantGroupKey": "chiki-alimento-dog-chiki-pollo-18-kg-perro", "expirationAlertDays": "30", "purchaseInvoiceDate": "2024-04-10", "purchaseInvoiceNumber": "003-100-000071559"}	paramascotasec	t
prod_3a747a40080e3	3a747a40080e3	Alimento	Procan Adulto Raza Mediana/Grande 2 kg	dog	f	f	4.8000	4.8000	Pro-Can	0	6	Alimento ideal para perros adultos, con el balance perfecto entre nutricion, sabor y rendimiento.	view	procan-adulto-raza-mediana-grande-2kg-3a747a40080e3	2026-04-16 19:47:22.663	2026-04-24 18:58:11.802	3.70	Alimento	{"sku": "PRO-A-RMG-2KG", "tag": "procan-adulto-raza-mediana-grande-2kg", "size": "2 kg", "species": "Perro", "taxRate": "0.00", "supplier": "DAG", "taxExempt": "true", "variantLabel": "2 kg", "expirationDate": "2027-04-17", "purchaseTaxRate": "0.00", "storageLocation": "Principal", "variantBaseName": "Procan Adulto Raza Mediana/Grande", "variantGroupKey": "pro-can-alimento-dog-procan-adulto-raza-mediana-grande-perro", "expirationAlertDays": "30", "purchaseInvoiceDate": "2024-04-10", "purchaseInvoiceNumber": "003-100-000071559"}	paramascotasec	t
prod_798feb6864c87	798feb6864c87	Alimento	Procan Adulto Raza Mediana/Grande 4 kg	dog	f	f	8.9000	8.9000	Pro-Can	0	6	Presentacion practica y rendidora para perros adultos, perfecta para una alimentacion balanceada en el dia a dia.	view	procan-adulto-raza-mediana-grande-4kg-798feb6864c87	2026-04-16 19:47:22.663	2026-04-24 18:58:11.802	7.04	Alimento	{"sku": "PRO-A-RMG-4KG", "tag": "procan-adulto-raza-mediana-grande-4kg", "size": "4 kg", "lotCode": "LOT-20260418-DAG-PROC-4KG-195", "species": "Perro", "taxRate": "0.00", "supplier": "DAG", "taxExempt": "true", "variantLabel": "4 kg", "expirationDate": "2027-04-17", "purchaseTaxRate": "0.00", "storageLocation": "Principal", "variantBaseName": "Procan Adulto Raza Mediana/Grande", "variantGroupKey": "pro-can-alimento-dog-procan-adulto-raza-mediana-grande-perro", "expirationAlertDays": "30", "purchaseInvoiceDate": "2024-04-10", "purchaseInvoiceNumber": "003-100-000071559"}	paramascotasec	t
prod_db804d20019c7	db804d20019c7	Alimento	NutraPro Gato / Gatito 7.5 kg	cat	f	f	31.2000	31.2000	NutraPro	0	5	Presentacion rendidora para gatos adultos y gatitos, ideal para brindar nutricion completa por mas tiempo.	view	nutrapro-gato-gatito-7-5kg-db804d20019c7	2026-04-16 19:45:36.736	2026-04-24 18:58:11.802	21.97	Alimento	{"sku": "NTP-G-7.5KG", "tag": "nutrapro-gato-gatito-7-5kg", "size": "7.5 kg", "lotCode": "LOT-20260420-AGRI-NUTR-7-001", "species": "Gato", "taxRate": "0.00", "supplier": "Agripac", "taxExempt": "true", "variantLabel": "7.5 kg", "expirationDate": "2027-04-22", "purchaseTaxRate": "0.00", "storageLocation": "Principal", "variantBaseName": "NutraPro Gato / Gatito", "variantGroupKey": "nutrapro-alimento-cat-nutrapro-gato-gatito-gato", "expirationAlertDays": "30", "purchaseInvoiceDate": "2026-04-09", "purchaseInvoiceNumber": "096-004-000060031"}	paramascotasec	t
prod_a00658958d306	a00658958d306	Alimento	Felix pouch classic salmon 85 g	cat	f	f	1.4500	1.4500	Purina	0	4	Sabor salmon en una receta suave y deliciosa que encantara a tu michi.	view	felix-pouch-classic-salmon-85g-a00658958d306	2026-04-16 19:42:33.907	2026-04-24 18:58:11.802	1.12	Alimento	{"sku": "FLX-SAL-85G", "tag": "felix-pouch-classic-salmon-85g", "size": "85 gr", "lotCode": "LOT-20260420-SOLD-FELI-85GR-001", "species": "Gato", "taxRate": "0.00", "supplier": "Soldis", "taxExempt": "true", "variantLabel": "85 gr", "expirationDate": "2027-04-22", "purchaseTaxRate": "0.00", "storageLocation": "Principal", "variantBaseName": "Felix pouch classic salmon 85 g", "variantGroupKey": "purina-alimento-cat-felix-pouch-classic-salmon-85-g-gato", "expirationAlertDays": "30", "purchaseInvoiceDate": "2024-04-07", "purchaseInvoiceNotes": "Factura con 2 notas de credito", "purchaseInvoiceNumber": "001-501-000122471"}	paramascotasec	t
prod_a2d5c29becbd9	a2d5c29becbd9	Alimento	Dog Chow trozos adulto salmon RP 100 g	dog	f	f	1.3000	1.3000	Dog-Chow	0	2	Comida humeda con delicioso sabor a salmon, ideal para perros adultos de raza pequena.	view	dog-chow-trozos-adulto-salmon-rp-100g-a2d5c29becbd9	2026-04-16 19:42:33.907	2026-04-24 18:58:11.802	0.99	Alimento	{"sku": "DCH-A-SAL-100G", "tag": "dog-chow-trozos-adulto-salmon-rp-100g", "size": "100 gr", "lotCode": "LOT-20260420-SOLD-DOG-100G-001", "species": "Perro", "taxRate": "0.00", "supplier": "Soldis", "taxExempt": "true", "variantLabel": "100 gr", "expirationDate": "2027-04-22", "purchaseTaxRate": "0.00", "storageLocation": "Principal", "variantBaseName": "Dog Chow trozos adulto salmon RP 100 g", "variantGroupKey": "dog-chow-alimento-dog-dog-chow-trozos-adulto-salmon-rp-100-g-perro", "expirationAlertDays": "30", "purchaseInvoiceDate": "2024-04-07", "purchaseInvoiceNotes": "Factura con 2 notas de credito", "purchaseInvoiceNumber": "001-501-000122471"}	paramascotasec	t
prod_b1c2f52f39a6c	b1c2f52f39a6c	Alimento	Dog Chow trozos adulto pollo 100 g	dog	f	f	1.3000	1.3000	Dog-Chow	0	3	Jugosos trozos sabor pollo que complementan su alimentacion diaria con mucho sabor.	view	dog-chow-trozos-adulto-pollo-100g-b1c2f52f39a6c	2026-04-16 19:42:33.907	2026-04-24 18:58:11.802	0.99	Alimento	{"sku": "DCH-A-POL-100G", "tag": "dog-chow-trozos-adulto-pollo-100g", "size": "100 gr", "lotCode": "LOT-20260420-SOLD-DOG-100G-001", "species": "Perro", "taxRate": "0.00", "supplier": "Soldis", "taxExempt": "true", "variantLabel": "100 gr", "expirationDate": "2027-04-22", "purchaseTaxRate": "0.00", "storageLocation": "Principal", "variantBaseName": "Dog Chow trozos adulto pollo 100 g", "variantGroupKey": "dog-chow-alimento-dog-dog-chow-trozos-adulto-pollo-100-g-perro", "expirationAlertDays": "30", "purchaseInvoiceDate": "2024-04-07", "purchaseInvoiceNotes": "Factura con 2 notas de credito", "purchaseInvoiceNumber": "001-501-000122471"}	paramascotasec	t
prod_c23e724e8ecfc	c23e724e8ecfc	Alimento	NutraPro Adulto RPM 2 kg	dog	f	f	7.9000	7.9000	NutraPro	0	6	Formula premium para perros adultos de raza pequena y mediana, disenada para mantener su energia, fuerza y salud diaria.	view	nutrapro-adulto-rpm-2kg-c23e724e8ecfc	2026-04-16 19:45:36.736	2026-04-24 18:58:11.802	6.22	Alimento	{"sku": "NTP-A-RPM-2KG", "tag": "nutrapro-adulto-rpm-2kg", "size": "2 kg", "lotCode": "LOT-20260420-AGRI-NUTR-2KG-001", "species": "Perro", "taxRate": "0.00", "supplier": "Agripac", "taxExempt": "true", "variantLabel": "2 kg", "expirationDate": "2027-04-22", "purchaseTaxRate": "0.00", "storageLocation": "Principal", "variantBaseName": "NutraPro Adulto RPM 2 kg", "variantGroupKey": "nutrapro-alimento-dog-nutrapro-adulto-rpm-2-kg-perro", "expirationAlertDays": "30", "purchaseInvoiceDate": "2026-04-09", "purchaseInvoiceNumber": "096-004-000060031"}	paramascotasec	t
prod_c5a823e5b80f6	c5a823e5b80f6	Alimento	Felix pouch classic pavo 85 g	cat	f	f	1.4500	1.4500	Purina	0	4	Deliciosa comida humeda sabor pavo, perfecta para consentir a tu gato en cada comida.	view	felix-pouch-classic-pavo-85g-c5a823e5b80f6	2026-04-16 19:42:33.907	2026-04-24 18:58:11.802	1.12	Alimento	{"sku": "FLX-PAV-85G", "tag": "felix-pouch-classic-pavo-85g", "size": "85 gr", "lotCode": "LOT-20260420-SOLD-FELI-85GR-001", "species": "Gato", "taxRate": "0.00", "supplier": "Soldis", "taxExempt": "true", "variantLabel": "85 gr", "expirationDate": "2027-04-22", "purchaseTaxRate": "0.00", "storageLocation": "Principal", "variantBaseName": "Felix pouch classic pavo 85 g", "variantGroupKey": "purina-alimento-cat-felix-pouch-classic-pavo-85-g-gato", "expirationAlertDays": "30", "purchaseInvoiceDate": "2024-04-07", "purchaseInvoiceNotes": "Factura con 2 notas de credito", "purchaseInvoiceNumber": "001-501-000122471"}	paramascotasec	t
prod_c7164cb8d142f	c7164cb8d142f	Alimento	Procan Cachorro Raza Mediana/Grande 2 kg	dog	f	f	5.8000	5.8000	Pro-Can	0	4	Presentacion practica para cachorros, ideal para brindarles una nutricion completa desde sus primeros meses.	view	procan-cachorro-raza-mediana-grande-2kg-c7164cb8d142f	2026-04-16 19:47:22.663	2026-04-24 18:58:11.802	4.58	Alimento	{"sku": "PRO-C-RMG-2KG", "tag": "procan-cachorro-raza-mediana-grande-2kg", "size": "2 kg", "lotCode": "LOT-20260418-DAG-PROC-2KG-597", "species": "Perro", "taxRate": "0.00", "supplier": "DAG", "taxExempt": "true", "variantLabel": "2 kg", "expirationDate": "2027-04-17", "purchaseTaxRate": "0.00", "storageLocation": "Principal", "variantBaseName": "Procan Cachorro Raza Mediana/Grande", "variantGroupKey": "pro-can-alimento-dog-procan-cachorro-raza-mediana-grande-perro", "expirationAlertDays": "30", "purchaseInvoiceDate": "2024-04-10", "purchaseInvoiceNumber": "003-100-000071559"}	paramascotasec	t
prod_d1eb6ab7a109a	d1eb6ab7a109a	accesorios	Plato de acero inoxidable con base antideslizante 22 cm	dog	f	f	5.4783	5.4783	ParaMascotas	0	5	Practico, resistente y elegante. Ideal para servir alimento o agua a tu mascota. Fabricado en acero inoxidable de alta durabilidad, facil de limpiar y con base antideslizante que brinda mayor estabilidad.	view	plato-acero-inoxidable-antideslizante-22cm-d1eb6ab7a109a	2026-04-16 20:13:54.238	2026-04-24 18:58:11.802	3.04	accesorios	{"sku": "ACC-PLA-AC-22", "tag": "plato-acero-inoxidable-antideslizante-22cm", "size": "22 cm", "lotCode": "LOT-20260420-VIBA-PLAT-22-867", "species": "Perro", "taxRate": "15.00", "supplier": "Viba Pets", "taxExempt": "false", "variantLabel": "22 cm", "purchaseTaxRate": "15.00", "storageLocation": "Principal", "variantBaseName": "Plato de acero inoxidable con base antideslizante", "variantGroupKey": "paramascotas-accesorios-dog-plato-de-acero-inoxidable-con-base-antideslizante-perro"}	paramascotasec	t
prod_dabe287b42e8f	dabe287b42e8f	Alimento	Felix pouch classic atun 85 g	cat	f	f	1.4500	1.4500	Purina	0	4	Irresistibles trozos en salsa con delicioso sabor a atun que haran feliz a tu gato.	view	felix-pouch-classic-atun-85g-dabe287b42e8f	2026-04-16 19:42:33.907	2026-04-24 18:58:11.802	1.12	Alimento	{"sku": "FLX-ATU-85G", "tag": "felix-pouch-classic-atun-85g", "size": "85 gr", "lotCode": "LOT-20260420-SOLD-FELI-85GR-001", "species": "Gato", "taxRate": "0.00", "supplier": "Soldis", "taxExempt": "true", "variantLabel": "85 gr", "expirationDate": "2027-04-22", "purchaseTaxRate": "0.00", "storageLocation": "Principal", "variantBaseName": "Felix pouch classic atun 85 g", "variantGroupKey": "purina-alimento-cat-felix-pouch-classic-atun-85-g-gato", "expirationAlertDays": "30", "purchaseInvoiceDate": "2024-04-07", "purchaseInvoiceNotes": "Factura con 2 notas de credito", "purchaseInvoiceNumber": "001-501-000122471"}	paramascotasec	t
prod_0f15a001656dc	0f15a001656dc	Alimento	Procan Cachorro Raza Mediana/Grande 4 kg	dog	f	f	10.8000	10.8000	Pro-Can	0	5	Formula pensada para cachorros en crecimiento, con nutrientes esenciales que apoyan su desarrollo saludable.	view	procan-cachorro-raza-mediana-grande-4kg-0f15a001656dc	2026-04-16 19:47:22.663	2026-04-24 18:58:11.802	8.57	Alimento	{"sku": "PRO-C-RMG-4KG", "tag": "procan-cachorro-raza-mediana-grande-4kg", "size": "4 kg", "lotCode": "LOT-20260418-DAG-PROC-4KG-495", "species": "Perro", "taxRate": "0.00", "supplier": "DAG", "taxExempt": "true", "variantLabel": "4 kg", "expirationDate": "2027-04-17", "purchaseTaxRate": "0.00", "storageLocation": "Principal", "variantBaseName": "Procan Cachorro Raza Mediana/Grande", "variantGroupKey": "pro-can-alimento-dog-procan-cachorro-raza-mediana-grande-perro", "expirationAlertDays": "30", "purchaseInvoiceDate": "2024-04-10", "purchaseInvoiceNumber": "003-100-000071559"}	paramascotasec	t
prod_dcd22eff089c1	dcd22eff089c1	Alimento	Guerpo adulto RMG 25 kg	dog	f	f	64.9000	64.9000	Guerpo	0	1	Presentacion practica de 25 kg, ideal para brindar nutricion diaria, energia y excelente rendimiento por mas tiempo.	view	guerpo-adulto-rmg-25kg-dcd22eff089c1	2026-04-16 19:42:33.907	2026-04-24 18:58:11.802	54.18	Alimento	{"sku": "GUE-A-RMG-25KG", "tag": "guerpo-adulto-rmg-25kg", "size": "25 kg", "lotCode": "LOT-20260420-SOLD-GUER-25KG-001", "species": "Perro", "taxRate": "0.00", "supplier": "Soldis", "taxExempt": "true", "variantLabel": "25 kg", "expirationDate": "2027-04-22", "purchaseTaxRate": "0.00", "storageLocation": "Principal", "variantBaseName": "Guerpo adulto RMG 25 kg", "variantGroupKey": "guerpo-alimento-dog-guerpo-adulto-rmg-25-kg-perro", "expirationAlertDays": "30", "purchaseInvoiceDate": "2024-04-07", "purchaseInvoiceNotes": "Factura con 2 notas de credito", "purchaseInvoiceNumber": "001-501-000122471"}	paramascotasec	t
prod_ddc6b6200e35c	ddc6b6200e35c	Alimento	NutraPro Snack Nugget Gato Sabores del Mar	cat	f	f	1.2174	1.2174	NutraPro	0	12	Snack sabor salmon, perfecto para consentir a tu gato con un premio delicioso y lleno de sabor.	view	nutrapro-snack-nugget-gato-salmon-100g-ddc6b6200e35c	2026-04-16 19:45:36.736	2026-04-24 18:58:11.802	0.74	Alimento	{"sku": "NTP-SNK-SAL-100G", "tag": "nutrapro-snack-nugget-gato-salmon-100g", "size": "100 gr", "color": "Gris", "lotCode": "LOT-20260420-AGRI-NUTR-100-922", "species": "Gato", "taxRate": "15.00", "supplier": "Agripac", "taxExempt": "false", "variantLabel": "100 gr", "expirationDate": "2027-04-22", "purchaseTaxRate": "15.00", "storageLocation": "Principal", "variantBaseName": "NutraPro Snack Nugget Gato Salmon 100 g", "variantGroupKey": "nutrapro-alimento-cat-nutrapro-snack-nugget-gato-salmon-100-g-gato", "expirationAlertDays": "30", "purchaseInvoiceDate": "2026-04-09", "purchaseInvoiceNumber": "096-004-000060031"}	paramascotasec	t
prod_f5c9c76ea722e	f5c9c76ea722e	Alimento	Procat Care Alimento Humedo Pollo 85 g	cat	f	f	1.1000	1.1000	ProCat	0	12	Delicioso alimento humedo sabor pollo, ideal para consentir a tu gato en cada comida.	view	procat-care-alimento-humedo-pollo-85g-f5c9c76ea722e	2026-04-16 19:47:22.663	2026-04-24 18:58:11.802	0.81	Alimento	{"sku": "PCT-HUM-POL-85G", "tag": "procat-care-alimento-humedo-pollo-85g", "size": "85 gr", "lotCode": "LOT-20260419-DAG-PROC-85GR-001", "species": "Gato", "taxRate": "0.00", "supplier": "DAG", "taxExempt": "true", "variantLabel": "85 gr", "expirationDate": "2027-04-19", "purchaseTaxRate": "0.00", "storageLocation": "Principal", "variantBaseName": "Procat Care Alimento Humedo Pollo 85 g", "variantGroupKey": "procat-alimento-cat-procat-care-alimento-humedo-pollo-85-g-gato", "expirationAlertDays": "30", "purchaseInvoiceDate": "2024-04-10", "purchaseInvoiceNumber": "003-100-000071559"}	paramascotasec	t
prod_54c64f6cb2fbb	54c64f6cb2fbb	Alimento	Procat Care Adulto Pollo 2 kg	cat	f	f	8.7500	8.7500	ProCat	0	4	Alimento para gatos adultos sabor pollo, delicioso y balanceado para consentir a tu michi mientras cuidas su salud.	view	procat-care-adulto-pollo-2kg-54c64f6cb2fbb	2026-04-16 19:47:22.663	2026-04-24 18:58:11.802	7.00	Alimento	{"sku": "PCT-A-POL-2KG", "tag": "procat-care-adulto-pollo-2kg", "size": "2 kg", "lotCode": "LOT-20260418-DAG-PROC-2KG-333", "species": "Gato", "taxRate": "0.00", "supplier": "DAG", "taxExempt": "true", "variantLabel": "2 kg", "expirationDate": "2027-04-17", "purchaseTaxRate": "0.00", "storageLocation": "Principal", "variantBaseName": "Procat Care Adulto Pollo 2 kg", "variantGroupKey": "procat-alimento-cat-procat-care-adulto-pollo-2-kg-gato", "expirationAlertDays": "30", "purchaseInvoiceDate": "2024-04-10", "purchaseInvoiceNumber": "003-100-000071559"}	paramascotasec	t
prod_8194a00e4c505	8194a00e4c505	accesorios	Exhibidor de ristra multiproducto Mimma	Unisex	f	f	0.0100	0.0100	Soldis	0	1	Exhibidor de ristra multiproducto Mimma cargado desde compra Soldis. No destinado para venta al publico.	view	exhibidor-ristra-multiproducto-mimma-8194a00e4c505	2026-04-16 19:42:33.907	2026-04-24 18:58:11.802	0.01	accesorios	{"sku": "SOLDIS-EXHIBIDOR-MIMMA", "tag": "exhibidor-ristra-multiproducto-mimma", "species": "Perro y gato", "taxRate": "0.00", "supplier": "Soldis", "taxExempt": "true", "purchaseTaxRate": "0.00", "storageLocation": "Principal", "variantBaseName": "Exhibidor de ristra multiproducto Mimma", "purchaseInvoiceDate": "2024-04-07", "purchaseInvoiceNotes": "Factura con 2 notas de credito", "purchaseInvoiceNumber": "001-501-000122471"}	paramascotasec	f
prod_ca237dae4e0df	ca237dae4e0df	Alimento	Dog Chow trozos adulto cordero 100 g	dog	f	f	1.3000	1.3000	Dog-Chow	0	6	Sabor premium a cordero en una presentacion practica y deliciosa.	view	dog-chow-trozos-adulto-cordero-100g-ca237dae4e0df	2026-04-16 19:42:33.907	2026-04-24 18:58:11.802	0.99	Alimento	{"sku": "DCH-A-COR-100G", "tag": "dog-chow-trozos-adulto-cordero-100g", "size": "100 gr", "lotCode": "LOT-20260420-SOLD-DOG-100G-001", "species": "Perro", "taxRate": "0.00", "supplier": "Soldis", "taxExempt": "true", "variantLabel": "100 gr", "expirationDate": "2027-04-22", "purchaseTaxRate": "0.00", "storageLocation": "Principal", "variantBaseName": "Dog Chow trozos adulto cordero 100 g", "variantGroupKey": "dog-chow-alimento-dog-dog-chow-trozos-adulto-cordero-100-g-perro", "expirationAlertDays": "30", "purchaseInvoiceDate": "2024-04-07", "purchaseInvoiceNotes": "Factura con 2 notas de credito", "purchaseInvoiceNumber": "001-501-000122471"}	paramascotasec	t
prod_e6260031bdb45	e6260031bdb45	Alimento	Cat Chow Adultos Pescado 1.5 kg	cat	f	f	11.2000	11.2000	Purina	0	2	Nutricion completa con irresistible sabor a pescado, ideal para consentir a tu gato mientras cuidas su bienestar.	view	cat-chow-pescado-1-5kg-e6260031bdb45	2026-04-16 19:42:33.907	2026-04-27 11:58:46.937	8.96	Alimento	{"sku": "CCH-PES-1.5KG", "tag": "cat-chow-pescado-1-5kg", "size": "1.5 kg", "lotCode": "LOT-20260420-SOLD-CAT-1-001", "species": "Gato", "taxRate": "0.00", "supplier": "Soldis", "taxExempt": "true", "variantLabel": "1.5 kg", "expirationDate": "2026-12-01", "purchaseTaxRate": "0.00", "storageLocation": "Principal", "variantBaseName": "Cat Chow pescado", "variantGroupKey": "purina-alimento-cat-cat-chow-pescado-gato", "expirationAlertDays": "30", "purchaseInvoiceDate": "2024-04-07", "purchaseInvoiceNotes": "Factura con 2 notas de credito", "purchaseInvoiceNumber": "001-501-000122471"}	paramascotasec	t
prod_11508fde64678	11508fde64678	Alimento	Cat Chow Adultos Carne 0.5 kg	cat	f	f	4.3000	4.3000	Purina	0	0	Delicioso alimento para gatos adultos con sabor a carne en una presentacion practica y conveniente.	view	cat-chow-carne-0-5kg-11508fde64678	2026-04-16 19:42:33.907	2026-04-27 11:57:25.335	3.29	Alimento	{"sku": "CCH-CAR-0.5KG", "tag": "cat-chow-carne-0-5kg", "size": "0.5 kg", "lotCode": "LOT-20260419-SOLD-CAT-0-001", "species": "Gato", "taxRate": "0.00", "supplier": "Soldis", "taxExempt": "true", "variantLabel": "0.5 kg", "expirationDate": "2027-04-19", "purchaseTaxRate": "0.00", "storageLocation": "Principal", "variantBaseName": "Cat Chow carne", "variantGroupKey": "purina-alimento-cat-cat-chow-carne-gato", "expirationAlertDays": "30", "purchaseInvoiceDate": "2024-04-07", "purchaseInvoiceNotes": "Factura con 2 notas de credito", "purchaseInvoiceNumber": "001-501-000122471"}	paramascotasec	f
prod_imp_69da92e203e9b	misha-fashion-pets-camiseta-seleccion-amarilla-xs	ropa	Camiseta Selección Amarilla	dog	f	f	10.3478	10.3478	ParaMascotas	0	0	Camiseta deportiva estilo selección, cómoda y ligera, para que tu mejor amigo disfrute cada partido junto a ti, viva cada gol y sienta la pasión, el orgullo y la emoción de apoyar a La Tri.	view	misha-fashion-pets-camiseta-seleccion-amarilla-xs-camiseta-selecci-on-amarilla	2026-04-11 13:28:49.839	2026-04-27 11:44:50.669	6.06	ropa	{"sku": "ROP-MISHA-CAMISETASELECCIONAMARILLA-XS-AMARILLO-PERRO", "size": "XS", "color": "Amarillo", "gender": "Unisex", "lotCode": "LOT-20260427-MISH-CAMI-XS-001", "species": "Perro", "taxRate": "15.00", "supplier": "Misha Fashion Pets", "taxExempt": "false", "variantLabel": "XS", "purchaseTaxRate": "0.00", "storageLocation": "Principal", "variantBaseName": "Camiseta selección amarilla", "variantGroupKey": "paramascotas-ropa-dog-camiseta-seleccion-amarilla-perro", "supplierDocument": "1308054509001"}	paramascotasec	f
prod_f74a174eae3ee	f74a174eae3ee	Alimento	Dog Chow adulto RP 2 kg	dog	f	f	9.8000	9.8000	Dog-Chow	0	2	Formula especialmente disenada para perros adultos de raza pequena, con croquetas adaptadas a su tamano y gran sabor.	view	dog-chow-adulto-rp-2kg-f74a174eae3ee	2026-04-16 19:42:33.907	2026-04-24 18:58:11.802	7.62	Alimento	{"sku": "DCH-A-RP-2KG", "tag": "dog-chow-adulto-rp-2kg", "size": "2 kg", "lotCode": "LOT-20260420-SOLD-DOG-2KG-001", "species": "Perro", "taxRate": "0.00", "supplier": "Soldis", "taxExempt": "true", "variantLabel": "2 kg", "expirationDate": "2027-04-22", "purchaseTaxRate": "0.00", "storageLocation": "Principal", "variantBaseName": "Dog Chow adulto RP 2 kg", "variantGroupKey": "dog-chow-alimento-dog-dog-chow-adulto-rp-2-kg-perro", "expirationAlertDays": "30", "purchaseInvoiceDate": "2024-04-07", "purchaseInvoiceNotes": "Factura con 2 notas de credito", "purchaseInvoiceNumber": "001-501-000122471"}	paramascotasec	t
prod_fb1df5d2356a4	fb1df5d2356a4	Alimento	NutraPro Catchup Tuna / Salmon 14 g	cat	f	f	0.8696	0.8696	NutraPro	0	50	Delicioso alimento humedo sabor atun, salmon y pescado, ideal para consentir a tu gato en cada comida.	view	nutrapro-catchup-tuna-salmon-14-g-fb1df5d2356a4	2026-04-16 19:45:36.736	2026-04-24 18:58:11.802	0.51	Alimento	{"sku": "NTP-CTU-700G", "tag": "nutrapro-catchup-tuna-salmon-14g", "size": "14 gr", "lotCode": "LOT-20260420-AGRI-NUTR-700G-377", "species": "Gato", "taxRate": "15.00", "supplier": "Agripac", "taxExempt": "false", "variantLabel": "14 gr", "expirationDate": "2027-04-22", "purchaseTaxRate": "15.00", "storageLocation": "Principal", "variantBaseName": "NutraPro Catchup Tuna / Salmon", "variantGroupKey": "nutrapro-alimento-cat-nutrapro-catchup-tuna-salmon-gato", "expirationAlertDays": "30", "purchaseInvoiceDate": "2026-04-09", "purchaseInvoiceNumber": "096-004-000060031"}	paramascotasec	t
prod_imp_69dac08145f91	VIBA-2026-04-11-025	accesorios	Kit de platos plegables gris 350 ml	dog	f	f	14.0870	14.0870	ParaMascotas	0	6	Kit práctico y portátil, perfecto para mantener a tu mascota hidratada y alimentada fuera de casa.	view	viba-2026-04-11-025-kit-de-platos-plegables-gris-350-ml	2026-04-11 16:43:28.661	2026-04-24 18:58:11.802	7.82	accesorios	{"sku": "ACC-VIBA-KITDEPLATOSPLEGABLESGRIS350ML-GRIS-PERROYGATO", "size": "350 ml", "color": "Gris", "lotCode": "LOT-20260412-VIBA-KIT-350M-886", "species": "Perro", "taxRate": "15.00", "supplier": "Viba Pets", "taxExempt": "false", "variantLabel": "350 ml", "purchaseTaxRate": "15.00", "storageLocation": "Principal", "variantBaseName": "Kit de platos plegables gris 350 ml", "variantGroupKey": "paramascotas-accesorios-dog-kit-de-platos-plegables-gris-350-ml-perro", "supplierDocument": "195144540001"}	paramascotasec	t
prod_imp_69dac08123bff	VIBA-2026-04-11-007	accesorios	Dispensador de fundas azul	dog	f	f	0.8696	0.8696	ParaMascotas	0	2	Dispensador práctico y ligero para llevar las fundas siempre a mano en cada paseo.	view	viba-2026-04-11-007-dispensador-de-fundas-azul	2026-04-11 16:43:28.661	2026-04-24 16:15:19.303	0.29	accesorios	{"sku": "ACC-VIBA-DISPENSADORDEFUNDASAZUL-AZUL-PERROYGATO", "color": "Azul", "lotCode": "LOT-20260413-VIBA-DISP-AZUL-969", "species": "Perro", "taxRate": "15.00", "supplier": "Viba Pets", "taxExempt": "false", "variantLabel": "Azul", "purchaseTaxRate": "15.00", "storageLocation": "Principal", "variantBaseName": "Dispensador de fundas azul", "variantGroupKey": "single:prod_imp_69dac08123bff", "supplierDocument": "195144540001"}	paramascotasec	t
prod_imp_69dac080ce242	VIBA-2026-04-11-003	accesorios	Rollo de fundas para desechos	dog	f	f	0.4348	0.4348	ParaMascotas	0	7	Rollo de fundas resistentes y prácticas, ideal para mantener cada paseo limpio mientras eliges una opción más amigable con el medio ambiente.	view	viba-2026-04-11-003-rollo-de-fundas-para-desechos-verde	2026-04-11 16:43:28.661	2026-04-24 16:15:19.303	0.24	accesorios	{"sku": "ACC-VIBA-ROLLODEFUNDASPARADESECHOSVERDE-VERDE-PERROYGATO", "color": "Verde", "lotCode": "LOT-20260412-VIBA-ROLL-VERD-981", "species": "Perro", "taxRate": "15.00", "supplier": "Viba Pets", "taxExempt": "false", "variantLabel": "VERDE", "purchaseTaxRate": "15.00", "storageLocation": "Principal", "variantBaseName": "Rollo de fundas para desechos", "variantGroupKey": "single:prod_imp_69dac080ce242", "supplierDocument": "195144540001"}	paramascotasec	t
prod_imp_69da92e1dbb96	misha-fashion-pets-camiseta-polo-love-rosa-l	ropa	Camiseta Polo Love Rosa	dog	f	f	9.4783	9.4783	ParaMascotas	0	0	Camiseta polo en tono rosa con diseño adorable, perfecta para que tu mascota luzca tierna y cómoda en cada paseo.	view	misha-fashion-pets-camiseta-polo-love-rosa-l-camiseta-polo-love-rosa	2026-04-11 13:28:49.839	2026-04-27 09:54:39.946	5.83	ropa	{"sku": "ROP-MISHA-CAMISETAPOLOLOVEROSA-L-ROSA-PERRO", "size": "L", "color": "Rosa", "gender": "Hembra", "lotCode": "LOT-20260411-MISH-CAMI-L-516", "species": "Perro", "taxRate": "15.00", "supplier": "Misha Fashion Pets", "taxExempt": "false", "variantLabel": "L", "purchaseTaxRate": "0.00", "storageLocation": "Principal", "variantBaseName": "Camiseta Polo Love Rosa", "variantGroupKey": "paramascotas-ropa-dog-camiseta-polo-love-rosa-perro", "supplierDocument": "1308054509001"}	paramascotasec	f
prod_imp_69da92e1e48ba	misha-fashion-pets-camiseta-polo-azul-l	ropa	Camiseta Polo Azul	dog	f	f	9.3913	9.3913	ParaMascotas	0	1	Polo en tono azul con estilo moderno, ideal para paseos y aventuras diarias.	view	misha-fashion-pets-camiseta-polo-azul-l-camiseta-polo-azul	2026-04-11 13:28:49.839	2026-04-24 16:15:19.303	5.83	ropa	{"sku": "ROP-MISHA-CAMISETAPOLOAZUL-L-AZUL-PERRO", "size": "L", "color": "Azul", "gender": "Unisex", "species": "Perro", "taxRate": "15.00", "archived": "true", "supplier": "Misha Fashion Pets", "taxExempt": "false", "archivedAt": "2026-04-11T19:57:18+00:00", "archivedName": "Camiseta Polo Azul", "variantLabel": "L", "purchaseTaxRate": "0.00", "storageLocation": "Principal", "variantBaseName": "Camiseta Polo Azul", "variantGroupKey": "misha-fashion-pets-ropa-dog-camiseta-polo-azul-perro", "archivedLegacyId": "misha-fashion-pets-camiseta-polo-azul-l", "supplierDocument": "1308054509001", "archivedProductId": "prod_imp_69da92e1e48ba"}	paramascotasec	f
prod_ad2d8ff694290	ad2d8ff694290	accesorios	Dispensador de fundas gris	dog	f	f	0.8696	0.8696	ParaMascotas	0	1	Dispensador practico y ligero para llevar las fundas siempre a mano en cada paseo.	view	dispensador-de-fundas-gris-ad2d8ff694290	2026-04-16 20:13:54.238	2026-04-24 16:15:19.303	0.29	accesorios	{"sku": "ACC-DSP-GR", "tag": "dispensador-de-fundas-gris", "color": "Gris", "lotCode": "LOT-20260420-VIBA-DISP-GRIS-001", "species": "Perro", "taxRate": "15.00", "supplier": "Viba Pets", "taxExempt": "false", "variantLabel": "GRIS", "purchaseTaxRate": "15.00", "storageLocation": "Principal", "variantBaseName": "Dispensador de fundas", "variantGroupKey": "paramascotas-accesorios-dog-dispensador-de-fundas-perro"}	paramascotasec	t
prod_cbe02cc7a74d6	cbe02cc7a74d6	Alimento	Wellness Adult Dog RPM Grain Free 2.5 kg	dog	f	f	23.9000	23.9000	Wellness	0	3	Formula premium para perros adultos, ideal para brindar una nutricion balanceada, energia y bienestar diario.	view	wellness-adult-dog-rpm-grain-free-2-5kg-cbe02cc7a74d6	2026-04-16 19:45:36.736	2026-04-24 18:58:11.802	15.39	Alimento	{"sku": "WEL-A-RPM-2.5KG", "tag": "wellness-adult-dog-rpm-grain-free-2-5kg", "size": "2.5 kg", "lotCode": "LOT-20260419-AGRI-WELL-2-001", "species": "Perro", "taxRate": "0.00", "supplier": "Agripac", "taxExempt": "true", "variantLabel": "2.5 kg", "expirationDate": "2027-04-22", "purchaseTaxRate": "0.00", "storageLocation": "Principal", "variantBaseName": "Wellness Adult Dog RPM Grain Free 2.5 kg", "variantGroupKey": "wellness-alimento-dog-wellness-adult-dog-rpm-grain-free-2-5-kg-perro", "expirationAlertDays": "30", "purchaseInvoiceDate": "2026-04-09", "purchaseInvoiceNumber": "096-004-000060031"}	paramascotasec	t
prod_69d7103e397c3	69d7103e397c7	ropa	Chaleco Lazo	dog	t	f	8.2609	8.2609	ParaMascotas	0	1	Chaleco elegante en tono turquesa con diseño acolchado y acabado moderno. Perfecto para brindar comodidad y estilo en salidas o paseos.	view	chaleco-lazo-69d7103e39cfc	2026-04-08 21:34:38.235	2026-04-27 11:41:23.7	5.50	ropa	{"sku": "ROP-PARAMA-CHALEC-LAZO-S-AZUL-PERRO", "size": "S", "color": "Azul", "gender": "Hembra", "lotCode": "LOT-20260319-PETS-CHAL-S-852", "species": "Perro", "taxRate": "15.00", "supplier": "Pets Factory", "taxExempt": "false", "variantLabel": "S", "purchaseTaxRate": "15.00", "storageLocation": "Principal", "variantBaseName": "Chaleco Lazo", "variantGroupKey": "paramascotas-ropa-dog-chaleco-lazo-perro"}	paramascotasec	t
prod_imp_69da92e2d910b	misha-fashion-pets-camiseta-seleccion-azul-m	ropa	Camiseta Selección Azul M	dog	f	f	12.0870	12.0870	ParaMascotas	0	1	Camiseta deportiva estilo selección en tono azul, cómoda y ligera, para que tu mejor amigo disfrute cada partido junto a ti con estilo y energía.	view	misha-fashion-pets-camiseta-seleccion-azul-m-camiseta-selecci-on-azul	2026-04-11 13:28:49.839	2026-04-27 11:46:54.376	7.46	ropa	{"sku": "ROP-MISHA-CAMISETASELECCIONAZUL-M-AZUL-PERRO", "size": "M", "color": "Azul", "gender": "Unisex", "lotCode": "LOT-20260411-MISH-CAMI-M-140", "species": "Perro", "taxRate": "15.00", "supplier": "Misha Fashion Pets", "taxExempt": "false", "variantLabel": "M", "purchaseTaxRate": "0.00", "storageLocation": "Principal", "variantBaseName": "Camiseta selección azul", "variantGroupKey": "paramascotas-ropa-dog-camiseta-seleccion-azul-perro", "supplierDocument": "1308054509001"}	paramascotasec	t
prod_imp_69da92e2e7945	misha-fashion-pets-camiseta-seleccion-blanca-s	ropa	Camiseta Selección Blanca S	dog	f	f	11.2174	11.2174	ParaMascotas	0	1	Camiseta deportiva estilo selección en tono blanco, cómoda y ligera, para que tu mejor amigo disfrute cada partido junto a ti con un look fresco y elegante.	view	misha-fashion-pets-camiseta-seleccion-blanca-s-camiseta-selecci-on-blanca	2026-04-11 13:28:49.839	2026-04-27 11:47:38.818	6.53	ropa	{"sku": "ROP-MISHA-CAMISETASELECCIONBLANCA-S-BLANCO-PERRO", "size": "S", "color": "Blanco", "gender": "Unisex", "lotCode": "LOT-20260411-MISH-CAMI-S-185", "species": "Perro", "taxRate": "15.00", "supplier": "Misha Fashion Pets", "taxExempt": "false", "variantLabel": "S", "purchaseTaxRate": "0.00", "storageLocation": "Principal", "variantBaseName": "Camiseta selección blanca", "variantGroupKey": "paramascotas-ropa-dog-camiseta-seleccion-blanca-perro", "supplierDocument": "1308054509001"}	paramascotasec	t
prod_63bb9f3ebaa4b	63bb9f3ebaa4b	accesorios	Collar con Cascabel Amarillo	dog	f	f	0.8696	0.8696	ParaMascotas	0	1	Collar ajustable con cascabel, ideal para que tu mascota luzca adorable y sea facil de localizar.	view	collar-con-cascabel-amarillo-63bb9f3ebaa4b	2026-04-16 20:13:54.238	2026-04-27 13:03:55.059	0.00	accesorios	{"sku": "ACC-COL-CAS-AM", "tag": "collar-con-cascabel-amarillo", "size": "S", "color": "Amarillo", "lotCode": "LOT-20260418-VIBA-COLL-AMAR-584", "species": "Perro", "taxRate": "15.00", "supplier": "Viba Pets", "taxExempt": "false", "variantLabel": "Amarillo", "purchaseTaxRate": "15.00", "storageLocation": "Principal", "variantBaseName": "Collar con cascabel amarillo", "variantGroupKey": "paramascotas-accesorios-dog-collar-con-cascabel-amarillo-perro"}	paramascotasec	t
prod_30a73dd0b1c3c	30a73dd0b1c3c	Alimento	Dog Chow trozos adulto carne 100 g	dog	f	f	1.3000	1.3000	Dog-Chow	0	2	Deliciosos trozos sabor carne, ideales para consentir a tu perro.	view	dog-chow-trozos-adulto-carne-100g-30a73dd0b1c3c	2026-04-16 19:42:33.907	2026-04-24 18:58:11.802	0.99	Alimento	{"sku": "DCH-A-CAR-100G", "tag": "dog-chow-trozos-adulto-carne-100g", "size": "100 gr", "lotCode": "LOT-20260420-SOLD-DOG-100G-001", "species": "Perro", "taxRate": "0.00", "supplier": "Soldis", "taxExempt": "true", "variantLabel": "100 gr", "expirationDate": "2027-04-22", "purchaseTaxRate": "0.00", "storageLocation": "Principal", "variantBaseName": "Dog Chow trozos adulto carne 100 g", "variantGroupKey": "dog-chow-alimento-dog-dog-chow-trozos-adulto-carne-100-g-perro", "expirationAlertDays": "30", "purchaseInvoiceDate": "2024-04-07", "purchaseInvoiceNotes": "Factura con 2 notas de credito", "purchaseInvoiceNumber": "001-501-000122471"}	paramascotasec	t
prod_imp_69dac080e7ad7	VIBA-2026-04-11-004	accesorios	Rollo de fundas para desechos	dog	f	f	0.4348	0.4348	ParaMascotas	0	7	Rollo de fundas resistentes y prácticas, ideal para mantener cada paseo limpio mientras eliges una opción más amigable con el medio ambiente.	view	viba-2026-04-11-004-rollo-de-fundas-para-desechos-amarillo	2026-04-11 16:43:28.661	2026-04-24 16:15:19.303	0.24	accesorios	{"sku": "ACC-VIBA-ROLLODEFUNDASPARADESECHOSAMARILLO-AMARILLO-PERROYGATO", "color": "Amarillo", "lotCode": "LOT-20260412-VIBA-ROLL-AMAR-672", "species": "Perro", "taxRate": "15.00", "supplier": "Viba Pets", "taxExempt": "false", "variantLabel": "AMARILLO", "purchaseTaxRate": "15.00", "storageLocation": "Principal", "variantBaseName": "Rollo de fundas para desechos", "variantGroupKey": "single:prod_imp_69dac080e7ad7", "supplierDocument": "195144540001"}	paramascotasec	t
prod_imp_69da92e1ee6dd	misha-fashion-pets-camiseta-polo-verde-militar-s	ropa	Camiseta Polo Verde Militar	dog	f	f	6.5217	6.5217	ParaMascotas	0	1	Polo en tono verde militar con estilo moderno, ideal para paseos y aventuras diarias.	view	misha-fashion-pets-camiseta-polo-verde-militar-s-camiseta-polo-verde-militar	2026-04-11 13:28:49.839	2026-04-24 16:15:19.303	3.96	ropa	{"sku": "ROP-MISHA-CAMISETAPOLOVERDEMILITAR-S-VERDEMILITAR-PERRO", "size": "S", "color": "Verde Militar", "gender": "Unisex", "species": "Perro", "taxRate": "15.00", "supplier": "Misha Fashion Pets", "taxExempt": "false", "variantLabel": "S", "purchaseTaxRate": "0.00", "storageLocation": "Principal", "variantBaseName": "Camiseta Polo Verde Militar", "variantGroupKey": "misha-fashion-pets-ropa-dog-camiseta-polo-verde-militar-perro", "supplierDocument": "1308054509001"}	paramascotasec	t
prod_imp_69da92e1e11a0	misha-fashion-pets-camiseta-polo-kisses-rosa-s	ropa	Camiseta Polo Kisses Rosa	dog	f	f	6.5217	6.5217	ParaMascotas	0	1	Polo rosada con estampado delicado y encantador, ideal para paseos con mucho estilo.	view	misha-fashion-pets-camiseta-polo-kisses-rosa-s-camiseta-polo-kisses-rosa	2026-04-11 13:28:49.839	2026-04-27 09:52:14.806	3.96	ropa	{"sku": "ROP-MISHA-CAMISETAPOLOKISSESROSA-S-ROSA-PERRO", "size": "S", "color": "Rosa", "gender": "Hembra", "lotCode": "LOT-20260411-MISH-CAMI-S-355", "species": "Perro", "taxRate": "15.00", "supplier": "Misha Fashion Pets", "taxExempt": "false", "variantLabel": "S", "purchaseTaxRate": "0.00", "storageLocation": "Principal", "variantBaseName": "Camiseta Polo Kisses Rosa", "variantGroupKey": "paramascotas-ropa-dog-camiseta-polo-kisses-rosa-perro", "supplierDocument": "1308054509001"}	paramascotasec	t
prod_27de42b7f6c83	27de42b7f6c83	Alimento	Cat Chow Adultos Carne 1.5 kg	cat	f	f	11.2000	11.2000	Purina	0	2	Delicioso alimento para gatos adultos con sabor a carne, formulado para cuidar su salud y vitalidad diaria.	view	cat-chow-carne-1-5kg-27de42b7f6c83	2026-04-16 19:42:33.907	2026-04-27 11:57:44.56	8.96	Alimento	{"sku": "CCH-CAR-1.5KG", "tag": "cat-chow-carne-1-5kg", "size": "1.5 kg", "lotCode": "LOT-20260419-SOLD-CAT-1-001", "species": "Gato", "taxRate": "0.00", "supplier": "Soldis", "taxExempt": "true", "variantLabel": "1.5 kg", "expirationDate": "2027-07-01", "purchaseTaxRate": "0.00", "storageLocation": "Principal", "variantBaseName": "Cat Chow carne", "variantGroupKey": "purina-alimento-cat-cat-chow-carne-gato", "expirationAlertDays": "30", "purchaseInvoiceDate": "2024-04-07", "purchaseInvoiceNotes": "Factura con 2 notas de credito", "purchaseInvoiceNumber": "001-501-000122471"}	paramascotasec	t
prod_imp_69dac0814865e	VIBA-2026-04-11-027	accesorios	Juguete interactivo Cat Tower	cat	f	f	8.6087	8.6087	ParaMascotas	0	6	Juguete diseñado para estimular la curiosidad y mantener a tu gato activo y entretenido.	view	viba-2026-04-11-027-juguete-interactivo-cat-tower-verde	2026-04-11 16:43:28.661	2026-04-24 16:15:19.303	4.35	accesorios	{"sku": "ACC-VIBA-JUGUETEINTERACTIVOCATTOWERVERDE-VERDE-GATO", "color": "Verde", "lotCode": "LOT-20260412-VIBA-JUGU-VERD-878", "species": "Gato", "taxRate": "15.00", "supplier": "Viba Pets", "taxExempt": "false", "variantLabel": "Verde", "purchaseTaxRate": "15.00", "storageLocation": "Principal", "variantBaseName": "Juguete interactivo Cat Tower", "variantGroupKey": "single:prod_imp_69dac0814865e", "supplierDocument": "195144540001"}	paramascotasec	t
prod_2a3165d055178	2a3165d055178	Alimento	Cani Premium Adulto Razas Pequeñas 9 kg	dog	f	f	33.4000	33.4000	Cani	0	7	Presentacion ideal para perros adultos de raza pequena, con excelente rendimiento.	view	cani-adulto-rp-9kg-2a3165d055178	2026-04-16 19:42:33.907	2026-04-27 10:37:23.382	25.58	Alimento	{"sku": "CAN-A-RP-9KG", "tag": "cani-adulto-rp-9kg", "size": "9 kg", "lotCode": "LOT-20260419-SOLD-CANI-9KG-001", "species": "Perro", "taxRate": "0.00", "supplier": "Soldis", "taxExempt": "true", "variantLabel": "9 kg", "expirationDate": "2027-02-10", "purchaseTaxRate": "0.00", "storageLocation": "Principal", "variantBaseName": "Cani adulto RP 9 kg", "variantGroupKey": "cani-alimento-dog-cani-adulto-rp-9-kg-perro", "expirationAlertDays": "30", "purchaseInvoiceDate": "2024-04-07", "purchaseInvoiceNotes": "Factura con 2 notas de credito", "purchaseInvoiceNumber": "001-501-000122471"}	paramascotasec	t
prod_imp_69dac0810480c	VIBA-2026-04-11-005	accesorios	Dispensador de fundas naranja	dog	f	f	0.8696	0.8696	ParaMascotas	0	1	Dispensador práctico y ligero para llevar las fundas siempre a mano en cada paseo.	view	viba-2026-04-11-005-dispensador-de-fundas-naranja	2026-04-11 16:43:28.661	2026-04-24 16:15:19.303	0.29	accesorios	{"sku": "ACC-VIBA-DISPENSADORDEFUNDASNARANJA-NARANJA-PERROYGATO", "color": "Naranja", "lotCode": "LOT-20260413-VIBA-DISP-NARA-513", "species": "Perro", "taxRate": "15.00", "supplier": "Viba Pets", "taxExempt": "false", "variantLabel": "Naranja", "purchaseTaxRate": "15.00", "storageLocation": "Principal", "variantBaseName": "Dispensador de fundas naranja", "variantGroupKey": "single:prod_imp_69dac0810480c", "supplierDocument": "195144540001"}	paramascotasec	t
prod_imp_69dac08144b80	VIBA-2026-04-11-024	accesorios	Plato plegable pequeño	dog	f	f	2.3478	2.3478	ParaMascotas	0	4	Plato portátil y plegable, ideal para agua o alimento en paseos, viajes y salidas.	view	viba-2026-04-11-024-plato-plegable-peque-no-rojo	2026-04-11 16:43:28.661	2026-04-24 16:15:19.303	1.31	accesorios	{"sku": "ACC-VIBA-PLATOPLEGABLEPEQUENOROJO-ROJO-PERROYGATO", "color": "Rojo", "lotCode": "LOT-20260412-VIBA-PLAT-ROJO-657", "species": "Perro", "taxRate": "15.00", "supplier": "Viba Pets", "taxExempt": "false", "variantLabel": "ROJO", "purchaseTaxRate": "15.00", "storageLocation": "Principal", "variantBaseName": "Plato plegable pequeño", "variantGroupKey": "single:prod_imp_69dac08144b80", "supplierDocument": "195144540001"}	paramascotasec	t
prod_imp_69da92e20fc1b	misha-fashion-pets-camiseta-seleccion-amarilla-s	ropa	Camiseta Selección Amarilla	dog	f	f	11.2174	11.2174	ParaMascotas	0	2	Camiseta deportiva estilo selección, cómoda y ligera, para que tu mejor amigo disfrute cada partido junto a ti, viva cada gol y sienta la pasión, el orgullo y la emoción de apoyar a La Tri.	view	misha-fashion-pets-camiseta-seleccion-amarilla-s-camiseta-selecci-on-amarilla	2026-04-11 13:28:49.839	2026-04-27 11:44:23.385	6.53	ropa	{"sku": "ROP-MISHA-CAMISETASELECCIONAMARILLA-S-AMARILLO-PERRO", "size": "S", "color": "Amarillo", "gender": "Unisex", "lotCode": "LOT-20260427-MISH-CAMI-S-001", "species": "Perro", "taxRate": "15.00", "supplier": "Misha Fashion Pets", "taxExempt": "false", "variantLabel": "S", "purchaseTaxRate": "0.00", "storageLocation": "Principal", "variantBaseName": "Camiseta selección amarilla", "variantGroupKey": "paramascotas-ropa-dog-camiseta-seleccion-amarilla-perro", "supplierDocument": "1308054509001"}	paramascotasec	t
prod_69d83dbbf2679	69d83dbbf267c	ropa	Camiseta Monster	dog	t	f	6.7478	6.7478	ParaMascotas	0	0	Camiseta ligera y cómoda con divertido diseño “Monster”, ideal para darle a tu mascota un look original y lleno de personalidad.	view	camiseta-monster-69d83dbbf2687	2026-04-09 19:00:59.984	2026-04-27 09:53:22.986	4.50	ropa	{"sku": "ROP-PARAMA-CAMISE-MONSTE-XS-PERRO", "size": "XS", "gender": "Macho", "lotCode": "LOT-20260319-PETS-CAMI-XS-437", "species": "Perro", "taxRate": "15.00", "supplier": "Pets Factory", "taxExempt": "false", "variantLabel": "XS", "purchaseTaxRate": "15.00", "storageLocation": "Principal", "variantBaseName": "Camiseta Monster", "variantGroupKey": "paramascotas-ropa-dog-camiseta-monster-perro"}	paramascotasec	f
prod_imp_69da92e1e3204	misha-fashion-pets-camiseta-polo-azul-s	ropa	Camiseta Polo Azul	dog	f	f	6.5217	6.5217	ParaMascotas	0	1	Polo en tono azul con estilo moderno, ideal para paseos y aventuras diarias.	view	misha-fashion-pets-camiseta-polo-azul-s-camiseta-polo-azul	2026-04-11 13:28:49.839	2026-04-24 16:15:19.303	3.96	ropa	{"sku": "ROP-MISHA-CAMISETAPOLOAZUL-S-AZUL-PERRO", "size": "S", "color": "Azul", "gender": "Unisex", "species": "Perro", "taxRate": "15.00", "archived": "true", "supplier": "Misha Fashion Pets", "taxExempt": "false", "archivedAt": "2026-04-11T19:57:22+00:00", "archivedName": "Camiseta Polo Azul", "variantLabel": "S", "purchaseTaxRate": "0.00", "storageLocation": "Principal", "variantBaseName": "Camiseta Polo Azul", "variantGroupKey": "misha-fashion-pets-ropa-dog-camiseta-polo-azul-perro", "archivedLegacyId": "misha-fashion-pets-camiseta-polo-azul-s", "supplierDocument": "1308054509001", "archivedProductId": "prod_imp_69da92e1e3204"}	paramascotasec	f
prod_69d8043e47fd0	69d8043e47fd1	ropa	Saco Woof	dog	t	f	10.4261	10.4261	ParaMascotas	0	1	Saco afelpado en color rosado con divertido estampado frontal. Su textura suave brinda abrigo y comodidad, ideal para días frescos.	view	saco-woof-69d8043e47fd8	2026-04-09 14:55:42.295	2026-04-24 16:15:19.303	7.00	ropa	{"sku": "ROP-PARAMA-SACO-WOOF-M-ROSA-PERRO", "size": "M", "color": "Rosa", "gender": "Hembra", "lotCode": "LOT-20260319-PETS-SACO-M-181", "species": "Perro", "taxRate": "15.00", "supplier": "Pets Factory", "taxExempt": "false", "variantLabel": "M", "purchaseTaxRate": "15.00", "storageLocation": "Principal", "variantBaseName": "Saco Woof", "variantGroupKey": "paramascotas-ropa-dog-saco-woof-perro"}	paramascotasec	t
prod_092e88b295775	092e88b295775	Alimento	Dog Chow cachorro RP 2 kg	dog	f	f	10.2000	10.2000	Dog-Chow	0	4	Apoya el crecimiento saludable de tu cachorro con una nutricion balanceada que fortalece su desarrollo desde sus primeros meses.	view	dog-chow-cachorro-rp-2kg-092e88b295775	2026-04-16 19:42:33.907	2026-04-24 18:58:11.802	7.90	Alimento	{"sku": "DCH-C-RP-2KG", "tag": "dog-chow-cachorro-rp-2kg", "size": "2 kg", "lotCode": "LOT-20260420-SOLD-DOG-2KG-001", "species": "Perro", "taxRate": "0.00", "supplier": "Soldis", "taxExempt": "true", "variantLabel": "2 kg", "expirationDate": "2027-04-22", "purchaseTaxRate": "0.00", "storageLocation": "Principal", "variantBaseName": "Dog Chow cachorro RP 2 kg", "variantGroupKey": "dog-chow-alimento-dog-dog-chow-cachorro-rp-2-kg-perro", "expirationAlertDays": "30", "purchaseInvoiceDate": "2024-04-07", "purchaseInvoiceNotes": "Factura con 2 notas de credito", "purchaseInvoiceNumber": "001-501-000122471"}	paramascotasec	t
prod_imp_69dac081370a9	VIBA-2026-04-11-013	accesorios	Set collar + correa Huellitas naranja	dog	f	f	2.1739	2.1739	ParaMascotas	0	2	Set cómodo y resistente con diseño de huellitas, perfecto para paseos seguros y con estilo.	view	viba-2026-04-11-013-set-collar-correa-huellitas-naranja	2026-04-11 16:43:28.661	2026-04-24 16:15:19.303	1.02	accesorios	{"sku": "ACC-VIBA-SETCOLLARCORREAHUELLITASNARANJA-NARANJA-PERROYGATO", "color": "Naranja", "lotCode": "LOT-20260413-VIBA-SET-NARA-145", "species": "Perro", "taxRate": "15.00", "supplier": "Viba Pets", "taxExempt": "false", "variantLabel": "NARANJA", "purchaseTaxRate": "15.00", "storageLocation": "Principal", "variantBaseName": "Set collar + correa Huellitas naranja", "variantGroupKey": "single:prod_imp_69dac081370a9", "supplierDocument": "195144540001"}	paramascotasec	t
prod_imp_69da92e21f250	misha-fashion-pets-camiseta-seleccion-amarilla-l	ropa	Camiseta Selección Amarilla	dog	f	f	13.4783	13.4783	ParaMascotas	0	2	Camiseta deportiva estilo selección, cómoda y ligera, para que tu mejor amigo disfrute cada partido junto a ti, viva cada gol y sienta la pasión, el orgullo y la emoción de apoyar a La Tri.	view	misha-fashion-pets-camiseta-seleccion-amarilla-l-camiseta-selecci-on-amarilla	2026-04-11 13:28:49.839	2026-04-27 11:44:36.887	8.40	ropa	{"sku": "ROP-MISHA-CAMISETASELECCIONAMARILLA-L-AMARILLO-PERRO", "size": "L", "color": "Amarillo", "gender": "Unisex", "lotCode": "LOT-20260427-MISH-CAMI-L-001", "species": "Perro", "taxRate": "15.00", "supplier": "Misha Fashion Pets", "taxExempt": "false", "variantLabel": "L", "purchaseTaxRate": "0.00", "storageLocation": "Principal", "variantBaseName": "Camiseta selección amarilla", "variantGroupKey": "paramascotas-ropa-dog-camiseta-seleccion-amarilla-perro", "supplierDocument": "1308054509001"}	paramascotasec	t
prod_imp_69dac081436fa	VIBA-2026-04-11-023	accesorios	Plato plegable pequeño	dog	f	f	2.3478	2.3478	ParaMascotas	0	4	Plato portátil y plegable, ideal para agua o alimento en paseos, viajes y salidas.	view	viba-2026-04-11-023-plato-plegable-peque-no-azul	2026-04-11 16:43:28.661	2026-04-24 16:15:19.303	1.31	accesorios	{"sku": "ACC-VIBA-PLATOPLEGABLEPEQUENOAZUL-AZUL-PERROYGATO", "color": "Azul", "lotCode": "LOT-20260412-VIBA-PLAT-AZUL-779", "species": "Perro", "taxRate": "15.00", "supplier": "Viba Pets", "taxExempt": "false", "variantLabel": "AZUL", "purchaseTaxRate": "15.00", "storageLocation": "Principal", "variantBaseName": "Plato plegable pequeño", "variantGroupKey": "single:prod_imp_69dac081436fa", "supplierDocument": "195144540001"}	paramascotasec	t
prod_imp_69dac0813976a	VIBA-2026-04-11-015	accesorios	Pelota pequeña verde	dog	f	f	1.7304	1.7304	ParaMascotas	0	2	Pelota resistente y divertida, ideal para juegos diarios y momentos de entretenimiento.	view	viba-2026-04-11-015-pelota-peque-na-verde	2026-04-11 16:43:28.661	2026-04-24 16:15:19.303	0.87	accesorios	{"sku": "ACC-VIBA-PELOTAPEQUENAVERDE-VERDE-PERROYGATO", "color": "Verde", "lotCode": "LOT-20260413-VIBA-PELO-VERD-392", "species": "Perro", "taxRate": "15.00", "supplier": "Viba Pets", "taxExempt": "false", "variantLabel": "VERDE", "purchaseTaxRate": "15.00", "storageLocation": "Principal", "variantBaseName": "Pelota pequeña verde", "variantGroupKey": "single:prod_imp_69dac0813976a", "supplierDocument": "195144540001"}	paramascotasec	t
prod_imp_69dac0813ad61	VIBA-2026-04-11-016	accesorios	Pelota pequeña turquesa	dog	f	f	1.7304	1.7304	ParaMascotas	0	2	Pelota resistente y divertida, ideal para juegos diarios y momentos de entretenimiento.	view	viba-2026-04-11-016-pelota-peque-na-turquesa	2026-04-11 16:43:28.661	2026-04-24 16:15:19.303	0.87	accesorios	{"sku": "ACC-VIBA-PELOTAPEQUENATURQUESA-TURQUESA-PERROYGATO", "color": "Turquesa", "lotCode": "LOT-20260413-VIBA-PELO-TURQ-390", "species": "Perro", "taxRate": "15.00", "supplier": "Viba Pets", "taxExempt": "false", "variantLabel": "TURQUESA", "purchaseTaxRate": "15.00", "storageLocation": "Principal", "variantBaseName": "Pelota pequeña turquesa", "variantGroupKey": "single:prod_imp_69dac0813ad61", "supplierDocument": "195144540001"}	paramascotasec	t
prod_69da8d1acf310	69da8d1acf311	ropa	Vestido	dog	t	f	11.2957	11.2957	ParaMascotas	0	1	Vestido en tono azul con falda estampada y detalle decorativo en la parte superior. Perfecto para ocasiones especiales o para un look sofisticado.	view	vestido-69da8d1acf317	2026-04-11 13:04:10.849	2026-04-24 16:15:19.303	7.50	ropa	{"sku": "ROP-PARAMA-VESTID-L-AZUL-PERRO", "size": "L", "color": "Azul", "gender": "Hembra", "lotCode": "LOT-20260319-PETS-VEST-L-695", "species": "Perro", "taxRate": "15.00", "supplier": "Pets Factory", "taxExempt": "false", "variantLabel": "L", "purchaseTaxRate": "15.00", "storageLocation": "Principal", "variantBaseName": "Vestido", "variantGroupKey": "paramascotas-ropa-dog-vestido-perro"}	paramascotasec	t
prod_9bc6629e13c1c	9bc6629e13c1c	Alimento	NutraPro Catchup Pollo 14 g	cat	f	f	0.8696	0.8696	NutraPro	0	100	Delicioso alimento humedo sabor pollo y pescado, perfecto para variar la alimentacion de tu gato con mucho sabor.	view	nutrapro-catchup-pollo-14-g-9bc6629e13c1c	2026-04-16 19:45:36.736	2026-04-24 18:58:11.802	0.51	Alimento	{"sku": "NTP-CCH-14G", "tag": "nutrapro-catchup-pollo-14g", "size": "14 gr", "color": "Gris", "lotCode": "LOT-20260420-AGRI-NUTR-14G-626", "species": "Gato", "taxRate": "15.00", "supplier": "Agripac", "taxExempt": "false", "variantLabel": "14 gr", "expirationDate": "2027-04-22", "purchaseTaxRate": "15.00", "storageLocation": "Principal", "variantBaseName": "NutraPro Catchup Pollo", "variantGroupKey": "nutrapro-alimento-cat-nutrapro-catchup-pollo-gato", "expirationAlertDays": "30", "purchaseInvoiceDate": "2026-04-09", "purchaseInvoiceNumber": "096-004-000060031"}	paramascotasec	t
prod_24dd9543aa02c	24dd9543aa02c	Alimento	Carnitas Comida Húmeda Perros Cordero en Salsa 100 g	dog	f	f	1.0000	1.0000	Mimma	0	5	Deliciosa receta sabor cordero, perfecta para variar su alimentacion.	view	carnitas-pouch-perro-cordero-100g-24dd9543aa02c	2026-04-16 19:42:33.907	2026-04-27 12:12:12.445	0.72	Alimento	{"sku": "CAR-COR-100G", "tag": "carnitas-pouch-perro-cordero-100g", "size": "100 gr", "color": "Gris", "lotCode": "LOT-20260419-SOLD-CARN-100G-188", "species": "Perro", "taxRate": "0.00", "supplier": "Soldis", "taxExempt": "true", "variantLabel": "100 gr", "expirationDate": "2028-03-03", "purchaseTaxRate": "0.00", "storageLocation": "Principal", "variantBaseName": "Carnitas pouch perro cordero 100 g", "variantGroupKey": "mimma-alimento-dog-carnitas-pouch-perro-cordero-100-g-perro", "expirationAlertDays": "30", "purchaseInvoiceDate": "2024-04-07", "purchaseInvoiceNotes": "Factura con 2 notas de credito", "purchaseInvoiceNumber": "001-501-000122471"}	paramascotasec	t
prod_imp_69da92e21796d	misha-fashion-pets-camiseta-seleccion-amarilla-m	ropa	Camiseta Selección Amarilla	dog	f	f	12.0870	12.0870	ParaMascotas	0	2	Camiseta deportiva estilo selección, cómoda y ligera, para que tu mejor amigo disfrute cada partido junto a ti, viva cada gol y sienta la pasión, el orgullo y la emoción de apoyar a La Tri.	view	misha-fashion-pets-camiseta-seleccion-amarilla-m-camiseta-selecci-on-amarilla	2026-04-11 13:28:49.839	2026-04-27 11:45:07.136	7.46	ropa	{"sku": "ROP-MISHA-CAMISETASELECCIONAMARILLA-M-AMARILLO-PERRO", "size": "M", "color": "Amarillo", "gender": "Unisex", "lotCode": "LOT-20260427-MISH-CAMI-M-001", "species": "Perro", "taxRate": "15.00", "supplier": "Misha Fashion Pets", "taxExempt": "false", "variantLabel": "M", "purchaseTaxRate": "0.00", "storageLocation": "Principal", "variantBaseName": "Camiseta selección amarilla", "variantGroupKey": "paramascotas-ropa-dog-camiseta-seleccion-amarilla-perro", "supplierDocument": "1308054509001"}	paramascotasec	t
prod_imp_69da92e2df7ca	misha-fashion-pets-camiseta-seleccion-azul-l	ropa	Camiseta Selección Azul L	dog	f	f	13.4783	13.4783	ParaMascotas	0	1	Camiseta deportiva estilo selección en tono azul, cómoda y ligera, para que tu mejor amigo disfrute cada partido junto a ti con estilo y energía.	view	misha-fashion-pets-camiseta-seleccion-azul-l-camiseta-selecci-on-azul	2026-04-11 13:28:49.839	2026-04-27 11:46:44.832	8.40	ropa	{"sku": "ROP-MISHA-CAMISETASELECCIONAZUL-L-AZUL-PERRO", "size": "L", "color": "Azul", "gender": "Unisex", "lotCode": "LOT-20260411-MISH-CAMI-L-820", "species": "Perro", "taxRate": "15.00", "supplier": "Misha Fashion Pets", "taxExempt": "false", "variantLabel": "L", "purchaseTaxRate": "0.00", "storageLocation": "Principal", "variantBaseName": "Camiseta selección azul", "variantGroupKey": "paramascotas-ropa-dog-camiseta-seleccion-azul-perro", "supplierDocument": "1308054509001"}	paramascotasec	t
prod_31f9d29fcdbc8	31f9d29fcdbc8	accesorios	Collar con Cascabel Verde	dog	f	f	0.8696	0.8696	ParaMascotas	0	1	Collar ajustable con cascabel, ideal para que tu mascota luzca adorable y sea facil de localizar.	view	collar-con-cascabel-verde-31f9d29fcdbc8	2026-04-16 20:13:54.238	2026-04-27 13:02:42.196	0.00	accesorios	{"sku": "ACC-COL-CAS-VD", "tag": "collar-con-cascabel-verde", "size": "S", "color": "Verde", "lotCode": "LOT-20260418-VIBA-COLL-VERD-278", "species": "Perro", "taxRate": "15.00", "supplier": "Viba Pets", "taxExempt": "false", "variantLabel": "Verde", "purchaseTaxRate": "15.00", "storageLocation": "Principal", "variantBaseName": "Collar con cascabel verde", "variantGroupKey": "paramascotas-accesorios-dog-collar-con-cascabel-verde-perro"}	paramascotasec	t
prod_imp_69da92e2eb9ac	misha-fashion-pets-camiseta-seleccion-blanca-l	ropa	Camiseta Selección Blanca	dog	f	f	13.4783	13.4783	ParaMascotas	0	1	Camiseta deportiva estilo selección en tono blanco, cómoda y ligera, para que tu mejor amigo disfrute cada partido junto a ti con un look fresco y elegante.	view	misha-fashion-pets-camiseta-seleccion-blanca-l-camiseta-selecci-on-blanca	2026-04-11 13:28:49.839	2026-04-27 11:47:16.374	8.40	ropa	{"sku": "ROP-MISHA-CAMISETASELECCIONBLANCA-L-BLANCO-PERRO", "size": "L", "color": "Blanco", "gender": "Unisex", "lotCode": "LOT-20260427-MISH-CAMI-L-001", "species": "Perro", "taxRate": "15.00", "supplier": "Misha Fashion Pets", "taxExempt": "false", "variantLabel": "L", "purchaseTaxRate": "0.00", "storageLocation": "Principal", "variantBaseName": "Camiseta selección blanca", "variantGroupKey": "paramascotas-ropa-dog-camiseta-seleccion-blanca-perro", "supplierDocument": "1308054509001"}	paramascotasec	t
prod_7273bc805a4af	7273bc805a4af	accesorios	Collar Power Fit negro	dog	f	f	4.7826	4.7826	ParaMascotas	0	2	Collar ajustable y resistente, ideal para brindar seguridad y comodidad en el uso diario. Disponible en diferentes colores y tallas, perfecto para adaptarse al tamano de tu mascota.	view	collar-power-fit-negras-l-7273bc805a4af	2026-04-16 20:13:54.238	2026-04-24 16:15:19.303	2.17	accesorios	{"sku": "ACC-CPF-L-NG", "tag": "collar-power-fit-negras-l", "size": "L", "color": "Negro", "lotCode": "LOT-20260420-VIBA-COLL-L-669", "species": "Perro", "taxRate": "15.00", "supplier": "Viba Pets", "taxExempt": "false", "variantLabel": "L", "purchaseTaxRate": "15.00", "storageLocation": "Principal", "variantBaseName": "Collar Power Fit negras", "variantGroupKey": "paramascotas-accesorios-dog-collar-power-fit-negras-perro"}	paramascotasec	t
prod_69d44cfa28313	69d44cfa28315	ropa	Saco SV Hearts	dog	t	f	7.5652	7.5652	ParaMascotas	0	1	Saco cómodo y abrigado en color rojo con delicados detalles de corazones en la parte superior. Ideal para climas frescos y para mantener a tu mascota protegida con un look encantador.	view	saco-sv-hearts-69d44cfa2831c	2026-04-06 19:16:58.164	2026-04-24 16:15:19.303	5.00	ropa	{"sku": "ROP-PARAMA-SACO-SV-S-ROJO-PERRO", "size": "S", "color": "Rojo", "gender": "Hembra", "lotCode": "LOT-20260406-PETS-SACO-S-919", "species": "Perro", "taxRate": "15.00", "supplier": "Pets Factory", "taxExempt": "false", "variantLabel": "S", "purchaseTaxRate": "15.00", "storageLocation": "Principal", "variantBaseName": "Saco SV Heart", "variantGroupKey": "paramascotas-ropa-dog-saco-sv-heart-perro"}	paramascotasec	t
prod_46aaf62fe476b	46aaf62fe476b	accesorios	Arnés café	dog	f	f	10.1739	10.1739	ParaMascotas	0	2	Arnes comodo y resistente, disenado para brindar seguridad y control durante los paseos diarios. Manteniendo un estilo moderno.	view	arnes-cafe-46aaf62fe476b	2026-04-16 20:13:54.238	2026-04-24 16:15:19.303	5.65	accesorios	{"sku": "ACC-ARN-CF", "tag": "arnes-cafe", "color": "Cafe", "lotCode": "LOT-20260417-VIBA-ARNE-CAFE-491", "species": "Perro", "taxRate": "15.00", "supplier": "Viba Pets", "taxExempt": "false", "variantLabel": "CAFE", "purchaseTaxRate": "15.00", "storageLocation": "Principal", "variantBaseName": "Arnés café", "variantGroupKey": "single:prod_46aaf62fe476b"}	paramascotasec	t
prod_27777c05cc43a	27777c05cc43a	accesorios	Collar Power Fit negro con detalles rojos	dog	f	f	3.9130	3.9130	ParaMascotas	0	3	Collar ajustable y resistente, ideal para brindar seguridad y comodidad en el uso diario. Disponible en diferentes colores y tallas, perfecto para adaptarse al tamano de tu mascota.	view	collar-power-fit-negras-detalles-rojos-m-27777c05cc43a	2026-04-16 20:13:54.238	2026-04-24 16:15:19.303	1.74	accesorios	{"sku": "ACC-CPF-M-NR", "tag": "collar-power-fit-negras-detalles-rojos-m", "size": "M", "color": "Negro / Rojo", "lotCode": "LOT-20260420-VIBA-COLL-M-758", "species": "Perro", "taxRate": "15.00", "supplier": "Viba Pets", "taxExempt": "false", "variantLabel": "M", "purchaseTaxRate": "15.00", "storageLocation": "Principal", "variantBaseName": "Collar Power Fit negras con detalles rojos", "variantGroupKey": "paramascotas-accesorios-dog-collar-power-fit-negras-con-detalles-rojos-perro"}	paramascotasec	t
prod_imp_69da92e2e9040	misha-fashion-pets-camiseta-seleccion-blanca-m	ropa	Camiseta Selección Blanca M	dog	f	f	12.0870	12.0870	ParaMascotas	0	1	Camiseta deportiva estilo selección en tono blanco, cómoda y ligera, para que tu mejor amigo disfrute cada partido junto a ti con un look fresco y elegante.	view	misha-fashion-pets-camiseta-seleccion-blanca-m-camiseta-selecci-on-blanca	2026-04-11 13:28:49.839	2026-04-27 11:47:28.442	7.46	ropa	{"sku": "ROP-MISHA-CAMISETASELECCIONBLANCA-M-BLANCO-PERRO", "size": "M", "color": "Blanco", "gender": "Unisex", "lotCode": "LOT-20260411-MISH-CAMI-M-998", "species": "Perro", "taxRate": "15.00", "supplier": "Misha Fashion Pets", "taxExempt": "false", "variantLabel": "M", "purchaseTaxRate": "0.00", "storageLocation": "Principal", "variantBaseName": "Camiseta selección blanca", "variantGroupKey": "paramascotas-ropa-dog-camiseta-seleccion-blanca-perro", "supplierDocument": "1308054509001"}	paramascotasec	t
prod_69dd7805760fb	69dd7805760fd	accesorios	Collar con cascabel Rojo	dog	t	f	0.8696	0.8696	ParaMascotas	0	0	Collar ajustable con cascabel, ideal para que tu mascota luzca adorable y sea fácil de localizar.	view	collar-con-cascabel-rojo-69dd780576108	2026-04-13 18:11:01.483	2026-04-27 12:21:43.582	0.00	accesorios	{"sku": "ACC-PARAMA-COLLAR-CASCAB-ROJO-PERRO", "size": "M", "color": "Rojo", "lotCode": "LOT-20260413-VIBA-COLL-ROJO-164", "species": "Perro", "taxRate": "15.00", "archived": "true", "supplier": "Viba Pets", "taxExempt": "false", "archivedAt": "2026-04-27T17:21:43+00:00", "archivedName": "Collar con cascabel Rojo", "variantLabel": "Rojo", "purchaseTaxRate": "15.00", "storageLocation": "Principal", "variantBaseName": "Collar con cascabel Rojo", "variantGroupKey": "single:prod_69dd7805760fb", "archivedLegacyId": "69dd7805760fd", "supplierDocument": "195144540001", "archivedProductId": "prod_69dd7805760fb"}	paramascotasec	f
prod_imp_69dac081348b2	VIBA-2026-04-11-011	accesorios	Set collar + correa Huellitas azul	dog	f	f	2.1739	2.1739	ParaMascotas	0	2	Set cómodo y resistente con diseño de huellitas, perfecto para paseos seguros y con estilo.	view	viba-2026-04-11-011-set-collar-correa-huellitas-azul	2026-04-11 16:43:28.661	2026-04-24 16:15:19.303	1.02	accesorios	{"sku": "ACC-VIBA-SETCOLLARCORREAHUELLITASAZUL-AZUL-PERROYGATO", "color": "Azul", "lotCode": "LOT-20260413-VIBA-SET-AZUL-540", "species": "Perro", "taxRate": "15.00", "supplier": "Viba Pets", "taxExempt": "false", "variantLabel": "AZUL", "purchaseTaxRate": "15.00", "storageLocation": "Principal", "variantBaseName": "Set collar + correa Huellitas azul", "variantGroupKey": "single:prod_imp_69dac081348b2", "supplierDocument": "195144540001"}	paramascotasec	t
prod_0b05e01b8fd59	0b05e01b8fd59	accesorios	Arnés turquesa	dog	f	f	10.1739	10.1739	ParaMascotas	0	2	Arnes comodo y resistente, disenado para brindar seguridad y control durante los paseos diarios. Manteniendo un estilo moderno.	view	arnes-turquesa-0b05e01b8fd59	2026-04-16 20:13:54.238	2026-04-24 16:15:19.303	5.65	accesorios	{"sku": "ACC-ARN-TQ", "tag": "arnes-turquesa", "color": "Turquesa", "lotCode": "LOT-20260417-VIBA-ARNE-TURQ-777", "species": "Perro", "taxRate": "15.00", "supplier": "Viba Pets", "taxExempt": "false", "variantLabel": "TURQUESA", "purchaseTaxRate": "15.00", "storageLocation": "Principal", "variantBaseName": "Arnés turquesa", "variantGroupKey": "single:prod_0b05e01b8fd59"}	paramascotasec	t
prod_69da9cd8105b8	69da9cd8105ba	ropa	Camiseta Polo Azu S	dog	t	f	6.3400	6.3400	ParaMascotas	0	1	Polo en tono azul con estilo moderno, ideal para paseos y aventuras diarias.	view	camiseta-polo-azu-s-69da9cd8105c3	2026-04-11 14:11:20.067	2026-04-24 16:15:19.303	3.44	ropa	{"sku": "ROP-PARAMA-CAMISE-POLO-S-AZUL-PERRO", "size": "S", "color": "Azul", "gender": "Unisex", "lotCode": "LOT-20260324-MISH-CAMI-S-725", "species": "Perro", "taxRate": "15.00", "archived": "true", "supplier": "Misha Fashion Pets", "taxExempt": "false", "archivedAt": "2026-04-11T19:12:12+00:00", "archivedName": "Camiseta Polo Azu S", "variantLabel": "S", "purchaseTaxRate": "0.00", "storageLocation": "Principal", "variantBaseName": "Camiseta Polo Azu", "variantGroupKey": "paramascotas-ropa-dog-camiseta-polo-azu-perro", "archivedLegacyId": "69da9cd8105ba", "supplierDocument": "1308054509001", "archivedProductId": "prod_69da9cd8105b8"}	paramascotasec	f
prod_imp_69dac0813c22e	VIBA-2026-04-11-017	accesorios	Pelota pequeña amarilla	dog	f	f	1.7304	1.7304	ParaMascotas	0	1	Pelota resistente y divertida, ideal para juegos diarios y momentos de entretenimiento.	view	viba-2026-04-11-017-pelota-peque-na-amarilla	2026-04-11 16:43:28.661	2026-04-24 16:15:19.303	0.87	accesorios	{"sku": "ACC-VIBA-PELOTAPEQUENAAMARILLA-AMARILLA-PERROYGATO", "color": "Amarilla", "lotCode": "LOT-20260413-VIBA-PELO-AMAR-493", "species": "Perro", "taxRate": "15.00", "supplier": "Viba Pets", "taxExempt": "false", "variantLabel": "AMARILLA", "purchaseTaxRate": "15.00", "storageLocation": "Principal", "variantBaseName": "Pelota pequeña amarilla", "variantGroupKey": "single:prod_imp_69dac0813c22e", "supplierDocument": "195144540001"}	paramascotasec	t
prod_b9e23527b3c69	b9e23527b3c69	accesorios	Collar Power Fit rojo con detalles negros	dog	f	f	3.0435	3.0435	ParaMascotas	0	2	Collar ajustable y resistente, ideal para brindar seguridad y comodidad en el uso diario. Disponible en diferentes colores y tallas, perfecto para adaptarse al tamano de tu mascota.	view	collar-power-fit-rojas-detalles-negros-s-b9e23527b3c69	2026-04-16 20:13:54.238	2026-04-24 16:15:19.303	1.30	accesorios	{"sku": "ACC-CPF-S-RN", "tag": "collar-power-fit-rojas-detalles-negros-s", "size": "S", "color": "Rojo / Negro", "lotCode": "LOT-20260420-VIBA-COLL-S-155", "species": "Perro", "taxRate": "15.00", "supplier": "Viba Pets", "taxExempt": "false", "variantLabel": "S", "purchaseTaxRate": "15.00", "storageLocation": "Principal", "variantBaseName": "Collar Power Fit rojas con detalles negros", "variantGroupKey": "paramascotas-accesorios-dog-collar-power-fit-rojas-con-detalles-negros-perro"}	paramascotasec	t
prod_imp_69dac080b8edb	VIBA-2026-04-11-002	accesorios	Rollo de fundas para desechos	dog	f	f	0.4348	0.4348	ParaMascotas	0	5	Rollo de fundas resistentes y prácticas, ideal para mantener cada paseo limpio mientras eliges una opción más amigable con el medio ambiente.	view	viba-2026-04-11-002-rollo-de-fundas-para-desechos-azul	2026-04-11 16:43:28.661	2026-04-24 16:15:19.303	0.24	accesorios	{"sku": "ACC-VIBA-ROLLODEFUNDASPARADESECHOSAZUL-AZUL-PERROYGATO", "color": "Azul", "lotCode": "LOT-20260412-VIBA-ROLL-AZUL-306", "species": "Perro", "taxRate": "15.00", "supplier": "Viba Pets", "taxExempt": "false", "variantLabel": "AZUL", "purchaseTaxRate": "15.00", "storageLocation": "Principal", "variantBaseName": "Rollo de fundas para desechos", "variantGroupKey": "single:prod_imp_69dac080b8edb", "supplierDocument": "195144540001"}	paramascotasec	t
prod_a91b53e3e4b4c	a91b53e3e4b4c	accesorios	Collar Power Fit negro	dog	f	f	3.0435	3.0435	ParaMascotas	0	2	Collar ajustable y resistente, ideal para brindar seguridad y comodidad en el uso diario. Disponible en diferentes colores y tallas, perfecto para adaptarse al tamano de tu mascota.	view	collar-power-fit-negras-s-a91b53e3e4b4c	2026-04-16 20:13:54.238	2026-04-24 16:15:19.303	1.30	accesorios	{"sku": "ACC-CPF-S-NG", "tag": "collar-power-fit-negras-s", "size": "S", "color": "Negro", "lotCode": "LOT-20260420-VIBA-COLL-S-365", "species": "Perro", "taxRate": "15.00", "supplier": "Viba Pets", "taxExempt": "false", "variantLabel": "S", "purchaseTaxRate": "15.00", "storageLocation": "Principal", "variantBaseName": "Collar Power Fit negras", "variantGroupKey": "paramascotas-accesorios-dog-collar-power-fit-negras-perro"}	paramascotasec	t
prod_imp_69dac08140f18	VIBA-2026-04-11-021	accesorios	Correa extensible de 3 metros	dog	f	f	4.7826	4.7826	ParaMascotas	0	2	Correa retráctil de 3 metros que brinda mayor libertad de movimiento y control durante el paseo.	view	viba-2026-04-11-021-correa-extensible-3-m-roja	2026-04-11 16:43:28.661	2026-04-24 16:15:19.303	2.61	accesorios	{"sku": "ACC-VIBA-CORREAEXTENSIBLE3MROJA-ROJA-PERROYGATO", "color": "Roja", "lotCode": "LOT-20260412-VIBA-CORR-ROJA-245", "species": "Perro", "taxRate": "15.00", "supplier": "Viba Pets", "taxExempt": "false", "variantLabel": "ROJA", "purchaseTaxRate": "15.00", "storageLocation": "Principal", "variantBaseName": "Correa extensible de 3 metros", "variantGroupKey": "single:prod_imp_69dac08140f18", "supplierDocument": "195144540001"}	paramascotasec	t
prod_55881532f481c	55881532f481c	accesorios	Juguete interactivo Cat Tower rosa	cat	f	f	8.6087	8.6087	ParaMascotas	0	1	Juguete disenado para estimular la curiosidad y mantener a tu gato activo y entretenido.	view	juguete-interactivo-cat-tower-rosa-55881532f481c	2026-04-16 20:13:54.238	2026-04-24 16:15:19.303	4.35	accesorios	{"sku": "ACC-CTW-RS", "tag": "juguete-interactivo-cat-tower-rosa", "color": "Rosa", "lotCode": "LOT-20260420-VIBA-JUGU-ROSA-001", "species": "Gato", "taxRate": "15.00", "supplier": "Viba Pets", "taxExempt": "false", "variantLabel": "ROSA", "purchaseTaxRate": "15.00", "storageLocation": "Principal", "variantBaseName": "Juguete interactivo Cat Tower", "variantGroupKey": "paramascotas-accesorios-cat-juguete-interactivo-cat-tower-gato"}	paramascotasec	t
prod_imp_69dac0813fb90	VIBA-2026-04-11-020	accesorios	Correa extensible de 3 metros	dog	f	f	4.7826	4.7826	ParaMascotas	0	2	Correa retráctil de 3 metros que brinda mayor libertad de movimiento y control durante el paseo.	view	viba-2026-04-11-020-correa-extensible-3-m-verde	2026-04-11 16:43:28.661	2026-04-24 16:15:19.303	2.61	accesorios	{"sku": "ACC-VIBA-CORREAEXTENSIBLE3MVERDE-VERDE-PERROYGATO", "color": "Verde", "lotCode": "LOT-20260412-VIBA-CORR-VERD-569", "species": "Perro", "taxRate": "15.00", "supplier": "Viba Pets", "taxExempt": "false", "variantLabel": "VERDE", "purchaseTaxRate": "15.00", "storageLocation": "Principal", "variantBaseName": "Correa extensible de 3 metros", "variantGroupKey": "single:prod_imp_69dac0813fb90", "supplierDocument": "195144540001"}	paramascotasec	t
prod_imp_69dac0810e042	VIBA-2026-04-11-006	accesorios	Dispensador de fundas morado	dog	f	f	0.8696	0.8696	ParaMascotas	0	1	Dispensador práctico y ligero para llevar las fundas siempre a mano en cada paseo.	view	viba-2026-04-11-006-dispensador-de-fundas-morado	2026-04-11 16:43:28.661	2026-04-24 16:15:19.303	0.29	accesorios	{"sku": "ACC-VIBA-DISPENSADORDEFUNDASMORADO-MORADO-PERROYGATO", "color": "Morado", "lotCode": "LOT-20260413-VIBA-DISP-MORA-962", "species": "Perro", "taxRate": "15.00", "supplier": "Viba Pets", "taxExempt": "false", "variantLabel": "Morado", "purchaseTaxRate": "15.00", "storageLocation": "Principal", "variantBaseName": "Dispensador de fundas morado", "variantGroupKey": "single:prod_imp_69dac0810e042", "supplierDocument": "195144540001"}	paramascotasec	t
prod_4aaadb2e91ea6	4aaadb2e91ea6	Alimento	Compa Adulto 30 kg	dog	f	f	37.9000	37.9000	COMPA	0	1	Alimento balanceado para perros adultos, con excelente rendimiento y nutricion diaria para mantenerlos sanos y activos.	view	compa-adulto-30kg-4aaadb2e91ea6	2026-04-16 19:47:22.663	2026-04-24 18:58:11.802	27.47	Alimento	{"sku": "COM-A-30KG", "tag": "compa-adulto-30kg", "size": "30 kg", "lotCode": "LOT-20260418-DAG-COMP-30KG-899", "species": "Perro", "taxRate": "0.00", "supplier": "DAG", "taxExempt": "true", "variantLabel": "30 kg", "expirationDate": "2027-04-14", "purchaseTaxRate": "0.00", "storageLocation": "Principal", "variantBaseName": "Compa Adulto 30 kg", "variantGroupKey": "compa-alimento-dog-compa-adulto-30-kg-perro", "expirationAlertDays": "30", "purchaseInvoiceDate": "2024-04-10", "purchaseInvoiceNumber": "003-100-000071559"}	paramascotasec	t
prod_imp_69dac08135c21	VIBA-2026-04-11-012	accesorios	Set collar + correa Huellitas rosa	dog	f	f	2.1739	2.1739	ParaMascotas	0	2	Set cómodo y resistente con diseño de huellitas, perfecto para paseos seguros y con estilo.	view	viba-2026-04-11-012-set-collar-correa-huellitas-rosa	2026-04-11 16:43:28.661	2026-04-24 16:15:19.303	1.02	accesorios	{"sku": "ACC-VIBA-SETCOLLARCORREAHUELLITASROSA-ROSA-PERROYGATO", "color": "Rosa", "lotCode": "LOT-20260413-VIBA-SET-ROSA-550", "species": "Perro", "taxRate": "15.00", "supplier": "Viba Pets", "taxExempt": "false", "variantLabel": "ROSA", "purchaseTaxRate": "15.00", "storageLocation": "Principal", "variantBaseName": "Set collar + correa Huellitas rosa", "variantGroupKey": "single:prod_imp_69dac08135c21", "supplierDocument": "195144540001"}	paramascotasec	t
prod_imp_69dac080a9777	VIBA-2026-04-11-001	accesorios	Rollo de fundas para desechos	dog	f	f	0.4348	0.4348	ParaMascotas	0	5	Rollo de fundas resistentes y prácticas, ideal para mantener cada paseo limpio mientras eliges una opción más amigable con el medio ambiente.	view	viba-2026-04-11-001-rollo-de-fundas-para-desechos-rojo	2026-04-11 16:43:28.661	2026-04-24 16:15:19.303	0.24	accesorios	{"sku": "ACC-VIBA-ROLLODEFUNDASPARADESECHOSROJO-ROJO-PERROYGATO", "color": "Rojo", "lotCode": "LOT-20260412-VIBA-ROLL-ROJO-153", "species": "Perro", "taxRate": "15.00", "supplier": "Viba Pets", "taxExempt": "false", "variantLabel": "ROJO", "purchaseTaxRate": "15.00", "storageLocation": "Principal", "variantBaseName": "Rollo de fundas para desechos", "variantGroupKey": "single:prod_imp_69dac080a9777", "supplierDocument": "195144540001"}	paramascotasec	t
prod_imp_69dac081306cf	VIBA-2026-04-11-008	accesorios	Dispensador de fundas verde	dog	f	f	0.8696	0.8696	ParaMascotas	0	1	Dispensador práctico y ligero para llevar las fundas siempre a mano en cada paseo.	view	viba-2026-04-11-008-dispensador-de-fundas-verde	2026-04-11 16:43:28.661	2026-04-24 16:15:19.303	0.29	accesorios	{"sku": "ACC-VIBA-DISPENSADORDEFUNDASVERDE-VERDE-PERROYGATO", "color": "Verde", "lotCode": "LOT-20260413-VIBA-DISP-VERD-729", "species": "Perro", "taxRate": "15.00", "supplier": "Viba Pets", "taxExempt": "false", "variantLabel": "Verde", "purchaseTaxRate": "15.00", "storageLocation": "Principal", "variantBaseName": "Dispensador de fundas verde", "variantGroupKey": "single:prod_imp_69dac081306cf", "supplierDocument": "195144540001"}	paramascotasec	t
prod_69da8a48d3468	69da8a48d346b	ropa	Hoodie Huellas	dog	t	f	9.1304	9.1304	ParaMascotas	0	1	Hoodie suave con estampado de huellitas, ideal para mantener a tu mascota abrigada mientras luce moderna y adorable.	view	hoodie-huellas-69da8a48d3476	2026-04-11 12:52:08.865	2026-04-24 16:15:19.303	6.00	ropa	{"sku": "ROP-PARAMA-HOODIE-HUELLA-M-PERRO", "size": "M", "color": "Negro", "gender": "Unisex", "lotCode": "LOT-20260319-PETS-HOOD-M-905", "species": "Perro", "taxRate": "15.00", "supplier": "Pets Factory", "taxExempt": "false", "variantLabel": "M", "purchaseTaxRate": "15.00", "storageLocation": "Principal", "variantBaseName": "Hoodie Huellas", "variantGroupKey": "paramascotas-ropa-dog-hoodie-huellas-perro"}	paramascotasec	t
prod_imp_69da92e1d8d06	misha-fashion-pets-camiseta-polo-love-rosa-m	ropa	Camiseta Polo Love Rosa	dog	f	f	7.9130	7.9130	ParaMascotas	0	1	Camiseta polo en tono rosa con diseño adorable, perfecta para que tu mascota luzca tierna y cómoda en cada paseo.	view	misha-fashion-pets-camiseta-polo-love-rosa-m-camiseta-polo-love-rosa	2026-04-11 13:28:49.839	2026-04-27 09:54:22.53	4.90	ropa	{"sku": "ROP-MISHA-CAMISETAPOLOLOVEROSA-M-ROSA-PERRO", "size": "M", "color": "Rosa", "gender": "Hembra", "lotCode": "LOT-20260411-MISH-CAMI-M-102", "species": "Perro", "taxRate": "15.00", "supplier": "Misha Fashion Pets", "taxExempt": "false", "variantLabel": "M", "purchaseTaxRate": "0.00", "storageLocation": "Principal", "variantBaseName": "Camiseta Polo Love Rosa", "variantGroupKey": "paramascotas-ropa-dog-camiseta-polo-love-rosa-perro", "supplierDocument": "1308054509001"}	paramascotasec	t
prod_69da8ba81e481	69da8ba81e483	ropa	Chaleco Peluche	dog	t	f	10.4261	10.4261	ParaMascotas	0	1	Chaleco de textura peluche, extra suave y cálido. Ideal para climas fríos y para brindar máxima comodidad.	view	chaleco-peluche-69da8ba81e489	2026-04-11 12:58:00.124	2026-04-27 11:42:00.556	7.00	ropa	{"sku": "ROP-PARAMA-CHALEC-PELUCH-M-NEGRO-PERRO", "size": "M", "color": "Gris", "gender": "Unisex", "lotCode": "LOT-20260319-PETS-CHAL-M-437", "species": "Perro", "taxRate": "15.00", "supplier": "Pets Factory", "taxExempt": "false", "variantLabel": "M", "purchaseTaxRate": "15.00", "storageLocation": "Principal", "variantBaseName": "Chaleco Peluche", "variantGroupKey": "paramascotas-ropa-dog-chaleco-peluche-perro"}	paramascotasec	t
prod_84bf7763f797d	84bf7763f797d	accesorios	Collar Power Fit rojo	dog	f	f	3.9130	3.9130	ParaMascotas	0	3	Collar ajustable y resistente, ideal para brindar seguridad y comodidad en el uso diario. Disponible en diferentes colores y tallas, perfecto para adaptarse al tamano de tu mascota.	view	collar-power-fit-rojas-m-84bf7763f797d	2026-04-16 20:13:54.238	2026-04-24 16:15:19.303	1.74	accesorios	{"sku": "ACC-CPF-M-RJ", "tag": "collar-power-fit-rojas-m", "size": "M", "color": "Rojo", "lotCode": "LOT-20260420-VIBA-COLL-M-783", "species": "Perro", "taxRate": "15.00", "supplier": "Viba Pets", "taxExempt": "false", "variantLabel": "M", "purchaseTaxRate": "15.00", "storageLocation": "Principal", "variantBaseName": "Collar Power Fit rojas", "variantGroupKey": "paramascotas-accesorios-dog-collar-power-fit-rojas-perro"}	paramascotasec	t
prod_7757b463a4bb0	7757b463a4bb0	accesorios	Collar Power Fit Azul	dog	f	f	4.7826	4.7826	ParaMascotas	0	2	Collar ajustable y resistente, ideal para brindar seguridad y comodidad en el uso diario. Disponible en diferentes colores y tallas, perfecto para adaptarse al tamano de tu mascota.	view	collar-power-fit-azules-l-7757b463a4bb0	2026-04-16 20:13:54.238	2026-04-27 12:54:32.974	2.17	accesorios	{"sku": "ACC-CPF-L-AZ", "tag": "collar-power-fit-azules-l", "size": "L", "color": "Azul", "lotCode": "LOT-20260420-VIBA-COLL-L-742", "species": "Perro", "taxRate": "15.00", "supplier": "Viba Pets", "taxExempt": "false", "variantLabel": "Azul", "purchaseTaxRate": "15.00", "storageLocation": "Principal", "variantBaseName": "Collar Power Fit azules", "variantGroupKey": "paramascotas-accesorios-dog-collar-power-fit-azules-perro"}	paramascotasec	t
prod_69d45126b222d	69d45126b222e	ropa	Chaleco Rayita Rosa	dog	t	f	8.2609	8.2609	ParaMascotas	0	1	Chaleco ligero con diseño de rayas en tonos rosa y blanco, cuello tipo polo y detalle de bolsillo con lazo decorativo. Ideal para darle a tu mascota un look tierno y cómodo para el día a día.	view	chaleco-rayita-rosa-69d45126b2234	2026-04-06 19:34:46.73	2026-04-27 11:43:29.52	5.50	ropa	{"sku": "ROP-PARAMA-CHALEC-RAYITA-S-ROJO-PERRO", "size": "S", "color": "Rosa", "gender": "Hembra", "lotCode": "LOT-20260319-PETS-CHAL-S-474", "species": "Perro", "taxRate": "15.00", "supplier": "Pets Factory", "taxExempt": "false", "variantLabel": "S", "purchaseTaxRate": "15.00", "storageLocation": "Principal", "variantBaseName": "Chaleco Rayita rosa", "variantGroupKey": "paramascotas-ropa-dog-chaleco-rayita-rosa-perro"}	paramascotasec	t
prod_2b961b24bbf10	2b961b24bbf10	Alimento	Carnitas Comida Húmeda Perros Pavo y Ternera en Salsa 100 g	dog	f	f	1.0000	1.0000	Mimma	0	3	Una exquisita mezcla de pavo y ternera que tu perro disfrutara en cada bocado.	view	carnitas-pouch-perro-pavo-ternera-100g-2b961b24bbf10	2026-04-16 19:42:33.907	2026-04-27 12:12:33.985	0.72	Alimento	{"sku": "CAR-PVT-100G", "tag": "carnitas-pouch-perro-pavo-ternera-100g", "size": "100 gr", "color": "Gris", "lotCode": "LOT-20260419-SOLD-CARN-100G-001", "species": "Perro", "taxRate": "0.00", "supplier": "Soldis", "taxExempt": "true", "variantLabel": "100 gr", "expirationDate": "2028-01-20", "purchaseTaxRate": "0.00", "storageLocation": "Principal", "variantBaseName": "Carnitas pouch perro pavo ternera 100 g", "variantGroupKey": "mimma-alimento-dog-carnitas-pouch-perro-pavo-ternera-100-g-perro", "expirationAlertDays": "30", "purchaseInvoiceDate": "2024-04-07", "purchaseInvoiceNotes": "Factura con 2 notas de credito", "purchaseInvoiceNumber": "001-501-000122471"}	paramascotasec	t
prod_imp_69da92e2cefe7	misha-fashion-pets-camiseta-seleccion-azul-s	ropa	Camiseta Selección Azul S	dog	f	f	11.2174	11.2174	ParaMascotas	0	1	Camiseta deportiva estilo selección en tono azul, cómoda y ligera, para que tu mejor amigo disfrute cada partido junto a ti con estilo y energía.	view	misha-fashion-pets-camiseta-seleccion-azul-s-camiseta-selecci-on-azul	2026-04-11 13:28:49.839	2026-04-27 11:47:05.15	6.53	ropa	{"sku": "ROP-MISHA-CAMISETASELECCIONAZUL-S-AZUL-PERRO", "size": "S", "color": "Azul", "gender": "Unisex", "lotCode": "LOT-20260411-MISH-CAMI-S-916", "species": "Perro", "taxRate": "15.00", "supplier": "Misha Fashion Pets", "taxExempt": "false", "variantLabel": "S", "purchaseTaxRate": "0.00", "storageLocation": "Principal", "variantBaseName": "Camiseta selección azul", "variantGroupKey": "paramascotas-ropa-dog-camiseta-seleccion-azul-perro", "supplierDocument": "1308054509001"}	paramascotasec	t
prod_67dac0d95debd	67dac0d95debd	accesorios	Arnés gris	dog	f	f	10.1739	10.1739	ParaMascotas	0	1	Arnes comodo y resistente, disenado para brindar seguridad y control durante los paseos diarios. Manteniendo un estilo moderno.	view	arnes-gris-67dac0d95debd	2026-04-16 20:13:54.238	2026-04-25 14:29:23.753	5.65	accesorios	{"sku": "ACC-ARN-GR", "tag": "arnes-gris", "color": "Gris", "lotCode": "LOT-20260417-VIBA-ARNE-GRIS-700", "species": "Perro", "taxRate": "15.00", "supplier": "Viba Pets", "taxExempt": "false", "variantLabel": "Gris", "purchaseTaxRate": "15.00", "storageLocation": "Principal", "variantBaseName": "Arnés gris", "variantGroupKey": "paramascotas-accesorios-dog-arnes-gris-perro"}	paramascotasec	f
prod_imp_69da92e1f2edb	misha-fashion-pets-camiseta-polo-corazon-morada-m	ropa	Camiseta Polo Corazón Morada	dog	f	f	7.9130	7.9130	ParaMascotas	0	1	Camiseta cómoda en tono morado con detalle de corazones, perfecta para un look adorable.	view	misha-fashion-pets-camiseta-polo-corazon-morada-m-camiseta-polo-coraz-on-morada	2026-04-11 13:28:49.839	2026-04-27 09:50:25.489	4.90	ropa	{"sku": "ROP-MISHA-CAMISETAPOLOCORAZONMORADA-M-MORADO-PERRO", "size": "M", "color": "Morado", "gender": "Hembra", "lotCode": "LOT-20260427-MISH-CAMI-M-001", "species": "Perro", "taxRate": "15.00", "supplier": "Misha Fashion Pets", "taxExempt": "false", "variantLabel": "M", "purchaseTaxRate": "0.00", "storageLocation": "Principal", "variantBaseName": "Camiseta Polo Corazón Morada", "variantGroupKey": "paramascotas-ropa-dog-camiseta-polo-corazon-morada-perro", "supplierDocument": "1308054509001"}	paramascotasec	t
prod_imp_69dac08131b2e	VIBA-2026-04-11-009	accesorios	Dispensador de fundas blanco	dog	f	f	0.8696	0.8696	ParaMascotas	0	1	Dispensador práctico y ligero para llevar las fundas siempre a mano en cada paseo.	view	viba-2026-04-11-009-dispensador-de-fundas-blanco	2026-04-11 16:43:28.661	2026-04-24 16:15:19.303	0.29	accesorios	{"sku": "ACC-VIBA-DISPENSADORDEFUNDASBLANCO-BLANCO-PERROYGATO", "color": "Blanco", "lotCode": "LOT-20260413-VIBA-DISP-BLAN-838", "species": "Perro", "taxRate": "15.00", "supplier": "Viba Pets", "taxExempt": "false", "variantLabel": "Blanco", "purchaseTaxRate": "15.00", "storageLocation": "Principal", "variantBaseName": "Dispensador de fundas blanco", "variantGroupKey": "single:prod_imp_69dac08131b2e", "supplierDocument": "195144540001"}	paramascotasec	t
prod_imp_69dac0814226c	VIBA-2026-04-11-022	accesorios	Correa extensible de 3 metros	dog	f	f	4.7826	4.7826	ParaMascotas	0	2	Correa retráctil de 3 metros que brinda mayor libertad de movimiento y control durante el paseo.	view	viba-2026-04-11-022-correa-extensible-3-m-azul	2026-04-11 16:43:28.661	2026-04-24 16:15:19.303	2.61	accesorios	{"sku": "ACC-VIBA-CORREAEXTENSIBLE3MAZUL-AZUL-PERROYGATO", "color": "Azul", "lotCode": "LOT-20260412-VIBA-CORR-AZUL-865", "species": "Perro", "taxRate": "15.00", "supplier": "Viba Pets", "taxExempt": "false", "variantLabel": "AZUL", "purchaseTaxRate": "15.00", "storageLocation": "Principal", "variantBaseName": "Correa extensible de 3 metros", "variantGroupKey": "single:prod_imp_69dac0814226c", "supplierDocument": "195144540001"}	paramascotasec	t
prod_445a741c261fa	445a741c261fa	accesorios	Collar Power Fit rojo	dog	f	f	4.7826	4.7826	ParaMascotas	0	2	Collar ajustable y resistente, ideal para brindar seguridad y comodidad en el uso diario. Disponible en diferentes colores y tallas, perfecto para adaptarse al tamano de tu mascota.	view	collar-power-fit-rojas-l-445a741c261fa	2026-04-16 20:13:54.238	2026-04-24 16:15:19.303	2.17	accesorios	{"sku": "ACC-CPF-L-RJ", "tag": "collar-power-fit-rojas-l", "size": "L", "color": "Rojo", "lotCode": "LOT-20260420-VIBA-COLL-L-948", "species": "Perro", "taxRate": "15.00", "supplier": "Viba Pets", "taxExempt": "false", "variantLabel": "L", "purchaseTaxRate": "15.00", "storageLocation": "Principal", "variantBaseName": "Collar Power Fit rojas", "variantGroupKey": "paramascotas-accesorios-dog-collar-power-fit-rojas-perro"}	paramascotasec	t
prod_imp_69da92e1d1fc9	misha-fashion-pets-camiseta-polo-love-rosa-s	ropa	Camiseta Polo Love Rosa	dog	f	f	6.3478	6.3478	ParaMascotas	0	1	Camiseta polo en tono rosa con diseño adorable, perfecta para que tu mascota luzca tierna y cómoda en cada paseo.	view	misha-fashion-pets-camiseta-polo-love-rosa-s-camiseta-polo-love-rosa	2026-04-11 13:28:49.839	2026-04-27 09:54:04.442	3.96	ropa	{"sku": "ROP-MISHA-CAMISETAPOLOLOVEROSA-S-ROSA-PERRO", "size": "S", "color": "Rosa", "gender": "Hembra", "lotCode": "LOT-20260427-MISH-CAMI-S-001", "species": "Perro", "taxRate": "15.00", "supplier": "Misha Fashion Pets", "taxExempt": "false", "variantLabel": "S", "purchaseTaxRate": "0.00", "storageLocation": "Principal", "variantBaseName": "Camiseta Polo Love Rosa", "variantGroupKey": "paramascotas-ropa-dog-camiseta-polo-love-rosa-perro", "supplierDocument": "1308054509001"}	paramascotasec	t
prod_69d80398d7ee8	69d80398d7eea	ropa	Basic Camiseta	dog	t	f	7.5652	7.5652	ParaMascotas	0	0	Camiseta básica en tono rosa con estampado delicado, ideal para el uso diario. Su tela ligera brinda comodidad y libertad de movimiento.	view	basic-camiseta-69d80398d7ef1	2026-04-09 14:52:56.884	2026-04-25 15:30:55.176	5.00	ropa	{"sku": "ROP-PARAMA-BASIC-CAMISE-ROSA-PERRO", "size": "S", "color": "Rosa", "gender": "Hembra", "lotCode": "LOT-20260319-PETS-BASI-270", "species": "Perro", "taxRate": "15.00", "supplier": "Pets Factory", "taxExempt": "false", "variantLabel": "S", "purchaseTaxRate": "15.00", "storageLocation": "Principal", "variantBaseName": "Basic Camiseta", "variantGroupKey": "paramascotas-ropa-dog-basic-camiseta-perro"}	paramascotasec	f
prod_imp_69dac08147290	VIBA-2026-04-11-026	accesorios	Juguete interactivo Cat Tower	cat	f	f	8.6087	8.6087	ParaMascotas	0	3	Juguete diseñado para estimular la curiosidad y mantener a tu gato activo y entretenido.	view	viba-2026-04-11-026-juguete-interactivo-cat-tower-azul	2026-04-11 16:43:28.661	2026-04-24 16:15:19.303	4.35	accesorios	{"sku": "ACC-VIBA-JUGUETEINTERACTIVOCATTOWERAZUL-AZUL-GATO", "color": "Azul", "lotCode": "LOT-20260412-VIBA-JUGU-AZUL-450", "species": "Gato", "taxRate": "15.00", "supplier": "Viba Pets", "taxExempt": "false", "variantLabel": "Azul", "purchaseTaxRate": "15.00", "storageLocation": "Principal", "variantBaseName": "Juguete interactivo Cat Tower", "variantGroupKey": "single:prod_imp_69dac08147290", "supplierDocument": "195144540001"}	paramascotasec	t
prod_c6f2b77c18a90	c6f2b77c18a90	Alimento	Carnitas Comida Húmeda Perros Cerdo y Salmón en Salsa 100 g	dog	f	f	1.0000	1.0000	Mimma	0	5	Combinacion irresistible de cerdo y salmon, llena de sabor y textura suave.	view	carnitas-pouch-perro-cerdo-salmon-100g-c6f2b77c18a90	2026-04-16 19:42:33.907	2026-04-27 12:11:49.811	0.72	Alimento	{"sku": "CAR-CES-100G", "tag": "carnitas-pouch-perro-cerdo-salmon-100g", "size": "100 gr", "color": "Gris", "lotCode": "LOT-20260419-SOLD-CARN-100G-779", "species": "Perro", "taxRate": "0.00", "supplier": "Soldis", "taxExempt": "true", "variantLabel": "100 gr", "expirationDate": "2028-01-15", "purchaseTaxRate": "0.00", "storageLocation": "Principal", "variantBaseName": "Carnitas pouch perro cerdo salmon 100 g", "variantGroupKey": "mimma-alimento-dog-carnitas-pouch-perro-cerdo-salmon-100-g-perro", "expirationAlertDays": "30", "purchaseInvoiceDate": "2024-04-07", "purchaseInvoiceNotes": "Factura con 2 notas de credito", "purchaseInvoiceNumber": "001-501-000122471"}	paramascotasec	t
prod_bd5c3d5e886ba	bd5c3d5e886ba	Alimento	Cani Premium Adulto Razas Medianas y Grandes 2 kg	dog	f	f	7.8000	7.8000	Cani	0	5	Alimento completo para perros adultos, pensado para su energia y bienestar diario.	view	cani-adulto-rmg-2kg-bd5c3d5e886ba	2026-04-16 19:42:33.907	2026-04-27 12:13:05.991	5.86	Alimento	{"sku": "CAN-A-RMG-2KG", "tag": "cani-adulto-rmg-2kg", "size": "2 kg", "lotCode": "LOT-20260419-SOLD-CANI-2KG-001", "species": "Perro", "taxRate": "0.00", "supplier": "Soldis", "taxExempt": "true", "variantLabel": "2 kg", "expirationDate": "2027-01-05", "purchaseTaxRate": "0.00", "storageLocation": "Principal", "variantBaseName": "Cani adulto RMG 2 kg", "variantGroupKey": "cani-alimento-dog-cani-adulto-rmg-2-kg-perro", "expirationAlertDays": "30", "purchaseInvoiceDate": "2024-04-07", "purchaseInvoiceNotes": "Factura con 2 notas de credito", "purchaseInvoiceNumber": "001-501-000122471"}	paramascotasec	t
prod_imp_69dac0813e7fe	VIBA-2026-04-11-019	accesorios	Cepillo Vaporizador Aqua Groom	dog	f	f	5.2087	5.2087	ParaMascotas	0	4	Cepillo con función vaporizadora que ayuda a desenredar y cuidar el pelaje, dejándolo suave y limpio.	view	viba-2026-04-11-019-cepillo-vaporizador-aqua-groom	2026-04-11 16:43:28.661	2026-04-27 12:19:19.044	3.04	accesorios	{"sku": "ACC-VIBA-CEPILLOVAPORIZADORAQUAGROOM-ITEM-PERROYGATO", "color": "Amarillo", "lotCode": "LOT-20260413-VIBA-CEPI-M-909", "species": "Perro", "taxRate": "15.00", "supplier": "Viba Pets", "taxExempt": "false", "variantLabel": "Amarillo", "purchaseTaxRate": "15.00", "storageLocation": "Principal", "variantBaseName": "Cepillo vaporizador Aqua Groom", "variantGroupKey": "paramascotas-accesorios-dog-cepillo-vaporizador-aqua-groom-perro", "supplierDocument": "195144540001"}	paramascotasec	t
prod_da179b1a131b9	da179b1a131b9	Alimento	Dog Chow adulto RMG 2 kg	dog	f	f	9.8000	9.8000	Dog-Chow	0	2	Nutricion completa para perros adultos de raza mediana y grande, ideal para mantener su energia, fuerza y bienestar todos los dias.	view	dog-chow-adulto-rmg-2kg-da179b1a131b9	2026-04-16 19:42:33.907	2026-04-24 18:58:11.802	7.62	Alimento	{"sku": "DCH-A-RMG-2KG", "tag": "dog-chow-adulto-rmg-2kg", "size": "2 kg", "lotCode": "LOT-20260420-SOLD-DOG-2KG-001", "species": "Perro", "taxRate": "0.00", "supplier": "Soldis", "taxExempt": "true", "variantLabel": "2 kg", "expirationDate": "2027-04-22", "purchaseTaxRate": "0.00", "storageLocation": "Principal", "variantBaseName": "Dog Chow adulto RMG 2 kg", "variantGroupKey": "dog-chow-alimento-dog-dog-chow-adulto-rmg-2-kg-perro", "expirationAlertDays": "30", "purchaseInvoiceDate": "2024-04-07", "purchaseInvoiceNotes": "Factura con 2 notas de credito", "purchaseInvoiceNumber": "001-501-000122471"}	paramascotasec	t
prod_imp_69dac08133152	VIBA-2026-04-11-010	accesorios	Dispensador de fundas verde fluorescente	dog	f	f	0.8696	0.8696	ParaMascotas	0	1	Dispensador práctico y ligero para llevar las fundas siempre a mano en cada paseo.	view	viba-2026-04-11-010-dispensador-de-fundas-verde-fluorescente	2026-04-11 16:43:28.661	2026-04-24 16:15:19.303	0.29	accesorios	{"sku": "ACC-VIBA-DISPENSADORDEFUNDASVERDEFLUORESCENTE-VERDEFLUORESCENTE-PERROYGATO", "color": "Verde fluorescente", "lotCode": "LOT-20260413-VIBA-DISP-VERD-795", "species": "Perro", "taxRate": "15.00", "supplier": "Viba Pets", "taxExempt": "false", "variantLabel": "Verde fluorescente", "purchaseTaxRate": "15.00", "storageLocation": "Principal", "variantBaseName": "Dispensador de fundas verde fluorescente", "variantGroupKey": "single:prod_imp_69dac08133152", "supplierDocument": "195144540001"}	paramascotasec	t
prod_69daa8e29aa44	69daa8e29aa47	ropa	Camiseta Polo Azul L	dog	t	f	9.3300	9.3300	ParaMascotas	0	0	Polo en tono azul con estilo moderno, ideal para paseos y aventuras diarias.	view	camiseta-polo-azul-l-69daa8e29aa54	2026-04-11 15:02:42.614	2026-04-24 17:26:42.61	5.83	ropa	{"sku": "ROP-GENERI-CAMISE-POLO-L-AZUL-PERRO", "size": "L", "color": "Azul", "gender": "Unisex", "lotCode": "LOT-20260324-MISH-CAMI-L-685", "species": "Perro", "taxRate": "15.00", "archived": "true", "supplier": "Misha Fashion Pets", "taxExempt": "false", "archivedAt": "2026-04-24T22:26:42+00:00", "archivedName": "Camiseta Polo Azul L", "variantLabel": "L", "purchaseTaxRate": "0.00", "storageLocation": "Principal", "variantBaseName": "Camiseta Polo Azul", "variantGroupKey": "generico-ropa-dog-camiseta-polo-azul-perro", "archivedLegacyId": "69daa8e29aa47", "archivedProductId": "prod_69daa8e29aa44"}	paramascotasec	f
prod_69d4472545cf7	69d4472545cf8	ropa	Chaleco Rayita Azul	dog	t	f	7.5652	7.5652	ParaMascotas	0	1	Chaleco suave con diseño rayado en azul y blanco, acabado ligero y bolsillo decorativo con lazo. Perfecto para mascotas que lucen adorables y con estilo.	view	chaleco-rayita-azul-69d4472545d01	2026-04-06 18:52:05.286	2026-04-27 11:43:19.086	5.00	ropa	{"sku": "ROP-GENERI-CHALEC-RAYITA-XS-AZUL-PERRO", "size": "XS", "color": "Azul", "gender": "Hembra", "lotCode": "LOT-20260406-PETS-CHAL-XS-191", "species": "Perro", "taxRate": "15.00", "supplier": "Pets Factory", "taxExempt": "false", "variantLabel": "XS", "purchaseTaxRate": "15.00", "storageLocation": "Principal", "variantBaseName": "Chaleco Rayita azul", "variantGroupKey": "paramascotas-ropa-dog-chaleco-rayita-azul-perro"}	paramascotasec	t
prod_e6fcec1e5536e	e6fcec1e5536e	Alimento	Cani Premium Cachorros Razas Medianas y Grandes 2 kg	dog	f	f	8.7000	8.7000	Cani	0	7	Nutricion balanceada para cachorros, ideal para apoyar su crecimiento saludable.	view	cani-cachorro-rmg-2kg-e6fcec1e5536e	2026-04-16 19:42:33.907	2026-04-27 12:12:50.592	6.62	Alimento	{"sku": "CAN-C-RMG-2KG", "tag": "cani-cachorro-rmg-2kg", "size": "2 kg", "lotCode": "LOT-20260419-SOLD-CANI-2KG-001", "species": "Perro", "taxRate": "0.00", "supplier": "Soldis", "taxExempt": "true", "variantLabel": "2 kg", "expirationDate": "2027-03-13", "purchaseTaxRate": "0.00", "storageLocation": "Principal", "variantBaseName": "Cani cachorro RMG 2 kg", "variantGroupKey": "cani-alimento-dog-cani-cachorro-rmg-2-kg-perro", "expirationAlertDays": "30", "purchaseInvoiceDate": "2024-04-07", "purchaseInvoiceNotes": "Factura con 2 notas de credito", "purchaseInvoiceNumber": "001-501-000122471"}	paramascotasec	t
prod_69da8c730828f	69da8c7308291	ropa	Camiseta I Love Mommy	dog	t	f	10.4261	10.4261	ParaMascotas	0	1	Prenda ligera en azul oscuro con estampado “I Love My Mommy”, ideal para mascotas pequeñas con un look adorable y tierno.	view	camiseta-i-love-mommy-69da8c7308297	2026-04-11 13:01:23.033	2026-04-25 15:32:33.71	7.00	ropa	{"sku": "ROP-PARAMA-CAMISE-I-L-AZUL-PERRO", "size": "L", "color": "Azul", "gender": "Unisex", "lotCode": "LOT-20260319-PETS-CAMI-L-668", "species": "Perro", "taxRate": "15.00", "supplier": "Pets Factory", "taxExempt": "false", "variantLabel": "L", "purchaseTaxRate": "15.00", "storageLocation": "Principal", "variantBaseName": "Camiseta I Love Mommy", "variantGroupKey": "paramascotas-ropa-dog-camiseta-i-love-mommy-perro"}	paramascotasec	t
prod_2f5097856993e	2f5097856993e	Alimento	Carnitas Comida Húmeda para Perros Carne en Salsa 100 g	dog	f	f	1.0000	1.0000	Mimma	0	2	Una receta jugosa y deliciosa sabor carne para consentir a tu peludo.	view	carnitas-pouch-perro-carne-100g-2f5097856993e	2026-04-16 19:42:33.907	2026-04-27 12:11:29.204	0.72	Alimento	{"sku": "CAR-CAR-100G", "tag": "carnitas-pouch-perro-carne-100g", "size": "100 gr", "color": "Gris", "lotCode": "LOT-20260419-SOLD-CARN-100G-615", "species": "Perro", "taxRate": "0.00", "supplier": "Soldis", "taxExempt": "true", "variantLabel": "100 gr", "expirationDate": "2028-01-13", "purchaseTaxRate": "0.00", "storageLocation": "Principal", "variantBaseName": "Carnitas pouch perro carne 100 g", "variantGroupKey": "mimma-alimento-dog-carnitas-pouch-perro-carne-100-g-perro", "expirationAlertDays": "30", "purchaseInvoiceDate": "2024-04-07", "purchaseInvoiceNotes": "Factura con 2 notas de credito", "purchaseInvoiceNumber": "001-501-000122471"}	paramascotasec	t
prod_634e401b41491	634e401b41491	accesorios	Collar Power Fit negro con detalles rojos	dog	f	f	3.0435	3.0435	ParaMascotas	0	2	Collar ajustable y resistente, ideal para brindar seguridad y comodidad en el uso diario. Disponible en diferentes colores y tallas, perfecto para adaptarse al tamano de tu mascota.	view	collar-power-fit-negras-detalles-rojos-s-634e401b41491	2026-04-16 20:13:54.238	2026-04-24 16:15:19.303	1.30	accesorios	{"sku": "ACC-CPF-S-NR", "tag": "collar-power-fit-negras-detalles-rojos-s", "size": "S", "color": "Negro / Rojo", "lotCode": "LOT-20260420-VIBA-COLL-S-733", "species": "Perro", "taxRate": "15.00", "supplier": "Viba Pets", "taxExempt": "false", "variantLabel": "S", "purchaseTaxRate": "15.00", "storageLocation": "Principal", "variantBaseName": "Collar Power Fit negras con detalles rojos", "variantGroupKey": "paramascotas-accesorios-dog-collar-power-fit-negras-con-detalles-rojos-perro"}	paramascotasec	t
prod_5e719dfa02e40	5e719dfa02e40	Alimento	Avant Premium Adulto Razas Medianas y Grandes 18 kg	dog	f	f	70.9000	70.9000	Avant	0	2	Formula premium para perros adultos de raza mediana y grande, disenada para cuidar su salud, energia y bienestar diario.	view	avant-adulto-raza-mediana-grande-18kg-5e719dfa02e40	2026-04-16 19:47:22.663	2026-04-27 10:35:29.54	49.40	Alimento	{"sku": "AVA-A-RMG-18KG", "tag": "avant-adulto-raza-mediana-grande-18kg", "size": "18 kg", "lotCode": "LOT-20260420-DAG-AVAN-18KG-001", "species": "Perro", "taxRate": "0.00", "supplier": "DAG", "taxExempt": "true", "variantLabel": "18 kg", "expirationDate": "2027-08-31", "purchaseTaxRate": "0.00", "storageLocation": "Principal", "variantBaseName": "Avant Adulto Raza Mediana/Grande", "variantGroupKey": "avant-alimento-dog-avant-adulto-raza-mediana-grande-perro", "expirationAlertDays": "30", "purchaseInvoiceDate": "2024-04-10", "purchaseInvoiceNumber": "003-100-000071559"}	paramascotasec	t
prod_4887d1f2988c6	4887d1f2988c6	accesorios	Collar con Cascabel Verde Fluorescente	dog	f	f	0.8696	0.8696	ParaMascotas	0	1	Collar ajustable con cascabel, ideal para que tu mascota luzca adorable y sea facil de localizar.	view	collar-con-cascabel-verde-fluorescente-4887d1f2988c6	2026-04-16 20:13:54.238	2026-04-27 13:03:15.47	0.00	accesorios	{"sku": "ACC-COL-CAS-VF", "tag": "collar-con-cascabel-verde-fluorescente", "size": "S", "color": "Verde Fluorescente", "lotCode": "LOT-20260418-VIBA-COLL-VERD-412", "species": "Perro", "taxRate": "15.00", "supplier": "Viba Pets", "taxExempt": "false", "variantLabel": "Verde Fluorescente", "purchaseTaxRate": "15.00", "storageLocation": "Principal", "variantBaseName": "Collar con cascabel verde fluorescente", "variantGroupKey": "paramascotas-accesorios-dog-collar-con-cascabel-verde-fluorescente-perro"}	paramascotasec	t
\.


--
-- Data for Name: ProductReferenceCatalog; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ProductReferenceCatalog" (id, tenant_id, catalog_key, label, payload, sort_order, created_at, updated_at) FROM stdin;
prc_52efda3b90faf1bf20c5a8443704	paramascotasec	brands	ParaMascotas	{"label": "ParaMascotas"}	0	2026-04-27 10:54:46.380373	2026-04-27 10:54:46.380373
prc_e6a594fede628fc99170eb8365b4	paramascotasec	brands	Avant	{"label": "Avant"}	1	2026-04-27 10:54:46.380373	2026-04-27 10:54:46.380373
prc_65424fceb517877f504837f09470	paramascotasec	brands	Misha Fashion Pets	{"label": "Misha Fashion Pets"}	2	2026-04-27 10:54:46.380373	2026-04-27 10:54:46.380373
prc_9375ebc179e94df3e05ed1ca3ced	paramascotasec	brands	Pro-Can	{"label": "Pro-Can"}	3	2026-04-27 10:54:46.380373	2026-04-27 10:54:46.380373
prc_d55c54de4b82f9cb41ff0a52bcc8	paramascotasec	brands	Pro-Cat	{"label": "Pro-Cat"}	4	2026-04-27 10:54:46.380373	2026-04-27 10:54:46.380373
prc_080e3e5d521238f77278bc1103a9	paramascotasec	brands	Chiki	{"label": "Chiki"}	5	2026-04-27 10:54:46.380373	2026-04-27 10:54:46.380373
prc_a51ad084d4fbbdbd4742335e8994	paramascotasec	brands	Compa	{"label": "Compa"}	6	2026-04-27 10:54:46.380373	2026-04-27 10:54:46.380373
prc_6839bac7f4cf842a8ad867d3719b	paramascotasec	brands	Cani	{"label": "Cani"}	7	2026-04-27 10:54:46.380373	2026-04-27 10:54:46.380373
prc_9c10a21dd68865db110bb1e552ac	paramascotasec	brands	Cat Chow	{"label": "Cat Chow"}	8	2026-04-27 10:54:46.380373	2026-04-27 10:54:46.380373
prc_d00414a6f6e6156c541ec30bd5b4	paramascotasec	brands	Wellness	{"label": "Wellness"}	9	2026-04-27 10:54:46.380373	2026-04-27 10:54:46.380373
prc_a07881e07f655908a2ce14e9359d	paramascotasec	brands	DermaHealt	{"label": "DermaHealt"}	10	2026-04-27 10:54:46.380373	2026-04-27 10:54:46.380373
prc_594774d71872444b44674ce1f239	paramascotasec	brands	Dog Chow	{"label": "Dog Chow"}	11	2026-04-27 10:54:46.380373	2026-04-27 10:54:46.380373
prc_35a0cb6e34b7367fcd437a3da3f9	paramascotasec	brands	Purina	{"label": "Purina"}	12	2026-04-27 10:54:46.380373	2026-04-27 10:54:46.380373
prc_10f52d6cde93daa3fb0719b05879	paramascotasec	brands	Guerpo	{"label": "Guerpo"}	13	2026-04-27 10:54:46.380373	2026-04-27 10:54:46.380373
prc_5a12977b62e07e6405dab6e5a2d3	paramascotasec	brands	NutraPro	{"label": "NutraPro"}	14	2026-04-27 10:54:46.380373	2026-04-27 10:54:46.380373
prc_f53eb56ac0f1b9a73d52366190cc	paramascotasec	brands	Mimma	{"label": "Mimma"}	15	2026-04-27 10:54:46.380373	2026-04-27 10:54:46.380373
supplier-0990006687001	paramascotasec	suppliers	Agripac	{"id": "supplier-0990006687001", "name": "Agripac", "email": "", "notes": "Agripac S.A. Categoria: Comida / Accesorios. Forma de pago: Transferencia", "phone": "+593 999510173", "address": "Av. de la Prensa 70-205 y Pablo Picasso, Quito", "document": "0990006687001", "contactName": "Monica", "purchaseTaxRate": ""}	0	2026-04-27 10:54:46.380373	2026-04-27 10:54:46.380373
supplier-1792303044001	paramascotasec	suppliers	DAG	{"id": "supplier-1792303044001", "name": "DAG", "email": "", "notes": "Distribuidora Avícola Ganadera DAG Cia. Ltda. Categoria: Comida. Forma de pago: Transferencia", "phone": "1792303044001", "address": "Maldonado S9-455 y Gil Martín - La Magdalena, Quito", "document": "1792303044001", "contactName": "Willman Lascano", "purchaseTaxRate": ""}	1	2026-04-27 10:54:46.380373	2026-04-27 10:54:46.380373
supplier-1308054509001	paramascotasec	suppliers	Misha Fashion Pets	{"id": "supplier-1308054509001", "name": "Misha Fashion Pets", "email": "", "notes": "Reyes Lucas Zoila Esperanza. Categoria: Ropa. Forma de pago: Transferencia.", "phone": "+593 978737915", "address": "Gerardo Chiriboga N52-29 y De los Algarrobo - Kennedy, Quito", "document": "1308054509001", "contactName": "José Luis Reyna", "purchaseTaxRate": "0"}	2	2026-04-27 10:54:46.380373	2026-04-27 10:54:46.380373
supplier-0999999999	paramascotasec	suppliers	Pets Factory	{"id": "supplier-0999999999", "name": "Pets Factory", "email": "", "notes": "The Pet Factory Internacional Petfactory Cia. Ltda. Categoría: Ropa- Forma de pago: Transferencia", "phone": "+593 968646949", "address": "Nielsen N57-14 y Leonardo Murialdo, Quito", "document": "1792025214001", "contactName": "Pamela", "purchaseTaxRate": ""}	3	2026-04-27 10:54:46.380373	2026-04-27 10:54:46.380373
supplier-1792017386001	paramascotasec	suppliers	Soldis	{"id": "supplier-1792017386001", "name": "Soldis", "email": "", "notes": "Soluciones en Distribución y Trade Marketing Soldistrade Cia. Ltda. Categoria: Comida. Forma de pago: Transferencia", "phone": "+593 999891346", "address": "Alejandro Machuca Oe3-73 Av. 5 de Junio, Quito", "document": "1792017386001", "contactName": "Janela", "purchaseTaxRate": ""}	4	2026-04-27 10:54:46.380373	2026-04-27 10:54:46.380373
supplier-195144540001	paramascotasec	suppliers	Viba Pets	{"id": "supplier-195144540001", "name": "Viba Pets", "email": "", "notes": "Importadora y Comercializadora Viba S.A.S. Categoria: Accesorios. Forma de pago: Transferencia", "phone": "+593 983521085", "address": "Ciudadela Caballo Campana y frente a Hostería Caballo Campana, Cuenca", "document": "195144540001", "contactName": "José Arias", "purchaseTaxRate": "15"}	5	2026-04-27 10:54:46.380373	2026-04-27 10:54:46.380373
prc_eae2971561f457df7cc05dfe127f	paramascotasec	sizes	XL	{"label": "XL"}	0	2026-04-27 10:54:46.380373	2026-04-27 10:54:46.380373
prc_f0bbec73a0243fb22bda16cb0a49	paramascotasec	sizes	S	{"label": "S"}	1	2026-04-27 10:54:46.380373	2026-04-27 10:54:46.380373
prc_f1dc84b2ecde2a0e001690173db0	paramascotasec	sizes	L	{"label": "L"}	2	2026-04-27 10:54:46.380373	2026-04-27 10:54:46.380373
prc_f4dbdc16f4952ea629c4ed45745d	paramascotasec	sizes	M	{"label": "M"}	3	2026-04-27 10:54:46.380373	2026-04-27 10:54:46.380373
prc_94d4ca75205a8a1a3837fd9c9cb9	paramascotasec	sizes	XS	{"label": "XS"}	4	2026-04-27 10:54:46.380373	2026-04-27 10:54:46.380373
prc_83f285bc1a55ec85193f443846f3	paramascotasec	sizes	14 gr	{"label": "14 gr"}	5	2026-04-27 10:54:46.380373	2026-04-27 10:54:46.380373
prc_9d19fd71bc94a6b3abf8da665ab0	paramascotasec	sizes	700 gr	{"label": "700 gr"}	6	2026-04-27 10:54:46.380373	2026-04-27 10:54:46.380373
prc_95f2c2743e6a963c4aea71e26a3d	paramascotasec	sizes	18 cm	{"label": "18 cm"}	7	2026-04-27 10:54:46.380373	2026-04-27 10:54:46.380373
prc_ad0e8ca5c7623ebd3bc4a006d577	paramascotasec	sizes	22 cm	{"label": "22 cm"}	8	2026-04-27 10:54:46.380373	2026-04-27 10:54:46.380373
prc_71796bbd2690bd96d9f00b5f7865	paramascotasec	materials	Nylon	{"label": "Nylon"}	0	2026-04-27 10:54:46.380373	2026-04-27 10:54:46.380373
prc_db377f53c7b7f4f58f61cafd3498	paramascotasec	colors	Azul	{"label": "Azul"}	0	2026-04-27 10:54:46.380373	2026-04-27 10:54:46.380373
prc_b93afa42cec70fd39186b1927ae1	paramascotasec	colors	Rojo	{"label": "Rojo"}	1	2026-04-27 10:54:46.380373	2026-04-27 10:54:46.380373
prc_9c6b768b7efc9aab80c4945b9060	paramascotasec	colors	Rosa	{"label": "Rosa"}	2	2026-04-27 10:54:46.380373	2026-04-27 10:54:46.380373
prc_c08f55cbaeda9a1784d53f7fbab6	paramascotasec	colors	Negro	{"label": "Negro"}	3	2026-04-27 10:54:46.380373	2026-04-27 10:54:46.380373
prc_14027338eae6b4deace972c00f0c	paramascotasec	colors	Gris	{"label": "Gris"}	4	2026-04-27 10:54:46.380373	2026-04-27 10:54:46.380373
prc_35bab75173bd35b29d88d85187f8	paramascotasec	colors	Verde Militar	{"label": "Verde Militar"}	5	2026-04-27 10:54:46.380373	2026-04-27 10:54:46.380373
prc_0106447bc1687a644f36fe51dfd7	paramascotasec	colors	Morado	{"label": "Morado"}	6	2026-04-27 10:54:46.380373	2026-04-27 10:54:46.380373
prc_fc2eb83c620d5206533a15f3b3c9	paramascotasec	colors	Amarillo	{"label": "Amarillo"}	7	2026-04-27 10:54:46.380373	2026-04-27 10:54:46.380373
prc_8aa05a8fe5a2e1d8aaece66a4bbb	paramascotasec	colors	Blanco	{"label": "Blanco"}	8	2026-04-27 10:54:46.380373	2026-04-27 10:54:46.380373
prc_30fb58dd1859be2aeba2b122e579	paramascotasec	colors	Verde	{"label": "Verde"}	9	2026-04-27 10:54:46.380373	2026-04-27 10:54:46.380373
prc_28e10aa0a7c5d09384dd735087d9	paramascotasec	colors	Naranja	{"label": "Naranja"}	10	2026-04-27 10:54:46.380373	2026-04-27 10:54:46.380373
prc_6ed15f8429aaf17862824ca91e2f	paramascotasec	colors	Verde fluorescente	{"label": "Verde fluorescente"}	11	2026-04-27 10:54:46.380373	2026-04-27 10:54:46.380373
prc_99052568f5f012a726a78efd4b85	paramascotasec	colors	Turquesa	{"label": "Turquesa"}	12	2026-04-27 10:54:46.380373	2026-04-27 10:54:46.380373
prc_8057d6fab82929d8ba2eb3db38e9	paramascotasec	colors	Amarilla	{"label": "Amarilla"}	13	2026-04-27 10:54:46.380373	2026-04-27 10:54:46.380373
prc_32821fc027ff3ae63a74fb3ec648	paramascotasec	colors	Roja	{"label": "Roja"}	14	2026-04-27 10:54:46.380373	2026-04-27 10:54:46.380373
prc_52d13439d3c4fa1fa5c4a79d999e	paramascotasec	usages	Paseo	{"label": "Paseo"}	0	2026-04-27 10:54:46.380373	2026-04-27 10:54:46.380373
prc_1468a31f475ba56e9c213709ce5b	paramascotasec	storageLocations	Principal	{"label": "Principal"}	0	2026-04-27 10:54:46.380373	2026-04-27 10:54:46.380373
prc_83cc00a71971cdf1dd0030b56dd1	paramascotasec	flavors	Pollo	{"label": "Pollo"}	0	2026-04-27 10:54:46.380373	2026-04-27 10:54:46.380373
prc_fe33fb6e99117d7a77093a424ad0	paramascotasec	ageRanges	Adulto	{"label": "Adulto"}	0	2026-04-27 10:54:46.380373	2026-04-27 10:54:46.380373
\.


--
-- Data for Name: PurchaseInvoice; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."PurchaseInvoice" (id, tenant_id, supplier_name, supplier_document, invoice_number, external_key, issued_at, subtotal, tax_total, total, notes, metadata, created_at, updated_at) FROM stdin;
pinv_69d4472549e15	paramascotasec	Pets Factory	0999999999	09999999999	09999999999|0999999999	2026-04-06	5.0000	0.7500	5.7500	\N	{"supplierId": "supplier-0999999999", "supplierEmail": "no@no.com", "supplierPhone": "0999999999999", "supplierAddress": null, "supplierContactName": "pedro"}	2026-04-06 18:52:05.285821	2026-04-06 18:52:05.285821
pinv_69d44cfa41dbe	paramascotasec	Pets Factory	0999999999	999999999999	999999999999|0999999999	2026-04-06	5.0000	0.7500	5.7500	\N	{"supplierId": "supplier-0999999999", "supplierEmail": "no@no.com", "supplierPhone": "0999999999999", "supplierAddress": null, "supplierContactName": "pedro"}	2026-04-06 19:16:58.164104	2026-04-06 19:16:58.164104
pinv_69d45126b3386	paramascotasec	Pets Factory	0999999999	001-003-000001343	001003000001343|0999999999	2026-03-19	55.0000	8.2500	63.2500	\N	{"supplierId": "supplier-0999999999", "supplierEmail": "no@no.com", "supplierPhone": "0999999999999", "supplierAddress": null, "supplierContactName": "pedro"}	2026-04-06 19:34:46.729574	2026-04-11 13:04:10.848593
pinv_69da92e21c882	paramascotasec	Misha Fashion Pets	1308054509001	481	481|1308054509001	2026-04-07	25.0000	0.0000	25.0000	Carga puntual sin imagenes desde dataset Misha Fashion Pets 2026-03-24 / 2026-04-07.	{"source_file": "misha_fashion_pets_2026_03_24_2026_04_07.json", "import_batch": "misha_fashion_pets_2026_03_24_2026_04_07", "supplier_notes": "Reyes Lucas Zoila Esperanza. Categoria: Ropa. Forma de pago: Transferencia."}	2026-04-11 13:28:49.839253	2026-04-11 13:28:49.839253
pinv_69dac080af7b7	paramascotasec	Viba Pets	195144540001	SIN-FACTURA-VIBA-2026-04-11	SINFACTURAVIBA20260411|195144540001	2026-04-11	180.8200	27.1230	207.9430	Carga puntual sin imagenes desde dataset Viba Pets 2026-04-11. Hoja fuente sin numero de factura ni fecha; se registro una factura interna.	{"source_file": "viba_pets_accessories_2026_04_11.json", "import_batch": "viba_pets_accessories_2026_04_11", "supplier_notes": "Importadora y Comercializadora Viba S.A.S. Categoria: Accesorios. Forma de pago: Transferencia", "source_invoice_missing": true, "source_issued_at_missing": true}	2026-04-11 16:43:28.661337	2026-04-11 16:43:28.661337
pinv_69dd780579265	paramascotasec	Viba Pets	195144540001	000000000000	000000000000|195144540001	2026-04-13	0.0000	0.0000	0.0000	\N	{"supplierId": "supplier-195144540001", "supplierEmail": null, "supplierPhone": "+593 983521085", "supplierAddress": "Ciudadela Caballo Campana y frente a Hostería Caballo Campana, Cuenca", "purchase_tax_rate": "15.00", "purchase_tax_exempt": false, "supplierContactName": "José Arias"}	2026-04-13 18:11:01.483372	2026-04-13 18:11:01.483372
pinv_69ef9e31bbf1c	paramascotasec	Viba Pets	195144540001	001-004-000000913	001004000000913|195144540001	2026-04-16	0.0000	0.0000	0.0000	\N	{"supplierId": "supplier-195144540001", "supplierEmail": null, "supplierPhone": "+593 983521085", "supplierAddress": "Ciudadela Caballo Campana y frente a Hostería Caballo Campana, Cuenca", "purchase_tax_rate": "15.00", "purchase_tax_exempt": false, "supplierContactName": "José Arias"}	2026-04-27 12:34:41.735488	2026-04-27 13:10:40.808265
pinv_69da92e1d3f26	paramascotasec	Misha Fashion Pets	1308054509001	470	470|1308054509001	2026-03-24	162.0000	0.5160	162.5160	\N	{"supplierId": "supplier-1308054509001", "supplierEmail": null, "supplierPhone": "+593 978737915", "supplierAddress": "Gerardo Chiriboga N52-29 y De los Algarrobo - Kennedy, Quito", "purchase_tax_rate": "0.00", "purchase_tax_exempt": true, "supplierContactName": "José Luis Reyna"}	2026-04-11 13:28:49.839253	2026-04-24 19:06:18.758945
\.


--
-- Data for Name: PurchaseInvoiceItem; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."PurchaseInvoiceItem" (id, purchase_invoice_id, tenant_id, product_id, product_name_snapshot, quantity, unit_cost, line_total, metadata, created_at, updated_at) FROM stdin;
pitem_69d447254efbf	pinv_69d4472549e15	paramascotasec	prod_69d4472545cf7	Chaleco Rayita azul	1	5.0000	5.0000	{"reason": "initial_stock", "tax_rate": 15, "tax_amount": 0.75, "tax_exempt": false}	2026-04-06 18:52:05.285821	2026-04-06 18:52:05.285821
pitem_69d44cfa512c5	pinv_69d44cfa41dbe	paramascotasec	prod_69d44cfa28313	Saco SV Hearts	1	5.0000	5.0000	{"reason": "initial_stock", "tax_rate": 15, "tax_amount": 0.75, "tax_exempt": false}	2026-04-06 19:16:58.164104	2026-04-06 19:16:58.164104
pitem_69d45126b37ec	pinv_69d45126b3386	paramascotasec	prod_69d45126b222d	Chaleco Rayita rosa	1	5.5000	5.5000	{"reason": "initial_stock", "tax_rate": 15, "tax_amount": 0.825, "tax_exempt": false}	2026-04-06 19:34:46.729574	2026-04-06 19:34:46.729574
pitem_69d7103e49706	pinv_69d45126b3386	paramascotasec	prod_69d7103e397c3	Chaleco Lazo	1	5.5000	5.5000	{"reason": "initial_stock", "tax_rate": 15, "tax_amount": 0.825, "tax_exempt": false}	2026-04-08 21:34:38.235251	2026-04-08 22:27:21.163225
pitem_69d80398da86b	pinv_69d45126b3386	paramascotasec	prod_69d80398d7ee8	Basic Camiseta	1	5.0000	5.0000	{"reason": "initial_stock", "tax_rate": 15, "tax_amount": 0.75, "tax_exempt": false}	2026-04-09 14:52:56.884348	2026-04-09 14:52:56.884348
pitem_69d8043e4e536	pinv_69d45126b3386	paramascotasec	prod_69d8043e47fd0	Saco Woof	1	7.0000	7.0000	{"reason": "initial_stock", "tax_rate": 15, "tax_amount": 1.05, "tax_exempt": false}	2026-04-09 14:55:42.294667	2026-04-09 14:55:42.294667
pitem_69d83dbc468a2	pinv_69d45126b3386	paramascotasec	prod_69d83dbbf2679	Camiseta Monster	1	4.5000	4.5000	{"reason": "initial_stock", "tax_rate": 15, "tax_amount": 0.675, "tax_exempt": false}	2026-04-09 19:00:59.983717	2026-04-09 19:00:59.983717
pitem_69da8a48dc5d0	pinv_69d45126b3386	paramascotasec	prod_69da8a48d3468	Hoodie Huellas	1	6.0000	6.0000	{"reason": "initial_stock", "tax_rate": 15, "tax_amount": 0.9, "tax_exempt": false}	2026-04-11 12:52:08.864948	2026-04-11 12:52:08.864948
pitem_69da8ba81fddc	pinv_69d45126b3386	paramascotasec	prod_69da8ba81e481	Chaleco Peluche	1	7.0000	7.0000	{"reason": "initial_stock", "tax_rate": 15, "tax_amount": 1.05, "tax_exempt": false}	2026-04-11 12:58:00.12396	2026-04-11 12:58:00.12396
pitem_69da8c730a404	pinv_69d45126b3386	paramascotasec	prod_69da8c730828f	Camiseta I Love Mommy	1	7.0000	7.0000	{"reason": "initial_stock", "tax_rate": 15, "tax_amount": 1.05, "tax_exempt": false}	2026-04-11 13:01:23.033347	2026-04-11 13:01:23.033347
pitem_69da8d1ad0dae	pinv_69d45126b3386	paramascotasec	prod_69da8d1acf310	Vestido	1	7.5000	7.5000	{"reason": "initial_stock", "tax_rate": 15, "tax_amount": 1.125, "tax_exempt": false}	2026-04-11 13:04:10.848593	2026-04-11 13:04:10.848593
pitem_69da92e1d584c	pinv_69da92e1d3f26	paramascotasec	prod_imp_69da92e1d1fc9	Camiseta Polo Love Rosa	1	3.9600	3.9600	{"size": "S", "color": "Rosa", "tax_rate": 0, "tax_amount": 0, "tax_exempt": true, "style_gender": "Hembra", "sale_tax_rate": 15, "import_line_key": "Misha Fashion Pets|470|misha-fashion-pets-camiseta-polo-love-rosa-s|1|3.96", "purchase_tax_rate": 0}	2026-04-11 13:28:49.839253	2026-04-11 13:28:49.839253
pitem_69da92e1d9e4d	pinv_69da92e1d3f26	paramascotasec	prod_imp_69da92e1d8d06	Camiseta Polo Love Rosa	1	4.9000	4.9000	{"size": "M", "color": "Rosa", "tax_rate": 0, "tax_amount": 0, "tax_exempt": true, "style_gender": "Hembra", "sale_tax_rate": 15, "import_line_key": "Misha Fashion Pets|470|misha-fashion-pets-camiseta-polo-love-rosa-m|1|4.90", "purchase_tax_rate": 0}	2026-04-11 13:28:49.839253	2026-04-11 13:28:49.839253
pitem_69da92e1de907	pinv_69da92e1d3f26	paramascotasec	prod_imp_69da92e1dbb96	Camiseta Polo Love Rosa	1	5.8300	5.8300	{"size": "L", "color": "Rosa", "tax_rate": 0, "tax_amount": 0, "tax_exempt": true, "style_gender": "Hembra", "sale_tax_rate": 15, "import_line_key": "Misha Fashion Pets|470|misha-fashion-pets-camiseta-polo-love-rosa-l|1|5.83", "purchase_tax_rate": 0}	2026-04-11 13:28:49.839253	2026-04-11 13:28:49.839253
pitem_69da92e1e2090	pinv_69da92e1d3f26	paramascotasec	prod_imp_69da92e1e11a0	Camiseta Polo Kisses Rosa	1	3.9600	3.9600	{"size": "S", "color": "Rosa", "tax_rate": 0, "tax_amount": 0, "tax_exempt": true, "style_gender": "Hembra", "sale_tax_rate": 15, "import_line_key": "Misha Fashion Pets|470|misha-fashion-pets-camiseta-polo-kisses-rosa-s|1|3.96", "purchase_tax_rate": 0}	2026-04-11 13:28:49.839253	2026-04-11 13:28:49.839253
pitem_69da92e1e3cb4	pinv_69da92e1d3f26	paramascotasec	prod_imp_69da92e1e3204	Camiseta Polo Azul	1	3.9600	3.9600	{"size": "S", "color": "Azul", "tax_rate": 0, "tax_amount": 0, "tax_exempt": true, "style_gender": "Unisex", "sale_tax_rate": 15, "import_line_key": "Misha Fashion Pets|470|misha-fashion-pets-camiseta-polo-azul-s|1|3.96", "purchase_tax_rate": 0}	2026-04-11 13:28:49.839253	2026-04-11 13:28:49.839253
pitem_69da92e1e5068	pinv_69da92e1d3f26	paramascotasec	prod_imp_69da92e1e48ba	Camiseta Polo Azul	1	5.8300	5.8300	{"size": "L", "color": "Azul", "tax_rate": 0, "tax_amount": 0, "tax_exempt": true, "style_gender": "Unisex", "sale_tax_rate": 15, "import_line_key": "Misha Fashion Pets|470|misha-fashion-pets-camiseta-polo-azul-l|1|5.83", "purchase_tax_rate": 0}	2026-04-11 13:28:49.839253	2026-04-11 13:28:49.839253
pitem_69da92e1efa93	pinv_69da92e1d3f26	paramascotasec	prod_imp_69da92e1ee6dd	Camiseta Polo Verde Militar	1	3.9600	3.9600	{"size": "S", "color": "Verde Militar", "tax_rate": 0, "tax_amount": 0, "tax_exempt": true, "style_gender": "Unisex", "sale_tax_rate": 15, "import_line_key": "Misha Fashion Pets|470|misha-fashion-pets-camiseta-polo-verde-militar-s|1|3.96", "purchase_tax_rate": 0}	2026-04-11 13:28:49.839253	2026-04-11 13:28:49.839253
pitem_69da92e200704	pinv_69da92e1d3f26	paramascotasec	prod_imp_69da92e1f2edb	Camiseta Polo Corazón Morada	1	4.9000	4.9000	{"size": "M", "color": "Morado", "tax_rate": 0, "tax_amount": 0, "tax_exempt": true, "style_gender": "Hembra", "sale_tax_rate": 15, "import_line_key": "Misha Fashion Pets|470|misha-fashion-pets-camiseta-polo-corazon-morada-m|1|4.90", "purchase_tax_rate": 0}	2026-04-11 13:28:49.839253	2026-04-11 13:28:49.839253
pitem_69da92e205b1e	pinv_69da92e1d3f26	paramascotasec	prod_imp_69da92e203e9b	Camiseta selección amarilla	2	6.0600	12.1200	{"size": "XS", "color": "Amarillo", "tax_rate": 0, "tax_amount": 0, "tax_exempt": true, "style_gender": "Unisex", "sale_tax_rate": 15, "import_line_key": "Misha Fashion Pets|470|misha-fashion-pets-camiseta-seleccion-amarilla-xs|2|6.06", "purchase_tax_rate": 0}	2026-04-11 13:28:49.839253	2026-04-11 13:28:49.839253
pitem_69da92e216c63	pinv_69da92e1d3f26	paramascotasec	prod_imp_69da92e20fc1b	Camiseta selección amarilla	2	6.5300	13.0600	{"size": "S", "color": "Amarillo", "tax_rate": 0, "tax_amount": 0, "tax_exempt": true, "style_gender": "Unisex", "sale_tax_rate": 15, "import_line_key": "Misha Fashion Pets|470|misha-fashion-pets-camiseta-seleccion-amarilla-s|2|6.53", "purchase_tax_rate": 0}	2026-04-11 13:28:49.839253	2026-04-11 13:28:49.839253
pitem_69da92e21a9b5	pinv_69da92e1d3f26	paramascotasec	prod_imp_69da92e21796d	Camiseta selección amarilla	2	7.4600	14.9200	{"size": "M", "color": "Amarillo", "tax_rate": 0, "tax_amount": 0, "tax_exempt": true, "style_gender": "Unisex", "sale_tax_rate": 15, "import_line_key": "Misha Fashion Pets|470|misha-fashion-pets-camiseta-seleccion-amarilla-m|2|7.46", "purchase_tax_rate": 0}	2026-04-11 13:28:49.839253	2026-04-11 13:28:49.839253
pitem_69da92e21ca7b	pinv_69da92e21c882	paramascotasec	prod_imp_69da92e21796d	Camiseta selección amarilla	2	8.0000	16.0000	{"size": "M", "color": "Amarillo", "tax_rate": 0, "tax_amount": 0, "tax_exempt": true, "style_gender": "Unisex", "sale_tax_rate": 15, "import_line_key": "Misha Fashion Pets|481|misha-fashion-pets-camiseta-seleccion-amarilla-m|2|8.00", "purchase_tax_rate": 0}	2026-04-11 13:28:49.839253	2026-04-11 13:28:49.839253
pitem_69da92e23c203	pinv_69da92e1d3f26	paramascotasec	prod_imp_69da92e21f250	Camiseta selección amarilla	2	8.4000	16.8000	{"size": "L", "color": "Amarillo", "tax_rate": 0, "tax_amount": 0, "tax_exempt": true, "style_gender": "Unisex", "sale_tax_rate": 15, "import_line_key": "Misha Fashion Pets|470|misha-fashion-pets-camiseta-seleccion-amarilla-l|2|8.40", "purchase_tax_rate": 0}	2026-04-11 13:28:49.839253	2026-04-11 13:28:49.839253
pitem_69da92e2c9a5f	pinv_69da92e21c882	paramascotasec	prod_imp_69da92e21f250	Camiseta selección amarilla	1	9.0000	9.0000	{"size": "L", "color": "Amarillo", "tax_rate": 0, "tax_amount": 0, "tax_exempt": true, "style_gender": "Unisex", "sale_tax_rate": 15, "import_line_key": "Misha Fashion Pets|481|misha-fashion-pets-camiseta-seleccion-amarilla-l|1|9.00", "purchase_tax_rate": 0}	2026-04-11 13:28:49.839253	2026-04-11 13:28:49.839253
pitem_69da92e2cf7cb	pinv_69da92e1d3f26	paramascotasec	prod_imp_69da92e2cefe7	Camiseta selección azul	1	6.5300	6.5300	{"size": "S", "color": "Azul", "tax_rate": 0, "tax_amount": 0, "tax_exempt": true, "style_gender": "Unisex", "sale_tax_rate": 15, "import_line_key": "Misha Fashion Pets|470|misha-fashion-pets-camiseta-seleccion-azul-s|1|6.53", "purchase_tax_rate": 0}	2026-04-11 13:28:49.839253	2026-04-11 13:28:49.839253
pitem_69da92e2dd96f	pinv_69da92e1d3f26	paramascotasec	prod_imp_69da92e2d910b	Camiseta selección azul	1	7.4600	7.4600	{"size": "M", "color": "Azul", "tax_rate": 0, "tax_amount": 0, "tax_exempt": true, "style_gender": "Unisex", "sale_tax_rate": 15, "import_line_key": "Misha Fashion Pets|470|misha-fashion-pets-camiseta-seleccion-azul-m|1|7.46", "purchase_tax_rate": 0}	2026-04-11 13:28:49.839253	2026-04-11 13:28:49.839253
pitem_69da92e2e714d	pinv_69da92e1d3f26	paramascotasec	prod_imp_69da92e2df7ca	Camiseta selección azul	1	8.4000	8.4000	{"size": "L", "color": "Azul", "tax_rate": 0, "tax_amount": 0, "tax_exempt": true, "style_gender": "Unisex", "sale_tax_rate": 15, "import_line_key": "Misha Fashion Pets|470|misha-fashion-pets-camiseta-seleccion-azul-l|1|8.40", "purchase_tax_rate": 0}	2026-04-11 13:28:49.839253	2026-04-11 13:28:49.839253
pitem_69da92e2e85b3	pinv_69da92e1d3f26	paramascotasec	prod_imp_69da92e2e7945	Camiseta selección blanca	1	6.5300	6.5300	{"size": "S", "color": "Blanco", "tax_rate": 0, "tax_amount": 0, "tax_exempt": true, "style_gender": "Unisex", "sale_tax_rate": 15, "import_line_key": "Misha Fashion Pets|470|misha-fashion-pets-camiseta-seleccion-blanca-s|1|6.53", "purchase_tax_rate": 0}	2026-04-11 13:28:49.839253	2026-04-11 13:28:49.839253
pitem_69da92e2eb2f4	pinv_69da92e1d3f26	paramascotasec	prod_imp_69da92e2e9040	Camiseta selección blanca	1	7.4600	7.4600	{"size": "M", "color": "Blanco", "tax_rate": 0, "tax_amount": 0, "tax_exempt": true, "style_gender": "Unisex", "sale_tax_rate": 15, "import_line_key": "Misha Fashion Pets|470|misha-fashion-pets-camiseta-seleccion-blanca-m|1|7.46", "purchase_tax_rate": 0}	2026-04-11 13:28:49.839253	2026-04-11 13:28:49.839253
pitem_69da92e312cc6	pinv_69da92e1d3f26	paramascotasec	prod_imp_69da92e2eb9ac	Camiseta selección blanca	1	8.4000	8.4000	{"size": "L", "color": "Blanco", "tax_rate": 0, "tax_amount": 0, "tax_exempt": true, "style_gender": "Unisex", "sale_tax_rate": 15, "import_line_key": "Misha Fashion Pets|470|misha-fashion-pets-camiseta-seleccion-blanca-l|1|8.40", "purchase_tax_rate": 0}	2026-04-11 13:28:49.839253	2026-04-11 13:28:49.839253
pitem_69da9cd815294	pinv_69da92e1d3f26	paramascotasec	prod_69da9cd8105b8	Camiseta Polo Azu S	1	3.4400	3.4400	{"reason": "initial_stock", "tax_rate": 15, "tax_amount": 0.516, "tax_exempt": false}	2026-04-11 14:11:20.066678	2026-04-11 14:11:20.066678
pitem_69daa8a08d6f7	pinv_69da92e1d3f26	paramascotasec	prod_69daa8a08a6d2	Camiseta Polo Azul	1	3.9600	3.9600	{"reason": "initial_stock", "tax_rate": 0, "tax_amount": 0, "tax_exempt": true, "purchase_tax_rate": 0, "purchase_tax_exempt": true}	2026-04-11 15:01:36.566962	2026-04-11 15:01:36.566962
pitem_69daa8e3724c7	pinv_69da92e1d3f26	paramascotasec	prod_69daa8e29aa44	Camiseta Polo Azul L	1	5.8300	5.8300	{"reason": "initial_stock", "tax_rate": 0, "tax_amount": 0, "tax_exempt": true, "purchase_tax_rate": 0, "purchase_tax_exempt": true}	2026-04-11 15:02:42.613604	2026-04-11 15:02:42.613604
pitem_69dac080b171c	pinv_69dac080af7b7	paramascotasec	prod_imp_69dac080a9777	Rollo de fundas para desechos rojo	5	0.2400	1.2000	{"color": "Rojo", "species": "Perro", "tax_rate": 15, "tax_amount": 0.18, "tax_exempt": false, "sale_tax_rate": 15, "variant_label": "Rojo", "import_line_key": "Viba Pets|SIN-FACTURA-VIBA-2026-04-11|VIBA-2026-04-11-001|5|0.2400", "purchase_tax_rate": 15}	2026-04-11 16:43:28.661337	2026-04-11 16:43:28.661337
pitem_69dac080baac5	pinv_69dac080af7b7	paramascotasec	prod_imp_69dac080b8edb	Rollo de fundas para desechos azul	5	0.2400	1.2000	{"color": "Azul", "species": "Perro", "tax_rate": 15, "tax_amount": 0.18, "tax_exempt": false, "sale_tax_rate": 15, "variant_label": "Azul", "import_line_key": "Viba Pets|SIN-FACTURA-VIBA-2026-04-11|VIBA-2026-04-11-002|5|0.2400", "purchase_tax_rate": 15}	2026-04-11 16:43:28.661337	2026-04-11 16:43:28.661337
pitem_69dac080d2df0	pinv_69dac080af7b7	paramascotasec	prod_imp_69dac080ce242	Rollo de fundas para desechos verde	7	0.2400	1.6800	{"color": "Verde", "species": "Perro", "tax_rate": 15, "tax_amount": 0.252, "tax_exempt": false, "sale_tax_rate": 15, "variant_label": "Verde", "import_line_key": "Viba Pets|SIN-FACTURA-VIBA-2026-04-11|VIBA-2026-04-11-003|7|0.2400", "purchase_tax_rate": 15}	2026-04-11 16:43:28.661337	2026-04-11 16:43:28.661337
pitem_69dac080ef8cc	pinv_69dac080af7b7	paramascotasec	prod_imp_69dac080e7ad7	Rollo de fundas para desechos amarillo	7	0.2400	1.6800	{"color": "Amarillo", "species": "Perro", "tax_rate": 15, "tax_amount": 0.252, "tax_exempt": false, "sale_tax_rate": 15, "variant_label": "Amarillo", "import_line_key": "Viba Pets|SIN-FACTURA-VIBA-2026-04-11|VIBA-2026-04-11-004|7|0.2400", "purchase_tax_rate": 15}	2026-04-11 16:43:28.661337	2026-04-11 16:43:28.661337
pitem_69dac08107c8a	pinv_69dac080af7b7	paramascotasec	prod_imp_69dac0810480c	Dispensador de fundas naranja	1	0.2900	0.2900	{"color": "Naranja", "species": "Perro", "tax_rate": 15, "tax_amount": 0.0435, "tax_exempt": false, "sale_tax_rate": 15, "variant_label": "Naranja", "import_line_key": "Viba Pets|SIN-FACTURA-VIBA-2026-04-11|VIBA-2026-04-11-005|1|0.2900", "purchase_tax_rate": 15}	2026-04-11 16:43:28.661337	2026-04-11 16:43:28.661337
pitem_69dac08119fb0	pinv_69dac080af7b7	paramascotasec	prod_imp_69dac0810e042	Dispensador de fundas morado	1	0.2900	0.2900	{"color": "Morado", "species": "Perro", "tax_rate": 15, "tax_amount": 0.0435, "tax_exempt": false, "sale_tax_rate": 15, "variant_label": "Morado", "import_line_key": "Viba Pets|SIN-FACTURA-VIBA-2026-04-11|VIBA-2026-04-11-006|1|0.2900", "purchase_tax_rate": 15}	2026-04-11 16:43:28.661337	2026-04-11 16:43:28.661337
pitem_69dac0812d78a	pinv_69dac080af7b7	paramascotasec	prod_imp_69dac08123bff	Dispensador de fundas azul	2	0.2900	0.5800	{"color": "Azul", "species": "Perro", "tax_rate": 15, "tax_amount": 0.087, "tax_exempt": false, "sale_tax_rate": 15, "variant_label": "Azul", "import_line_key": "Viba Pets|SIN-FACTURA-VIBA-2026-04-11|VIBA-2026-04-11-007|2|0.2900", "purchase_tax_rate": 15}	2026-04-11 16:43:28.661337	2026-04-11 16:43:28.661337
pitem_69dac08130f05	pinv_69dac080af7b7	paramascotasec	prod_imp_69dac081306cf	Dispensador de fundas verde	1	0.2900	0.2900	{"color": "Verde", "species": "Perro", "tax_rate": 15, "tax_amount": 0.0435, "tax_exempt": false, "sale_tax_rate": 15, "variant_label": "Verde", "import_line_key": "Viba Pets|SIN-FACTURA-VIBA-2026-04-11|VIBA-2026-04-11-008|1|0.2900", "purchase_tax_rate": 15}	2026-04-11 16:43:28.661337	2026-04-11 16:43:28.661337
pitem_69dac08132137	pinv_69dac080af7b7	paramascotasec	prod_imp_69dac08131b2e	Dispensador de fundas blanco	1	0.2900	0.2900	{"color": "Blanco", "species": "Perro", "tax_rate": 15, "tax_amount": 0.0435, "tax_exempt": false, "sale_tax_rate": 15, "variant_label": "Blanco", "import_line_key": "Viba Pets|SIN-FACTURA-VIBA-2026-04-11|VIBA-2026-04-11-009|1|0.2900", "purchase_tax_rate": 15}	2026-04-11 16:43:28.661337	2026-04-11 16:43:28.661337
pitem_69dac08133c41	pinv_69dac080af7b7	paramascotasec	prod_imp_69dac08133152	Dispensador de fundas verde fluorescente	1	0.2900	0.2900	{"color": "Verde fluorescente", "species": "Perro", "tax_rate": 15, "tax_amount": 0.0435, "tax_exempt": false, "sale_tax_rate": 15, "variant_label": "Verde fluorescente", "import_line_key": "Viba Pets|SIN-FACTURA-VIBA-2026-04-11|VIBA-2026-04-11-010|1|0.2900", "purchase_tax_rate": 15}	2026-04-11 16:43:28.661337	2026-04-11 16:43:28.661337
pitem_69dac08134f48	pinv_69dac080af7b7	paramascotasec	prod_imp_69dac081348b2	Set collar + correa Huellitas azul	2	1.0200	2.0400	{"color": "Azul", "species": "Perro", "tax_rate": 15, "tax_amount": 0.306, "tax_exempt": false, "sale_tax_rate": 15, "variant_label": "Azul", "import_line_key": "Viba Pets|SIN-FACTURA-VIBA-2026-04-11|VIBA-2026-04-11-011|2|1.0200", "purchase_tax_rate": 15}	2026-04-11 16:43:28.661337	2026-04-11 16:43:28.661337
pitem_69dac08136290	pinv_69dac080af7b7	paramascotasec	prod_imp_69dac08135c21	Set collar + correa Huellitas rosa	2	1.0200	2.0400	{"color": "Rosa", "species": "Perro", "tax_rate": 15, "tax_amount": 0.306, "tax_exempt": false, "sale_tax_rate": 15, "variant_label": "Rosa", "import_line_key": "Viba Pets|SIN-FACTURA-VIBA-2026-04-11|VIBA-2026-04-11-012|2|1.0200", "purchase_tax_rate": 15}	2026-04-11 16:43:28.661337	2026-04-11 16:43:28.661337
pitem_69dac0813770c	pinv_69dac080af7b7	paramascotasec	prod_imp_69dac081370a9	Set collar + correa Huellitas naranja	2	1.0200	2.0400	{"color": "Naranja", "species": "Perro", "tax_rate": 15, "tax_amount": 0.306, "tax_exempt": false, "sale_tax_rate": 15, "variant_label": "Naranja", "import_line_key": "Viba Pets|SIN-FACTURA-VIBA-2026-04-11|VIBA-2026-04-11-013|2|1.0200", "purchase_tax_rate": 15}	2026-04-11 16:43:28.661337	2026-04-11 16:43:28.661337
pitem_69dac081388e0	pinv_69dac080af7b7	paramascotasec	prod_imp_69dac08138222	Collar con cascabel	6	0.0000	0.0000	{"color": "", "species": "Perro", "tax_rate": 15, "tax_amount": 0, "tax_exempt": false, "sale_tax_rate": 15, "variant_label": "", "import_line_key": "Viba Pets|SIN-FACTURA-VIBA-2026-04-11|VIBA-2026-04-11-014|6|0.0000", "purchase_tax_rate": 15}	2026-04-11 16:43:28.661337	2026-04-11 16:43:28.661337
pitem_69dac08139f85	pinv_69dac080af7b7	paramascotasec	prod_imp_69dac0813976a	Pelota pequeña verde	2	0.8700	1.7400	{"color": "Verde", "species": "Perro", "tax_rate": 15, "tax_amount": 0.261, "tax_exempt": false, "sale_tax_rate": 15, "variant_label": "Verde", "import_line_key": "Viba Pets|SIN-FACTURA-VIBA-2026-04-11|VIBA-2026-04-11-015|2|0.8700", "purchase_tax_rate": 15}	2026-04-11 16:43:28.661337	2026-04-11 16:43:28.661337
pitem_69dac0813b394	pinv_69dac080af7b7	paramascotasec	prod_imp_69dac0813ad61	Pelota pequeña turquesa	2	0.8700	1.7400	{"color": "Turquesa", "species": "Perro", "tax_rate": 15, "tax_amount": 0.261, "tax_exempt": false, "sale_tax_rate": 15, "variant_label": "Turquesa", "import_line_key": "Viba Pets|SIN-FACTURA-VIBA-2026-04-11|VIBA-2026-04-11-016|2|0.8700", "purchase_tax_rate": 15}	2026-04-11 16:43:28.661337	2026-04-11 16:43:28.661337
pitem_69dac0813c8f4	pinv_69dac080af7b7	paramascotasec	prod_imp_69dac0813c22e	Pelota pequeña amarilla	1	0.8700	0.8700	{"color": "Amarilla", "species": "Perro", "tax_rate": 15, "tax_amount": 0.1305, "tax_exempt": false, "sale_tax_rate": 15, "variant_label": "Amarilla", "import_line_key": "Viba Pets|SIN-FACTURA-VIBA-2026-04-11|VIBA-2026-04-11-017|1|0.8700", "purchase_tax_rate": 15}	2026-04-11 16:43:28.661337	2026-04-11 16:43:28.661337
pitem_69dac0813dd0b	pinv_69dac080af7b7	paramascotasec	prod_imp_69dac0813d61e	Pelota pequeña roja	1	0.8700	0.8700	{"color": "Roja", "species": "Perro", "tax_rate": 15, "tax_amount": 0.1305, "tax_exempt": false, "sale_tax_rate": 15, "variant_label": "Roja", "import_line_key": "Viba Pets|SIN-FACTURA-VIBA-2026-04-11|VIBA-2026-04-11-018|1|0.8700", "purchase_tax_rate": 15}	2026-04-11 16:43:28.661337	2026-04-11 16:43:28.661337
pitem_69dac0813eea8	pinv_69dac080af7b7	paramascotasec	prod_imp_69dac0813e7fe	Cepillo vaporizador Aqua Groom	6	3.0400	18.2400	{"color": "", "species": "Perro", "tax_rate": 15, "tax_amount": 2.736, "tax_exempt": false, "sale_tax_rate": 15, "variant_label": "", "import_line_key": "Viba Pets|SIN-FACTURA-VIBA-2026-04-11|VIBA-2026-04-11-019|6|3.0400", "purchase_tax_rate": 15}	2026-04-11 16:43:28.661337	2026-04-11 16:43:28.661337
pitem_69dac081402e5	pinv_69dac080af7b7	paramascotasec	prod_imp_69dac0813fb90	Correa extensible 3 m verde	2	2.6100	5.2200	{"color": "Verde", "species": "Perro", "tax_rate": 15, "tax_amount": 0.783, "tax_exempt": false, "sale_tax_rate": 15, "variant_label": "Verde", "import_line_key": "Viba Pets|SIN-FACTURA-VIBA-2026-04-11|VIBA-2026-04-11-020|2|2.6100", "purchase_tax_rate": 15}	2026-04-11 16:43:28.661337	2026-04-11 16:43:28.661337
pitem_69dac08141563	pinv_69dac080af7b7	paramascotasec	prod_imp_69dac08140f18	Correa extensible 3 m roja	2	2.6100	5.2200	{"color": "Roja", "species": "Perro", "tax_rate": 15, "tax_amount": 0.783, "tax_exempt": false, "sale_tax_rate": 15, "variant_label": "Roja", "import_line_key": "Viba Pets|SIN-FACTURA-VIBA-2026-04-11|VIBA-2026-04-11-021|2|2.6100", "purchase_tax_rate": 15}	2026-04-11 16:43:28.661337	2026-04-11 16:43:28.661337
pitem_69dac08142a13	pinv_69dac080af7b7	paramascotasec	prod_imp_69dac0814226c	Correa extensible 3 m azul	2	2.6100	5.2200	{"color": "Azul", "species": "Perro", "tax_rate": 15, "tax_amount": 0.783, "tax_exempt": false, "sale_tax_rate": 15, "variant_label": "Azul", "import_line_key": "Viba Pets|SIN-FACTURA-VIBA-2026-04-11|VIBA-2026-04-11-022|2|2.6100", "purchase_tax_rate": 15}	2026-04-11 16:43:28.661337	2026-04-11 16:43:28.661337
pitem_69dac08143e62	pinv_69dac080af7b7	paramascotasec	prod_imp_69dac081436fa	Plato plegable pequeño azul	4	1.3000	5.2000	{"color": "Azul", "species": "Perro", "tax_rate": 15, "tax_amount": 0.78, "tax_exempt": false, "sale_tax_rate": 15, "variant_label": "Azul", "import_line_key": "Viba Pets|SIN-FACTURA-VIBA-2026-04-11|VIBA-2026-04-11-023|4|1.3000", "purchase_tax_rate": 15}	2026-04-11 16:43:28.661337	2026-04-11 16:43:28.661337
pitem_69dac08145205	pinv_69dac080af7b7	paramascotasec	prod_imp_69dac08144b80	Plato plegable pequeño rojo	4	1.3000	5.2000	{"color": "Rojo", "species": "Perro", "tax_rate": 15, "tax_amount": 0.78, "tax_exempt": false, "sale_tax_rate": 15, "variant_label": "Rojo", "import_line_key": "Viba Pets|SIN-FACTURA-VIBA-2026-04-11|VIBA-2026-04-11-024|4|1.3000", "purchase_tax_rate": 15}	2026-04-11 16:43:28.661337	2026-04-11 16:43:28.661337
pitem_69dac081466a7	pinv_69dac080af7b7	paramascotasec	prod_imp_69dac08145f91	Kit de platos plegables gris 350 ml	6	7.8200	46.9200	{"color": "Gris", "species": "Perro", "tax_rate": 15, "tax_amount": 7.038, "tax_exempt": false, "sale_tax_rate": 15, "variant_label": "", "import_line_key": "Viba Pets|SIN-FACTURA-VIBA-2026-04-11|VIBA-2026-04-11-025|6|7.8200", "purchase_tax_rate": 15}	2026-04-11 16:43:28.661337	2026-04-11 16:43:28.661337
pitem_69dac0814795b	pinv_69dac080af7b7	paramascotasec	prod_imp_69dac08147290	Juguete interactivo Cat Tower azul	3	4.3500	13.0500	{"color": "Azul", "species": "Gato", "tax_rate": 15, "tax_amount": 1.9575, "tax_exempt": false, "sale_tax_rate": 15, "variant_label": "Azul", "import_line_key": "Viba Pets|SIN-FACTURA-VIBA-2026-04-11|VIBA-2026-04-11-026|3|4.3500", "purchase_tax_rate": 15}	2026-04-11 16:43:28.661337	2026-04-11 16:43:28.661337
pitem_69dac08148ced	pinv_69dac080af7b7	paramascotasec	prod_imp_69dac0814865e	Juguete interactivo Cat Tower verde	6	4.3500	26.1000	{"color": "Verde", "species": "Gato", "tax_rate": 15, "tax_amount": 3.915, "tax_exempt": false, "sale_tax_rate": 15, "variant_label": "Verde", "import_line_key": "Viba Pets|SIN-FACTURA-VIBA-2026-04-11|VIBA-2026-04-11-027|6|4.3500", "purchase_tax_rate": 15}	2026-04-11 16:43:28.661337	2026-04-11 16:43:28.661337
pitem_69dac08149eaf	pinv_69dac080af7b7	paramascotasec	prod_imp_69dac08149875	Arenero verde	6	5.2200	31.3200	{"color": "Verde", "species": "Gato", "tax_rate": 15, "tax_amount": 4.698, "tax_exempt": false, "sale_tax_rate": 15, "variant_label": "", "import_line_key": "Viba Pets|SIN-FACTURA-VIBA-2026-04-11|VIBA-2026-04-11-028|6|5.2200", "purchase_tax_rate": 15}	2026-04-11 16:43:28.661337	2026-04-11 16:43:28.661337
pitem_69dd78057aff1	pinv_69dd780579265	paramascotasec	prod_69dd7805760fb	Collar con cascabel Rojo	1	0.0000	0.0000	{"reason": "initial_stock", "tax_rate": 15, "tax_amount": 0, "tax_exempt": false, "purchase_tax_rate": 15, "purchase_tax_exempt": false}	2026-04-13 18:11:01.483372	2026-04-13 18:11:01.483372
pitem_69ebedb990557	pinv_69da92e1d3f26	paramascotasec	prod_69ebedb98b13c	Camiseta Polo Azul L	1	5.8300	5.8300	{"reason": "initial_stock", "tax_rate": 0, "tax_amount": 0, "tax_exempt": true, "purchase_tax_rate": 0, "purchase_tax_exempt": true}	2026-04-24 17:24:57.569257	2026-04-24 17:24:57.569257
pitem_69ec057abd654	pinv_69da92e1d3f26	paramascotasec	prod_69ec057ab9585	Camiseta Polo Azul L	1	3.9600	3.9600	{"reason": "initial_stock", "tax_rate": 0, "tax_amount": 0, "tax_exempt": true, "purchase_tax_rate": 0, "purchase_tax_exempt": true}	2026-04-24 19:06:18.758945	2026-04-24 19:06:18.758945
pitem_69ef9e31c099e	pinv_69ef9e31bbf1c	paramascotasec	prod_69ef9e31b3a09	Collar con cascabel amarillo Rosa	1	0.0000	0.0000	{"reason": "initial_stock", "tax_rate": 15, "tax_amount": 0, "tax_exempt": false, "purchase_tax_rate": 15, "purchase_tax_exempt": false}	2026-04-27 12:34:41.735488	2026-04-27 12:34:41.735488
pitem_69efa41f49575	pinv_69ef9e31bbf1c	paramascotasec	prod_69efa41f410d2	Collar con Cascabel Rosado	1	0.0000	0.0000	{"reason": "initial_stock", "tax_rate": 15, "tax_amount": 0, "tax_exempt": false, "purchase_tax_rate": 15, "purchase_tax_exempt": false}	2026-04-27 12:59:59.266297	2026-04-27 12:59:59.266297
pitem_69efa49e52fd4	pinv_69ef9e31bbf1c	paramascotasec	prod_69efa49e505d5	Caollar con Cascabel Rojo	1	0.0000	0.0000	{"reason": "initial_stock", "tax_rate": 15, "tax_amount": 0, "tax_exempt": false, "purchase_tax_rate": 15, "purchase_tax_exempt": false}	2026-04-27 13:02:06.329093	2026-04-27 13:02:06.329093
pitem_69efa6a0cf950	pinv_69ef9e31bbf1c	paramascotasec	prod_69efa6a0c5623	Collar con Cascabel Azul	1	0.0000	0.0000	{"reason": "initial_stock", "tax_rate": 15, "tax_amount": 0, "tax_exempt": false, "purchase_tax_rate": 15, "purchase_tax_exempt": false}	2026-04-27 13:10:40.808265	2026-04-27 13:10:40.808265
\.


--
-- Data for Name: Quotation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Quotation" (id, tenant_id, status, customer_name, customer_document_type, customer_document_number, customer_email, customer_phone, customer_address, delivery_method, payment_method, discount_code, notes, items, quote_snapshot, created_by_user_id, converted_order_id, valid_until, converted_at, created_at, updated_at) FROM stdin;
COT-20260409000123-DEB3	paramascotasec	quoted	Edwin Vasquez	cedula	1759625104	edwin.eduardo.vm@gmail.com	0962782126	{"zip": null, "city": "Caracas", "state": null, "street": "La Candelaria Caracas", "country": "EC"}	pickup	cash	\N	\N	[{"quantity": 1, "product_id": "prod_69d4472545cf7"}]	{"items": [{"price": 8.63, "total": 8.63, "quantity": 1, "tax_rate": 15, "net_total": 7.5043, "price_net": 7.5043, "unit_cost": 5, "cost_total": 5, "product_id": "prod_69d4472545cf7", "tax_amount": 1.1257, "tax_exempt": false, "product_name": "Chaleco Rayita azul", "product_image": "/uploads/products/paramascotasec-ropa-ficha-20260406-9155401988.jpg", "discount_total": 0}], "total": 8.63, "shipping": 0, "subtotal": 8.63, "vat_rate": 15, "vat_amount": 1.13, "vat_subtotal": 7.5, "discount_code": null, "shipping_base": 0, "discount_total": 0, "mixed_vat_rates": false, "discounts_applied": [], "shipping_tax_rate": 0, "discount_rejections": [], "shipping_tax_amount": 0, "items_subtotal_before_discount": 8.63}	user_admin_evasquez	\N	2026-04-16 00:01:23	\N	2026-04-09 00:01:23.970934	2026-04-09 00:01:23.970934
COT-20260409000159-E609	paramascotasec	quoted	Edwin Vasquez	cedula	1759625104	edwin.eduardo.vm@gmail.com	0962782126	{"zip": null, "city": "Caracas", "state": null, "street": "La Candelaria Caracas", "country": "EC"}	pickup	cash	\N	\N	[{"quantity": 1, "product_id": "prod_69d4472545cf7"}, {"quantity": 1, "product_id": "prod_69d45126b222d"}, {"quantity": 1, "product_id": "prod_69d44cfa28313"}]	{"items": [{"price": 8.63, "total": 8.63, "quantity": 1, "tax_rate": 15, "net_total": 7.5043, "price_net": 7.5043, "unit_cost": 5, "cost_total": 5, "product_id": "prod_69d4472545cf7", "tax_amount": 1.1257, "tax_exempt": false, "product_name": "Chaleco Rayita azul", "product_image": "/uploads/products/paramascotasec-ropa-ficha-20260406-9155401988.jpg", "discount_total": 0}, {"price": 9.49, "total": 9.49, "quantity": 1, "tax_rate": 15, "net_total": 8.2522, "price_net": 8.2522, "unit_cost": 5.5, "cost_total": 5.5, "product_id": "prod_69d45126b222d", "tax_amount": 1.2378, "tax_exempt": false, "product_name": "Chaleco rayita rosa", "product_image": "/uploads/products/paramascotasec-chaleco-rayita-rosa-ropa-ficha-20260407-9d8419a7bd.jpg", "discount_total": 0}, {"price": 8.63, "total": 8.63, "quantity": 1, "tax_rate": 15, "net_total": 7.5043, "price_net": 7.5043, "unit_cost": 5, "cost_total": 5, "product_id": "prod_69d44cfa28313", "tax_amount": 1.1257, "tax_exempt": false, "product_name": "Saco SV Hearts", "product_image": "/uploads/products/paramascotasec-saco-sv-hearts-ropa-ficha-20260407-f132a47158.jpg", "discount_total": 0}], "total": 26.75, "shipping": 0, "subtotal": 26.75, "vat_rate": 15, "vat_amount": 3.49, "vat_subtotal": 23.26, "discount_code": null, "shipping_base": 0, "discount_total": 0, "mixed_vat_rates": false, "discounts_applied": [], "shipping_tax_rate": 0, "discount_rejections": [], "shipping_tax_amount": 0, "items_subtotal_before_discount": 26.75}	user_admin_evasquez	\N	2026-04-16 00:01:59	\N	2026-04-09 00:01:59.733809	2026-04-09 00:01:59.733809
COT-20260409000501-50C8	paramascotasec	quoted	Edwin Vasquez	cedula	1759625104	edwin.eduardo.vm@gmail.com	0962782126	{"zip": null, "city": "Caracas", "state": null, "street": "La Candelaria Caracas", "country": "EC"}	pickup	cash	\N	\N	[{"quantity": 1, "product_id": "prod_69d4472545cf7"}, {"quantity": 1, "product_id": "prod_69d45126b222d"}, {"quantity": 1, "product_id": "prod_69d44cfa28313"}]	{"items": [{"price": 8.63, "total": 8.63, "quantity": 1, "tax_rate": 15, "net_total": 7.5043, "price_net": 7.5043, "unit_cost": 5, "cost_total": 5, "product_id": "prod_69d4472545cf7", "tax_amount": 1.1257, "tax_exempt": false, "product_name": "Chaleco Rayita azul", "product_image": "/uploads/products/paramascotasec-ropa-ficha-20260406-9155401988.jpg", "discount_total": 0}, {"price": 9.49, "total": 9.49, "quantity": 1, "tax_rate": 15, "net_total": 8.2522, "price_net": 8.2522, "unit_cost": 5.5, "cost_total": 5.5, "product_id": "prod_69d45126b222d", "tax_amount": 1.2378, "tax_exempt": false, "product_name": "Chaleco rayita rosa", "product_image": "/uploads/products/paramascotasec-chaleco-rayita-rosa-ropa-ficha-20260407-9d8419a7bd.jpg", "discount_total": 0}, {"price": 8.63, "total": 8.63, "quantity": 1, "tax_rate": 15, "net_total": 7.5043, "price_net": 7.5043, "unit_cost": 5, "cost_total": 5, "product_id": "prod_69d44cfa28313", "tax_amount": 1.1257, "tax_exempt": false, "product_name": "Saco SV Hearts", "product_image": "/uploads/products/paramascotasec-saco-sv-hearts-ropa-ficha-20260407-f132a47158.jpg", "discount_total": 0}], "total": 26.75, "shipping": 0, "subtotal": 26.75, "vat_rate": 15, "vat_amount": 3.49, "vat_subtotal": 23.26, "discount_code": null, "shipping_base": 0, "discount_total": 0, "mixed_vat_rates": false, "discounts_applied": [], "shipping_tax_rate": 0, "discount_rejections": [], "shipping_tax_amount": 0, "items_subtotal_before_discount": 26.75}	user_admin_evasquez	\N	2026-04-16 00:05:01	\N	2026-04-09 00:05:01.216605	2026-04-09 00:05:01.216605
COT-20260409000509-BBBC	paramascotasec	quoted	Edwin Vasquez	cedula	1759625104	edwin.eduardo.vm@gmail.com	0962782126	{"zip": null, "city": "Caracas", "state": null, "street": "La Candelaria Caracas", "country": "EC"}	pickup	cash	\N	\N	[{"quantity": 1, "product_id": "prod_69d4472545cf7"}, {"quantity": 1, "product_id": "prod_69d45126b222d"}, {"quantity": 1, "product_id": "prod_69d44cfa28313"}]	{"items": [{"price": 8.63, "total": 8.63, "quantity": 1, "tax_rate": 15, "net_total": 7.5043, "price_net": 7.5043, "unit_cost": 5, "cost_total": 5, "product_id": "prod_69d4472545cf7", "tax_amount": 1.1257, "tax_exempt": false, "product_name": "Chaleco Rayita azul", "product_image": "/uploads/products/paramascotasec-ropa-ficha-20260406-9155401988.jpg", "discount_total": 0}, {"price": 9.49, "total": 9.49, "quantity": 1, "tax_rate": 15, "net_total": 8.2522, "price_net": 8.2522, "unit_cost": 5.5, "cost_total": 5.5, "product_id": "prod_69d45126b222d", "tax_amount": 1.2378, "tax_exempt": false, "product_name": "Chaleco rayita rosa", "product_image": "/uploads/products/paramascotasec-chaleco-rayita-rosa-ropa-ficha-20260407-9d8419a7bd.jpg", "discount_total": 0}, {"price": 8.63, "total": 8.63, "quantity": 1, "tax_rate": 15, "net_total": 7.5043, "price_net": 7.5043, "unit_cost": 5, "cost_total": 5, "product_id": "prod_69d44cfa28313", "tax_amount": 1.1257, "tax_exempt": false, "product_name": "Saco SV Hearts", "product_image": "/uploads/products/paramascotasec-saco-sv-hearts-ropa-ficha-20260407-f132a47158.jpg", "discount_total": 0}], "total": 26.75, "shipping": 0, "subtotal": 26.75, "vat_rate": 15, "vat_amount": 3.49, "vat_subtotal": 23.26, "discount_code": null, "shipping_base": 0, "discount_total": 0, "mixed_vat_rates": false, "discounts_applied": [], "shipping_tax_rate": 0, "discount_rejections": [], "shipping_tax_amount": 0, "items_subtotal_before_discount": 26.75}	user_admin_evasquez	\N	2026-04-16 00:05:09	\N	2026-04-09 00:05:09.570878	2026-04-09 00:05:09.570878
COT-20260409001023-CA4D	paramascotasec	quoted	Edwin Vasquez	cedula	1759625104	edwin.eduardo.vm@gmail.com	0962782126	{"zip": null, "city": "Caracas", "state": null, "street": "La Candelaria Caracas", "country": "EC"}	pickup	cash	\N	\N	[{"quantity": 1, "product_id": "prod_69d4472545cf7"}, {"quantity": 1, "product_id": "prod_69d45126b222d"}, {"quantity": 1, "product_id": "prod_69d44cfa28313"}]	{"items": [{"price": 8.63, "total": 8.63, "quantity": 1, "tax_rate": 15, "net_total": 7.5043, "price_net": 7.5043, "unit_cost": 5, "cost_total": 5, "product_id": "prod_69d4472545cf7", "tax_amount": 1.1257, "tax_exempt": false, "product_name": "Chaleco Rayita azul", "product_image": "/uploads/products/paramascotasec-ropa-ficha-20260406-9155401988.jpg", "discount_total": 0}, {"price": 9.49, "total": 9.49, "quantity": 1, "tax_rate": 15, "net_total": 8.2522, "price_net": 8.2522, "unit_cost": 5.5, "cost_total": 5.5, "product_id": "prod_69d45126b222d", "tax_amount": 1.2378, "tax_exempt": false, "product_name": "Chaleco rayita rosa", "product_image": "/uploads/products/paramascotasec-chaleco-rayita-rosa-ropa-ficha-20260407-9d8419a7bd.jpg", "discount_total": 0}, {"price": 8.63, "total": 8.63, "quantity": 1, "tax_rate": 15, "net_total": 7.5043, "price_net": 7.5043, "unit_cost": 5, "cost_total": 5, "product_id": "prod_69d44cfa28313", "tax_amount": 1.1257, "tax_exempt": false, "product_name": "Saco SV Hearts", "product_image": "/uploads/products/paramascotasec-saco-sv-hearts-ropa-ficha-20260407-f132a47158.jpg", "discount_total": 0}], "total": 26.75, "shipping": 0, "subtotal": 26.75, "vat_rate": 15, "vat_amount": 3.49, "vat_subtotal": 23.26, "discount_code": null, "shipping_base": 0, "discount_total": 0, "mixed_vat_rates": false, "discounts_applied": [], "shipping_tax_rate": 0, "discount_rejections": [], "shipping_tax_amount": 0, "items_subtotal_before_discount": 26.75}	user_admin_evasquez	\N	2026-04-16 00:10:23	\N	2026-04-09 00:10:23.660473	2026-04-09 00:10:23.660473
COT-20260409003058-44F6	paramascotasec	quoted	Edwin Vasquez	cedula	1759625104	edwin.eduardo.vm@gmail.com	0962782126	{"zip": null, "city": "Caracas", "state": null, "street": "La Candelaria Caracas", "country": "EC"}	pickup	cash	\N	\N	[{"quantity": 1, "product_id": "prod_69d4472545cf7"}]	{"items": [{"price": 8.63, "total": 8.63, "quantity": 1, "tax_rate": 15, "net_total": 7.5043, "price_net": 7.5043, "unit_cost": 5, "cost_total": 5, "product_id": "prod_69d4472545cf7", "tax_amount": 1.1257, "tax_exempt": false, "product_name": "Chaleco Rayita azul", "product_image": "/uploads/products/paramascotasec-ropa-ficha-20260406-9155401988.jpg", "discount_total": 0}], "total": 8.63, "shipping": 0, "subtotal": 8.63, "vat_rate": 15, "vat_amount": 1.13, "vat_subtotal": 7.5, "discount_code": null, "shipping_base": 0, "discount_total": 0, "mixed_vat_rates": false, "discounts_applied": [], "shipping_tax_rate": 0, "discount_rejections": [], "shipping_tax_amount": 0, "items_subtotal_before_discount": 8.63}	user_admin_evasquez	\N	2026-04-16 00:30:58	\N	2026-04-09 00:30:58.795751	2026-04-09 00:30:58.795751
COT-20260409005420-6FDE	paramascotasec	quoted	Edwin Vasquez	cedula	1759625104	edwin.eduardo.vm@gmail.com	0962782126	{"zip": null, "city": "Caracas", "state": null, "street": "La Candelaria Caracas", "country": "EC"}	pickup	cash	\N	\N	[{"quantity": 1, "product_id": "prod_69d45126b222d"}]	{"items": [{"price": 9.49, "total": 9.49, "quantity": 1, "tax_rate": 15, "net_total": 8.2522, "price_net": 8.2522, "unit_cost": 5.5, "cost_total": 5.5, "product_id": "prod_69d45126b222d", "tax_amount": 1.2378, "tax_exempt": false, "product_name": "Chaleco rayita rosa", "product_image": "/uploads/products/paramascotasec-chaleco-rayita-rosa-ropa-ficha-20260407-9d8419a7bd.jpg", "discount_total": 0}], "total": 9.49, "shipping": 0, "subtotal": 9.49, "vat_rate": 15, "vat_amount": 1.24, "vat_subtotal": 8.25, "discount_code": null, "shipping_base": 0, "discount_total": 0, "mixed_vat_rates": false, "discounts_applied": [], "shipping_tax_rate": 0, "discount_rejections": [], "shipping_tax_amount": 0, "items_subtotal_before_discount": 9.49}	user_admin_evasquez	\N	2026-04-16 00:54:20	\N	2026-04-09 00:54:20.375724	2026-04-09 00:54:20.375724
COT-20260409010041-A3BB	paramascotasec	quoted	Edwin Vasquez	cedula	1759625104	edwin.eduardo.vm@gmail.com	0962782126	{"zip": null, "city": "Caracas", "state": null, "street": "La Candelaria Caracas", "country": "EC"}	pickup	cash	\N	\N	[{"quantity": 1, "product_id": "prod_69d45126b222d"}]	{"items": [{"price": 9.49, "total": 9.49, "quantity": 1, "tax_rate": 15, "net_total": 8.2522, "price_net": 8.2522, "unit_cost": 5.5, "cost_total": 5.5, "product_id": "prod_69d45126b222d", "tax_amount": 1.2378, "tax_exempt": false, "product_name": "Chaleco rayita rosa", "product_image": "/uploads/products/paramascotasec-chaleco-rayita-rosa-ropa-ficha-20260407-9d8419a7bd.jpg", "discount_total": 0}], "total": 9.49, "shipping": 0, "subtotal": 9.49, "vat_rate": 15, "vat_amount": 1.24, "vat_subtotal": 8.25, "discount_code": null, "shipping_base": 0, "discount_total": 0, "mixed_vat_rates": false, "discounts_applied": [], "shipping_tax_rate": 0, "discount_rejections": [], "shipping_tax_amount": 0, "items_subtotal_before_discount": 9.49}	user_admin_evasquez	\N	2026-04-16 01:00:41	\N	2026-04-09 01:00:41.768023	2026-04-09 01:00:41.768023
COT-20260409011130-3FA6	paramascotasec	quoted	Edwin Vasquez	cedula	1759625104	edwin.eduardo.vm@gmail.com	0962782126	{"zip": null, "city": "Caracas", "state": null, "street": "La Candelaria Caracas", "country": "EC"}	pickup	cash	\N	\N	[{"quantity": 1, "product_id": "prod_69d4472545cf7"}]	{"items": [{"price": 8.63, "total": 8.63, "quantity": 1, "tax_rate": 15, "net_total": 7.5043, "price_net": 7.5043, "unit_cost": 5, "cost_total": 5, "product_id": "prod_69d4472545cf7", "tax_amount": 1.1257, "tax_exempt": false, "product_name": "Chaleco Rayita azul", "product_image": "/uploads/products/paramascotasec-ropa-ficha-20260406-9155401988.jpg", "discount_total": 0}], "total": 8.63, "shipping": 0, "subtotal": 8.63, "vat_rate": 15, "vat_amount": 1.13, "vat_subtotal": 7.5, "discount_code": null, "shipping_base": 0, "discount_total": 0, "mixed_vat_rates": false, "discounts_applied": [], "shipping_tax_rate": 0, "discount_rejections": [], "shipping_tax_amount": 0, "items_subtotal_before_discount": 8.63}	user_admin_evasquez	\N	2026-04-16 01:11:30	\N	2026-04-09 01:11:30.492603	2026-04-09 01:11:30.492603
COT-20260409011149-05C6	paramascotasec	quoted	Edwin Vasquez	cedula	1759625104	edwin.eduardo.vm@gmail.com	0962782126	{"zip": null, "city": "Caracas", "state": null, "street": "La Candelaria Caracas", "country": "EC"}	pickup	cash	\N	\N	[{"quantity": 1, "product_id": "prod_69d4472545cf7"}]	{"items": [{"price": 8.63, "total": 8.63, "quantity": 1, "tax_rate": 15, "net_total": 7.5043, "price_net": 7.5043, "unit_cost": 5, "cost_total": 5, "product_id": "prod_69d4472545cf7", "tax_amount": 1.1257, "tax_exempt": false, "product_name": "Chaleco Rayita azul", "product_image": "/uploads/products/paramascotasec-ropa-ficha-20260406-9155401988.jpg", "discount_total": 0}], "total": 8.63, "shipping": 0, "subtotal": 8.63, "vat_rate": 15, "vat_amount": 1.13, "vat_subtotal": 7.5, "discount_code": null, "shipping_base": 0, "discount_total": 0, "mixed_vat_rates": false, "discounts_applied": [], "shipping_tax_rate": 0, "discount_rejections": [], "shipping_tax_amount": 0, "items_subtotal_before_discount": 8.63}	user_admin_evasquez	\N	2026-04-16 01:11:49	\N	2026-04-09 01:11:49.780209	2026-04-09 01:11:49.780209
COT-20260409012148-E7E6	paramascotasec	quoted	Edwin Vasquez	cedula	1759625104	edwin.eduardo.vm@gmail.com	0962782126	{"zip": null, "city": "Caracas", "state": null, "street": "La Candelaria Caracas", "country": "EC"}	pickup	cash	\N	\N	[{"quantity": 1, "product_id": "prod_69d7103e397c3"}, {"quantity": 1, "product_id": "prod_69d4472545cf7"}]	{"items": [{"price": 9.49, "total": 9.49, "quantity": 1, "tax_rate": 15, "net_total": 8.2522, "price_net": 8.2522, "unit_cost": 5.5, "cost_total": 5.5, "product_id": "prod_69d7103e397c3", "tax_amount": 1.2378, "tax_exempt": false, "product_name": "Chaleco Lazo", "product_image": "/uploads/products/paramascotasec-chaleco-lazo-ropa-ficha-20260409-b2c6ffd9f5.jpg", "discount_total": 0}, {"price": 8.63, "total": 8.63, "quantity": 1, "tax_rate": 15, "net_total": 7.5043, "price_net": 7.5043, "unit_cost": 5, "cost_total": 5, "product_id": "prod_69d4472545cf7", "tax_amount": 1.1257, "tax_exempt": false, "product_name": "Chaleco Rayita azul", "product_image": "/uploads/products/paramascotasec-ropa-ficha-20260406-9155401988.jpg", "discount_total": 0}], "total": 18.12, "shipping": 0, "subtotal": 18.12, "vat_rate": 15, "vat_amount": 2.36, "vat_subtotal": 15.76, "discount_code": null, "shipping_base": 0, "discount_total": 0, "mixed_vat_rates": false, "discounts_applied": [], "shipping_tax_rate": 0, "discount_rejections": [], "shipping_tax_amount": 0, "items_subtotal_before_discount": 18.12}	user_admin_evasquez	\N	2026-04-16 01:21:48	\N	2026-04-09 01:21:48.067927	2026-04-09 01:21:48.067927
COT-20260409012558-CC36	paramascotasec	quoted	Edwin Vasquez	cedula	1759625104	edwin.eduardo.vm@gmail.com	0962782126	{"zip": null, "city": "Caracas", "state": null, "street": "La Candelaria Caracas", "country": "EC"}	pickup	cash	\N	\N	[{"quantity": 1, "product_id": "prod_69d7103e397c3"}, {"quantity": 1, "product_id": "prod_69d4472545cf7"}, {"quantity": 1, "product_id": "prod_69d45126b222d"}, {"quantity": 1, "product_id": "prod_69d44cfa28313"}]	{"items": [{"price": 9.49, "total": 9.49, "quantity": 1, "tax_rate": 15, "net_total": 8.2522, "price_net": 8.2522, "unit_cost": 5.5, "cost_total": 5.5, "product_id": "prod_69d7103e397c3", "tax_amount": 1.2378, "tax_exempt": false, "product_name": "Chaleco Lazo", "product_image": "/uploads/products/paramascotasec-chaleco-lazo-ropa-ficha-20260409-b2c6ffd9f5.jpg", "discount_total": 0}, {"price": 8.63, "total": 8.63, "quantity": 1, "tax_rate": 15, "net_total": 7.5043, "price_net": 7.5043, "unit_cost": 5, "cost_total": 5, "product_id": "prod_69d4472545cf7", "tax_amount": 1.1257, "tax_exempt": false, "product_name": "Chaleco Rayita azul", "product_image": "/uploads/products/paramascotasec-ropa-ficha-20260406-9155401988.jpg", "discount_total": 0}, {"price": 9.49, "total": 9.49, "quantity": 1, "tax_rate": 15, "net_total": 8.2522, "price_net": 8.2522, "unit_cost": 5.5, "cost_total": 5.5, "product_id": "prod_69d45126b222d", "tax_amount": 1.2378, "tax_exempt": false, "product_name": "Chaleco rayita rosa", "product_image": "/uploads/products/paramascotasec-chaleco-rayita-rosa-ropa-ficha-20260407-9d8419a7bd.jpg", "discount_total": 0}, {"price": 8.63, "total": 8.63, "quantity": 1, "tax_rate": 15, "net_total": 7.5043, "price_net": 7.5043, "unit_cost": 5, "cost_total": 5, "product_id": "prod_69d44cfa28313", "tax_amount": 1.1257, "tax_exempt": false, "product_name": "Saco SV Hearts", "product_image": "/uploads/products/paramascotasec-saco-sv-hearts-ropa-ficha-20260407-f132a47158.jpg", "discount_total": 0}], "total": 36.24, "shipping": 0, "subtotal": 36.24, "vat_rate": 15, "vat_amount": 4.73, "vat_subtotal": 31.51, "discount_code": null, "shipping_base": 0, "discount_total": 0, "mixed_vat_rates": false, "discounts_applied": [], "shipping_tax_rate": 0, "discount_rejections": [], "shipping_tax_amount": 0, "items_subtotal_before_discount": 36.24}	user_admin_evasquez	\N	2026-04-16 01:25:58	\N	2026-04-09 01:25:58.30452	2026-04-09 01:25:58.30452
COT-20260409013018-3415	paramascotasec	quoted	Edwin Vasquez	cedula	1759625104	edwin.eduardo.vm@gmail.com	0962782126	{"zip": null, "city": "Caracas", "state": null, "street": "La Candelaria Caracas", "country": "EC"}	pickup	cash	\N	\N	[{"quantity": 1, "product_id": "prod_69d7103e397c3"}, {"quantity": 1, "product_id": "prod_69d4472545cf7"}, {"quantity": 1, "product_id": "prod_69d45126b222d"}, {"quantity": 1, "product_id": "prod_69d44cfa28313"}]	{"items": [{"price": 9.49, "total": 9.49, "quantity": 1, "tax_rate": 15, "net_total": 8.2522, "price_net": 8.2522, "unit_cost": 5.5, "cost_total": 5.5, "product_id": "prod_69d7103e397c3", "tax_amount": 1.2378, "tax_exempt": false, "product_name": "Chaleco Lazo", "product_image": "/uploads/products/paramascotasec-chaleco-lazo-ropa-ficha-20260409-b2c6ffd9f5.jpg", "discount_total": 0}, {"price": 8.63, "total": 8.63, "quantity": 1, "tax_rate": 15, "net_total": 7.5043, "price_net": 7.5043, "unit_cost": 5, "cost_total": 5, "product_id": "prod_69d4472545cf7", "tax_amount": 1.1257, "tax_exempt": false, "product_name": "Chaleco Rayita azul", "product_image": "/uploads/products/paramascotasec-ropa-ficha-20260406-9155401988.jpg", "discount_total": 0}, {"price": 9.49, "total": 9.49, "quantity": 1, "tax_rate": 15, "net_total": 8.2522, "price_net": 8.2522, "unit_cost": 5.5, "cost_total": 5.5, "product_id": "prod_69d45126b222d", "tax_amount": 1.2378, "tax_exempt": false, "product_name": "Chaleco rayita rosa", "product_image": "/uploads/products/paramascotasec-chaleco-rayita-rosa-ropa-ficha-20260407-9d8419a7bd.jpg", "discount_total": 0}, {"price": 8.63, "total": 8.63, "quantity": 1, "tax_rate": 15, "net_total": 7.5043, "price_net": 7.5043, "unit_cost": 5, "cost_total": 5, "product_id": "prod_69d44cfa28313", "tax_amount": 1.1257, "tax_exempt": false, "product_name": "Saco SV Hearts", "product_image": "/uploads/products/paramascotasec-saco-sv-hearts-ropa-ficha-20260407-f132a47158.jpg", "discount_total": 0}], "total": 36.24, "shipping": 0, "subtotal": 36.24, "vat_rate": 15, "vat_amount": 4.73, "vat_subtotal": 31.51, "discount_code": null, "shipping_base": 0, "discount_total": 0, "mixed_vat_rates": false, "discounts_applied": [], "shipping_tax_rate": 0, "discount_rejections": [], "shipping_tax_amount": 0, "items_subtotal_before_discount": 36.24}	user_admin_evasquez	\N	2026-04-16 01:30:18	\N	2026-04-09 01:30:18.446866	2026-04-09 01:30:18.446866
\.


--
-- Data for Name: Setting; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Setting" (key, value, tenant_id) FROM stdin;
paramascotasec:shipping_delivery	5	paramascotasec
paramascotasec:shipping_pickup	0	paramascotasec
paramascotasec:shipping_tax_rate	0	paramascotasec
paramascotasec:pricing_margin_base	30	paramascotasec
paramascotasec:pricing_calc_rounding	0.05	paramascotasec
paramascotasec:pricing_calc_strategy	cost_plus	paramascotasec
paramascotasec:pricing_margin_min	15	paramascotasec
paramascotasec:pricing_calc_include_vat	1	paramascotasec
paramascotasec:pricing_margin_target	35	paramascotasec
paramascotasec:pricing_calc_shipping_buffer	0	paramascotasec
paramascotasec:pricing_margin_promo_buffer	5	paramascotasec
paramascotasec:vat_rate	15	paramascotasec
paramascotasec:product_reference_data	{"brands":["ParaMascotas","Avant","Misha Fashion Pets"],"suppliers":[{"id":"supplier-1","name":"Fabripet","document":"17596461","email":"asasd@asdasd.com","phone":"091651651","contactName":"Edwi asdasd","address":"adacsadase ad ase","notes":"sd aseads qaesdda"},{"id":"supplier-000000000","name":"Misha Fashion Pets","document":"000000000","email":"mishafashionpets@gmail.com","phone":"099999999","contactName":"No proporsionado","address":"No direccion","notes":"Ajustar los datos del proveedor"}],"sizes":["XL","S","L","M","XS"],"materials":["Nylon"],"colors":["Azul","Rojo"],"usages":["Paseo"],"presentations":[],"activeIngredients":[],"storageLocations":["Principal"],"tags":["Premium"],"flavors":["Pollo"],"ageRanges":["Adulto"]}	paramascotasec
paramascotasec:security.admin_mfa_recovery_code.current	7AA3-7FF2-0EC4	paramascotasec
paramascotasec:security.admin_mfa_recovery_code.previous	B321-EAF9-E47F	paramascotasec
paramascotasec:pricing_rule_bulk_threshold	1000000	paramascotasec
paramascotasec:pricing_rule_bulk_discount	0	paramascotasec
paramascotasec:pricing_rule_clearance_threshold	3000000	paramascotasec
paramascotasec:pricing_rule_clearance_discount	0	paramascotasec
paramascotasec:store_sales_enabled	0	paramascotasec
paramascotasec:store_sales_message	Tienda temporalmente en mantenimiento. Intenta más tarde.	paramascotasec
paramascotasec:store_sales_updated_at	2026-04-26T09:40:41-05:00	paramascotasec
paramascotasec:store_sales_updated_by	user_admin_evasquez	paramascotasec
\.


--
-- Data for Name: Tenant; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Tenant" (id, name, created_at) FROM stdin;
paramascotasec	Para Mascotas EC	2026-02-27 08:16:37.062203
tecnolts	TecnoLTS	2026-02-27 08:16:37.063427
\.


--
-- Data for Name: User; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."User" (id, email, name, password, created_at, updated_at, email_verified, verification_token, role, addresses, profile, active_token_id, document_type, document_number, business_name, otp_code, otp_expires_at, otp_attempts, tenant_id, failed_login_attempts, login_locked_until, last_login_at) FROM stdin;
user_admin_evasquez	evasquez@paramascotasec.com	evasquez	$2y$10$IVgF0kTJ63HPPCSwDrw15Oqa5QlP9Syaab8wgIXG811TbH29QneGe	2026-04-08 23:20:17.602	2026-04-27 12:35:00.066	t	\N	admin	\N	{"phone": "0962782126"}	c5df42f9aa2a10584627208cc9164b64	cedula	1759625104	\N	\N	\N	0	paramascotasec	0	\N	2026-04-27 12:35:00.06181
user_admin_gvasquez	gvasquez@paramascotasec.com	gvasquez	$2y$10$/sz143Wq5NzBlvXFO7xDz.ve8upmvTUmHSqH9kifx1CGKj51JHZDW	2026-04-08 23:20:17.602	2026-04-27 12:43:45.302	t	\N	admin	\N	\N	03da32309360e5d4ab8e938ce47faac5	\N	\N	\N	\N	\N	0	paramascotasec	0	\N	2026-04-27 12:43:45.298155
user_admin	admin@paramascotasec.com	admin	$2y$10$6q2nlW3Rt6gOAZE/G56VLuxvsa4NgLwFc0ykEHf5A8UdiN4MUJK2O	2026-01-25 12:59:44.549	2026-04-08 23:55:56.36	t	\N	admin	\N	\N	\N	\N	\N	\N	\N	\N	0	paramascotasec	0	\N	2026-04-08 22:39:16.73603
9e41dba26244a8de7b57	dnavas@tecnolts.com	Darwina Navajas	$2y$10$2JhSsp0BbrFLZa4wJRGMoexOw/4OxloAp5.ix8BtA.frSQPKtSjhe	2026-04-13 18:40:25.493	2026-04-13 19:06:33.268	t	\N	admin	\N	{"phone": "0992910848"}	\N	cedula	1758548810	\N	\N	\N	\N	paramascotasec	\N	\N	\N
b29aacaffaae3aa87522	local-pos+posqa12345@local-pos.invalid	Cliente POS QA	$2y$10$rUfdHGyQ.nBkZ4NN3Uy4HOrDl0Q8IFy.0QDEcs.N.njvA/VNksmS6	2026-03-25 15:32:31.281	2026-03-25 15:32:31.281	f	\N	customer	[{"id": "1774470751242", "title": "Dirección principal", "isSame": true, "billing": {"zip": null, "city": "Quito", "email": null, "phone": "0999999999", "state": null, "street": "Av QA", "country": "EC", "lastName": "POS", "firstName": "Cliente", "documentType": "cedula", "documentNumber": "POSQA12345"}, "shipping": {"zip": null, "city": "Quito", "email": null, "phone": "0999999999", "state": null, "street": "Av QA", "country": "EC", "lastName": "POS", "firstName": "Cliente", "documentType": "cedula", "documentNumber": "POSQA12345"}}]	{"phone": "0999999999", "origin": "local_pos", "lastName": "POS", "firstName": "Cliente", "documentType": "cedula", "documentNumber": "POSQA12345", "syntheticEmail": true}	\N	cedula	POSQA12345	\N	\N	\N	\N	paramascotasec	\N	\N	\N
9881059f226e1f2f645f	edwin.eduardo.vm@gmail.com	Edwin Vasquez	$2y$10$8KT9jnCpAzhBWPPnkeN0BOinLFyAl.6yRk3tJwMK11ljogRghENw.	2026-03-25 14:42:15.389	2026-04-09 00:53:52.798	t	\N	customer	[{"id": "1775714032798", "title": "Dirección principal", "isSame": true, "billing": {"zip": null, "city": "Caracas", "email": "edwin.eduardo.vm@gmail.com", "phone": "0962782126", "state": null, "street": "La Candelaria Caracas", "country": "EC", "lastName": "Vasquez", "firstName": "Edwin", "documentType": "cedula", "documentNumber": "1759625104"}, "shipping": {"zip": null, "city": "Caracas", "email": "edwin.eduardo.vm@gmail.com", "phone": "0962782126", "state": null, "street": "La Candelaria Caracas", "country": "EC", "lastName": "Vasquez", "firstName": "Edwin", "documentType": "cedula", "documentNumber": "1759625104"}}]	{"birth": "1991-04-22", "phone": "0962782126", "gender": "Male", "origin": "local_pos", "lastName": "Vasquez", "firstName": "Edwin", "businessName": "", "documentType": "Cédula", "documentNumber": "1759625104", "syntheticEmail": false}	1b30f814bee8250e56d5b9a5067f0360	cedula	1759625104		\N	\N	0	paramascotasec	0	\N	2026-04-01 14:06:30.650409
\.


--
-- Data for Name: Variation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Variation" (id, color, color_code, color_image, image, product_id) FROM stdin;
\.


--
-- Name: PosMovement_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."PosMovement_id_seq"', 1, false);


--
-- Name: AuthSecurityEvent AuthSecurityEvent_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."AuthSecurityEvent"
    ADD CONSTRAINT "AuthSecurityEvent_pkey" PRIMARY KEY (id);


--
-- Name: ContactMessage ContactMessage_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ContactMessage"
    ADD CONSTRAINT "ContactMessage_pkey" PRIMARY KEY (id);


--
-- Name: DiscountAudit DiscountAudit_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DiscountAudit"
    ADD CONSTRAINT "DiscountAudit_pkey" PRIMARY KEY (id);


--
-- Name: DiscountCode DiscountCode_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DiscountCode"
    ADD CONSTRAINT "DiscountCode_pkey" PRIMARY KEY (id);


--
-- Name: Image Image_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Image"
    ADD CONSTRAINT "Image_pkey" PRIMARY KEY (id);


--
-- Name: InventoryLotAllocation InventoryLotAllocation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."InventoryLotAllocation"
    ADD CONSTRAINT "InventoryLotAllocation_pkey" PRIMARY KEY (id);


--
-- Name: InventoryLot InventoryLot_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."InventoryLot"
    ADD CONSTRAINT "InventoryLot_pkey" PRIMARY KEY (id);


--
-- Name: OrderItem OrderItem_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."OrderItem"
    ADD CONSTRAINT "OrderItem_pkey" PRIMARY KEY (id);


--
-- Name: Order Order_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Order"
    ADD CONSTRAINT "Order_pkey" PRIMARY KEY (id);


--
-- Name: PosMovement PosMovement_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PosMovement"
    ADD CONSTRAINT "PosMovement_pkey" PRIMARY KEY (id);


--
-- Name: PosShift PosShift_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PosShift"
    ADD CONSTRAINT "PosShift_pkey" PRIMARY KEY (id);


--
-- Name: ProductReferenceCatalog ProductReferenceCatalog_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ProductReferenceCatalog"
    ADD CONSTRAINT "ProductReferenceCatalog_pkey" PRIMARY KEY (id);


--
-- Name: Product Product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Product"
    ADD CONSTRAINT "Product_pkey" PRIMARY KEY (id);


--
-- Name: PurchaseInvoiceItem PurchaseInvoiceItem_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PurchaseInvoiceItem"
    ADD CONSTRAINT "PurchaseInvoiceItem_pkey" PRIMARY KEY (id);


--
-- Name: PurchaseInvoice PurchaseInvoice_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PurchaseInvoice"
    ADD CONSTRAINT "PurchaseInvoice_pkey" PRIMARY KEY (id);


--
-- Name: Quotation Quotation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Quotation"
    ADD CONSTRAINT "Quotation_pkey" PRIMARY KEY (id);


--
-- Name: Setting Setting_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Setting"
    ADD CONSTRAINT "Setting_pkey" PRIMARY KEY (key);


--
-- Name: Tenant Tenant_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tenant"
    ADD CONSTRAINT "Tenant_pkey" PRIMARY KEY (id);


--
-- Name: User User_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);


--
-- Name: Variation Variation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Variation"
    ADD CONSTRAINT "Variation_pkey" PRIMARY KEY (id);


--
-- Name: AuthSecurityEvent_tenant_created_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "AuthSecurityEvent_tenant_created_idx" ON public."AuthSecurityEvent" USING btree (tenant_id, created_at DESC);


--
-- Name: AuthSecurityEvent_tenant_email_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "AuthSecurityEvent_tenant_email_idx" ON public."AuthSecurityEvent" USING btree (tenant_id, email, created_at DESC);


--
-- Name: AuthSecurityEvent_tenant_event_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "AuthSecurityEvent_tenant_event_idx" ON public."AuthSecurityEvent" USING btree (tenant_id, event_type, created_at DESC);


--
-- Name: AuthSecurityEvent_tenant_user_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "AuthSecurityEvent_tenant_user_idx" ON public."AuthSecurityEvent" USING btree (tenant_id, user_id, created_at DESC);


--
-- Name: ContactMessage_tenant_created_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "ContactMessage_tenant_created_idx" ON public."ContactMessage" USING btree (tenant_id, created_at DESC);


--
-- Name: ContactMessage_tenant_status_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "ContactMessage_tenant_status_idx" ON public."ContactMessage" USING btree (tenant_id, status);


--
-- Name: DiscountAudit_tenant_code_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "DiscountAudit_tenant_code_idx" ON public."DiscountAudit" USING btree (tenant_id, code);


--
-- Name: DiscountAudit_tenant_created_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "DiscountAudit_tenant_created_idx" ON public."DiscountAudit" USING btree (tenant_id, created_at DESC);


--
-- Name: DiscountAudit_tenant_order_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "DiscountAudit_tenant_order_idx" ON public."DiscountAudit" USING btree (tenant_id, order_id);


--
-- Name: DiscountCode_tenant_active_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "DiscountCode_tenant_active_idx" ON public."DiscountCode" USING btree (tenant_id, is_active);


--
-- Name: DiscountCode_tenant_code_uidx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "DiscountCode_tenant_code_uidx" ON public."DiscountCode" USING btree (tenant_id, code);


--
-- Name: DiscountCode_tenant_window_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "DiscountCode_tenant_window_idx" ON public."DiscountCode" USING btree (tenant_id, starts_at, ends_at);


--
-- Name: Image_product_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Image_product_id_idx" ON public."Image" USING btree (product_id);


--
-- Name: InventoryLotAllocation_tenant_lot_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "InventoryLotAllocation_tenant_lot_idx" ON public."InventoryLotAllocation" USING btree (tenant_id, lot_id);


--
-- Name: InventoryLotAllocation_tenant_order_item_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "InventoryLotAllocation_tenant_order_item_idx" ON public."InventoryLotAllocation" USING btree (tenant_id, order_item_id);


--
-- Name: InventoryLotAllocation_tenant_product_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "InventoryLotAllocation_tenant_product_idx" ON public."InventoryLotAllocation" USING btree (tenant_id, product_id);


--
-- Name: InventoryLot_tenant_product_received_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "InventoryLot_tenant_product_received_idx" ON public."InventoryLot" USING btree (tenant_id, product_id, received_at, created_at);


--
-- Name: InventoryLot_tenant_product_remaining_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "InventoryLot_tenant_product_remaining_idx" ON public."InventoryLot" USING btree (tenant_id, product_id, remaining_quantity);


--
-- Name: InventoryLot_tenant_purchase_invoice_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "InventoryLot_tenant_purchase_invoice_idx" ON public."InventoryLot" USING btree (tenant_id, purchase_invoice_id);


--
-- Name: InventoryLot_tenant_purchase_invoice_item_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "InventoryLot_tenant_purchase_invoice_item_idx" ON public."InventoryLot" USING btree (tenant_id, purchase_invoice_item_id);


--
-- Name: OrderItem_order_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "OrderItem_order_id_idx" ON public."OrderItem" USING btree (order_id);


--
-- Name: OrderItem_product_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "OrderItem_product_id_idx" ON public."OrderItem" USING btree (product_id);


--
-- Name: Order_tenant_created_active_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Order_tenant_created_active_idx" ON public."Order" USING btree (tenant_id, created_at) WHERE (lower(COALESCE(status, 'pending'::text)) <> ALL (ARRAY['canceled'::text, 'cancelled'::text]));


--
-- Name: Order_tenant_created_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Order_tenant_created_idx" ON public."Order" USING btree (tenant_id, created_at);


--
-- Name: Order_tenant_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Order_tenant_id_idx" ON public."Order" USING btree (tenant_id);


--
-- Name: Order_tenant_status_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Order_tenant_status_idx" ON public."Order" USING btree (tenant_id, status);


--
-- Name: Order_tenant_status_norm_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Order_tenant_status_norm_idx" ON public."Order" USING btree (tenant_id, lower(COALESCE(status, 'pending'::text)));


--
-- Name: Order_tenant_user_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Order_tenant_user_idx" ON public."Order" USING btree (tenant_id, user_id);


--
-- Name: ProductReferenceCatalog_tenant_catalog_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "ProductReferenceCatalog_tenant_catalog_idx" ON public."ProductReferenceCatalog" USING btree (tenant_id, catalog_key, sort_order);


--
-- Name: ProductReferenceCatalog_tenant_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "ProductReferenceCatalog_tenant_id_idx" ON public."ProductReferenceCatalog" USING btree (tenant_id);


--
-- Name: Product_catalog_listing_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Product_catalog_listing_idx" ON public."Product" USING btree (tenant_id, created_at DESC) WHERE ((COALESCE(is_published, true) = true) AND (COALESCE(quantity, 0) > 0));


--
-- Name: Product_slug_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "Product_slug_key" ON public."Product" USING btree (slug);


--
-- Name: Product_tenant_created_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Product_tenant_created_idx" ON public."Product" USING btree (tenant_id, created_at DESC);


--
-- Name: Product_tenant_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Product_tenant_id_idx" ON public."Product" USING btree (tenant_id);


--
-- Name: Product_tenant_legacy_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Product_tenant_legacy_id_idx" ON public."Product" USING btree (tenant_id, legacy_id);


--
-- Name: Product_tenant_published_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Product_tenant_published_idx" ON public."Product" USING btree (tenant_id, is_published);


--
-- Name: Product_tenant_slug_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Product_tenant_slug_idx" ON public."Product" USING btree (tenant_id, slug);


--
-- Name: Product_tenant_slug_uidx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "Product_tenant_slug_uidx" ON public."Product" USING btree (tenant_id, slug);


--
-- Name: PurchaseInvoiceItem_tenant_invoice_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "PurchaseInvoiceItem_tenant_invoice_idx" ON public."PurchaseInvoiceItem" USING btree (tenant_id, purchase_invoice_id, created_at);


--
-- Name: PurchaseInvoiceItem_tenant_product_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "PurchaseInvoiceItem_tenant_product_idx" ON public."PurchaseInvoiceItem" USING btree (tenant_id, product_id, created_at DESC);


--
-- Name: PurchaseInvoice_tenant_external_key_uidx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "PurchaseInvoice_tenant_external_key_uidx" ON public."PurchaseInvoice" USING btree (tenant_id, external_key);


--
-- Name: PurchaseInvoice_tenant_issued_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "PurchaseInvoice_tenant_issued_idx" ON public."PurchaseInvoice" USING btree (tenant_id, issued_at DESC, created_at DESC);


--
-- Name: Quotation_tenant_converted_order_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Quotation_tenant_converted_order_idx" ON public."Quotation" USING btree (tenant_id, converted_order_id);


--
-- Name: Quotation_tenant_created_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Quotation_tenant_created_idx" ON public."Quotation" USING btree (tenant_id, created_at DESC);


--
-- Name: Quotation_tenant_status_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Quotation_tenant_status_idx" ON public."Quotation" USING btree (tenant_id, status, created_at DESC);


--
-- Name: Setting_tenant_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Setting_tenant_id_idx" ON public."Setting" USING btree (tenant_id);


--
-- Name: User_email_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "User_email_key" ON public."User" USING btree (email);


--
-- Name: User_tenant_email_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "User_tenant_email_idx" ON public."User" USING btree (tenant_id, email);


--
-- Name: User_tenant_email_uidx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "User_tenant_email_uidx" ON public."User" USING btree (tenant_id, email);


--
-- Name: User_tenant_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "User_tenant_id_idx" ON public."User" USING btree (tenant_id);


--
-- Name: Variation_product_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Variation_product_id_idx" ON public."Variation" USING btree (product_id);


--
-- Name: idx_pos_movement_shift; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_pos_movement_shift ON public."PosMovement" USING btree (tenant_id, shift_id, created_at DESC);


--
-- Name: idx_pos_shift_tenant_opened_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_pos_shift_tenant_opened_at ON public."PosShift" USING btree (tenant_id, opened_at DESC);


--
-- Name: idx_pos_shift_tenant_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_pos_shift_tenant_status ON public."PosShift" USING btree (tenant_id, status);


--
-- Name: idx_quotation_tenant_converted_order; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_quotation_tenant_converted_order ON public."Quotation" USING btree (tenant_id, converted_order_id);


--
-- Name: idx_quotation_tenant_created; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_quotation_tenant_created ON public."Quotation" USING btree (tenant_id, created_at DESC);


--
-- Name: idx_quotation_tenant_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_quotation_tenant_status ON public."Quotation" USING btree (tenant_id, status, created_at DESC);


--
-- Name: Image Image_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Image"
    ADD CONSTRAINT "Image_product_id_fkey" FOREIGN KEY (product_id) REFERENCES public."Product"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: OrderItem OrderItem_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."OrderItem"
    ADD CONSTRAINT "OrderItem_order_id_fkey" FOREIGN KEY (order_id) REFERENCES public."Order"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: OrderItem OrderItem_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."OrderItem"
    ADD CONSTRAINT "OrderItem_product_id_fkey" FOREIGN KEY (product_id) REFERENCES public."Product"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Order Order_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Order"
    ADD CONSTRAINT "Order_user_id_fkey" FOREIGN KEY (user_id) REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Variation Variation_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Variation"
    ADD CONSTRAINT "Variation_product_id_fkey" FOREIGN KEY (product_id) REFERENCES public."Product"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: PosMovement pos_movement_shift_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PosMovement"
    ADD CONSTRAINT pos_movement_shift_fk FOREIGN KEY (shift_id) REFERENCES public."PosShift"(id) ON DELETE CASCADE;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;


--
-- PostgreSQL database dump complete
--

\unrestrict salPJqGkoSfOQEhqOP3pTa1ruKfCiMniFYbZhhQVb7aK5s5SfYXfkVJdnCvX07u

