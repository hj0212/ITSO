package kh.spring.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.dto.CollectionDTO;
import kh.spring.dto.GoodDTO;
import kh.spring.dto.MemberDTO;
import kh.spring.dto.SearchedTipDTO;
import kh.spring.dto.SearchedUserInfoDTO;
import kh.spring.dto.SocialBoardDTO;
import kh.spring.exception.NotLoginException;
import kh.spring.interfaces.IMemberService;
import kh.spring.interfaces.ISocialBoardService;
import kh.spring.interfaces.ITipService;

@Controller
public class SearchController {
	@Autowired
	private IMemberService service;
	
	@Autowired
	private ITipService tipService;
	
	@Autowired
	private ISocialBoardService socialService;
	
	@Autowired
	private IMemberService mService;
	
	@RequestMapping("/searchWord.se")
	public ModelAndView searchWord(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		MemberDTO writer = ((MemberDTO)request.getSession().getAttribute("user"));
		
		try {
			if(writer == null) {
				throw new NotLoginException();
			}
			
			String word = request.getParameter("word");
			
			List<SearchedUserInfoDTO> userList = null;
			List<SearchedTipDTO> tipList = null;
			List<SocialBoardDTO> result = null;
			List<CollectionDTO> searchedCollectionList = null;
			List<SocialBoardDTO> searchedPhotoList = null;
			
			List<SocialBoardDTO> brandList = null; 
			
			List<Integer> ggdto = new ArrayList<>();
			List<MemberDTO> mdto = new ArrayList<>();
			
			List<Integer> ggdto2 = new ArrayList<>();
			List<MemberDTO> mdto2 = new ArrayList<>();
			
			if(!word.trim().equals("")) {
				userList = this.service.getSearchedUserList(word);
				tipList = this.tipService.getSearchedTipList(word);
				result = this.socialService.getsearchedTagSocialList(word);
				brandList = this.socialService.getSearchedBrandList(word);
				
				searchedCollectionList = this.socialService.getSearchedCollectionList(word);
				searchedPhotoList = this.socialService.getSearchedCollectionPhotoList(word);
				
				for(SocialBoardDTO sdd : result) {	
					GoodDTO gdto = new GoodDTO(sdd.getSocial_seq());
					MemberDTO mom =  new MemberDTO(sdd.getSocial_seq()); 
					ggdto.add(this.socialService.allGoodCount(gdto)) ;
					mdto.addAll( this.mService.getUserData(mom));
					/*System.out.println(ggdto);*/
				}
				
				for(SocialBoardDTO sdd2 : brandList) {
					GoodDTO gdto2 = new GoodDTO(sdd2.getSocial_seq());
					MemberDTO mom2 = new MemberDTO(sdd2.getSocial_seq());
					ggdto2.add(this.socialService.allGoodCount(gdto2));
					mdto2.addAll(this.mService.getUserData(mom2));
				}
				
				List<Integer> goodCount = new ArrayList<>();
				for(SocialBoardDTO sdd : result) {
					GoodDTO gdto = new GoodDTO(sdd.getSocial_seq(),writer.getSeq());
					goodCount.add(this.socialService.selectGoodCount(gdto));
					/*System.out.println("goodCount"+goodCount);*/
				}
				
				List<Integer> goodCount2 = new ArrayList<>();
				for(SocialBoardDTO sdd2 : brandList) {
					GoodDTO gdto2 = new GoodDTO(sdd2.getSocial_seq(), writer.getSeq());
					goodCount.add(this.socialService.selectGoodCount(gdto2));
				}
				
				List<CollectionDTO> collectionList = this.socialService.getCollectionList((MemberDTO)request.getSession().getAttribute("user"));
				List<SocialBoardDTO> photoList = this.socialService.getCollectionPhotoList((MemberDTO)request.getSession().getAttribute("user"));
				List<SocialBoardDTO> goodList = this.socialService.getMyGoodSocialList((MemberDTO)request.getSession().getAttribute("user"));
				List<MemberDTO> followingList = this.mService.getFollowingList((MemberDTO)request.getSession().getAttribute("user"));
				
				mav.addObject("searchedCollectionList", searchedCollectionList);
				mav.addObject("searchedPhotoList", searchedPhotoList);
				mav.addObject("collectionList", collectionList);
				mav.addObject("photoList",photoList);
				mav.addObject("goodList", goodList);
				mav.addObject("followingList", followingList);
				
				mav.addObject("goodCount",goodCount);
				mav.addObject("heart",ggdto);
				
				mav.addObject("goodCount2", goodCount2);
				mav.addObject("heart2", ggdto2);
				
				mav.addObject("userList", userList);
				mav.addObject("tipList", tipList);
				mav.setViewName("searchResults.jsp");
				
				mav.addObject("socialList",result);
				mav.addObject("brandList", brandList);
				
			}
		}catch(NotLoginException e) {
			mav.setViewName("login.go");
		}
		return mav;
	}
}
