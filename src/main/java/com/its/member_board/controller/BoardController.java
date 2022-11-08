package com.its.member_board.controller;

import com.its.member_board.dto.BoardDTO;
import com.its.member_board.dto.PagingDTO;
import com.its.member_board.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/board")
public class BoardController {
    @Autowired
    private BoardService boardService;
    @GetMapping("/save")
    public String saveform(){ return "/Board/BoardSave";}

    @PostMapping("/save")
    public String save(@ModelAttribute BoardDTO boardDTO) throws IOException {
        boardService.save(boardDTO);
        return "redirect:/board/";
    }
    @GetMapping("/")
    public String findAll(Model model,
                          @RequestParam(value="page", required = false,defaultValue = "1") int page  ){
        List<BoardDTO> boardList =boardService.list(page);
        PagingDTO pagingDTO = boardService.pagingParam(page);
        model.addAttribute("boardList",boardList);
        model.addAttribute("paging",pagingDTO);
        return "/Board/BoardList";
    }
    @GetMapping
    public String findbyId(@RequestParam("boardId") Long boardId, Model model){
        BoardDTO boardDTO = boardService.findbyId(boardId);
        model.addAttribute("board",boardDTO);
        return "/Board/BoardDetail";
    }

}
