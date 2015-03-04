var cal;   
var isFocus=false; //\u662f\u5426\u70ba\u7126\u9ede   
var pickMode ={   
    "second":1,   
    "minute":2,   
    "hour":3,   
    "day":4,   
    "month":5,   
    "year":6  };   
       
var topY=0,leftX=0;  //\u81ea\u5b9a\u7fa9\u5b9a\u4f4d\u504f\u79fb\u91cf 2007-02-11 \u7531 \u5bd2\u7fbd\u6953\u6dfb\u52a0   
//\u9078\u64c7\u65e5\u671f \u2192 \u7531 \u5bd2\u7fbd\u6953 2007-06-10 \u6dfb\u52a0\uff0c\u901a\u904e ID \u4f86\u9078\u65e5\u671f   
function SelectDateYLById(id,strFormat,x,y)   
{   
    var obj = document.getElementById(id);   
    if(obj == null){return false;}   
    obj.focus();   
    if(obj.onclick != null){obj.onclick();}   
    else if(obj.click != null){obj.click();}   
    else{SelectDateYL(obj,strFormat,x,y);}  
}   
  
//\u9078\u64c7\u65e5\u671f \u2192 \u7531 \u5bd2\u7fbd\u6953 2006-06-25 \u6dfb\u52a0   
function SelectDateYL(obj,strFormat,x,y)   
{   
  
    leftX =(x == null) ? leftX : x;   
    topY  =(y == null) ? topY : y;//\u81ea\u5b9a\u7fa9\u5b9a\u4f4d\u504f\u79fb\u91cf 2007-02-11 \u7531 \u5bd2\u7fbd\u6953\u6dfb\u52a0    
    if(document.getElementById("ContainerPanel")==null){InitContainerPanel();}   
    var date = new Date();   
    var by = date.getFullYear()-10;  //\u6700\u5c0f\u503c \u2192 50 \u5e74\u524d   
    var ey = date.getFullYear()+20;  //\u6700\u5927\u503c \u2192 50 \u5e74\u5f8c   
    //cal = new Calendar(by, ey,1,strFormat);    //\u521d\u59cb\u5316\u82f1\u6587\u7248\uff0c0 \u70ba\u4e2d\u6587\u7248   
    cal = (cal==null) ? new Calendar(by, ey, 0) : cal;    //\u4e0d\u7528\u6bcf\u6b21\u90fd\u521d\u59cb\u5316 2006-12-03 \u4fee\u6b63   
    cal.DateMode =pickMode["second"]; //\u5fa9\u4f4d   
      if(strFormat.indexOf('s')< 0) {cal.DateMode =pickMode["minute"];}//\u7cbe\u5ea6\u70ba\u5206   
      if(strFormat.indexOf('m')< 0) {cal.DateMode =pickMode["hour"];}//\u7cbe\u5ea6\u70ba\u6642   
      if(strFormat.indexOf('h')< 0) {cal.DateMode =pickMode["day"];}//\u7cbe\u5ea6\u70ba\u65e5   
      if(strFormat.indexOf('d')< 0) {cal.DateMode =pickMode["month"];}//\u7cbe\u5ea6\u70ba\u6708   
      if(strFormat.indexOf('M')< 0) {cal.DateMode =pickMode["year"];}//\u7cbe\u5ea6\u70ba\u5e74   
      if(strFormat.indexOf('y')< 0) {cal.DateMode =pickMode["second"];}//\u9ed8\u8a8d\u7cbe\u5ea6\u70ba\u79d2   
    cal.dateFormatStyleOld = cal.dateFormatStyle;   
    cal.dateFormatStyle = strFormat;   
    cal.show(obj);   
}   
/**//**//**//**//**//**//**//**  
 * \u8fd4\u56de\u65e5\u671f  
 * @param d the delimiter  
 * @param p the pattern of your date  
 2006-06-25 \u7531 \u5bd2\u7fbd\u6953 \u4fee\u6539\u70ba\u6839\u64da\u7528\u6236\u6307\u5b9a\u7684 style \u4f86\u78ba\u5b9a\uff1b  
 */  
String.prototype.toDate = function(style) {   
  var y = this.substring(style.indexOf('y'),style.lastIndexOf('y')+1);//\u5e74   
  var M = this.substring(style.indexOf('M'),style.lastIndexOf('M')+1);//\u6708   
  var d = this.substring(style.indexOf('d'),style.lastIndexOf('d')+1);//\u65e5   
  var h = this.substring(style.indexOf('h'),style.lastIndexOf('h')+1);//\u6642   
  var m = this.substring(style.indexOf('m'),style.lastIndexOf('m')+1);//\u5206   
  var s = this.substring(style.indexOf('s'),style.lastIndexOf('s')+1);//\u79d2   
  
  if(s == null ||s == "" || isNaN(s)) {s = new Date().getSeconds();}   
  if(m == null ||m == "" || isNaN(m)) {m = new Date().getMinutes();}   
  if(h == null ||h == "" || isNaN(h)) {h = new Date().getHours();}   
  if(d == null ||d == "" || isNaN(d)) {d = new Date().getDate();}   
  if(M == null ||M == "" || isNaN(M)) {M = new Date().getMonth()+1;}   
  if(y == null ||y == "" || isNaN(y)) {y = new Date().getFullYear();}   
  var dt = null;   
  eval ("dt = new Date('"+ y+"', '"+(M-1)+"','"+ d+"','"+ h+"','"+ m+"','"+ s +"')");   
  return dt;   
};   
  
/**//**//**//**//**//**//**//**  
 * \u683c\u5f0f\u5316\u65e5\u671f  
 * @param   d the delimiter  
 * @param   p the pattern of your date  
 * @author  meizz  
 */  
Date.prototype.format = function(style) {   
  var o = {   
    "M+" : this.getMonth() + 1, //month   
    "d+" : this.getDate(),      //day   
    "h+" : this.getHours(),     //hour   
    "m+" : this.getMinutes(),   //minute   
    "s+" : this.getSeconds(),   //second   
    "w+" : "\u5929\u4e00\u4e8c\u4e09\u56db\u4e94\u516d".charAt(this.getDay()),   //week   
    "q+" : Math.floor((this.getMonth() + 3) / 3),  //quarter   
    "S"  : this.getMilliseconds() //millisecond   
  };  
  if(/(y+)/.test(style)) {   
    style = style.replace(RegExp.$1,   
    (this.getFullYear() + "").substr(4 - RegExp.$1.length));   
  }   
  for(var k in o){   
    if(new RegExp("("+ k +")").test(style)){   
      style = style.replace(RegExp.$1,   
        RegExp.$1.length == 1 ? o[k] :   
        ("00" + o[k]).substr(("" + o[k]).length));   
    }   
  }   
  return style;   
};  
  
//2007-09-14  \u7531\u5bd2\u7fbd\u6953\u6dfb\u52a0\u8fd4\u56de\u6240\u9078\u65e5\u671f   
Calendar.prototype.ReturnDate = function(dt) {   
    if (this.dateControl != null){this.dateControl.value = dt;}   
    calendar.hide();   
    if(this.dateControl.onchange == null){return;}     
    //\u5c07 onchange \u8f49\u6210\u5176\u4ed6\u51fd\u6578\uff0c\u4ee5\u514d\u89f8\u767c\u9a57\u8b49\u4e8b\u4ef6   
    var ev = this.dateControl.onchange.toString(); //\u627e\u51fa\u51fd\u6578\u7684\u5b57\u4e32   
    ev = ev.substring(   
            ((ev.indexOf("ValidatorOnChange();")> 0) ? ev.indexOf("ValidatorOnChange();") + 20 : ev.indexOf("{") + 1)   
                , ev.lastIndexOf("}"));//\u53bb\u9664\u9a57\u8b49\u51fd\u6578 ValidatorOnChange();   
    var fun = new Function(ev);     //\u91cd\u65b0\u5b9a\u7fa9\u51fd\u6578   
    this.dateControl.changeEvent = fun;    
    this.dateControl.changeEvent();//\u89f8\u767c\u81ea\u5b9a\u7fa9 changeEvent \u51fd\u6578   
};   
  
/**//**//**//**//**//**//**//**  
 * \u65e5\u66c6\u985e  
 * @param   beginYear 1990  
 * @param   endYear   2010  
 * @param   lang      0(\u4e2d\u6587)|1(\u82f1\u8a9e) \u53ef\u81ea\u7531\u64f4\u5145  
 * @param   dateFormatStyle  "yyyy-MM-dd";  
 * @version 2006-04-01  
 * @author  KimSoft (jinqinghua [at] gmail.com)  
 * @update  
 */  
function Calendar(beginYear, endYear, lang, dateFormatStyle) {   
  this.beginYear = 1950;   
  this.endYear = 2050;   
  this.lang = 0;            //0(\u4e2d\u6587) | 1(\u82f1\u6587)   
  this.dateFormatStyle = "yyyy-MM-dd hh:mm:ss";   
  
  if (beginYear != null && endYear != null){   
    this.beginYear = beginYear;   
    this.endYear = endYear;   
  }   
  if (lang != null){   
    this.lang = lang;  
  }   
  
  if (dateFormatStyle != null){   
    this.dateFormatStyle = dateFormatStyle;  
  }   
  
  this.dateControl = null;   
  this.panel = this.getElementById("calendarPanel");   
  this.container = this.getElementById("ContainerPanel");   
  this.form  = null;   
  
  this.date = new Date();   
  this.year = this.date.getFullYear();   
  this.month = this.date.getMonth();   
     
  this.day = this.date.getDate();   
  this.hour = this.date.getHours();   
  this.minute = this.date.getMinutes();   
  this.second = this.date.getSeconds();   
  
  this.colors = {   
  "cur_word"      : "#FFFFFF",  //\u7576\u65e5\u65e5\u671f\u6587\u5b57\u984f\u8272   
  "cur_bg"        : "#00FF00",  //\u7576\u65e5\u65e5\u671f\u55ae\u683c\u80cc\u5f71\u8272   
  "sel_bg"        : "#6795ED",  //\u5df2\u88ab\u9078\u64c7\u7684\u65e5\u671f\u55ae\u683c\u80cc\u5f71\u8272 2006-12-03 \u5bd2\u7fbd\u6953\u6dfb\u52a0     
  "sun_word"      : "#FF0000",  //\u661f\u671f\u5929\u6587\u5b57\u984f\u8272     
  "sat_word"      : "#0000FF",  //\u661f\u671f\u516d\u6587\u5b57\u984f\u8272     
  "td_word_light" : "#333333",  //\u55ae\u683c\u6587\u5b57\u984f\u8272     
  "td_word_dark"  : "#CCCCCC",  //\u55ae\u683c\u6587\u5b57\u6697\u8272     
  "td_bg_out"     : "#EFEFEF",  //\u55ae\u683c\u80cc\u5f71\u8272   
  "td_bg_over"    : "#FFCC00",  //\u55ae\u683c\u80cc\u5f71\u8272   
  "tr_word"       : "#FFFFFF",  //\u65e5\u66c6\u982d\u6587\u5b57\u984f\u8272     
  "tr_bg"         : "#666666",  //\u65e5\u66c6\u982d\u80cc\u5f71\u8272   
  "input_border"  : "#CCCCCC",  //input\u63a7\u5236\u9805\u7684\u908a\u6846\u984f\u8272     
  "input_bg"      : "#EFEFEF"   //input\u63a7\u5236\u9805\u7684\u80cc\u5f71\u8272   
  };  
/* //2008-01-29 \u653e\u5230\u4e86 show \uff0c\u56e0\u70ba\u8981\u505a pickMode \u5224\u65b7  
  this.draw();  
  this.bindYear();  
  this.bindMonth();  
  */  
  //this.changeSelect();   
  //this.bindData(); //2006-12-30 \u7531\u6c11\u5de5.\u78da\u5bb6\u6ce8\u91cb   
}   
  
/**//**//**//**//**//**//**//**  
 * \u65e5\u66c6\u985e\u5c6c\u6027\uff08\u8a9e\u8a00\u5305\uff0c\u53ef\u81ea\u7531\u64f4\u5c55\uff09  
 */  
Calendar.language = {   
  "year"   : [[""], [""]],   
  "months" : [["\u4e00\u6708","\u4e8c\u6708","\u4e09\u6708","\u56db\u6708","\u4e94\u6708","\u516d\u6708","\u4e03\u6708","\u516b\u6708","\u4e5d\u6708","\u5341\u6708","\u5341\u4e00\u6708","\u5341\u4e8c\u6708"],   
        ["JAN","FEB","MAR","APR","MAY","JUN","JUL","AUG","SEP","OCT","NOV","DEC"]   
         ],   
  "weeks"  : [["\u65e5","\u4e00","\u4e8c","\u4e09","\u56db","\u4e94","\u516d"],   
        ["SUN","MON","TUR","WED","THU","FRI","SAT"]   
         ],   
  "hour"  : [["\u6642"], ["H"]],   
  "minute"  : [["\u5206"], ["M"]],   
  "second"  : [["\u79d2"], ["S"]],   
  "clear"  : [["\u6e05\u7a7a"], ["CLS"]],   
  "today"  : [["\u4eca\u5929"], ["TODAY"]],   
  "pickTxt"  : [["\u78ba\u5b9a"], ["OK"]],//pickMode \u7cbe\u78ba\u5230\u5e74\u3001\u6708\u6642\u628a\u4eca\u5929\u8b8a\u6210\u201c\u78ba\u5b9a\u201d   
  "close"  : [["\u5173\u95ed"], ["CLOSE"]]   
};  
  
Calendar.prototype.draw = function() {   
  calendar = this;   
  
  var mvAry = [];   
  //mvAry[mvAry.length]  = '  <form name="calendarForm" style="margin: 0px;">'; //\u56e0 <form> \u4e0d\u80fd\u5d4c\u5957\uff0c 2006-12-01 \u7531\u5bd2\u7fbd\u6953\u6539\u7528 Div   
  mvAry[mvAry.length]  = '  <div name="calendarForm" style="margin: 0px;">';   
  mvAry[mvAry.length]  = '    <table width="100%" border="0" cellpadding="0" cellspacing="1" style="font-size:12px;">';   
  mvAry[mvAry.length]  = '      <tr>';   
  mvAry[mvAry.length]  = '        <th align="left" width="1%"><input style="border: 1px solid ' + calendar.colors["input_border"] + ';background-color:' + calendar.colors["input_bg"] + ';width:16px;height:20px;';   
  if(calendar.DateMode > pickMode["month"]){mvAry[mvAry.length]  = 'display:none;';}//pickMode \u7cbe\u78ba\u5230\u5e74\u6642\u96b1\u85cf\u201c\u6708\u201d   
  mvAry[mvAry.length]  ='" name="prevMonthyl" type="button" id="prevMonthyl" value="&lt;" /></th>';   
  mvAry[mvAry.length]  = '        <th align="center" width="98%" nowrap="nowrap"><select name="calendarYear" id="calendarYear" style="font-size:12px;"></select><select name="calendarMonth" id="calendarMonth" style="font-size:12px;';   
  if(calendar.DateMode > pickMode["month"]){mvAry[mvAry.length]  = 'display:none;';}//pickMode \u7cbe\u78ba\u5230\u5e74\u6642\u96b1\u85cf\u201c\u6708\u201d   
  mvAry[mvAry.length]  = '"></select></th>';   
  mvAry[mvAry.length]  = '        <th align="right" width="1%"><input style="border: 1px solid ' + calendar.colors["input_border"] + ';background-color:' + calendar.colors["input_bg"] + ';width:16px;height:20px;';   
  if(calendar.DateMode > pickMode["month"]){mvAry[mvAry.length]  = 'display:none;';}//pickMode \u7cbe\u78ba\u5230\u5e74\u6642\u96b1\u85cf\u201c\u6708\u201d   
  mvAry[mvAry.length]  ='" name="nextMonth" type="button" id="nextMonth" value="&gt;" /></th>';   
  mvAry[mvAry.length]  = '      </tr>';   
  mvAry[mvAry.length]  = '    </table>';   
  mvAry[mvAry.length]  = '    <table id="calendarTable" width="100%" style="border:0px solid #CCCCCC;background-color:#FFFFFF;font-size:12px;';   
  if(calendar.DateMode >= pickMode["month"]){mvAry[mvAry.length]  = 'display:none;';}//pickMode \u7cbe\u78ba\u5230\u5e74\u3001\u6708\u6642\u96b1\u85cf\u201c\u5929\u201d   
  mvAry[mvAry.length]  = '" border="0" cellpadding="3" cellspacing="1">';   
  mvAry[mvAry.length]  = '      <tr>';   
  for(var i = 0; i < 7; i++) {   
    mvAry[mvAry.length]  = '      <th style="font-weight:normal;height:21px;_height:21px;background-color:' + calendar.colors["tr_bg"] + ';color:' + calendar.colors["tr_word"] + ';">' + Calendar.language["weeks"][this.lang][i] + '</th>';   
  }   
  mvAry[mvAry.length]  = '      </tr>';   
  for(var i = 0; i < 6;i++){   
    mvAry[mvAry.length]  = '    <tr align="center">';   
    for(var j = 0; j < 7; j++) {   
      if (j == 0){   
        mvAry[mvAry.length]  = '  <td style="cursor:default;height:20px;_height:20px;color:' + calendar.colors["sun_word"] + ';"></td>';   
      } else if(j == 6) {   
        mvAry[mvAry.length]  = '  <td style="cursor:default;height:20px;_height:20px;color:' + calendar.colors["sat_word"] + ';"></td>';   
      } else {   
        mvAry[mvAry.length]  = '  <td style="cursor:default;height:20px;_height:20px;"></td>';   
      }   
    }   
    mvAry[mvAry.length]  = '    </tr>';   
  }   
  
//2009-03-03 \u6dfb\u52a0\u7684\u4ee3\u78bc\uff0c\u653e\u7f6e\u6642\u9593\u7684\u884c   
  mvAry[mvAry.length]  = '      <tr style="';   
    if(calendar.DateMode >= pickMode["day"]){mvAry[mvAry.length]  = 'display:none;';}//pickMode \u7cbe\u78ba\u5230\u6642\u65e5\u96b1\u85cf\u201c\u6642\u9593\u201d   
    mvAry[mvAry.length]  = '"><td align="center" colspan="7">';   
  mvAry[mvAry.length]  = '      <select name="calendarHour" id="calendarHour" style="font-size:12px;"></select>' + Calendar.language["hour"][this.lang];   
  mvAry[mvAry.length]  = '<span style="';  
    if(calendar.DateMode >= pickMode["hour"]){mvAry[mvAry.length]  = 'display:none;';}//pickMode \u7cbe\u78ba\u5230\u5c0f\u6642\u6642\u96b1\u85cf\u201c\u5206\u201d   
  mvAry[mvAry.length]  = '"><select name="calendarMinute" id="calendarMinute" style="font-size:12px;"></select>' + Calendar.language["minute"][this.lang]+'</span>';   
    mvAry[mvAry.length]  = '<span style="'; 
    if(calendar.DateMode >= pickMode["minute"]){mvAry[mvAry.length]  = 'display:none;';}//pickMode \u7cbe\u78ba\u5230\u5c0f\u6642\u3001\u5206\u6642\u96b1\u85cf\u201c\u79d2\u201d   
   mvAry[mvAry.length]  = '"><select name="calendarSecond" id="calendarSecond" style="font-size:12px;"></select>'+ Calendar.language["second"][this.lang]+'</span>';   
  mvAry[mvAry.length]  = '      </td></tr>';   
     
  mvAry[mvAry.length]  = '    </table>';   
  //mvAry[mvAry.length]  = '  </from>';   
  mvAry[mvAry.length]  = '      <div align="center" style="padding:4px 4px 4px 4px;background-color:' + calendar.colors["input_bg"] + ';">';   
  mvAry[mvAry.length]  = '        <input name="calendarClear" type="button" id="calendarClear" value="' + Calendar.language["clear"][this.lang] + '" style="border: 1px solid ' + calendar.colors["input_border"] + ';background-color:' + calendar.colors["input_bg"] + ';width:40px;height:20px;font-size:12px;cursor:pointer;"/>';   
  mvAry[mvAry.length]  = '        <input name="calendarToday" type="button" id="calendarToday" value="';  
  mvAry[mvAry.length]  = (calendar.DateMode == pickMode["day"]) ? Calendar.language["today"][this.lang] : Calendar.language["pickTxt"][this.lang];   
  mvAry[mvAry.length]  = '" style="border: 1px solid ' + calendar.colors["input_border"] + ';background-color:' + calendar.colors["input_bg"] + ';width:60px;height:20px;font-size:12px;cursor:pointer"/>';   
  mvAry[mvAry.length]  = '        <input name="calendarClose" type="button" id="calendarClose" value="' + Calendar.language["close"][this.lang] + '" style="border: 1px solid ' + calendar.colors["input_border"] + ';background-color:' + calendar.colors["input_bg"] + ';width:40px;height:20px;font-size:12px;cursor:pointer"/>';   
  mvAry[mvAry.length]  = '      </div>';   
     
  mvAry[mvAry.length]  = '  </div>';   
  this.panel.innerHTML = mvAry.join("");   
     
  /**//**//**//******** \u4ee5\u4e0b\u4ee3\u78bc\u7531\u5bd2\u7fbd\u6953 2006-12-01 \u6dfb\u52a0 **********/  
  var obj = this.getElementById("prevMonthyl");   
  obj.onclick = function () {calendar.goPrevMonthYL(calendar);};  
  obj.onblur = function () {calendar.onblur();};  
  this.prevMonth= obj;   
     
  obj = this.getElementById("nextMonth");   
  obj.onclick = function () {calendar.goNextMonthYL(calendar);}; 
  obj.onblur = function () {calendar.onblur();};   
  this.nextMonth= obj;     
  
  obj = this.getElementById("calendarClear");   
  obj.onclick = function ()    
  { calendar.ReturnDate(""); /*calendar.dateControl.value = "";calendar.hide();*///2007-09-14 \u7531\u5bd2\u7fbd\u6953\u6ce8\u91cb   
  }; 
  this.calendarClear = obj;   
     
  obj = this.getElementById("calendarClose");   
  obj.onclick = function () {calendar.hide();}; 
  this.calendarClose = obj;   
     
  obj = this.getElementById("calendarYear");   
  obj.onchange = function () {calendar.update(calendar);};
  obj.onblur = function () {calendar.onblur();}; 
  this.calendarYear = obj;   
     
  obj = this.getElementById("calendarMonth");   
  with(obj)   
  {   
    onchange = function () {calendar.update(calendar);};   
    onblur = function () {calendar.onblur();};  
  }this.calendarMonth = obj;   
     
  obj = this.getElementById("calendarHour");   
  obj.onchange = function () {calendar.hour = this.options[this.selectedIndex].value;}; 
  obj.onblur = function () {calendar.onblur();}; 
  this.calendarHour = obj;   
      
  obj = this.getElementById("calendarMinute");   
  obj.onchange = function () {calendar.minute = this.options[this.selectedIndex].value;};   
  obj.onblur = function () {calendar.onblur();};  
  this.calendarMinute = obj;   
     
  obj = this.getElementById("calendarSecond");   
  obj.onchange = function () {calendar.second = this.options[this.selectedIndex].value;};  
  obj.onblur = function () {calendar.onblur();};  
  this.calendarSecond = obj;   
  
  obj = this.getElementById("calendarToday");   
  obj.onclick = function () {   
  var today = (calendar.DateMode != pickMode["day"]) ?   
                    new Date(calendar.year,calendar.month,calendar.day,calendar.hour,calendar.minute,calendar.second)   
                    : new Date();//2008-01-29   
    calendar.ReturnDate(today.format(calendar.dateFormatStyle));   
  };
  this.calendarToday = obj;   
};  
  
//\u5e74\u4efd\u4e0b\u62c9\u6e05\u55ae\u7d81\u5b9a\u6578\u64da   
Calendar.prototype.bindYear = function() {   
  var cy = this.calendarYear;//2006-12-01 \u7531\u5bd2\u7fbd\u6953\u4fee\u6539   
  cy.length = 0;   
  for (var i = this.beginYear; i <= this.endYear; i++){   
    cy.options[cy.length] = new Option(i + Calendar.language["year"][this.lang], i);   
  }   
};   
  
//\u6708\u4efd\u4e0b\u62c9\u6e05\u55ae\u7d81\u5b9a\u6578\u64da   
Calendar.prototype.bindMonth = function() {   
  var cm = this.calendarMonth;//2006-12-01 \u7531\u5bd2\u7fbd\u6953\u4fee\u6539   
  cm.length = 0;   
  for (var i = 0; i < 12; i++){   
    cm.options[cm.length] = new Option(Calendar.language["months"][this.lang][i], i);   
  }   
};   
  
//\u5c0f\u6642\u4e0b\u62c9\u6e05\u55ae\u7d81\u5b9a\u8cc7\u6599   
Calendar.prototype.bindHour = function() {   
  var ch = this.calendarHour;   
  if(ch.length > 0){return;}//2009-03-03 \u4e0d\u9700\u8981\u91cd\u65b0\u7d81\u5b9a\uff0c\u63d0\u9ad8\u6027\u80fd   
  //ch.length = 0;   
  var h;   
  for (var i = 0; i < 24; i++){   
    h = ("00" + i +"").substr(("" + i).length);   
    ch.options[ch.length] = new Option(h, h);   
  }   
};   
  
//\u5206\u9418\u4e0b\u62c9\u6e05\u55ae\u7d81\u5b9a\u8cc7\u6599   
Calendar.prototype.bindMinute = function() {   
  var cM = this.calendarMinute;   
  if(cM.length > 0){return;}//2009-03-03 \u4e0d\u9700\u8981\u91cd\u65b0\u7d81\u5b9a\uff0c\u63d0\u9ad8\u6027\u80fd   
  //cM.length = 0;   
  var M;   
  for (var i = 0; i < 60; i++){   
    M = ("00" + i +"").substr(("" + i).length);   
    cM.options[cM.length] = new Option(M, M);   
  }   
};   
  
//\u79d2\u9418\u4e0b\u62c9\u6e05\u55ae\u7d81\u5b9a\u8cc7\u6599   
Calendar.prototype.bindSecond = function() {   
  var cs = this.calendarSecond;   
  if(cs.length > 0){return;}//2009-03-03 \u4e0d\u9700\u8981\u91cd\u65b0\u7d81\u5b9a\uff0c\u63d0\u9ad8\u6027\u80fd   
  //cs.length = 0;   
  var s;   
  for (var i = 0; i < 60; i++){   
    s = ("00" + i +"").substr(("" + i).length);   
    cs.options[cs.length] = new Option(s, s);   
  }   
};   
  
//\u5411\u524d\u4e00\u6708   
Calendar.prototype.goPrevMonthYL = function(e){   
  if (this.year == this.beginYear && this.month == 0){return;}   
  this.month--;   
  if (this.month == -1) {   
    this.year--;   
    this.month = 11;   
  }   
  this.date = new Date(this.year, this.month, 1);   
  this.changeSelect();   
  this.bindData();   
};   
  
//\u5411\u5f8c\u4e00\u6708   
Calendar.prototype.goNextMonthYL = function(e){   
  if (this.year == this.endYear && this.month == 11){return;}   
  this.month++;   
  if (this.month == 12) {   
    this.year++;   
    this.month = 0;   
  }   
  this.date = new Date(this.year, this.month, 1);   
  this.changeSelect();   
  this.bindData();   
};   
  
//\u6539\u8b8aSELECT\u9078\u4e2d\u72c0\u614b   
Calendar.prototype.changeSelect = function() {   
  var cy = this.calendarYear;//2006-12-01 \u7531\u5bd2\u7fbd\u6953\u4fee\u6539   
  var cm = this.calendarMonth;   
  var ch = this.calendarHour;   
  var cM = this.calendarMinute;   
  var cs = this.calendarSecond;   
//2006-12-30 \u7531\u6c11\u5de5.\u78da\u5bb6\u4fee\u6539\uff0c\u6e1b\u5c11\u904b\u7b97\u6b21\u6578   
  cy[this.date.getFullYear()-this.beginYear].selected = true;   
  cm[this.date.getMonth()].selected =true;   
     
//2009-03-03 \u6dfb\u52a0\uff0c\u521d\u59cb\u5316\u6642\u9593\u7684\u503c   
  ch[this.hour].selected =true;   
  cM[this.minute].selected =true;   
  cs[this.second].selected =true;   
};   
  
//\u66f4\u65b0\u5e74\u3001\u6708   
Calendar.prototype.update = function (e){   
  this.year  = e.calendarYear.options[e.calendarYear.selectedIndex].value;//2006-12-01 \u7531\u5bd2\u7fbd\u6953\u4fee\u6539   
  this.month = e.calendarMonth.options[e.calendarMonth.selectedIndex].value;   
  this.date = new Date(this.year, this.month, 1);   
  //this.changeSelect();   
  this.bindData();   
};   
  
//\u7d81\u5b9a\u8cc7\u6599\u5230\u6708\u8996\u5716   
Calendar.prototype.bindData = function () {   
  var calendar = this;   
    if(calendar.DateMode >= pickMode["month"]){return;}//2008-01-29   
 // var dateArray = this.getMonthViewArray(this.date.getYear(), this.date.getMonth());   
  //2006-12-30 \u7531\u6c11\u5de5.\u78da\u5bb6\u4fee\u6539 \u5728Firefox \u4e0b\u5e74\u4efd\u932f\u8aa4   
  var dateArray = this.getMonthViewArray(this.date.getFullYear(), this.date.getMonth());   
 var tds = this.getElementById("calendarTable").getElementsByTagName("td");   
  for(var i = 0; i < tds.length; i++) {   
  tds[i].style.backgroundColor = calendar.colors["td_bg_out"];   
    tds[i].onclick = function () {return;};   
    tds[i].onmouseover = function () {return;};   
    tds[i].onmouseout = function () {return;};   
    if (i > dateArray.length - 1) break;   
    tds[i].innerHTML = dateArray[i];   
    if (dateArray[i] != "&nbsp;"){   
      tds[i].bgColorTxt = "td_bg_out"; //2009-03-03 \u4fdd\u5b58\u80cc\u666f\u8272\u7684class   
        var cur = new Date();   
        tds[i].isToday = false;   
      if (cur.getFullYear() == calendar.date.getFullYear() && cur.getMonth() == calendar.date.getMonth() && cur.getDate() == dateArray[i]) {   
      //\u662f\u4eca\u5929\u7684\u55ae\u683c   
        tds[i].style.backgroundColor = calendar.colors["cur_bg"];   
        tds[i].bgColorTxt = "cur_bg";   
        tds[i].isToday = true;   
        }   
    if(calendar.dateControl != null )   
    {   
      cur = calendar.dateControl.value.toDate(calendar.dateFormatStyle);   
      if (cur.getFullYear() == calendar.date.getFullYear() && cur.getMonth() == calendar.date.getMonth()&& cur.getDate() == dateArray[i]) {   
      //\u662f\u5df2\u88ab\u9078\u4e2d\u7684\u55ae\u683c   
        calendar.selectedDayTD = tds[i];   
        tds[i].style.backgroundColor = calendar.colors["sel_bg"];   
        tds[i].bgColorTxt = "sel_bg";   
      }   
    }   
      tds[i].onclick = function () {   
            if(calendar.DateMode == pickMode["day"]) //2009-03-03 \u7576\u9078\u64c7\u65e5\u671f\u6642\uff0c\u9ede\u64ca\u683c\u5b50\u5373\u8fd4\u56de\u503c   
            {   
                calendar.ReturnDate(new Date(calendar.date.getFullYear(),   
                                                    calendar.date.getMonth(),   
                                                    this.innerHTML).format(calendar.dateFormatStyle));   
            }   
            else  
            {   
                if(calendar.selectedDayTD != null) //2009-03-03 \u6e05\u9664\u5df2\u9078\u4e2d\u7684\u80cc\u666f\u8272   
                {   
                    calendar.selectedDayTD.style.backgroundColor =(calendar.selectedDayTD.isToday)? calendar.colors["cur_bg"] : calendar.colors["td_bg_out"];   
                }   
                this.style.backgroundColor = calendar.colors["sel_bg"];   
                calendar.day = this.innerHTML;   
                calendar.selectedDayTD = this; //2009-03-03 \u8a18\u9304\u5df2\u9078\u4e2d\u7684\u65e5\u5b50   
            }   
          };   
      tds[i].style.cursor ="pointer"; //2007-08-06 \u7531\u5bd2\u7fbd\u6953\u6dfb\u52a0\uff0c\u6ed1\u9f20\u8b8a\u6210\u624b\u6307\u72c0   
      tds[i].onmouseover = function () {   
        this.style.backgroundColor = calendar.colors["td_bg_over"];   
      };   
      tds[i].onmouseout = function () {   
        if(calendar.selectedDayTD != this) {   
        this.style.backgroundColor = calendar.colors[this.bgColorTxt];}   
      };   
      tds[i].onblur = function () {calendar.onblur();};   
    }   
  }   
};   
  
//\u6839\u64da\u5e74\u3001\u6708\u5f97\u5230\u6708\u8996\u5716\u8cc7\u6599(\u9663\u5217\u5f62\u5f0f)   
Calendar.prototype.getMonthViewArray = function (y, m) {   
  var mvArray = [];   
  var dayOfFirstDay = new Date(y, m, 1).getDay();   
  var daysOfMonth = new Date(y, m + 1, 0).getDate();   
  for (var i = 0; i < 42; i++) {   
    mvArray[i] = "&nbsp;";   
  }   
  for (var i = 0; i < daysOfMonth; i++){   
    mvArray[i + dayOfFirstDay] = i + 1;   
  }   
  return mvArray;   
};   
  
//\u64f4\u5c55 document.getElementById(id) \u591a\u6d41\u89bd\u5668\u76f8\u5bb9\u6027 from meizz tree source   
Calendar.prototype.getElementById = function(id){   
  if (typeof(id) != "string" || id == "") return null;   
  if (document.getElementById) return document.getElementById(id);   
  if (document.all) return document.all(id);   
  try {return eval(id);} catch(e){ return null;}   
};   
  
//\u64f4\u5c55 object.getElementsByTagName(tagName)   
Calendar.prototype.getElementsByTagName = function(object, tagName){   
  if (document.getElementsByTagName) return document.getElementsByTagName(tagName);   
  if (document.all) return document.all.tags(tagName);   
};   
  
//\u53d6\u5f97HTML\u63a7\u5236\u9805\u7d55\u5c0d\u4f4d\u7f6e   
Calendar.prototype.getAbsPoint = function (e){   
  var x = e.offsetLeft;   
  var y = e.offsetTop;   
  while(e = e.offsetParent){   
    x += e.offsetLeft;   
    y += e.offsetTop;   
  }   
  return {"x": x, "y": y};   
};   
  
//\u986f\u793a\u65e5\u66c6   
Calendar.prototype.show = function (dateObj, popControl) {   
  if (dateObj == null){   
    throw new Error("arguments[0] is necessary");   
  }   
  this.dateControl = dateObj;   
  var now =  new Date();   
  this.date = (dateObj.value.length > 0) ? new Date(dateObj.value.toDate(this.dateFormatStyle)) : now.format(this.dateFormatStyle).toDate(this.dateFormatStyle) ;//2008-01-29 \u5bd2\u7fbd\u6953\u6dfb\u52a0 \u2192 \u82e5\u70ba\u7a7a\u5247\u6839\u64dadateFormatStyle\u521d\u59cb\u5316\u65e5\u671f   
  
  if(this.panel.innerHTML==""||cal.dateFormatStyleOld != cal.dateFormatStyle)//2008-01-29 \u628a\u69cb\u9020\u8868\u683c\u653e\u5728\u6b64\u8655\uff0c2009-03-03 \u82e5\u8acb\u793a\u7684\u6a23\u5f0f\u6539\u8b8a\uff0c\u5247\u91cd\u65b0\u521d\u59cb\u5316   
  {   
    this.draw();   
    this.bindYear();   
    this.bindMonth();   
    this.bindHour();   
    this.bindMinute();   
    this.bindSecond();   
  }   
  this.year = this.date.getFullYear();   
  this.month = this.date.getMonth();   
  this.day = this.date.getDate();   
  this.hour = this.date.getHours();   
  this.minute = this.date.getMinutes();   
  this.second = this.date.getSeconds();   
  this.changeSelect();   
  this.bindData();   
  
  if (popControl == null){   
    popControl = dateObj;   
  }   
  var xy = this.getAbsPoint(popControl);   
  //this.panel.style.left = xy.x + "px";   
  //this.panel.style.top = (xy.y + dateObj.offsetHeight) + "px";   
  this.panel.style.left = (xy.x + leftX)+ "px"; //\u7531\u5bd2\u7fbd\u6953 2007-02-11 \u4fee\u6539 \u2192 \u52a0\u5165\u81ea\u5b9a\u7fa9\u504f\u79fb\u91cf   
  this.panel.style.top = (xy.y + topY + dateObj.offsetHeight) + "px";   
     
  //\u7531\u5bd2\u7fbd\u6953 2006-06-25 \u4fee\u6539 \u2192 \u628a visibility \u8b8a\u70ba display\uff0c\u4e26\u6dfb\u52a0\u5931\u53bb\u7126\u9ede\u7684\u4e8b\u4ef6  //this.setDisplayStyle("select", "hidden");   
  //this.panel.style.visibility = "visible";   
  //this.container.style.visibility = "visible";   
  this.panel.style.display = "";   
  this.container.style.display = "";   
     
  if( !this.dateControl.isTransEvent)   
  {   
    this.dateControl.isTransEvent = true;   
    /* \u5df2\u5beb\u5728\u8fd4\u56de\u503c\u7684\u6642\u5019  ReturnDate \u51fd\u6578\u4e2d\uff0c\u53bb\u9664\u9a57\u8b49\u4e8b\u4ef6\u7684\u51fd\u6578  
    this.dateControl.changeEvent = this.dateControl.onchange;//\u5c07 onchange \u8f49\u6210\u5176\u4ed6\u51fd\u6578\uff0c\u4ee5\u514d\u89f8\u767c\u9a57\u8b49\u4e8b\u4ef6  
    this.dateControl.onchange = function()  
    {if(typeof(this.changeEvent) =='function'){this.changeEvent();}}*/  
    if(this.dateControl.onblur != null){   
    this.dateControl.blurEvent = this.dateControl.onblur;}//2007-09-14 \u4fdd\u5b58\u4e3b\u6587\u672c\u6846\u7684 onblur \uff0c\u4f7f\u5176\u539f\u672c\u7684\u4e8b\u4ef6\u4e0d\u88ab\u8986\u84cb   
    this.dateControl.onblur = function()   
    {calendar.onblur();if(typeof(this.blurEvent) =='function'){this.blurEvent();}   
    };   
  }   
     
  this.container.onmouseover = function(){isFocus=true;};   
  this.container.onmouseout = function(){isFocus=false;};   
};   
  
//\u96b1\u85cf\u65e5\u66c6   
Calendar.prototype.hide = function() {   
  //this.setDisplayStyle("select", "visible");   
  //this.panel.style.visibility = "hidden";   
  //this.container.style.visibility = "hidden";   
  this.panel.style.display = "none";   
  this.container.style.display = "none";   
  isFocus=false;   
};   
  
//\u7126\u9ede\u8f49\u79fb\u6642\u96b1\u85cf\u65e5\u66c6 \u2192 \u7531\u5bd2\u7fbd\u6953 2006-06-25 \u6dfb\u52a0   
Calendar.prototype.onblur = function() {   
    if(!isFocus){this.hide();}   
};   
  
//\u4ee5\u4e0b\u7531\u5bd2\u7fbd\u6953 2007-07-26 \u4fee\u6539 \u2192 \u78ba\u4fdd\u65e5\u66c6\u5bb9\u5668\u7bc0\u9ede\u5728 body \u6700\u5f8c\uff0c\u5426\u5247 FireFox \u4e2d\u4e0d\u80fd\u51fa\u73fe\u5728\u6700\u4e0a\u65b9   
function InitContainerPanel() //\u521d\u59cb\u5316\u5bb9\u5668   
{   
    var str = '<div id="calendarPanel" style="position: absolute;display: none;z-index:9999; background-color: #FFFFFF;border: 1px solid #CCCCCC;width:175px;font-size:12px;"></div>';   
    if(document.all)   
    {   
        str += '<iframe style="position:absolute;z-index:2000;width:expression(this.previousSibling.offsetWidth);';   
        str += 'height:expression(this.previousSibling.offsetHeight);';   
        str += 'left:expression(this.previousSibling.offsetLeft);top:expression(this.previousSibling.offsetTop);';   
        str += 'display:expression(this.previousSibling.style.display);" scrolling="no" frameborder="no"></iframe>';   
    }   
    var div = document.createElement("div");   
    div.innerHTML = str;   
    div.id = "ContainerPanel";   
    div.style.display ="none";   
    document.body.appendChild(div);   
}//\u8abf\u7528calendar.show(dateControl, popControl);   
//-->  

