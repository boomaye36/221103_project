package com.justlift.goods;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.justlift.goods.bo.GoodsBO;
import com.justlift.goods.model.Cart;
import com.justlift.goods.model.CartView;
import com.justlift.goods.model.Goods;

@Controller
@RequestMapping("/goods")

public class GoodsController {
	@Autowired
	private GoodsBO goodsBO;
	@RequestMapping("/select_view")
	public String selectGoodsCategory(Model model) {
		model.addAttribute("viewName", "goods/goodsCategory");
		return "template/layout";
 
	}
	@GetMapping("/goods_List_view")
	public String goodsList(Model model,@RequestParam("category") String category ) {
		List<Goods> goodsList = goodsBO.getGoodsList(category);
		model.addAttribute("goodsList", goodsList);
		model.addAttribute("viewName", "goods/goodsList");
		return "template/layout";

	}
	@GetMapping("/cart_view")
	public String myCartList(Model model, HttpSession session, @RequestParam("percent") double percent) {
		Integer userId = (Integer)session.getAttribute("userId");
		List<Goods> goodsList = goodsBO.getGoodsListByUserId(userId);
		//int goodsCount = 
		model.addAttribute("goodsList", goodsList);
		model.addAttribute("viewName", "goods/cart");
		List<Cart> cartList = goodsBO.getCartList(userId);
		model.addAttribute("cartList", cartList);
		List<CartView> cartViewList = goodsBO.getCartViewList(userId);
		model.addAttribute("cartViewList", cartViewList);
		int amountPrice = goodsBO.getAmountPriceByUserId(userId, percent);
		model.addAttribute("amountPrice", amountPrice);
		
		return "template/layout";
	}
}
