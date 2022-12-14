package com.justlift.goods;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
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
	@PostMapping("/update")
	public Map<String, Object>updateCart(@RequestParam("count") int count,
			@RequestParam("id") int id){
		goodsBO.updateCartByCountAndId(count, id);
		Map<String, Object>result = new HashMap<>();
		result.put("code", 100);
		return result;
	}
	@RequestMapping("/buy_insert")
	public Map<String, Object> InsertBuy(@RequestParam("goodsId") int goodsId,@RequestParam("quantity") int quantity, HttpSession session){
		Integer userId = (Integer)session.getAttribute("userId");
		goodsBO.UpdateStockCountByGoodsId(goodsId, quantity);
		goodsBO.putBuyByIdAndCount(goodsId, userId, quantity);
		Map<String, Object> result = new HashMap<>();
		result.put("code", 100);

		return result;
	}
	@PostMapping("/buy_delete")
	public Map<String, Object>deleteBuy(@RequestParam("id") int id, HttpSession session){
		Integer userId = (Integer)session.getAttribute("userId");
		goodsBO.deleteBuyByUserIdAndId(userId, id);
		Map<String, Object> result = new HashMap<>();
		result.put("code", 100);

		return result;
	}
	@PostMapping("/buy_return")
	public Map<String, Object>returnBuy(@RequestParam("id") int id,@RequestParam("goodsId") int goodsId, @RequestParam("count") int count, HttpSession session){
		Integer userId = (Integer)session.getAttribute("userId");
		goodsBO.deleteBuyByUserIdAndId(userId, id);
		goodsBO.UpdateStockReturnByGoodsIdAndUserId(goodsId, count);
		Map<String, Object> result = new HashMap<>();
		result.put("code", 100);
		
		return result;
	}
//	@PostMapping("/price")
//	public Map<String, Object>updatePrice(@RequestParam("percent") double price, HttpSession session){
//		Integer userId = (Integer)session.getAttribute("userId");
//		
//	}
}
