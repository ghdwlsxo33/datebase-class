--pl/sql (p420)
set SERVEROUTPUT on;

BEGIN
    dbms_output.put_line('Hello');
end;
/

--p421
DECLARE
    v_ename varchar2(10);
    v_empno number(4) := 7788;
    v_tax  CONSTANT number(1) := 3;
    v_deptno number(2) not null default 10;
    v_deptno1 dept.deptno%type := 5;  --������
BEGIN
    v_ename  := 'SMITH';
    -- v_empno  := 7788;
    DBMS_OUTPUT.PUT_LINE('v_ename : ' || v_ename );  -- v_ename : SMITH
    DBMS_OUTPUT.PUT_LINE('v_empno : ' || v_empno );  -- v_empno : 7788
    v_empno := 9900;
    DBMS_OUTPUT.PUT_LINE('v_empno : ' || v_empno );
    DBMS_OUTPUT.PUT_LINE('v_tax : ' || v_tax );  --  v_tax : 3
    --v_tax := 5; �����߻�
    DBMS_OUTPUT.PUT_LINE('v_tax : ' || v_tax );  --  v_tax :3
    DBMS_OUTPUT.PUT_LINE('v_deptno : ' || v_deptno );
    DBMS_OUTPUT.PUT_LINE('v_deptno1 : ' || v_deptno1 );
end;
/

--p429
select * from dept;
select deptno, dname, loc from dept where deptno = 40;

DECLARE
    v_deptno_row    dept%rowtype;
    v_number        number := 15;
BEGIN
    select deptno, dname, loc into v_deptno_row
    from dept
    where deptno=40;
    if  mod(v_number,2) = 1    then
        DBMS_OUTPUT.PUT_LINE(v_number  || ' Ȧ���Դϴ�.');
    else
        DBMS_OUTPUT.PUT_LINE(v_number  || ' ¦���Դϴ�.');
    end if;    
    
    DBMS_OUTPUT.PUT_LINE('v_number : ' || v_number);
    DBMS_OUTPUT.PUT_LINE('------ ');
    DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || v_deptno_row.deptno );
    DBMS_OUTPUT.PUT_LINE('DNAME : ' ||  v_deptno_row.dname );
    DBMS_OUTPUT.PUT_LINE('LOC    : ' || v_deptno_row.loc );
end;
/

--p434  ������� (A/B/C/D/F ����)
DECLARE
    v_score    number := 87 ;
BEGIN
    if v_score >= 90 then
        DBMS_OUTPUT.PUT_LINE('A���� ');
    elsif  v_score >= 80 then
        DBMS_OUTPUT.PUT_LINE('B���� ');
    elsif  v_score >= 70 then
        DBMS_OUTPUT.PUT_LINE('C���� ');
    elsif  v_score >= 60 then
        DBMS_OUTPUT.PUT_LINE('D���� '); 
    else 
        DBMS_OUTPUT.PUT_LINE('F���� '); 
    end if; 
    
    case trunc(v_score/10)
        when 10 then  DBMS_OUTPUT.PUT_LINE('A���� !!');
        when 9  then  DBMS_OUTPUT.PUT_LINE('A���� !!');
        when 8  then  DBMS_OUTPUT.PUT_LINE('B���� !!');
        when 7  then  DBMS_OUTPUT.PUT_LINE('C���� !!');
        when 6  then  DBMS_OUTPUT.PUT_LINE('D���� !!');
        else DBMS_OUTPUT.PUT_LINE('F���� !!');
    end case;
    
    case 
        when v_score > 90 then  DBMS_OUTPUT.PUT_LINE('A���� !');
        when v_score > 80  then  DBMS_OUTPUT.PUT_LINE('B���� !');
        when v_score > 70  then  DBMS_OUTPUT.PUT_LINE('C���� !');
        when v_score > 60  then  DBMS_OUTPUT.PUT_LINE('D���� !');
        else DBMS_OUTPUT.PUT_LINE('F���� !');
    end case;
end;
/
--�ݺ���  p439
DECLARE
    v_num   number := 0;
BEGIN
    loop
        DBMS_OUTPUT.PUT_LINE('v_num : ' || v_num);
        v_num := v_num + 1;
        if v_num > 4 then
            exit;
         end if;
     end loop;
end;
/

DECLARE
    v_num    number :=0;
BEGIN
    while v_num < 4   loop
         DBMS_OUTPUT.PUT_LINE(' ���� while v_num : ' || v_num);
         v_num := v_num + 1;
    end loop;
    
    ---- for loop
    for  i  in  0..4 loop
        DBMS_OUTPUT.PUT_LINE(' ���� i v_num : ' || i);
    end loop;
    
    for  i  in  REVERSE 0..4 loop
        DBMS_OUTPUT.PUT_LINE(' ����  REVERSEi v_num : ' || i);
    end loop;
end;
/
-- p442
BEGIN
    for i in 0..4 loop
        continue when mod(i,2) = 1;
        DBMS_OUTPUT.PUT_LINE('���� i �� �� ' || i);
    end loop;
End;
/
-- p444 ��������
--1. 1/3/5/7/9  ���
BEGIN
    for i in 1..10 loop
        if mod(i,2) = 1 then
            DBMS_OUTPUT.PUT_LINE('���� i �� �� ' || i);
        end if;    
    end loop;
end;
/

BEGIN
    for k in 1..10 loop
        continue when  mod(k,2)=0;
        DBMS_OUTPUT.PUT_LINE('���� k �� �� ' || k);
    end loop;
end;
/

DECLARE
    v_num number := 1;
BEGIN
    while v_num <10  loop
        DBMS_OUTPUT.PUT_LINE('���� v_num �� �� ' || v_num);
        v_num := v_num +2;
    end loop;
end;
/
--2. dept ���̺��� deptno �ڷ��� ==>  v_deptno
-- �μ���ȣ�� �°� �μ��� ���(10/20/30/40)
DECLARE
    v_deptno  dept.deptno%type; 
BEGIN
    case  v_deptno
        when 10 then   DBMS_OUTPUT.PUT_LINE('DNAME : ACCOUNTING');
        when 20 then   DBMS_OUTPUT.PUT_LINE('DNAME : RESEARCH');
        when 30 then   DBMS_OUTPUT.PUT_LINE('DNAME : SALES');
        when 40 then   DBMS_OUTPUT.PUT_LINE('DNAME : OPERATIONS');
        else   DBMS_OUTPUT.PUT_LINE('DNAME : N/A');
    end case;    
end;
/
-- ���� if
-- �μ���ȣ�� �Է¹޾� �μ��� ���
ACCEPT p_deptno PROMPT '�μ���ȣ �Է� :' ;
DECLARE
    v_deptno  dept.deptno%type := &p_deptno; 
BEGIN
    if v_deptno = 10 then
        DBMS_OUTPUT.PUT_LINE('DNAME : ACCOUNTING');
    elsif v_deptno = 20 then    
        DBMS_OUTPUT.PUT_LINE('DNAME : RESEARCH');
    elsif v_deptno = 30 then    
        DBMS_OUTPUT.PUT_LINE('DNAME : SALES');
    elsif v_deptno = 40 then    
        DBMS_OUTPUT.PUT_LINE('DNAME : OPERATIONS');
    else
         DBMS_OUTPUT.PUT_LINE('DNAME : N/A'); 
    end if;
end;
/
----
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



















