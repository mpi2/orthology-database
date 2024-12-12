--
-- PostgreSQL database dump
--

-- Dumped from database version 11.0 (Debian 11.0-1.pgdg90+2)
-- Dumped by pg_dump version 11.3

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

SET default_with_oids = false;

GRANT ALL ON schema public TO orthology_admin;

--
-- Name: hgnc_gene; Type: TABLE; Schema: public; Owner: orthology_admin
--

CREATE TABLE public.hgnc_gene (
    id bigint NOT NULL,
    human_gene_id bigint,
    agr_acc_id character varying(255),
    mane_select character varying(255),
    gencc character varying(255),
    alias_name text,
    alias_symbol character varying(255),
    bioparadigms_slc character varying(255),
    ccds_acc_id character varying(4096),
    cd character varying(255),
    cosmic character varying(255),
    date_approved_reserved timestamp without time zone,
    date_modified timestamp without time zone,
    date_name_changed timestamp without time zone,
    date_symbol_changed timestamp without time zone,
    ena character varying(255),
    ensembl_gene_acc_id character varying(255),
    entrez_acc_id bigint,
    enzyme_acc_id character varying(255),
    gene_group character varying(255),
    gene_group_acc_id character varying(255),
    gtrnadb character varying(255),
    hgnc_acc_id character varying(255),
    homeodb bigint,
    horde_acc_id character varying(255),
    imgt character varying(255),
    intermediate_filament_db character varying(255),
    iuphar character varying(255),
    kznf_gene_catalog bigint,
    lncipedia character varying(255),
    lncrnadb character varying(255),
    location character varying(255),
    location_sortable character varying(255),
    locus_group character varying(255),
    locus_type character varying(255),
    lsdb text,
    mamit_trnadb bigint,
    merops character varying(255),
    mgi_gene_acc_id character varying(1024),
    mirbase character varying(255),
    name character varying(255),
    omim_acc_id character varying(255),
    orphanet bigint,
    prev_name text,
    prev_symbol character varying(255),
    pseudogene_org character varying(255),
    pubmed_acc_id character varying(255),
    refseq_accession character varying(255),
    rgd_acc_id character varying(255),
    rna_central_id character varying(255),
    snornabase character varying(255),
    status character varying(255),
    symbol character varying(255),
    ucsc_acc_id character varying(255),
    uniprot_acc_ids character varying(255),
    vega_acc_id character varying(255)
);


ALTER TABLE public.hgnc_gene OWNER TO orthology_admin;

--
-- Name: hgnc_gene_id_seq; Type: SEQUENCE; Schema: public; Owner: orthology_admin
--

CREATE SEQUENCE public.hgnc_gene_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hgnc_gene_id_seq OWNER TO orthology_admin;

--
-- Name: hgnc_gene_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: orthology_admin
--

ALTER SEQUENCE public.hgnc_gene_id_seq OWNED BY public.hgnc_gene.id;

--
-- Name: hcop_tmp; Type: TABLE; Schema: public; Owner: orthology_admin
--



CREATE TABLE public.hcop_tmp (
    id bigint NOT NULL,
    hgnc_acc_id character varying(255),
    human_assert_acc_ids text,
    human_chr character varying(255),
    human_ensembl_gene_acc_id character varying(255),
    human_entrez_gene_acc_id bigint,
    human_name character varying(255),
    human_symbol character varying(255),
    mgi_gene_acc_id character varying(255),
    mouse_assert_acc_ids text,
    mouse_chr character varying(255),
    mouse_ensembl_gene_acc_id character varying(255),
    mouse_entrez_gene_acc_id bigint,
    mouse_name character varying(255),
    mouse_symbol character varying(255),
    support text
);


ALTER TABLE public.hcop_tmp OWNER TO orthology_admin;


--
-- Name: hcop_tmp_id_seq; Type: SEQUENCE; Schema: public; Owner: orthology_admin
--

CREATE SEQUENCE public.hcop_tmp_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hcop_tmp_id_seq OWNER TO orthology_admin;

--
-- Name: hcop_tmp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: orthology_admin
--

ALTER SEQUENCE public.hcop_tmp_id_seq OWNED BY public.hcop_tmp.id;


--
-- Name: hcop; Type: TABLE; Schema: public; Owner: orthology_admin
--

CREATE TABLE public.hcop (
    id bigint NOT NULL,
    mouse_gene_id bigint,
    human_gene_id bigint,
    hgnc_acc_id character varying(255),
    human_assert_acc_ids text,
    human_chr character varying(255),
    human_ensembl_gene_acc_id character varying(255),
    human_entrez_gene_acc_id bigint,
    human_name character varying(255),
    human_symbol character varying(255),
    mgi_gene_acc_id character varying(255),
    mouse_assert_acc_ids text,
    mouse_chr character varying(255),
    mouse_ensembl_gene_acc_id character varying(255),
    mouse_entrez_gene_acc_id bigint,
    mouse_name character varying(255),
    mouse_symbol character varying(255),
    support text
);


ALTER TABLE public.hcop OWNER TO orthology_admin;

--
-- Name: hcop_id_seq; Type: SEQUENCE; Schema: public; Owner: orthology_admin
--

CREATE SEQUENCE public.hcop_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hcop_id_seq OWNER TO orthology_admin;

--
-- Name: hcop_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: orthology_admin
--

ALTER SEQUENCE public.hcop_id_seq OWNED BY public.hcop.id;



--
-- Name: mgi_gene; Type: TABLE; Schema: public; Owner: orthology_admin
--

CREATE TABLE public.mgi_gene (
    id bigint NOT NULL,
    ensembl_chromosome character varying(255),
    ensembl_gene_acc_id character varying(255),
    ensembl_start bigint,
    ensembl_stop bigint,
    ensembl_strand character varying(255),
    entrez_gene_acc_id bigint,
    genome_build character varying(255),
    mgi_gene_acc_id character varying(255),
    name character varying(255),
    ncbi_chromosome character varying(255),
    ncbi_start bigint,
    ncbi_stop bigint,
    ncbi_strand character varying(255),
    symbol character varying(255),
    type character varying(255)
);


ALTER TABLE public.mgi_gene OWNER TO orthology_admin;

--
-- Name: mgi_gene_id_seq; Type: SEQUENCE; Schema: public; Owner: orthology_admin
--

CREATE SEQUENCE public.mgi_gene_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mgi_gene_id_seq OWNER TO orthology_admin;

--
-- Name: mgi_gene_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: orthology_admin
--

ALTER SEQUENCE public.mgi_gene_id_seq OWNED BY public.mgi_gene.id;


--
-- Name: mgi_mrk_list2; Type: TABLE; Schema: public; Owner: orthology_admin
--

CREATE TABLE public.mgi_mrk_list2 (
    id bigint NOT NULL,
    cm character varying(255),
    chr character varying(255),
    feature_type character varying(255),
    marker_type character varying(255),
    mgi_marker_acc_id character varying(255),
    name character varying(255),
    start  bigint,
    status character varying(255),
    stop  bigint,
    strand character varying(255),
    symbol character varying(255),
    synonyms text
);


ALTER TABLE public.mgi_mrk_list2 OWNER TO orthology_admin;

--
-- Name: mgi_mrk_list2_id_seq; Type: SEQUENCE; Schema: public; Owner: orthology_admin
--

CREATE SEQUENCE public.mgi_mrk_list2_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mgi_mrk_list2_id_seq OWNER TO orthology_admin;

--
-- Name: mgi_mrk_list2_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: orthology_admin
--

ALTER SEQUENCE public.mgi_mrk_list2_id_seq OWNED BY public.mgi_mrk_list2.id;



--
-- Name: mouse_gene; Type: TABLE; Schema: public; Owner: orthology_admin
--

CREATE TABLE public.mouse_gene (
    id bigint NOT NULL,
    ensembl_chromosome character varying(255),
    ensembl_gene_acc_id character varying(255),
    ensembl_start bigint,
    ensembl_stop bigint,
    ensembl_strand character varying(255),
    entrez_gene_acc_id bigint,
    genome_build character varying(255),
    mgi_gene_acc_id character varying(255),
    name text,
    mgi_cm character varying(255),
    mgi_chromosome character varying(255),
    mgi_start bigint,
    mgi_stop bigint,
    mgi_strand character varying(255),
    ncbi_chromosome character varying(255),
    ncbi_start bigint,
    ncbi_stop bigint,
    ncbi_strand character varying(255),
    symbol character varying(255),
    type character varying(255),
    subtype character varying(255)
);


ALTER TABLE public.mouse_gene OWNER TO orthology_admin;

--
-- Name: mouse_gene_id_seq; Type: SEQUENCE; Schema: public; Owner: orthology_admin
--

CREATE SEQUENCE public.mouse_gene_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mouse_gene_id_seq OWNER TO orthology_admin;

--
-- Name: mouse_gene_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: orthology_admin
--

ALTER SEQUENCE public.mouse_gene_id_seq OWNED BY public.mouse_gene.id;


--
-- Name: mouse_gene_synonym; Type: TABLE; Schema: public; Owner: orthology_admin
--

CREATE TABLE public.mouse_gene_synonym (
    id bigint NOT NULL,
    mgi_gene_acc_id character varying(255),
    synonym character varying(255)
);


ALTER TABLE public.mouse_gene_synonym OWNER TO orthology_admin;

--
-- Name: mouse_gene_synonym_id_seq; Type: SEQUENCE; Schema: public; Owner: orthology_admin
--

CREATE SEQUENCE public.mouse_gene_synonym_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mouse_gene_synonym_id_seq OWNER TO orthology_admin;

--
-- Name: mouse_gene_synonym_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: orthology_admin
--

ALTER SEQUENCE public.mouse_gene_synonym_id_seq OWNED BY public.mouse_gene_synonym.id;


--
-- Name: mouse_gene_synonym_relation; Type: TABLE; Schema: public; Owner: orthology_admin
--

CREATE TABLE public.mouse_gene_synonym_relation (
    mouse_gene_id bigint NOT NULL,
    mouse_gene_synonym_id bigint NOT NULL
);


ALTER TABLE public.mouse_gene_synonym_relation OWNER TO orthology_admin;




--
-- Name: mouse_mapping_filter; Type: TABLE; Schema: public; Owner: orthology_admin
--

CREATE TABLE public.mouse_mapping_filter (
    id bigint NOT NULL,
    mouse_gene_id bigint,
    support_count_threshold bigint,
    orthologs_above_threshold bigint,
    category_for_threshold character varying(255)
);


ALTER TABLE public.mouse_mapping_filter OWNER TO orthology_admin;

--
-- Name: mouse_mapping_filter_id_seq; Type: SEQUENCE; Schema: public; Owner: orthology_admin
--

CREATE SEQUENCE public.mouse_mapping_filter_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mouse_mapping_filter_id_seq OWNER TO orthology_admin;

--
-- Name: mouse_mapping_filter_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: orthology_admin
--

ALTER SEQUENCE public.mouse_mapping_filter_id_seq OWNED BY public.mouse_mapping_filter.id;











--
-- Name: human_gene; Type: TABLE; Schema: public; Owner: orthology_admin
--

CREATE TABLE public.human_gene (
    id bigint NOT NULL,
    hgnc_acc_id character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    symbol character varying(255) NOT NULL,
    ensembl_gene_acc_id character varying(255),
    entrez_gene_acc_id bigint
);


ALTER TABLE public.human_gene OWNER TO orthology_admin;

--
-- Name: human_gene_id_seq; Type: SEQUENCE; Schema: public; Owner: orthology_admin
--

CREATE SEQUENCE public.human_gene_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.human_gene_id_seq OWNER TO orthology_admin;

--
-- Name: human_gene_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: orthology_admin
--

ALTER SEQUENCE public.human_gene_id_seq OWNED BY public.human_gene.id;




--
-- Name: human_mapping_filter; Type: TABLE; Schema: public; Owner: orthology_admin
--

CREATE TABLE public.human_mapping_filter (
    id bigint NOT NULL,
    human_gene_id bigint,
    support_count_threshold bigint,
    orthologs_above_threshold bigint,
    category_for_threshold character varying(255)
);


ALTER TABLE public.human_mapping_filter OWNER TO orthology_admin;

--
-- Name: human_mapping_filter_id_seq; Type: SEQUENCE; Schema: public; Owner: orthology_admin
--

CREATE SEQUENCE public.human_mapping_filter_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.human_mapping_filter_id_seq OWNER TO orthology_admin;

--
-- Name: human_mapping_filter_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: orthology_admin
--

ALTER SEQUENCE public.human_mapping_filter_id_seq OWNED BY public.human_mapping_filter.id;



--
-- Name: human_gene_synonym; Type: TABLE; Schema: public; Owner: orthology_admin
--

CREATE TABLE public.human_gene_synonym (
    id bigint NOT NULL,
    hgnc_acc_id character varying(255),
    synonym character varying(255)
);


ALTER TABLE public.human_gene_synonym OWNER TO orthology_admin;

--
-- Name: human_gene_synonym_id_seq; Type: SEQUENCE; Schema: public; Owner: orthology_admin
--

CREATE SEQUENCE public.human_gene_synonym_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.human_gene_synonym_id_seq OWNER TO orthology_admin;

--
-- Name: human_gene_synonym_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: orthology_admin
--

ALTER SEQUENCE public.human_gene_synonym_id_seq OWNED BY public.human_gene_synonym.id;


--
-- Name: human_gene_synonym_relation; Type: TABLE; Schema: public; Owner: orthology_admin
--

CREATE TABLE public.human_gene_synonym_relation (
    human_gene_id bigint NOT NULL,
    human_gene_synonym_id bigint NOT NULL
);


ALTER TABLE public.human_gene_synonym_relation OWNER TO orthology_admin;

--
-- Name: ortholog; Type: TABLE; Schema: public; Owner: orthology_admin
--

CREATE TABLE public.ortholog (
    id bigint NOT NULL,
    support character varying(255) NOT NULL,
    support_raw text NOT NULL,
    support_count bigint NOT NULL,
    category character varying(255),
    human_gene_id bigint NOT NULL,
    mouse_gene_id bigint NOT NULL,
    is_max_human_to_mouse character varying(255),
    is_max_mouse_to_human character varying(255)    
);


ALTER TABLE public.ortholog OWNER TO orthology_admin;


--
-- Name: ortholog_id_seq; Type: SEQUENCE; Schema: public; Owner: orthology_admin
--

CREATE SEQUENCE public.ortholog_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ortholog_id_seq OWNER TO orthology_admin;

--
-- Name: ortholog_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: orthology_admin
--

ALTER SEQUENCE public.ortholog_id_seq OWNED BY public.ortholog.id;









--
-- Name: hcop_tmp id; Type: DEFAULT; Schema: public; Owner: orthology_admin
--

ALTER TABLE ONLY public.hcop_tmp ALTER COLUMN id SET DEFAULT nextval('public.hcop_tmp_id_seq'::regclass);


--
-- Name: hcop id; Type: DEFAULT; Schema: public; Owner: orthology_admin
--

ALTER TABLE ONLY public.hcop ALTER COLUMN id SET DEFAULT nextval('public.hcop_id_seq'::regclass);




--
-- Name: hgnc_gene id; Type: DEFAULT; Schema: public; Owner: orthology_admin
--

ALTER TABLE ONLY public.hgnc_gene ALTER COLUMN id SET DEFAULT nextval('public.hgnc_gene_id_seq'::regclass);
--
-- Name: human_gene id; Type: DEFAULT; Schema: public; Owner: orthology_admin
--

ALTER TABLE ONLY public.human_gene ALTER COLUMN id SET DEFAULT nextval('public.human_gene_id_seq'::regclass);


--
-- Name: human_mapping_filter id; Type: DEFAULT; Schema: public; Owner: orthology_admin
--

ALTER TABLE ONLY public.human_mapping_filter ALTER COLUMN id SET DEFAULT nextval('public.human_mapping_filter_id_seq'::regclass);


--
-- Name: human_gene_synonym id; Type: DEFAULT; Schema: public; Owner: orthology_admin
--

ALTER TABLE ONLY public.human_gene_synonym ALTER COLUMN id SET DEFAULT nextval('public.human_gene_synonym_id_seq'::regclass);



--
-- Name: mgi_gene id; Type: DEFAULT; Schema: public; Owner: orthology_admin
--

ALTER TABLE ONLY public.mgi_gene ALTER COLUMN id SET DEFAULT nextval('public.mgi_gene_id_seq'::regclass);


--
-- Name: mgi_mrk_list2 id; Type: DEFAULT; Schema: public; Owner: orthology_admin
--

ALTER TABLE ONLY public.mgi_mrk_list2 ALTER COLUMN id SET DEFAULT nextval('public.mgi_mrk_list2_id_seq'::regclass);


--
-- Name: mouse_gene id; Type: DEFAULT; Schema: public; Owner: orthology_admin
--

ALTER TABLE ONLY public.mouse_gene ALTER COLUMN id SET DEFAULT nextval('public.mouse_gene_id_seq'::regclass);


--
-- Name: mouse_gene_synonym id; Type: DEFAULT; Schema: public; Owner: orthology_admin
--

ALTER TABLE ONLY public.mouse_gene_synonym ALTER COLUMN id SET DEFAULT nextval('public.mouse_gene_synonym_id_seq'::regclass);


--
-- Name: mouse_mapping_filter id; Type: DEFAULT; Schema: public; Owner: orthology_admin
--

ALTER TABLE ONLY public.mouse_mapping_filter ALTER COLUMN id SET DEFAULT nextval('public.mouse_mapping_filter_id_seq'::regclass);



--
-- Name: ortholog id; Type: DEFAULT; Schema: public; Owner: orthology_admin
--

ALTER TABLE ONLY public.ortholog ALTER COLUMN id SET DEFAULT nextval('public.ortholog_id_seq'::regclass);





--
-- Name: hcop_tmp hcop_tmp_pkey; Type: CONSTRAINT; Schema: public; Owner: orthology_admin
--

ALTER TABLE ONLY public.hcop_tmp
    ADD CONSTRAINT hcop_tmp_pkey PRIMARY KEY (id);


--
-- Name: hcop hcop_pkey; Type: CONSTRAINT; Schema: public; Owner: orthology_admin
--

ALTER TABLE ONLY public.hcop
    ADD CONSTRAINT hcop_pkey PRIMARY KEY (id);




--
-- Name: hgnc_gene hgnc_gene_pkey; Type: CONSTRAINT; Schema: public; Owner: orthology_admin
--

ALTER TABLE ONLY public.hgnc_gene
    ADD CONSTRAINT hgnc_gene_pkey PRIMARY KEY (id);



--
-- Name: human_gene human_gene_pkey; Type: CONSTRAINT; Schema: public; Owner: orthology_admin
--

ALTER TABLE ONLY public.human_gene
    ADD CONSTRAINT human_gene_pkey PRIMARY KEY (id);


--
-- Name: human_mapping_filter human_mapping_filter_pkey; Type: CONSTRAINT; Schema: public; Owner: orthology_admin
--

ALTER TABLE ONLY public.human_mapping_filter
    ADD CONSTRAINT human_mapping_filter_pkey PRIMARY KEY (id);


--
-- Name: human_gene_synonym human_gene_synonym_pkey; Type: CONSTRAINT; Schema: public; Owner: orthology_admin
--

ALTER TABLE ONLY public.human_gene_synonym
    ADD CONSTRAINT human_gene_synonym_pkey PRIMARY KEY (id);


--
-- Name: human_gene_synonym_relation human_gene_synonym_relation_pkey; Type: CONSTRAINT; Schema: public; Owner: orthology_admin
--

ALTER TABLE ONLY public.human_gene_synonym_relation
    ADD CONSTRAINT human_gene_synonym_relation_pkey PRIMARY KEY (human_gene_id, human_gene_synonym_id);





--
-- Name: mgi_gene mgi_gene_pkey; Type: CONSTRAINT; Schema: public; Owner: orthology_admin
--

ALTER TABLE ONLY public.mgi_gene
    ADD CONSTRAINT mgi_gene_pkey PRIMARY KEY (id);


--
-- Name: mgi_mrk_list2 mgi_mrk_list2_pkey; Type: CONSTRAINT; Schema: public; Owner: orthology_admin
--

ALTER TABLE ONLY public.mgi_mrk_list2
    ADD CONSTRAINT mgi_mrk_list2_pkey PRIMARY KEY (id);



--
-- Name: mouse_gene mouse_gene_pkey; Type: CONSTRAINT; Schema: public; Owner: orthology_admin
--

ALTER TABLE ONLY public.mouse_gene
    ADD CONSTRAINT mouse_gene_pkey PRIMARY KEY (id);


--
-- Name: mouse_mapping_filter mouse_mapping_filter_pkey; Type: CONSTRAINT; Schema: public; Owner: orthology_admin
--

ALTER TABLE ONLY public.mouse_mapping_filter
    ADD CONSTRAINT mouse_mapping_filter_pkey PRIMARY KEY (id);


--
-- Name: mouse_gene_synonym mouse_gene_synonym_pkey; Type: CONSTRAINT; Schema: public; Owner: orthology_admin
--

ALTER TABLE ONLY public.mouse_gene_synonym
    ADD CONSTRAINT mouse_gene_synonym_pkey PRIMARY KEY (id);


--
-- Name: mouse_gene_synonym_relation mouse_gene_synonym_relation_pkey; Type: CONSTRAINT; Schema: public; Owner: orthology_admin
--

ALTER TABLE ONLY public.mouse_gene_synonym_relation
    ADD CONSTRAINT mouse_gene_synonym_relation_pkey PRIMARY KEY (mouse_gene_id, mouse_gene_synonym_id);




--
-- Name: ortholog ortholog_pkey; Type: CONSTRAINT; Schema: public; Owner: orthology_admin
--

ALTER TABLE ONLY public.ortholog
    ADD CONSTRAINT ortholog_pkey PRIMARY KEY (id);







--
-- Name: human_gene fk194i1het18j033e8a67r40g1; Type: FK CONSTRAINT; Schema: public; Owner: orthology_admin
--

ALTER TABLE ONLY public.hgnc_gene
    ADD CONSTRAINT fk194i1het18j033e8a67r40g1 FOREIGN KEY (human_gene_id) REFERENCES public.human_gene(id);



--
-- Name: hcop fk893i1het18j033e8a67r63t0; Type: FK CONSTRAINT; Schema: public; Owner: orthology_admin
--

ALTER TABLE ONLY public.hcop
    ADD CONSTRAINT fk893i1het18j033e8a67r63t0 FOREIGN KEY (human_gene_id) REFERENCES public.human_gene(id);





--
-- Name: hcop fk460i1het18j033e8a67r63i5; Type: FK CONSTRAINT; Schema: public; Owner: orthology_admin
--

ALTER TABLE ONLY public.hcop
    ADD CONSTRAINT fk460i1het18j033e8a67r63i5 FOREIGN KEY (mouse_gene_id) REFERENCES public.mouse_gene(id);



--
-- Name: human_gene_synonym_relation fk164i1het18j033e8a67r38j1; Type: FK CONSTRAINT; Schema: public; Owner: orthology_admin
--

ALTER TABLE ONLY public.human_gene_synonym_relation
    ADD CONSTRAINT fk164i1het18j033e8a67r38j1 FOREIGN KEY (human_gene_synonym_id) REFERENCES public.human_gene_synonym(id);



--
-- Name: human_gene_synonym_relation fk4veyu9qij3aukv51oei4cj0cc; Type: FK CONSTRAINT; Schema: public; Owner: orthology_admin
--

ALTER TABLE ONLY public.human_gene_synonym_relation
    ADD CONSTRAINT fk4veyu9qij3aukv51oei4cj0cc FOREIGN KEY (human_gene_id) REFERENCES public.human_gene(id);



--
-- Name: human_mapping_filter fk7eohu2qia8aukv51oei4ck2us; Type: FK CONSTRAINT; Schema: public; Owner: orthology_admin
--

ALTER TABLE ONLY public.human_mapping_filter
    ADD CONSTRAINT fk7eohu2qia8aukv51oei4ck2us FOREIGN KEY (human_gene_id) REFERENCES public.human_gene(id);





--
-- Name: mouse_gene_synonym_relation fkbq04orkw7wfwvjejgdb4bp1hx; Type: FK CONSTRAINT; Schema: public; Owner: orthology_admin
--

ALTER TABLE ONLY public.mouse_gene_synonym_relation
    ADD CONSTRAINT fkbq04orkw7wfwvjejgdb4bp1hx FOREIGN KEY (mouse_gene_synonym_id) REFERENCES public.mouse_gene_synonym(id);





--
-- Name: mouse_gene_synonym_relation fkhj32ev2dpo1oselyy6ymeq562; Type: FK CONSTRAINT; Schema: public; Owner: orthology_admin
--

ALTER TABLE ONLY public.mouse_gene_synonym_relation
    ADD CONSTRAINT fkhj32ev2dpo1oselyy6ymeq562 FOREIGN KEY (mouse_gene_id) REFERENCES public.mouse_gene(id);



--
-- Name: mouse_mapping_filter fkhj9wmb2dpowoselyy9ymeq271; Type: FK CONSTRAINT; Schema: public; Owner: orthology_admin
--

ALTER TABLE ONLY public.mouse_mapping_filter
    ADD CONSTRAINT fkhj9wmb2dpowoselyy9ymeq271 FOREIGN KEY (mouse_gene_id) REFERENCES public.mouse_gene(id);




--
-- Name: ortholog fksx4xwbhlgssh52ougho53kyty; Type: FK CONSTRAINT; Schema: public; Owner: orthology_admin
--

ALTER TABLE ONLY public.ortholog
    ADD CONSTRAINT fksx4xwbhlgssh52ougho53kyty FOREIGN KEY (mouse_gene_id) REFERENCES public.mouse_gene(id);



--
-- Name: ortholog fktgaxn9urr6pxq4spqllt8b36y; Type: FK CONSTRAINT; Schema: public; Owner: orthology_admin
--

ALTER TABLE ONLY public.ortholog
    ADD CONSTRAINT fktgaxn9urr6pxq4spqllt8b36y FOREIGN KEY (human_gene_id) REFERENCES public.human_gene(id);



-- 
-- Schema Search PATH
-- 

-- 
-- Need to specify the schema search path
-- The default is:
-- "$user", public
-- However this is causing an issue when specifying the SQL in the docker container.


SET search_path TO hdb_catalog, hdb_views, public;

-- 
-- TRIGGERS
-- 

CREATE OR REPLACE FUNCTION ortholog_category()
  RETURNS trigger AS
$$
BEGIN
IF NEW.support_count>=9 THEN
NEW.CATEGORY = 'GOOD';
ELSEIF  NEW.support_count>=5 AND NEW.support_count<9 THEN
NEW.CATEGORY = 'MODERATE';
ELSEIF NEW.support_count>=0 AND NEW.support_count<5 THEN
NEW.CATEGORY = 'LOW';
ELSE
NEW.CATEGORY = '';
END IF;
RETURN NEW;
END;
$$
LANGUAGE 'plpgsql';


ALTER FUNCTION ortholog_category OWNER TO orthology_admin;



CREATE TRIGGER ortholog_insert_trigger
    BEFORE INSERT ON "ortholog"
    FOR EACH ROW 
    EXECUTE PROCEDURE ortholog_category();


CREATE TRIGGER ortholog_update_trigger
    BEFORE UPDATE ON "ortholog"
    FOR EACH ROW 
    EXECUTE PROCEDURE ortholog_category();



-- 
-- Hasura user - Note only select granted on tables - i.e. read-only
-- 


-- We will create a separate user and grant permissions on hasura-specific
-- schemas and information_schema and pg_catalog
-- These permissions/grants are required for Hasura to work properly.

-- create a separate user for hasura
CREATE USER hasurauser WITH PASSWORD 'hasurauser';

-- create pgcrypto extension, required for UUID
CREATE EXTENSION IF NOT EXISTS pgcrypto;

-- create the schemas required by the hasura system
-- NOTE: If you are starting from scratch: drop the below schemas first, if they exist.
CREATE SCHEMA IF NOT EXISTS hdb_catalog;
CREATE SCHEMA IF NOT EXISTS hdb_views;

-- make the user an owner of system schemas
ALTER SCHEMA hdb_catalog OWNER TO hasurauser;
ALTER SCHEMA hdb_views OWNER TO hasurauser;

-- grant select permissions on information_schema and pg_catalog. This is
-- required for hasura to query list of available tables
GRANT SELECT ON ALL TABLES IN SCHEMA information_schema TO hasurauser;
GRANT SELECT ON ALL TABLES IN SCHEMA pg_catalog TO hasurauser;

-- Below permissions are optional. This is dependent on what access to your
-- tables/schemas - you want give to hasura. If you want expose the public
-- schema for GraphQL query then give permissions on public schema to the
-- hasura user.
-- Be careful to use these in your production db. Consult the postgres manual or
-- your DBA and give appropriate permissions.

-- grant all privileges on all tables in the public schema. This can be customised:
-- For example, if you only want to use GraphQL regular queries and not mutations,
-- then you can set: GRANT SELECT ON ALL TABLES...


REVOKE ALL ON SCHEMA public FROM hasurauser;

REVOKE CREATE ON SCHEMA public FROM PUBLIC;
REVOKE CREATE ON SCHEMA public FROM hasurauser;

GRANT SELECT ON ALL TABLES IN SCHEMA public TO hasurauser;
GRANT SELECT ON ALL SEQUENCES IN SCHEMA public TO hasurauser;
GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA public TO hasurauser;

-- 
-- Prevent Hasura from adding additional tables or triggers
-- Make sure run ALTER DEFAULT as hasurauser

ALTER DEFAULT PRIVILEGES FOR ROLE hasurauser REVOKE ALL PRIVILEGES ON TABLES FROM PUBLIC;
ALTER DEFAULT PRIVILEGES FOR ROLE hasurauser REVOKE ALL PRIVILEGES ON SEQUENCES FROM PUBLIC;
ALTER DEFAULT PRIVILEGES FOR ROLE hasurauser REVOKE ALL PRIVILEGES ON FUNCTIONS FROM PUBLIC;
ALTER DEFAULT PRIVILEGES FOR ROLE hasurauser REVOKE ALL PRIVILEGES ON ROUTINES FROM PUBLIC;
ALTER DEFAULT PRIVILEGES FOR ROLE hasurauser REVOKE ALL PRIVILEGES ON TYPES FROM PUBLIC;
ALTER DEFAULT PRIVILEGES FOR ROLE hasurauser REVOKE ALL PRIVILEGES ON SCHEMAS FROM PUBLIC;

ALTER DEFAULT PRIVILEGES FOR ROLE hasurauser REVOKE ALL PRIVILEGES ON TABLES FROM hasurauser;
ALTER DEFAULT PRIVILEGES FOR ROLE hasurauser REVOKE ALL PRIVILEGES ON SEQUENCES FROM hasurauser;
ALTER DEFAULT PRIVILEGES FOR ROLE hasurauser REVOKE ALL PRIVILEGES ON FUNCTIONS FROM hasurauser;
ALTER DEFAULT PRIVILEGES FOR ROLE hasurauser REVOKE ALL PRIVILEGES ON ROUTINES FROM hasurauser;
ALTER DEFAULT PRIVILEGES FOR ROLE hasurauser REVOKE ALL PRIVILEGES ON TYPES FROM hasurauser;
ALTER DEFAULT PRIVILEGES FOR ROLE hasurauser REVOKE ALL PRIVILEGES ON SCHEMAS FROM hasurauser;

-- Similarly add this for other schemas, if you have any.
-- GRANT USAGE ON SCHEMA <schema-name> TO hasurauser;
-- GRANT ALL ON ALL TABLES IN SCHEMA <schema-name> TO hasurauser;
-- GRANT ALL ON ALL SEQUENCES IN SCHEMA <schema-name> TO hasurauser;











