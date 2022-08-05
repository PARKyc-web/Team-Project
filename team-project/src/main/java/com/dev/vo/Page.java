package com.dev.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Page {

	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	
	private int total; // 데이터의 전체 수
	private Criteria cri;
	
	public Page(Criteria cri, int total) {
		this.cri = cri;
		this.total = total;
		
		this.endPage = (int)(Math.ceil(cri.getPageNum()/10.0))*10;
		this.startPage = endPage-9;
		
		int realEnd = (int)(Math.ceil(total*1.0/cri.getAmount()));
		
		if(this.endPage > realEnd) {
			this.endPage = realEnd;
		}
		
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
	}	
}
