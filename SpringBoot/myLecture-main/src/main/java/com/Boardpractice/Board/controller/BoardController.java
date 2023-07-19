package com.Boardpractice.Board.controller;

import com.Boardpractice.Board.entiity.Board;
import com.Boardpractice.Board.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;


import java.util.List;

@Controller
public class BoardController {
    private final BoardService boardService;

    @Autowired
    public BoardController(BoardService boardService){
        this.boardService = boardService;
    }

    @GetMapping("/")
    public String boardmain() {

        return "main";
    }


    @GetMapping("/boardList")
    public String getBoardList(Model model){
        List<Board>boardList = boardService.getBoardList();
        boardService.getBoardList();
        model.addAttribute("boardList", boardList);
        return "boardList";
    }

    @GetMapping("/deleteBoard/{boardNo}")
    public String deleteBoard(@PathVariable Long boardNo){
        boardService.deleteBoard(boardNo);
        return "redirect:/boardList";
    }
    @GetMapping("/boardList/boardInsert")
    public String BoardWriter(Board board){
        boardService.insertBoard(board);
        return "boardInsert";
    }
    @PostMapping("/board/insert")
    public String insertBoard(Board board){

        boardService.insertBoard(board);
        return "redirect:/boardList";
    }

    @GetMapping("/boradList/")
}
