package com.taxi.board.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.taxi.board.dto.RBoardDto;
import com.taxi.common.SqlMapConfig;

public class RBoardDao extends SqlMapConfig {
	
	private String namespace = "com.taxi.rboard.";
	
	
	public List<RBoardDto> selectAll(){
		SqlSession session = null;
		List<RBoardDto> res = new ArrayList<RBoardDto>();
		
		try {
			session = getSqlSessionFactory().openSession(true);
			res = session.selectList(namespace+"selectAll");
		}catch(Exception e) {
			session.close();
		}
		
		return res;
	}
	
	//전체출력_조회순
		public List<RBoardDto> selectAll_hit(){
			List<RBoardDto> res = null;
			SqlSession session = null;
			session = getSqlSessionFactory().openSession(true);
			res = session.selectList(namespace+"selectAll_hit");
			session.close();
			return res;
		}
		
		//전체출력_추천순
		public List<RBoardDto> selectAll_recommend(){
			List<RBoardDto> res = null;
			SqlSession session = null;
			session = getSqlSessionFactory().openSession(true);
			res = session.selectList(namespace+"selectAll_rec");
			session.close();
			
			return res;
		}
	
	public RBoardDto selectOne(int r_no) {
		SqlSession session = null;
		RBoardDto res = new RBoardDto();
		
		try {
			session = getSqlSessionFactory().openSession();
			res = session.selectOne(namespace+"selectOne", r_no);
			
		} catch(Exception e) {
			session.close();
		}
		
		return res;
	}
	
	public int insert(RBoardDto dto) {
		int res = 0;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession(true);
			res = session.insert(namespace+"insert", dto);
		} catch(Exception e) {
			session.close();
		}
		
		return res;
	}
	
	
	public int update(RBoardDto dto) {
		int res = 0;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession(true);
			res = session.update(namespace+"update", dto);
		} catch(Exception e) {
			session.close();
		}
		
		return res;
	}
	
	//조회수 증가
		public void updateHit(int r_no) {
			System.out.println(r_no);
			SqlSession session = null;
			try {
				session = getSqlSessionFactory().openSession(true);
				session.update(namespace+"updateHit", r_no);
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				session.close();
			}
			
		}
	
	public int delete(int r_no) {
		int res = 0;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession(true);
			res = session.delete(namespace+"delete", r_no);
		} catch(Exception e) {
			session.close();
		}
		
		return res;
	}
	
	public void updateCount(RBoardDto dtoc) {
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession(true);
			session.update(namespace+"updatecount", dtoc);
		} catch (Exception e) {
			session.close();
		}
	}
	
	//추천수 증가
	public void plusLike(int r_no) {
		SqlSession session = null;
			
		try {
			session = getSqlSessionFactory().openSession(true);
			session.update(namespace+"pluslike", r_no);
		} catch(Exception e) {
			session.close();
		}
			
	}
		
	//추천수 감소
	public void minusLike(int r_no) {
		SqlSession session = null;
			
		try {
			session = getSqlSessionFactory().openSession(true);
			session.update(namespace+"minuslike", r_no);
		} catch(Exception e) {
			session.close();
		}
			
	}
	
	
	
	
	
}
