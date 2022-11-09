package com.its.member_board.controller;

import com.its.member_board.dto.MemberDTO;
import com.its.member_board.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

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
      } else{
          return "Member/MemberLogin";
      }
    }

    @GetMapping("/admin")
    public String memberList(Model model){
        List<MemberDTO> memberList = memberService.list();
        model.addAttribute("member",memberList);
        return "/Member/Admin";
    }
    @GetMapping ("/admin/delete")
    public String memberDelete(@RequestParam("id") Long id){
        System.out.println(id);
        memberService.memberDelete(id);
        return "redirect:/member/admin";
    }

   @GetMapping("/member")
    public String findbyId(@RequestParam("id") Long id, Model model){
        MemberDTO member = memberService.findbyId(id);
        model.addAttribute("member",member);
        return "/Member/MemberDetail";
   }
   @GetMapping("/update")
     public String updateform(){return "/Member/MemberUpdate";}


   @PostMapping("/update")
   public String update(@ModelAttribute MemberDTO memberDTO,Model model){
       boolean result= memberService.update(memberDTO);
       model.addAttribute(("member"),memberDTO);
       if(result) {
           return "redirect:/member/member?id="+memberDTO.getId();
       }else{
           return "/Member/MemberUpdate";
       }
   }
}


