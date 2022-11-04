package com.its.member_board.controller;

import com.its.member_board.dto.MemberDTO;
import com.its.member_board.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member")
public class MemberContoller {
    @Autowired
    private MemberService memberService;


    @GetMapping("/save")
      public String saveform(){ return "MemberSave";}

    @PostMapping("/save")
    public String save(@ModelAttribute MemberDTO memberDTO){
        System.out.println("memberDTO = " + memberDTO);
        memberService.save(memberDTO);
        return "MemberLogin";
    }
}


