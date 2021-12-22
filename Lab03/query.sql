SELECT ename, dept.dname FROM ( emp JOIN salgrade AS sal ON emp.sal >= sal.losal and emp.sal <= sal.hisal AND sal.grade = 3) JOIN dept ON dept.deptno = emp.deptno;
SELECT ename, dept.dname, sal.grade  FROM ( emp JOIN salgrade AS sal ON emp.sal >= sal.losal and emp.sal <= sal.hisal) JOIN dept ON dept.deptno = emp.deptno;
SELECT job, MAX(sal) FROM emp GROUP BY job;
SELECT dept.dname, AVG(sal) FROM emp JOIN dept ON emp.deptno = dept.deptno GROUP BY dept.dname HAVING count(empno) > 3;
SELECT job, AVG(sal) FROM emp WHERE job <> 'MANAGER' GROUP BY job;
SELECT AVG(sal), dept.dname FROM emp JOIN dept ON emp.deptno = dept.deptno GROUP BY dept.dname HAVING COUNT(emp.empno) > 3;
SELECT MAX(sal) - MIN(sal) AS sal_dif FROM emp;
SELECT grade, hisal FROM salgrade; 
SELECT sal FROM emp GROUP BY sal HAVING COUNT(sal) > 1;
SELECT grade, AVG(sal) AS avg_sal FROM emp JOIN salgrade AS sal ON emp.sal >= sal.losal AND emp.sal <= sal.hisal GROUP BY sal.grade HAVING sal.grade = 2; 
SELECT mgr, MIN(sal) FROM emp GROUP BY mgr, sal HAVING sal >= 1000 ORDER BY sal ASC;
SELECT job, AVG(sal) FROM emp GROUP BY job, sal HAVING sal >= 3000;
SELECT AVG(sal), job, dept.dname FROM emp JOIN dept ON emp.deptno = dept.deptno GROUP BY dept.dname, job;