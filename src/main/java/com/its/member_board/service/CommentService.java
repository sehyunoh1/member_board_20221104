package com.its.member_board.service;

import com.its.member_board.dto.CommentDTO;
import com.its.member_board.repository.CommentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentService {
    @Autowired
    private CommentRepository commentRepository;

    public boolean save(CommentDTO commentDTO) {
        int result = commentRepository.save(commentDTO);
        if(result>=1){
            return true;
        }else{
            return false;
        }
    }
    public List<CommentDTO> list(Long boardId){return commentRepository.list(boardId);}
}
