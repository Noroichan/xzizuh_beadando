CREATE TABLE religions(
       id NUMBER PRIMARY KEY,
       nev VARCHAR2(40 CHAR) NOT NULL,
       leiras VARCHAR2(4000 CHAR) NOT NULL
);

COMMENT ON TABLE religions IS 'Vallások és az azok leírása';
COMMENT ON COLUMN religions.id IS 'Vallások azonosítója';
