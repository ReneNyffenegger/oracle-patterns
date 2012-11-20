create or replace package body tq84_catcher as


    procedure try(do boolean) is begin -- {

        tq84_thrower.might_throw(do);

        dbms_output.put_line('Success!');

    exception when tq84_thrower.exc then

        dbms_output.put_line('Error!');

    end try; -- }


    procedure try_again(do boolean) is begin -- {

        tq84_thrower.might_throw(do);

        dbms_output.put_line('Tried again!');

    exception when others then

        dbms_output.put_line('sqlerrm: ' || sqlerrm);

    end try_again; -- }


    procedure try_another(do boolean) is begin -- {

        tq84_thrower.might_throw_another(do);
        dbms_output.put_line('Another success!');

    exception when others then
        dbms_output.put_line(sqlerrm);

    end try_another; -- }


    procedure go is begin -- {

        try(false);
        try(true );

        --

        try_again(false);
        try_again(true );

        --

        try_another(false);
        try_another(true);

    end go; -- }

end tq84_catcher;
/
