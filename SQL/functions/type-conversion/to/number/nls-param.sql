select
   to_number('123456.78',   '999999D99', q'[ nls_numeric_characters = '.,' ]' ) n1,
   to_number('123,456.78', '999G999D99', q'[ nls_numeric_characters = '.,' ]' ) n2
from
   dual;
