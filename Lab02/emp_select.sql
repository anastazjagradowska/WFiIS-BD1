SELECT ename, dept.dname FROM emp INNER JOIN dept ON emp.deptno=dept.deptno ORDER BY ename ASC;
SELECT deptno, ename, mgr FROM emp;
SELECT ename,((sal+250)*12) AS income FROM emp;
SELECT ename, hiredate FROM emp ORDER BY hiredate DESC;
SELECT ename, job, sal, deptno FROM emp WHERE job='CLERK';
SELECT * FROM emp WHERE comm > sal;
SELECT *  FROM emp WHERE 1000 < sal < 2000;
SELECT *  FROM emp WHERE ename LIKE 'S%';
SELECT * FROM emp WHERE LENGTH(ename)=4;
SELECT * FROM emp WHERE mgr IS NULL;
SELECT * FROM emp WHERE job='CLERK' AND sal>=1000 AND sal<2000;
SELECT * FROM emp WHERE deptno=10 OR deptno=20 ORDER BY ename ASC;