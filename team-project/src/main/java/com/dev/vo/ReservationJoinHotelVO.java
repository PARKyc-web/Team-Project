package com.dev.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReservationJoinHotelVO {
	private String hotelName;
	private int hotelId;
	private String memberId;	//공통
	private Date inDate;
	private Date outDate;
	private int totalPrice;
}
