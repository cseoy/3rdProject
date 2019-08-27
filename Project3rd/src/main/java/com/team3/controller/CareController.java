package com.team3.controller;

import java.util.ArrayList;
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

import com.team3.vo.CareVO;

@Controller
@RequestMapping("/animal")
public class CareController {
	private static final Logger logger = LoggerFactory.getLogger(CareController.class);
	
	private static String url = "http://api.data.go.kr/openapi/animalprtccnter-std?serviceKey=G9h%2BzpEzHkSijL%2F5lW4kzJEjYDRHtnawV73OErM84CXrxuqci%2BFWagQ4JGeemBd%2FajTodhdAyhtRkJOC%2BzHXuw%3D%3D";

	
	@RequestMapping(value="/center", method=RequestMethod.GET)
	public void list(Model model, HttpServletRequest req) throws Exception {
		
		logger.info("care list start");
		System.out.println("dddddddddd"+req.getParameter("start")+req.getParameter("end"));
		if(req.getParameter("start") != null) {
			url ="http://openapi.animal.go.kr/openapi/service/rest/abandonmentPublicSrvc/abandonmentPublic?bgnde="+req.getParameter("start").toString()+"&endde="+req.getParameter("end").toString()+"&pageNo=1&numOfRows=10&ServiceKey=G9h%2BzpEzHkSijL%2F5lW4kzJEjYDRHtnawV73OErM84CXrxuqci%2BFWagQ4JGeemBd%2FajTodhdAyhtRkJOC%2BzHXuw%3D%3D\"";
		}

		List<CareVO> li = new ArrayList<>(); 
		
		try {
			DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
			DocumentBuilder db = dbf.newDocumentBuilder();
			Document doc = db.parse(url); 
			
			System.out.println("doc" + doc);
			
			// root tag 
			doc.getDocumentElement().normalize();
			
			System.out.println("Root element: " + doc.getDocumentElement().getNodeName()); // Root element: result
			// 파싱할 tag
			NodeList list = doc.getElementsByTagName("item");
			
			
			
			for(int i=0; i<list.getLength(); i++) {
				Node animal = list.item(i);
				NodeList animalList = animal.getChildNodes();
				CareVO cvo = new CareVO();
				
				
				for(int j=0; j<animalList.getLength(); j++) {
					Node item = animalList.item(j);
					String value = item.getNodeName();
				
					if(value.equals("animalCnterNm")) cvo.setAnimalcnternm(item.getTextContent());
					if(value.equals("rdnmadr")) cvo.setRdnmadr(item.getTextContent());
					if(value.equals("weekdayOperOpenHhmm")) cvo.setWeekdayoperopenhhmm(item.getTextContent());
					if(value.equals("weekdayOperColseHhmm")) cvo.setWeekdayopercolsehhmm(item.getTextContent());
					if(value.equals("phoneNumber")) cvo.setPhonenumber(item.getTextContent());
					
				}
				li.add(cvo);
				model.addAttribute("li", li);
			
			} // for end
			
		} catch(Exception e) { 
			e.printStackTrace();
		} // catch end	
	}
}




