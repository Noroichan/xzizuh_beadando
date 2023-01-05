CREATE OR REPLACE TYPE ty_character_with_skills AS OBJECT
(
  id             NUMBER,
  character_name VARCHAR2(40),
  skill_list ty_skill_list_l,
  
  CONSTRUCTOR FUNCTION ty_character_with_skills RETURN SELF AS RESULT
)
/
CREATE OR REPLACE TYPE BODY ty_character_with_skills IS
  CONSTRUCTOR FUNCTION ty_character_with_skills RETURN SELF AS RESULT IS
  BEGIN
    RETURN;
  END;
END;
/
