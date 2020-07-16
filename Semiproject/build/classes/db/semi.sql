----------------------------------------------------------------------------------------------
---------------------------------------회원 talbe-----------------------------------------------
----------------------------------------------------------------------------------------------
DROP TABLE MEMBER;
--회원번호 시퀀스
DROP SEQUENCE MEMBERNOSQ;

CREATE SEQUNECE MEMBERNOSQ NOCHAHE;
--(회원번호,아이디,비밀번호,이름,생일,성별,이메일,은행명,계좌번호,잔액정보)
CREATE TABLE MEMBER
(
    MEMBERNO    NUMBER           NOT NULL, 
    ID          VARCHAR2(100)    NOT NULL, 
    PW          VARCHAR2(100)    NOT NULL, 
    NAME        VARCHAR2(20)     NOT NULL, 
    BIRTH       DATE             NOT NULL, 
    GENDER      CHAR(2)          NOT NULL, 
    EAMIL       VARCHAR2(100)    NOT NULL, 
    BANK        VARCHAR2(50)     NOT NULL, 
    BANKNO      NUMBER           NOT NULL, 
    ACCOUNT     NUMBER           DEFAULT 0	NOT NULL, 
    STOCKACCOUNT NUMBER 		 DEFAULT 0 	NOT NULL,
    CONSTRAINT MEMBER_PK PRIMARY KEY (MEMBERNO)
);

COMMENT ON COLUMN MEMBER.MEMBERNO IS '회원번호';

COMMENT ON COLUMN MEMBER.ID IS '아이디';

COMMENT ON COLUMN MEMBER.PW IS '비밀번호';

COMMENT ON COLUMN MEMBER.NAME IS '이름';

COMMENT ON COLUMN MEMBER.BIRTH IS '생일';

COMMENT ON COLUMN MEMBER.GENDER IS '성별';

COMMENT ON COLUMN MEMBER.EAMIL IS '이메일';

COMMENT ON COLUMN MEMBER.BANK IS '은행명';

COMMENT ON COLUMN MEMBER.BANKNO IS '계좌번호';

COMMENT ON COLUMN MEMBER.ACCOUNT IS '잔액정보';

----------------------------------------------------------------------------------------------
------------------------------------------게시판 table-------------------------------------------
----------------------------------------------------------------------------------------------
DROP TABLE BOARD;
DROP SEQUENCE BOARDNOSQ;

-- 게시글번호  SEQUENCE
CREATE SEQUENCE BOARDNOSQ NOCHACHE;
--(글번호, 제목, 내용, 작성자, 작성일, 조회수)
CREATE TABLE BOARD
(
    BOARDNO    NUMBER              NOT NULL, 
    TITLE      VARCHAR2(400)     NOT NULL, 
    CONTENT    VARCHAR2(4000)    NOT NULL, 
    ID         VARCHAR2(100)     NOT NULL, 
    REGDATE    DATE              NOT NULL, 
    CHECKNO    NUMBER               NOT NULL, 
    CONSTRAINT BOARD_PK PRIMARY KEY (BOARDNO)
);

COMMENT ON COLUMN BOARD.BOARDNO IS '글번호';

COMMENT ON COLUMN BOARD.TITLE IS '글제목';

COMMENT ON COLUMN BOARD.CONTENT IS '글내용';

COMMENT ON COLUMN BOARD.ID IS '작성자';

COMMENT ON COLUMN BOARD.REGDATE IS '등록일';

COMMENT ON COLUMN BOARD.CHECKNO IS '조회수';

----------------------------------------------------------------------------------------------
------------------------------------------댓글 table--------------------------------------------
----------------------------------------------------------------------------------------------
DROP TABLE COMMENT;
DROP SEQUENCE COMMENTSQ;

-- 댓글번호 SEQUENCE
CREATE SEQUENCE COMMENTSQ NOCHACHE;

-- (글번호,댓글번호,댓글내용,댓글작성자,작성일,부모댓글)
CREATE TABLE BOARD_COMMENT(
    BOARDNO            NUMBER            NOT NULL, 
    COMMENT_NO         NUMBER            NOT NULL, 
    COMMENT_CONTENT    VARCHAR2(1000)    NOT NULL, 
    COMMENT_ID         VARCHAR2(100)     NOT NULL, 
    REGDATE            DATE              NOT NULL, 
    COMMENT_PARENT     NUMBER,          
    CONSTRAINT COMMENT_PK PRIMARY KEY (COMMENT_NO),
    CONSTRAINT FK_COMMENT_BOARDNO FOREIGN KEY (BOARDNO)
        REFERENCES BOARD (BOARDNO)
);


COMMENT ON COLUMN BOARD_COMMENT.BOARDNO IS '글번호';

COMMENT ON COLUMN BOARD_COMMENT.COMMENT_NO IS '댓글번호';

COMMENT ON COLUMN BOARD_COMMENT.COMMENT_CONTENT IS '댓글내용';

COMMENT ON COLUMN BOARD_COMMENT.COMMENT_ID IS '댓글작성자';

COMMENT ON COLUMN BOARD_COMMENT.REGDATE IS '댓글작성일';

COMMENT ON COLUMN BOARD_COMMENT.COMMENT_PARENT IS '부모댓글';



----------------------------------------------------------------------------------------------
---------------------------------------주가 talbe-----------------------------------------------
----------------------------------------------------------------------------------------------
DROP TABLE STOCK;

-- (종목코드,종목명,현시세(STRING),전일비,현시세(NUMBER))
CREATE TABLE STOCK
(
    CODE        VARCHAR2(50)          NOT NULL, 
    ENT         VARCHAR2(50)    NOT NULL, 
    PRICE       VARCHAR2(50)    NOT NULL, 
    EXDAY       VARCHAR2(50)          NOT NULL, 
    NUMPRICE    NUMBER          NOT NULL, 
    CONSTRAINT STOCK_PK PRIMARY KEY (CODE)
);

COMMENT ON COLUMN STOCK.CODE IS '종목코드';

COMMENT ON COLUMN STOCK.ENT IS '종목명';

COMMENT ON COLUMN STOCK.PRICE IS '현시세';

COMMENT ON COLUMN STOCK.EXDAY IS '전일비';

COMMENT ON COLUMN STOCK.NUMPRICE IS '현시세';

----------------------------------------------------------------------------------------------
---------------------------------------거래 talbe-----------------------------------------------
----------------------------------------------------------------------------------------------
DROP TABLE TARDE;

--(거래ID,종목코드,구매주식수)
CREATE TABLE TRADE
(
    TRADEID    VARCHAR2(100)    NOT NULL, 
    CODE       VARCHAR2(50)           NOT NULL, 
    HOLDING    NUMBER           NOT NULL, 
    CONSTRAINT TRADE_PK PRIMARY KEY (TRADEID, CODE)
);

COMMENT ON COLUMN TRADE.TRADEID IS '구매자';

COMMENT ON COLUMN TRADE.CODE IS '종목코드';

COMMENT ON COLUMN TRADE.HOLDING IS '보유주식수';

-- 참조
ALTER TABLE TRADE
    ADD CONSTRAINT FK_TRADE_CODE_STOCK_CODE FOREIGN KEY (CODE)
        REFERENCES STOCK (CODE);

ALTER TABLE TRADE
    ADD CONSTRAINT FK_TRADE_TRADEID_MEMBER_ID FOREIGN KEY (TRADEID)
        REFERENCES MEMBER (ID);