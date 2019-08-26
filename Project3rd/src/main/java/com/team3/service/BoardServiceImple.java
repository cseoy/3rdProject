package com.team3.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.team3.dao.BoardDAO;
import com.team3.vo.BoardVO;
import com.team3.vo.FindCriteria;
import com.team3.vo.PageCriteria;

@Service
public class BoardServiceImple implements BoardService{
	
	@Inject
	private BoardDAO bdao;

	@Override
	public void write(BoardVO bvo) {
		// TODO Auto-generated method stub
		bdao.insert(bvo);
		
	}

	@Override
	public BoardVO read(Integer articleNo) {
		// TODO Auto-generated method stub
		return bdao.read(articleNo);
	}

	@Override
	public void modify(BoardVO bvo) {
		// TODO Auto-generated method stub
		bdao.update(bvo);
	}

	@Override
	public void remove(Integer articleNo) {
		// TODO Auto-generated method stub
		bdao.delete(articleNo);
		
	}

	@Override
	public List<BoardVO> listAll() {
		// TODO Auto-generated method stub
		return bdao.list();
	}

	
	// ------------------------------------------------------------------ //
	
	@Override
	public List<BoardVO> listCriteria(PageCriteria pCri) throws Exception {
		// TODO Auto-generated method stub
		return bdao.listCriteria(pCri);
	}

	@Override
	public int listCountData(PageCriteria pCri) throws Exception {
		// TODO Auto-generated method stub
		return bdao.countData(pCri);
	}

	@Override
	public List<BoardVO> listFind(FindCriteria fCri) throws Exception {
		// TODO Auto-generated method stub
		return bdao.listFind(fCri);
	}

	@Override
	public int findCountData(FindCriteria fCri) throws Exception {
		// TODO Auto-generated method stub
		return bdao.finCountData(fCri);
	}
}
