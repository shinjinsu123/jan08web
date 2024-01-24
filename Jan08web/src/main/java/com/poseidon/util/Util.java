package com.poseidon.util;

import javax.servlet.http.HttpServletRequest;

public class Util {
	// String값이 들어면 int타입인지 확인해보는 메소드
	// 127 -> true
	// 1A2A5 -> false

	public static int str2Int(String str) {
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < str.length(); i++) {
			if (Character.isDigit(str.charAt(i))) {
				sb.append(str.charAt(i));
			}
		}
		int number = 0;
		if (sb.length() > 0) {
			number = Integer.parseInt(sb.toString());
		}
		// System.out.println("변환된 숫자 " + number);
		return number;
	}

	public static int str2Int2(String str) {
		String numberOnly = str.replaceAll("[^0-9]", "");
		return Integer.parseInt(numberOnly);
	}

	public static boolean intCheck(String str) {
		try {
			Integer.parseInt(str);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	public static boolean intCheck2(String str) {
		boolean result = true;
		for (int i = 0; i < str.length(); i++) {
			if (!Character.isDigit(str.charAt(i))) {
				result = false;
				break;
			}
		}
		return result;
	}

	// IP얻어오기
	public static String getIP(HttpServletRequest request) {
		String ip = request.getHeader("X-FORWARDED-FOR");
		if (ip == null) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null) {
			ip = request.getHeader("HTTP_CLIENT_IP");
		}
		if (ip == null) {
			ip = request.getHeader("HTTP_X_FORWARDED_FOR");
		}
		if (ip == null) {
			ip = request.getRemoteAddr();
		}
		return ip;
	}

	// HTML태그를 특수기호로 변경하기 < &lt > &gt
	public static String removeTag(String str) {
		str = str.replaceAll("<", "&lt");
		str = str.replaceAll(">", "&gt");

		return str;
	}

	// 엔터 처리
	public static String addBR(String str) {
		return str.replaceAll("(\r\n|\r|\n|\n\r)", "<br>");
	}

	// ip 중간 주소 30을 다른 특수문자로 바꾸기 172.30.1.13
	public static String ipMarking1(String ip) {

		int ind1 = ip.indexOf('.', 1);
		int ind2 = ip.indexOf('1' + 1, ind1);
		String sub1 = "★";

		return ip;

	}

	// ip 중간 주소 30을 다른 특수문자로 바꾸기 (강사님 버전)
	public static String ipMasking(String ip) {

		if (ip.indexOf('.') != -1) {
			StringBuffer sb = new StringBuffer();
			sb.append(ip.substring(0, ip.indexOf('.') + 1)); // 172.
			sb.append("★"); // 172.★
			sb.append(ip.substring(ip.indexOf('.', ip.indexOf('.') + 1))); // 172.★.1.13
			return sb.toString();

		} else {

			return ip;
		}

	}
}