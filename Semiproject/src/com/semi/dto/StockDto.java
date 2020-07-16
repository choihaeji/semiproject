package com.semi.dto;

public class StockDto {
	private String stock_name;		//주식명
	private String stock_code;		//주식코드
	private String price;			//시가
	private String dod;				//전일대비
	private String fluctuation;		//등락율
	private String volume; 			//거래량
	private String trading_value;	//거래대금
	
	public StockDto() {
		super();
	}
	
	public StockDto(String ent_name, String ent_code, String price, String net_change, String fluctuation, String volume,
			String trading_value) {
		super();
		this.stock_name = ent_name;
		this.stock_code = ent_code;
		this.price = price;
		this.dod = net_change;
		this.fluctuation = fluctuation;
		this.volume = volume;
		this.trading_value = trading_value;
	}

	public StockDto(String ent_name, String ent_code) {
		super();
		this.stock_name = ent_name;
		this.stock_code = ent_code;
	}

	public String getStock_name() {
		return stock_name;
	}

	public void setEnt_name(String ent_name) {
		this.stock_name = ent_name;
	}

	public String getStock_code() {
		return stock_code;
	}

	public void setEnt_code(String ent_code) {
		this.stock_code = ent_code;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getNet_change() {
		return dod;
	}

	public void setNet_change(String net_change) {
		this.dod = net_change;
	}

	public String getFluctuation() {
		return fluctuation;
	}

	public void setFluctuation(String fluctuation) {
		this.fluctuation = fluctuation;
	}

	public String getVolume() {
		return volume;
	}

	public void setVolume(String volume) {
		this.volume = volume;
	}

	public String getTrading_value() {
		return trading_value;
	}

	public void setTrading_value(String trading_value) {
		this.trading_value = trading_value;
	}
	
}
