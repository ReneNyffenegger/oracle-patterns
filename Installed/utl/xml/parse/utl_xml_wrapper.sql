connect rene/rene

create or replace package utl_xml_wrapper as
 --
 -- Philipp Salvisberg
 -- 
 --    https://github.com/PhilippSalvisberg/plscope-utils/blob/main/database/utils/package/parse_util.pkb
 --
    procedure parseQuery (
       currentUserid  in     number,
       schema         in     varchar2,
       query          in     clob,
       result         in out nocopy clob
    );

 --
 -- No idea how this function is supposed to be used:
 --
    procedure parseExpr (
       currentUserid  in     number,
       schema         in     varchar2,
       tab            in     varchar2,
       sqltext        in     clob,
       arith          in     binary_integer,  -- non-0 = sqltext is an arithmetic expression 
       lobloc         in out nocopy clob
    );

end utl_xml_wrapper;
/

create or replace package body utl_xml_wrapper as

    procedure parseQuery (
      currentUserid  in number,
      schema         in varchar2,
      query          in clob,
      result         in out nocopy clob
    ) is
      language c 
      library  sys.utl_xml_lib 
      name "kuxParseQuery"
      with context parameters (
           context,
           currentUserid  OCINumber    , currentUserid  indicator,
           schema         OCIString    , schema         indicator,
           query          OCILobLocator, query          indicator,
           result         OCILobLocator, result         indicator
      );

    procedure parseExpr (
      currentUserid  in     number,
      schema         in     varchar2,
      tab            in     varchar2,
      sqltext        in     clob,
      arith          in     binary_integer,  -- non-0 = sqltext is an arithmetic expression 
      lobloc         in out nocopy clob      --         otherwise it's a boolean expression
    ) is
      language c
      library  sys.utl_xml_lib
      name "kuxParseExpr"
      with context parameters (
           context,
           currentUserid     OCINumber,      currentUserid   indicator sb4,
           schema            OCIString,      schema          indicator sb4,
           tab               OCIString,      tab             indicator sb4,
           sqltext           OCILoblocator,  sqltext         indicator sb4,
           arith             UB4,            arith           indicator sb4,
           lobloc            OCILoblocator,  lobloc          indicator sb4
      );

end utl_xml_wrapper;
/

show errors
