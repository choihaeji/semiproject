package com.semi.dto;

	public class MemberDto {
		private int mno;
		private String id;
		private String pw;
		private String name;
		private String bday;
		private String gender;
		private String email;
		private String bankName;
		private String bankNo;
		private int account;
		private int stockAccount;
		
		public MemberDto() {}
		
		public MemberDto(String id, String pw, String name, String bday, String gender, String email, String bankName,
				String bankNo, int account, int stockAccount) {
			super();
			this.id = id;
			this.pw = pw;
			this.name = name;
			this.bday = bday;
			this.gender = gender;
			this.email = email;
			this.bankName = bankName;
			this.bankNo = bankNo;
			this.account = account;
			this.stockAccount = stockAccount;
		}

		
		public MemberDto(String id, String pw, String name, String bday, String gender, String email,
				String bankName, String bankNo) {
			super();
			this.id = id;
			this.pw = pw;
			this.name = name;
			this.bday = bday;
			this.gender = gender;
			this.email = email;
			this.bankName = bankName;
			this.bankNo = bankNo;
		}

		public MemberDto(int mno, String id, String pw, String name, String bday, String gender, String email,
				String bankName, String bankNo, int account) {
			super();
			this.mno = mno;
			this.id = id;
			this.pw = pw;
			this.name = name;
			this.bday = bday;
			this.gender = gender;
			this.email = email;
			this.bankName = bankName;
			this.bankNo = bankNo;
			this.account = account;
		}

		public MemberDto(int mno, String pw, String email, String bankName, String bankNo) {
			super();
			this.mno = mno;
			this.pw = pw;
			this.email = email;
			this.bankName = bankName;
			this.bankNo = bankNo;
		}
		
		

		public int getStockAccount() {
			return stockAccount;
		}
		public void setStockAccount(int stockAccount) {
			this.stockAccount = stockAccount;
		}
		
		public int getMno() {
			return mno;
		}

		public void setMno(int mno) {
			this.mno = mno;
		}

		public String getId() {
			return id;
		}

		public void setId(String id) {
			this.id = id;
		}

		public String getPw() {
			return pw;
		}

		public void setPw(String pw) {
			this.pw = pw;
		}

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public String getBday() {
			return bday;
		}

		public void setBday(String bday) {
			this.bday = bday;
		}

		public String getGender() {
			return gender;
		}

		public void setGender(String gender) {
			this.gender = gender;
		}

		public String getEmail() {
			return email;
		}

		public void setEmail(String email) {
			this.email = email;
		}

		public String getbankName() {
			return bankName;
		}

		public void setbankName(String bankName) {
			this.bankName = bankName;
		}

		public String getbankNo() {
			return bankNo;
		}

		public void setbankNo(String bankNo) {
			this.bankNo = bankNo;
		}

		public int getAccount() {
			return account;
		}

		public void setAccount(int account) {
			this.account = account;
		}
		
		public String getBdayAsString() {
			return bday.substring(0, 10);
		}
		
		public String getEmailId() {
			return email.split("@")[0];
		}
		public String getEmailURL() {
			return "@"+email.split("@")[1];
		}
	}


