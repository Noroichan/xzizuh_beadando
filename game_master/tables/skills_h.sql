CREATE TABLE skills_h(
       skill_id NUMBER,
       skill_nev VARCHAR2(40 CHAR),
       skill_mana_cost NUMBER,
       skill_leiras VARCHAR2(4000 CHAR),
       skill_effect_id NUMBER,
       id NUMBER PRIMARY KEY,
       modosito_user VARCHAR2(250),
       modositasi_ido TIMESTAMP(6),
       keszito_user VARCHAR2(250),
       keszitesi_ido TIMESTAMP(6),
       dml_tipus CHAR(1),
       row_version NUMBER
);
