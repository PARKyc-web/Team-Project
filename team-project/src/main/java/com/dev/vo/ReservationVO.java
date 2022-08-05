package com.dev.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ReservationVO {
	
	private int reservId;
	private String memberId;
	private int hotelId;
	private Date inDate;
	private Date outDate;
	private int totalPrice;
	private int inReserv;		
}
