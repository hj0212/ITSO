

		contents = contents.replaceAll("(\\#([0-9a-zA-Z가-힣ㄱ-ㅎㅏ-ㅣ]*))", "<a href='searchTag.go?word="+"$2'>"+"$1"+"</a>");

	@RequestMapping("/test.go")
	public ModelAndView test(HttpServletRequest request) {
		String contents = request.getParameter("contents");

		Pattern p = Pattern.compile("\\#([0-9a-zA-Z가-힣ㄱ-ㅎㅏ-ㅣ]*)");
		Matcher m = p.matcher(contents);

		//		while(m.find()) {
		//			System.out.println(m.group(1));
		//		}

		contents = contents.replaceAll("(\\#([0-9a-zA-Z가-힣ㄱ-ㅎㅏ-ㅣ]*))", "<a href='test2.go?word="+"$2'>"+"$1"+"</a>");

		request.setAttribute("contents", contents);
		mav.setViewName("Test.jsp");

	@RequestMapping("searchTag.go")
	public ModelAndView searchTag(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		String word = request.getParameter("word");
		System.out.println(word);
		mav.setViewName("searchTag.jsp");
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

	