CREATE TABLE races(
       id NUMBER PRIMARY KEY,
       nev VARCHAR2(40 CHAR) NOT NULL,
       health_bonus NUMBER,
       evasion_bonus NUMBER,
       mana_bonus NUMBER,
       speed_bonus NUMBER,
       attack_bonus NUMBER,
       aim_bonus NUMBER,
       stealth_bonus NUMBER,
       luck_bonus NUMBER
);

COMMENT ON TABLE races IS 'Különbözõ rasszok és azok attribútum bónuszai';
COMMENT ON COLUMN races.id IS 'Rasszok azonosítója';
