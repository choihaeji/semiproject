package com.semi.dto;

public class TradeDto {

//	--(거래ID,종목코드,구매주식수)
//	    TRADEID    VARCHAR2(100)    NOT NULL, 
//	    CODE       VARCHAR2(50)           NOT NULL, 
//	    HOLDING    NUMBER           NOT NULL, 
//	    CONSTRAINT TRADE_PK PRIMARY KEY (TRADEID, CODE)
	
	private String tradeId;
	private String code;
	private int holding;
	
	public TradeDto() {
		super();
	}

	public TradeDto(String tradeId, String code, int holding) {
		super();
		this.tradeId = tradeId;
		this.code = code;
		this.holding = holding;
	}

	public String getTradeId() {
		return tradeId;
	}

	public void setTradeId(String tradeId) {
		this.tradeId = tradeId;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public int getHolding() {
		return holding;
	}

	public void setHolding(int holding) {
		this.holding = holding;
	}

	

}
