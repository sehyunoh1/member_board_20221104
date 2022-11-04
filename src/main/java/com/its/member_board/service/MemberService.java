package com.its.member_board.service;

import com.its.member_board.dto.MemberDTO;
import com.its.member_board.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;

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
            MemberDTO FileDTO = new MemberDTO();
            FileDTO.setOriginalFileName(originalFile);
            FileDTO.setStoredFileName(storedFile);
            String savePath="D:\\spring.img\\member"+storedFile;
            memberFile.transferTo(new File(savePath));
            memberDTO.setFileAttached(1);
            memberRepository.save(memberDTO);
        }else{
            memberDTO.setFileAttached(0);
            memberRepository.save(memberDTO);
        }
    }
    public String emailCk(String memberEmail){
       return memberRepository.emailCk(memberEmail);
    }
}
