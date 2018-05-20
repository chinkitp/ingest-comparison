CREATE DATABASE graph;

\c graph;



CREATE TABLE allnodes
(
    ID CHAR(50)     NOT NULL,
    DATA  jsonb  NOT NULL
);

CREATE TABLE alledges
(
    ID CHAR(50)     NOT NULL,
    DATA  jsonb  NOT NULL
);