package com.bit.springboard.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.bit.springboard.dto.BoardDTO;
import com.bit.springboard.service.BoardService;

//ServiceImpl: 비즈니스 로직을 구현하는 클래스
@Service("boardService")
public class BoardServiceImpl implements BoardService {
	@Autowired
	@Qualifier("boardDAO")
	BoardDAO boardDAO;
	
	//기본게시판이라 비즈니스 로직이 별도로 존재하지 않아서 바로 DAO 객체의 메소드 호출
	@Override
	public void insertBoard(BoardDTO boardDTO) {
		
		//받아온 데이터 형식을 DB에 맞게 변경해주는 작업이라던지...
		// TODO Auto-generated method stub
		boardDAO.insertBoard(boardDTO);
	}

	@Override
	public void updateBoard(BoardDTO boardDTO) {
		// TODO Auto-generated method stub
		boardDAO.updateBoard(boardDTO);
	}

	@Override
	public void deleteBoard(int boardNo) {
		// TODO Auto-generated method stub
		boardDAO.deleteBoard(boardNo);
	}

	@Override
	public BoardDTO getBoard(int boardNo) {
		// TODO Auto-generated method stub
		return boardDAO.getBoard(boardNo);
	}

	@Override
	public List<BoardDTO> getBoardList() {
		// TODO Auto-generated method stub
		return boardDAO.getBoardList();
	}

}
