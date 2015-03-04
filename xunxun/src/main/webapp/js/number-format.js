/**
 *   Usage:  CurrencyFormatted(12345.678);
 *   result: 12345.68
 */
function CurrencyFormatted(amount) {
    var i = parseFloat(amount);
    if(isNaN(i)) { i = 0.00; }
    var minus = '';
    if(i < 0) { minus = '-'; }
    i = Math.abs(i);
    i = parseInt((i + .005) * 100);
    i = i / 100;
    s = new String(i);
    if(s.indexOf('.') < 0) { s += '.00'; }
    if(s.indexOf('.') == (s.length - 2)) { s += '0'; }
    s = minus + s;
    return s;
}

/**
 *   Usage:  format_number(12345.678, 2);
 *   result: 12345.68
 */
function format_number(pnumber,decimals){
    if (isNaN(pnumber)) { return 0;}
    if (pnumber=='') { return 0;}
     
    var snum = new String(pnumber);
    var sec = snum.split('.');
    var whole = parseFloat(sec[0]);
    var result = '';
     
    if(sec.length > 1){
        var dec = new String(sec[1]);
        dec = String(parseFloat(sec[1])/Math.pow(10,(dec.length - decimals)));
        dec = String(whole + Math.round(parseFloat(dec))/Math.pow(10,decimals));
        var dot = dec.indexOf('.');
        if(dot == -1){
            dec += '.';
            dot = dec.indexOf('.');
        }
        while(dec.length <= dot + decimals) { dec += '0'; }
        result = dec;
    } else{
        var dot;
        var dec = new String(whole);
        dec += '.';
        dot = dec.indexOf('.');    
        while(dec.length <= dot + decimals) { dec += '0'; }
        result = dec;
    }  
    return result;
}

 
/**
 *   Usage:  CommaFormatted(12345678);
 *   result: 12,345,678
 */
function CommaFormatted(amount) {
    var delimiter = ","; // replace comma if desired
    amount = new String(amount);
    var a = amount.split('.',2);
    var d = a[1];
    var i = parseInt(a[0]);
    if(isNaN(i)) { return ''; }
    var minus = '';
    if(i < 0) { minus = '-'; }
    i = Math.abs(i);
    var n = new String(i);
    var a = [];
    while(n.length > 3)
    {
        var nn = n.substr(n.length-3);
        a.unshift(nn);
        n = n.substr(0,n.length-3);
    }
    if(n.length > 0) { a.unshift(n); }
    n = a.join(delimiter);
    if(d.length < 1) { amount = n; }
    else { amount = n + '.' + d; }
    amount = minus + amount;
    return amount;
}

 
/**
 *   Usage:  addCommas(12345678);
 *   result: 12,345,678
 */
function addCommas(nStr) {
    nStr += '';
    var x = nStr.split('.');
    var x1 = x[0];
    var x2 = x.length > 1 ? '.' + x[1] : '';
    var rgx = /(d+)(d{3})/;
     
    while (rgx.test(x1)) {
        x1 = x1.replace(rgx, '$1' + ',' + '$2');
    }
     
    return x1 + x2;
}

 
/**
 *   Usage:  number_format(123456.789, 2, '.', ',');
 *   result: 123,456.79
 */
function number_format (number, decimals, dec_point, thousands_sep) {
 
    number = (number + '').replace(/[^0-9+-Ee.]/g, '');
    var n = !isFinite(+number) ? 0 : +number,
        prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
        sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,
        dec = (typeof dec_point === 'undefined') ? '.' : dec_point,
        s = '',
        toFixedFix = function (n, prec) {
            var k = Math.pow(10, prec);
            return '' + Math.round(n * k) / k;
        };
    // Fix for IE parseFloat(0.55).toFixed(0) = 0;
    s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
    if (s[0].length > 3) {
        s[0] = s[0].replace(/B(?=(?:d{3})+(?!d))/g, sep);
    }
    if ((s[1] || '').length < prec) {
        s[1] = s[1] || '';
        s[1] += new Array(prec - s[1].length + 1).join('0');
    }
    return s.join(dec);
}

/**
 * 是否是数字，含'.'
 */
function isDigital(s) { 
	var patrn=/^[0-9.]{0,25}$/; 
	if (!patrn.exec(s)){
		return false;
	}
	return true;
}
/**
 * 是否是整数
 */
function isInteger(i){
	if(!isDigital(i)){
		return false;
	}
	if(parseInt(i)==i){
		return true;
	}
	return false;
}
/**
 * 是否是浮点数
 */
function isDouble(d){
	if(!isDigital(d)){
		return false;
	}
	if(parseFloat(d)==d){
		return true;
	}
	return false;
}

/**
 * 是否满足double的小数点位数
 */
function isDoubleFormat(d,bit){
	if(!isDouble(d)){
		return false;
	}
	var n =(d.split('.')).length-1;
	if (n > 1) {
		return false;
	}
	var ind = d.indexOf('.');
	if (ind > -1){
		var tt = (d.substring(ind)).length-1;
    	if (parseInt(tt) > parseInt(bit)) {//小数位太长
    		return false;
    	}
	}
	return true;
}