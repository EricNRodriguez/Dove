CREATE EXTENSION postgis;
CREATE EXTENSION postgis_topology;
CREATE EXTENSION postgis_sfcgal;
CREATE EXTENSION fuzzystrmatch;
CREATE EXTENSION address_standardizer;
CREATE EXTENSION address_standardizer_data_us;
CREATE EXTENSION postgis_tiger_geocoder;
CREATE EXTENSION pgrouting;
CREATE EXTENSION ogr_fdw;

grant all on schema postgis to USERNAME;

CREATE TABLE IF NOT EXISTS "user" (
	user_id serial PRIMARY KEY,
	username TEXT UNIQUE NOT NULL,
	password TEXT NOT NULL,
	about TEXT NOT NULL DEFAULT '',
	image_path TEXT NOT NULL DEFAULT '',
	created_at BIGINT NOT NULL -- posix time
);

CREATE TABLE IF NOT EXISTS feature_point (
    feature_point_id SERIAL PRIMARY KEY UNIQUE,
    title TEXT NOT NULL,
    description TEXT NOT NULL,
    location geometry(point, 4326) NOT NULL,
    owner_id INT NOT NULL REFERENCES "user"(user_id) ON DELETE CASCADE,
    created_at BIGINT NOT NULL -- posix time
);

CREATE TABLE IF NOT EXISTS feature_point_image_metadata (
    image_id SERIAL PRIMARY KEY UNIQUE,
    feature_point_id INT NOT NULL REFERENCES feature_point(feature_point_id) ON DELETE CASCADE,
    path TEXT NOT NULL, -- storage path on the image store
    created_at BIGINT NOT NULL -- posix time
);