-- ����
DROP TABLE invest;
-- ��ǰ
DROP TABLE goods;
-- ����������
DROP TABLE borrower;
-- �����Խ���
DROP TABLE board;
-- ����ݳ���
DROP TABLE moneyinout;
-- ����
DROP TABLE account;
-- ȸ��
DROP TABLE member;

-- ȸ��
CREATE TABLE member (
	member_id		VARCHAR2(30)  NOT NULL, -- ȸ��ID
	member_pw1       	VARCHAR2(30)  NOT NULL, -- ��й�ȣ
	member_pw2       	VARCHAR2(30)  NOT NULL, -- ��й�ȣȮ��
	member_name      	VARCHAR2(30)  NOT NULL, -- �̸�
	member_phone     	VARCHAR2(30)  NOT NULL, -- �ڵ��� ��ȣ
	member_jumin1    	VARCHAR2(30)  NOT NULL, -- �ֹε�Ϲ�ȣ ���ڸ�
	member_jumin2    	VARCHAR2(30)  NOT NULL, -- �ֹε�Ϲ�ȣ ���ڸ�
	member_email     	VARCHAR2(30)  NOT NULL, -- �̸���
	member_zipcode   	VARCHAR2(30)  NOT NULL, -- �����ȣ
	member_addr1     	VARCHAR2(200) NOT NULL, -- �⺻�ּ�
	member_addr2     	VARCHAR2(200) NOT NULL, -- ���ּ�
	member_agreement 	NUMBER(1)     NOT NULL, -- �������
	member_age       	NUMBER(2)     default 0, -- ����
	member_gender    	VARCHAR2(30)  NOT NULL,  -- ����

	CONSTRAINT PK_member 
	PRIMARY KEY(member_id)	
);

-- ����
CREATE TABLE account (
	member_id       	VARCHAR2(30) NOT NULL, -- ȸ��ID
	account_virtual 	VARCHAR2(30) NOT NULL, -- ������¹�ȣ
	account_balance 	NUMBER(8)   DEFAULT 0, -- �ܾ�
	account_real    	VARCHAR2(30) NULL,     -- �ǰ���
	account_case    	NUMBER(1)    NOT NULL,  -- ����ݰ���Ǽ�

	CONSTRAINT PK_account -- ���� �⺻Ű
	PRIMARY KEY (
		member_id       -- ȸ��ID
	),
	
	-- ȸ�� -> ����
	CONSTRAINT FK_member_TO_account 
	FOREIGN KEY (member_id)	 -- ȸ��ID
	REFERENCES member (member_id)  -- ȸ�� : ȸ��ID
	ON DELETE CASCADE
);


-- ����ݳ���
CREATE TABLE moneyinout (
	moneyinout_holder_id      	VARCHAR2(30) NOT NULL, -- ��������ID
	moneyinout_other_id       	VARCHAR2(30) NOT NULL, -- �������ü��ID
	moneyinout_date           	TIMESTAMP    NOT NULL, -- ����ݳ�¥
	moneyinout_money          	NUMBER(8)    NOT NULL, -- ����� �ݾ�
	moneyinout_state          	VARCHAR2(30) NOT NULL, -- ����(�Ա�, ���)

	CONSTRAINT PK_moneyinout -- ����ݳ��� �⺻Ű
	PRIMARY KEY (
		moneyinout_holder_id,      -- ��������ID
		moneyinout_other_id,       -- �������ü��ID
		moneyinout_date            -- ����ݳ�¥
	),
	
	CONSTRAINT FK_account_TO_moneyinout -- ���� -> ����ݳ���
	FOREIGN KEY (
		moneyinout_holder_id      -- ��������ID
	)
	REFERENCES account ( -- ����
		member_id       -- ȸ��ID
	)
	ON DELETE CASCADE,

	CONSTRAINT FK_account_TO_moneyinout2 -- ���� -> ����ݳ���2
	FOREIGN KEY (
		moneyinout_other_id      -- �������ü��ID
	)
	REFERENCES account ( -- ����
		member_id       -- ȸ��ID
	)
	ON DELETE CASCADE
);

-- �����Խ���
CREATE TABLE board (
	board_num       	NUMBER(3)      NOT NULL, -- ������ȣ
	member_id       	VARCHAR2(30)   NOT NULL, -- �ۼ���ID
	board_title     	VARCHAR2(50)   NOT NULL, -- ����
	board_password  	VARCHAR2(15)   NULL,     -- ��й�ȣ
	board_date      	TIMESTAMP      NOT NULL, -- ��ϳ�¥
	board_readcount 	NUMBER(3)      NOT NULL, -- ��ȸ��
	board_content   	VARCHAR2(2000) NOT NULL, -- ����
	board_ref       	NUMBER(3)      NOT NULL, -- ����� ����
	board_lev       	NUMBER(3)      NOT NULL, -- ��� ����
	board_seq       	NUMBER(3)      NOT NULL, -- ��� ��ȣ
	board_pw_check  	NUMBER(1)      DEFAULT 0, -- ��б� üũ
	CONSTRAINT PK_board -- �����Խ��� �⺻Ű
	PRIMARY KEY (
		board_num -- ������ȣ
	),

	CONSTRAINT FK_member_TO_board -- ȸ�� -> �����Խ���
	FOREIGN KEY (
		member_id -- �ۼ���ID
	)
	REFERENCES member ( -- ȸ��
		member_id -- ȸ��ID
	)
	ON DELETE CASCADE
);

-- ����������
CREATE TABLE borrower (
	borrower_id             	VARCHAR2(30) NOT NULL, -- ������ID
	borrower_registerdate 	TIMESTAMP    NOT NULL, -- �����û��
	borrower_rate         	NUMBER(4,2)    NOT NULL, -- ����ݸ�
	borrower_repay_date   	VARCHAR2(30) NOT NULL, -- ������
	borrower_amount       	NUMBER(8)    NOT NULL, -- �ѻ�ȯ��
	borrower_monthlypay   	NUMBER(8)    NOT NULL, -- �����Աݾ�
	borrower_limit        	NUMBER(8)    NOT NULL, -- �����ѵ� �ݾ�
	borrower_credit       	VARCHAR2(5)  NOT NULL, -- �ſ���
	borrower_totalincome  	NUMBER(11)   NOT NULL, -- ���ҵ�
	borrower_jobbiz       	VARCHAR2(30) NOT NULL, -- ��������
	borrower_jobname      	VARCHAR2(30) NOT NULL, -- ������
	borrower_jobperiod    	VARCHAR2(30) NOT NULL, -- �����Ⱓ
	borrower_loanperiod   	NUMBER(2)    NOT NULL, -- ����Ⱓ
	borrower_startdate    	TIMESTAMP    NOT NULL, -- ������
	borrower_enddate      	TIMESTAMP    NOT NULL, -- ������
	borrower_status       	VARCHAR2(30) DEFAULT '�����û', 	-- �������
	borrower_payok        VARCHAR2(30) DEFAULT '������', 	-- ��������޻���
	borrower_balance      NUMBER(8)    NOT NULL,  -- �����ȯ�� �ܾ�

	CONSTRAINT PK_borrower -- ���������� �⺻Ű
	PRIMARY KEY (
		borrower_id,             -- ������ID
		borrower_registerdate  -- �����û��
	),

	CONSTRAINT FK_member_TO_borrower -- ȸ�� -> ����������
	FOREIGN KEY (
		borrower_id -- ������ID
	)
	REFERENCES member ( -- ȸ��
		member_id -- ȸ��ID
	)
	ON DELETE CASCADE

);

-- ��ǰ
CREATE TABLE goods (
	goods_num    	NUMBER(3)    NOT NULL, -- ��ǰ��ȣ
	goods_date   	TIMESTAMP    NOT NULL, -- ��ǰ��ϳ�¥(�����û��)
	borrower_id  	VARCHAR2(30) NOT NULL, -- ������ID
	goods_sum    	NUMBER(8)    NOT NULL, -- ����ݾ�
	goods_rate   	NUMBER(4,2)  NOT NULL, -- ������ͷ�
	goods_object 	VARCHAR2(50) NOT NULL, -- ��ǰ��(�������)
	goods_status 	VARCHAR2(30) DEFAULT '������', -- ��ǰ����
	goods_invest 	NUMBER(8)    DEFAULT 0, -- �����ڱݾ�

	CONSTRAINT PK_goods -- ��ǰ �⺻Ű
	PRIMARY KEY (
		goods_num -- ��ǰ��ȣ
	),

	CONSTRAINT FK_borrower_TO_goods -- ���������� -> ��ǰ
	FOREIGN KEY (
		borrower_id, -- ������ID
		goods_date   -- ��ǰ��ϳ�¥(�����û��)
	)
	REFERENCES borrower ( -- ����������
		borrower_id,             -- ������ID
		borrower_registerdate  -- �����û��
	)
	ON DELETE CASCADE

);


-- ����
CREATE TABLE invest (
	member_id     	VARCHAR2(30) NOT NULL, -- ������ID
	goods_num     	NUMBER(3)    NOT NULL, -- ��ǰ��ȣ
	invest_date   	TIMESTAMP    NOT NULL, -- ���ڳ�¥
	invest_sum    	NUMBER(8)    NOT NULL, -- ���ڱݾ�
	invest_return 	NUMBER(8)    NOT NULL, -- ���ڼ��ͱ�
	invest_payok  	VARCHAR2(30) DEFAULT '������',--���ڱ� ��ȯ����

	CONSTRAINT FK_member_TO_invest -- ȸ�� -> ����
	FOREIGN KEY (
		member_id -- ������ID
	)
	REFERENCES member ( -- ȸ��
		member_id -- ȸ��ID
	)
	ON DELETE CASCADE,

	CONSTRAINT FK_goods_TO_invest -- ��ǰ -> ����
	FOREIGN KEY (
		goods_num -- ��ǰ��ȣ
	)
	REFERENCES goods ( -- ��ǰ
		goods_num -- ��ǰ��ȣ
	)
	ON DELETE CASCADE
);
