create table tq84_pivot (
  dt          date,
  txt         varchar2(10),
  value       number(5,2)
);

                                                                /*     M o n t h    */
                                                                /*                  */
                                                                /*   07   08   09   */
                                                                /* -----------------*/

insert into tq84_pivot values (date '2000-08-10',  'Item 1', 10)/*        10        */;
insert into tq84_pivot values (date '2000-09-12',  'Item 1', 12)/*             12   */;
insert into tq84_pivot values (date '2000-09-15',  'Item 1', 14)/*             14   */;
insert into tq84_pivot values (date '2000-09-16',  'Item 1',  2)/*              2   */;
/*                                                                   --   --   --   */
/*                                             Sums for Item 1  :         10   28   */
/*                                                                   ==   ==   ==   */


insert into tq84_pivot values (date '2000-07-02',  'Item 2', 11)/*   11             */;
insert into tq84_pivot values (date '2000-07-05',  'Item 2',  7)/*    7             */;
insert into tq84_pivot values (date '2000-08-22',  'Item 2',  8)/*         8        */;
/*                                                                   --   --   --   */
/*                                             Sums for Item 2  :    18    8        */
/*                                                                   ==   ==   ==   */

insert into tq84_pivot values (date '2000-08-22',  'Item 3',  6)/*         6        */;
/*                                                                   --   --   --   */
/*                                             Sums for Item 2  :          6        */
/*                                                                   ==   ==   ==   */

with translate_dt_to_month as (
  select to_char(dt, 'MM') month, txt, value from tq84_pivot
)
select * from translate_dt_to_month
  --
  pivot ( sum(value) for month in ('07', '08', '09') )
  --
order by txt;
  

drop table tq84_pivot;
