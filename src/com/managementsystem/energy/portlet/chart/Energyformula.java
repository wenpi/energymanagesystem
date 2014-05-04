package com.managementsystem.energy.portlet.chart;

import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import com.managementsystem.energy.portlet.chart.model.Queryresult;

/**
 * 能耗公式解析
 * <p>获取公式中变量ID:  <br />
 * String calRule = "(5782*1.12)+(5783*1.2)-(5733*0.55)+(5300/130)";<br />
 * Energyformula formula = new Energyformula(calRule);<br />
 * formula.getTagids() <br />
 * 结果:5300|5733|5783|5782|5783
 * </p>
 * */
public class Energyformula {

	private int leftBracket = 0;// 左括号个数
	private int rightBracket = 0;// 右括号个数
	private int startL = 0;
	private int startR = 0;
	private double answer = 0;
	private String tagid;
	private String leftNumber = "0";
	private String rightNumber = "0";
	private String Msg = "";
	private String formula = ""; // 公式
	private int[] sym = new int[4];
	private Vector<String> list = new Vector<String>();

	

	public Energyformula() {
		super();
	}
	
	/**
	 * 构造函数
	 * */
	public Energyformula(String calRule) {
		this.setFormula(calRule);
	}

	/**
	 * 设置计算公式
	 * 
	 * @param calRule
	 *            计算公式
	 * */
	public void setFormula(String calRule) {
		formula = replaceSubtration(calRule.trim());
		formula = "(" + formula + ")";
	}

	/**
	 * 为了使公式中支持负数，使用“`”表示减号，使用“-”表示负号
	 */
	private String replaceSubtration(String vstr) {
		String tmp = "";
		String result = "";
		int startS = vstr.indexOf("-");
		if (startS != -1) {
			if (startS > 0) {
				tmp = vstr.substring(startS - 1, startS);
				if (!"+".equals(tmp) && !"-".equals(tmp) && !"*".equals(tmp)
						&& !"/".equals(tmp) && !"(".equals(tmp)) {
					result = result + vstr.substring(0, startS) + "`";
				} else
					result = result + vstr.substring(0, startS + 1);
			} else
				result = result + vstr.substring(0, startS + 1);
			vstr = vstr.substring(startS + 1);
		}
		while (startS != -1) {
			startS = vstr.indexOf("-");
			if (startS > 0) {
				tmp = vstr.substring(startS - 1, startS);
				if (!"+".equals(tmp) && !"-".equals(tmp) && !"*".equals(tmp)
						&& !"/".equals(tmp) && !"(".equals(tmp))
					result = result + vstr.substring(0, startS) + "`";
				else
					result = result + vstr.substring(0, startS + 1);
			} else
				result = result + vstr.substring(0, startS + 1);
			vstr = vstr.substring(startS + 1);
		}
		result += vstr;
		return result;
	}

	/**
	 * 返回计算公式
	 * */
	public String getFormula() {
		return formula.replace('`', '-').substring(1, formula.length() - 1);
	}

	/**
	 * 返回计算公式内左括号个数
	 * 
	 * @param calRule
	 */
	private int getLeftBracket(String calRule) {
		leftBracket = 0;
		startL = calRule.indexOf("(");
		if (startL != -1) {
			calRule = calRule.substring(startL + 1, calRule.length());
		}
		while (startL != -1) {
			leftBracket++;
			startL = calRule.indexOf("(");
			calRule = calRule.substring(startL + 1, calRule.length());
		}
		return leftBracket;
	}

	/**
	 * 获取计算公式右括号个数
	 * 
	 * @param calRule
	 *            计算公式
	 * */
	private int getRightBracket(String calRule) {
		rightBracket = 0;
		startR = calRule.indexOf(")");
		if (startR != -1) {
			calRule = calRule.substring(startR + 1, calRule.length());
		}
		while (startR != -1) {
			rightBracket++;
			startR = calRule.indexOf(")");
			calRule = calRule.substring(startR + 1, calRule.length());
		}
		return rightBracket;
	}


	/**
	 * 对比左右括号个数
	 */
	private boolean compareToLR() {
		int lb = getLeftBracket(formula);
		int rb = getRightBracket(formula);
		boolean CTLR = false;
		if (lb == rb) {
			Msg = "";
			CTLR = true;
		} else if (lb > rb) {
			Msg = "左括弧的个数多于右括弧，请检查！";
			CTLR = false;
		} else {
			Msg = "左括弧的个数少于右括弧，请检查！";
			CTLR = false;
		}
		return CTLR;
	}

	/**
	 * 检查公式中是否存在非法字符如(+、-)等
	 */
	private boolean checkFormula() {
		boolean isOk = true;
		String[] bracket = new String[2];
		String[] sign = new String[4];
		bracket[0] = "(";
		bracket[1] = ")";
		sign[0] = "+";
		sign[1] = "`";
		sign[2] = "*";
		sign[3] = "/";
		String vstr = "";
		for (int i = 0; i < bracket.length; i++) {
			for (int j = 0; j < sign.length; j++) {
				if (i == 0)
					vstr = bracket[i] + sign[j];
				else
					vstr = sign[j] + bracket[i];
				if (formula.indexOf(vstr) > 0) {
					Msg = "公式中存在非法字符" + vstr;
					isOk = false;
					return isOk;
				}
			}
		}
		for (int i = 0; i < sign.length; i++) {
			for (int j = 0; j < sign.length; j++) {
				vstr = sign[i] + sign[j];
				if (formula.indexOf(vstr) > 0) {
					Msg = "公式中存在非法字符" + vstr;
					isOk = false;
					return isOk;
				}
			}
		}
		if (formula.indexOf("()") > 0) {
			Msg = "公式中存在非法字符()";
			isOk = false;
		}
		return isOk;
	}

	/**
	 * 验证公式
	 * */
	public boolean checkValid() {
		if ((formula == null) || (formula.trim().length() <= 0)) {
			Msg = "请设置属性calRule!";
			return false;
		}
		return (compareToLR() && checkFormula());
	}

	/**
	 * 返回移除公式计算符的字符
	 * */
	public String getTagids() {
		String formulaStr = "", calRule = "";
		String tagids = "";
		calRule = this.formula;
		StringBuilder sb = new StringBuilder();
		if (checkValid()) {
			for (int i = 0; i < leftBracket; i++) {
				int iStart = calRule.lastIndexOf("(") + 1;
				formulaStr = calRule.substring(iStart,
						iStart + calRule.substring(iStart).indexOf(")")).trim();
				symbolParse(formulaStr);
				tagids = parseTagid();
				if(sb.length()>0 && !"0".equals(tagids)) sb.append("|");
				if(!"".equals(tagids) && !"0".equals(tagids))
					sb.append(tagids);
				iStart = calRule.lastIndexOf("(");
				int iEnd = calRule.substring(iStart).indexOf(")") + 1;
				calRule = calRule.substring(0, iStart).trim()
				+ "0"
				+ calRule.substring(iStart + iEnd, calRule.length())
						.trim();
			}
		}
		System.out.println(Msg);
		return sb.toString();
	}

	/**
	 * 返回公式执行结果 return double
	 */
	public double getResult() {
		String formulaStr = "", calRule = "";
		double value = 0.0;
		// 计算公式
		calRule = this.formula;
		if (checkValid()) {
			for (int i = 0; i < leftBracket; i++) {
				int iStart = calRule.lastIndexOf("(") + 1;
				formulaStr = calRule.substring(iStart,
						iStart + calRule.substring(iStart).indexOf(")")).trim();
				 symbolParse(formulaStr);
				value = parseString();
				iStart = calRule.lastIndexOf("(");
				int iEnd = calRule.substring(iStart).indexOf(")") + 1;
				calRule = calRule.substring(0, iStart).trim()
						+ value
						+ calRule.substring(iStart + iEnd, calRule.length())
								.trim();
			}
		}
		System.out.println(Msg);
		double tmp = Math.pow(10, 10);
		value = Math.round(value * tmp) / tmp;
		return value;
	}
	
	/**
	 * 设置结果列表
	 * @param list 设置对象
	 * @return 设置后的列表 list
	 * */
	public void setResultList(List<Queryresult> list) {
		String formulaStr = "", calRule = "";
		calRule = this.formula;
		if (checkValid()) {
			for (int i = 0; i < leftBracket; i++) {
				int iStart = calRule.lastIndexOf("(") + 1;
				formulaStr = calRule.substring(iStart,
						iStart + calRule.substring(iStart).indexOf(")")).trim();
				System.out.println(formulaStr);
				symbolParse(formulaStr);
				parseList(list);
				iStart = calRule.lastIndexOf("(");
				int iEnd = calRule.substring(iStart).indexOf(")") + 1;
				calRule = calRule.substring(0, iStart).trim()
						+ calRule.substring(iStart + iEnd, calRule.length())
								.trim();
			}
		}
	}

	/**
	 * 抽取最终括号内数据到List
	 */
	private void symbolParse(String str) {
		list.clear();
		for (int i = 0; i < 4; i++) {
			compareMin(str);
			while (sym[i] != -1) {
				String insStr = str.substring(0, sym[i]).trim();
				list.add(insStr);
				insStr = str.substring(sym[i], sym[i] + 1).trim();
				list.add(insStr);

				str = str.substring(sym[i] + 1, str.length()).trim();
				compareMin(str);
			}
		}
		if (sym[0] == -1 && sym[1] == -1 && sym[2] == -1 & sym[3] == -1) {
			list.add(str);
		}
	}

	/**
	 * 循环比较赋SubString起始值
	 */
	private void compareMin(String str) {
		int sps = str.indexOf("`");// 减法subtration
		sym[0] = sps;
		int spa = str.indexOf("+");// 加法addition
		sym[1] = spa;
		int spd = str.indexOf("/");// 除法division
		sym[2] = spd;
		int spm = str.indexOf("*");// 乘法multiplication
		sym[3] = spm;
		for (int i = 1; i < sym.length; i++) {
			for (int j = 0; j < sym.length - i; j++)
				if (sym[j] > sym[j + 1]) {
					int temp = sym[j];
					sym[j] = sym[j + 1];
					sym[j + 1] = temp;
				}
		}
	}
	
	/**
	 * 解析TagId
	 * */
	private String parseTagid() {
		calculateTagid();
		return tagid;
	}
	
	/**
	 * 匹配列表和公式
	 * 
	 * @param queryresults 原始结果
	 * */
	private void parseList(List<Queryresult> queryresults) {
		List<String> tmpList = new ArrayList<String>();
		tmpList.addAll(list);
		if(queryresults==null)
			return;
		for(Queryresult qr : queryresults) {
			boolean isok = false;
			for (int i = 0; i < tmpList.size(); i++) {
				if(list.size()<2)  {
					list.clear();
					for(int j=0;j<tmpList.size();j++) {
						list.add(tmpList.get(j));
					}
				}
				if (list.get(i).toString().equals(qr.getTagid())) {
					list.set(i, qr.getVal());
					isok=true;
					break;
				}
			}
			if(isok) {
				double value = parseString();
				qr.setVal(String.valueOf(value));
			}
		}
	}
	
	private double parseString() throws NumberFormatException,
			StringIndexOutOfBoundsException {
		try {
			calculate();
			return answer;
		} catch (Exception e) {
			Msg = "错误：" + e.getMessage();
			return 0.0;
		}
	}

	/**
	 * 取变量ID
	 * */
	private void calculateTagid() {
		/*
		 * /*处理除法
		 */
		int spd = list.indexOf("/");
		while (spd != -1) {
			leftNumber = list.get(spd - 1).toString();
			rightNumber = list.get(spd + 1).toString();
			list.remove(spd - 1);
			list.remove(spd - 1);
			list.remove(spd - 1);
			double ln = Double.valueOf(leftNumber).doubleValue();
			double rn = Double.valueOf(rightNumber).doubleValue();
			
			//if(ln>rn) {
				tagid = String.valueOf(Math.round(ln));
			//} else {
			//	tagid = String.valueOf(Math.round(rn));
			//}
			list.add(spd - 1, String.valueOf(tagid));
			spd = list.indexOf("/");
		}
		/*
		 * /*处理乘法
		 */
		int spm = list.indexOf("*");
		while (spm != -1) {
			leftNumber = list.get(spm - 1).toString();
			rightNumber = list.get(spm + 1).toString();
			list.remove(spm - 1);
			list.remove(spm - 1);
			list.remove(spm - 1);
			double ln = Double.valueOf(leftNumber).doubleValue();
			double rn = Double.valueOf(rightNumber).doubleValue();
			//if(ln>rn) {
				tagid = String.valueOf(Math.round(ln));
			//} else {
			//	tagid = String.valueOf(Math.round(rn));
			//}
			list.add(spm - 1, String.valueOf(tagid));
			spm = list.indexOf("*");
		}
		/*
		 * /*处理减法
		 */
		int sps = list.indexOf("`");
		while (sps != -1) {
			leftNumber = list.get(sps - 1).toString();
			rightNumber = list.get(sps + 1).toString();
			list.remove(sps - 1);
			list.remove(sps - 1);
			list.remove(sps - 1);
			double ln = Double.valueOf(leftNumber).doubleValue();
			double rn = Double.valueOf(rightNumber).doubleValue();
			//if(ln>rn) {
				tagid = String.valueOf(Math.round(ln));
			//} else {
			//	tagid = String.valueOf(Math.round(rn));
			//}
			list.add(sps - 1, String.valueOf(tagid));
			sps = list.indexOf("`");
		}
		/*
		 * /*处理加法
		 */
		int spa = list.indexOf("+");
		while (spa != -1) {
			leftNumber = list.get(spa - 1).toString();
			rightNumber = list.get(spa + 1).toString();
			list.remove(spa - 1);
			list.remove(spa - 1);
			list.remove(spa - 1);
			double ln = Double.valueOf(leftNumber).doubleValue();
			double rn = Double.valueOf(rightNumber).doubleValue();
			if(ln>rn) {
				tagid = String.valueOf(Math.round(ln));
			} else {
				tagid = String.valueOf(Math.round(rn));
			}
			list.add(spa - 1, String.valueOf(tagid));
			spa = list.indexOf("+");
		}
		if (list.size() != 0) {
			String result = list.get(0).toString();
			if (result == null || result.length() == 0)
				result = "";
			tagid = list.get(0).toString();
			//answer = Double.parseDouble(list.get(0).toString());
		}
	}
	
	private void calculate() {
		/*
		 * /*处理除法
		 */
		int spd = list.indexOf("/");
		while (spd != -1) {
			leftNumber = list.get(spd - 1).toString();
			rightNumber = list.get(spd + 1).toString();
			list.remove(spd - 1);
			list.remove(spd - 1);
			list.remove(spd - 1);
			double ln = Double.valueOf(leftNumber).doubleValue();
			double rn = Double.valueOf(rightNumber).doubleValue();
			double answer = ln / rn;
			list.add(spd - 1, String.valueOf(answer));
			spd = list.indexOf("/");
		}
		/*
		 * /*处理乘法
		 */
		int spm = list.indexOf("*");
		while (spm != -1) {
			leftNumber = list.get(spm - 1).toString();
			rightNumber = list.get(spm + 1).toString();
			list.remove(spm - 1);
			list.remove(spm - 1);
			list.remove(spm - 1);
			double ln = Double.valueOf(leftNumber).doubleValue();
			double rn = Double.valueOf(rightNumber).doubleValue();
			double answer = ln * rn;
			list.add(spm - 1, String.valueOf(answer));
			spm = list.indexOf("*");
		}
		/*
		 * /*处理减法
		 */
		int sps = list.indexOf("`");
		while (sps != -1) {
			leftNumber = list.get(sps - 1).toString();
			rightNumber = list.get(sps + 1).toString();
			list.remove(sps - 1);
			list.remove(sps - 1);
			list.remove(sps - 1);
			double ln = Double.valueOf(leftNumber).doubleValue();
			double rn = Double.valueOf(rightNumber).doubleValue();
			double answer = ln - rn;
			list.add(sps - 1, String.valueOf(answer));
			sps = list.indexOf("`");
		}
		/*
		 * /*处理加法
		 */
		int spa = list.indexOf("+");
		while (spa != -1) {
			leftNumber = list.get(spa - 1).toString();
			rightNumber = list.get(spa + 1).toString();
			list.remove(spa - 1);
			list.remove(spa - 1);
			list.remove(spa - 1);
			double ln = Double.valueOf(leftNumber).doubleValue();
			double rn = Double.valueOf(rightNumber).doubleValue();
			double answer = ln + rn;
			list.add(spa - 1, String.valueOf(answer));
			spa = list.indexOf("+");
		}
		if (list.size() != 0) {
			String result = list.get(0).toString();
			if (result == null || result.length() == 0)
				result = "0";
			answer = Double.parseDouble(list.get(0).toString());
		}
	}
}
