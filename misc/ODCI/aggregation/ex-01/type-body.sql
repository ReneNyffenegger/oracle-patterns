create or replace type body tq84_text_range_t is 


    static function ODCIAggregateInitialize(sctx in out tq84_text_range_t) 
        return number is 
    begin
        sctx := tq84_text_range_t(null, null);
        return ODCIConst.Success;
    end ODCIAggregateInitialize;


    member function ODCIAggregateIterate(
        self in out tq84_text_range_t,
        value in varchar2
    ) 
    return number is
    begin

--      if value is null then
--         return ODCIConst.Success;
--      end if;

        if min_val is null then min_val := value; end if;
        if max_val is null then max_val := value; end if;
          
        if value < min_val then min_val := value; end if;
        if value > max_val then max_val := value; end if;

        return ODCIConst.Success;
    end ODCIAggregateIterate;


    member function ODCIAggregateTerminate(
        self         in  tq84_text_range_t, 
        return_value out varchar2,
        flags        in  number
    )
    return number is
    begin
        return_value := min_val || ' .. ' || max_val;
        return ODCIConst.Success;
    end ODCIAggregateTerminate;


    member function ODCIAggregateMerge(
        self in out tq84_text_range_t, 
        ctx2 in     tq84_text_range_t
    ) return number is
    begin

        if ctx2.min_val < self.min_val then self.min_val := ctx2.min_val; end if;
        if ctx2.max_val > self.max_val then self.max_val := ctx2.max_val; end if;

        return ODCIConst.Success;

    end ODCIAggregateMerge;

end;
/

show errors
