package com.its.member_board.repository;

import com.its.member_board.dto.MemberDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class MemberRepository {
    @Autowired
    private SqlSessionTemplate sql;

    public MemberDTO save(MemberDTO memberDTO){
        sql.insert(("Member.save"),memberDTO);
        return memberDTO;
    }

    public void savefile(MemberDTO memberDTO) { sql.insert(("Member.savefile"),memberDTO);}

    public String emailCk(String memberEmail){return sql.selectOne(("Member.emailCk"),memberEmail);}

    public MemberDTO login(MemberDTO memberDTO) {return sql.selectOne(("Member.login"),memberDTO);}

    public List<MemberDTO> list(){return sql.selectList("Member.list");}

    public void memberDelete(Long id) {sql.delete(("Member.memberDelete"),id);}
}
