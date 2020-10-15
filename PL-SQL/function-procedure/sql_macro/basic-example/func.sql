create or replace function selectData(p_id varchar2) return varchar2 sql_macro
is begin

   return q'{

       select
          num,
          txt
       from
          someData
       where
          id = p_id -- Note that p_id is embedded in a string!
   }';

end selectData;
/
