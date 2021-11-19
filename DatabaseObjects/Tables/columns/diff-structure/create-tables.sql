drop   table y;
drop   table x;

create table x (a number, b number(2), c number(2,3), d varchar2(4)               , f date     null, g varchar2(20), h number(6,2));
create table y (a number,              c number(2,3), d date       , e varchar2(5), f date not null, g varchar2(20), h number(7,2));
