package com.its.member_board.service;

import com.its.member_board.commons.PagingConst;
import com.its.member_board.dto.BoardDTO;
import com.its.member_board.dto.PagingDTO;
import com.its.member_board.repository.BoardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    public List<BoardDTO> list(int page) {//페이지당 나오는 글 목록
    /*
            page = 1, 0
            page = 2, 3
            page = 3, 6
          */
        int pageStart = (page - 1) * PagingConst.PAGE_LIMIT;
        Map<String,Integer> pagingParams = new HashMap<>();
        pagingParams.put("start",pageStart);
        pagingParams.put("Limit",PagingConst.PAGE_LIMIT);
        List<BoardDTO> pageList =boardRepository.pagingList(pagingParams);
        return pageList;
    }

    public PagingDTO pagingParam(int page){ //페이지 개수
        int boardCount = boardRepository.boardCount(); //전체 글 갯수
        int maxPage= (int) (Math.ceil((double) boardCount / PagingConst.PAGE_LIMIT));
        int startPage= ((int)(Math.ceil((double) page / PagingConst.BLOCK_LIMIT))-1) * PagingConst.BLOCK_LIMIT +1;
        int endPage = startPage +PagingConst.BLOCK_LIMIT-1;
        if(endPage>maxPage){
            endPage=maxPage;
        }
        PagingDTO pageDTO=new PagingDTO();
        pageDTO.setPage(page);
        pageDTO.setMaxPage(maxPage);
        pageDTO.setStartPage(startPage);
        pageDTO.setEndPage(endPage);
        return pageDTO;
    }
    public BoardDTO findbyId(Long boardId){
       BoardDTO boardDTO= boardRepository.findbyId(boardId);
        return boardDTO;
    }
    public int hits(Long boardId){return boardRepository.Hits(boardId);}
    public boolean update(BoardDTO boardDTO){
       int update= boardRepository.update(boardDTO);
       if(update>=1){
           return true;
       }else{
           return false;
       }

    }


}
