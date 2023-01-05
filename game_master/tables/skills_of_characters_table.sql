CREATE TABLE skills_of_characters(
       id NUMBER PRIMARY KEY,
       character_id NUMBER NOT NULL,
       skill_id NUMBER NOT NULL
);

COMMENT ON TABLE skills_of_characters IS 'K�pess�g-karakter �sszerendel�sek';
COMMENT ON COLUMN skills_of_characters.id IS '�sszerendel�sek azonos�t�ja';
COMMENT ON COLUMN skills_of_characters.character_id IS 'Karakterek azonos�t�ja';
COMMENT ON COLUMN skills_of_characters.skill_id IS 'K�pess�gek azonos�t�ja';
