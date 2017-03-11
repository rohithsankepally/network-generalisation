DROP TABLE IF EXISTS contracted_ways;
DROP TABLE IF EXISTS contracted_ways_vertices_pgr;
DROP TABLE IF EXISTS cleaned_ways;
DROP TABLE IF EXISTS cleaned_ways_vertices_pgr;
DROP TABLE IF EXISTS contraction_results;

--The table used to store edge data after cleaning
CREATE TABLE cleaned_ways(
	id BIGINT PRIMARY KEY,
	source BIGINT,
	target BIGINT,
	x1 DOUBLE PRECISION,
	y1 DOUBLE PRECISION,
	x2 DOUBLE PRECISION, 
	y2 DOUBLE PRECISION,
	cost DOUBLE PRECISION,
	reverse_cost DOUBLE PRECISION,
	betweenness BIGINT DEFAULT 0,
	is_contracted BOOLEAN DEFAULT FALSE
);

--The table used to store vertex data after cleaning
CREATE TABLE cleaned_ways_vertices_pgr(
	id BIGINT PRIMARY KEY,
	lon BIGINT,
	lat BIGINT,
	is_contracted BOOLEAN DEFAULT FALSE
);

SELECT AddGeometryColumn('cleaned_ways', 'the_geom', 4326, 'LINESTRING', 2 );
SELECT AddGeometryColumn('cleaned_ways_vertices_pgr', 'the_geom', 4326, 'POINT', 2 );

--Views used to store the contracted graph
--CREATE VIEW contracted_ways AS SELECT id, source, target, cost, reverse_cost, the_geom  FROM cleaned_ways WHERE is_contracted = FALSE;
--CREATE VIEW contracted_ways_vertices_pgr AS SELECT * FROM cleaned_ways_vertices_pgr WHERE is_contracted = FALSE;
