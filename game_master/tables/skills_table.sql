CREATE TABLE skills(
       id NUMBER PRIMARY KEY,
       nev VARCHAR2(40 CHAR) NOT NULL,
       mana_cost NUMBER,
       leiras VARCHAR2(4000 CHAR) NOT NULL,
       effect_id NUMBER
);

COMMENT ON TABLE skills IS 'K�pess�gek �s azok le�r�sa';
COMMENT ON COLUMN skills.id IS 'K�pess�gek azonos�t�ja';
COMMENT ON COLUMN skills.effect_id IS 'K�pess�gek effektj�nek id-ja';
