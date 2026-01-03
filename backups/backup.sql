--
-- PostgreSQL database dump
--

\restrict g5fFtS59ICbxbvpiYWtmZ3sO4rnaCNZu09wuShK9fHeYqFoQ93Rla4pybakeFk5

-- Dumped from database version 15.15
-- Dumped by pg_dump version 15.15

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
-- Name: Image; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Image" (
    id text NOT NULL,
    url text NOT NULL,
    "productId" text
);


ALTER TABLE public."Image" OWNER TO postgres;

--
-- Name: Order; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Order" (
    id text NOT NULL,
    "userId" text,
    status text DEFAULT 'pending'::text NOT NULL,
    total numeric(10,2) NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."Order" OWNER TO postgres;

--
-- Name: OrderItem; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."OrderItem" (
    id text NOT NULL,
    "orderId" text NOT NULL,
    "productId" text NOT NULL,
    quantity integer NOT NULL,
    price numeric(10,2) NOT NULL
);


ALTER TABLE public."OrderItem" OWNER TO postgres;

--
-- Name: Product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Product" (
    id text NOT NULL,
    "legacyId" text,
    categoria text NOT NULL,
    nombre text NOT NULL,
    genero text,
    nuevo boolean DEFAULT false NOT NULL,
    oferta boolean DEFAULT false NOT NULL,
    precio numeric(10,2) NOT NULL,
    precio_original numeric(10,2) NOT NULL,
    marca text,
    vendido integer DEFAULT 0 NOT NULL,
    cantidad integer NOT NULL,
    descripcion text NOT NULL,
    accion text,
    slug text NOT NULL,
    fecha_de_creacion timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    fecha_de_actualziacion timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."Product" OWNER TO postgres;

--
-- Name: User; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."User" (
    id text NOT NULL,
    email text NOT NULL,
    name text,
    password text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."User" OWNER TO postgres;

--
-- Name: Variation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Variation" (
    id text NOT NULL,
    color text NOT NULL,
    "colorCode" text,
    "colorImage" text,
    image text,
    "productId" text NOT NULL
);


ALTER TABLE public."Variation" OWNER TO postgres;

--
-- Data for Name: Image; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Image" (id, url, "productId") FROM stdin;
cmj8w10070001prxyzn5qf2js	/images/product/1.jpg	cmj8w10070000prxy5mj60yfy
cmj8w100f0003prxyczlxy54c	/images/product/2.jpg	cmj8w100f0002prxylraete5v
cmj8w100l0005prxyplspsksj	/images/product/3.jpg	cmj8w100l0004prxytzlisi3y
cmj8w100r0007prxyprmtt91q	/images/product/4.jpg	cmj8w100r0006prxy5ohxxt20
cmj8w100v0009prxy4ngguk6h	/images/product/5.jpg	cmj8w100v0008prxy26wvrzov
cmj8w1012000bprxyyhzjg5tr	/images/product/6.jpg	cmj8w1011000aprxywas11zp6
cmj8w101h000dprxy6h0ewsw4	/images/product/7.jpg	cmj8w101h000cprxywy29xwpp
cmj8w101o000fprxybn6zwoa0	/images/product/8.jpg	cmj8w101o000eprxyleoer3yi
cmj8w101u000hprxybhvg7nan	/images/product/9.jpg	cmj8w101u000gprxy9nqhz0ut
cmj8w102d000jprxygyolgvgd	/images/product/10.jpg	cmj8w102d000iprxydkxll6yy
cmj8w102l000lprxylpvsks05	/images/product/11.jpg	cmj8w102l000kprxy5fdinjwd
cmj8w102p000nprxyfah9fesb	/images/product/12.jpg	cmj8w102p000mprxyy0s3onau
cmj8w102r000pprxysvab18sj	/images/product/13.jpg	cmj8w102r000oprxyinf1qpb4
cmj8w102v000rprxyabi1vpo3	/images/product/14.jpg	cmj8w102v000qprxyxfmm8jxs
cmj8w102y000tprxy50dd2uf4	/images/product/15.jpg	cmj8w102y000sprxygnq54w0r
cmj8w1031000vprxykuv14vcg	/images/product/16.jpg	cmj8w1031000uprxy7vh9n9d6
cmj8w1033000xprxybphg20rl	/images/product/17.jpg	cmj8w1033000wprxy4w55k3ve
cmj8w1036000zprxyhdosyp9x	/images/product/18.jpg	cmj8w1036000yprxy2fyzfqor
cmj8w10390011prxyj5rh4xkq	/images/product/19.jpg	cmj8w10390010prxyxmycdh4c
cmj8w103c0013prxy4mv7rzn4	/images/product/20.jpg	cmj8w103c0012prxy17kkex47
\.


--
-- Data for Name: Order; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Order" (id, "userId", status, total, "createdAt") FROM stdin;
\.


--
-- Data for Name: OrderItem; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."OrderItem" (id, "orderId", "productId", quantity, price) FROM stdin;
\.


--
-- Data for Name: Product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Product" (id, "legacyId", categoria, nombre, genero, nuevo, oferta, precio, precio_original, marca, vendido, cantidad, descripcion, accion, slug, fecha_de_creacion, fecha_de_actualziacion) FROM stdin;
cmj8w100f0002prxylraete5v	2	juguetes	Juguete Ratón para Gato	cat	f	f	6.00	6.00	petplay	52	200	Juguete ratón para gatos. Perfecto para estimular el instinto de caza.	add to cart	juguete-raton-gato	2025-12-16 17:59:58.287	2025-12-16 17:59:58.287
cmj8w100l0004prxytzlisi3y	3	juguetes	Pelota con Cuerda para Gato	cat	t	t	7.00	10.00	petplay	38	180	Juguete de pelota con cuerdas para gatos. Colorido e interactivo.	quick shop	pelota-cuerda-gato	2025-12-16 17:59:58.293	2025-12-16 17:59:58.293
cmj8w100r0006prxy5ohxxt20	4	comida para perros	Premios Suaves para Perro	dog	t	f	20.00	20.00	american	24	100	Premios suaves y deliciosos para perros. Elaborados con ingredientes naturales.	quick shop	premios-suaves-perro	2025-12-16 17:59:58.299	2025-12-16 17:59:58.299
cmj8w100v0008prxy26wvrzov	5	comida para perros	Alimento Premium Royal Canin	dog	f	f	25.00	25.00	royal	18	100	Alimento premium para perros adultos. Nutrición completa y equilibrada.	quick shop	alimento-royal-canin	2025-12-16 17:59:58.303	2025-12-16 17:59:58.303
cmj8w1011000aprxywas11zp6	6	comida para perros	Comida Natural Milo Kitchen	dog	t	f	20.00	20.00	american	24	100	Comida natural para perros con ingredientes frescos de cocina.	quick shop	comida-natural-milo	2025-12-16 17:59:58.31	2025-12-16 17:59:58.31
cmj8w101h000cprxywy29xwpp	7	comida para gatos	Alimento Saludable Beneful	cat	f	f	16.00	16.00	purina	16	80	Alimento saludable para gatos. Nutrientes esenciales para salud óptima.	quick shop	alimento-beneful-gato	2025-12-16 17:59:58.325	2025-12-16 17:59:58.325
cmj8w101o000eprxyleoer3yi	8	comida para gatos	Premios Premium para Gato	cat	t	f	16.00	16.00	purina	16	80	Premios premium para gatos con sabor a salmón.	add to cart	premios-premium-gato	2025-12-16 17:59:58.332	2025-12-16 17:59:58.332
cmj8w101u000gprxy9nqhz0ut	9	camas	Cama Acogedora para Perro	dog	f	f	99.00	99.00	bedpet	12	40	Cama cómoda y acogedora para perros. Perfecta para descanso.	add to cart	cama-acogedora-perro	2025-12-16 17:59:58.338	2025-12-16 17:59:58.338
cmj8w102d000iprxydkxll6yy	10	camas	Cama Deluxe para Perro	dog	t	f	104.00	104.00	bedpet	12	40	Cama de lujo para perros con material premium.	add to cart	cama-deluxe-perro	2025-12-16 17:59:58.357	2025-12-16 17:59:58.357
cmj8w102l000kprxy5fdinjwd	11	camas	Cama Suave para Gato	cat	f	f	129.00	129.00	bedpet	12	40	Cama suave y acogedora para gatos. Material hipoalergénico.	add to cart	cama-suave-gato	2025-12-16 17:59:58.366	2025-12-16 17:59:58.366
cmj8w102p000mprxyy0s3onau	12	camas	Cama Elevada para Gato	cat	t	t	85.00	110.00	bedpet	28	50	Cama elevada para gatos con vista privilegiada.	add to cart	cama-elevada-gato	2025-12-16 17:59:58.369	2025-12-16 17:59:58.369
cmj8w102r000oprxyinf1qpb4	13	accesorios	Correa para Perro	dog	t	f	12.00	12.00	petgear	33	100	Correa resistente para perros. Cómoda de sostener.	add to cart	correa-perro	2025-12-16 17:59:58.372	2025-12-16 17:59:58.372
cmj8w102v000qprxyxfmm8jxs	14	accesorios	Collar de Cuero para Perro	dog	t	f	18.00	18.00	petgear	21	80	Collar de cuero resistente para perros. Estilo y comodidad.	add to cart	collar-cuero-perro	2025-12-16 17:59:58.375	2025-12-16 17:59:58.375
cmj8w102y000sprxygnq54w0r	15	accesorios	Arnés Ajustable para Perro	dog	t	f	22.00	22.00	petgear	19	75	Arnés ajustable y seguro para perros. Máxima comodidad.	add to cart	arnes-ajustable-perro	2025-12-16 17:59:58.378	2025-12-16 17:59:58.378
cmj8w1031000uprxy7vh9n9d6	16	comederos	Comedero Acero Inoxidable	dog	f	f	14.00	14.00	petgear	28	120	Comedero de acero inoxidable para perros. Duradero y fácil de limpiar.	add to cart	comedero-acero-perro	2025-12-16 17:59:58.381	2025-12-16 17:59:58.381
cmj8w1033000wprxy4w55k3ve	17	comederos	Set Comederos de Cerámica	cat	t	f	12.00	12.00	petgear	35	90	Set de comederos de cerámica para gatos. Elegante y seguro.	add to cart	comederos-ceramica-gato	2025-12-16 17:59:58.384	2025-12-16 17:59:58.384
cmj8w1036000yprxy2fyzfqor	18	cuidado	Cepillo de Aseo para Perro	dog	f	f	11.00	11.00	petcare	38	110	Cepillo de aseo para perros. Mantiene el pelaje limpio y brillante.	quick shop	cepillo-aseo-perro	2025-12-16 17:59:58.387	2025-12-16 17:59:58.387
cmj8w10390010prxyxmycdh4c	19	cuidado	Champú Natural para Perro	dog	f	f	13.00	13.00	petcare	42	130	Champú natural para perros. Suave con la piel.	quick shop	champu-natural-perro	2025-12-16 17:59:58.389	2025-12-16 17:59:58.389
cmj8w103c0012prxy17kkex47	20	accesorios	Abrigo Forrado para Perro	dog	f	t	129.00	140.00	petoutfit	24	80	Abrigo forrado de pelusa para perros. Cálido y elegante.	add to cart	abrigo-forrado-perro	2025-12-16 17:59:58.393	2025-12-16 17:59:58.393
cmj8w10070000prxy5mj60yfy	1	juguetes	Pelota para Perro 3	dog	t	f	8.00	8.00	petplay	45	150	Juguete de pelota duradera para perros. Ideal para juego y entretenimiento.	quick shop	pelota-perro	2025-12-16 17:59:58.28	2025-12-16 17:59:58.28
\.


--
-- Data for Name: User; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."User" (id, email, name, password, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: Variation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Variation" (id, color, "colorCode", "colorImage", image, "productId") FROM stdin;
\.


--
-- Name: Image Image_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Image"
    ADD CONSTRAINT "Image_pkey" PRIMARY KEY (id);


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
-- Name: Product Product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Product"
    ADD CONSTRAINT "Product_pkey" PRIMARY KEY (id);


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
-- Name: Product_legacyId_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "Product_legacyId_key" ON public."Product" USING btree ("legacyId");


--
-- Name: Product_slug_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "Product_slug_key" ON public."Product" USING btree (slug);


--
-- Name: User_email_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "User_email_key" ON public."User" USING btree (email);


--
-- Name: Image Image_productId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Image"
    ADD CONSTRAINT "Image_productId_fkey" FOREIGN KEY ("productId") REFERENCES public."Product"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: OrderItem OrderItem_orderId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."OrderItem"
    ADD CONSTRAINT "OrderItem_orderId_fkey" FOREIGN KEY ("orderId") REFERENCES public."Order"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: OrderItem OrderItem_productId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."OrderItem"
    ADD CONSTRAINT "OrderItem_productId_fkey" FOREIGN KEY ("productId") REFERENCES public."Product"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Order Order_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Order"
    ADD CONSTRAINT "Order_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Variation Variation_productId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Variation"
    ADD CONSTRAINT "Variation_productId_fkey" FOREIGN KEY ("productId") REFERENCES public."Product"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- PostgreSQL database dump complete
--

\unrestrict g5fFtS59ICbxbvpiYWtmZ3sO4rnaCNZu09wuShK9fHeYqFoQ93Rla4pybakeFk5

