package com.its.member_board.repository;

import com.its.member_board.dto.BoardDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardRepository {
    @Autowired
    private SqlSessionTemplate sql;

    public BoardDTO save(BoardDTO boardDTO){
        sql.insert("Board.save",boardDTO);
        return boardDTO;
    }
    public void savefile(BoardDTO boardDTO){ sql.insert(("Board.savefile"),boardDTO);}


}