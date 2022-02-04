create or replace type tq84_odci
   authid definer
as object (

    rec_desc         anytype,
  
    nof_rows         integer,
    nof_cols         integer,
  
    r_current        integer,
 --
 -- multiplication_table returns a multiplication table with r+1 rows and c+1
 -- columns.
 -- In the type body, there is no method named multiplication_table, rather,
 -- behind the scenes, ODCITableDescribe and so forth are called to
 -- determine table strcture (rec_desc) and fill the returned records
 -- with values.
 --
    static function multiplication_table(
       r in number,
       c in number
    )
    return anydataset pipelined using tq84_odci,

 --
 -- Constructor. Called in odciTablePrepare.
 -- Returned object assigned to scan context (sctx)
 --
    constructor function tq84_odci(
       self in out nocopy tq84_odci,
       rowTypes in anytype,
       r        in integer,
       c        in integer) return self as result,
  
 --
 -- odciTableDescribe: determine number of columns of result
 -- set and their data types. Return this information
 -- through rec_desc.
 --
    static function odciTableDescribe(
        rec_desc       out nocopy anytype,
        ---------------------------------
        r               in        integer,
        c               in        integer
    )
    return number,
  
    static function odciTablePrepare (
         sctx           out nocopy tq84_odci,
         tab_func_info  in         sys.ODCITabFuncInfo,
         ------------------------------------
         r              in         integer,
         c              in         integer
    )
    return number,

    static function odciTableStart(
         sctx           in out nocopy tq84_odci,
         ---------------------------------------
         r              in            integer,
         c              in            integer
    )
    return number,
  
 --
 -- Fetch one (or more) records and create the associated data:
 --
    member function odciTableFetch   (
       self             in out nocopy tq84_odci,
       nofRowsExpected  in            number,
       record_out      out     nocopy anyDataSet
    )
    return number,
  
    member function odciTableClose(
       self in tq84_odci
    )
    return number

);
/

show errors
