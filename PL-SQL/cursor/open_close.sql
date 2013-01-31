create table tq84_open_close_cursor (
       a  number,
       b  varchar2(20)
);

insert into tq84_open_close_cursor values (1, 'one');
insert into tq84_open_close_cursor values (2, 'two');
insert into tq84_open_close_cursor values (3, 'three');
insert into tq84_open_close_cursor values (3, 'one plus two');


declare -- {


  procedure open_close_cur(p_sel in number) is  -- {

      text varchar2(20);
  
      cursor cur(sel in number) is
             select b 
               from tq84_open_close_cursor
              where a = sel;

   begin

      dbms_output.put_line('p_sel: ' || p_sel);

      open cur(p_sel);

      dbms_output.put_line('  cursor opened');

      fetch cur into text;
      dbms_output.put_line('  feched');
  
      if cur%found then
         dbms_output.put_line('  found, text = ' || text);
      end if;

      close cur;
      dbms_output.put_line('  cursor closed');

      dbms_output.new_line;

  end open_close_cur; -- }


begin

  open_close_cur( 1); 
  open_close_cur( 3); 
  open_close_cur(99); 

end; -- }
/


drop table tq84_open_close_cursor purge;
