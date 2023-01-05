CREATE TABLE effects_h(
       effect_id NUMBER,
       effect_nev VARCHAR2(40 CHAR),
       effect_damage_per_rounds NUMBER,
       effect_leiras VARCHAR2(4000 CHAR),
       id NUMBER PRIMARY KEY,
       modosito_user VARCHAR2(250),
       modositasi_ido TIMESTAMP(6),
       keszito_user VARCHAR2(250),
       keszitesi_ido TIMESTAMP(6),
       dml_tipus CHAR(1),
       row_version NUMBER
);
