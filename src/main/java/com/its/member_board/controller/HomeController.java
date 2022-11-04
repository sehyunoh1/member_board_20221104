package com.its.member_board.controller;

import com.its.member_board.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;

@Controller
public class HomeController {

    @GetMapping("/")
    public String Home(){
        return "index";
    }
    @GetMapping ("/logout")
    public String logout(HttpSession session){
        session.invalidate();
        return "index";}



}
