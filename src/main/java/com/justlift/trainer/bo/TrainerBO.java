package com.justlift.trainer.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.justlift.trainer.dao.TrainerDAO;
import com.justlift.trainer.model.Trainer;

@Service
public class TrainerBO {
	@Autowired
	private TrainerDAO trainerDAO;
	public List<Trainer> getTrainerListByAreaAndCategoryId(String area, int categoryId){
		return trainerDAO.selectTrainerListByAreaAndCategoryId(area, categoryId);
	}
	
	public List<Trainer> getTrainerDetailListByTrainerId(int trainerId){
		return trainerDAO.selectTrainerDetailListByTrainerId(trainerId);
	}

	public List<Trainer> getTrainerListByGymId(int gymId) {
		return trainerDAO.selectTrainerListByGymId(gymId);
	}

	public List<Trainer> getTrainerLikeListByUserIdAndType(int userId, String type) {
		return trainerDAO.selectTrainerLikeListByUserIdAndType(userId, type);
	}
}
