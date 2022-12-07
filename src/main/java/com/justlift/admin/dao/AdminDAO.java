package com.justlift.admin.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository

public interface AdminDAO {
	public int insertGym(
			@Param("name") String name,
			@Param("categoryId") int categoryId,
			@Param("location") String location,
			@Param("phoneNumber") String phoneNumber,
			@Param("introduce") String introduce,
			@Param("rank") double rank,
			@Param("imagePath") String imagePath
			);

	public int insertTrainer(
			@Param("name")String name, 
			@Param("gymId")int gymId, 
			@Param("phoneNumber")String phoneNumber,
			@Param("introduce")String introduce, 
			@Param("rank")double rank,
			@Param("imagePath")String imagePath);

	public int insertGoods(@Param("name") String name, @Param("category") String category, @Param("price") int price,@Param("imagePath") String imagePath);
	
	public void insertStock(@Param("goodsId")int goodsId, @Param("count") int count);

}
