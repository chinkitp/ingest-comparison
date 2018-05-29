CREATE DATABASE graph;

\c graph;



CREATE TABLE allnodes
(
    Id CHAR(50)     NOT NULL,
    Data  json  NOT NULL
);

CREATE TABLE alledges
(
    Id CHAR(50)     NOT NULL,
    Source CHAR(50)     NOT NULL,
    Target CHAR(50)     NOT NULL,
    Data  json  NOT NULL
);