package com.justlift.like.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.justlift.like.dao.LikeDAO;

@Service
public class LikeBO {
	
	@Autowired
	private LikeDAO likeDAO;
	public void likeToggle(int workoutId, int userId, String type) {
		
		if (getLikeCountByWorkoutIdOrUserId(workoutId, userId, type) > 0) {
			likeDAO.deleteLikeByWorkoutIdUserId(workoutId, userId, type);
		} else {
			likeDAO.insertLike(workoutId, userId, type);
		}
	}
	
	public int getLikeCountByWorkoutIdOrUserId(int workoutId, Integer userId,String type) {
		return likeDAO.selectLikeCountByWorkoutIdOrUserId(workoutId, userId, type );
	}
	
	public boolean existLike(int workoutId, int userId, String type) {
		return likeDAO.existLike(workoutId, userId, type);
	}
	public void deleteLikeByWorkoutId(int workoutId, String type) {
		likeDAO.deleteLikeByWorkoutId(workoutId, type);
	}
	
}
