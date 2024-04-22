--p428
create table dept_record
as 
select * from dept;

select * from dept_record;
-- 99 / DATABASE/ SEOUL

DECLARE
    type REC_DEPT is record(
        deptno number(2) not null :=99,
        dname dept.dname%type,
        loc dept.loc%type
     );
     dept_rec REC_DEPT;
      
BEGIN
    dept_rec.deptno := 99;
    dept_rec.dname := 'DATABASE';
    dept_rec.loc := 'SEOUL';
    insert into dept_record values dept_rec;
end;
/
select * from dept_record;
-- 10번 부서 정보 출력 (record 형 이용)
select * from dept_record where deptno =10;

DECLARE
    type RECORD_DEPT1 is record(
        deptno number(2),
        dname varchar2(20),
        loc varchar2(20)
    );
   rec RECORD_DEPT1;
BEGIN
    select * into rec
    from dept_record 
    where deptno =10;
    dbms_output.put_line('deptno : ' || rec.deptno);
    dbms_output.put_line('dname : ' || rec.dname);
    dbms_output.put_line('loc : ' || rec.loc);
end;
/
---
ACCEPT pdeptno  PROMPT '부서번호입력:'
DECLARE
    type RECORD_DEPT1 is record(
        deptno number(2),
        dname varchar2(20),
        loc varchar2(20)
    );
   rec RECORD_DEPT1;
BEGIN
    select * into rec
    from dept_record 
    where deptno = &pdeptno;
    dbms_output.put_line('deptno : ' || rec.deptno);
    dbms_output.put_line('dname : ' || rec.dname);
    dbms_output.put_line('loc : ' || rec.loc);
end;
/

---p460 커서 : 
--select  문 또는 데이터조작어 같은  sql  문 실행했을 때 
--해당 sql문을 처리하는 정보를 저장한 메모리 공간










