select
   to_number(  '22/3'  default '-1' on conversion error) n1,
   to_number(  '22.3'  default '-1' on conversion error) n2,
   to_number('  22.3'  default '-1' on conversion error) n3,
   to_number('  22.3x' default '-1' on conversion error) n4
from
   dual;
