CREATE TABLE characters(
       id NUMBER PRIMARY KEY,
       nev VARCHAR2(40 CHAR) NOT NULL,
       race_id NUMBER NOT NULL,
       cast_id NUMBER NOT NULL,
       religion_id NUMBER NOT NULL,
       health NUMBER NOT NULL,
       evasion NUMBER NOT NULL,
       mana NUMBER NOT NULL,
       speed NUMBER NOT NULL,
       attack VARCHAR2(3 CHAR) NOT NULL,
       aim VARCHAR2(3 CHAR) NOT NULL,
       stealth VARCHAR(3 CHAR) NOT NULL,
       luck VARCHAR(3 CHAR) NOT NULL
);

COMMENT ON TABLE characters IS 'Karakterek �s azok attrib�tumai';
COMMENT ON COLUMN characters.id IS 'Karakterek azonos�t�ja';
COMMENT ON COLUMN characters.race_id IS 'Rassz azonos�t�ja';
COMMENT ON COLUMN characters.cast_id IS 'Cast azonos�t�ja';
COMMENT ON COLUMN characters.religion_id IS 'Vall�s azonos�t�ja';
COMMENT ON COLUMN characters.attack IS 'Milyen kock�val kell dobni a t�mad�s erej�hez';
COMMENT ON COLUMN characters.aim IS 'Milyen kock�val kell dobni valamilyen t�vols�gi t�mad�s tal�lat�hoz';
COMMENT ON COLUMN characters.stealth IS 'Milyen kock�val kell dobni egy lopakod�s sikeress�g�hez';
COMMENT ON COLUMN characters.luck IS 'Milyen kock�val kell dobni egy szerencse alap� esem�nyhez';
