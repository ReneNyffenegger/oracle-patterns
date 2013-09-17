declare

  procedure p (a in varchar2) is 

     procedure p (a in varchar2) is
     begin

         dbms_output.put_line('inner: ' || a);

     end p;

  begin

    p('outer: ' || a);

  end p;

begin

  p('foo');
  
end;
/
