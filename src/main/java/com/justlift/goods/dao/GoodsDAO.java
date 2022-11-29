package com.justlift.goods.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.justlift.goods.model.Cart;
import com.justlift.goods.model.Goods;

@Repository
public interface GoodsDAO {
	public List<Goods> selectGoodsList(@Param("category") String category);
	
	public void insertCartById(@Param("goodsId") int goodsId, @Param("userId") int userId, @Param("count") int count);
	
	public List<Goods> selectGoodsListByUserId(@Param("userId") int userId);

	public boolean ExistGoodsByUserId(@Param("goodsId") int goodsId, @Param("userId") int userId);

	public Cart selectCartByUserIdAndGoodsId(@Param("userId") int userId, @Param("goodsId") int goodsId);
	//public int selectGoodsCount
	public List<Cart> selectCartList(@Param("userId") int userId);
	
	public void deleteCart(@Param("goodsId") int goodsId);

	public Goods getGoodsById(@Param("id") int id);
	
	public void updateCartByCountAndId(@Param("count") int count, @Param("id") int id);

}
