package com.its.member_board.repository;

import com.its.member_board.dto.BoardDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class BoardRepository {
    @Autowired
    private SqlSessionTemplate sql;

    public BoardDTO save(BoardDTO boardDTO){
        sql.insert("Board.save",boardDTO);
        return boardDTO;
    }
    public void savefile(BoardDTO boardDTO){ sql.insert(("Board.savefile"),boardDTO);}

    public List<BoardDTO> list(){return sql.selectList("Board.list");}

    public BoardDTO findbyId(Long boardId){return sql.selectOne(("Board.findbyId"),boardId);}

    public int Hits(Long boardId) {return sql.update(("Board.hits"),boardId);}
}
