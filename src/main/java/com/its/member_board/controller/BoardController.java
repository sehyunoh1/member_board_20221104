package com.its.member_board.controller;

import com.its.member_board.dto.BoardDTO;
import com.its.member_board.dto.MemberDTO;
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
    @GetMapping("/board")
    public String findbyId(@RequestParam("boardId") Long boardId, Model model){
        boardService.hits(boardId);
        BoardDTO boardDTO = boardService.findbyId(boardId);
        model.addAttribute("board",boardDTO);
        return "/Board/BoardDetail";
    }
    @GetMapping("/update")
    public String updateform(@RequestParam("boardId") Long boardId,Model model){
        BoardDTO boardDTO = boardService.findbyId(boardId);
        model.addAttribute("board",boardDTO);
        return "/Board/BoardUpdate";
    }
    @PostMapping("/update")
    public String update(@ModelAttribute BoardDTO boardDTO, Model model){

        boolean result=boardService.update(boardDTO);
        BoardDTO DTO = boardService.findbyId(boardDTO.getBoardId());
        model.addAttribute("board",DTO);
        if(result){
        return "redirect:/board/board?boardId="+DTO.getBoardId();
    }else{
        return "Board/BoardUpdate";
        }
    }


}
