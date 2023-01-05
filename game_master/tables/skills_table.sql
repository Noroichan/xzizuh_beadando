CREATE TABLE skills(
       id NUMBER PRIMARY KEY,
       nev VARCHAR2(40 CHAR) NOT NULL,
       mana_cost NUMBER,
       leiras VARCHAR2(4000 CHAR) NOT NULL,
       effect_id NUMBER
);

COMMENT ON TABLE skills IS 'Képességek és azok leírása';
COMMENT ON COLUMN skills.id IS 'Képességek azonosítója';
COMMENT ON COLUMN skills.effect_id IS 'Képességek effektjének id-ja';
