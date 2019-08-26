package com.team3.vo;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PagingMaker {
	private int totalCount; // 전체 데이터 개수
	private int startPage; // 페이지 목록에서 시작번호
	private int endPage; // 페이지 목록에서 끝번호
	private boolean prev; // 이전 버튼
	private boolean next; // 다음 버튼
	
	private int displayPageNum = 10; // 페이지 목록에 나타낼 페이지 번호의 수
	private PageCriteria pcri;
	
	private void getPagingData() {
		// endPage : Math.ceil((현재 페이지 번호/페이지 목록에 나타낼 페이지 번호 수)*페이지 목록에 나타낼 페이지 번호 수)
		endPage = (int)(Math.ceil(pcri.getPageNo()/(double)displayPageNum)* displayPageNum);
		
		// startPage : (endPage - 페이지 목록에 난타낼 페이지 번호 수) + 1
		startPage = (endPage - displayPageNum) + 1;
		
		// finalEndPage : Math.ceil(totalCount/페이지에 보여줄 글의 개수)
		int finalEndPage = (int)(Math.ceil(totalCount/(double)pcri.getNumOfRows()));
		
		if(endPage > finalEndPage) {
			endPage = finalEndPage;
		}
		
		// prev = start == 1? false : true
		prev = startPage == 1 ? false : true;
		
		// next = (endPage*페이지에서 보여줄 글 개수) > totalData ? false : true
		next = endPage * pcri.getNumOfRows() >= totalCount ? false : true;
	} // getPagingData() end

	// 글 목록 페이징 처리
	public String makeUri(int pageNo) {
		UriComponents uriComponent = UriComponentsBuilder.newInstance().queryParam("pageNo", pageNo).build();
		
		return uriComponent.toUriString();
	} // makeUri() end
	
	public String makeUri(int pageNo, String start, String end) {
		UriComponents uriComponent = UriComponentsBuilder.newInstance()
				.queryParam("pageNo", pageNo).queryParam("start", start).queryParam("end", end).build();
		
		return uriComponent.toUriString();
	} // makeUri() end
	
	//		.queryParam("pageNo", pageNo).queryParam("start", start).queryParam("end", end).build();
	
	
//	// 검색 결과 페이징 처리
//	public String makeFind(int page) {
//		UriComponents uriComponent = UriComponentsBuilder.newInstance()
//				.queryParam("page", page).queryParam("numPerPage", pcri.getNumPerPage())
//				.queryParam("findType", ((FindCriteria) pcri).getFindType()).queryParam("keyword", ((FindCriteria) pcri).getKeyword())
//				.build();
//		
//		return uriComponent.toUriString();
//	}
	
	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
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
		System.out.println(pcri.toString());
		return pcri;
	}

	public void setPcri(PageCriteria pcri) {
		this.pcri = pcri;
	}	
}
