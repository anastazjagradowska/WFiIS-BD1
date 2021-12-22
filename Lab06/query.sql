WITH towary AS (SELECT c.lname, SUM(CASE WHEN sell_price - cost_price <0 THEN 1 ELSE 0 END) AS "strata", SUM(case when sell_price - cost_price >= 0 AND sell_price - cost_price <= 4   THEN 1 ELSE 0 END) AS "zysk", SUM (CASE WHEN sell_price - cost_price > 4 THEN 1 ELSE 0 END) AS "super" FROM ((orderline l JOIN orderinfo o ON o.orderinfo_id = l.orderinfo_id) JOIN customer c ON c.customer_id = o.customer_id) JOIN item using(item_id) GROUP BY c.lname) SELECT * FROM towary;


WITH RECURSIVE factorial (N, factorial) AS 
(SELECT 1, 1
UNION ALL
SELECT N+1, (N+1) * factorial
FROM factorial
WHERE N < 10
)
SELECT N, factorial
FROM factorial;

WITH prac_przel AS(SELECT c.empno, c.empname, c.mgrno, c1.empname FROM staff c INNER JOIN staff c1 ON c.mgrno = c1.empno) SELECT * FROM prac_przel;

WITH RECURSIVE level AS (SELECT empno, empname, mgrno, ''::VARCHAR(20) AS mgrname, 1 lvl from staff where mgrno is null UNION ALL SELECT s.empno, s.empname, s.mgrno, l.empname, l.lvl+1
FROM staff s JOIN level l ON s.mgrno = l.empno WHERE s.mgrno is not null ) SELECT empname, mgrname, lvl FROM level ORDER BY lvl;

WITH RECURSIVE hierarchia_pracownikow AS (SELECT empno, empname, mgrno, 1 lvl, ''::text AS path FROM staff WHERE mgrno is null UNION ALL SELECT s.empno, s.empname, s.mgrno, h.lvl+1, CONCAT( h.path, '->', h.empname)
FROM (staff s JOIN hierarchia_pracownikow h ON s.mgrno = h.empno) WHERE s.mgrno is not null) SELECT empname, lvl, path FROM hierarchia_pracownikow ORDER BY lvl;