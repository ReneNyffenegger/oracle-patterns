create function tq84_func(op varchar2, num1 in number, num2 in number) return number is
begin

  if op = 'plus'  then return num1 + num2; end if;
  if op = 'minus' then return num1 - num2; end if;
  if op = 'mult'  then return num1 * num2; end if;
  if op = 'div'   then return num1 / num2; end if;
  return 0;

end tq84_func;
/
