package com.dw.web.dao.record;

import java.util.Map;

import com.dw.web.dao.commManager.PageMapper;
import com.dw.web.model.ProStockInfo;

public interface ProStockInfoDao extends PageMapper {
	// 物理删除
	Integer deleteOne(Map<String, Object> params);

	// 根据流水号查询
	ProStockInfo queryByFlowId(String flowId);

	// 添加
	Integer addOne(Map<String, Object> params);

	// 修改
	Integer updOne(Map<String, Object> params);
	
	// 更新订单数据
	void updOrderData(String flowId);
}
