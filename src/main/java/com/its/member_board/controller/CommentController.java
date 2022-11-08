package com.its.member_board.controller;

import com.its.member_board.dto.CommentDTO;
import com.its.member_board.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/comment")
public class CommentController {
    @Autowired
    private CommentService commentService;

    @PostMapping("/save")
    public @ResponseBody List<CommentDTO> save(@ModelAttribute CommentDTO commentDTO){
        boolean result= commentService.save(commentDTO);
       List<CommentDTO> commentList = commentService.list(commentDTO.getBoardId());
        System.out.println("commentList = " + commentList);
        if(result){
            return commentList;
        }else{
            return null;
        }
    }


}
