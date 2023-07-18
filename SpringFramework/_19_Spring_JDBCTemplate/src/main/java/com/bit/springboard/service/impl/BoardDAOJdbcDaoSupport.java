package com.bit.springboard.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Repository;

import com.bit.springboard.dto.BoardDTO;

//DAO(Data Access Object): DB에 직접 접근하는 객체 
//					=> Boot에서는 Mapper 인터페이스나 Repository  인터페이스 사용 
//JDBC Template 사용방식1
//JdbcDaoSupport 클래스를 상속받아서 사용하는 방식
@Repository("boardDAOJdbcDaoSupport")
public class BoardDAOJdbcDaoSupport extends JdbcDaoSupport {
	@Autowired
	public void setSuperDataSource(DataSource dataSource) {
		super.setDataSource(dataSource);
	}
	
	//쿼리등록
	private final String INSERT_BOARD = "INSERT INTO T_BOARD ("
			+ "				BOARD_TITLE, "
			+ "				BOARD_CONTENT, "
			+ "				BOARD_WRITER"
			+ "			) VALUES ("
			+ "				?,"
			+ "				?,"
			+ "				?"
			+ "			)";
	
	private final String GET_BOARD = "SELECT "
			+ "		BOARD_NO"
			+ "	  , BOARD_TITLE"
			+ "	  , BOARD_CONTENT"
			+ "   , BOARD_WRITER"
			+ "   , BOARD_REGDATE"
			+ "   , BOARD_CNT"
			+ "  FROM T_BOARD"
			+ "  WHERE BOARD_NO = ?";
	
	private final String UPDATE_BOARD = "UPDATE T_BOARD SET"
			+ "		BOARD_TITLE = ?,"
			+ "		BOARD_CONTENT = ?"
			+ "	  WHERE BOARD_NO = ?";
	
	private final String DELETE_BOARD = "DELETE FROM T_BOARD WHERE BOARD_NO = ?";
	
	private final String GET_BOARDLIST = "SELECT * FROM T_BOARD";
	
	//글 등록
	public void insertBoard(BoardDTO boardDTO) {
		System.out.println("insertBoard 실행");
		
		getJdbcTemplate().update(INSERT_BOARD, boardDTO.getBoardTitle(),
				boardDTO.getBoardContent(), boardDTO.getBoardWriter());
	}
	
	//글 수정
	public void updateBoard(BoardDTO boardDTO) {
		System.out.println("updateBoard 실행");
		
		getJdbcTemplate().update(UPDATE_BOARD, boardDTO.getBoardTitle(),
				boardDTO.getBoardContent(), boardDTO.getBoardNo());
	}
	
	//글 삭제
	public void deleteBoard(int boardNo) {
		System.out.println("deleteBoard 실행");
		
		getJdbcTemplate().update(DELETE_BOARD, boardNo);
	}
	
	//글 상세 조회
	public BoardDTO getBoard(int boardNo) {
		System.out.println("getBoard 실행");
		
		//queryForObject의 두 번째 매개변수는 Object[]형태여야 한다.
		Object[] args = {boardNo};
		
		return getJdbcTemplate().queryForObject(GET_BOARD, args,
				new BoardRowMapper());
	}
	
	//글 목록 조회
	public List<BoardDTO> getBoardList() {
		System.out.println("getBoardList 실행");
		
		return getJdbcTemplate().query(GET_BOARDLIST, 
				new BoardRowMapper());
	}
	
	
	
	
	
	
}
