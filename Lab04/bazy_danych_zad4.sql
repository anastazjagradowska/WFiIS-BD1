SELECT * FROM emp WHERE job = (SELECT job FROM emp WHERE ename = 'BLAKE');
SELECT * FROM emp WHERE sal IN(SELECT MIN(sal) FROM emp GROUP BY deptno);
SELECT * FROM emp e WHERE sal = (SELECT MIN(sal) FROM emp e1 WHERE e.deptno = e1.deptno);
SELECT * FROM emp WHERE sal = ANY(SELECT sal FROM emp WHERE sal > (SELECT MIN(sal) FROM emp WHERE deptno = 30));
SELECT * FROM emp WHERE sal = ANY(SELECT sal FROM emp WHERE sal > (SELECT MAX(sal) FROM emp WHERE deptno = 30));
SELECT top1_job.job FROM (SELECT AVG(sal), job FROM emp GROUP BY job ORDER BY avg DESC) AS top1_job LIMIT 1; 
SELECT * FROM emp e1 WHERE EXISTS (SELECT e.mgr FROM emp e WHERE e.mgr = e1.empno);
SELECT * FROM emp e WHERE hiredate = (SELECT MAX(hiredate) FROM emp e1 WHERE e.deptno = e1.deptno);
SELECT deptno, CAST((100 * dep_workers / workers) AS DECIMAL(7,2)) FROM (SELECT COUNT(*) AS workers FROM emp) e, (SELECT deptno, COUNT(*) AS dep_workers FROM emp GROUP BY deptno) e1;