CREATE TABLE IF NOT EXISTS warehouse.dim_agency
(
    agency_id integer NOT NULL,
    agency_name character varying(150),
    agency_type character varying(15),
    agency_country_cd character(2),
    agency_abbreviation character varying(15),
    agency_desc character varying,
    agency_administrator character varying(70),
    agency_founding_year integer,
    agency_logo_url character varying,
    load_ts timestamp without time zone,
    PRIMARY KEY (agency_id)
);
