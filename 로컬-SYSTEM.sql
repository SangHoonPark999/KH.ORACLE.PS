ALTER SESSION SET "_ORACLE_SCRIPT"=true;

-- 기존사용자 삭제(MODEL)
drop user MODEL cascade;

--새로운 사용자 생성
create user MODEL identified by 1234
    default tablespace users
    temporary tablespace temp;
    
    
-- 권한설정(접속요청, CURD, 관리자 요청)
grant connect, resource, dba to MODEL;

--테이블 스페이스(데이터베이스 저장될 공간생성)
CREATE TABLESPACE FIRSTDATA
DATAFILE 'C:\oracleex\oradata\XE/FIRST01.DBF' SIZE 10M;

--테이블 스페이스 (데이터베이스 저장될 공간추가) 1m
ALTER TABLESPACE FIRSTDATA
ADD DATAFILE 'C:\oracleex\oradata\XE/FIRST02.DBF' SIZE 1M;

--테이블 스페이스 (데이터베이스 저장될 공간 크기 수정하는 방법:작게는 불가능하다) 1m
ALTER DATABASE DATAFILE 'C:\oracleex\oradata\XE/FIRST02.DBF' RESIZE 10M

--테이블 스페이스 (데이터베이스 저장될 공간 자동솔종 하는 방법) 1m
alter database 
datafile 'C:\oracleex\oradata\XE/FIRST02.DBF' 
autoextend on 
next 1M 
maxsize 20M; 

--1.시스템 권한을 가진자가 계정을 설정 2. TEST 비밀번호 1234 3.CONNECT와 RESOURCE와 DBA권한
CREATE USER TEST IDENTIFIED BY 1234
DEFAULT TABLESPACE USERS
TEMPORARY TABLESPACE TEMP;

GRANT CONNECT, RESOURCE, DBA TO TEST;