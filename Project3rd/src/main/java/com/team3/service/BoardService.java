package com.team3.service;

import java.util.List;

import com.team3.vo.BoardVO;
import com.team3.vo.FindCriteria;
import com.team3.vo.PageCriteria;



public interface BoardService {
	public void write(BoardVO bvo);
	public BoardVO read(Integer articleNo);
	public void modify(BoardVO bvo);
	public void remove(Integer articleNo);
	public List<BoardVO> listAll();
	
	public List<BoardVO> listCriteria(PageCriteria pCri) throws Exception;
	public int listCountData(PageCriteria pCri) throws Exception;
	
	   //검색
	   public List<BoardVO> listFind(FindCriteria fCri) throws Exception;
	   public int findCountData(FindCriteria fCri) throws Exception;
	
}
