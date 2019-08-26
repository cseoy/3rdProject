package com.team3.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.team3.vo.AnimalVO;
import com.team3.vo.PageCriteria;
import com.team3.vo.PagingMaker;


@Controller
@RequestMapping("/animal")
public class AnimalController {
	private static final Logger logger = LoggerFactory.getLogger(AnimalController.class);
	private static Calendar cal = Calendar.getInstance();
	private static SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
	
	// default 기간 설정을 위한 메소드
	private static String setBgnde() {
		cal.setTime(new Date());
		cal.add(Calendar.MONTH, -1);
		String bgnde = sdf.format(cal.getTime());
		
		System.out.println(bgnde);
		return bgnde;
	} // setBgnde() end
	private static String setEndde() {
		cal.setTime(new Date());
		String endde = sdf.format(cal.getTime());
		
		System.out.println(endde);
		return endde;
	} // setEndde() end
	
	// API URL (기간 default : 최근 한달)
	private static String url = "http://openapi.animal.go.kr/openapi/service/rest/abandonmentPublicSrvc/abandonmentPublic?"+
	"bgnde="+setBgnde()+"&endde="+setEndde()+
	"&pageNo=1&numOfRows=12&ServiceKey=6Xteh%2F%2Bxl8Xo4IHZBa7QIPi2FlBsPB09CotncHjcTwaEs4L5xr3%2BfgxyulAAAVOgpi9QF3Eo4UOjplxykBTxcA%3D%3D";
	
// private static String url = "http://openapi.animal.go.kr/openapi/service/rest/abandonmentPublicSrvc/abandonmentPublic?bgnde=20190721&endde=20190821&pageNo=1&numOfRows=12&ServiceKey=6Xteh%2F%2Bxl8Xo4IHZBa7QIPi2FlBsPB09CotncHjcTwaEs4L5xr3%2BfgxyulAAAVOgpi9QF3Eo4UOjplxykBTxcA%3D%3D";
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public void list(Model model, HttpServletRequest req) throws Exception {
		
		logger.info("animal list start");
		
		PagingMaker pagingMaker = new PagingMaker();
		PageCriteria pcri = new PageCriteria();
		
		System.out.println("pageNo : "+req.getParameter("pageNo"));
		
		List<AnimalVO> li = new ArrayList<>(); 

		try {
			if(req.getParameter("pageNo") != null) {
				pcri.setPageNo(Integer.parseInt(req.getParameter("pageNo")));
				url ="http://openapi.animal.go.kr/openapi/service/rest/abandonmentPublicSrvc/abandonmentPublic?bgnde="+setBgnde()+"&endde="+setEndde()+"&pageNo="+req.getParameter("pageNo").toString()+"&numOfRows=12&ServiceKey=6Xteh%2F%2Bxl8Xo4IHZBa7QIPi2FlBsPB09CotncHjcTwaEs4L5xr3%2BfgxyulAAAVOgpi9QF3Eo4UOjplxykBTxcA%3D%3D";
			}
			
			if(req.getParameter("start")!=null && req.getParameter("end")!=null) {
				if(req.getParameter("pageNo") != null) {
					pcri.setPageNo(Integer.parseInt(req.getParameter("pageNo")));
					url ="http://openapi.animal.go.kr/openapi/service/rest/abandonmentPublicSrvc/abandonmentPublic?bgnde="+req.getParameter("start").toString()+"&endde="+req.getParameter("end")+"&pageNo="+req.getParameter("pageNo").toString()+"&numOfRows=12&ServiceKey=6Xteh%2F%2Bxl8Xo4IHZBa7QIPi2FlBsPB09CotncHjcTwaEs4L5xr3%2BfgxyulAAAVOgpi9QF3Eo4UOjplxykBTxcA%3D%3D";
				}
				else
					url ="http://openapi.animal.go.kr/openapi/service/rest/abandonmentPublicSrvc/abandonmentPublic?bgnde="+req.getParameter("start").toString()+"&endde="+req.getParameter("end")+"&pageNo=1&numOfRows=12&ServiceKey=6Xteh%2F%2Bxl8Xo4IHZBa7QIPi2FlBsPB09CotncHjcTwaEs4L5xr3%2BfgxyulAAAVOgpi9QF3Eo4UOjplxykBTxcA%3D%3D";
			}
			 
			pagingMaker.setPcri(pcri);
			DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
			DocumentBuilder db = dbf.newDocumentBuilder();
			Document doc = db.parse(url);
			
			// root tag 
			doc.getDocumentElement().normalize();
			System.out.println("Root element: " + doc.getDocumentElement().getNodeName()); // Root element: result

			// 파싱할 tag
			NodeList list = doc.getElementsByTagName("item");
			System.out.println("파싱할 리스트 수 : "+list.getLength());
			
			// 파싱할 tag
			int totalCount = Integer.parseInt(doc.getElementsByTagName("totalCount").item(0).getTextContent());
			pagingMaker.setTotalCount(totalCount);					
	
						
			for(int i=0; i<list.getLength(); i++) {
				Node animal = list.item(i);
				NodeList animalList = animal.getChildNodes();
				AnimalVO avo = new AnimalVO();
				
				for(int j=0; j<animalList.getLength(); j++) {
					Node item = animalList.item(j);
					String value = item.getNodeName();
					// String val = item.getNodeValue(); 
					// getTextContent() : 전체 정보 
					if(value.equals("popfile")) avo.setPopfile(item.getTextContent());
					if(value.equals("age")) avo.setAge(item.getTextContent());
					if(value.equals("sexCd")) avo.setSexCd(item.getTextContent());
					if(value.equals("kindCd")) avo.setKindCd(item.getTextContent());
					if(value.equals("colorCd")) avo.setColorCd(item.getTextContent());
					if(value.equals("happenDt")) avo.setHappenDt(item.getTextContent());
					if(value.equals("happenPlace")) avo.setHappenPlace(item.getTextContent());
					if(value.equals("specialMark")) avo.setSpecialMark(item.getTextContent());
					if(value.equals("processState")) avo.setProcessState(item.getTextContent());
					if(value.equals("careNm")) avo.setCareNm(item.getTextContent());
					if(value.equals("careAddr")) avo.setCareAddr(item.getTextContent());
				}
				li.add(avo);
				
				model.addAttribute("li", li);
				model.addAttribute("pagingMaker", pagingMaker);
				
			}

		} catch(Exception e) {
			e.printStackTrace();
		}
	} // list() end
	
	@RequestMapping("/map")
	public String map(Model model, HttpServletRequest req) throws Exception {
		model.addAttribute("careNm", req.getParameter("careNm"));
		return "animal/map";
	}
}
