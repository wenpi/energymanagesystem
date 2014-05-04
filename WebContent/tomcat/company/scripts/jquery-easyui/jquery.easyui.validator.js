$.extend($.fn.validatebox.defaults.rules, {  
    alpha:{  
        validator:function(value,param){  
            if (value){  
                return /^[a-zA-Z\u00A1-\uFFFF]*$/.test(value);  
            } else {  
                return true;  
            }  
        },  
        message:'只能输入字母.'  
    },  
    alphanum:{  
        validator:function(value,param){  
            if (value){  
                return /^([a-zA-Z\u00A1-\uFFFF0-9])*$/.test(value);  
            } else {  
                return true;  
            }  
        },  
        message:'只能输入字母和数字.'  
    },  
    positive_int:{  
        validator:function(value,param){  
            if (value){  
                return /^[0-9]*[1-9][0-9]*$/.test(value);  
            } else {  
                return true;  
            }  
        },  
        message:'只能输入正整数.'  
    },  
    numeric:{  
        validator:function(value,param){  
            if (value){  
                return /^[0-9]*(\.[0-9]+)?$/.test(value);  
            } else {  
                return true;  
            }  
        },  
        message:'只能输入数字.'  
    },  
    chinese:{  
        validator:function(value,param){  
	        if (value){  
	             return /[^\u4E00-\u9FA5]/g.test(value);  
	        } else {  
	            return true;  
	        }  
        },  
    	message:'只能输入中文'  
    } ,
    url:{  
        validator:function(value,param){  
        if (value){  
            return /(((https?)|(ftp)):\/\/([\-\w]+\.)+\w{2,3}(\/[%\-\w]+(\.\w{2,})?)*(([\w\-\.\?\\\/+@&#;`~=%!]*)(\.\w{2,})?)*\/?)/i.test(value);  
        } else {  
            return true;  
        }  
    },  
    message:'只能输入中文'  
    } 
          
});