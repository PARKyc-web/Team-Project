package com.dev.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class HotelVO {	
	private int hotelId;
	private String memberId;
	
	private String hotelName;
	private String hotelLocation;
	private int hotelPrice;
	private String hotelType;
	private String hotelDesc;
	
	private int maxP;
	
	private int hotelOptionWifi;
	private int hotelOptionSwim;
	private int hotelOptionWpet;
	private int hotelOptionKitchen;
	private int hotelOptionParking;
	
	@Override
	public boolean equals(Object obj) {		
		if(obj instanceof HotelVO) {
			return ((HotelVO) obj).getHotelId() == this.hotelId;
		}		
		return false;		
	}
	
	@Override
	public int hashCode() {
		return this.hotelId + this.memberId.hashCode();
	}	
}
