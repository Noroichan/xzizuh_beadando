CREATE TABLE religions(
       id NUMBER PRIMARY KEY,
       nev VARCHAR2(40 CHAR) NOT NULL,
       leiras VARCHAR2(4000 CHAR) NOT NULL
);

COMMENT ON TABLE religions IS 'Vall�sok �s az azok le�r�sa';
COMMENT ON COLUMN religions.id IS 'Vall�sok azonos�t�ja';
