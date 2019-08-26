package com.team3.dao;

import java.util.List;

import com.team3.vo.BoardVO;
import com.team3.vo.FindCriteria;
import com.team3.vo.PageCriteria;



public interface BoardDAO {
	public void insert(BoardVO bvo); // 1건 삽입
	public BoardVO read(Integer articleNo); // 읽어오기
	public void update(BoardVO bvo); //1건 업데이트
	public void delete(Integer articleNo); // 1건 삭제
	public List<BoardVO> list(); // 리스트 불러오기
	
	public List<BoardVO> listPage(int page) throws Exception;
	public List<BoardVO> listCriteria(PageCriteria page) throws Exception;
	public int countData(PageCriteria pCri) throws Exception;
	
	public List<BoardVO> listFind(FindCriteria fCri) throws Exception;
	public int finCountData(FindCriteria fCri) throws Exception;
}
