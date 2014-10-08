var publicTime = '2014-07-20'; //全局的时间属性，如果设置了这个属性，则系统默认使用该时间，格式为（年-月-日）
var report_pageSize = 12; // 报表管理中放大页面的分页条数 
var isShowRightTool = true; // false则不显示右侧工具集，true则显示
var _todayTime = new Date().getFullYear() + "-" + (new Date().getMonth() + 1) + "-" + new Date().getDate();

$(function() {
	try {
		$('#common_import').dialog('close'); // 隐藏dialog导入窗口
	} catch (e) {
	}
});

function confirmRemove() {
	return confirm("你确定要删除吗?");
}

//格式化数字格式，如：123456.789格式化成123,456.789
function formatNumber(numStr, separator) {
	return (numStr + "").replace(/(\d{3})\B/g, "$1" + (!separator ? "," : separator));
}

// 设置隐藏的文件名称，供导入用
function insertTitle(tValue){
 	var t1 = tValue.lastIndexOf("\\");
   	var t2 = tValue.lastIndexOf("\.");
   	if(t1 >= 0 && t1 < t2 && t1 < tValue.length){
   		document.getElementById("common_fileSuffix").value = tValue.substring(t2 + 1);
   		document.getElementById("common_filePath").value = tValue;
    	document.getElementById("common_fileName").value = tValue.substring(t1 + 1, t2);
   	}
}

// 提交导入excel的form
function common_import_submit(){
	var filesuffix = $("#common_fileSuffix").val(); // 后缀
	var filename = $("#common_fileName").val(); // 文件名称
	if(filesuffix != 'xls') {
		alert("请选择文件后缀为xls的文件导入！");
		return false;
	}
	if(filename == '') {
		alert("请选择要导入的文件！");
		return false;
	}
	
	$("#importForm").attr("action", importUrl + "&common_type=" + $("#common_type").val());
	$("#importForm").submit();
	$('#common_import').dialog('close');
}

// 共用的导入excel
function import_common_excel(type) {
	document.getElementById("common_type").value = type;
	document.getElementById("common_fileName").value = '';
	document.getElementById("common_myFile").value = '';
	
	var title = '导入电表';
	if (type == "electricity") {
		title = '导入电表';
	} else if (type == "water") {
		title = '导入水表';
	} else if (type == "gas") {
		title = '导入气表';
	}
	$('#common_import').dialog({ height: 210, width: 513, title: title }).dialog('open'); //修改标题 
}

// 修改按钮的颜色，针对右侧工具集
function changeBtnColor($thisdom,thisclass){
	switch(thisclass) {
		case "traffic" :
			if ($thisdom.hasClass("green")) {
				return false;
			} else {
				$thisdom.addClass("green");
			}
			break;
		case "building" :
			if ($thisdom.hasClass("red")) {
				return false;
			} else {
				$thisdom.addClass("red");
			}
			break;
		case "reduce_carbon" :
			if ($thisdom.hasClass("normalgreen")) {
				return false;
			} else {
				$thisdom.addClass("normalgreen");
			}
			break;
		default :
			return false;
	}
}

// hashMap
function HashMap() {
    var size = 0; // Map大小
    var entry = new Object(); // 对象
    this.put = function(key, value) { // Map的存put方法
        if (!this.containsKey(key)) {
            size++;
            entry[key] = value;
        }
    };
    this.get = function(key) { // Map取get方法
        return this.containsKey(key) ? entry[key] : null;
    };
    this.remove = function(key) { // Map删除remove方法
        if (this.containsKey(key) && (delete entry[key])) {
            size--;
        }
    };
    this.containsKey = function(key) { // 是否包含Key
        return (key in entry);
    };
    this.containsValue = function(value) { // 是否包含Value
        for ( var prop in entry) {
            if (entry[prop] == value) {
                return true;
            }
        }
        return false;
    };
    this.values = function() { // 所有的Value
        var values = new Array();
        for ( var prop in entry) {
            values.push(entry[prop]);
        }
        return values;
    };
    this.keys = function() { // 所有的 Key
        var keys = new Array();
        for ( var prop in entry) {
            keys.push(prop);
        }
        return keys;
    };
    this.size = function() { // Map size
        return size;
    };
    this.clear = function() { // 清空Map
        size = 0;
        entry = new Object();
    };
};