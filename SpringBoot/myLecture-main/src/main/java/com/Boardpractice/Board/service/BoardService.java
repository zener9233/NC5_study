package com.Boardpractice.Board.service;

import com.Boardpractice.Board.entiity.Board;
import com.Boardpractice.Board.repository.BoardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.NoSuchElementException;

@Service
public class BoardService {

    @Autowired
    public BoardRepository boardRepository;

    public void insertBoard(Board board){

        boardRepository.save(board);
    }
    public Board getBoard(Long boardNo) {

        Board board = boardRepository.findById(boardNo).orElseThrow(() -> new NoSuchElementException("존재하지 않는 게시글이다"));
        board.setBoardView(board.getBoardView()+1);
        boardRepository.save(board);
        return board;
    }

    public Board updateBoard(Board board, Long boardNo) {
        Board updateBoard = boardRepository.findById(boardNo).orElseThrow(()-> new NoSuchElementException("메세지"));
       updateBoard.setBoradTitle(board.getBoradTitle());
       updateBoard.setBoardContent(board.getBoardContent());
       boardRepository.save(board);
       return updateBoard;
    }


    public void deleteBoard(Long boardNo){

        boardRepository.deleteById(boardNo);
    }

    public List<Board> getBoardList()
    {

        return boardRepository.findAll();
    }
}
