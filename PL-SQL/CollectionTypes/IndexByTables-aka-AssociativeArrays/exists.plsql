declare

  type r is record (
    nm number,
    vc varchar2(20)
  );

  type t is table of r index by varchar2(10);

  v    t;

  procedure out_1 (key_ in varchar2) is -- {
  begin
     dbms_output.put_line(key_ || ': ' || v(key_).nm || ' - ' || v(key_).vc);
  exception 
    when no_data_found then
         dbms_output.put_line('No entry found for ' || key_);
    when others then
         raise;
  end out_1; -- }
  
  procedure out_2 (key_ in varchar2) is -- {
  begin
     if v.exists(key_) then
        dbms_output.put_line(key_ || ': ' || v(key_).nm || ' - ' || v(key_).vc);
     else
        dbms_output.put_line('No entry found for ' || key_);
     end if;
  end out_2; -- }
  

begin

  v('foo').nm  :=  42; v('foo').vc  := 'forty-two';
  v('bar').nm  :=  11; v('bar').vc  := 'eleven';

  dbms_output.new_line;

  out_1('foo');
  out_1('bar');
  out_1('baz');

  dbms_output.new_line;

  out_2('foo');
  out_2('bar');
  out_2('baz');
  
  dbms_output.new_line;

end;
/
