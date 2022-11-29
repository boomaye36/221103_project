package com.justlift.goods.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.justlift.goods.dao.GoodsDAO;
import com.justlift.goods.model.Cart;
import com.justlift.goods.model.CartView;
import com.justlift.goods.model.Goods;

@Service
public class GoodsBO {
	@Autowired
	private GoodsDAO goodsDAO;
	public List<Goods> getGoodsList(String category){
		return goodsDAO.selectGoodsList(category);
	}
	public void putCartById(int goodsId, int userId, int count) {
		if (goodsDAO.ExistGoodsByUserId(goodsId, userId) == true) {
			Cart counting = goodsDAO.selectCartByUserIdAndGoodsId(userId, goodsId);
			count = counting.getCount();
			count++;
		}
		
		goodsDAO.insertCartById(goodsId, userId, count);
	}
	public List<Goods> getGoodsListByUserId(int userId){
		
		return goodsDAO.selectGoodsListByUserId(userId);
	}
	public void deleteCart(int goodsId) {
		
		goodsDAO.deleteCart(goodsId);
	}
	public List<Cart> getCartList(int userId){
		return goodsDAO.selectCartList(userId);
		
	}
	
	public List<CartView> getCartViewList(int userId){
		List<CartView> cartViewList = new ArrayList<>();
//		List<Goods> goodsList = goodsDAO.selectGoodsListByUserId(userId);
//		for (Goods goods : goodsList) {
//			CartView cart = new CartView();
//			cart.setGoods(goods);
//			cartViewList.add(cart);
//
//		}
		List<Cart> cartList = goodsDAO.selectCartList(userId);
		for (Cart cart : cartList) {
			CartView cartview = new CartView();
			cartview.setCart(cart);
			Goods goods = goodsDAO.getGoodsById(cart.getGoodsId());
			cartview.setGoods(goods);
			cartViewList.add(cartview);

		}
		return cartViewList;
		
	}
	
}
