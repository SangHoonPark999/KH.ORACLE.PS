CREATE TABLE SUBJECT(
    NO NUMBER(3),
    S_NUM NUMBER(2) NOT NULL,
    S_NAME VARCHAR2(30) NOT NULL
);
ALTER TABLE SUBJECT ADD CONSTRAINT SUBJECT_PK PRIMARY KEY(NO);

INSERT INTO SUBJECT VALUES (01,01,'컴퓨터학과');
INSERT INTO SUBJECT VALUES (02,02,'교육학과');
INSERT INTO SUBJECT VALUES (03,03,'신문방송학과');
INSERT INTO SUBJECT VALUES (04,04,'인터넷 비지니스과');
INSERT INTO SUBJECT VALUES (05,05,'기술경영과');

CREATE TABLE STUDENT(
    NO NUMBER(3) NOT NULL,
    SD_NUM NUMBER(8) NOT NULL,
    SD_NAME VARCHAR2(20) NOT NULL,
    SD_ID VARCHAR2(10) NOT NULL, 
    SD_PASSWD VARCHAR2(12) NOT NULL,
    S_NUM NUMBER(4) NOT NULL,
    SD_JUMIN NUMBER(13) NOT NULL,
    SD_PHONE NUMBER(11) NOT NULL,
    SD_ADDRESS VARCHAR2(40) NOT NULL,
    SD_EMAIL VARCHAR2(25) NOT NULL,
    SD_DATE DATE DEFAULT SYSDATE NOT NULL
);
ALTER TABLE STUDENT ADD CONSTRAINT STUDENT_PK PRIMARY KEY(NO);

CREATE TABLE LESSON(
    NO NUMBER(3) NOT NULL,
    L_NUM VARCHAR2(2) NOT NULL,
    L_NAME VARCHAR2(20) NOT NULL
);
ALTER TABLE LESSON ADD CONSTRAINT LESSON_PK PRIMARY KEY(NO);

INSERT INTO LESSON VALUES (01,K,'국어');
INSERT INTO LESSON VALUES (02,M,'수학');
INSERT INTO LESSON VALUES (03,E,'영어');
INSERT INTO LESSON VALUES (04,H,'역사');
INSERT INTO LESSON VALUES (05,P,'프로그래밍');
INSERT INTO LESSON VALUES (06,D,'데이터베이스');
INSERT INTO LESSON VALUES (07,ED,'교육학이론');

CREATE TABLE TRAINEE(
     NO NUMBER(3) NOT NULL,
     SD_NUM NUMBER(8) NOT NULL,
     L_NUM NUMBER(2) NOT NULL,
     T_SECTION VARCHAR2(20) NOT NULL,
     T_DATE DATE DEFAULT SYSDATE NOT NULL
);
ALTER TABLE TRAINEE ADD CONSTRAINT TRAINEE_PK PRIMARY KEY(NO);

ALTER TABLE SUBJECT
ADD CONSTRAINT SUBJECT_NO_FK
FOREIGN KEY(S_NUM) REFERENCES STUDENT(S_NUM);

ALTER TABLE TRAINEE
ADD CONSTRAINT TRAINEE_STUDENT_FK
FOREIGN KEY(SD_NUM) REFERENCES STUDENT(SD_NUM);

ALTER TABLE TRAINEE
ADD CONSTRAINT TRAINEE_LESSON_FK
FOREIGN KEY(L_NUM) REFERENCES LESSON(L_NUM);



--SALES 부서 소속 사원의 이름과 입사일을 출력하라.
SELECT E.FIRST_NAME, E.HIRE_DATE
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID AND UPPER(D.DEPARTMENT_NAME) = UPPER('SALES');

--커미션을 받는 직원의 이름과 그가 속한 부서명을 출력하라.
SELECT E.FIRST_NAME, D.DEPARTMENT_NAME
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID AND E.COMMISSION_PCT IS NOT NULL;



--GUY와 동일한 부서에서 근무하는 직원의 이름과 부서번호를 출력하라.
SELECT E1.FIRST_NAME, E1.DEPARTMENT_ID
FROM EMPLOYEES E1, EMPLOYEES E2
WHERE E2.FIRST_NAME = 'Guy' AND E1.DEPARTMENT_ID = E2.DEPARTMENT_ID;


