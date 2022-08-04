package com.dev.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReviewVO {

	private int reviewId;
	private int hotelId;
	private String memberId;
	private String reviewContents;
	private Date reviewDate;
	private float reviewRate;
}
