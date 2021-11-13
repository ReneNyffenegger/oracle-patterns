select
   to_char(date '-4712-01-01'      , 'Jsp') as one,
   to_char(date '-4712-01-01' +  41, 'Jsp') as forty_two,
   to_char(date '-4712-01-01' + 998, 'Jsp') as nine_nine_nine
from
   dual;
