CREATE OR REPLACE VIEW vw_characters_number_of_skills AS
SELECT c.id
      ,c.nev
      ,COUNT(soc.skill_id) AS number_of_skills
  FROM characters c
  LEFT JOIN skills_of_characters soc
    ON c.id = soc.character_id
 GROUP BY c.id, c.nev;
