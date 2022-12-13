package com.justlift.gym.bo;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.justlift.gym.dao.GymDAO;
import com.justlift.gym.model.Category;
import com.justlift.gym.model.Gym;

@Service
public class GymBO {
	@Autowired
	private GymDAO gymDAO;
	private static final int POST_MAX_SIZE = 3;
	
	public List<Gym> getGymListByLocationAndCategory(int categoryId, String location, Integer prevId, Integer nextId){
		Integer standardId = null; // 기준이 되는 id(이전 또는 다음)
		String direction = null; // 방향
		if (prevId != null) {
			// 이전 클릭
			standardId = prevId;
			direction = "prev";
			List<Gym> gymList = gymDAO.selectGymListByLocationAndCategory(categoryId, location,standardId, direction, POST_MAX_SIZE);
			Collections.reverse(gymList);
			return gymList;
		}else if(nextId != null) {
			// 다음 클릭
			standardId = nextId;
			direction = "next";
		}
		// 첫페이지일 때는 standardId가 null, 다음일 때는 값이 있음
		return gymDAO.selectGymListByLocationAndCategory(categoryId, location, standardId, direction, POST_MAX_SIZE);
	}
	public boolean isLastPage(int nextId, int categoryId) { //next 방향의 끝인가?
		// nextId와 제일 작은 id가 같은가?
		int postId = gymDAO.selectPostIdByCategoryIdAndSort(categoryId, "ASC");
		return postId == nextId; // 같으면 마지막 페이지
	}
	public boolean isFirstPage(int prevId, int categoryId) {
		int postId = gymDAO.selectPostIdByCategoryIdAndSort(categoryId, "DESC");
		return postId == prevId;
	}
	public Category getCategoryNameByCategoryId(int categoryId) {
		return gymDAO.selectCategoryNameByCategoryId(categoryId);
	}
	public List<Gym> getGymListByLocationAndCategoryId(int categoryId, String location) {
		return gymDAO.selectGymListByLocationAndCategoryId(categoryId, location);
	}
	public Gym getGymDetailListByGymId(int gymId){
		return gymDAO.selectGymDetailListByGymId(gymId);
	}
	public List<Gym> getGymList(){
		return gymDAO.selectGymList();
	}
	
	public List<Gym> getGymListByUserId(int userId){
		return gymDAO.selectGymListByUserId(userId);
	}
	
	public List<Gym> getGymLikeListByUserIdAndType(Integer userId, String type) {
		return gymDAO.selectGymLikeListByUserIdAndType(userId, type);
	}
	public List<Gym> getGymListByUserIdAndFromQna(int userId){
		return gymDAO.selectGymListByUserIdAndFromQna(userId);
	}
	public List<Gym> getHotGymList(){
		return gymDAO.getHotGymList();
	}
	
	public List<Gym> getSearchList(String name, String switchstatus){
		return gymDAO.selectSearchList(name, switchstatus);
	}
	
	public int getSearchCount(String name, String switchstatus) {
		return gymDAO.selectSearchCount(name, switchstatus);
	}
}
