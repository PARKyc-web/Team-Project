package com.dev.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
public class ReviewJoinReservationJoinHotelVO {
	private String hotelName;
	private String memberId;	//공통
	private Date reviewDate;
	private float reviewRate;
	private Date inDate;
	private Date outDate;
	private String reviewContents;
}
