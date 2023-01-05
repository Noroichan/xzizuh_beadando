INSERT INTO skills_of_characters
  (id
  ,character_id
  ,skill_id)
VALUES
  (skills_of_characters_seq.nextval
  ,1
  ,3);
INSERT INTO skills_of_characters
  (id
  ,character_id
  ,skill_id)
VALUES
  (skills_of_characters_seq.nextval
  ,1
  ,4);
INSERT INTO skills_of_characters
  (id
  ,character_id
  ,skill_id)
VALUES
  (skills_of_characters_seq.nextval
  ,1
  ,6);
INSERT INTO skills_of_characters
  (id
  ,character_id
  ,skill_id)
VALUES
  (skills_of_characters_seq.nextval
  ,2
  ,2);
INSERT INTO skills_of_characters
  (id
  ,character_id
  ,skill_id)
VALUES
  (skills_of_characters_seq.nextval
  ,2
  ,5);
INSERT INTO skills_of_characters
  (id
  ,character_id
  ,skill_id)
VALUES
  (skills_of_characters_seq.nextval
  ,2
  ,6);
INSERT INTO skills_of_characters
  (id
  ,character_id
  ,skill_id)
VALUES
  (skills_of_characters_seq.nextval
  ,3
  ,1);
INSERT INTO skills_of_characters
  (id
  ,character_id
  ,skill_id)
VALUES
  (skills_of_characters_seq.nextval
  ,3
  ,3);
INSERT INTO skills_of_characters
  (id
  ,character_id
  ,skill_id)
VALUES
  (skills_of_characters_seq.nextval
  ,3
  ,7);

-- véglegesítés
COMMIT;

-- test
SELECT * FROM skills_of_characters;
