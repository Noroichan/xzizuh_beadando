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

COMMENT ON TABLE characters IS 'Karakterek és azok attribútumai';
COMMENT ON COLUMN characters.id IS 'Karakterek azonosítója';
COMMENT ON COLUMN characters.race_id IS 'Rassz azonosítója';
COMMENT ON COLUMN characters.cast_id IS 'Cast azonosítója';
COMMENT ON COLUMN characters.religion_id IS 'Vallás azonosítója';
COMMENT ON COLUMN characters.attack IS 'Milyen kockával kell dobni a támadás erejéhez';
COMMENT ON COLUMN characters.aim IS 'Milyen kockával kell dobni valamilyen távolsági támadás találatához';
COMMENT ON COLUMN characters.stealth IS 'Milyen kockával kell dobni egy lopakodás sikerességéhez';
COMMENT ON COLUMN characters.luck IS 'Milyen kockával kell dobni egy szerencse alapú eseményhez';
