package com.its.member_board.dto;

import lombok.*;
import org.springframework.web.multipart.MultipartFile;


@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class MemberDTO {
    private Long id;
    private String memberEmail;
    private String memberPassword;
    private String memberName;
    private String memberMobile;
    private int member_fileAttached;
    private MultipartFile memberFile;
    private String originalFileName;
    private String storedFileName;
    private Long memberId;
}
