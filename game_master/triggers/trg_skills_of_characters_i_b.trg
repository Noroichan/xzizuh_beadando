CREATE OR REPLACE TRIGGER trg_skills_of_characters_i_b
  BEFORE INSERT ON skills_of_characters
  FOR EACH ROW
BEGIN
  IF inserting
  THEN
    IF :new.id IS NULL
    THEN
      :new.id := skills_of_characters_seq.nextval;
    END IF;
  END IF;
END trg_skills_of_characters_i_b;
/
