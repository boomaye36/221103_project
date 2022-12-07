package com.justlift.trainer.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.justlift.trainer.model.Trainer;

@Repository
public interface TrainerDAO {
	public List<Trainer> selectTrainerListByAreaAndCategoryId(
			@Param("area") String area, @Param("categoryId") int categoryId);
	
	public List<Trainer> selectTrainerDetailListByTrainerId(@Param("trainerId")int trainerId);
	
	public List<Trainer> selectTrainerListByGymId(@Param("gymId") int gymId);
	
	public List<Trainer> selectTrainerLikeListByUserIdAndType(@Param("userId")int userId, @Param("type") String type);
	
	public Trainer getTrainerIdByTrainerId(@Param("trainerId") int trainerId);

	public List<Trainer> selectTrainerListByUserIdAndFromQna(@Param("userId") int userId);
	
	public List<Trainer> getTrainerList();


}
