package com.dev.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MemberVO {	
	private String memberId;
	private String memberPassword;
	private String memberName;
	private int memberAge;
	private String phone;
	private String email;
	private String memberType;
	private String memberAble;
	private String singInDate;
	private String memberPic;
}
