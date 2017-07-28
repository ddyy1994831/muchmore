-- 투자
DROP TABLE invest;
-- 상품
DROP TABLE goods;
-- 대출자정보
DROP TABLE borrower;
-- 질문게시판
DROP TABLE board;
-- 입출금내역
DROP TABLE moneyinout;
-- 계좌
DROP TABLE account;
-- 회원
DROP TABLE member;

-- 회원
CREATE TABLE member (
	member_id		VARCHAR2(30)  NOT NULL, -- 회원ID
	member_pw1       	VARCHAR2(30)  NOT NULL, -- 비밀번호
	member_pw2       	VARCHAR2(30)  NOT NULL, -- 비밀번호확인
	member_name      	VARCHAR2(30)  NOT NULL, -- 이름
	member_phone     	VARCHAR2(30)  NOT NULL, -- 핸드폰 번호
	member_jumin1    	VARCHAR2(30)  NOT NULL, -- 주민등록번호 앞자리
	member_jumin2    	VARCHAR2(30)  NOT NULL, -- 주민등록번호 뒷자리
	member_email     	VARCHAR2(30)  NOT NULL, -- 이메일
	member_zipcode   	VARCHAR2(30)  NOT NULL, -- 우편번호
	member_addr1     	VARCHAR2(200) NOT NULL, -- 기본주소
	member_addr2     	VARCHAR2(200) NOT NULL, -- 상세주소
	member_agreement 	NUMBER(1)     NOT NULL, -- 약관동의
	member_age       	NUMBER(2)     default 0, -- 나이
	member_gender    	VARCHAR2(30)  NOT NULL,  -- 성별

	CONSTRAINT PK_member 
	PRIMARY KEY(member_id)	
);

-- 계좌
CREATE TABLE account (
	member_id       	VARCHAR2(30) NOT NULL, -- 회원ID
	account_virtual 	VARCHAR2(30) NOT NULL, -- 가상계좌번호
	account_balance 	NUMBER(8)   DEFAULT 0, -- 잔액
	account_real    	VARCHAR2(30) NULL,     -- 실계좌
	account_case    	NUMBER(1)    NOT NULL,  -- 입출금경우의수

	CONSTRAINT PK_account -- 계좌 기본키
	PRIMARY KEY (
		member_id       -- 회원ID
	),
	
	-- 회원 -> 계좌
	CONSTRAINT FK_member_TO_account 
	FOREIGN KEY (member_id)	 -- 회원ID
	REFERENCES member (member_id)  -- 회원 : 회원ID
	ON DELETE CASCADE
);


-- 입출금내역
CREATE TABLE moneyinout (
	moneyinout_holder_id      	VARCHAR2(30) NOT NULL, -- 계좌주인ID
	moneyinout_other_id       	VARCHAR2(30) NOT NULL, -- 입출금주체자ID
	moneyinout_date           	TIMESTAMP    NOT NULL, -- 입출금날짜
	moneyinout_money          	NUMBER(8)    NOT NULL, -- 입출금 금액
	moneyinout_state          	VARCHAR2(30) NOT NULL, -- 상태(입금, 출금)

	CONSTRAINT PK_moneyinout -- 입출금내역 기본키
	PRIMARY KEY (
		moneyinout_holder_id,      -- 계좌주인ID
		moneyinout_other_id,       -- 입출금주체자ID
		moneyinout_date            -- 입출금날짜
	),
	
	CONSTRAINT FK_account_TO_moneyinout -- 계좌 -> 입출금내역
	FOREIGN KEY (
		moneyinout_holder_id      -- 계좌주인ID
	)
	REFERENCES account ( -- 계좌
		member_id       -- 회원ID
	)
	ON DELETE CASCADE,

	CONSTRAINT FK_account_TO_moneyinout2 -- 계좌 -> 입출금내역2
	FOREIGN KEY (
		moneyinout_other_id      -- 입출금주체자ID
	)
	REFERENCES account ( -- 계좌
		member_id       -- 회원ID
	)
	ON DELETE CASCADE
);

-- 질문게시판
CREATE TABLE board (
	board_num       	NUMBER(3)      NOT NULL, -- 질문번호
	member_id       	VARCHAR2(30)   NOT NULL, -- 작성자ID
	board_title     	VARCHAR2(50)   NOT NULL, -- 제목
	board_password  	VARCHAR2(15)   NULL,     -- 비밀번호
	board_date      	TIMESTAMP      NOT NULL, -- 등록날짜
	board_readcount 	NUMBER(3)      NOT NULL, -- 조회수
	board_content   	VARCHAR2(2000) NOT NULL, -- 내용
	board_ref       	NUMBER(3)      NOT NULL, -- 답글의 원글
	board_lev       	NUMBER(3)      NOT NULL, -- 답글 레벨
	board_seq       	NUMBER(3)      NOT NULL, -- 답글 번호
	board_pw_check  	NUMBER(1)      DEFAULT 0, -- 비밀글 체크
	CONSTRAINT PK_board -- 질문게시판 기본키
	PRIMARY KEY (
		board_num -- 질문번호
	),

	CONSTRAINT FK_member_TO_board -- 회원 -> 질문게시판
	FOREIGN KEY (
		member_id -- 작성자ID
	)
	REFERENCES member ( -- 회원
		member_id -- 회원ID
	)
	ON DELETE CASCADE
);

-- 대출자정보
CREATE TABLE borrower (
	borrower_id             	VARCHAR2(30) NOT NULL, -- 대출자ID
	borrower_registerdate 	TIMESTAMP    NOT NULL, -- 대출신청일
	borrower_rate         	NUMBER(4,2)    NOT NULL, -- 대출금리
	borrower_repay_date   	VARCHAR2(30) NOT NULL, -- 상한일
	borrower_amount       	NUMBER(8)    NOT NULL, -- 총상환액
	borrower_monthlypay   	NUMBER(8)    NOT NULL, -- 월납입금액
	borrower_limit        	NUMBER(8)    NOT NULL, -- 대출한도 금액
	borrower_credit       	VARCHAR2(5)  NOT NULL, -- 신용등급
	borrower_totalincome  	NUMBER(11)   NOT NULL, -- 연소득
	borrower_jobbiz       	VARCHAR2(30) NOT NULL, -- 직업구분
	borrower_jobname      	VARCHAR2(30) NOT NULL, -- 직업명
	borrower_jobperiod    	VARCHAR2(30) NOT NULL, -- 재직기간
	borrower_loanperiod   	NUMBER(2)    NOT NULL, -- 대출기간
	borrower_startdate    	TIMESTAMP    NOT NULL, -- 대출일
	borrower_enddate      	TIMESTAMP    NOT NULL, -- 만기일
	borrower_status       	VARCHAR2(30) DEFAULT '대출신청', 	-- 대출상태
	borrower_payok        VARCHAR2(30) DEFAULT '미지급', 	-- 대출금지급상태
	borrower_balance      NUMBER(8)    NOT NULL,  -- 대출상환금 잔액

	CONSTRAINT PK_borrower -- 대출자정보 기본키
	PRIMARY KEY (
		borrower_id,             -- 대출자ID
		borrower_registerdate  -- 대출신청일
	),

	CONSTRAINT FK_member_TO_borrower -- 회원 -> 대출자정보
	FOREIGN KEY (
		borrower_id -- 대출자ID
	)
	REFERENCES member ( -- 회원
		member_id -- 회원ID
	)
	ON DELETE CASCADE

);

-- 상품
CREATE TABLE goods (
	goods_num    	NUMBER(3)    NOT NULL, -- 상품번호
	goods_date   	TIMESTAMP    NOT NULL, -- 상품등록날짜(대출신청일)
	borrower_id  	VARCHAR2(30) NOT NULL, -- 대출자ID
	goods_sum    	NUMBER(8)    NOT NULL, -- 대출금액
	goods_rate   	NUMBER(4,2)  NOT NULL, -- 예상수익률
	goods_object 	VARCHAR2(50) NOT NULL, -- 상품명(대출사유)
	goods_status 	VARCHAR2(30) DEFAULT '모집중', -- 상품상태
	goods_invest 	NUMBER(8)    DEFAULT 0, -- 총투자금액

	CONSTRAINT PK_goods -- 상품 기본키
	PRIMARY KEY (
		goods_num -- 상품번호
	),

	CONSTRAINT FK_borrower_TO_goods -- 대출자정보 -> 상품
	FOREIGN KEY (
		borrower_id, -- 대출자ID
		goods_date   -- 상품등록날짜(대출신청일)
	)
	REFERENCES borrower ( -- 대출자정보
		borrower_id,             -- 대출자ID
		borrower_registerdate  -- 대출신청일
	)
	ON DELETE CASCADE

);


-- 투자
CREATE TABLE invest (
	member_id     	VARCHAR2(30) NOT NULL, -- 투자자ID
	goods_num     	NUMBER(3)    NOT NULL, -- 상품번호
	invest_date   	TIMESTAMP    NOT NULL, -- 투자날짜
	invest_sum    	NUMBER(8)    NOT NULL, -- 투자금액
	invest_return 	NUMBER(8)    NOT NULL, -- 투자수익금
	invest_payok  	VARCHAR2(30) DEFAULT '미지급',--투자금 상환상태

	CONSTRAINT FK_member_TO_invest -- 회원 -> 투자
	FOREIGN KEY (
		member_id -- 투자자ID
	)
	REFERENCES member ( -- 회원
		member_id -- 회원ID
	)
	ON DELETE CASCADE,

	CONSTRAINT FK_goods_TO_invest -- 상품 -> 투자
	FOREIGN KEY (
		goods_num -- 상품번호
	)
	REFERENCES goods ( -- 상품
		goods_num -- 상품번호
	)
	ON DELETE CASCADE
);
