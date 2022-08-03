package com.dev.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ReviewVO {

	int reviewId;
	String memberId;
	int hotelId;
	String reviewContents;
	Date reviewDate;
	float reviewRate;
	
}
