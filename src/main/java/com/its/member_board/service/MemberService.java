package com.its.member_board.service;

import com.its.member_board.dto.MemberDTO;
import com.its.member_board.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;

@Service
public class MemberService {
    @Autowired
    private MemberRepository memberRepository;

    public void save(MemberDTO memberDTO) throws IOException {
         /*
        1. BoardDTO 객체에 담긴 파일을 꺼냄.
        2. 파일의 원본 이름을 가져옴.(originalFileName)
        3. 서버 관리용 이름 생성 (storedFileName)
        4. originalFileName,storedFileName을 DTO 객체에 담음.
        5. 파일 실제 저장위치 지정.
        6. 파일 저장 처리.
        7. repository로 DTO 객체 전달
    */
        if(!memberDTO.getMemberFile().isEmpty()){
            MultipartFile memberFile=memberDTO.getMemberFile();
            String originalFile=  memberFile.getOriginalFilename();
            String storedFile= System.currentTimeMillis()+"-"+originalFile;
            memberDTO.setOriginalFileName(originalFile);
            memberDTO.setStoredFileName(storedFile);
            String savePath="D:\\spring_img\\member\\"+storedFile;
            memberFile.transferTo(new File(savePath));
            memberDTO.setMember_fileAttached(1);
            MemberDTO saveMember = memberRepository.save(memberDTO);
            memberRepository.savefile(saveMember);
        }else{
            memberDTO.setMember_fileAttached(0);
            memberRepository.save(memberDTO);
        }
    }
    public String emailCk(String memberEmail){
       return memberRepository.emailCk(memberEmail);
    }
    public MemberDTO  login(MemberDTO memberDTO){
        MemberDTO loginResult = memberRepository.login(memberDTO);
        if(loginResult != null){
            return loginResult;
        }else {
            return null;
        }
    }
    public List<MemberDTO> list(){ return memberRepository.list();}

    public void memberDelete(Long id){memberRepository.memberDelete(id);}

    public MemberDTO findbyId(Long id){return memberRepository.findbyId(id);}

    public boolean  update(MemberDTO memberDTO){
       int result= memberRepository.update(memberDTO);
       if(result>=1){
           return true;
       }else{
           return false;
       }
        }
     public void delete(Long id){memberRepository.delete(id);}
}
