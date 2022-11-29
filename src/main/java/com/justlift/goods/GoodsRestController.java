package com.justlift.goods;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.justlift.goods.bo.GoodsBO;

@RestController
@RequestMapping("/goods")
public class GoodsRestController {
	@Autowired
	private GoodsBO goodsBO;
	@RequestMapping("/cart_insert")
	public Map<String, Object> InsertCart(@RequestParam("goodsId") int goodsId, HttpSession session){
		Integer userId = (Integer)session.getAttribute("userId");
		int count = 1;
		//int newCount = 1;
		goodsBO.putCartById(goodsId, userId, count);
		Map<String, Object> result = new HashMap<>();
		result.put("code", 100);

		return result;
	}
	@RequestMapping("/delete")
	public Map<String, Object> deleteCart(@RequestParam("goodsId") int goodsId){
		goodsBO.deleteCart(goodsId);
		Map<String, Object>result = new HashMap<>();
		result.put("code", 100);
		return result;
	}
}
