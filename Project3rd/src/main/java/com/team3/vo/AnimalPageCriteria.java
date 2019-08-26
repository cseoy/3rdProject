package com.team3.vo;

public class AnimalPageCriteria {
	private int pageNo; // 현재 페이지 
	private int numOfRows; // 페이지 당 글의 개수
	
	public AnimalPageCriteria() {
		this.pageNo = 1;
		this.numOfRows = 12;
	}
	
	public int getPageNo() {
		return pageNo;
	}
	
	public void setPageNo(int pageNo) {
		if(pageNo<=0) {
			this.pageNo = 1;
			return;
		}
		this.pageNo = pageNo;
	}
	
	public int getNumOfRows() {
		return numOfRows;
	}
	
	public void setNumOfRows(int numOfRows) {
		if(numOfRows<=0 || numOfRows > 60) {
			this.numOfRows = 12;
		}
		this.numOfRows = numOfRows;
	}
	
	// 페이지 구분 설정
	public int getStartpageNo() {
		return (this.pageNo -1)*numOfRows;
	}
	
	@Override
	public String toString() {
		return "PageCriteria [pageNo="+this.pageNo+", numOfRows="+this.numOfRows+"]";
	}
}
