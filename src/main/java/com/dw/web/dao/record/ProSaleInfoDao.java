package com.dw.web.dao.record;

import java.util.List;
import java.util.Map;

import com.dw.web.dao.commManager.PageMapper;
import com.dw.web.model.ProSaleInfo;

public interface ProSaleInfoDao extends PageMapper {

	// 根据id查询
	ProSaleInfo queryById(Map<String, Object> params);
	ProSaleInfo queryByName(Map<String, Object> params);

	// 修改某一字段值
	Integer updSaleInfoValue(Map<String, Object> params);

	// 添加
	Integer addOne(Map<String, Object> params);

	// 修改
	Integer updOne(Map<String, Object> params);

	// 物理删除
	Integer deleteOne(Map<String, Object> params);

	// 导出查询
	List<Map<String, Object>> query4Export(Map<String, Object> params);
	
	// 更新销售数据
	void updSaleInfoData();
}
