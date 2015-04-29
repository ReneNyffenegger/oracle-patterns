create table tq84_ix (
  col_1   number,
  col_2   number,
  constraint tq84_ix_uq unique (col_1, col_2)
);


insert into tq84_ix values (    1,    1 );
insert into tq84_ix values (    1,    2 );
insert into tq84_ix values (    1, null );
insert into tq84_ix values (    2, null );

insert into tq84_ix values ( null, null );
insert into tq84_ix values ( null, null );
insert into tq84_ix values ( null, null );
insert into tq84_ix values ( null, null );

insert into tq84_ix values ( null,    1 );
insert into tq84_ix values ( null,    2 );

-- insert into tq84_ix values ( null,    2 );  -- unique constraint (META.TQ84_IX_UQ) violated
-- insert into tq84_ix values (    1, null );  -- unique constraint (META.TQ84_IX_UQ) violated

drop table tq84_ix;
