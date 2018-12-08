DROP TABLE USER_CALENDAR;
DROP SEQUENCE CAL_SEQ;

CREATE SEQUENCE CAL_SEQ;

--��ȣ, ���̵�, ����, ����, ���� , ��¥ 
CREATE TABLE USER_CALENDAR(
	CAL_NO NUMBER PRIMARY KEY NOT NULL,
	CAL_ID VARCHAR2(2000) NOT NULL,
	CAL_TITLE VARCHAR2(2000) NOT NULL,
	CAL_CONTENT VARCHAR2(4000) NOT NULL,
	CAL_MDATE VARCHAR2(12) NOT NULL, 
	CAL_REGDATE DATE NOT NULL  
);

INSERT INTO USER_CALENDAR VALUES(CAL_SEQ.NEXTVAL,'단비짱', '부산먹방투어', '신나고 재미지게 놀다 오기','201812302400', SYSDATE );


SELECT * FROM USER_CALENDAR;