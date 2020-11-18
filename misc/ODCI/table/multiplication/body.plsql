create or replace type body tq84_odci as

    constructor function tq84_odci( -- {
       self     in out nocopy tq84_odci,
       rowTypes in anytype,
       r        in integer,
       c        in integer
    ) return self as result
    is
    begin

        rec_desc  := rowTypes;
        nof_rows  := r;
        nof_cols  := c;
        r_current := 0;

        return;

    end tq84_odci; -- }

    static function odciTableDescribe( -- {
            rec_desc     out anytype,
            r             in integer,
            c             in integer
    ) return number is

      colTypes anytype;
    begin
    --
    -- Dynamically create a type (colTypes) whose attributes correspond
    -- to the columns of the table that is to be returned.
    --
       anytype.beginCreate(dbms_types.typecode_object, colTypes);

    --
    -- Special treatment of first column/attribute
    --
       colTypes.addAttr( -- {
              aname     =>'X',
              typecode  => dbms_types.typecode_varchar2,
              prec      => null,
              scale     => null,
              len       =>   11,
              csid      => null,
              csfrm     => null
       ); -- }

    --
    -- Add rest of attributes
    --
       for i in 2 .. c+1 loop -- {

           colTypes.addattr(
              aname     =>'Y_' || (i-1),
              typecode  => dbms_types.typecode_varchar2,
              prec      => null,
              scale     => null,
              len       =>   11,
              csid      => null,
              csfrm     => null
           );

       end loop; -- }
    --
    -- Done adding attributes
    --
       colTypes.endcreate;

    --
    -- Now, after creating the record structure, A nested table containing
    -- the types needs to be created:
    --
       anytype.beginCreate(dbms_types.typecode_table, rec_desc);
       rec_desc.setinfo( -- {
            prec        => null,
            scale       => null,
            len         => null,
            csid        => null,
            csfrm       => null,
            atype       => colTypes,
            elem_tc     => dbms_types.typecode_table,
            elem_count  => 0
       ); -- }
       rec_desc.endcreate();

      return odciconst.success;

    exception when others then
        return odciconst.error;
    end odciTableDescribe; -- }

    static function odciTablePrepare( -- {
        sctx          out tq84_odci,
        tab_func_info in  sys.odciTabFuncInfo,
        r             in  integer,
        c             in  integer
    )
    return number
 --
 -- Create an actual instance of tq84_odci
 --
    is
     --
     -- Same type as was defined in odciTableDescribe.
     -- Will be assigned belo from tab_func_info.retType
     --
        record_desc  anytype;

        prec         pls_integer ; -- only used for function call
        scale        pls_integer ; -- only used for function call
        len          pls_integer ; -- only used for function call
        csid         pls_integer ; -- only used for function call
        csfrm        pls_integer ; -- only used for function call
        aname        varchar2(30); -- only used for function call
        dummy        pls_integer ; -- only used for function call

    begin

     -- With GetAttrElemInfo, I can get the record_structure that was created in odciTableDescribe.
     -- This record_structure is returned in the out parameter record_desc.
     -- The parameters prec, scale, len, csid, csfrm and aname are ignored.
        dummy := tab_func_info.retType.getAttrElemInfo(null, prec, scale, len, csid, csfrm, record_desc, aname);

     -- Ready to construct an instance of tq84_odci.
     -- The first parameter will be stored in the member rec_desc, the second in row_was_returned.

        sctx := tq84_odci(record_desc, r+1, c+1);

        return odciconst.success;
    end odciTablePrepare; -- }

    static function odciTableStart(sctx in out tq84_odci, r  in integer, c in integer) return number is -- {
    begin
        return odciconst.success;
    end odciTableStart; -- }

    member function odciTableFetch( -- {
       self            in out tq84_odci,
       nofRowsExpected in number,
       record_out     out anydataset)
    return number is
       len number := 10;
    begin

        r_current := r_current + 1;

        record_out := null;

        if r_current > nof_rows then -- {
        -- Last record reached: finished!
           return odciconst.success;
        end if; -- }

        anydataset.begincreate(dbms_types.typecode_object, self.rec_desc, record_out);
        record_out.addinstance;
        record_out.piecewise();

        if r_current = 1 then -- {

          record_out.setVarchar2(lpad('x', len));
          for c_current in 2 .. nof_cols loop -- {
              record_out.setVarchar2(lpad(c_current-1, 10));
          end loop; -- }

        -- }
        else -- {

           record_out.setVarchar2(lpad(r_current-1, len));
           for c_current in 2 .. nof_cols loop -- {
               record_out.setvarchar2(lpad((c_current-1) * (r_current-1), len));
           end loop; -- }

        end if; -- }

        record_out.endcreate;

        return odciconst.success;
    end odciTableFetch; -- }

    member function odciTableClose(self in tq84_odci) return number is -- {
    begin
        return odciconst.success;
    end odciTableClose; -- }

end;
/

show errors
