package com.justlift.user.bo;

import static org.junit.jupiter.api.Assertions.assertNotNull;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

import com.justlift.user.model.User;
@SpringBootTest
class UserBOTest {

	@Autowired
	UserBO userBO;
	
	@Transactional
	//@Test
	void 유저추가테스트() {
		userBO.addUser("test222", "password22", "송현근1", "이메일2", "폰넘버2");
	}
	@Test
	void 유저가져오기() {
		User user  = userBO.getUserByUserIdandPassword("12", "a");
		assertNotNull(user);
		
		String a = null;
		if(StringUtils.) {
			
		}
		if (CollectionUtils.isEmpty(null))
	}
}
