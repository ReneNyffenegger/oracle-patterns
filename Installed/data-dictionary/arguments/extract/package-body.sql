create or replace package body tq84_funcs_and_procs as

    procedure proc_no_args                                                      is begin        null; end;
    function  func_no_args                                        return number is begin return null; end;

    procedure proc_2_arg2(arg1 number, arg2 varchar2)                           is begin        null; end;
    function  func_2_arg2(arg1 number, arg2 varchar2)             return number is begin return null; end;

    procedure proc_args_in_out(arg1 out number, arg2 in out date)               is begin        null; end;
    function  func_args_in_out(arg1 out number, arg2 in out date) return number is begin return null; end;

end tq84_funcs_and_procs;
/
