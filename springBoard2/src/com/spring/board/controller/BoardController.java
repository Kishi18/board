package com.spring.board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.websocket.server.PathParam;

import org.codehaus.jackson.JsonProcessingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.board.HomeController;
import com.spring.board.service.boardService;
import com.spring.board.service.impl.boardServiceImpl;
import com.spring.board.vo.BoardVo;
import com.spring.board.vo.PageVo;
import com.spring.common.CommonUtil;

@Controller
public class BoardController {
	
	@Autowired 
	boardService boardService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/board/boardList.do", method = RequestMethod.GET)
	public String boardList(Locale locale, Model model,PageVo pageVo) throws Exception{
		
		List<BoardVo> boardList = new ArrayList<BoardVo>();
		
		int totalCnt = 0;
		int page = 1;
		if(pageVo.getPageNo() == 0){
			pageVo.setPageNo(page);
		}
		
		boardList = boardService.SelectBoardList(pageVo);
		totalCnt = boardService.selectBoardCnt();
		
		model.addAttribute("boardList", boardList);
		model.addAttribute("totalCnt", totalCnt);
		model.addAttribute("pageNo", page);
		
		return "board/boardList";
	}
	
	@RequestMapping(value = "/board/{boardType}/{boardNum}/boardView.do", method = RequestMethod.GET)
	public String boardView(Locale locale, Model model
			,@PathVariable("boardType")String boardType
			,@PathVariable("boardNum")int boardNum) throws Exception{
		
		BoardVo boardVo = new BoardVo();
		
		PageVo pageVo = new PageVo();
		int page = 1;
		if(pageVo.getPageNo() == 0){
			pageVo.setPageNo(page);
		}
		model.addAttribute("pageNo",pageVo);
		
		boardVo = boardService.selectBoard(boardType,boardNum);
		
		model.addAttribute("boardType", boardType);
		model.addAttribute("boardNum", boardNum);
		model.addAttribute("board", boardVo);
		
		return "board/boardView";
	}
	
	@RequestMapping(value = "/board/boardWrite.do", method = RequestMethod.GET)
	public String boardWrite(Locale locale, Model model) throws Exception{
		
		PageVo pageVo = new PageVo();
		int page = 1;
		if(pageVo.getPageNo() == 0){
			pageVo.setPageNo(page);
		}
		
		model.addAttribute("pageNo",pageVo);		
		
		return "board/boardWrite";
	}
	
	@RequestMapping(value = "/board/boardWriteAction.do", method = RequestMethod.POST)
	@ResponseBody
	public String boardWriteAction(Locale locale,BoardVo boardVo, Model model) throws Exception{
		
		HashMap<String, String> result = new HashMap<String, String>();
		CommonUtil commonUtil = new CommonUtil();
		
		int resultCnt = boardService.boardInsert(boardVo);
		
		result.put("success", (resultCnt > 0)?"Y":"N");
		String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
		
		System.out.println("callbackMsg::"+callbackMsg);
		
		
		return callbackMsg;
	}
	
//	@RequestMapping(value = "/board/boardUpdate.do", method = RequestMethod.GET)
//	public String boardUpdate(Locale locale, Model model) throws Exception{
//	
//		return "board/boardUpdate";
//	}
	
	@RequestMapping(value="/board/{boardType}/{boardNum}/boardUpdate.do", method = RequestMethod.GET)
	public String boardUpdate(Locale locale, Model model
			,@PathVariable("boardType")String boardType
			,@PathVariable("boardNum")int boardNum) throws Exception{
		
		BoardVo boardVo = new BoardVo();		
		
		boardVo = boardService.selectBoard(boardType,boardNum);
		
		PageVo pageVo = new PageVo();
		int page = 1;
		if(pageVo.getPageNo() == 0){
			pageVo.setPageNo(page);
		}
		model.addAttribute("pageNo",pageVo);
		
		model.addAttribute("boardType", boardType);
		model.addAttribute("boardNum", boardNum);
		model.addAttribute("board", boardVo);
		
		return "board/boardUpdate";
	}
	
	@RequestMapping(value="/board/boardUpdateAction.do", method = RequestMethod.POST)
	@ResponseBody
	public String boardUpdateAction(Locale locale, BoardVo boardVo) throws Exception{
		HashMap<String, String> result = new HashMap<String,String>();
		CommonUtil commonUtil = new CommonUtil();
		//int boardNum = boardVo.getBoardNum() ;
		int resultCnt = boardService.boardUpdate(boardVo);
		
		result.put("success",(resultCnt >0)?"Y":"N");
		String callbackMsg = commonUtil.getJsonCallBackString(" ", result);
		
		return callbackMsg;
		
	}
	
	@RequestMapping(value="/board/boardDeleteAction.do", method = RequestMethod.POST)
	@ResponseBody
	public String boardDelete(Locale locale, int boardNum) throws Exception{ 
	
		HashMap<String, String> result = new HashMap<String,String>();
		CommonUtil commonUtil = new CommonUtil();
		int resultCnt = boardService.boardDelete(boardNum); //삭제하는부분
		
		result.put("success",(resultCnt >0)?"Y":"N");
		String callbackMsg = commonUtil.getJsonCallBackString(" ", result);
		
		return callbackMsg;
		/*	
		 * @ResponseBody 추가, commonutil이용한 callbackMsg 내용전달로 삭제확인	
		*/
	}
	
	@RequestMapping(value="/board/boardCheckbox.do", method= RequestMethod.GET)
	//public String boardCheckbox(Locale locale, @RequestParam(value="checkArray[]") List<String> checkArray, Model model, PageVo pageVo) throws Exception {
	public String boardCheckbox(Locale locale, Model model, PageVo pageVo, @RequestParam("menu") List<String> checkArray) throws Exception{
		List<BoardVo> boardList = new ArrayList<BoardVo>();
		
		//List<String> checkArray = new ArrayList<String>();
		
		
		System.out.println("checkArray 크기:"+checkArray.size());	
		
		int arraySize = checkArray.size();
		for(int i = 0; i< arraySize; i++) {
			System.out.println("checkArray"+i+":"+checkArray.get(i));//checkArray.get(i) 로 각각 나눠서 배열값 뿌릴수있음
			checkArray.add(checkArray.get(i));
		}
//		for(int i = 0 ; i<arraySize; i++) {
//			System.out.println("checkArray" + i + ":" + checkArray[i]);
//		}
	
		int totalCnt = 0;
		int page = 1;
		if(pageVo.getPageNo() == 0){
			pageVo.setPageNo(page);
		}
//		
		boardList = boardService.selectCheckList(checkArray,pageVo);
//		
		totalCnt = boardService.selectBoardCnt();
		
		model.addAttribute("boardList", boardList);
		model.addAttribute("totalCnt", totalCnt);
		model.addAttribute("pageNo", page);
		
//		HashMap<String, String> result = new HashMap<String,String>();
//		CommonUtil commonUtil = new CommonUtil();
//		
//		result.put("success",(boardList!=null)?"Y":"N");
//		String callbackMsg = commonUtil.getJsonCallBackString(" ", result);
//		
//		return callbackMsg;
		
		return "board/boardList";
	}
	
	@RequestMapping(value = "/board/boardJoin.do", method = RequestMethod.GET)
	public String boardJoin(Locale locale, Model model) throws Exception{
		
		PageVo pageVo = new PageVo();
		int page = 1;
		if(pageVo.getPageNo() == 0){
			pageVo.setPageNo(page);
		}
		
		model.addAttribute("pageNo",pageVo);		
		
		return "board/boardJoin";
	}
	
	@RequestMapping(value = "/board/boardLogin.do", method = RequestMethod.GET)
	public String boardLogin(Locale locale, Model model) throws Exception{
		
		PageVo pageVo = new PageVo();
		int page = 1;
		if(pageVo.getPageNo() == 0){
			pageVo.setPageNo(page);
		}
		
		model.addAttribute("pageNo",pageVo);		
		
		return "board/boardLogin";
	}
	
	@RequestMapping(value="/board/boardCheckId.do", method= RequestMethod.POST)
	@ResponseBody
	public String boardCheckId(Locale locale, Model model) throws Exception{
		HashMap<String, String> result = new HashMap<String,String>();
		CommonUtil commonUtil = new CommonUtil();
		//int resultCnt = boardService.; //아이디 중복 체크하는 부분
		
		//result.put("success",(resultCnt >0)?"Y":"N");
		String callbackMsg = commonUtil.getJsonCallBackString(" ", result);
		
		return callbackMsg;
	}
	
	
}

