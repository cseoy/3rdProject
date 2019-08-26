package com.team3.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.team3.vo.BoardVO;
import com.team3.vo.FindCriteria;
import com.team3.vo.PageCriteria;



@Repository
public class BoardDAOImple implements BoardDAO{
	
	@Inject
	private SqlSession ss;
	
	@Override
	public void insert(BoardVO bvo) {
		// TODO Auto-generated method stub
		
		ss.insert("insertOne",bvo);
		
	}

	@Override
	public BoardVO read(Integer articleNo) {
		
		return ss.selectOne("selectOne", articleNo);
	}

	@Override
	public void update(BoardVO bvo) {
		// TODO Auto-generated method stub
		
		ss.update("updateOne", bvo);
	}

	@Override
	public void delete(Integer articleNo) {
		// TODO Auto-generated method stub
		ss.delete("deleteOne", articleNo);
	}

	@Override
	public List<BoardVO> list() {
		
		
		return ss.selectList("selectAll");
	}

	@Override
	public List<BoardVO> listPage(int page) throws Exception {
		// TODO Auto-generated method stub
		if(page<=0) {
			page = 1;
		}
		
		page = (page-1) * 10;
		
		return ss.selectList("listPage", page);
	}

	@Override
	public List<BoardVO> listCriteria(PageCriteria page) throws Exception {
		// TODO Auto-generated method stub
		return ss.selectList("listCriteria",page);
	}

	@Override
	public int countData(PageCriteria pCri) throws Exception {
		// TODO Auto-generated method stub
		return ss.selectOne("countData",pCri);
	}

	@Override
	public List<BoardVO> listFind(FindCriteria fCri) throws Exception {
		// TODO Auto-generated method stub
		return ss.selectList("listFind",fCri);
	}

	@Override
	public int finCountData(FindCriteria fCri) throws Exception {
		// TODO Auto-generated method stub
		return ss.selectOne("findCountData",fCri);
	}

	
	
}
