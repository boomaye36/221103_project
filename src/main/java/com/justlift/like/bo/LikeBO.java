package com.justlift.like.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.justlift.gym.bo.GymBO;
import com.justlift.like.dao.LikeDAO;
import com.justlift.like.model.Like;

@Service
public class LikeBO {
	@Autowired
	private GymBO gymBO;
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
	
	//public Like getisLikeFromUserIdAndId(int userId, int )
	public Like getLikeIdFromUserId(int userId) {
		return likeDAO.selectLikeIdFromUserId(userId);
	}
	public boolean getHeart(Integer userId, Integer gymId) {
		//Like like = new Like();
//		if (userId == null) {
//				like.setFilledLike(false);
//			} else {
//				like.setFilledLike(true);
//			}
			
		return likeDAO.selectHeart(userId, gymId);
	
		
	}
	public boolean getTrainerHeart(Integer userId, Integer trainerId) {
		return likeDAO.selectTrainerHeart(userId, trainerId);
	}
}
