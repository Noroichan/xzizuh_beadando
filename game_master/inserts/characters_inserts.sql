INSERT INTO characters
  (id
  ,nev
  ,race_id
  ,cast_id
  ,religion_id
  ,health
  ,evasion
  ,mana
  ,speed
  ,attack
  ,aim
  ,stealth
  ,luck)
VALUES
  (characters_seq.nextval
  ,'Gipsz Jakab'
  ,1
  ,1
  ,1
  ,15
  ,4
  ,12
  ,3
  ,'D8'
  ,'D4'
  ,'D4'
  ,'D20');
INSERT INTO characters
  (id
  ,nev
  ,race_id
  ,cast_id
  ,religion_id
  ,health
  ,evasion
  ,mana
  ,speed
  ,attack
  ,aim
  ,stealth
  ,luck)
VALUES
  (characters_seq.nextval
  ,'Alm�s Ildik�'
  ,1
  ,3
  ,3
  ,12
  ,6
  ,14
  ,7
  ,'D6'
  ,'D6'
  ,'D4'
  ,'D12');
INSERT INTO characters
  (id
  ,nev
  ,race_id
  ,cast_id
  ,religion_id
  ,health
  ,evasion
  ,mana
  ,speed
  ,attack
  ,aim
  ,stealth
  ,luck)
VALUES
  (characters_seq.nextval
  ,'Magyar Csan�d'
  ,2
  ,1
  ,2
  ,14
  ,2
  ,20
  ,9
  ,'D6'
  ,'D6'
  ,'D12'
  ,'D4');

-- v�gleges�t�s
COMMIT;

-- test
SELECT * FROM characters;
