insert into tq84_cluster_parent values (100, trunc(sysdate-100));
insert into tq84_cluster_parent values (200, trunc(sysdate-200));
insert into tq84_cluster_parent values (300, trunc(sysdate-300));

insert into tq84_cluster_child  values (200, 'zweihundert'  );
insert into tq84_cluster_child  values (100, 'hundert'      );
insert into tq84_cluster_child  values (200, 'two hundred'  );
insert into tq84_cluster_child  values (300, 'three hundred');
insert into tq84_cluster_child  values (100, 'cent'         );
insert into tq84_cluster_child  values (100, 'hundred'      );
insert into tq84_cluster_child  values (300, 'dreihundert'  );

commit;
