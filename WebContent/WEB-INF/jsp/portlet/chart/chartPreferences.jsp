<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../init.jsp"%>
<!-- HTML START -->
<!-- 
	AUTHOR: CHENPING
	Created Date: 2012-7-2 下午05:11:56
	LastModified Date:
	Description:
 -->
<portlet:actionURL var="savePrefUrl">
	<portlet:param name="action" value="savePreferences" />
</portlet:actionURL>

<div id="msg"></div>
<form:form commandName="chartsetting" method="post" class="" action="#">
	<div class="ftitle">图表常规设置
	<span class="title-back"><a href="<portlet:renderURL portletMode="view"></portlet:renderURL>">«返回</a></span>
	</div>
	
	<div class="div-table">
		<div class="div-table-row">
			<div class="div-table-2col">
				<div class="fitem">
					<form:label path="chartType">图表类型</form:label>
					<form:select path="chartType">
						<optgroup label="单系列图表">
							<form:option value="Column2D.swf">2D柱形图</form:option>
							<form:option value="Column3D.swf">3D柱形图</form:option>
							<form:option value="Pie2D.swf">2D饼形图</form:option>
							<form:option value="Pie3D.swf">3D饼形图</form:option>
							<form:option value="Line.swf">线形图</form:option>
							<form:option value="Area2D.swf">面积图</form:option>
							<form:option value="Bar2D.swf">条形图</form:option>
							<form:option value="Doughnut2D.swf">2D圆环图</form:option>
							<form:option value="Doughnut3D.swf">3D圆环图</form:option>
							<form:option value="Pareto2D.swf">2D排列图</form:option>
							<form:option value="Pareto3D.swf">3D排列图</form:option>
						</optgroup>
						<optgroup label="多系列图表">
							<form:option value="MSColumn2D.swf">多系列2D柱形图(MSColumn2D)</form:option>
							<form:option value="MSColumn3D.swf">多系列3D柱形图(MSColumn3D)</form:option>
							<form:option value="MSLine.swf">多系列线形图(MSLine)</form:option>
							<form:option value="MSBar2D.swf">多系列2D条形图(MSBar2D)</form:option>
							<form:option value="MSBar3D.swf">多系列3D条形图(MSBar3D)</form:option>
							<form:option value="MSArea.swf">多系列面积图(MSArea)</form:option>
							<form:option value="Marimekko.swf">Marimekko</form:option>
							<form:option value="ZoomLine.swf">ZoomLine</form:option>
						</optgroup>
						<optgroup label="堆积图表">
							<form:option value="StackedColumn2D.swf">2D柱形堆积图(StackedColumn2D)</form:option>
							<form:option value="StackedColumn3D.swf">3D柱形堆积图(StackedColumn3D)</form:option>
							<form:option value="StackedBar2D.swf">StackedBar2D</form:option>
							<form:option value="StackedBar3D.swf">StackedBar3D</form:option>
							<form:option value="StackedArea2D.swf">StackedArea2D</form:option>
							<form:option value="MSStackedColumn2D.swf">MSStackedColumn2D</form:option>
						</optgroup>
						<optgroup label="组合图表">
							<form:option value="MSCombi2D.swf">MSCombi2D</form:option>
							<form:option value="MSCombi3D.swf">MSCombi3D</form:option>
							<form:option value="MSColumnLine3D.swf">MSColumnLine3D</form:option>
							<form:option value="StackedColumn2DLine.swf">StackedColumn2DLine</form:option>
							<form:option value="StackedColumn3DLine.swf">StackedColumn3DLine</form:option>
							<form:option value="MSCombiDY2D.swf">MSCombiDY2D</form:option>
							<form:option value="MSColumn3DLineDY.swf">MSColumn3DLineDY</form:option>
							<form:option value="StackedColumn3DLineDY.swf">StackedColumn3DLineDY</form:option>
							<form:option value="MSStackedColumn2DLineDY.swf">MSStackedColumn2DLineDY</form:option>
						</optgroup>
						<optgroup label="分布图">
							<form:option value="Scatter.swf">分布图(Scatter)</form:option>
							<form:option value="Bubble.swf">汽泡图(Bubble)</form:option>
						</optgroup>
						<optgroup label="滚动图">
							<form:option value="ScrollColumn2D.swf">滚动柱形图(ScrollColumn2D)</form:option>
							<form:option value="ScrollLine2D.swf">滚动线形图(ScrollLine2D)</form:option>
							<form:option value="ScrollArea2D.swf">滚动面积图ScrollArea2D</form:option>
							<form:option value="ScrollStackedColumn2D.swf">滚动柱形堆积图ScrollStackedColumn2D</form:option>
							<form:option value="ScrollCombi2D.swf">2D滚动组合图表</form:option>
							<form:option value="ScrollCombiDY2D.swf">ScrollCombiDY2D</form:option>
						</optgroup>
					</form:select>
					*
				</div>
			</div>
			<div class="div-table-2col">
				<div class="fitem">
					<form:label path="dataFormat">数据类型</form:label>
					<form:select path="dataFormat">
						<form:option value="json">JSON</form:option>
						<form:option value="jsonurl">JSONURL</form:option>
						<form:option value="xml">XML</form:option>
						<form:option value="xmlurl">XMLURL</form:option>
						<form:option value="database">数据库</form:option>
					</form:select>
					*
				</div>
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-2col">
				<div class="fitem">
					<form:label path="caption">图表标题</form:label>
					<form:input path="caption" cssClass="easyui-validatebox"
						required="true" title="显示在图表顶部的标题！" />
					*
				</div>
			</div>
			<div class="div-table-2col">
				<div class="div-table-col">
					<div class="fitem">
						<form:label path="width">图表宽度</form:label>
						<form:input path="width" class="easyui-numberbox" required="true" />
						*
					</div>
				</div>
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-2col">
				<div class="fitem">
					<form:label path="subcaption">图表副标题</form:label>
					<form:input path="subcaption" />
				</div>
			</div>
			<div class="div-table-2col">
				<div class="fitem">
					<form:label path="height">图表高度</form:label>
					<form:input path="height" class="easyui-numberbox" required="true" />
					*
				</div>
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-2col">
				<div class="fitem">
					<form:label path="xaxisname">X轴标题</form:label>
					<form:input path="xaxisname" />
				</div>
			</div>
			<div class="div-table-2col">
				<div class="fitem">
					<form:label path="usePyaxisname">Y轴标题类型</form:label>
					<form:radiobutton path="usePyaxisname" value="true" />
					启用主次标题
					<form:radiobutton path="usePyaxisname" value="false" />
					禁用主次标题

				</div>
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-2col">
				<div class="fitem">
					<form:label path="debugMode">启用调试</form:label>
					<form:radiobutton path="debugMode" value="true" />
					启用
					<form:radiobutton path="debugMode" value="false" />
					禁用

				</div>
			</div>
			<div class="div-table-2col">
				<div class="fitem" id="disUsePyaxisname">
					<form:label path="yaxisname">Y轴标题</form:label>
					<form:input path="yaxisname" />
				</div>
				<div class="fitem" id="enUsePyaxisname">
					<form:label path="pyaxisname">Y轴主标题</form:label>
					<form:input path="pyaxisname" />
					<br />
					<form:label path="syaxisname">Y轴二级标题</form:label>
					<form:input path="syaxisname" />
				</div>
			</div>
		</div>
		<div class="div-table-row" id="dataContentContainter">
			<div class="div-table-col">
			<div class="fitem">
				<form:label path="dataContent">数据内容  <a href="<%=renderRequest.getContextPath() %>/fusioncharts/XMLGen/XMLGen.html" target="_blank">生成</a></form:label>
				<form:textarea path="dataContent" style="width:96%;height:250px;"/>
			</div>
			</div>
		</div>
		
		<div class="div-table-row"></div>
	</div>
	<div id="desc" class="portlet-msg-info">
		图表类型说明： <br />按展示类型分类：单系列图表、多系列图表、堆积式图表、组合图表、分布图、滚动图； <br />按数据类型分类：单组数据类型图表、多组数据类型图表
		<br />注意：如果变量TagID具有多个系列，则展示图表不能选择单系统的图表，反之单系列的TagID不能选择多系列图表类型
	</div>

	<div class="ftitle">图表扩展设置</div>
	<div class="div-table">
		<div class="div-table-row">
			<div class="div-table-3col">
				<div class="fitem">
					<form:label path="palette">选择调色板</form:label>
					<form:select path="palette" cssClass="easyui-combobox">
						<form:option value="">默认</form:option>
						<form:option value="1">1</form:option>
						<form:option value="2">2</form:option>
						<form:option value="3">3</form:option>
						<form:option value="4">4</form:option>
						<form:option value="5">5</form:option>
					</form:select>
					<span class="taglib-icon-help"> <img alt=""
						title="Charts offers 5 palettes for you to choose from, Palette 1 is the default chart palette use"
						src="/html/themes/classic/images/portlet/help.png" /> </span>
				</div>
			</div>
			<div class="div-table-3col">
				<div class="fitem">
					<form:label path="paletteColors">自定义调色</form:label>
					<form:input path="paletteColors" />
					<span class="taglib-icon-help"> <img alt=""
						title="自定义调色板颜色,如 FF5904,0372AB,FF0000"
						src="/html/themes/classic/images/portlet/help.png" /> </span>
				</div>
			</div>
			<div class="div-table-3col">
				<div class="fitem">
					<form:label path="showValues">显示数值</form:label>
					<form:radiobutton path="showValues" value="0" />隐藏
					<form:radiobutton path="showValues" value="1" />显示
					<span class="taglib-icon-help"> <img alt=""
						title="是否在图表上显示数值"
						src="/html/themes/classic/images/portlet/help.png" /> </span>
				</div>
			</div>
			
			
			
		</div>
		<div class="div-table-row">
			<div class="div-table-3col">
				<div class="fitem">
					<form:label path="formatNumber">格式化数值</form:label>
					<form:radiobutton path="formatNumber" value="0" />否
					<form:radiobutton path="formatNumber" value="1" />是
					<span class="taglib-icon-help"> <img alt=""
						title="This configuration determines whether the numbers displayed on the chart will be formatted using commas, e.g., 40,000 if formatNumber='1' and 40000 if formatNumber= '0'. For more details, please see Advanced Charting > Number Formatting > Basics page."
						src="/html/themes/classic/images/portlet/help.png" /> </span>
				</div>
			</div>
			<div class="div-table-3col">
				<div class="fitem">
					<form:label path="formatNumberScale">启用数值该度</form:label>
					<form:radiobutton path="formatNumberScale" value="0" />禁用
					<form:radiobutton path="formatNumberScale" value="1" />启用
					<span class="taglib-icon-help"> <img alt="" title="Configuration whether to add K (thousands) and M (millions) to a number after truncating and rounding it - e.g., if formatNumberScale is set to 1, 1043 will become 1.04K (with decimals set to 2 places). Same with numbers in millions - an M will be added at the end"
						src="/html/themes/classic/images/portlet/help.png" /> </span>
				</div>
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-3col">
				<div class="fitem">
					<form:label path="decimals">小数位数</form:label>
					<form:input path="decimals" class="easyui-numberbox" maxLength="2" />
					<span class="taglib-icon-help"> <img alt=""
						title="取值范围(0-10)"
						src="/html/themes/classic/images/portlet/help.png" /> </span>
				</div>
			</div>
			<div class="div-table-3col">
				<div class="fitem">
					<form:label path="numberprefix">数字前缀</form:label>
					<form:input path="numberprefix" />
					<span class="taglib-icon-help"> <img alt="" title="如 $10"
						src="/html/themes/classic/images/portlet/help.png" /> </span>
				</div>
			</div>
			<div class="div-table-3col">
				<div class="fitem">
					<form:label path="numbersuffix">数字后缀</form:label>
					<form:input path="numbersuffix" />
					<span class="taglib-icon-help"> <img alt="" title="如 0M"
						src="/html/themes/classic/images/portlet/help.png" /> </span>
				</div>
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-3col">
				<div class="fitem">
					<form:label path="xaxismaxvalue">X轴最大值</form:label>
					<form:input path="xaxismaxvalue" />
					<span class="taglib-icon-help"> <img alt=""
						src="/html/themes/classic/images/portlet/help.png" /> </span>
				</div>
			</div>
			<div class="div-table-3col">
				<div class="fitem">
					<form:label path="xaxisminvalue">X轴最小值</form:label>
					<form:input path="xaxisminvalue" />
					<span class="taglib-icon-help"> <img alt=""
						src="/html/themes/classic/images/portlet/help.png" /> </span>
				</div>
			</div>
			<div class="div-table-3col">
				<div class="fitem">
					<form:label path="yaxismaxvalue">Y轴最大值</form:label>
					<form:input path="yaxismaxvalue" />
					<span class="taglib-icon-help"> <img alt=""
						src="/html/themes/classic/images/portlet/help.png" /> </span>
				</div>
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-3col">
				<div class="fitem">
					<form:label path="bgImage">背景图片地址</form:label>
					<form:input path="bgImage" />
					<span class="taglib-icon-help"> <img alt=""
						src="/html/themes/classic/images/portlet/help.png" /> </span>
				</div>
			</div>
			<div class="div-table-3col">
				<div class="fitem">
					<form:label path="bgImageAlpha">图片透明度</form:label>
					<form:input path="bgImageAlpha" class="easyui-numberbox"
						maxLength="3" />
					<span class="taglib-icon-help"> <img alt=""
						title="设置背景图片透明度,默认值为100,取值范围 0-100"
						src="/html/themes/classic/images/portlet/help.png" /> </span>
				</div>
			</div>
			<div class="div-table-3col">
				<div class="fitem">
					<form:label path="scale">背景图片缩放</form:label>
					<form:input path="scale" />
					<span class="taglib-icon-help"> <img alt=""
						title="The value of this attribute can be anything between 0-300. The default value of the attribute is 100. Any value less than 100 will reduce thesize of the background image and any value more than 100 will increasethe size of the background image"
						src="/html/themes/classic/images/portlet/help.png" /> </span>
				</div>
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-3col">
				<div class="fitem">
					<form:label path="bgImageHAlign">背景水平对齐</form:label>
					<form:select path="bgImageHAlign" cssClass="easyui-combobox">
						<form:option value="left">向左</form:option>
						<form:option value="middle">居中</form:option>
						<form:option value="right">向右</form:option>
					</form:select>
					<span class="taglib-icon-help"> <img alt=""
						title="设置图表背景水平对齐方式"
						src="/html/themes/classic/images/portlet/help.png" /> </span>
				</div>
			</div>
			<div class="div-table-3col">
				<div class="fitem">
					<form:label path="bgImageVAlign">背景垂直对齐</form:label>
					<form:select path="bgImageVAlign" cssClass="easyui-combobox">
						<form:option value="top">顶部</form:option>
						<form:option value="middle">居中</form:option>
						<form:option value="bottom">底部</form:option>
					</form:select>
					<span class="taglib-icon-help"> <img alt=""
						title="设置图表背景垂直对齐方式"
						src="/html/themes/classic/images/portlet/help.png" /> </span>
				</div>
			</div>
			<div class="div-table-3col">
				<div class="fitem">
					<form:label path="bgImageDisplayMode">背景显示模式</form:label>
					<form:select path="bgImageDisplayMode" cssClass="easyui-combobox">
						<form:option value="none">无</form:option>
						<form:option value="center">居中</form:option>
						<form:option value="stretch">拉伸</form:option>
						<form:option value="tile">重复</form:option>
						<form:option value="fit">自适应</form:option>
						<form:option value="fill">填充</form:option>
					</form:select>
					<span class="taglib-icon-help"> <img alt="" title=""
						src="/html/themes/classic/images/portlet/help.png" /> </span>
				</div>
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-3col">
				<div class="fitem">
					<form:label path="labelDisplay">标签样式</form:label>
					<form:select path="labelDisplay">
						<form:option value="auto">自动</form:option>
						<form:option value="wrap">包装</form:option>
						<form:option value="stagger">交错</form:option>
						<form:option value="rotate">旋转</form:option>
						<form:option value="none">无</form:option>
					</form:select>
					<span class="taglib-icon-help"> <img alt=""
						title="设置是否旋转X轴数据标签"
						src="/html/themes/classic/images/portlet/help.png" /> </span>
				</div>
			</div>
			<div class="div-table-3col">
				<div class="fitem">
					<form:label path="slantLabels">是否倾斜</form:label>
					<form:radiobutton path="slantLabels" value="0"/> 否
					<form:radiobutton path="slantLabels" value="1"/> 是
					<span class="taglib-icon-help"> <img alt=""
						title="设置旋转标签是否倾斜"
						src="/html/themes/classic/images/portlet/help.png" /> </span>
				</div>
			</div>
		</div>
	</div>
		<div id="trendline" class="portlet-msg-info">
		标准线说明： <br />启用后，将在图表显示一条指定值的趋势线
	</div>
	<div class="ftitle">图表标准线设置</div>
	<div class="div-table">
		<div class="div-table-row">
			<div class="div-table-3col">
				<div class="fitem">
				<form:label path="isTrendZone">启用趋势线</form:label>
				<form:radiobutton path="isTrendZone" value="0"/> 禁用
				<form:radiobutton path="isTrendZone" value="1"/> 启用
				</div>
			</div>
			<div class="div-table-3col">
				<div class="fitem">
				<form:label path="startValue">起始值</form:label>
				<form:input path="startValue"/>
				<span class="taglib-icon-help"> <img alt=""
						title="The starting value for the trendline. Say, if you want to plot a slanted trendline from value 102 to 109, the startValue will be 102."
						src="/html/themes/classic/images/portlet/help.png" /> </span>
				</div>
			</div>
			<div class="div-table-3col">
				<div class="fitem">
				<form:label path="endValue">结束值</form:label>
				<form:input path="endValue"/>
				<span class="taglib-icon-help"> <img alt=""
						title="The ending y-axis value for the trendline. Say, if you want to plot a slanted trendline from value 102 to 109, the endValue will be 109. If you do not specify a value for endValue, it will automatically assume the same value as startValue."
						src="/html/themes/classic/images/portlet/help.png" /> </span>
				</div>
			</div>
		</div>
			<div class="div-table-row">
			<div class="div-table-3col">
				<div class="fitem">
				<form:label path="displayValue">趋势线名称</form:label>
				<form:input path="displayValue"/>
				<span class="taglib-icon-help"> <img alt=""
						title="If you want to display a string caption for the trend line by its side, you can use this attribute. Example: displayValue='Last Month High'. When you don't supply this attribute, it automatically takes the value of startValue."
						src="/html/themes/classic/images/portlet/help.png" /> </span>
				</div>
			</div>
			<div class="div-table-3col">
				<div class="fitem">
				<form:label path="color">线条颜色</form:label>
				<form:input path="color"/>
				<span class="taglib-icon-help"> <img alt=""
						title="Color of the trend line and its associated text"
						src="/html/themes/classic/images/portlet/help.png" /> </span>
				</div>
			</div>
			<div class="div-table-3col">
				<div class="fitem">
				<form:label path="showOnTop">显示在顶部</form:label>
				<form:radiobutton path="showOnTop" value="0"/> 否
				<form:radiobutton path="showOnTop" value="1"/> 是
				<span class="taglib-icon-help"> <img alt=""
						title="Whether the trend line/zone will be displayed over data plots or under them"
						src="/html/themes/classic/images/portlet/help.png" /> </span>
				</div>
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-3col">
				<div class="fitem">
				<form:label path="thickness">线条厚度</form:label>
				<form:input path="thickness"/>
				<span class="taglib-icon-help"> <img alt=""
						title="If you've opted to show the trend as a line, this attribute lets you define the thickness of trend line."
						src="/html/themes/classic/images/portlet/help.png" /> </span>
				</div>
			</div>
			<div class="div-table-3col">
				<div class="fitem">
				<form:label path="alpha">线条透明度</form:label>
				<form:input path="alpha" placeholder="Range:0-100" />
				<span class="taglib-icon-help"> <img alt=""
						title="Alpha of the trend line. "
						src="/html/themes/classic/images/portlet/help.png" /> </span> 
				</div>
			</div>
			<div class="div-table-3col">
				<div class="fitem">
				<form:label path="dashed">是否虚线</form:label>
				<form:radiobutton path="dashed" value="0"/> 否
				<form:radiobutton path="dashed" value="1"/> 是
				<span class="taglib-icon-help"> <img alt=""
						title="If you've opted to show the trend as a line, this attribute lets you define whether the trend line will appear as dashed."
						src="/html/themes/classic/images/portlet/help.png" /> </span>
				</div>
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-3col">
				<div class="fitem">
				<form:label path="dashLen">虚线长度</form:label>
				<form:input path="dashLen" placeholder="In Pixels" />
				<span class="taglib-icon-help"> <img alt=""
						title="If you've opted to show trend line as dash, this attribute lets you control the length of each dash."
						src="/html/themes/classic/images/portlet/help.png" /> </span> In Pixels
				</div>
			</div>
			<div class="div-table-3col">
				<div class="fitem">
				<form:label path="dashGap">虚线点距</form:label>
				<form:input path="dashGap" placeholder="Range:0-100"/>
				<span class="taglib-icon-help"> <img alt=""
						title="If you've opted to show trend line as dash, this attribute lets you control the length of each dash gap. "
						src="/html/themes/classic/images/portlet/help.png" /> </span> 
				</div>
			</div>
			<div class="div-table-3col">
				<div class="fitem">
				<form:label path="valueOnRight">显示在右侧</form:label>
				<form:radiobutton path="valueOnRight" value="0"/> 否
				<form:radiobutton path="valueOnRight" value="1"/> 是
				<span class="taglib-icon-help"> <img alt=""
						title="Whether to show the trend line value on left side or right side of chart. This is particularly useful when the trend line display values on the chart are colliding with divisional lines values on the chart."
						src="/html/themes/classic/images/portlet/help.png" /> </span>
				</div>
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-3col">
				<div class="fitem">
				<form:label path="toolText">自定义提示文字</form:label>
				<form:input path="toolText"/>
				<span class="taglib-icon-help"> <img alt=""
						title="Custom tool-text for this trendline/zone."
						src="/html/themes/classic/images/portlet/help.png" /> </span> 
				</div>
			</div>
	</div>
	</div>
	
	

	<div class="ftitle">图表查询设置</div>
	<div class="div-table">
		<div class="div-table-row">
			<div class="div-table-2col">
				<div class="fitem">
					<form:label path="showQuery">显示查询</form:label>
					<form:radiobutton path="showQuery" value="true" />
					显示
					<form:radiobutton path="showQuery" value="false" />
					隐藏 <span class="taglib-icon-help"> <img title="设置显示或隐藏查询工具栏"
						src="/html/themes/classic/images/portlet/help.png" /> </span>
				</div>
			</div>
			<div class="div-table-2col">
				<div class="fitem">
					<form:label path="queryType">查询类型</form:label>
					<form:select path="queryType" cssClass="easyui-combobox">
						<form:option value="usage">任意时间</form:option>
						<form:option value="dayreport">用量日报</form:option>
						<form:option value="weekreport">用量周报</form:option>
						<form:option value="monthreport">用量月报</form:option>
						<form:option value="yearreport">用量年报</form:option>
						<form:option value="query">原始抄表</form:option>
					</form:select>
					<span class="taglib-icon-help"> <img
						title="设置数据查询方式:
任意时间(查询任意时间段的用量,最多同时32个变量)
用量日报(24小时内每个小时的用量，最多同时32个变量)
用量周报(一周内每天的用量，最多同时32个变量)
用量月报(一月内每天的用量，最多同时32个变量)
用量年报(一年内每月的用量，最多同时32个变量)
原始抄表(原始抄表数据明细)"
						src="/html/themes/classic/images/portlet/help.png" /> </span>
				</div>
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-2col">
				<div class="fitem">
					<form:label path="defStarttime">起始时间</form:label>
					<form:select path="defStarttime" cssClass="easyui-combobox">
						<form:option value="today">今天</form:option>
						<form:option value="yesterday">昨天</form:option>
						<form:option value="firstofweek">本周第一天</form:option>
						<form:option value="firstofmonth">本月第一天</form:option>
						<form:option value="firstofyear">本年第一天</form:option>
						<form:option value="custom">自定义</form:option>
					</form:select>
					<span id="starttimeValueWrap"> <form:input
							path="starttimeValue" cssClass="easyui-datebox" /> </span>
				</div>
			</div>
			<div class="div-table-2col">
				<div class="fitem">
					<form:label path="defEndtime">结束时间</form:label>
					<form:select path="defEndtime" cssClass="easyui-combobox">
						<form:option value="">无</form:option>
						<form:option value="today">今天</form:option>
						<form:option value="yesterday">昨天</form:option>
						<form:option value="endofweek">本周最后一天</form:option>
						<form:option value="endofmonth">本月最后天</form:option>
						<form:option value="custom">自定义</form:option>
					</form:select>
					<span id="endtimeValueWrap"> <form:input path="endtimeValue"
							cssClass="easyui-datebox" /> </span>
				</div>
			</div>

		</div>
		<div class="div-table-row">
			<div class="div-table-2col">
				<div class="fitem">
					<form:label path="tspan">时间间隔</form:label>
					<form:input path="tspan" cssClass="easyui-numberbox" /> (秒)，默认为一小时
				</div>
			</div>
			<div class="div-table-2col">
				<div class="fitem">
					<form:label path="defCount">结果条数</form:label>
					<form:input path="defCount" cssClass="easyui-numberbox" /> 不填写为默认
				</div>
			</div>
			
		</div>
	</div>
	<div class="ftitle">图表链接设置</div>
	<div class="div-table">
		<div class="div-table-row">
			<div class="div-table-2col">
				<div class="fitem">
				<form:label path="linkedchart">启用图表链接</form:label>
				<form:select path="linkedchart">
					<form:option value="0">禁用</form:option>
					<form:option value="1">启用一级图表</form:option>
					<form:option value="2">启用二级图表</form:option>
				</form:select>	
				</div>
			</div>
			<div class="div-table-2col">
				<div class="fitem">
				<form:label path="linkedcharttype">图表类型</form:label>
				<form:select path="linkedcharttype">
						<optgroup label="单系列图表">
							<form:option value="Column2D.swf">2D柱形图</form:option>
							<form:option value="Column3D.swf">3D柱形图</form:option>
							<form:option value="Pie2D.swf">2D饼形图</form:option>
							<form:option value="Pie3D.swf">3D饼形图</form:option>
							<form:option value="Line.swf">线形图</form:option>
							<form:option value="Area2D.swf">面积图</form:option>
							<form:option value="Bar2D.swf">条形图</form:option>
							<form:option value="Doughnut2D.swf">2D圆环图</form:option>
							<form:option value="Doughnut3D.swf">3D圆环图</form:option>
							<form:option value="Pareto2D.swf">2D排列图</form:option>
							<form:option value="Pareto3D.swf">3D排列图</form:option>
						</optgroup>
					</form:select>
				</div>
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-2col">
				<div class="fitem" id="oneleveltitleitem">
				<form:label path="oneleveltitle">一级图表标题</form:label>
				<form:input path="oneleveltitle"/>
				</div>
			</div>
			<div class="div-table-2col">
				<div class="fitem" id="twoleveltitleitem">
				<form:label path="twoleveltitle">二级图表标题</form:label>
				<form:input path="twoleveltitle"/>
				</div>
			</div>
		</div>
	</div>


	<div class="ftitle">报表设置</div>
	<div class="div-table">
		<div class="div-table-row">
			<div class="div-table-2col">
				<div class="fitem">
					<form:label path="displayReport">开启显示报表</form:label>
					<form:radiobutton path="displayReport" value="true" />
					启用
					<form:radiobutton path="displayReport" value="false" />
					禁用
				</div>
			</div>
		</div>
	</div>
	
	<div class="ftitle">数据来源</div>
	<div class="div-table">
		<div class="div-table-row">
			<div class="div-table-col">
				<div class="fitem">
					<form:label path="buildId">目标建筑</form:label>
					<form:input path="buildId" required="true" />
					<form:hidden path="settingWsUrl" />
					<span class="taglib-icon-help"> <img title="设置数据来源建筑"
						src="/html/themes/classic/images/portlet/help.png" /> </span>
				</div>
			</div>
		</div>
		
		<div class="div-table-row" id="energyContainer">
			<div class="div-table-4col">
				<div class="fitem">
					<form:label path="energyName">能源类型</form:label>
					<form:select path="energyName">
						<form:options items="${energydicts}" itemValue="energydictId" itemLabel="energydictName" />
					</form:select>
				</div>
			</div>
			<div class="div-table-4col">
				<div class="fitem">
					<form:label path="rateType">能源转换</form:label>
					<form:select path="rateType">
						<form:option value="0">不转换</form:option>
						<form:option value="1">标准煤</form:option>
						<form:option value="2">标准电</form:option>
					</form:select>
					<form:hidden path="energyRate" />
				</div>
			</div>
		</div>
		
		
		
		<div class="div-table-row" id="tagidsContainer">
			<div class="div-table-col">
				<div class="fitem">
					<form:label path="tagids">设备变量ID</form:label>
					<br />
					<c:forTokens var="str" items="${chartsetting.formula}" delims=","
						varStatus="status">
						<label>Serie${status.count}</label>
						<c:forTokens var="entry" items="${str}" delims=":"
							varStatus="entryStatus">
							<c:choose>
								<c:when test="${entryStatus.index==0}">
										名称：<input id="category${status.count}"
										name="category${status.count}" value="${entry}" type="text" class="taginfo" />
								</c:when>
								<c:otherwise>
										TagIDs：<input id="serie${status.count}"
										name="serie${status.count}" value="${entry}" type="text"  class="taginfo"  style="width:400px;" />
										<span class="taglib-icon-help"> <img title="TagID可以是单个ID,也可以是计算表达式,表达式只支持如下类似格式 (5780*1.2)+(5781*1.3),每个算式之必须使用括号,不支持(5780+5781)*1.2之类的算式"
						src="/html/themes/classic/images/portlet/help.png" /> </span>
									<br />
								</c:otherwise>
							</c:choose>
						</c:forTokens>

						<c:if test="${status.last and status.count<30}">
							<c:forEach var="i" begin="${status.count+1}" end="30" step="1">
								<label>Serie${i}</label> 名称：<input id="category${i}"
									name="category${i}" type="text"  class="taginfo"  /> TagIDs：<input
									id="serie${i}" name="serie${i}" type="text" style="width:400px;"  class="taginfo"   /><span class="taglib-icon-help"> <img title="TagID可以是单个ID,也可以是计算表达式,表达式只支持如下类似格式 (5780*1.2)+(5781*1.3),每个算式之必须使用括号,不支持(5780+5781)*1.2之类的算式"
						src="/html/themes/classic/images/portlet/help.png" /> </span>
								<br />
							</c:forEach>
						</c:if>
					</c:forTokens>
				</div>
			</div>
		</div>
	</div>

</form:form>
<div id="buttons">
	<a href="#" class="easyui-linkbutton" iconCls="icon-ok"
		onclick="<portlet:namespace/>savePreference()">保存首选项</a>
		
			<a href="#"
		class="easyui-linkbutton" iconCls="icon-back"
		onclick="location.href='<portlet:renderURL portletMode="view"></portlet:renderURL>'">取消</a>
</div>
<script language="javascript">

	$(function(){
		$("#enUsePyaxisname").hide();
		$("input[name='usePyaxisname']").click(function(){
			var checked = $("input[name='usePyaxisname']:checked").val();
			if(checked=="true"){
				$("#enUsePyaxisname").show();
				$("#disUsePyaxisname").hide();
			} else {
				$("#enUsePyaxisname").hide();
				$("#disUsePyaxisname").show();
			}
		});

		<c:choose>
			<c:when test="${!empty chartsetting.defStarttime and chartsetting.defStarttime=='custom'}">
				$("#starttimeValueWrap").show();
			</c:when>
			<c:otherwise>
				$("#starttimeValueWrap").hide();
			</c:otherwise>
		</c:choose>
			
		<c:choose>
			<c:when test="${!empty chartsetting.defEndtime and chartsetting.defEndtime=='custom'}">
				$("#endtimeValueWrap").show();
			</c:when>
			<c:otherwise>
				$("#endtimeValueWrap").hide();
			</c:otherwise>
		</c:choose>
		
		<c:choose>
			<c:when test="${!empty chartsetting.linkedchart and chartsetting.linkedchart=='1'}">
				$("input[name='oneleveltitle']").attr("disabled",false);
				$("input[name='twoleveltitle']").attr("disabled",true);
				$("select[name='linkedcharttype']").attr("disabled",false);
			</c:when>
			<c:when test="${!empty chartsetting.linkedchart and chartsetting.linkedchart=='2'}">
				$("input[name='oneleveltitle']").attr("disabled",false);
				$("input[name='twoleveltitle']").attr("disabled",false);
				$("select[name='linkedcharttype']").attr("disabled",false);
			</c:when>
			<c:otherwise>
				$("input[name='oneleveltitle']").attr("disabled",true);
				$("input[name='twoleveltitle']").attr("disabled",true);
				$("select[name='linkedcharttype']").attr("disabled",true);
			</c:otherwise>
		</c:choose>
		
		$("#linkedchart").change(function(){
			var linkedchart = $("#linkedchart").val();
			if(linkedchart==0) {
				$("input[name='oneleveltitle']").attr("disabled",true);
				$("input[name='twoleveltitle']").attr("disabled",true);
				$("select[name='linkedcharttype']").attr("disabled",true);
			} else if(linkedchart==1) {
				$("input[name='oneleveltitle']").attr("disabled",false);
				$("input[name='twoleveltitle']").attr("disabled",true);
				$("select[name='linkedcharttype']").attr("disabled",false);
			} else if(linkedchart==2) {
				$("input[name='oneleveltitle']").attr("disabled",false);
				$("input[name='twoleveltitle']").attr("disabled",false);
				$("select[name='linkedcharttype']").attr("disabled",false);
			};
		});
		
		
		
		
		var $slantLabels = $("input[name='slantLabels']");
		$slantLabels.attr("disabled",true);
		var $labelDisplay = $("#labelDisplay");
		if($labelDisplay.val()=="rotate") {
			$slantLabels.attr("disabled",false);
		}
		
		$labelDisplay.change(function(){
			console.log($(this));
			$slantLabels.attr("disabled",$(this).val()!="rotate");
		});
		
		
		$dataFormat = $("#dataFormat");
		$dataContentContainter = $("#dataContentContainter");
		$tagidsContainer = $("#tagidsContainer");
		setShowOrHideXml();
		$dataFormat.change(function(){
			setShowOrHideXml();
		});
		
		function setShowOrHideXml() {
			if($dataFormat.val()=="xml") {
				$dataContentContainter.show();
				$tagidsContainer.hide();
			 } else if($dataFormat.val()=="database") {
				 $dataContentContainter.hide();
				 $tagidsContainer.hide();
			 }else if($dataFormat.val()=="json" || $dataFormat.val()=="jsonurl" || $dataFormat.val()=="xmlurl") {
				 $tagidsContainer.show();
				 $dataContentContainter.hide();
			 } else {
				 $dataContentContainter.hide();
				 $tagidsContainer.show();
			}
		}
		
		/* $('#color').colorpicker({
			format: 'hex'
		}); */
		
		var energydicts = [];
		energydicts.length = 0;
		<c:forEach items="${energydicts}" var="item">
		energydicts.push({"id":'${item.energydictId}',"rate":'${item.energydictRate}',"electricity":'${item.energyDictRateElectricity}'});
		</c:forEach>
		
		$("#rateType").change(function(){
			setEnergyRate();
		});
		
		$("#energyName").change(function(){
			setEnergyRate();
		});
		
		//设置能耗类型转换系数
		function setEnergyRate() {
			var rateTypeVal = $("#rateType").val();
			var energyId = $("#energyName").val();
			for(var i=0;i<=energydicts.length;i++) {
				if(energydicts[i].id==energyId) {
					if(rateTypeVal==1) {
						var rate = energydicts[i].rate=="" ? 1 : energydicts[i].rate;
						$("#energyRate").val(rate);
					} else if (rateTypeVal==2){
						var elecRate = energydicts[i].electricity=="" ? 1 : energydicts[i].electricity;
						$("#energyRate").val(elecRate);
					} else {
						$("#energyRate").val("1");
					}
				}
			}
			
			
		}
	});

	/**
	* 设置显示和隐藏自定义开始时间
	*/
	$("#defStarttime").combobox({
		onSelect:function(val) {
			if(val.value=='custom') {
				$("#starttimeValueWrap").show();
			} else {
				$("#starttimeValueWrap").hide();
			}
		}
	});
	
	/**
	* 设置显示和隐藏自定义结束时间
	*/
	$("#defEndtime").combobox({
		onSelect:function(val) {
			if(val.value=='custom') {
				$("#endtimeValueWrap").show();
			} else {
				$("#endtimeValueWrap").hide();
			}
		}
	});
	
	/**
	* 保存首选项信息
	*/
	function <portlet:namespace/>savePreference() {
		$("#chartsetting").form('submit', {
			url:'<%=renderResponse.encodeURL(savePrefUrl)%>',
			onSubmit : function() {
				return $(this).form('validate');
			},
			success: function(result){
				$("#msg").addClass("portlet-msg-success").html("您的请求已处理成功。");
			}
		});
	}

	/**
	* 获取建筑信息列表
	*/
	$("#buildId").combogrid({
		panelWidth:500,
		value:$("#buildId").val(),
		idField:'buildId',
		textField:'buildName',
		pagination : true,//是否分页  
		rownumbers:true,
		fit: true,
		pageSize: 10,
		pageList: [10,20,30,40,50],
		url:'<portlet:resourceURL id="getBuildinfos"></portlet:resourceURL>',
		columns:[[
			{field:'buildId',title:'建筑编号',width:100},
			{field:'buildName',title:'建筑名称',width:100}
		]],keyHandler: {
			up: function(){},
			down: function(){},
			enter: function(){},
			query: function(q){
				$('#buildId').combogrid("grid").datagrid("reload", { 'keyword': q });
	            $('#buildId').combogrid("setValue", q);
			}
		}
	});

</script>
