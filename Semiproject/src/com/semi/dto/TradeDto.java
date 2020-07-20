package com.semi.dto;

public class TradeDto {

//	--(거래ID,계좌번호,이름,종목명,보유주식수,계좌평가금액,유가증권평가금액)
	
	private String tradeId;
	private int bankNo;
	private String name;
	private String ent;
	private int holding;
	private int account;
	private int stockAccount;
	private String status;
		
	public TradeDto() {
		super();
	}

	public TradeDto(String tradeId, int bankNo, String name, String ent, int holding,int account,int stockAccount) {
		super();
		this.tradeId = tradeId;
		this.bankNo = bankNo;
		this.name = name;
		this.ent = ent;
		this.holding = holding;
		this.account = account;
		this.stockAccount = stockAccount;
	}

	public int getAccount() {
		return account;
	}

	public void setAccount(int account) {
		this.account = account;
	}

	public int getStockAccount() {
		return stockAccount;
	}

	public void setStockAccount(int stockAccount) {
		this.stockAccount = stockAccount;
	}

	public String getTradeId() {
		return tradeId;
	}

	public void setTradeId(String tradeId) {
		this.tradeId = tradeId;
	}

	public int getBankNo() {
		return bankNo;
	}

	public void setBankNo(int bankNo) {
		this.bankNo = bankNo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEnt() {
		return ent;
	}

	public void setEnt(String ent) {
		this.ent = ent;
	}

	public int getHolding() {
		return holding;
	}

	public void setHolding(int holding) {
		this.holding = holding;
	}	

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

}
