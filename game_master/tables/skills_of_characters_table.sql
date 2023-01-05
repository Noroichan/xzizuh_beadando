CREATE TABLE skills_of_characters(
       id NUMBER PRIMARY KEY,
       character_id NUMBER NOT NULL,
       skill_id NUMBER NOT NULL
);

COMMENT ON TABLE skills_of_characters IS 'Képesség-karakter összerendelések';
COMMENT ON COLUMN skills_of_characters.id IS 'Összerendelések azonosítója';
COMMENT ON COLUMN skills_of_characters.character_id IS 'Karakterek azonosítója';
COMMENT ON COLUMN skills_of_characters.skill_id IS 'Képességek azonosítója';
