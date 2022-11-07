package com.its.member_board.service;

import com.its.member_board.dto.BoardDTO;
import com.its.member_board.repository.BoardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;

@Service
public class BoardService {
    @Autowired
  private  BoardRepository boardRepository;

    public void save(BoardDTO boardDTO) throws IOException{
  /*
        1. BoardDTO 객체에 담긴 파일을 꺼냄.
        2. 파일의 원본 이름을 가져옴.(originalFileName)
        3. 서버 관리용 이름 생성 (storedFileName)
        4. originalFileName,storedFileName을 DTO 객체에 담음.
        5. 파일 실제 저장위치 지정.
        6. 파일 저장 처리.
        7. repository로 DTO 객체 전달
    */
        if(!boardDTO.getBoardfile().isEmpty())  {
            MultipartFile boardFile = boardDTO.getBoardfile();
            String originalName = boardFile.getOriginalFilename();
            String storedName = System.currentTimeMillis()+"-"+originalName;
            boardDTO.setOriginalName(originalName);
            boardDTO.setStoredName(storedName);
            String savepath = "D:\\spring_img\\board\\"+storedName;
            boardFile.transferTo(new File(savepath));
            boardDTO.setBoardfileAttached(1);
            BoardDTO saveDTO =boardRepository.save(boardDTO);
            boardRepository.savefile(saveDTO);
        } else {
            boardDTO.setBoardfileAttached(0);
            boardRepository.save(boardDTO);
        }
    }
    public List<BoardDTO> list(){ return boardRepository.list();}



}
