create table tq84_redefinition_int (
    id  number     ,    -- No primary key to prevent «ORA-01408: such column list already indexed»
    num number(6,2),    -- Change varchar2 to number
    dt  date            -- Rename column and data type
);
