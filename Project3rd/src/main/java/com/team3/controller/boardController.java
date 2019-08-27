package com.team3.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team3.service.BoardService;
import com.team3.vo.BoardVO;
import com.team3.vo.PageCriteria;
import com.team3.vo.PagingMaker;


@Controller
@RequestMapping("/board/*")
public class boardController {
	private static final Logger logger =
			LoggerFactory.getLogger(boardController.class);
	
	@Inject
	private BoardService bsvc;
	
	@RequestMapping(value = "/write", method = RequestMethod.GET) 
	public void writGET(BoardVO vo, Model model) throws Exception {
		logger.info("write start..... " );
	}
	
	@RequestMapping(value = "/write" , method = RequestMethod.POST)
	public String writePOST(BoardVO bvo, RedirectAttributes reAttr) throws Exception { 
		
		logger.info("writePost start.....");
		logger.info(bvo.toString());
		
		bsvc.write(bvo);
		
		//model.addAttribute("result","write_success");
		// reAttr : 모델 객체 대신에 사용하면 전달시 노출을 안시킨다
		reAttr.addFlashAttribute("result","Success");
		//addFlashAttribute : 한번만 전송하도록 하는 메소드
		
		 //return "/bbs/resultOk"; //db에 등록이 되는지만 확인할려고 만든 페이지
		
		return "redirect:/board/list" ; // db에 있는 리스트를 확인하려는 페이지
	}
	
	@RequestMapping(value = "/list" , method = RequestMethod.GET)	//리스트 페이지에 db에 담긴 데이터 가져오기
	public void list(Model model) throws Exception {
		logger.info("bbs list start ..... ");
		
		model.addAttribute("list",bsvc.listAll());
	}
	
	/*
	  파라미터 받는법 3가지
	  1. HttpServerRequest req
	  
	  2. @RequestParam	// 바로 캐스팅 하기에 편함
	  
	  3. ModelAttribute
	*/
	
	@RequestMapping(value = "/read", method = RequestMethod.GET )
	public void read(@RequestParam("articleNo") int articleNo, Model model) throws Exception {
		model.addAttribute(bsvc.read(articleNo)); // BbsServiecImple를 먼저 실행
												// 최종적으로 리턴받는 값음 bvo 객체이다.
		// addAttribute에 name을 사용하지 않을 경우 
		// name 은 클래스명을 소문자로 시작해서 자동으로 생성한다.
		
	}
	@RequestMapping(value = "/readPage", method = RequestMethod.GET)
	public void readPage(@RequestParam("articleNo") int articleNo,@ModelAttribute("pcri") PageCriteria pCri, Model model) throws Exception{
		model.addAttribute(bsvc.read(articleNo));
	}
	
	// 수정 조회
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void modifyGET(@RequestParam("articleNo") int articleNo , Model model) throws Exception {
		model.addAttribute(bsvc.read(articleNo));
	}
	//수정조회
	@RequestMapping(value = "/modifyPage", method = RequestMethod.GET)
	public void modifyPageGET(@RequestParam("articleNo") int articleNo ,@ModelAttribute("pcri") PageCriteria pCri, Model model) throws Exception {
		
		model.addAttribute(bsvc.read(articleNo));
	}
	//수정처리
	@RequestMapping(value = "/modify" , method = RequestMethod.POST) // 같은 주소지만 post 방식일때 사용
	public String modifyPOST(BoardVO bvo, RedirectAttributes reAttr) throws Exception { // reAttr : 한번정송할때 사용
		logger.info("modifyPOST start....");
		
		bsvc.modify(bvo);
		reAttr.addFlashAttribute("result", "Success");
		
		return "redirect:/board/list";
	}
	//수정처리
	@RequestMapping(value = "/modifyPage" , method = RequestMethod.POST) // 같은 주소지만 post 방식일때 사용
	public String modifyPagePOST(BoardVO bvo,PageCriteria pCri, RedirectAttributes reAttr) throws Exception { // reAttr : 한번정송할때 사용
		logger.info("modifyPOST start....");
		
		bsvc.modify(bvo);
		reAttr.addAttribute("page", pCri.getPage());
		reAttr.addAttribute("numberPage", pCri.getNumPerPage());
		reAttr.addFlashAttribute("result", "Success");
		
		return "redirect:/board/pageList";
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(@RequestParam("articleNo") int articleNo,RedirectAttributes reAttr) throws Exception {
		logger.info("delete start.....");
		
		bsvc.remove(articleNo);
		reAttr.addFlashAttribute("result", "Success");
		
		return "redirect:/board/list";
	}
	@RequestMapping(value = "/deletePage", method = RequestMethod.GET)
	public String delete(@RequestParam("articleNo") int articleNo,PageCriteria pCri, RedirectAttributes reAttr) throws Exception {
		logger.info("delete start.....");
		
		bsvc.remove(articleNo);
		reAttr.addAttribute("page", pCri.getPage());
		reAttr.addAttribute("numberPage", pCri.getNumPerPage());
		reAttr.addFlashAttribute("result", "Success");
		
		return "redirect:/board/pageList";
	}
	
	@RequestMapping(value = "/pageListTest", method = RequestMethod.GET)
	public void pageListTest(PageCriteria pcri, Model model) throws Exception {
		logger.info("pageListTest Start....");
		model.addAttribute("list", bsvc.listCriteria(pcri));
	}
	@RequestMapping(value = "/pageList", method = RequestMethod.GET)
	public void pageList(PageCriteria pcri, Model model) throws Exception {
		logger.info(pcri.toString());
		
		model.addAttribute("list", bsvc.listCriteria(pcri));
		PagingMaker pm = new PagingMaker();
		pm.setPcri(pcri);
		//pm.setTotalData(155);
		pm.setTotalData(bsvc.listCountData(pcri));
		
		model.addAttribute("pagingMaker", pm);
		
	}
	
} // class end
	
	

