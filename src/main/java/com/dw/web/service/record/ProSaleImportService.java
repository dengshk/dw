package com.dw.web.service.record;

import java.io.InputStream;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.dw.web.dao.record.ProSaleImportDao;
import com.dw.web.service.commManager.BaseService;
import com.dw.web.utils.StringUtils;
import com.dw.web.utils.TimeUtils;

@Service("proSaleImportService")
public class ProSaleImportService extends BaseService {

	private static final Logger logger = LoggerFactory.getLogger(ProSaleImportService.class);
	@Autowired
	public ProSaleImportDao dao;

	/**
	 * 解析数据
	 * 
	 * @param file
	 * @param filePath
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> analytical(MultipartFile file, String filePath) throws Exception {
		// 返回信息
		List<Map<String, Object>> re = new ArrayList<Map<String, Object>>();
		Map<String, Object> reInfos = new HashMap<String, Object>();
		// UUID
		String strUUID = StringUtils.getUuid();
		// 解析EXCEL
		InputStream inp = file.getInputStream();
		// 获取EXCEL内容
		List<Map<String, Object>> list = this.getContent(inp, strUUID);
		// 入库
		if (list.size() > 0) {
			this.baseDao.batchInsert(ProSaleImportDao.class, list, 200);
			// TODO
		} else {
			reInfos.put("导入失败", "无数据");
			re.add(reInfos);
		}
		return re;
	}

	/**
	 * 获取EXCEL内容
	 * 
	 * @param inp
	 * @return
	 * @throws Exception
	 */
	private List<Map<String, Object>> getContent(InputStream inp, String strUUID) throws Exception {
		// EXCEL内容集合
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		Map<String, Object> map = null;
		// 根据input流生成excel
		XSSFWorkbook wb = new XSSFWorkbook(inp);
		// 获得excel的第一页
		XSSFSheet sheet = wb.getSheetAt(0);
		String[] col = { "flowId", "orderDate", "customerName", "productName", "orderNum", "costPrice", "salePrice" };
		for (int i = 1; i < sheet.getLastRowNum() + 1; i++) {
			map = new HashMap<String, Object>();// 当前行数据
			// 获取行
			XSSFRow row = sheet.getRow(i);
			if (row == null) {
				break;
			}
			XSSFCell cell = null;
			for (int j = 0; j < 7; j++) {
				cell = row.getCell(j);
				map.put(col[j], getValue(cell));

			}
			map.put("uuid", strUUID);// uuid
			map.put("lineNum", i);// 行号
			// 为空则为最后一行
			if (map.get("flowId") == null && map.get("orderDate") == null && map.get("customerName") == null && map.get("productName") == null && map.get("orderNum") == null && map.get("costPrice") == null && map.get("salePrice") == null) {
				break;
			}
			list.add(map);
		}
		return list;
	}

	/**
	 * 获取单元格内容
	 */
	public String getValue(XSSFCell cell) {
		String value = null;
		if (cell == null) {
			return value;
		}
		// 查出单元格类型
		try {
			switch (cell.getCellType()) {
			case XSSFCell.CELL_TYPE_STRING:// 字符串--文本类型
				value = cell.getRichStringCellValue().toString().trim();
				break;
			case XSSFCell.CELL_TYPE_NUMERIC:// 数字类型
				if (DateUtil.isCellDateFormatted(cell)) {// 时间类型
					value = cell.getDateCellValue().toString();
				} else {
					DecimalFormat df = new DecimalFormat("0");
					String str = String.valueOf(df.format(cell.getNumericCellValue())).trim();
					if (str != null && !"".equals(str)) {
						String[] strArray = str.split(".");
						if (strArray != null && strArray.length > 1) {
							value = strArray[0];
						} else {
							value = str;
						}
					}
				}
				break;
			case XSSFCell.CELL_TYPE_BOOLEAN:// boolean类型
				value = String.valueOf(cell.getBooleanCellValue()).trim();
				break;
			case XSSFCell.CELL_TYPE_FORMULA:// 公式类型
				value = cell.getCellFormula().trim();
				break;
			}
		} catch (Exception e) {
			logger.error("get lead excel null", e);
		}
		return value;
	}

}
