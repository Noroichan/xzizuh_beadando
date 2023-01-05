CREATE OR REPLACE PACKAGE pkg_assist IS

  PROCEDURE is_this_a_dice(p_dice VARCHAR2);

  PROCEDURE bigger_than_zero(p_number NUMBER);

END pkg_assist;
/
CREATE OR REPLACE PACKAGE BODY pkg_assist IS

  PROCEDURE is_this_a_dice(p_dice VARCHAR2) IS
  BEGIN
    IF p_dice NOT IN ('D4', 'D6', 'D8', 'D10', 'D12', 'D20')
    THEN
      raise_application_error(pkg_exceptions.gc_not_dice_code,
                              p_dice || ' értéke nem egy kocka!' || chr(10) ||
                              'Kockák: D4, D6, D8, D10, D12, D20!');
    END IF;
  END is_this_a_dice;

  -----------------------------------------------------------------------------------------------------------------

  PROCEDURE bigger_than_zero(p_number NUMBER) IS
  BEGIN
    IF p_number <= 0
    THEN
      raise_application_error(pkg_exceptions.gc_smaller_than_one,
                              p_number || ', ez az érték kisebb mint egy!');
    END IF;
  END bigger_than_zero;

END pkg_assist;
/
