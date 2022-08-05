package com.dev.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReviewVO {
	int reviewId;
	String memberId;
	int hotelId;
	String reviewContents;
	Date reviewDate;
	float reviewRate;
}
