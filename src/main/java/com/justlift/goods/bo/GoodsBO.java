package com.justlift.goods.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.justlift.goods.dao.GoodsDAO;
import com.justlift.goods.model.Buy;
import com.justlift.goods.model.BuyView;
import com.justlift.goods.model.Cart;
import com.justlift.goods.model.CartView;
import com.justlift.goods.model.Goods;
import com.justlift.goods.model.GoodsView;
import com.justlift.goods.model.Stock;

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
	public void putBuyByIdAndCount(int goodsId, Integer userId, int quantity) {
		if (goodsDAO.ExistBuyGoodsByUserId(goodsId, userId) == true) {
			Buy counting = goodsDAO.selectBuyByUserIdAndGoodsId(userId, goodsId);
			quantity = counting.getCount();
			quantity+=quantity;
		}
		goodsDAO.InsertBuyByIdAndCount(goodsId, userId, quantity);
	}
	public List<Goods> getGoodsListByUserId(int userId){
		
		return goodsDAO.selectGoodsListByUserId(userId);
	}
	public List<Buy> getBuyListByUserId(int userId){
		
		return goodsDAO.selectBuyListByUserId(userId);
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
	public List<BuyView> getBuyViewList(int userId){
		List<BuyView> buyViewList = new ArrayList<>();

		List<Buy> buyList = goodsDAO.selectBuyListByUserId(userId);
		for (Buy buy : buyList) {
			BuyView buyview = new BuyView();
			buyview.setBuy(buy);
			Goods goods = goodsDAO.getGoodsById(buy.getGoodsId());
			buyview.setGoods(goods);
			buyViewList.add(buyview);

		}
		return buyViewList;
		
	}
	public void updateCartByCountAndId(int count, int id) {
		goodsDAO.updateCartByCountAndId(count, id);
	}
	
	public int getAmountPriceByUserId(int userId, double percent) {
		return goodsDAO.selectAmountPriceByUserId(userId, percent);
	}
	public Integer getAmountBuyPriceByUserId(int userId) {
		return goodsDAO.selectAmountBuyPriceByUserId(userId);
	}

	public void deleteBuyByUserIdAndId(int userId, int id) {
		goodsDAO.deleteBuyByUserIdAndId(userId, id);
	}
	
//	public List<Stock> getStockListByGoodsId(int goodsId){
//		return goodsDAO.selectStockListByGoodsId(goodsId);
//	}
	
	public List<GoodsView> getGoodsView(String category){
		 List<GoodsView> goodsViewList = new ArrayList<>();
		 List <Goods> goodsList = goodsDAO.selectGoodsList(category);
		 for (Goods goods : goodsList) {
			 GoodsView goodsView = new GoodsView();
			 goodsView.setGoods(goods);
			 Stock stock = goodsDAO.selectStockListByGoodsId(goods.getId());
			 goodsView.setStock(stock);
			 goodsViewList.add(goodsView);
		 }
		return goodsViewList;
	
	}
	
	public void UpdateStockCountByGoodsId(int goodsId, int quantity){
		 goodsDAO.UpdateStockCountByGoodsId(goodsId, quantity);
	}
	
	public boolean getGoodsByGoodsID(int goodsId) {
		return goodsDAO.getGoodsByGoodsID(goodsId);
	}
	
	public Stock getStockByGoodsId(int goodsId) {
		return goodsDAO.getStockByGoodsId(goodsId);
	}
	public void UpdateStockReturnByGoodsIdAndUserId(int goodsId, int count) {
		goodsDAO.UpdateStockReturnByGoodsIdAndUserId(goodsId, count);
	}
	
}
