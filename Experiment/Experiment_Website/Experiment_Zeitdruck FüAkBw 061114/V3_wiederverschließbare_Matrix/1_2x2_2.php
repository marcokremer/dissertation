<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><HTML>
<HEAD>
<TITLE>Runde 1</TITLE>
<script language=javascript src="mmlweb.js"></SCRIPT>
<link rel="stylesheet" href="mlweb.css" type="text/css">
</head>
<body onLoad="timefunction('onload','body','body')">
<!--BEGIN TABLE STRUCTURE-->
<SCRIPT language="javascript">
//override defaults
mlweb_outtype="CSV";
mlweb_fname="mlwebform";
tag = "a0^a1`"
 + "b0^b1";

txt = "72 ; 93^31 ; 46`"
 + "84 ; 52^55 ; 79`"

state = "1^1`"
 + "1^1";

box = "a0^a1`"
 + "b0^b1";

CBCol = "0^0";
CBRow = "1^1";
W_Col = "100^100";
H_Row = "50^50";

chkchoice = false;
btnFlg = 2;
btnType = "button";
btntxt = "Strategie 1^Strategie 2";
btnstate = "1^1";
btntag = "btn1^btn2";
to_email = "";
colFix = false;
rowFix = true;
CBpreset = false;
evtOpen = 1;
evtClose = 1;
chkFrm=false;
warningTxt = "Some questions have not been answered. Please answer all questions before continuing!";
tmTotalSec = 30;
tmStepSec = 1;
tmWidthPx = 200;
tmFill = false;
tmShowTime = true;
tmCurTime = 0;
tmActive = true;
tmDirectStart = false;
tmMinLabel = "min";
tmSecLabel = "sec";
tmLabel = "Timer: ";

//Delay: a0 a1 b0 b1
delay = "0^0^0^0`"
 + "0^0^0^0`"
 + "0^0^0^0`"
 + "0^0^0^0";
activeClass = "actTD";
inactiveClass = "inactTD";
boxClass = "boxTD";
cssname = "mlweb.css";
nextURL = "2_2x2_2.php";
expname = "1_2x2_2.php";
randomOrder = true;
recOpenCells = true;
masterCond = 1;
loadMatrices();
</SCRIPT>
<!--END TABLE STRUCTURE-->

<FORM name="mlwebform" onSubmit="return checkForm(this)" method="POST" action="msave.php"><INPUT type=hidden name="procdata" value="">
<input type=hidden name="wonne" value="">
<input type=hidden name="expname" value="">
<input type=hidden name="nextURL" value="">
<input type=hidden name="expversion" value="">
<input type=hidden name="choice" value="">
<input type=hidden name="condnum" value="">
<input type=hidden name="to_email" value="">
<input type=hidden name="erwartung" value="">
<input type=hidden name="transf" value="">
<script language="javascript">
var subject_inhalt="";
var inhalt=document.cookie;
var cookie_length=document.cookie.length;
var transform=inhalt.charAt(cookie_length);
//document.mlwebform.transform.value=transform;
var inhalt=document.cookie;
if (inhalt.indexOf("v1")>-1){document.mlwebform.expversion.value="v1";}else{document.mlwebform.expversion.value="v2";}
var komma=inhalt.indexOf(",");
subject_inhalt=inhalt.slice(0,komma);
document.mlwebform.wonne.value=subject_inhalt;
</script>
<!--BEGIN preHTML-->
<p>Du bist der Zeilenspieler. Deine Aufgabe ist es nun, diejenige Strategie zu w?hlen, mit der du die h?chste Auszahlung f?r dich generierst!</p>

<!--END preHTML-->
<!-- MOUSELAB TABLE -->
<TABLE border=1>
<TR>
<!--cell a0(tag:a0)-->
<TD align=center valign=middle><DIV ID="a0_cont" style="position: relative; height: 50px; width: 100px;"><DIV ID="a0_txt" STYLE="position: absolute; left: 0px; top: 0px; height: 50px; width: 100px; clip: rect(0px 100px 50px 0px); z-index: 1;"><TABLE><TD ID="a0_td" align=center valign=center width=95 height=45 class="actTD">1,-1</TD></TABLE></DIV><DIV ID="a0_box" STYLE="position: absolute; left: 0px; top: 0px; height: 50px; width: 100px; clip: rect(0px 100px 50px 0px); z-index: 2;"><TABLE><TD ID="a0_tdbox" align=center valign=center width=95 height=45 class="boxTD">a0</TD></TABLE></DIV><DIV ID="a0_img" STYLE="position: absolute; left: 0px; top: 0px; height: 50px; width: 100px; z-index: 5;"><A HREF="javascript:void(0);" NAME="a0" onmouseover="SwitchCont('a0',event)" onMouseOut="timefunction('mouseout','a0','out')" onMouseMove="timefunction_2(event,'a0')"><IMG NAME="a0" SRC="transp.gif" border=0 width=100 height=50></A></DIV></DIV></TD>
<!--end cell-->
<!--cell a1(tag:a1)-->
<TD align=center valign=middle><DIV ID="a1_cont" style="position: relative; height: 50px; width: 100px;"><DIV ID="a1_txt" STYLE="position: absolute; left: 0px; top: 0px; height: 50px; width: 100px; clip: rect(0px 100px 50px 0px); z-index: 1;"><TABLE><TD ID="a1_td" align=center valign=center width=95 height=45 class="actTD">-1,1</TD></TABLE></DIV><DIV ID="a1_box" STYLE="position: absolute; left: 0px; top: 0px; height: 50px; width: 100px; clip: rect(0px 100px 50px 0px); z-index: 2;"><TABLE><TD ID="a1_tdbox" align=center valign=center width=95 height=45 class="boxTD">a1</TD></TABLE></DIV><DIV ID="a1_img" STYLE="position: absolute; left: 0px; top: 0px; height: 50px; width: 100px; z-index: 5;"><A HREF="javascript:void(0);" NAME="a1" onmouseover="SwitchCont('a1',event)" onMouseOut="timefunction('mouseout','a1','out')" onMouseMove="timefunction_2(event,'a1')"><IMG NAME="a1" SRC="transp.gif" border=0 width=100 height=50></A></DIV></DIV></TD>
<!--end cell--><TD ID="btn_0" style="border-left-style: none; border-right-style: none; border-bottom-style: none;" align=center valign=middle><INPUT type="button" class="btnStyle" name="btn1" value="Strategie 1" onMouseOver="timefunction('mouseover','btn1','Strategie 1')" onClick="recChoice('onclick','btn1','Strategie 1')" onMouseOut="timefunction('mouseout','btn1','Strategie 1')"></TD><TD rowspan="3"><INPUT type="button" value="fertig" style="height: 135px;" onClick=erwartungswert('submit','submit','submit') ></TD>
</TR><TR>
<!--cell b0(tag:b0)-->
<TD align=center valign=middle><DIV ID="b0_cont" style="position: relative; height: 50px; width: 100px;"><DIV ID="b0_txt" STYLE="position: absolute; left: 0px; top: 0px; height: 50px; width: 100px; clip: rect(0px 100px 50px 0px); z-index: 1;"><TABLE><TD ID="b0_td" align=center valign=center width=95 height=45 class="actTD">-1,1</TD></TABLE></DIV><DIV ID="b0_box" STYLE="position: absolute; left: 0px; top: 0px; height: 50px; width: 100px; clip: rect(0px 100px 50px 0px); z-index: 2;"><TABLE><TD ID="b0_tdbox" align=center valign=center width=95 height=45 class="boxTD">b0</TD></TABLE></DIV><DIV ID="b0_img" STYLE="position: absolute; left: 0px; top: 0px; height: 50px; width: 100px; z-index: 5;"><A HREF="javascript:void(0);" NAME="b0" onmouseover="SwitchCont('b0',event)" onMouseOut="timefunction('mouseout','b0','out')" onMouseMove="timefunction_2(event,'b0')"><IMG NAME="b0" SRC="transp.gif" border=0 width=100 height=50></A></DIV></DIV></TD>
<!--end cell-->
<!--cell b1(tag:b1)-->
<TD align=center valign=middle><DIV ID="b1_cont" style="position: relative; height: 50px; width: 100px;"><DIV ID="b1_txt" STYLE="position: absolute; left: 0px; top: 0px; height: 50px; width: 100px; clip: rect(0px 100px 50px 0px); z-index: 1;"><TABLE><TD ID="b1_td" align=center valign=center width=95 height=45 class="actTD">1,-1</TD></TABLE></DIV><DIV ID="b1_box" STYLE="position: absolute; left: 0px; top: 0px; height: 50px; width: 100px; clip: rect(0px 100px 50px 0px); z-index: 2;"><TABLE><TD ID="b1_tdbox" align=center valign=center width=95 height=45 class="boxTD">b1</TD></TABLE></DIV><DIV ID="b1_img" STYLE="position: absolute; left: 0px; top: 0px; height: 50px; width: 100px; z-index: 5;"><A HREF="javascript:void(0);" NAME="b1" onmouseover="SwitchCont('b1',event)" onMouseOut="timefunction('mouseout','b1','out')" onMouseMove="timefunction_2(event,'b1')"><IMG NAME="b1" SRC="transp.gif" border=0 width=100 height=50></A></DIV></DIV></TD>
<!--end cell--><TD ID="btn_1" style="border-left-style: none; border-right-style: none; border-bottom-style: none;" align=center valign=middle><INPUT type="button" class="btnStyle" name="btn2" value="Strategie 2" onMouseOver="timefunction('mouseover','btn2','Strategie 2')" onClick="recChoice('onclick','btn2','Strategie 2')" onMouseOut="timefunction('mouseout','btn2','Strategie 2')"></TD><TD></TD>
</TR><tr><td colspan=2><!-- Begin HTML Time Bar --><table><tr><td>Timer: </td><td colspan=2><div id="tmCont" class="tmCont"><div id="tmBar" class="tmBar"></div><div id="tmTime" class="tmTime"></div></div></td></TR></table><!-- End HTML Time Bar --></td><TD></TD></tr></TABLE>
<!-- END MOUSELAB TABLE -->
<!--BEGIN postHTML-->
<div class="footer" id="footer" align="center">Infos bitte an: <a href=mailto:ZeitdruckExp@hsu-hh.de>ZeitdruckExp@hsu-hh.de</a><br>Dieses Experiment wird unterst?tzt von den <I>Freunden und F?rderern der Helmut-Schmidt-Universit?t Hamburg e.V. <b>.</b></I></div>

<!--END postHTML--></FORM></body></html>
