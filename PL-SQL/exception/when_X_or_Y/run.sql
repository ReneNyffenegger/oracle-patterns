declare

  procedure p(x in number) is
  begin
    tq84_bar.proc(x);
  exception
    when tq84_foo.exc_one then
         dbms_output.put_line('run.sql caught expected exc_one');
    when others then
         dbms_output.put_line('run.sql caught other error');
  end p;


begin

  p(1);
  p(2);
  p(3);

end;
/
