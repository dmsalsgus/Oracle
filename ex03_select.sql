--ex03_select.sql


/*

SQL, Query(질의)

SELECT문
- DML
- DQL

[WITH <Sub Query>]  --> WITH 절
    SELECT column_list  --> SELECT 절
    FROM table_name  --> FROM 절
    [WHERE search_condition]  --> WHERE절
    [GROUP BY group_by_expression]  --> GROUP BY 절
    [HAVING search_condition]  --> HAVING 절
    [ORDER BY order_expresstion [ASC|DESC]]  --> ORDER BY 절
    
    
    - 생략불가능 -
    SELECT column_list  --> 원하는 컬럼을 지정
    FROM table_name  --> 데이터소스. 어떤 테이블로부터 데이터를 가져와라.
    
    각 절의 실행 순서 : FROM -> SELECT

*/

select * from tblType;

--테이블 구조는 스키마(Scheme)라고 한다. -> 자세한 구조보려면 명세서를 확인하기.
desc employees;  --테이블 구조를 확인할 수 있는 명령어.

select * from employees;
select first_name from employees;

select * from tbladdressbook;
select * from tblcomedian;
select * from tblcountry;
select * from tbldiary;
select * from tblhousekeeping;
select * from tblinsa;
select * from tblmen;
select * from tblwomen;
select * from tblsalary;
select * from tbltodo;
select * from tblzoo;
select * from zipcode;

/*
select 컬럼리스트


*/
select first from tblcomedian; --단일컬럼
select nick from tblcomedian;  --단일컬럼

select * from tblcomedian;  --밑에와 동일
select first, last, gender, height, weight, nick from tblcomedian;  --위에와 동일
--다중 컬럼(컬럼명, 컬럼명, 컬럼명,,) --순서는 가져올 때 내맘대로 가져올 수 있다.

select last, length(last) from tblcomedian;  --동일 컬럼 반복으로 가져오기도 가능.

