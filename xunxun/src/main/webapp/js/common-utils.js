function submitPageForm(formName,pageNo,pageSize){
	if (!isDigit(pageNo)) {
		alert("跳转页码，请输入正整数。");
		return false;
	}
	if (parseInt(pageNo) <= 0) {
		pageNo = 1;
	}
	var totalPages = $('#totalPages').text();
	if (parseInt(pageNo) > parseInt(totalPages)) {
		pageNo = totalPages;
	}
	//var curPage = $('#curPage').text();
	//if (parseInt(pageNo) == parseInt(curPage)) {
		//return false;
	//}
	var frm = document.getElementById(formName);
	var elmPageNo;
	var pageNoInput = document.getElementById("page.pageNo");
	if (pageNoInput == null || typeof (pageNoInput) == 'undefined') {
		elmPageNo = document.createElement('input');
		elmPageNo.type = "hidden";
		elmPageNo.name = "page.pageNo";
	} else {
		elmPageNo = pageNoInput;
	}
	var elmPageSize;
	var pageSizeInput = document.getElementById("page.pageSize");
	if (pageSizeInput == null || typeof (pageSizeInput) == 'undefined') {
		elmPageSize = document.createElement('input');
		elmPageSize.type = "hidden";
		elmPageSize.name = "page.pageSize";
	} else {
		elmPageSize = pageSizeInput;
	}
	elmPageNo.value = pageNo;
	elmPageSize.value = pageSize;
	frm.appendChild(elmPageNo);
	frm.appendChild(elmPageSize);
	frm.submit();
}

function aAlert(str){
	var msgw,bordercolor;
	msgw=400;//提示窗口的宽度
	titleheight=25; //提示窗口标题高度
	bordercolor="#336699";//提示窗口的边框颜色
	titlecolor="#99CCFF";//提示窗口的标题颜色
	
	var sWidth,sHeight;
	sWidth=document.body.offsetWidth;
	sHeight=document.body.offsetHeight;
	if (sHeight<screen.height)
	{
		sHeight=screen.height;
	}
	var arrayPageSize   = getPageSize();//调用getPageSize()函数
	sHeight = arrayPageSize[1] + 35;
	var bgObj=document.createElement("div");
	bgObj.setAttribute('id','bgDiv');
	bgObj.style.position="absolute";
	bgObj.style.top="0";
	bgObj.style.background="#777";
	bgObj.style.filter="progid:DXImageTransform.Microsoft.Alpha(style=3,opacity=25,finishOpacity=75";
	bgObj.style.opacity="0.6";
	bgObj.style.left="0";
	bgObj.style.width=sWidth + "px";
	bgObj.style.height=sHeight + "px";
	bgObj.style.zIndex = "10000";
	document.body.appendChild(bgObj);
	//隐藏所有select yinlei
	var objhidden=document.getElementsByTagName('select');
	for(var i=0;i<objhidden.length;i++){
		objhidden[i].style.visibility="hidden";
	}

	var msgObj=document.createElement("div");
	msgObj.setAttribute("id","msgDiv");
	msgObj.setAttribute("align","center");
	msgObj.style.background="white";
	msgObj.style.border="1px solid " + bordercolor;
	msgObj.style.position = "absolute";
	msgObj.style.left = "50%";
	msgObj.style.top = "50%";
	msgObj.style.font="12px/1.6em Verdana, Geneva, Arial, Helvetica, sans-serif";
	msgObj.style.marginLeft = "-225px" ;
	msgObj.style.marginTop = -75+document.documentElement.scrollTop+"px";
	msgObj.style.width = msgw + "px";
	msgObj.style.textAlign = "center";
	msgObj.style.zIndex = "99990001";

   var title=document.createElement("h4");
   title.setAttribute("id","msgTitle");
   title.setAttribute("align","left");
   title.style.margin="0";
   title.style.padding="3px";
   title.style.background=bordercolor;
   title.style.filter="progid:DXImageTransform.Microsoft.Alpha(startX=20, startY=20, finishX=100, finishY=100,style=1,opacity=75,finishOpacity=100);";
   title.style.opacity="0.75";
   title.style.border="1px solid " + bordercolor;
   title.style.height="18px";
   title.style.font="12px Verdana, Geneva, Arial, Helvetica, sans-serif";
   title.style.fontWeight="bold";
   title.style.color="white";
   title.style.cursor="pointer";
   title.innerHTML="温馨提醒您";
   title.onclick=function(){
		document.body.removeChild(bgObj);
		document.getElementById("msgDiv").removeChild(title);
		document.body.removeChild(msgObj);
		};
   document.body.appendChild(msgObj);
   document.getElementById("msgDiv").appendChild(title);

   var txt=document.createElement("span");
   txt.style.margin="1em 0";
   txt.setAttribute("id","msgTxt");
   txt.innerHTML=str;
   txt.style.background="white";
   document.getElementById("msgDiv").appendChild(txt);

   var btnObj=document.createElement("div");
	btnObj.setAttribute("id","btnDiv");
	btnObj.setAttribute("align","bottom");
	btnObj.style.width = msgw + "px";		
	btnObj.style.textAlign = "right";
	btnObj.style.background="white";
	btnObj.style.marginBottom = "15px" ;
	document.getElementById("msgDiv").appendChild(btnObj);

	var bok = document.createElement("input"); 
	bok.setAttribute("id", "btnOk"); 
	bok.setAttribute("value", "确定"); 
	bok.setAttribute("type", "button"); 
	bok.style.marginRight = "50px" ;
	bok.style.marginTop = "10px" ;
	bok.style.marginBottom = "5px" ;
	bok.style.height="20px";
	bok.style.width="50px";
	bok.setAttribute("align","right");
	bok.className='';
	bok.onclick=function(){
		document.body.removeChild(bgObj);
		document.getElementById("msgDiv").removeChild(title);
		document.body.removeChild(msgObj);
		//恢复显示所有select yinlei
		var objhidden=document.getElementsByTagName('select');
		for(var i=0;i<objhidden.length;i++){
			objhidden[i].style.visibility="";
		}
	};
	document.getElementById("btnDiv").appendChild(bok);
}

//获取滚动条的高度
function getPageScroll() {
	var yScroll = null;
	if (self.pageYOffset) {
		yScroll = self.pageYOffset;
	} else if (document.documentElement && document.documentElement.scrollTop) {
		yScroll = document.documentElement.scrollTop;
	} else if (document.body) {
		yScroll = document.body.scrollTop;
	}
	arrayPageScroll = new Array('', yScroll);
	return arrayPageScroll;
}
  //获取页面实际大小
function getPageSize() {
	var xScroll = null, yScroll;
	if (window.innerHeight && window.scrollMaxY) {
		xScroll = document.body.scrollWidth;
		yScroll = window.innerHeight + window.scrollMaxY;
	} else if (document.body.scrollHeight > document.body.offsetHeight) {
		sScroll = document.body.scrollWidth;
		yScroll = document.body.scrollHeight;
	} else {
		xScroll = document.body.offsetWidth;
		yScroll = document.body.offsetHeight;
	}
	var windowWidth = 0, windowHeight = 0;
	if (self.innerHeight) {
		windowWidth = self.innerWidth;
		windowHeight = self.innerHeight;
	} else if (document.documentElement
			&& document.documentElement.clientHeight) {
		windowWidth = document.documentElement.clientWidth;
		windowHeight = document.documentElement.clientHeight;
	} else if (document.body) {
		windowWidth = document.body.clientWidth;
		windowHeight = document.body.clientHeight;
	}
	var pageWidth, pageHeight;
	if (yScroll < windowHeight) {
		pageHeight = windowHeight;
	} else {
		pageHeight = yScroll;
	}
	if (xScroll < windowWidth) {
		pageWidth = windowWidth;
	} else {
		pageWidth = xScroll;
	}
	arrayPageSize = new Array(pageWidth, pageHeight, windowWidth, windowHeight);
	return arrayPageSize;

}

function isDigit(s) {
	var patrn = /^[0-9]{0,20}$/;
	if (!patrn.exec(s)) {
		return false;
	}
	return true;
}
function isValidChar(str) { 
	var valid=/[\'\"\,\<\>\+\*\^\=\!\&\|\{\}\:\;\~\`\#]+/; 
	return (valid.test(str));
}
/**
 * 返回金额的大写
 * @param currencyDigits 要转换的数据
 * @returns
 */
function convertCurrency(currencyDigits) {
	var MAXIMUM_NUMBER = 99999999999.99;
	var CN_ZERO = "\u96f6";
	var CN_ONE = "\u58f9";
	var CN_TWO = "\u8d30";
	var CN_THREE = "\u53c1";
	var CN_FOUR = "\u8086";
	var CN_FIVE = "\u4f0d";
	var CN_SIX = "\u9646";
	var CN_SEVEN = "\u67d2";
	var CN_EIGHT = "\u634c";
	var CN_NINE = "\u7396";
	var CN_TEN = "\u62fe";
	var CN_HUNDRED = "\u4f70";
	var CN_THOUSAND = "\u4edf";
	var CN_TEN_THOUSAND = "\u4e07";
	var CN_HUNDRED_MILLION = "\u4ebf";
	//var CN_SYMBOL = "￥:";
	var CN_SYMBOL = "";
	var CN_DOLLAR = "\u5143";
	var CN_TEN_CENT = "\u89d2";
	var CN_CENT = "\u5206";
	var CN_INTEGER = "\u6574";
	
	var integral;	//整数部分
	var decimal;	//小数部分
	var outputCharacters;	//输出结果
	var parts;
	var digits, radices, bigRadices, decimals;
	var zeroCount;
	var i, p, d;
	var quotient, modulus;

	// Validate input string:
	currencyDigits = currencyDigits.toString();
	if (currencyDigits == "") {
		return "";
	}
	if (currencyDigits.match(/[^,.\d]/) != null) {
		alert("\u6570\u5b57\u4e2d\u542b\u6709\u975e\u6cd5\u5b57\u7b26!");
		return "";
	}
	if ((currencyDigits).match(/^((\d{1,3}(,\d{3})*(.((\d{3},)*\d{1,3}))?)|(\d+(.\d+)?))$/) == null) {
		return "";
	}
	
	// Normalize the format of input digits:
	currencyDigits = currencyDigits.replace(/,/g, "");	// Remove comma delimiters.
	currencyDigits = currencyDigits.replace(/^0+/, "");	// Trim zeros at the beginning.
	// Assert the number is not greater than the maximum number.
	if (Number(currencyDigits) > MAXIMUM_NUMBER) {
		alert("\u8d85\u51fa\u8f6c\u6362\u6700\u5927\u8303\u56f4!");
		return "";
	}
	
	//转换前，将整数部分和小数部分分开
	parts = currencyDigits.split(".");
	if (parts.length > 1) {
		integral = parts[0];
		decimal = parts[1];
		// Cut down redundant decimal digits that are after the second.
		decimal = decimal.substr(0, 2);
	} else {
		integral = parts[0];
		decimal = "";
	}
	// Prepare the characters corresponding to the digits:
	digits = new Array(CN_ZERO, CN_ONE, CN_TWO, CN_THREE, CN_FOUR, CN_FIVE, CN_SIX, CN_SEVEN, CN_EIGHT, CN_NINE);
	radices = new Array("", CN_TEN, CN_HUNDRED, CN_THOUSAND);
	bigRadices = new Array("", CN_TEN_THOUSAND, CN_HUNDRED_MILLION);
	decimals = new Array(CN_TEN_CENT, CN_CENT);
	
	outputCharacters = "";
	//如果大于0，处理整数部分
	if (Number(integral) > 0) {
		zeroCount = 0;
		for (i = 0; i < integral.length; i++) {
			p = integral.length - i - 1;
			d = integral.substr(i, 1);
			quotient = p / 4;
			modulus = p % 4;
			if (d == "0") {
				zeroCount++;
			} else {
				if (zeroCount > 0) {
					outputCharacters += digits[0];
				}
				zeroCount = 0;
				outputCharacters += digits[Number(d)] + radices[modulus];
			}
			if (modulus == 0 && zeroCount < 4) {
				outputCharacters += bigRadices[quotient];
			}
		}
		outputCharacters += CN_DOLLAR;
	}
	//如果有处理小数部分
	if (decimal != "") {
		for (i = 0; i < decimal.length; i++) {
			d = decimal.substr(i, 1);
			if (d != "0") {
				outputCharacters += digits[Number(d)] + decimals[i];
			}
		}
	}
	//确认返回最终的字符
	if (outputCharacters == "") {
		outputCharacters = CN_ZERO + CN_DOLLAR;
	}
	if (decimal == "") {
		outputCharacters += CN_INTEGER;
	}
	outputCharacters = CN_SYMBOL + outputCharacters;
	return outputCharacters;
}

/**
 * 将文本转成boolean
 * @param value 要转换的文本值
 * @param type 是否数字化，1是，0否
 */
function toBool(value, type) {
	var temp = '';
	if (value == '是') {
		if (type == 1) {
			temp = '1';
		} else {
			temp = 'true';
		}
	} else if (value == '否') {
		if (type == 1) {
			temp = '0';
		} else {
			temp = 'false';
		}
	}
	return temp;
}

/**
 * 将boolean转成文本值
 * @param value 要转换的文本值
 */
function fromBool(value) {
	var temp = '';
	if (value == 'true') {
		temp = '是';
	} else if (value == 'false') {
		temp = '否';
	} else if (value == 1) {
		temp = '是';
	} else if (value == 0) {
		temp = '否';
	}
	return temp;
}