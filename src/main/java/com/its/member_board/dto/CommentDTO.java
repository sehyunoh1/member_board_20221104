package com.its.member_board.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.sql.Timestamp;

@Getter
@Setter
@ToString
public class CommentDTO {
    private Long commentId;
    private String commentWriter;
    private String commentContents;
    private Timestamp commentCreatedDate;
    private Long boardId;

}
