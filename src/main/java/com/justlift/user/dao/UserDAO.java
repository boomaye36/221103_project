package com.justlift.user.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.justlift.user.model.User;
@Repository
public interface UserDAO {
	public int existingLoginId(String userId);
	
	public void insertUser(@Param("userId") String userId, @Param("userPw") String userPw, @Param("name") String name,@Param("email") String email, @Param("phoneNumber") String phoneNumber);

	public User selectUserByUserIdandPassword(
			@Param ("loginId")String loginId,
			@Param ("password") String password);
	
	public int selectDdayFromUser(@Param("userId") int userId);

}
