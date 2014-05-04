<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../init.jsp"%>
<!-- HTML START -->
<!-- 
	AUTHOR: CHENPING
	Created Date: 2012-7-23 下午05:13:09
	LastModified Date:
	Description:
 -->
<style type="text/css">
<!--
.search {
	margin: 4px;
}

.search input {
	padding: 4px 0;
	width: 120px;
}

.reporttb {
		border:1px solid #ECE9D8;
	}
	.reporttb th {
		background:#ebebeb;
		padding:4px;
		text-align:center;
	}
	
	.reporttb td {
		text-align:center;
		border:1px solid #ECE9D8;
		padding:4px;
	}
-->
</style>
<form id="<portlet:namespace />search" class="search">
	从<input id="<portlet:namespace />from" name="<portlet:namespace />from"
		type="text" />至<input id="<portlet:namespace />to"
		name="<portlet:namespace />to" type="text" /> <a href="#"
		class="easyui-linkbutton" plain="true" iconCls="icon-search"
		onclick="<portlet:namespace />search();">确定</a>
</form>
<script language="javascript" type="text/javascript">

        var timer100_counter = 0;
        var timer_interval = 3;  //10m刷新一次
 
        //报警设备ID
        $(document).ready(function () {
           setInterval('on_timer()', 100);
        });
       
        /**
        * 定时读取
        */
        function on_timer() {
            if ((timer100_counter % (timer_interval * 10)) == 0) {
                do_ReadActiveAlarm();
            }
            timer100_counter++;
        }

 
        //读取指定的报警信息
        function do_ReadActiveAlarm() {
            $.post("<portlet:resourceURL id="getAlarmList"></portlet:resourceURL>", function (response) {
                var alarmContent = "<table cellspacing=\"1\" cellpadding=\"4\" border=\"0\" width=\"100%\" class=\"reporttb\"> ";
                alarmContent += "<tr><th>时间</th><th>事件</th><th>类型</th><th>设备</th>";
                alarmContent += "<th>报警备注</th></tr>";
                if (response == null)
                    return false;
 
                 $.each(response, function (i, obj) {
 
                    alarmContent += " <tr id='" + obj.TagID + "' class=''> "
							+ "<td>" + obj.eventtime + "</td>"
							+ "<td>" + getAlarmState(obj.alarmstate) + "</td>"
							+ "<td>" + getAlarmType(obj.alarmtype) + "</td>"
							+ "<td>" + obj.devicename + "</td>"
							+ "<td>" + obj.alarmcomment + "</td>"
							+ "</tr>";
 
                }); 
                alarmContent += "</table>";
                $("#messagebox").html(alarmContent);
            });
        }
 

      //返回报警状态
      function getAlarmState(AlarmState) {
          if (AlarmState != null) {
              if (AlarmState == "1") {
      			AlarmState = "报警";
      		} 
      		if(AlarmState == "2") {
      			AlarmState = "恢复";
      		}
              if (AlarmState == "3") {
                  AlarmState = "应答";
                  cssClass = "blue";
              }
          }
          return AlarmState;
      }

      //返回报警类型
      function getAlarmType(AlarmType) {
          if (AlarmType != null) {
              switch (AlarmType) {
                  case "1":
                      AlarmType = "低低报警";
                      break;
                  case "2":
                      AlarmType = "低报警";
                      break;
                  case "4":
                      AlarmType = "高报警";
                      break;
                  case "8":
                      AlarmType = "高高报警";
                      break;
                  case "256":
                      AlarmType = "开报警";
                      break;
                  case "512":
                      AlarmType = "关报警";
                      break;
              }
              return AlarmType;
          }
      }
    </script>
<div id="messagebox"></div>


