package com.dev.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ReservationVO {
	
	String reservId;
	String memberId;
	String inDate;
	String outDate;
	int totalPrice;
	String inReserv;		
}
