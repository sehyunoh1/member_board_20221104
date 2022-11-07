package com.its.member_board.repository;

import com.its.member_board.dto.MemberDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
}
