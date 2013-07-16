create type pipe_row_o as object (
  a number,
  b varchar2(10)
);
/

create type pipe_row_t as table of pipe_row_o;
/


create function pipe_rows return pipe_row_t pipelined is
begin

    pipe row(pipe_row_o(1, 'one'  ));
    pipe row(pipe_row_o(2, 'two'  ));
    pipe row(pipe_row_o(3, 'three'));
    pipe row(pipe_row_o(4, 'four' ));

end pipe_rows;
/


select * from table(pipe_rows);


drop function pipe_rows;

drop type pipe_row_t;
drop type pipe_row_o;  
