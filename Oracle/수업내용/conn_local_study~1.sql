--1. ���̺� ���� Ȯ�� ���(DESC)
DESC STUDENT;

--2. �����͸� ��ȸ�ϴ� �⺻ Select ����
SELECT SNO
    , SNAME
    FROM STUDENT;
    
-- * ���̺��� ��� �÷��� ��ȸ
SELECT *
    FROM STUDENT;
    
--3. ��ȸ�ϴ� �÷��� ���̺� ��Ī ���̱�
--3-1. �÷��� ��Ī���̱�(���� ����� ��Ī�� ���δ�.)
SELECT SNO AS �л���ȣ
    , SNAME AS �л��̸�
    FROM STUDENT;

--3-2. ���̺� ��Ī ���̱�
--���̺� ���� ��Ī�� �ش� ����(SQL)�ȿ���
--���̺��� ��Ī���� ����ϰڴٴ� ���̴�.
--�� �� �̻� ���̺��� ����ؼ� ��ȸ�� ��
--�ߺ��� �÷��� �����ϸ� � ���̺��� �÷���
--��ȸ�� �� �����ؾ��ϴ��� �׷� �� �ַ� ���̺�
--��Ī�� �ٿ��� �ָ��� �÷��� ��ȸ�� ���̺��� ������ �� �ִ�.
--��Ī�� ������� ���� ���� ���̺��.�÷����� ������ ���� �ִ�.
SELECT ST.SNO
    ,  ST.SNAME
    ,  ST.SYEAR
  FROM STUDENT ST,
       SCORE SC
  WHERE ST.SNAME LIKE '%��%';
  
--4. NULL�� ó�����ִ� NVL
--4-1. NVL�� ������� �ʾ��� ���
SELECT ENO
    , ENAME
    , SAL
    , COMM
    FROM EMP;
    
--4-2. NVL ���
--�ڹٿ� �������� �� null���� �ڹٷ� �״�� �Ѿ��
--NullPointerException�� �߻��� Ȯ���� �������� ������
--null���� ���� Ȯ���� �ִ� �÷����� �׻� NVLó���� ���ش�.
SELECT ENO
    , ENAME
    , SAL
    , NVL(COMM, 0) AS COMM
    FROM EMP;
    
--5. ���Ῥ����(||)
--5-1. ��� �̸� �޿� �����ؼ� ���(EMP)
SELECT ENO 
    , ENAME || '-' || SAL
    FROM EMP;
    
--5-2. �л���ȣ��-�⸻��� ����(SCORE)
SELECT SNO || '-' || RESULT AS "�л���ȣ �⸻��� ����"
    FROM SCORE;
--5-3. �л���ȣ : �л��̸� �����ؼ� ���(STUDENT)
SELECT SNO || ':' || SNAME AS "�л���ȣ �л��̸�"
    FROM STUDENT;

--6. �ߺ� ������ DISTINCT
SELECT JOB
    FROM EMP;
    
--6-1. �÷� �ϳ��� ���� �ߺ� ����
SELECT DISTINCT JOB
    FROM EMP;
    
--6-2. �÷� �� �� �̻� ���� �ߺ� ����
--���� �÷��� DISTINCT�� �ٿ��ִ°� �ƴϰ�
--�� ���� �÷��� �� ���� ������ ���� �ż� 
--�� �� �÷��� �����Ͱ� ��� �ߺ����� ������
--�ߺ����� �ν����� �ʴ´�.
SELECT DISTINCT JOB
    , MGR
    FROM EMP;
    
--7. �����͸� �������ִ� ORDER BY
--7-1. �� ���� �÷��� ���� ����
--������������ ����. ASC ���� ����
SELECT *
    FROM STUDENT
    ORDER BY SYEAR ASC;
--������������ ����. DESC�� ���� �Ұ���
SELECT *
    FROM STUDENT
    ORDER BY SYEAR DESC;
    
--7-2. �� �� �̻� �÷��� �������� ����
--������������ ����
--�ĸ��� ����ؼ� ���� ���ĵ� ��� �÷��� ����
--���� ������ �÷����� ������ �����ϰ�
--���� ���� �÷��� ���� ������ �����Ѵ�.
SELECT *
    FROM STUDENT
    ORDER BY SYEAR, SNAME ASC;
    
--�� �÷��� ���� ���� ����� ���� ������ �� �ִ�.
SELECT *
    FROM STUDENT
    ORDER BY SYEAR DESC, MAJOR, AVR ASC;
    
-- �μ���(DNO)�� �����ϴµ� �޿�(SAL)�� ���� ��� ���� ��������(EMP)
-- ENO, ENAME, DNO, SAL
SELECT ENO
    ,   ENAME
    ,   DNO
    ,   SAL
    FROM EMP
    ORDER BY DNO, SAL DESC;
    
-- ��Ī�� ���� ��쿡�� ��Ī���� ���ĵ� ����
SELECT ENO
    ,   ENAME
    ,   DNO AS �μ���ȣ
    ,   SAL AS �޿�
    FROM EMP
    ORDER BY �μ���ȣ, �޿� DESC;

--8. ������ �ɾ��ִ� WHERE
--8-1. ���� ũ�� ��
--�޿��� 3000�̻��� ������� ��ȸ
SELECT *
    FROM EMP
    WHERE SAL > 3000;
    
--������ ȭ�а��� �л��� ���
SELECT *
    FROM STUDENT
    WHERE MAJOR = 'ȭ��';
    --ORDER BY SYEAR;
    
--�������� ����� ���� �÷��� Ÿ������ ���� ���� �����Ѵ�.
--���� �÷��� Ÿ�԰� �ٸ� Ÿ������ ���� ���
--�÷��� ��� �����Ͱ� ���� Ÿ������ ����� ���� �񱳸� �ϰ� �ȴ�.
--�����Ͱ� ������ ��� ��� �����Ϳ��� �ѹ��� ����ȯ�� �Ͼ�� ������
--���� �ӵ��� �ſ� ���ϵȴ�.
SELECT *
    FROM EMP
    WHERE SLA >= '3000';
    
--���������� ���� �� �÷��� Ÿ���� ��ȯ�ϴ� ���� �־�� �ȵȴ�. 
--���� ���� �÷��� Ÿ�԰� �����ּž� �ȴ�.
--SELECT *
--    FROM TABLE
--    WHERE TO_CHAR(DATE) = '���Ұ�';

--DNO�� null ���� ��� ��ȸ
SELECT *
    FROM EMP
    WHERE COMM IS NULL;
    
--9. ���� ���� ����� AND, OR
--9-1. ��� ������ �����ϴ� �����͸� ��ȸ
--1�г��̸鼭 �̸��� '��'�� ������ �л� ���
SELECT *
    FROM STUDENT
    WHERE SYEAR = 1
      AND SNAME LIKE '%��';
      
--ȸ������� �ϸ鼭 �޿��� 3000�̻��̰� �̸��� ������ ���� ��� ��ȸ
SELECT *
    FROM EMP
    WHERE JOB = 'ȸ��'
     AND SAL >= 3000
     AND ENAME LIKE '___';
     
--�⸻��� ������ 75�̻��̰ų� �����ȣ�� 1211�� �л� ��� ��ȸ
SELECT *
    FROM SCORE
    WHERE RESULT >= 75
     OR CNO = '1211';
     
--AND, OR ȥ�ջ��
--DNO�� 10�̰ų� �޿��� 1600�̻��� ������ ���ʽ��� 600�̻��� ���� ��ȸ
--()�� �̿��ؼ� �켱������ ���� �� �ִ�.
SELECT *
    FROM EMP
    WHERE (DNO = 30
     OR SAL >= 2000)
     AND COMM >= 600;
     
--������ 2.0�̻��̰ų� �̸��� 3���� �л��� ���� ������ �л� ��� ���
SELECT *
    FROM STUDENT
    WHERE (AVR >= 2.0
    OR SNAME LIKE '___')
    AND MAJOR = '����';