package com.dw.web.dao.homePage;

import java.util.List;
import java.util.Map;

public interface HomeDao {

	List<Map<String, Object>> queryDefaultSize(Map<String, Object> params);
	
	Map<String, Object> queryTotalStatus(Map<String, Object> params);
	
	void kpiAnalysis(Map<String, Object> params);
	
	List<Map<String, Object>> querySaleTop(Map<String, Object> params);
}
