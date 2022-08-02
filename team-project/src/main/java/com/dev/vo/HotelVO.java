package com.dev.vo;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
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
}
