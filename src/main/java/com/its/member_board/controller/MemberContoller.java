package com.its.member_board.controller;

import com.its.member_board.dto.MemberDTO;
import com.its.member_board.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
@RequestMapping("/member")
public class MemberContoller {
    @Autowired
    private MemberService memberService;


    @GetMapping("/save")
      public String saveform(){ return "Member/MemberSave";}

    @PostMapping("/save")
    public String save(@ModelAttribute MemberDTO memberDTO) throws IOException {
        System.out.println("memberDTO = " + memberDTO);
        memberService.save(memberDTO);
        return "Member/MemberLogin";
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
    @GetMapping("/login")
    public String loginform(){return "Member/MemberLogin";}
    @PostMapping("/login")
    public String login(@ModelAttribute MemberDTO memberDTO, HttpSession session, Model model){
      MemberDTO loginResult= memberService.login(memberDTO);

      if(loginResult != null){
          session.setAttribute("member",loginResult);
          model.addAttribute("member",loginResult);
          return "redirect:/board/";
      }else{
          return "Member/MemberLogin";
      }
    }
}


