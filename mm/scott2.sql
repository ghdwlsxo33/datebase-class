SELECT empno, ename, sal
from emp
where deptno = 10;

SELECT ename, hiredate, deptno
from emp
where empno = 7369;

SELECT *
from emp
where ename = 'ALLEN';

SELECT ename, deptno, sal
from emp
where hiredate = '1983/01/12';

SELECT *
from emp
where not job = 'MANAGER';

SELECT *
from emp
where hiredate > '1981/04/02';

SELECT ename, sal, deptno
from emp
where sal >= 800;

SELECT * 
from emp
where deptno >= 20;

SELECT *
from emp
where ename > 'K';

SELECT *
from emp
where ename like '%S';

SELECT empno, ename, job, sal, deptno
from emp
where deptno = 30 and job = 'SALESMAN';

SELECT empno, ename, job, sal, deptno
from emp
where deptno in (20,30) and sal > 2000;

SELECT *
from emp
where sal < 2000 
union
SELECT *
from emp
where sal > 3000;

SELECT ename, deptno, sal, empno
from emp
where ename like '%E%' and deptno = 30 and sal BETWEEN 1000 and 2000;

SELECT *
from emp
where comm is null and mgr is not null and job in ('MANAGER','CLERK')
and ename not like '_L%';