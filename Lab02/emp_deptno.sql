set search_path to zadania;
CREATE TABLE DEPT
       (DEPTNO FLOAT(2) CONSTRAINT PK_DEPT PRIMARY KEY, --numer departamentu
	DNAME CHAR(14) ,  --nazwadepartamentu
	LOC CHAR(13)  ); --lokalizacja 

CREATE TABLE EMP
       (EMPNO NUMERIC(4) CONSTRAINT PK_EMP PRIMARY KEY,
	ENAME VARCHAR(10), --nazwisko
	JOB VARCHAR(9),  --stanowisko
	MGR NUMERIC(4), --id managera
	HIREDATE DATE,  --data zatrudnienia
	SAL NUMERIC(7,2), --wynagrodzenie
	COMM NUMERIC(7,2),  --prowizja
	DEPTNO NUMERIC(2) CONSTRAINT FK_DEPTNO REFERENCES DEPT );--numer departamentu

	CREATE TABLE SALGRADE
      ( GRADE NUMERIC, --grupa zaszeregowania
    LOSAL NUMERIC,  --minimalne zarobki w danej grupie zaszeregowania
    HISAL NUMERIC   );--maksymalne zarobki w danej grupie zaszeregowania

		
INSERT INTO SALGRADE VALUES (1,700,1200);
INSERT INTO SALGRADE VALUES (2,1201,1400);
INSERT INTO SALGRADE VALUES (3,1401,2000);
INSERT INTO SALGRADE VALUES (4,2001,3000);
INSERT INTO SALGRADE VALUES (5,3001,9999);

INSERT INTO DEPT VALUES (10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPT VALUES (20,'RESEARCH','DALLAS');
INSERT INTO DEPT VALUES (30,'SALES','CHICAGO');
INSERT INTO DEPT VALUES (40,'OPERATIONS','BOSTON');

set datestyle to European;
INSERT INTO EMP VALUES(7369,'SMITH','CLERK',7902,'17-12-1980',800,NULL,20);
INSERT INTO EMP VALUES(7499,'ALLEN','SALESMAN',7698,'20-2-1981',1600,300,30);
INSERT INTO EMP VALUES(7521,'WARD','SALESMAN',7698,'22-2-1981',1250,500,30);
INSERT INTO EMP VALUES(7566,'JONES','MANAGER',7839,'2-4-1981',2975,NULL,20);
INSERT INTO EMP VALUES(7654,'MARTIN','SALESMAN',7698,'28-9-1981',1250,1400,30);
INSERT INTO EMP VALUES(7698,'BLAKE','MANAGER',7839,'1-5-1981',2850,NULL,30);
INSERT INTO EMP VALUES(7782,'CLARK','MANAGER',7839,'9-6-1981',2450,NULL,10);
INSERT INTO EMP VALUES(7788,'SCOTT','ANALYST',7566,date '13-JUL-87'-85,3000,NULL,20);
INSERT INTO EMP VALUES(7839,'KING','PRESIDENT',NULL,'17-11-1981',5000,NULL,10);
INSERT INTO EMP VALUES(7844,'TURNER','SALESMAN',7698,'8-9-1981',1500,0,30);
INSERT INTO EMP VALUES(7876,'ADAMS','CLERK',7788,date '13-JUL-87'-51,1100,NULL,20);
INSERT INTO EMP VALUES(7900,'JAMES','CLERK',7698,'3-12-1981',950,NULL,30);
INSERT INTO EMP VALUES(7902,'FORD','ANALYST',7566,'3-12-1981',3000,NULL,20);
INSERT INTO EMP VALUES(7934,'MILLER','CLERK',7782,'23-1-1982',1300,NULL,10);