-- races constraints
ALTER TABLE races ADD CONSTRAINT uq_races_name UNIQUE(nev);

-- casts constraints
ALTER TABLE casts ADD CONSTRAINT pk_casts_name PRIMARY KEY(id);
ALTER TABLE casts ADD CONSTRAINT uq_casts_name UNIQUE(nev);

-- religions constraints
ALTER TABLE religions ADD CONSTRAINT uq_religions_name UNIQUE(nev);

-- skills constraints
ALTER TABLE skills ADD CONSTRAINT uq_skills_name UNIQUE(nev);
ALTER TABLE skills ADD CONSTRAINT fk_effect_id FOREIGN KEY(effect_id) REFERENCES effects(id);

-- effects constraints
ALTER TABLE effects ADD CONSTRAINT uq_effects_name UNIQUE(nev);

-- characters constraints
ALTER TABLE characters ADD CONSTRAINT fk_race_id FOREIGN KEY(race_id) REFERENCES races(id);
ALTER TABLE characters ADD CONSTRAINT fk_cast_id FOREIGN KEY(cast_id) REFERENCES casts(id);
ALTER TABLE characters ADD CONSTRAINT fk_religion_id FOREIGN KEY(religion_id) REFERENCES religions(id);

-- skills_of_characters constraints
ALTER TABLE skills_of_characters ADD CONSTRAINT fk_character_id FOREIGN KEY(character_id) REFERENCES characters(id);
ALTER TABLE skills_of_characters ADD CONSTRAINT fk_skill_id FOREIGN KEY(skill_id) REFERENCES skills(id);
