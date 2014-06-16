declare

  type r is record (
    nm number,
    vc varchar2(20)
  );

  type t is table of r index by varchar2(10);

  v    t;


  key_  varchar2(10);

begin

  v('foo').nm  :=  42; v('foo').vc  := 'forty-two';
  v('bar').nm  :=  11; v('bar').vc  := 'eleven';
  v('baz').nm  :=  20; v('baz').vc  := 'twenty';

  key_ := v.first;

  while key_ is not null loop
        dbms_output.put_line(key_ || ': ' || v(key_).nm || ' - ' || v(key_).vc);
        key_ := v.next(key_);
  end loop;
  
end;
/
