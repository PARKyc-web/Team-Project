package com.dev.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ReservationVO {
	
	private String reservId;
	private String memberId;
	private String hotelId;
	private String inDate;
	private String outDate;
	private int totalPrice;
	private String inReserv;		
}
