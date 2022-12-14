package com.justlift.goods.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.justlift.goods.model.Buy;
import com.justlift.goods.model.Cart;
import com.justlift.goods.model.Goods;
import com.justlift.goods.model.Stock;

@Repository
public interface GoodsDAO {
	public List<Goods> selectGoodsList(@Param("category") String category);
	
	public void insertCartById(@Param("goodsId") int goodsId, @Param("userId") int userId, @Param("count") int count);
	
	public List<Goods> selectGoodsListByUserId(@Param("userId") int userId);
	public List<Buy> selectBuyListByUserId(@Param("userId") int userId);

	public boolean ExistGoodsByUserId(@Param("goodsId") int goodsId, @Param("userId") int userId);
	public boolean ExistBuyGoodsByUserId(@Param("goodsId") int goodsId, @Param("userId") int userId);

	public Cart selectCartByUserIdAndGoodsId(@Param("userId") int userId, @Param("goodsId") int goodsId);
	public Buy selectBuyByUserIdAndGoodsId(@Param("userId") int userId, @Param("goodsId") int goodsId);
	//public int selectGoodsCount
	public List<Cart> selectCartList(@Param("userId") int userId);
	
	public void deleteCart(@Param("goodsId") int goodsId);

	public Goods getGoodsById(@Param("id") int id);
	
	public void updateCartByCountAndId(@Param("count") int count, @Param("id") int id);
	
	public int selectAmountPriceByUserId(@Param("userId") int userId, @Param("percent") double percent);
	public Integer selectAmountBuyPriceByUserId(@Param("userId") int userId);

	public void InsertBuyByIdAndCount(@Param("goodsId") int goodsId, @Param("userId") int userId, @Param("quantity") int quantity);

	public void deleteBuyByUserIdAndId(@Param("userId") int userId, @Param("id") int id);
	
	public Stock selectStockListByGoodsId(@Param("goodsId") int goodsId);
	
	public void UpdateStockCountByGoodsId(@Param("goodsId") int goodsId, @Param("quantity") int quantity);
	
	public boolean getGoodsByGoodsID(@Param("goodsId") int goodsId);
	
	public Stock getStockByGoodsId(int goodsId);

	public void UpdateStockReturnByGoodsIdAndUserId(@Param("goodsId") int goodsId, @Param("count") int count);



}
