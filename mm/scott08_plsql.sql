--2�� ���
-- 2*1 =2
-- 2*2 =4

-- 2* 9 =18

DECLARE

BEGIN
    for i in 1..9 loop
        DBMS_OUTPUT.PUT_LINE('2 * ' || i || ' = ' || 2*i) ;
     end loop;
end;
/

-----
ACCEPT p_dan PROMPT '��� �� �Է� :';
DECLARE
 v_dan number(2) := &p_dan;
 tot number(2);
BEGIN
    for i in 1..9 loop
        tot := v_dan*i;
        DBMS_OUTPUT.PUT_LINE(v_dan ||' * ' || i || ' = ' || tot) ;
        --DBMS_OUTPUT.PUT_LINE(v_dan ||' * ' || i || ' = ' || v_dan*i) ;
     end loop;
end;
/
----
create table A (  
    A1 number,
    A2 number,
    A3 number
)
accept pdan prompt '���Է�:';
DECLARE
    vdan number(2) := &pdan;
    tot number(2) default 0;
BEGIN
    for i in 1..9 loop
        tot := vdan * i;
        DBMS_OUTPUT.PUT_LINE(vdan ||' * ' || i || ' = ' || tot) ;
        insert into a values(vdan, i, tot);
    end loop;
end;
/
---
ACCEPT p_deptno1 PROMPT 'select �μ���ȣ �Է� :';
DECLARE
     v_deptno   dept.deptno%type :=&p_deptno1;
     v_dname    dept.dname%type;
BEGIN
   select  dname  into v_dname
   from dept
   where deptno=v_deptno;
   DBMS_OUTPUT.PUT_LINE('DNAME : '||v_dname);
 end;
 /
 
 ----
 ACCEPT p_deptno1 PROMPT 'select2 �μ���ȣ �Է� :';
DECLARE
     v_deptno   dept.deptno%type :=&p_deptno1;
     v_dname    dept.dname%type;
     v_loc      dept.loc%type;
BEGIN
   select  dname, loc  into v_dname, v_loc
   from dept
   where deptno=v_deptno;
   DBMS_OUTPUT.PUT_LINE('DNAME : '||v_dname);
   DBMS_OUTPUT.PUT_LINE('loc : '||v_loc);
 end;
 /
 --########################
 -- ������ ���� dept_tmp_seq ( 1�� ����, 1�� ����, �ּҰ� 1, ĳ��, ����Ŭ ����)
create sequence dept_tmp_seq
start with 1
INCREMENT by 1
MINVALUE 1
NOCACHE
NOCYCLE;
 -- ���̺� ���� dept_tmp
 create table dept_tmp(
    num number,
    dname varchar2(40),
    loc varchar2(40)
);

ACCEPT p_deptno2 PROMPT '~~~�μ���ȣ �Է� :';
DECLARE
     v_deptno   dept.deptno%type :=&p_deptno2;
     v_dname    dept.dname%type;
     v_loc      dept.loc%type;
BEGIN
   select  dname, loc  into v_dname, v_loc
   from dept
   where deptno=v_deptno;
   insert into dept_tmp values(dept_tmp_seq.nextval,v_dname,v_loc );
   commit;
   DBMS_OUTPUT.PUT_LINE('DNAME : '||v_dname);
   DBMS_OUTPUT.PUT_LINE('loc : '||v_loc);
EXCEPTION  
    when no_data_found then
      DBMS_OUTPUT.PUT_LINE('N/A');
end;
 /
 select * from dept_tmp;











