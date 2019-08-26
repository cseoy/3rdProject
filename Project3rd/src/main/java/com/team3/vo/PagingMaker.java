package com.team3.vo;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PagingMaker {
	private int totalData; // 전체 데이터 개수
	private int startPage; // 페이지 목록 시작번호
	private int endPage; // 페이지 목록에서 끝번호
	private boolean prev; // 이전 버튼
	private boolean next; // 다음 버튼
	
	private int displayPageNum = 10 ; // 페이지 목록에 나타낼 페이지 번호수 (10개씩 노출)
	
	private PageCriteria pcri;
	private FindCriteria fcri;
	
	private void getPagingData() {
		endPage = (int)(Math.ceil(pcri.getPage()/(double)displayPageNum) * displayPageNum);
		startPage = (endPage - displayPageNum ) +1;
		int finalEndPage = (int)(Math.ceil(totalData/(double)pcri.getNumPerPage()));
		
		if(endPage > finalEndPage) {
			endPage = finalEndPage;
		}
		
		prev = startPage == 1 ? false : true;
		
		next = endPage*pcri.getNumPerPage() >= totalData ? false : true ;
		
	} // getPagingDate() end
	
	public String makeUri(int page) {
		UriComponents uriComponent = UriComponentsBuilder
							.newInstance()
							.queryParam("page", page)
							.queryParam("numPerPage", pcri.getNumPerPage())
							.build();
		
		return uriComponent.toUriString();
	}
	
	// 검색 결과 페이징 처리를 위한 주소
	public String makeFind(int page) {
		UriComponents uriComponent = UriComponentsBuilder
									.newInstance()
									.queryParam("page", page)
									.queryParam("numPerPage", pcri.getNumPerPage())
									.queryParam("findType", ((FindCriteria) pcri).getFindType())
									.queryParam("keyword", ((FindCriteria) pcri).getKeyword())
									.build();
		return uriComponent.toUriString();
	}

	public int getTotalData() {
		return totalData;
	}

	public void setTotalData(int totalData) {
		this.totalData = totalData;
		getPagingData();
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getDisplayPageNum() {
		return displayPageNum;
	}

	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}

	public PageCriteria getPcri() {
		return pcri;
	}

	public void setPcri(PageCriteria pcri) {
		this.pcri = pcri;
	}
	
	

}
