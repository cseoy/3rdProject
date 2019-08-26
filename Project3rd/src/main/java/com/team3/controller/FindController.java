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
import com.team3.vo.FindCriteria;
import com.team3.vo.PagingMaker;


@Controller
@RequestMapping("/fboard/*")
public class FindController {

	private static final Logger logger = LoggerFactory.getLogger(FindController.class);

	@Inject
	private BoardService bsvc;
	
	@RequestMapping(value = "/list" , method = RequestMethod.GET)
	public void list(@ModelAttribute("fCri") FindCriteria fCri, Model model) throws Exception {
		logger.info(fCri.toString());
	      model.addAttribute("list",bsvc.listFind(fCri));
	       
	      PagingMaker pagingMaker = new PagingMaker();
	      
	      pagingMaker.setPcri(fCri);
	      
	      pagingMaker.setTotalData(bsvc.findCountData(fCri));
	      
	      model.addAttribute("pagingMaker",pagingMaker);
	}
	
	//조회
	@RequestMapping(value = "/readPage", method = RequestMethod.GET)
	public void readPage(@RequestParam("articleNo") int articleNo, @ModelAttribute("fcri") FindCriteria fcri, Model model) throws Exception{
		model.addAttribute(bsvc.read(articleNo));
	}
	
	//수정 페이지
	@RequestMapping(value = "/modifyPage", method = RequestMethod.GET)
	public void modifyGET(int articleNo, @ModelAttribute("fCri") FindCriteria fCri, Model model) throws Exception{
		model.addAttribute(bsvc.read(articleNo));
	}
	
	//DB에 수정 처리
	@RequestMapping(value = "/modifyPage", method = RequestMethod.POST)
	public String modifyPOST(BoardVO bvo, FindCriteria fCri, RedirectAttributes reAttr) throws Exception {
		
		logger.info("modify start.....");
		
		bsvc.modify(bvo);
		
		reAttr.addAttribute("page", fCri.getPage()); //findcriteria 에서 pagecriteria 를 상속받아 사용가능
		reAttr.addAttribute("numPerPage", fCri.getNumPerPage());
		reAttr.addAttribute("findType", fCri.getFindType());
		reAttr.addAttribute("keyword", fCri.getKeyword());
		
		reAttr.addFlashAttribute("result", "Success"); // 한번만 실행하는 것 (잘된경우)
		
		logger.info(reAttr.toString());
		
		return "redirect:/fboard/list";
	}
	
	//삭제
	@RequestMapping(value = "/deletePage", method = RequestMethod.GET)
	public String deletePage(@RequestParam("articleNo") int articleNo,FindCriteria fCri,RedirectAttributes reAttr) throws Exception {
	
		bsvc.remove(articleNo);
		
		reAttr.addAttribute("page", fCri.getPage()); //findcriteria 에서 pagecriteria 를 상속받아 사용가능
		reAttr.addAttribute("numPerPage", fCri.getNumPerPage());
		reAttr.addAttribute("findType", fCri.getFindType());
		reAttr.addAttribute("keyword", fCri.getKeyword());
		
		reAttr.addFlashAttribute("result", "Success"); // 한번만 실행하는 것 (잘된경우)
		
		logger.info(reAttr.toString());
		
		return "redirect:/fboard/list";
	}
	
	//글쓰기
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public void writeGET() throws Exception{
		logger.info("writeGet start....");
	}
	
	//DB에 입력하기
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String writePOST(BoardVO bvo, RedirectAttributes reAttr) throws Exception {
		logger.info("writePOST start.....");
		
		bsvc.write(bvo);
		
		reAttr.addFlashAttribute("result","Success");
		
		return "redirect:/fboard/list";
	}
	
}// class end
