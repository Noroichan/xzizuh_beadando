CREATE TABLE effects(
       id NUMBER PRIMARY KEY,
       nev VARCHAR2(40 CHAR) NOT NULL,
       damage_per_rounds NUMBER NOT NULL,
       leiras VARCHAR2(4000 CHAR) NOT NULL
);

COMMENT ON TABLE effects IS 'Effektek �s azok le�r�sai';
COMMENT ON COLUMN effects.id IS 'Effektek azonos�t�ja';
