package com.its.member_board.repository;

import com.its.member_board.dto.CommentDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CommentRepository {
    @Autowired
  private  SqlSessionTemplate sql;

    public int save(CommentDTO commentDTO){return sql.insert(("Comment.save"),commentDTO);}

    public List<CommentDTO> list(Long boardId) {return sql.selectList(("Comment.list"),boardId);}
}
