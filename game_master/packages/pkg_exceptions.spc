CREATE OR REPLACE PACKAGE pkg_exceptions IS

  race_not_found_exc EXCEPTION;
  gc_race_not_found_code CONSTANT NUMBER := -20001;
  PRAGMA EXCEPTION_INIT(race_not_found_exc, -20001);

  cast_not_found_exc EXCEPTION;
  gc_cast_not_found_code CONSTANT NUMBER := -20002;
  PRAGMA EXCEPTION_INIT(cast_not_found_exc, -20002);

  religion_not_found_exc EXCEPTION;
  gc_religion_not_found_code CONSTANT NUMBER := -20003;
  PRAGMA EXCEPTION_INIT(religion_not_found_exc, -20003);

  character_not_found_exc EXCEPTION;
  gc_character_not_found_code CONSTANT NUMBER := -20004;
  PRAGMA EXCEPTION_INIT(character_not_found_exc, -20004);

  skill_not_found_exc EXCEPTION;
  gc_skill_not_found_code CONSTANT NUMBER := -20005;
  PRAGMA EXCEPTION_INIT(skill_not_found_exc, -20005);

  effect_not_found_exc EXCEPTION;
  gc_effect_not_found_code CONSTANT NUMBER := -20006;
  PRAGMA EXCEPTION_INIT(effect_not_found_exc, -20006);

  skill_has_already_learnt_exc EXCEPTION;
  gc_skill_has_learnt_code CONSTANT NUMBER := -20007;
  PRAGMA EXCEPTION_INIT(skill_has_already_learnt_exc, -20007);

  skill_has_not_learnt_exc EXCEPTION;
  gc_skill_has_not_learnt_code CONSTANT NUMBER := -20008;
  PRAGMA EXCEPTION_INIT(skill_has_not_learnt_exc, -20008);

  not_dice_exc EXCEPTION;
  gc_not_dice_code CONSTANT NUMBER := -20009;
  PRAGMA EXCEPTION_INIT(not_dice_exc, -20009);

  smaller_than_one_exc EXCEPTION;
  gc_smaller_than_one CONSTANT NUMBER := -20010;
  PRAGMA EXCEPTION_INIT(smaller_than_one_exc, -20010);

  not_bonus_exc EXCEPTION;
  gc_not_bonus_code CONSTANT NUMBER := -20011;
  PRAGMA EXCEPTION_INIT(not_bonus_exc, -20011);

  uniqe_name_exc EXCEPTION;
  gc_unique_name_code CONSTANT NUMBER := -20012;
  PRAGMA EXCEPTION_INIT(uniqe_name_exc, -20012);

  used_by_character_exc EXCEPTION;
  gc_used_by_character_code CONSTANT NUMBER := -20013;
  PRAGMA EXCEPTION_INIT(used_by_character_exc, -20013);

  used_by_skill_exc EXCEPTION;
  gc_used_by_skill_code CONSTANT NUMBER := -20014;
  PRAGMA EXCEPTION_INIT(used_by_skill_exc, -20014);

  has_no_skills_exc EXCEPTION;
  gc_has_no_skills_code CONSTANT NUMBER := -20015;
  PRAGMA EXCEPTION_INIT(has_no_skills_exc, -20015);

END pkg_exceptions;
/
