package com.justlift.user.bo;

import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import java.util.ArrayList;
import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.ObjectUtils;

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
		
//		String a = null;
//		if(StringUtils.) {
//			
//		}
//		if (CollectionUtils.isEmpty(null))
//	}
	}
	@Test
	void 테스트() {
		String a = "";
		String b = null;
		List<Integer> list = null;
		List<Integer> list1 = new ArrayList<>();
		
		if (ObjectUtils.isEmpty(list1)) {
			log.info("### b is empty");
		}
	}
}
