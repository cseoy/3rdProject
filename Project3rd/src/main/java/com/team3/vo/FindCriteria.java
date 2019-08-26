package com.team3.vo;

public class FindCriteria extends PageCriteria{ //페이지 정보가 필요하여 상속

	private String findType; // 검색 조건 받아오기
	private String keyword; // 검색 keyword
	
	public String getFindType() {
		return findType;
	}
	public void setFindType(String findType) {
		this.findType = findType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	@Override
	public String toString() {
		return "FindCriteria : " + "[findType = "+findType+", keyword = " +keyword +"]";
	}
	
	
}
