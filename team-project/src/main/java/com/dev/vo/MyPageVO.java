package com.dev.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MyPageVO {
	private String hotelId;
	private String reviewContents;
	private String reviewDate;
	
	private String hotelName;
	private int hotelPrice;
	
	private String inDate;
	private String outDate;
}
