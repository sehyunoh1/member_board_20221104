package com.its.member_board.controller;

import com.its.member_board.dto.MemberDTO;
import com.its.member_board.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;

@Controller
@RequestMapping("/member")
public class MemberContoller {
    @Autowired
    private MemberService memberService;


    @GetMapping("/save")
      public String saveform(){ return "MemberSave";}

    @PostMapping("/save")
    public String save(@ModelAttribute MemberDTO memberDTO) throws IOException {
        System.out.println("memberDTO = " + memberDTO);
        memberService.save(memberDTO);
        return "MemberLogin";
    }
    @PostMapping("/duplicate")
    public @ResponseBody String emailCk(String memberEmail){
      String result =  memberService.emailCk(memberEmail);
      if(result == null){
          return "ok";
      }else {
          return "no";
      }
    }
}


