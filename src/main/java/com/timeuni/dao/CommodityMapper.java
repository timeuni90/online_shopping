package com.timeuni.dao;

import com.timeuni.bean.Commodity;
import com.timeuni.bean.CommodityExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CommodityMapper {
	long countByExample(CommodityExample example);

	int deleteByExample(CommodityExample example);

	int deleteByPrimaryKey(Integer id);

	int insert(Commodity record);

	int insertSelective(Commodity record);

	List<Commodity> selectByExampleWithBLOBs(CommodityExample example);

	List<Commodity> selectByExample(CommodityExample example);

	Commodity selectByPrimaryKey(Integer id);

	int updateByExampleSelective(@Param("record") Commodity record, @Param("example") CommodityExample example);

	int updateByExampleWithBLOBs(@Param("record") Commodity record, @Param("example") CommodityExample example);

	int updateByExample(@Param("record") Commodity record, @Param("example") CommodityExample example);

	int updateByPrimaryKeySelective(Commodity record);

	int updateByPrimaryKeyWithBLOBs(Commodity record);

	int updateByPrimaryKey(Commodity record);

	/* 以下为新增方法 */

	/* 按照关键字查找商品 */
	public List<Commodity> selectByKey(@Param("key") String key, @Param("sortType") Integer sortType,
			@Param("commodityCoverImageLocation") String commodityCoverImageLocation);

	/* 按照id找商品 */
	public Commodity selectByCommodityIdFromMultiTable(@Param("commodityId") Integer commodityId,
			@Param("commodityCoverLoc") String commodityCoverLoc, @Param("storeLogoLoc") String storeLogoLoc);

	/* 查询商品月销量 */
	public Integer selectMonthSaleByCommodityId(Integer commodityId);

	/* 查询商品累计评价数量 */
	public Integer selectCountCommodityComment(Integer commodityId);

	/* 获取收藏量前10的商品 */
	public List<Commodity> selectRotCommodities(String coverLocation);

	/* 按一些列商品id获取商品 */
	public List<Commodity> selectByCommodityIds(@Param("commodityIds")List<Integer> commodityIds, @Param("sortType") Integer sortType,
			@Param("commodityCoverImageLocation") String commodityCoverImageLocation);
}