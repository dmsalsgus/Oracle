--ex02_datatype.sql

/*
관계형 데이터베이스
- 변수x -> SQL은 프로그래밍 언어가 아니다.
- SQL -> 대화형 언어 -> DB와 대화를 목적으로 하는 언어
- 자료형 -> 데이터 저장하는 규칙 -> 테이블 정의할 때 사용


ANSI-SQL 자료형(오라클 자료형)

. 숫자형 : 정수, 실수 -> number(38자리 이하의 숫자를 표현하는 자료형, 크기는 가변적으로 대략 5~22byte)
        - number : 정수 & 실수
        - number(precision) : 전체 자릿수, 정수
        - number(precision, scale) : 전체 자릿수, 소수이하 자릿수, 실수

. 문자형 : 문자, 문자열
    -> char vs nchar의 차이?
    -> char vs varchar의 차이?
    
        - char : 고정 자릿수 문자열(공간(컬럼)의 크기가 변하지 않음==불변)
               - char(n) : 최대 n자리 문자열, n(바이트) -> 최소 크기 : 1바이트, 최대 크기 : 2000바이트
               
        - nchar : n==national -> 오라클 인코딩과 상관없이 해당 컬럼을 UTF-16으로 동작하게.
                - char(n) : 최대 n자리 문자열, n(문자수) -> 최소 크기 : 1글자, 최대 크기 : 1000글자
        
        - varchar2 : 가변 자릿수 문자열(즉, 공간(컬럼)의 크기가 가변)
                   - varchar2(n) : 최대 n자리 문자열, n(바이트)
                   - varchar2(n char) : 최소 자릿수 : 1바이트, 최대 크기 : 4000바이트
        
        - nvarchar2 : n==national -> 오라클 인코딩과 상관없이 해당 컬럼을 UTF-16으로 동작하게.
                   - 가변 자릿수 문자열(즉, 공간(컬럼)의 크기가 가변)
                   - varchar2(n) : 최대 n자리 문자열, n(문자수)
                   - varchar2(n char) : 최소 자릿수 : 1글자, 최대 크기 : 2000글자
                   
        - clob, nclob : 대용량 텍스트, character large object
                      - 최대 128TB
                      - 참조형
                      
                   
        a. 고정 자릿수 문자열 -> 주민등록번호, 전화번호 -> char
        b. 가변 자릿수 문자열 -> 주소, 자기소개 -> varchar2
        
        a. 고정/가변 -> varchar2
        

. 날짜/시간형
    a. date : 년월일시분초, 7byte, 기원전 4712년 1월 1일 ~ 9999년 12월 31일
    
    b. timestamp : 년월일시분초 + 밀리초 + 나노초
    
    c. interval : 시간, 틱값 저장용
    

. 이진 데이터형 : 비 텍스트 데이터(이미지, 영상, 음악, 실행파일, 압축파일 등등)
               : 게시판(첨부파일), 회원가입(사진) -> 파일명만 저장(문자열) 
    a. blob : 최대 28TB
    
    
**결론**
. 숫자 -> number
. 문자 -> varchar2 + char
. 날짜 -> date


*/

--테이블 선언(생성)
/*
    create table 테이블명(
        컬럼 선언,
        컬럼 선언,
        컬럼 선언,
        컬럼명 자료형
    );
*/
create table tblType(
    --num number   --컬럼이름 컬럼자료형
    --num number(3)  --3자리까지 집어넣겠다. -> -999 ~ +999
    --num number(4,2)  --앞에는 자릿수, 뒤에는 소수이하 2자리까지 나타내겠다. 소수자리까지 포함해서 4자리. -> -99.99 ~ +99.99
    
    --txt char(10)  --최대 10바이트까지의 문자열. 뒤에 byte가 생략된 것.
    --txt char(10 char)  --최대 10글자까지 넣을 수 있는 문자열.
    
    --txt varchar2(10)
    
    --txt1 char(10),
    --txt2 varchar2(10)
    
    regdate date
    
    
);

Drop table tblType;

-- 데이터 추가
-- insert into 테이블명 (컬럼) values (값);
--숫자형
insert into tblType (num) values (100);  --정수 리터럴
insert into tblType (num) values (3.14);  --실수 리터럴
insert into tblType (num) values (3.99);   --반올림해줌
insert into tblType (num) values (1234);   --위에 3자리까지만 넣겠다고 지정했는데 자릿수를 넘어가서 에러.
insert into tblType (num) values (999);
insert into tblType (num) values (-999);

insert into tblType (num) values (99.99);
insert into tblType (num) values (-99.99);

insert into tblType (num) values (1234567890);
insert into tblType (num) values (12345678901234567890);
insert into tblType (num) values (123456789012345678901234567890);
insert into tblType (num) values (1234567890123456789012345678901234567890);
insert into tblType (num) values (12345678901234567890123456789012345678901234567890);

------------------------------------------------------------------------------------------
-- SQL의 암시적인 형변환이 자주 일어난다.
insert into tblType (txt) values (100);  -- 100(number) -> '100'(char)
insert into tblType (txt) values ('홍길동');  --문자 리터럴 -> ""는 안됨.
insert into tblType (txt) values ('홍길동');

--오라클 인코딩 -> UTF-8 -> 영어는 1byte, 한글은 3byte
insert into tblType (txt) values ('abcdabcdab');
insert into tblType (txt) values ('abcdabcdabc');  --이건 11byte라서 삽입 불가능
insert into tblType (txt) values ('홍길동입니다.');  --에러 19byte

insert into tblType (txt) values ('홍길동');
insert into tblType (txt) values ('홍길동님');  --12byte를 넣어서 에러남.

insert into tblType(txt1, txt2) values ('abc', 'abc');
-- 둘다 10바이트의 공간을 가지고 있지만 3바이트를 넣었을 때, varchar2는 나머지 7바이트를 버리고 3바이트만 가진다. char는 10바이트 공간길이 유지.
--txt1 -> "abc       "
--txt2 -> "abc"

insert into tblType (regdate) values ('2023-08-25');  --23/08/25








--데이터 가져오기 -> 결과 테이블(Result Table), 결과셋(ResultSet)
select * from tblType;
commit;

--*** 오라클은 모든 식별자를 대문자로 저장한다.

/*

DB Client Tools
. SQL Developer : 오라클 제공, 무료, 그럭적럭
. SQL *Plus : 오라클 제공, 무료, 오라클 설치될 때 같이 설치. CLI
. SQLGate
. Orange
. DBeaver
. Toad
. DataGrip(jetbrains)

*/








