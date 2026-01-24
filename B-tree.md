# B-treeについて

無
```
        QUERY PLAN
------------------------------------------------------------------------------------------------------------------------------------
 Gather  (cost=1000.00..1445533.63 rows=180467 width=20) (actual time=50.585..3288.924 rows=1052827 loops=1)
   Workers Planned: 2
   Workers Launched: 2
   ->  Parallel Seq Scan on k_items  (cost=0.00..1426486.93 rows=75195 width=20) (actual time=47.631..3243.023 rows=350942 loops=3)
         Filter: ((price >= 5000) AND (price <= 6000) AND (qty >= 90))
         Rows Removed by Filter: 32982391
 Planning Time: 0.629 ms
 JIT:
   Functions: 6
   Options: Inlining true, Optimization true, Expressions true, Deforming true
   Timing: Generation 0.422 ms (Deform 0.110 ms), Inlining 114.464 ms, Optimization 13.002 ms, Emission 15.300 ms, Total 143.189 ms
 Execution Time: 3331.397 ms
(12 行)
```

既
```
> db-postgresql@1.0.0 sql
> tsx scripts/sqlFileRunner.ts sql\13\tmp.sql

                                                             QUERY PLAN
-------------------------------------------------------------------------------------------------------------------------------------
 Gather  (cost=1000.00..1469102.92 rows=1019929 width=20) (actual time=53.844..1132.265 rows=1052827 loops=1)
   Workers Planned: 2
   Workers Launched: 2
   ->  Parallel Seq Scan on k_items  (cost=0.00..1366110.02 rows=424970 width=20) (actual time=53.062..1101.645 rows=350942 loops=3)
         Filter: ((price >= 5000) AND (price <= 6000) AND (qty >= 90))
         Rows Removed by Filter: 32982391
 Planning Time: 0.253 ms
 JIT:
   Functions: 6
   Options: Inlining true, Optimization true, Expressions true, Deforming true
   Timing: Generation 0.502 ms (Deform 0.115 ms), Inlining 137.902 ms, Optimization 8.944 ms, Emission 12.143 ms, Total 159.490 ms
 Execution Time: 1170.793 ms
```