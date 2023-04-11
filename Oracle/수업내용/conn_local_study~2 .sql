-------------------------------------- 1 --------------------------------------

--1)student ���̺� ������ �˻��ض�
desc student;

--2)course ���̺� ������ �˻��ض�
desc course;

--3)professor ���̺� ������ �˻��ض�
desc professor;

--4)score ���̺� ������ �˻��ض�
desc score;

--5) ��� �л��� ������ �˻��ض�
select * from student;

--7) ��� ������ ������ �˻��ض�
select * from course;

--8) �⸻��� ���������� �˻��ض�
select result from score;

--9) �л����� �а��� �г��� �˻��ض�
select sname, major, syear from student;

--10) �� ������ �̸��� ������ �˻��ض�
select cname, st_num from course;

--11) ��� ������ ������ �˻��ض�
select pname, orders from professor;

-------------------------------------- 2 --------------------------------------

--1) �� �л��� ������ �˻��϶�(��Ī�� ���)
select sname as �л�, avr as ���� from student;

--2) �� ������ �������� �˻��϶�(��Ī�� ���)
select cname as ����, st_num as ���� from course;

--3) �� ������ ������ �˻��϶�(��Ī�� ���)
select pname as ����, orders as ���� from professor;

--4) �޿��� 10%�λ����� �� ���� ���޵Ǵ� �޿��� �˻��϶�(��Ī�� ���)
select ename as ����, sal * 1.1 as �λ�޿����� from emp;

--5) ���� �л��� ��� ������ 4.0�����̴�. �̸� 4.5�������� ȯ���ؼ� �˻��϶�(��Ī�� ���)
select sname as �л�, avr * 1.125 as ��� from student;

-------------------------------------- 3 --------------------------------------

--1) '__�а��� __�л��� ���� ������ __�Դϴ�' ���·� �л��� ������ ����϶�
select major||'�а� '||sname||' �л��� ���� ������ '||avr||'�Դϴ�.' as ���� from student;

--2) '__������ __���� �����Դϴ�.' ���·� ������ ������ ����϶�
select cname||' ������ '||st_num||'���� �����Դϴ�.' as ���� from course;

--3) '__������ __�а� �Ҽ��Դϴ�.' ���·� ������ ������ ����϶�
select pname||'������ '||section||'�а� �Ҽ��Դϴ�.' as ���� from professor;

--4) �б����� � �а��� �ִ��� �˻��Ѵ�(�л� ���̺� ������� �˻��Ѵ�)
select distinct major as �а� from student;

--5) �б����� � �а��� �ִ��� �˻��Ѵ�(���� ���̺� ������� �˻��Ѵ�)
select distinct section as �а� from professor;

--6) ������ ������ � �͵��� �ִ��� �˻��Ѵ�
select distinct orders from professor;

-------------------------------------- 4 --------------------------------------

--1) ���������� �л��� �̸��� �˻��϶�
select sname as �л�, avr as ���� from student order by avr desc;

--2) �а��� ���������� �л��� ������ �˻��϶�
select sname as �л�, major as �а�, avr as ���� from student order by �а�, ���� desc;

--3) �г⺰ ���������� �л��� ������ �˻��϶�
select sname, syear, avr from student order by syear desc, avr desc;

--4) �а��� �г⺰�� �л��� ������ ���������� �˻��϶�
select sname as �̸�, major as �а�, syear as �г�, avr as ���� from student order by �а�, �г�, ���� desc;

--5) ���������� ���� �̸��� �˻��϶�
select * from course order by st_num desc; -------------------- null �ذ�

--6) �� �а����� ������ ������ �˻��϶�
select * from professor order by section;

--7) �������� ������ ������ �˻��϶�
select * from professor order by orders;

--8) �� �а����� ������ ������ �������� ������ �˻��϶�
select * from professor order by section, hiredate;

-------------------------------------- 5 --------------------------------------

--1) ȭ�а� �л��� �˻��϶�
select * from student where major = 'ȭ��';

--2) ������ 2.0 �̸��� �л��� �˻��϶�
select * from student where avr < 2.0 order by avr desc;

--3) ���� �л��� ������ �˻��϶�
select sname , avr from student where sname = '����';

--4) ������ ����� �˻��϶�
select * from professor where orders = '������';

--5) ȭ�а� �Ҽ� ������ ����� �˻��϶�
select pname from professor where section = 'ȭ��';

--6) �۰� ������ ������ �˻��϶�
select * from professor where pname = '�۰�';

--7) �г⺰�� ȭ�а� �л��� ������ �˻��϶�
select * from student where major = 'ȭ��' order by syear;

--8) 2000�� ������ ������ ������ ������ �����ϼ����� �˻��϶� x
select * from professor where hiredate < 2000;

--9) ��� ������ ���� ������ ������ �˻��϶�
select * from course where pno is null;

-------------------------------------- 6 --------------------------------------

--1) �������� ������, �Ŀ��� �л��� �˻��϶�
select * from student where major = '����' or major = '����' or major = '�Ŀ�';

--2) ȭ�а��� �ƴ� �л��߿� 1�г� �л��� �˻��϶�
select * from student where major != 'ȭ��' and syear = 1;

--3) �����а� 3�г� �л��� �˻��϶�
select * from student where major = '����' and syear = 3;

--4) ������ 2.0���� 3.0������ �л��� �˻��϶�
select * from student where avr >= 2.0 and avr <= 3.0;

--5) ������ �������� ���� �����߿� ������ 3������ ������ �˻��϶�
select * from course where pno is null and st_num = 3;

--6) ȭ�а� ���õ� ������ ������ 2���� ������ ������ �˻��϶�
select * from course where cname like '%ȭ��%' and st_num <= 2;

--7) ȭ�а� �������� �˻��϶�
select * from professor where section like 'ȭ��' and orders like '������';

--8) �����а� �л��߿� ���� �縶���� �л��� �˻��϶�
select * from student where sname like '�縶%' and major like '����';

--9) ���� �̸��� ���� 1������ ������ �˻��϶�
select * from professor where pname like '__';