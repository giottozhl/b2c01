package com.zhl.util;

import java.util.Collection;
import java.util.Map;

public class FmtEmpty {

	/**
	 * 判断是否为空（null||length==0）
	 * 
	 * @param str
	 * @return false不为空，true为空
	 */
	public static boolean isEmpty(String str) {
		if (str==null||str.trim().isEmpty()) {
			return true;//"".equals(str)//length()==0
		}
		return false;
	}
	
	public static boolean isEmpty(Object str) {
		if (str==null||isEmpty(str.toString())) {
			return true;
		}
		return false;
	}
	
	/**
	 * 判断是否为空
	 * 
	 * @param map
	 * @param false不为空，true为空
	 */
	public static boolean isEmpty(Map<?, ?> map) {
		if (map==null||map.isEmpty()) {
			return true;
		}
		return false;
	}
	
	/**
	 * 判断是否为空（null||isEmpty）
	 * 
	 * @param list
	 * @param false不为空，true为空
	 */
	public static boolean isEmpty(Collection<?> list) {
		if (list==null||list.isEmpty()) {
			return true;
		}
		return false;
	}
	
	/**
	 * 判断是否为空（null||length==0）
	 * 
	 * @param array
	 * @param false不为空，true为空
	 */
	public static boolean isEmpty(Object[] array) {
		if (array==null||array.length==0) {
			return true;
		}
		return false;
	}
}
