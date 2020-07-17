package com.semi.dto;

public class TradeDto {

//	--(거래번호,거래ID,종목명,구매주식수,구매가or판매가)
	
	private int tradeNo;
	private String id;
	private String stockName;
	private int holding;
	private int price;

	public TradeDto() {
		super();
	}

	public TradeDto(int tradeNo, String id, String stockName, int holding, int price) {
		super();
		this.tradeNo = tradeNo;
		this.id = id;
		this.stockName = stockName;
		this.holding = holding;
		this.price = price;
	}
	
	public TradeDto(String id, String stockName, int holding, int price) {
		super();
		this.id = id;
		this.stockName = stockName;
		this.holding = holding;
		this.price = price;
	}

	public int getTradeNo() {
		return tradeNo;
	}

	public void setTradeNo(int tradeNo) {
		this.tradeNo = tradeNo;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getstockName() {
		return stockName;
	}

	public void setstockName(String stockName) {
		this.stockName = stockName;
	}

	public int getHolding() {
		return holding;
	}

	public void setHolding(int holding) {
		this.holding = holding;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}
	
	
	
		
	
	

}
