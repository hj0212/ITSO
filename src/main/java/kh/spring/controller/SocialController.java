package kh.spring.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.security.auth.login.LoginException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ArrayNode;
import com.fasterxml.jackson.databind.node.ObjectNode;

import kh.spring.dto.CollectionDTO;
import kh.spring.dto.GoodDTO;
import kh.spring.dto.MemberDTO;
import kh.spring.dto.NotificationDTO;
import kh.spring.dto.SocialBoardDTO;
import kh.spring.dto.SocialCommentDTO;
import kh.spring.dto.SocialHashTagDTO;
import kh.spring.dto.SocialTagDTO;
import kh.spring.exception.NotLoginException;
import kh.spring.exception.NotWriterException;
import kh.spring.interfaces.IMemberService;
import kh.spring.interfaces.INotificationService;
import kh.spring.interfaces.ISocialBoardService;
import kh.spring.interfaces.ISocialCommentService;
import kh.spring.interfaces.ISocialHashTagService;
import kh.spring.interfaces.ISocialTagService;
import kh.spring.jsonobject.SocialTag;

@Controller
public class SocialController {
	@Autowired
	private ISocialBoardService service;

	@Autowired
	private IMemberService mService;

	@Autowired 
	ISocialTagService tagService;
	
	@Autowired
	private INotificationService nosevice;

	@Autowired
	ISocialCommentService comService;

	@Autowired
	ISocialHashTagService shtService;

	@RequestMapping("/main.go")
	public ModelAndView showSocialBoardList(HttpSession session,HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		int user_seq = 0;
		try {
			user_seq = ((MemberDTO)session.getAttribute("user")).getSeq();
		} catch(Exception e) {
			mav.setViewName("login.go");
			return mav;
		}


		String main =null;
		String gender =null;
		String age =null;

		String pGender =null;
		int pAge =0;
		//성별 나이 
		try {
			gender =	request.getParameter("gender");		 
			pGender = request.getParameter("gender");
			if(pGender.equals("")) {
				pGender=null;
			}
			if(gender.equals("f")) {
				gender = "여성";
			}else if(gender.equals("m")) {
				gender =" 남성";
			}else {
				gender ="무관";
			}
		}catch(Exception e2) {
			gender ="무관";			
		}

		try {
			pAge =Integer.parseInt(request.getParameter("age"));
			age = request.getParameter("age");
			if(pAge==0) {
				pAge=0;
			}
			if(age.equals("10")) {
				age="10대";
			}else if(age.equals("20")) {
				age="20대";
			}else if(age.equals("30")) {
				age="30대";
			}else if(age.equals("40")) {
				age="40대";
			}else {
				age="모든연령";
			}

		}catch(Exception e3) {
			age="모든연령";
		}

		try {
			main = request.getParameter("main");
			if(main.equals("full")) {
				mav.setViewName("main.jsp");
			}else if(main.equals("thumbnail")) {
				mav.setViewName("main3.jsp");
			}else {
				mav.setViewName("main.jsp");
			}


		}catch(Exception e4) {
			mav.setViewName("main.jsp");
		}


		SocialBoardDTO sdto = new SocialBoardDTO(pAge,pGender,user_seq);

		List<SocialBoardDTO> result =null ;
		String feed=null;
		try {
			feed = request.getParameter("feed");
			//			System.out.println(feed);
			if(feed.equals("new")) { //최신
				result= this.service.showSocialBoardList(sdto);
				//	System.out.println("1");

			}else if(feed.equals("hot")) {//인기
				result = this.service.showSocialHotBoardList(sdto);


			}else if(feed.equals("following")) { //팔로잉
				result =this.service.showSocialFollowBoardList(sdto);
				//System.out.println("3");

			}
		}catch(Exception ea) {
			result = this.service.showSocialBoardList(sdto);
			//System.out.println("10");
			feed="new";
		}



		List<Integer> ggdto = new ArrayList<>();
		List<MemberDTO> mdto = new ArrayList<>();

		for(SocialBoardDTO sdd : result) {	
			GoodDTO gdto = new GoodDTO(sdd.getSocial_seq());
			MemberDTO mom =  new MemberDTO(sdd.getSocial_seq()); 
			ggdto.add(this.service.allGoodCount(gdto)) ;
			mdto.addAll( this.mService.getUserData(mom));
			/*System.out.println(ggdto);*/
		}


		//		for(MemberDTO ddt : mdto) {
		//			System.out.println(ddt.getName());
		//		}


		List<Integer> goodCount = new ArrayList<>();
		for(SocialBoardDTO sdd : result) {
			GoodDTO gdto = new GoodDTO(sdd.getSocial_seq(),user_seq);
			goodCount.add(this.service.selectGoodCount(gdto));
			/*System.out.println("goodCount"+goodCount);*/
		}


		try {
			/*int sessionSeq = ((MemberDTO)session.getAttribute("user")).getSeq();
			NotificationDTO ndto = new NotificationDTO(sessionSeq);
			System.out.println(((MemberDTO)session.getAttribute("user")).getSeq());
			List<NotificationDTO> notiList = this.nosevice.selectNotification(ndto);*/
			List<CollectionDTO> collectionList = this.service.getCollectionList((MemberDTO)session.getAttribute("user"));
			List<SocialBoardDTO> photoList = this.service.getCollectionPhotoList((MemberDTO)session.getAttribute("user"));
			List<SocialBoardDTO> goodList = this.service.getMyGoodSocialList((MemberDTO)session.getAttribute("user"));
			List<MemberDTO> followingList = this.mService.getFollowingList((MemberDTO)session.getAttribute("user"));
			
			/*mav.addObject("u-seq",sessionSeq);
			mav.addObject("notiList",notiList);*/
			mav.addObject("collectionList",collectionList);
			mav.addObject("photoList",photoList);
			mav.addObject("goodList", goodList);
			mav.addObject("followingList", followingList);

		}catch(NullPointerException e) {
			/*		System.out.println("濡쒓렇�씤x");*/
		}finally {
		
			mav.addObject("feed",feed);
			mav.addObject("goodCount",goodCount);
			mav.addObject("heart",ggdto);
			mav.addObject("pAge",pAge);
			mav.addObject("main", main);
			mav.addObject("pGender",pGender);
			mav.addObject("gender",gender);		
			mav.addObject("age",age);
			mav.addObject("socialList",result);
		}
		return mav;
	}

	@RequestMapping("/collection.go")
	public ModelAndView showCollectionList(int seq) {
		CollectionDTO dto = new CollectionDTO();
		dto.setCollection_seq(seq);
		List<CollectionDTO> clist = service.getCollectionData(dto);
		List<SocialBoardDTO> list = service.getCollectionSocialList(dto);
		list = makeHashTag(list);
		ModelAndView mav = new ModelAndView();
		mav.addObject("collectionList", clist);
		mav.addObject("socialList", list);
		mav.setViewName("collection.jsp");
		return mav;
	}

	@Transactional
	@RequestMapping("/readSocial.go")
	public ModelAndView readSocial(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		ObjectMapper om = new ObjectMapper();
		long dummy = System.currentTimeMillis();
		// json에 넣을 순번
		int i = 0;

		int seq = Integer.parseInt(request.getParameter("seq"));
		SocialBoardDTO dto = service.selectSocialBoard(seq);
		MemberDTO mdto = this.mService.selectSocialWrtier(seq);

		String contents = dto.getSocial_contents();

		Pattern p = Pattern.compile("\\#([0-9a-zA-Z가-힣ㄱ-ㅎㅏ-ㅣ]*)");
		Matcher m = p.matcher(contents);

		contents = contents.replaceAll("(\\#([0-9a-zA-Z가-힣ㄱ-ㅎㅏ-ㅣ]*))", "<a href='searchTag.go?word="+"$2'>"+"$1"+"</a>");
		dto.setSocial_contents(contents);

		List<SocialCommentDTO> commentList = comService.showCommentList(seq);

		String[] writeDate = dto.getSocial_date().toString().split("-");
		
		
		int noti_seq = Integer.parseInt( request.getParameter("noti_seq"));
		NotificationDTO nodto = new NotificationDTO(noti_seq,"nono");
		int update_noti =this.nosevice.updateNotification(nodto);
		
		int social_seq = dto.getSocial_seq();
		List<SocialTagDTO> list = tagService.showSelectedTagList(social_seq);
		// image_db -> {} -> 0 : {}, 1 : {}
		ObjectNode infoNode = om.createObjectNode();
		// 각 태그
		ObjectNode objNodeNumber = om.createObjectNode();

		if(list.size() == 0) {
			mav.addObject("markerdata","{}");
			mav.addObject("dataflag","false");
		} else {
			for(SocialTagDTO tag : list) {
				// tag 하나당 넣어야 하는 객체
				ObjectNode objNode = om.createObjectNode();
				// 좌표를 넣을 객체
				ObjectNode objNodeCoords = om.createObjectNode();
				objNode.put("name", tag.getTag_name());

				if(tag.getTag_store() == null) {
					tag.setTag_store("");
				}

				if(tag.getTag_url() == null) {
					tag.setTag_url("#");
				}

				if(tag.getTag_category() == null) {
					tag.setTag_category("");
				}

				objNode.put("brand", tag.getTag_brand());
				objNode.put("store", tag.getTag_store());
				objNode.put("url", tag.getTag_store());
				objNode.put("category", tag.getTag_category());
				objNode.put("key", tag.getTag_seq());

				// 좌표
				objNodeCoords.put("lat", Double.parseDouble(tag.getTag_lat()));
				objNodeCoords.put("along", Double.parseDouble(tag.getTag_along()));

				objNode.put("coords", objNodeCoords);

				objNodeNumber.put(i++ +"", objNode);
			}

			// canvas 객체 추가
			ObjectNode canvas = om.createObjectNode();
			canvas.put("width", 500);
			canvas.put("height", 500);
			canvas.put("src", "upload/social/"+dto.getPhoto());

			objNodeNumber.put("canvas", canvas);
			infoNode.put("image_db", objNodeNumber);

			String json = "";
			try {
				json = om.writeValueAsString(infoNode);
			} catch (JsonProcessingException e) {
				e.printStackTrace();
			}

			mav.addObject("list",list);
			mav.addObject("markerdata", json);
			mav.addObject("dataflag","true");
		}

		mav.addObject("writer", mdto);
		mav.addObject("commentList",commentList);
		mav.addObject("content",dto);
		mav.addObject("date",writeDate);
		mav.addObject("src", dto.getPhoto());
		mav.addObject("dummy",dummy);
		mav.setViewName("styleShareBoard.jsp");
		return mav;
	}


	@Transactional
	@RequestMapping("/insertSocial.go")
	public ModelAndView insertSocial(HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		MemberDTO mdto;

		try {
			if(request.getSession().getAttribute("user") == null) {
				throw new NotLoginException();
			}

			mdto = (MemberDTO)request.getSession().getAttribute("user");

			String title = request.getParameter("stylename");
			String content = request.getParameter("stylecontent");
			int writer = mdto.getSeq();
			String gender = request.getParameter("gender");
			int age = Integer.parseInt(request.getParameter("age"));
			String photo = request.getParameter("imageinfo");

			if(title == null) {
				title = "제목 없음";
			}

			if(content == null) {
				content = "내용 없음";
			}

			SocialBoardDTO dto = new SocialBoardDTO(title, content, writer, photo, gender, age);

			// 글 작성
			service.insertSocialBoard(dto);

			// 작성된 글 번호
			int social_seq = service.getSocialBoardcurrval();

			Pattern p = Pattern.compile("\\#([0-9a-zA-Z가-힣ㄱ-ㅎㅏ-ㅣ]*)");
			Matcher m = p.matcher(content);

			while(m.find()) {
				SocialHashTagDTO shtdto = new SocialHashTagDTO(social_seq,writer,m.group(1));
				int result = this.shtService.insertHashTag(shtdto);
			}

			// 태그 정보
			String taginfo = request.getParameter("taginfo");

			if(!taginfo.equals("{}")) {
				ObjectMapper om = new ObjectMapper();
				om.configure(DeserializationFeature.ACCEPT_SINGLE_VALUE_AS_ARRAY, true);
				SocialTag[] myObjects = om.readValue(taginfo, SocialTag[].class);

				for(int i = 0; i < myObjects.length; i++) {
					String tag_name = myObjects[i].getName();
					String tag_brand = myObjects[i].getBrand();
					String tag_store = myObjects[i].getStore();
					String tag_url = myObjects[i].getUrl();
					String tag_lat = myObjects[i].getCoords().getLat();
					String tag_along = myObjects[i].getCoords().getAlong();
					String tag_category = myObjects[i].getCategory();


					if(!tag_url.startsWith("http://")) {
						myObjects[i].setUrl("http://"+myObjects[i].getUrl());
						tag_url = myObjects[i].getUrl();
					}

					SocialTagDTO stdto = new SocialTagDTO(social_seq,tag_name,tag_brand,tag_store,tag_url,tag_lat,tag_along,tag_category);
					tagService.insertSocialTag(stdto);
				}
			}
			mav.setViewName("redirect:main.go");
		}catch(NotLoginException nl) {
			mav.setViewName("redirect:login.jsp");
		}

		return mav;
	}

	@Transactional
	@RequestMapping("/modifySocial.go")
	public ModelAndView modifySocial(HttpServletRequest request) throws IOException {
		ModelAndView mav = new ModelAndView();
		MemberDTO mdto;
		int social_seq = Integer.parseInt(request.getParameter("seq"));

		try {
			// 로그인 되어 있는지 판단
			if(request.getSession().getAttribute("user") == null) {
				throw new LoginException();
			}

			ObjectMapper om = new ObjectMapper();
			mav.addObject("seq",social_seq);

			SocialBoardDTO sbdto = service.selectSocialBoard(social_seq);

			mdto = (MemberDTO)request.getSession().getAttribute("user");

			// 로그인한 사용자와 글 작성자가 같은지 판단 해야함...
			if(!(mdto.getSeq() == sbdto.getSocial_writer())) {
				throw new NotWriterException();
			}

			int i = 0;
			long dummy = System.currentTimeMillis();

			mav.addObject("sbdto",sbdto);

			List<SocialTagDTO> list = tagService.showSelectedTagList(social_seq);

			ObjectNode infoNode = om.createObjectNode();
			// 각 태그
			ObjectNode objNodeNumber = om.createObjectNode();

			if(list.size() == 0) {
				mav.addObject("markerdata", "{}");
				mav.addObject("dataflag","false");
			}else {
				for(SocialTagDTO tag : list) {
					// tag 하나당 넣어야 하는 객체
					ObjectNode objNode = om.createObjectNode();
					// 좌표를 넣을 객체
					ObjectNode objNodeCoords = om.createObjectNode();
					objNode.put("name", tag.getTag_name());

					objNode.put("brand", tag.getTag_brand());
					objNode.put("store", tag.getTag_store());
					objNode.put("url", tag.getTag_store());
					objNode.put("category", tag.getTag_category());
					objNode.put("key", tag.getTag_seq());

					// 좌표
					objNodeCoords.put("lat", Double.parseDouble(tag.getTag_lat()));
					objNodeCoords.put("along", Double.parseDouble(tag.getTag_along()));

					objNode.put("coords", objNodeCoords);

					objNodeNumber.put(i++ +"", objNode);
				}

				// canvas 객체 추가
				ObjectNode canvas = om.createObjectNode();
				canvas.put("src", "upload/social/"+sbdto.getPhoto());
				canvas.put("width", 500);
				canvas.put("height", 500);

				objNodeNumber.put("canvas", canvas);
				infoNode.put("image_db", objNodeNumber);

				String json = "";
				try {
					json = om.writeValueAsString(infoNode);
				} catch (JsonProcessingException e) {
					e.printStackTrace();
				}

				mav.addObject("list",list);
				mav.addObject("markerdata", json);
				mav.addObject("dataflag","true");
			}

			mav.addObject("dummy", dummy);
			mav.setViewName("modifySocial.jsp");

		}catch(Exception e) {
			mav.setViewName("redirect:readSocial.go?seq="+social_seq);
		}
		return mav;
	}

	@Transactional
	@RequestMapping("/modifySocialProc.go")
	public ModelAndView modifySocialProc(HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		MemberDTO mdto;
		int social_seq = Integer.parseInt(request.getParameter("seq"));

		try {
			if(request.getSession().getAttribute("user") == null) {
				throw new NotLoginException();
			}

			mdto = (MemberDTO)request.getSession().getAttribute("user");

			String title = request.getParameter("stylename");
			String content = request.getParameter("stylecontent");
			int writer = mdto.getSeq();
			String gender = request.getParameter("gender");
			int age = Integer.parseInt(request.getParameter("age"));
			String photo = request.getParameter("imageinfo");
			SocialBoardDTO dto = new SocialBoardDTO(social_seq,title,content,0,photo,gender,age);

			// 새로 들어온 해시태그 리스트
			Pattern p = Pattern.compile("\\#([0-9a-zA-Z가-힣ㄱ-ㅎㅏ-ㅣ]*)");
			Matcher m = p.matcher(content);

			List<SocialHashTagDTO> nList = new ArrayList<SocialHashTagDTO>();
			while(m.find()) {
				SocialHashTagDTO nidto = new SocialHashTagDTO(social_seq,writer,m.group(1));
				nList.add(nidto);
			}

			//			List<SocialHashTagDTO> deleteList = new ArrayList<>();
			// 새로 들어온 해시태그 뽑아오기
			//			for(int i = 0; i < oList.size(); i++) {
			//				for(int j = 0; j < nList.size(); j++) {
			//					if(oList.get(i).getSocial_hash_tag_contents().equals(nList.get(j).getSocial_hash_tag_contents())) {
			//						nList.remove(nList.get(j));
			//						deleteList.add(oList.get(i));
			//					}
			//				}
			//			}
			//			
			if(nList.size() > 0) {
				int deleteResult = this.shtService.deleteSocialHashTag(social_seq);

				for(SocialHashTagDTO ndto : nList) {
					int hashtagresult = this.shtService.insertHashTag(ndto);
				}
			}

			// 글 수정
			service.updateSocialBoard(dto);

			// 태그 정보
			String taginfo = request.getParameter("taginfo");
			//System.out.println(taginfo);

			if(!taginfo.equals("{}")) {
				ObjectMapper om = new ObjectMapper();
				om.configure(DeserializationFeature.ACCEPT_SINGLE_VALUE_AS_ARRAY, true);
				SocialTag[] myObjects = om.readValue(taginfo, SocialTag[].class);

				for(int i = 0; i < myObjects.length; i++) {
					String tag_name = myObjects[i].getName();
					String tag_brand = myObjects[i].getBrand();
					String tag_store = myObjects[i].getStore();
					String tag_url = myObjects[i].getUrl();
					String tag_lat = myObjects[i].getCoords().getLat();
					String tag_along = myObjects[i].getCoords().getAlong();
					String tag_category = myObjects[i].getCategory();
					String tag_key = myObjects[i].getKey();

					if(tag_store == null) {
						tag_store = "";
					}

					if(tag_category == null) {
						tag_category = "";
					}

					if(tag_url == null) {
						tag_url = "";
					}

					if(!tag_url.startsWith("http://")) {
						myObjects[i].setUrl("http://"+myObjects[i].getUrl());
						tag_url = myObjects[i].getUrl();
					}

					SocialTagDTO stdto;
					if(myObjects[i].getKey().equals("un")) {
						stdto = new SocialTagDTO(social_seq,tag_name,tag_brand,tag_store,tag_url,tag_lat,tag_along,tag_category);
						tagService.insertSocialTag(stdto);
						myObjects[i].setKey(tagService.getSocialTagcurrval()+"");
					}else {
						stdto = new SocialTagDTO(Integer.parseInt(tag_key),social_seq,tag_name,tag_brand,tag_store,tag_url,tag_lat,tag_along,tag_category);
						tagService.updateSocialTag(stdto);
					}
				}

				List<SocialTagDTO> tagList = tagService.showSelectedTagList(social_seq);

				for(int i = 0; i < myObjects.length; i++) {
					for(int j = 0; j < tagList.size(); j++) {
						if(tagList.get(j).getTag_seq() == Integer.parseInt(myObjects[i].getKey())) {
							tagList.remove(tagList.get(j));
						}
					}
				}

				for(SocialTagDTO tagdto : tagList) {
					tagService.deleteSocialTag(tagdto.getTag_seq());
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}

		mav.setViewName("redirect:readSocial.go?seq="+social_seq);
		return mav;
	}

	@RequestMapping("/deleteSocial.go")
	public ModelAndView deleteSocial(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		int seq = Integer.parseInt(request.getParameter("seq"));

		try {
			int writer = service.selectSocialWriter(seq);
			if(request.getSession().getAttribute("user") == null) {
				throw new NotLoginException();
			}

			if(writer == ((MemberDTO)request.getSession().getAttribute("user")).getSeq()) {
				service.deleteSocialBoard(seq);
				System.out.println("삭제 성공!!");
			}
			mav.setViewName("redirect:main.go");
		}catch(Exception e) {
			e.printStackTrace();
			mav.setViewName("redirect:readSocial.go?seq="+seq);
		}
		return mav;
	}

	@RequestMapping("/procSocialComment.go")
	public void procSocialComment(HttpServletRequest request, HttpServletResponse response) {
		int social_seq = Integer.parseInt(request.getParameter("seq"));

		try {
			int writer = ((MemberDTO)request.getSession().getAttribute("user")).getSeq();
			String comment = request.getParameter("comment");
			SocialCommentDTO scdto = new SocialCommentDTO(social_seq, writer, comment);
			int result = this.comService.insertSocialComment(scdto);

			List<SocialCommentDTO> commentList = comService.showCommentList(social_seq);
			ObjectMapper om = new ObjectMapper();

			ArrayNode array = om.createArrayNode();


			for(SocialCommentDTO dto : commentList) {
				ObjectNode on = om.createObjectNode();
				on.put("social_comment_seq", dto.getSocial_comment_seq());
				on.put("social_seq",dto.getSocial_seq());
				on.put("user_seq", dto.getUser_seq());
				on.put("social_comment_contents", dto.getSocial_comment_contents());
				on.put("social_comment_time", dto.getSocial_comment_time());
				on.put("name", dto.getName());
				on.put("photo", dto.getPhoto());
				on.put("writer", writer);

				array.add(on);
			}

			response.getWriter().println(array);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	@RequestMapping("/deleteComment.go")
	public void deleteComment(HttpServletRequest request, HttpServletResponse response) {
		try {
			ObjectMapper om = new ObjectMapper();
			int comment_seq = Integer.parseInt(request.getParameter("comment_seq"));
			int social_seq = Integer.parseInt(request.getParameter("social_seq"));
			int result = this.comService.deleteComment(comment_seq);
			int writer = ((MemberDTO)request.getSession().getAttribute("user")).getSeq();

			List<SocialCommentDTO> commentList = this.comService.showCommentList(social_seq);
			ArrayNode array = om.createArrayNode();

			for(SocialCommentDTO dto : commentList) {
				ObjectNode on = om.createObjectNode();
				on.put("social_comment_seq", dto.getSocial_comment_seq());
				on.put("social_seq",dto.getSocial_seq());
				on.put("user_seq", dto.getUser_seq());
				on.put("social_comment_contents", dto.getSocial_comment_contents());
				on.put("social_comment_time", dto.getSocial_comment_time());
				on.put("name", dto.getName());
				on.put("photo", dto.getPhoto());
				on.put("writer", writer);

				array.add(on);
			}

			response.getWriter().println(array);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	@RequestMapping("/test.go")
	public ModelAndView test(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		String contents = request.getParameter("contents");

		Pattern p = Pattern.compile("\\#([0-9a-zA-Z가-힣ㄱ-ㅎㅏ-ㅣ]*)");
		Matcher m = p.matcher(contents);

		//		while(m.find()) {
		//			System.out.println(m.group(1));
		//		}

		contents = contents.replaceAll("(\\#([0-9a-zA-Z가-힣ㄱ-ㅎㅏ-ㅣ]*))", "<a href='test2.go?word="+"$2'>"+"$1"+"</a>");

		request.setAttribute("contents", contents);
		mav.setViewName("Test.jsp");
		return mav;
	}

	@RequestMapping("searchTag.go")
	public ModelAndView searchTag(HttpSession session, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		int user_seq = 0;
		try {
			user_seq = ((MemberDTO)session.getAttribute("user")).getSeq();
		}catch(Exception e) {
			mav.setViewName("login.go");
			return mav;
		}
		
		String search = null;
		String main = null;
		String gender = null;
		String age = null;
		
		String pGender = null;
		int pAge = 0;
		try {
			search = request.getParameter("search") == null ? "" : request.getParameter("search");
		}catch(Exception notWord) {
			search = "";
			mav.setViewName("searchTag.jsp");
		}
		
		try {
			gender =	request.getParameter("gender");		 
			pGender = request.getParameter("gender");
			if(pGender.equals("")) {
				pGender=null;
			}
			if(gender.equals("f")) {
				gender = "여성";
			}else if(gender.equals("m")) {
				gender =" 남성";
			}else {
				gender ="무관";
			}
		}catch(Exception e2) {
			gender ="무관";			
		}
		
		try {
			pAge =Integer.parseInt(request.getParameter("age"));
			age = request.getParameter("age");
			if(pAge==0) {
				pAge=0;
			}
			if(age.equals("10")) {
				age="10대";
			}else if(age.equals("20")) {
				age="20대";
			}else if(age.equals("30")) {
				age="30대";
			}else if(age.equals("40")) {
				age="40대";
			}else {
				age="모든연령";
			}

		}catch(Exception e3) {
			age="모든연령";
		}
		
		try {
			main = request.getParameter("main");
			if(main.equals("full")) {
				mav.setViewName("searchTag.jsp");
			}else if(main.equals("thumbnail")) {
				mav.setViewName("searchTag2.jsp");
			}else {
				mav.setViewName("searchTag.jsp");
			}
		}catch(Exception e4) {
			mav.setViewName("searchTag.jsp");
		}
		
		List<SocialBoardDTO> result = null;
		String feed = null;
		try {
			feed = request.getParameter("feed");
			
			if(feed.equals("new")) {
				result = this.service.showHashTagBoardList(pAge, pGender, user_seq, search);
			}else if(feed.equals("hot")) {
				result = this.service.showHashTagHotBoardList(pAge, pGender, user_seq, search);
			}else if(feed.equals("following")) {
				result = this.service.showHashTagFollowBoardList(pAge, pGender, user_seq, search);
			}
		}catch(Exception ea) {
			result = this.service.showHashTagBoardList(pAge, pGender, user_seq, search);
			feed="new";
		}
		
		List<Integer> ggdto = new ArrayList<>();
		List<MemberDTO> mdto = new ArrayList<>();
		
		for(SocialBoardDTO sdd : result) {	
			GoodDTO gdto = new GoodDTO(sdd.getSocial_seq());
			MemberDTO mom =  new MemberDTO(sdd.getSocial_seq()); 
			ggdto.add(this.service.allGoodCount(gdto)) ;
			mdto.addAll( this.mService.getUserData(mom));
			/*System.out.println(ggdto);*/
		}
		
		List<Integer> goodCount = new ArrayList<>();
		for(SocialBoardDTO sdd : result) {
			GoodDTO gdto = new GoodDTO(sdd.getSocial_seq(),user_seq);
			goodCount.add(this.service.selectGoodCount(gdto));
			/*System.out.println("goodCount"+goodCount);*/
		}

		try {
			/*System.out.println(((MemberDTO)session.getAttribute("user")).getSeq());*/
			List<CollectionDTO> collectionList = this.service.getCollectionList((MemberDTO)session.getAttribute("user"));
			List<SocialBoardDTO> photoList = this.service.getCollectionPhotoList((MemberDTO)session.getAttribute("user"));
			List<SocialBoardDTO> goodList = this.service.getMyGoodSocialList((MemberDTO)session.getAttribute("user"));
			List<MemberDTO> followingList = this.mService.getFollowingList((MemberDTO)session.getAttribute("user"));
			
			
			mav.addObject("collectionList",collectionList);
			mav.addObject("photoList",photoList);
			mav.addObject("goodList", goodList);
			mav.addObject("followingList", followingList);
			
		}catch(NullPointerException e) {
			/*		System.out.println("濡쒓렇�씤x");*/
		}finally {
			
			mav.addObject("search", search);
			mav.addObject("feed",feed);
			mav.addObject("goodCount",goodCount);
			mav.addObject("heart",ggdto);
			mav.addObject("pAge",pAge);
			mav.addObject("main", main);
			mav.addObject("pGender",pGender);
			mav.addObject("gender",gender);		
			mav.addObject("age",age);
			mav.addObject("socialList",result);
		}
		return mav;
	}

	private List<SocialBoardDTO> makeHashTag(List<SocialBoardDTO> list) {
		for(SocialBoardDTO dto: list) {
			String contents = dto.getSocial_contents();
			
			Pattern p = Pattern.compile("\\#([0-9a-zA-Z가-힣ㄱ-ㅎㅏ-ㅣ]*)");

			contents = contents.replaceAll("(\\#([0-9a-zA-Z가-힣ㄱ-ㅎㅏ-ㅣ]*))", "<a href='searchTag.go?word="+"$2'>"+"$1"+"</a>");
			System.out.println("여기-------------------!!!!!!!!!!!!!!!!!"+contents);
			dto.setSocial_contents(contents);
		}
		return list;
	}

	
}
