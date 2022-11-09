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

    public MemberDTO findbyId(Long id) {
        MemberDTO memberDTO =sql.selectOne(("Member.findbyId"),id);
        if(memberDTO.getMember_fileAttached() ==1){
                return sql.selectOne(("Member.findbyIdFile"),id);
        }else{
            return memberDTO;
        }
    }

    public int update(MemberDTO memberDTO){return sql.update(("Member.update"),memberDTO);}
    }
