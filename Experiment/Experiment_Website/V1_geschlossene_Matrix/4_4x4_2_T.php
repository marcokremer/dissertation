<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><HTML>
<HEAD>
<TITLE>Runde 3</TITLE>
<script language=javascript src="mmlweb.js"></SCRIPT>
<link rel="stylesheet" href="mlweb.css" type="text/css">
</head>
<body onLoad="timefunction('onload','body','body')">
<!--BEGIN TABLE STRUCTURE-->
<SCRIPT language="javascript">
//override defaults
mlweb_outtype="CSV";
mlweb_fname="mlwebform";
tag = "a0^a1^a2^a3`"
 + "b0^b1^b2^b3`"
 + "c0^c1^c2^c3`"
 + "d0^d1^d2^d3";

txt = "0 ; 0^78 ; 0^0 ; 156^78 ; 78`"
 + "0 ; 78^117 ; 117^0 ; 156^78 ; 156`"
 + "156 ; 0^156 ; 0^156 ; 156^78 ; 156`"
 + "78 ; 78^156 ; 78^156 ; 78^78 ; 78`"

state = "1^1^1^1`"
 + "1^1^1^1`"
 + "1^1^1^1`"
 + "1^1^1^1";

box = "a0^a1^a2^a3`"
 + "b0^b1^b2^b3`"
 + "c0^c1^c2^c3`"
 + "d0^d1^d2^d3";

CBCol = "0^0^0^0";
CBRow = "1^1^0^0";
W_Col = "100^100^100^100";
H_Row = "50^50^50^50";

chkchoice = false;
btnFlg = 2;
btnType = "button";
btntxt = "Strategie 1^Strategie 2^Strategie 3^Strategie 4";
btnstate = "1^1^1^1";
btntag = "btn1^btn2^btn3^btn4";
to_email = "";
colFix = false;
rowFix = true;
CBpreset = false;
evtOpen = 1;
evtClose = 1;
chkFrm=false;
warningTxt = "Some questions have not been answered. Please answer all questions before continuing!";
tmTotalSec = 12;
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

//Delay: a0 a1 a2 a3 b0 b1 b2 b3 c0 c1 c2 c3 d0 d1 d2 d3
delay = "0^0^0^0^0^0^0^0^0^0^0^0^0^0^0^0`"
 + "0^0^0^0^0^0^0^0^0^0^0^0^0^0^0^0`"
 + "0^0^0^0^0^0^0^0^0^0^0^0^0^0^0^0`"
 + "0^0^0^0^0^0^0^0^0^0^0^0^0^0^0^0`"
 + "0^0^0^0^0^0^0^0^0^0^0^0^0^0^0^0`"
 + "0^0^0^0^0^0^0^0^0^0^0^0^0^0^0^0`"
 + "0^0^0^0^0^0^0^0^0^0^0^0^0^0^0^0`"
 + "0^0^0^0^0^0^0^0^0^0^0^0^0^0^0^0`"
 + "0^0^0^0^0^0^0^0^0^0^0^0^0^0^0^0`"
 + "0^0^0^0^0^0^0^0^0^0^0^0^0^0^0^0`"
 + "0^0^0^0^0^0^0^0^0^0^0^0^0^0^0^0`"
 + "0^0^0^0^0^0^0^0^0^0^0^0^0^0^0^0`"
 + "0^0^0^0^0^0^0^0^0^0^0^0^0^0^0^0`"
 + "0^0^0^0^0^0^0^0^0^0^0^0^0^0^0^0`"
 + "0^0^0^0^0^0^0^0^0^0^0^0^0^0^0^0`"
 + "0^0^0^0^0^0^0^0^0^0^0^0^0^0^0^0";
activeClass = "actTD";
inactiveClass = "inactTD";
boxClass = "boxTD";
cssname = "mlweb.css";
nextURL = "EndeRunde3_T.html";
expname = "4_4x4_2_T.php";
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
document.mlwebform.transf.value=transform;
var inhalt=document.cookie;
if (inhalt.indexOf("v1")>-1){document.mlwebform.expversion.value="v1";}else{document.mlwebform.expversion.value="v2";}
var komma=inhalt.indexOf(",");
subject_inhalt=inhalt.slice(0,komma);
document.mlwebform.wonne.value=subject_inhalt;
</script>
<!--BEGIN preHTML-->
<p>Du bist der Zeilenspieler. Deine Aufgabe ist es nun, diejenige Strategie zu w�hlen, mit der du die h�chste Auszahlung f�r dich generierst!</p>


<!--END preHTML-->
<!-- MOUSELAB TABLE -->
<TABLE border=1>
<TR>
<!--cell a0(tag:a0)-->
<TD align=center valign=middle><DIV ID="a0_cont" style="position: relative; height: 50px; width: 100px;"><DIV ID="a0_txt" STYLE="position: absolute; left: 0px; top: 0px; height: 50px; width: 100px; clip: rect(0px 100px 50px 0px); z-index: 1;"><TABLE><TD ID="a0_td" align=center valign=center width=95 height=45 class="actTD">1,-1</TD></TABLE></DIV><DIV ID="a0_box" STYLE="position: absolute; left: 0px; top: 0px; height: 50px; width: 100px; clip: rect(0px 100px 50px 0px); z-index: 2;"><TABLE><TD ID="a0_tdbox" align=center valign=center width=95 height=45 class="boxTD">a0</TD></TABLE></DIV><DIV ID="a0_img" STYLE="position: absolute; left: 0px; top: 0px; height: 50px; width: 100px; z-index: 5;"><A HREF="javascript:void(0);" NAME="a0" onClick="SwitchCont('a0',event)" onMouseOver="timefunction('mouseover','a0','in')" onMouseOut="timefunction('mouseout','a0','out')" onMouseMove="timefunction_2(event,'a0')"><IMG NAME="a0" SRC="transp.gif" border=0 width=100 height=50></A></DIV></DIV></TD>
<!--end cell-->
<!--cell a1(tag:a1)-->
<TD align=center valign=middle><DIV ID="a1_cont" style="position: relative; height: 50px; width: 100px;"><DIV ID="a1_txt" STYLE="position: absolute; left: 0px; top: 0px; height: 50px; width: 100px; clip: rect(0px 100px 50px 0px); z-index: 1;"><TABLE><TD ID="a1_td" align=center valign=center width=95 height=45 class="actTD">-1,1</TD></TABLE></DIV><DIV ID="a1_box" STYLE="position: absolute; left: 0px; top: 0px; height: 50px; width: 100px; clip: rect(0px 100px 50px 0px); z-index: 2;"><TABLE><TD ID="a1_tdbox" align=center valign=center width=95 height=45 class="boxTD">a1</TD></TABLE></DIV><DIV ID="a1_img" STYLE="position: absolute; left: 0px; top: 0px; height: 50px; width: 100px; z-index: 5;"><A HREF="javascript:void(0);" NAME="a1" onClick="SwitchCont('a1',event)" onMouseOver="timefunction('mouseover','a1','in')" onMouseOut="timefunction('mouseout','a1','out')" onMouseMove="timefunction_2(event,'a1')"><IMG NAME="a1" SRC="transp.gif" border=0 width=100 height=50></A></DIV></DIV></TD>
<!--end cell-->
<!--cell a2(tag:a2)-->
<TD align=center valign=middle><DIV ID="a2_cont" style="position: relative; height: 50px; width: 100px;"><DIV ID="a2_txt" STYLE="position: absolute; left: 0px; top: 0px; height: 50px; width: 100px; clip: rect(0px 100px 50px 0px); z-index: 1;"><TABLE><TD ID="a2_td" align=center valign=center width=95 height=45 class="actTD">1,1</TD></TABLE></DIV><DIV ID="a2_box" STYLE="position: absolute; left: 0px; top: 0px; height: 50px; width: 100px; clip: rect(0px 100px 50px 0px); z-index: 2;"><TABLE><TD ID="a2_tdbox" align=center valign=center width=95 height=45 class="boxTD">a2</TD></TABLE></DIV><DIV ID="a2_img" STYLE="position: absolute; left: 0px; top: 0px; height: 50px; width: 100px; z-index: 5;"><A HREF="javascript:void(0);" NAME="a2" onClick="SwitchCont('a2',event)" onMouseOver="timefunction('mouseover','a2','in')" onMouseOut="timefunction('mouseout','a2','out')" onMouseMove="timefunction_2(event,'a2')"><IMG NAME="a2" SRC="transp.gif" border=0 width=100 height=50></A></DIV></DIV></TD>
<!--end cell-->
<!--cell a3(tag:a3)-->
<TD align=center valign=middle><DIV ID="a3_cont" style="position: relative; height: 50px; width: 100px;"><DIV ID="a3_txt" STYLE="position: absolute; left: 0px; top: 0px; height: 50px; width: 100px; clip: rect(0px 100px 50px 0px); z-index: 1;"><TABLE><TD ID="a3_td" align=center valign=center width=95 height=45 class="actTD">1,1</TD></TABLE></DIV><DIV ID="a3_box" STYLE="position: absolute; left: 0px; top: 0px; height: 50px; width: 100px; clip: rect(0px 100px 50px 0px); z-index: 2;"><TABLE><TD ID="a3_tdbox" align=center valign=center width=95 height=45 class="boxTD">a3</TD></TABLE></DIV><DIV ID="a3_img" STYLE="position: absolute; left: 0px; top: 0px; height: 50px; width: 100px; z-index: 5;"><A HREF="javascript:void(0);" NAME="a3" onClick="SwitchCont('a3',event)" onMouseOver="timefunction('mouseover','a3','in')" onMouseOut="timefunction('mouseout','a3','out')" onMouseMove="timefunction_2(event,'a3')"><IMG NAME="a3" SRC="transp.gif" border=0 width=100 height=50></A></DIV></DIV></TD>
<!--end cell--><TD ID="btn_0" style="border-left-style: none; border-right-style: none; border-bottom-style: none;" align=center valign=middle><INPUT type="button" class="btnStyle" name="btn1" value="Strategie 1" onMouseOver="timefunction('mouseover','btn1','Strategie 1')" onClick="recChoice('onclick','btn1','Strategie 1')" onMouseOut="timefunction('mouseout','btn1','Strategie 1')"></TD><TD rowspan="5"><INPUT type="button" value="fertig" style="height: 225px;" onClick=erwartungswert('submit','submit','submit') ></TD>
</TR><TR>
<!--cell b0(tag:b0)-->
<TD align=center valign=middle><DIV ID="b0_cont" style="position: relative; height: 50px; width: 100px;"><DIV ID="b0_txt" STYLE="position: absolute; left: 0px; top: 0px; height: 50px; width: 100px; clip: rect(0px 100px 50px 0px); z-index: 1;"><TABLE><TD ID="b0_td" align=center valign=center width=95 height=45 class="actTD">-1,1</TD></TABLE></DIV><DIV ID="b0_box" STYLE="position: absolute; left: 0px; top: 0px; height: 50px; width: 100px; clip: rect(0px 100px 50px 0px); z-index: 2;"><TABLE><TD ID="b0_tdbox" align=center valign=center width=95 height=45 class="boxTD">b0</TD></TABLE></DIV><DIV ID="b0_img" STYLE="position: absolute; left: 0px; top: 0px; height: 50px; width: 100px; z-index: 5;"><A HREF="javascript:void(0);" NAME="b0" onClick="SwitchCont('b0',event)" onMouseOver="timefunction('mouseover','b0','in')" onMouseOut="timefunction('mouseout','b0','out')" onMouseMove="timefunction_2(event,'b0')"><IMG NAME="b0" SRC="transp.gif" border=0 width=100 height=50></A></DIV></DIV></TD>
<!--end cell-->
<!--cell b1(tag:b1)-->
<TD align=center valign=middle><DIV ID="b1_cont" style="position: relative; height: 50px; width: 100px;"><DIV ID="b1_txt" STYLE="position: absolute; left: 0px; top: 0px; height: 50px; width: 100px; clip: rect(0px 100px 50px 0px); z-index: 1;"><TABLE><TD ID="b1_td" align=center valign=center width=95 height=45 class="actTD">1,-1</TD></TABLE></DIV><DIV ID="b1_box" STYLE="position: absolute; left: 0px; top: 0px; height: 50px; width: 100px; clip: rect(0px 100px 50px 0px); z-index: 2;"><TABLE><TD ID="b1_tdbox" align=center valign=center width=95 height=45 class="boxTD">b1</TD></TABLE></DIV><DIV ID="b1_img" STYLE="position: absolute; left: 0px; top: 0px; height: 50px; width: 100px; z-index: 5;"><A HREF="javascript:void(0);" NAME="b1" onClick="SwitchCont('b1',event)" onMouseOver="timefunction('mouseover','b1','in')" onMouseOut="timefunction('mouseout','b1','out')" onMouseMove="timefunction_2(event,'b1')"><IMG NAME="b1" SRC="transp.gif" border=0 width=100 height=50></A></DIV></DIV></TD>
<!--end cell-->
<!--cell b2(tag:b2)-->
<TD align=center valign=middle><DIV ID="b2_cont" style="position: relative; height: 50px; width: 100px;"><DIV ID="b2_txt" STYLE="position: absolute; left: 0px; top: 0px; height: 50px; width: 100px; clip: rect(0px 100px 50px 0px); z-index: 1;"><TABLE><TD ID="b2_td" align=center valign=center width=95 height=45 class="actTD">1,1</TD></TABLE></DIV><DIV ID="b2_box" STYLE="position: absolute; left: 0px; top: 0px; height: 50px; width: 100px; clip: rect(0px 100px 50px 0px); z-index: 2;"><TABLE><TD ID="b2_tdbox" align=center valign=center width=95 height=45 class="boxTD">b2</TD></TABLE></DIV><DIV ID="b2_img" STYLE="position: absolute; left: 0px; top: 0px; height: 50px; width: 100px; z-index: 5;"><A HREF="javascript:void(0);" NAME="b2" onClick="SwitchCont('b2',event)" onMouseOver="timefunction('mouseover','b2','in')" onMouseOut="timefunction('mouseout','b2','out')" onMouseMove="timefunction_2(event,'b2')"><IMG NAME="b2" SRC="transp.gif" border=0 width=100 height=50></A></DIV></DIV></TD>
<!--end cell-->
<!--cell b3(tag:b3)-->
<TD align=center valign=middle><DIV ID="b3_cont" style="position: relative; height: 50px; width: 100px;"><DIV ID="b3_txt" STYLE="position: absolute; left: 0px; top: 0px; height: 50px; width: 100px; clip: rect(0px 100px 50px 0px); z-index: 1;"><TABLE><TD ID="b3_td" align=center valign=center width=95 height=45 class="actTD">1,1</TD></TABLE></DIV><DIV ID="b3_box" STYLE="position: absolute; left: 0px; top: 0px; height: 50px; width: 100px; clip: rect(0px 100px 50px 0px); z-index: 2;"><TABLE><TD ID="b3_tdbox" align=center valign=center width=95 height=45 class="boxTD">b3</TD></TABLE></DIV><DIV ID="b3_img" STYLE="position: absolute; left: 0px; top: 0px; height: 50px; width: 100px; z-index: 5;"><A HREF="javascript:void(0);" NAME="b3" onClick="SwitchCont('b3',event)" onMouseOver="timefunction('mouseover','b3','in')" onMouseOut="timefunction('mouseout','b3','out')" onMouseMove="timefunction_2(event,'b3')"><IMG NAME="b3" SRC="transp.gif" border=0 width=100 height=50></A></DIV></DIV></TD>
<!--end cell--><TD ID="btn_1" style="border-left-style: none; border-right-style: none; border-bottom-style: none;" align=center valign=middle><INPUT type="button" class="btnStyle" name="btn2" value="Strategie 2" onMouseOver="timefunction('mouseover','btn2','Strategie 2')" onClick="recChoice('onclick','btn2','Strategie 2')" onMouseOut="timefunction('mouseout','btn2','Strategie 2')"></TD><TD></TD>
</TR><TR>
<!--cell c0(tag:c0)-->
<TD align=center valign=middle><DIV ID="c0_cont" style="position: relative; height: 50px; width: 100px;"><DIV ID="c0_txt" STYLE="position: absolute; left: 0px; top: 0px; height: 50px; width: 100px; clip: rect(0px 100px 50px 0px); z-index: 1;"><TABLE><TD ID="c0_td" align=center valign=center width=95 height=45 class="actTD">1,1</TD></TABLE></DIV><DIV ID="c0_box" STYLE="position: absolute; left: 0px; top: 0px; height: 50px; width: 100px; clip: rect(0px 100px 50px 0px); z-index: 2;"><TABLE><TD ID="c0_tdbox" align=center valign=center width=95 height=45 class="boxTD">c0</TD></TABLE></DIV><DIV ID="c0_img" STYLE="position: absolute; left: 0px; top: 0px; height: 50px; width: 100px; z-index: 5;"><A HREF="javascript:void(0);" NAME="c0" onClick="SwitchCont('c0',event)" onMouseOver="timefunction('mouseover','c0','in')" onMouseOut="timefunction('mouseout','c0','out')" onMouseMove="timefunction_2(event,'c0')"><IMG NAME="c0" SRC="transp.gif" border=0 width=100 height=50></A></DIV></DIV></TD>
<!--end cell-->
<!--cell c1(tag:c1)-->
<TD align=center valign=middle><DIV ID="c1_cont" style="position: relative; height: 50px; width: 100px;"><DIV ID="c1_txt" STYLE="position: absolute; left: 0px; top: 0px; height: 50px; width: 100px; clip: rect(0px 100px 50px 0px); z-index: 1;"><TABLE><TD ID="c1_td" align=center valign=center width=95 height=45 class="actTD">1,1</TD></TABLE></DIV><DIV ID="c1_box" STYLE="position: absolute; left: 0px; top: 0px; height: 50px; width: 100px; clip: rect(0px 100px 50px 0px); z-index: 2;"><TABLE><TD ID="c1_tdbox" align=center valign=center width=95 height=45 class="boxTD">c1</TD></TABLE></DIV><DIV ID="c1_img" STYLE="position: absolute; left: 0px; top: 0px; height: 50px; width: 100px; z-index: 5;"><A HREF="javascript:void(0);" NAME="c1" onClick="SwitchCont('c1',event)" onMouseOver="timefunction('mouseover','c1','in')" onMouseOut="timefunction('mouseout','c1','out')" onMouseMove="timefunction_2(event,'c1')"><IMG NAME="c1" SRC="transp.gif" border=0 width=100 height=50></A></DIV></DIV></TD>
<!--end cell-->
<!--cell c2(tag:c2)-->
<TD align=center valign=middle><DIV ID="c2_cont" style="position: relative; height: 50px; width: 100px;"><DIV ID="c2_txt" STYLE="position: absolute; left: 0px; top: 0px; height: 50px; width: 100px; clip: rect(0px 100px 50px 0px); z-index: 1;"><TABLE><TD ID="c2_td" align=center valign=center width=95 height=45 class="actTD">1,1</TD></TABLE></DIV><DIV ID="c2_box" STYLE="position: absolute; left: 0px; top: 0px; height: 50px; width: 100px; clip: rect(0px 100px 50px 0px); z-index: 2;"><TABLE><TD ID="c2_tdbox" align=center valign=center width=95 height=45 class="boxTD">c2</TD></TABLE></DIV><DIV ID="c2_img" STYLE="position: absolute; left: 0px; top: 0px; height: 50px; width: 100px; z-index: 5;"><A HREF="javascript:void(0);" NAME="c2" onClick="SwitchCont('c2',event)" onMouseOver="timefunction('mouseover','c2','in')" onMouseOut="timefunction('mouseout','c2','out')" onMouseMove="timefunction_2(event,'c2')"><IMG NAME="c2" SRC="transp.gif" border=0 width=100 height=50></A></DIV></DIV></TD>
<!--end cell-->
<!--cell c3(tag:c3)-->
<TD align=center valign=middle><DIV ID="c3_cont" style="position: relative; height: 50px; width: 100px;"><DIV ID="c3_txt" STYLE="position: absolute; left: 0px; top: 0px; height: 50px; width: 100px; clip: rect(0px 100px 50px 0px); z-index: 1;"><TABLE><TD ID="c3_td" align=center valign=center width=95 height=45 class="actTD">1,1</TD></TABLE></DIV><DIV ID="c3_box" STYLE="position: absolute; left: 0px; top: 0px; height: 50px; width: 100px; clip: rect(0px 100px 50px 0px); z-index: 2;"><TABLE><TD ID="c3_tdbox" align=center valign=center width=95 height=45 class="boxTD">c3</TD></TABLE></DIV><DIV ID="c3_img" STYLE="position: absolute; left: 0px; top: 0px; height: 50px; width: 100px; z-index: 5;"><A HREF="javascript:void(0);" NAME="c3" onClick="SwitchCont('c3',event)" onMouseOver="timefunction('mouseover','c3','in')" onMouseOut="timefunction('mouseout','c3','out')" onMouseMove="timefunction_2(event,'c3')"><IMG NAME="c3" SRC="transp.gif" border=0 width=100 height=50></A></DIV></DIV></TD>
<!--end cell--><TD ID="btn_2" style="border-left-style: none; border-right-style: none; border-bottom-style: none;" align=center valign=middle><INPUT type="button" class="btnStyle" name="btn3" value="Strategie 3" onMouseOver="timefunction('mouseover','btn3','Strategie 3')" onClick="recChoice('onclick','btn3','Strategie 3')" onMouseOut="timefunction('mouseout','btn3','Strategie 3')"></TD><TD></TD>
</TR><TR>
<!--cell d0(tag:d0)-->
<TD align=center valign=middle><DIV ID="d0_cont" style="position: relative; height: 50px; width: 100px;"><DIV ID="d0_txt" STYLE="position: absolute; left: 0px; top: 0px; height: 50px; width: 100px; clip: rect(0px 100px 50px 0px); z-index: 1;"><TABLE><TD ID="d0_td" align=center valign=center width=95 height=45 class="actTD">1,1</TD></TABLE></DIV><DIV ID="d0_box" STYLE="position: absolute; left: 0px; top: 0px; height: 50px; width: 100px; clip: rect(0px 100px 50px 0px); z-index: 2;"><TABLE><TD ID="d0_tdbox" align=center valign=center width=95 height=45 class="boxTD">d0</TD></TABLE></DIV><DIV ID="d0_img" STYLE="position: absolute; left: 0px; top: 0px; height: 50px; width: 100px; z-index: 5;"><A HREF="javascript:void(0);" NAME="d0" onClick="SwitchCont('d0',event)" onMouseOver="timefunction('mouseover','d0','in')" onMouseOut="timefunction('mouseout','d0','out')" onMouseMove="timefunction_2(event,'d0')"><IMG NAME="d0" SRC="transp.gif" border=0 width=100 height=50></A></DIV></DIV></TD>
<!--end cell-->
<!--cell d1(tag:d1)-->
<TD align=center valign=middle><DIV ID="d1_cont" style="position: relative; height: 50px; width: 100px;"><DIV ID="d1_txt" STYLE="position: absolute; left: 0px; top: 0px; height: 50px; width: 100px; clip: rect(0px 100px 50px 0px); z-index: 1;"><TABLE><TD ID="d1_td" align=center valign=center width=95 height=45 class="actTD">1,1</TD></TABLE></DIV><DIV ID="d1_box" STYLE="position: absolute; left: 0px; top: 0px; height: 50px; width: 100px; clip: rect(0px 100px 50px 0px); z-index: 2;"><TABLE><TD ID="d1_tdbox" align=center valign=center width=95 height=45 class="boxTD">d1</TD></TABLE></DIV><DIV ID="d1_img" STYLE="position: absolute; left: 0px; top: 0px; height: 50px; width: 100px; z-index: 5;"><A HREF="javascript:void(0);" NAME="d1" onClick="SwitchCont('d1',event)" onMouseOver="timefunction('mouseover','d1','in')" onMouseOut="timefunction('mouseout','d1','out')" onMouseMove="timefunction_2(event,'d1')"><IMG NAME="d1" SRC="transp.gif" border=0 width=100 height=50></A></DIV></DIV></TD>
<!--end cell-->
<!--cell d2(tag:d2)-->
<TD align=center valign=middle><DIV ID="d2_cont" style="position: relative; height: 50px; width: 100px;"><DIV ID="d2_txt" STYLE="position: absolute; left: 0px; top: 0px; height: 50px; width: 100px; clip: rect(0px 100px 50px 0px); z-index: 1;"><TABLE><TD ID="d2_td" align=center valign=center width=95 height=45 class="actTD">1,1</TD></TABLE></DIV><DIV ID="d2_box" STYLE="position: absolute; left: 0px; top: 0px; height: 50px; width: 100px; clip: rect(0px 100px 50px 0px); z-index: 2;"><TABLE><TD ID="d2_tdbox" align=center valign=center width=95 height=45 class="boxTD">d2</TD></TABLE></DIV><DIV ID="d2_img" STYLE="position: absolute; left: 0px; top: 0px; height: 50px; width: 100px; z-index: 5;"><A HREF="javascript:void(0);" NAME="d2" onClick="SwitchCont('d2',event)" onMouseOver="timefunction('mouseover','d2','in')" onMouseOut="timefunction('mouseout','d2','out')" onMouseMove="timefunction_2(event,'d2')"><IMG NAME="d2" SRC="transp.gif" border=0 width=100 height=50></A></DIV></DIV></TD>
<!--end cell-->
<!--cell d3(tag:d3)-->
<TD align=center valign=middle><DIV ID="d3_cont" style="position: relative; height: 50px; width: 100px;"><DIV ID="d3_txt" STYLE="position: absolute; left: 0px; top: 0px; height: 50px; width: 100px; clip: rect(0px 100px 50px 0px); z-index: 1;"><TABLE><TD ID="d3_td" align=center valign=center width=95 height=45 class="actTD">1,1</TD></TABLE></DIV><DIV ID="d3_box" STYLE="position: absolute; left: 0px; top: 0px; height: 50px; width: 100px; clip: rect(0px 100px 50px 0px); z-index: 2;"><TABLE><TD ID="d3_tdbox" align=center valign=center width=95 height=45 class="boxTD">d3</TD></TABLE></DIV><DIV ID="d3_img" STYLE="position: absolute; left: 0px; top: 0px; height: 50px; width: 100px; z-index: 5;"><A HREF="javascript:void(0);" NAME="d3" onClick="SwitchCont('d3',event)" onMouseOver="timefunction('mouseover','d3','in')" onMouseOut="timefunction('mouseout','d3','out')" onMouseMove="timefunction_2(event,'d3')"><IMG NAME="d3" SRC="transp.gif" border=0 width=100 height=50></A></DIV></DIV></TD>
<!--end cell--><TD ID="btn_3" style="border-left-style: none; border-right-style: none; border-bottom-style: none;" align=center valign=middle><INPUT type="button" class="btnStyle" name="btn4" value="Strategie 4" onMouseOver="timefunction('mouseover','btn4','Strategie 4')" onClick="recChoice('onclick','btn4','Strategie 4')" onMouseOut="timefunction('mouseout','btn4','Strategie 4')"></TD><TD></TD>
</TR><tr><td colspan=4><!-- Begin HTML Time Bar --><table><tr><td>Timer: </td><td colspan=2><div id="tmCont" class="tmCont"><div id="tmBar" class="tmBar"></div><div id="tmTime" class="tmTime"></div></div></td></TR></table><!-- End HTML Time Bar --></td><TD></TD></tr></TABLE>
<!-- END MOUSELAB TABLE -->
<!--BEGIN postHTML-->
<div class="footer" id="footer" align="center">Infos bitte an: <a href=mailto:ZeitdruckExp@hsu-hh.de>ZeitdruckExp@hsu-hh.de</a><br>Dieses Experiment wird unterst�tzt von den <I>Freunden und F�rderern der Helmut-Schmidt-Universit�t Hamburg e.V. <b>.</b></I></div>

<!--END postHTML--></FORM></body></html>
