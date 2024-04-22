-- cursor
-- open fetch close ===> for loop end
select * from emp where deptno=20;
--20번부서에 속한 사원번호, 이름,급여  출력
DECLARE
    vemp emp%rowType;
    cursor c1 is
    select empno, ename, sal
    from emp
    where deptno=20;
begin
    DBMS_OUTPUT.PUT_LINE('번호  이름 급여');
    for vemp  in c1 loop
    exit when c1%notfound;
        DBMS_OUTPUT.PUT_LINE(vemp.empno ||' '||vemp.ename ||' '||vemp.sal);
    end loop; 
end;
/

----emp 테이블의 모든 사원 이름과 급여 출력하고 회원들의 급여 합도 출력
select ename, sal from emp;
select sum(sal) from emp;

DECLARE
    total number :=0;
    cursor emp_cursor is
    select ename, sal
    from emp;
BEGIN
    for  cur_var in  emp_cursor loop
    exit when emp_cursor%notfound;
     total := total + cur_var.sal; -- 800=0+800 / 2400=800+1600 /3650 =2400+1250
     dbms_output.put_line(cur_var.ename || ' ' || cur_var.sal);
    end loop;
    dbms_output.put_line('총급여액 : '||total);
end;
/
----
select ename, sal from emp order by sal desc;
--사원별 급여현황 급여의 내림차순으로 출력
--이름 별표(100 에 별표하나) <- 반올림(sal)
-- 예) JAMES(950)  :  JAMES **********(950)

DECLARE
    CURSOR star_cursor is
    select ename, sal 
    from emp
    order by sal desc;
    
    cnt number:=0 ; --별표갯수
    star varchar2(100);

BEGIN
    dbms_output.put_line('--사원별 급여 현황 ----');
    for cur_var in star_cursor loop
        cnt :=round(cur_var.sal/100);
        star := null;
        for i  in 1..cnt loop    -- 별표출력
            star := star || '*';
        end loop;
        dbms_output.put_line(cur_var.ename ||' '||star||' '||cur_var.sal);
    end loop;
end;
/
--- 프로시져
create table emp_mon
as
select *
from emp;

create or replace PROCEDURE emp_proce(
    v_empno in emp.empno%type,
    v_ename in emp.ename%type,
    v_job in emp.job%type,
    v_manager in emp.mgr%type,
    v_sal in emp.sal%type)
IS   
begin
    insert into emp_mon(empno, ename, job, mgr, sal)
    values(v_empno,v_ename,v_job,v_manager,v_sal);
    commit;
end;
/
set SERVEROUTPUT on;
EXECUTE emp_proce(4000,'홍길동','사원',5000,800);
EXECUTE emp_proce(4001,'홍길동1','사원1',5000,900);
select * from emp_mon;

---- 부서명, 인원수, 급여합계를 구하는 프로시저(sumProcess) 작성
select d.dname 부서명, count(e.empno) 인원, sum(e.sal) 급여합계
from emp e, dept d
where e.deptno = d.deptno
group by d.dname;

create or replace PROCEDURE sumProcess
is
CURSOR sum_cur is
    select d.dname 부서명, count(e.empno) 인원, sum(e.sal) 급여합계
    from emp e, dept d
    where e.deptno = d.deptno
    group by d.dname;
BEGIN
    for i in sum_cur loop
        dbms_output.put_line('부서명 :'||i.부서명);
        dbms_output.put_line('인원 :'||i.인원);
        dbms_output.put_line('급여합계 :'||i.급여합계);
    end loop;
end;
/
EXECUTE sumProcess();
-----p484
create or replace PROCEDURE pro_noparam
is
v_empno number(4) := 7788;
v_ename varchar2(10);
begin
    v_ename :='SCOTT';
    dbms_output.put_line('v_empno : ' || v_empno);
    dbms_output.put_line('v_ename : ' || v_ename);
end;
/
EXECUTE pro_noparam;
--p488
-- IN 은 디폴트 값으로 생략가능
create or replace PROCEDURE pro_param_in(
    param1 IN number,
    param2 number,
    param3 number :=3,
    param4 number default 4
)
is 
begin
     dbms_output.put_line('param1 :' ||param1);
     dbms_output.put_line('param2 :' ||param2);
     dbms_output.put_line('param3 :' ||param3);
     dbms_output.put_line('param4 :' ||param4);
end;
/

EXECUTE pro_param_in(1,2,9,8);
EXECUTE pro_param_in(1,2);
--EXECUTE pro_param_in(1);  -- 오류발생
EXECUTE pro_param_in(param1 => 10, param2 => 20);

--p490 OUT
create or replace PROCEDURE pro_param_out(
    in_empno in emp.empno%type,
    out_ename out emp.ename%type,
    out_sal out emp.sal%type
)
is
begin
    select ename, sal into out_ename, out_sal
    from emp
    where empno = in_empno;
end;
/
-----
DECLARE
    v_ename emp.ename%type;
    v_sal  emp.sal%type;
begin
    pro_param_out(7369,v_ename, v_sal);
    DBMS_OUTPUT.PUT_LINE('ENAME : ' || v_ename);
    DBMS_OUTPUT.PUT_LINE('SAL : ' || v_sal);
end;
/

select * from emp where empno=7369;




 






