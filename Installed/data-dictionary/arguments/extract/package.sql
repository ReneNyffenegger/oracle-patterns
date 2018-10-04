create or replace package tq84_funcs_and_procs as

    procedure proc_no_args;
    function  func_no_args return number;

    procedure proc_2_arg2(arg1 number, arg2 varchar2);
    function  func_2_arg2(arg1 number, arg2 varchar2) return number;

    procedure proc_args_in_out(arg1 out number, arg2 in out date);
    function  func_args_in_out(arg1 out number, arg2 in out date) return number;

end tq84_funcs_and_procs;
/
