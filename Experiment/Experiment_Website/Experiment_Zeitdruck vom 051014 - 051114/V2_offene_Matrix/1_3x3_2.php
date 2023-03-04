<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><HTML>
<HEAD>
<TITLE>Runde 2</TITLE>
<script language=javascript src="mmlweb.js"></SCRIPT>
<link rel="stylesheet" href="mlweb.css" type="text/css">
</head>
<body onLoad="timefunction('onload','body','body')">
<!--BEGIN TABLE STRUCTURE-->
<SCRIPT language="javascript">
//override defaults
mlweb_outtype="CSV";
mlweb_fname="mlwebform";
tag = "a0^a1^a2`"
 + "b0^b1^b2`"
 + "c0^c1^c2";

txt = "0 ; 0^0 ; 0^0 ; 0`"
 + "0 ; 0^0 ; 0^0 ; 0`"
 + "0 ; 0^0 ; 0^0 ; 0`"

state = "0^0^0`"
 + "0^0^0`"
 + "0^0^0";

box = "a0^a1^a2`"
 + "b0^b1^b2`"
 + "c0^c1^c2";

CBCol = "0^0^0";
CBRow = "1^1^0";
W_Col = "100^100^100";
H_Row = "50^50^50";

chkchoice = false;
btnFlg = 2;
btnType = "button";
btntxt = "Strategie 1^Strategie 2^Strategie 3";
btnstate = "1^1^1";
btntag = "btn1^btn2^btn3";
to_email = "";
colFix = false;
rowFix = true;
CBpreset = false;
evtOpen = 1;
evtClose = 1;
chkFrm=false;
warningTxt = "Some questions have not been answered. Please answer all questions before continuing!";
tmTotalSec = 75;
tmStepSec = 1;
tmWidthPx = 200;
tmFill = false;
tmShowTime = true;
tmCurTime = 0;
tmActive = true;
tmDirectStart = true;
tmMinLabel = "min";
tmSecLabel = "sec";
tmLabel = "Timer: ";

//Delay: a0 a1 a2 b0 b1 b2 c0 c1 c2
delay = "0^0^0^0^0^0^0^0^0`"
 + "0^0^0^0^0^0^0^0^0`"
 + "0^0^0^0^0^0^0^0^0`"
 + "0^0^0^0^0^0^0^0^0`"
 + "0^0^0^0^0^0^0^0^0`"
 + "0^0^0^0^0^0^0^0^0`"
 + "0^0^0^0^0^0^0^0^0`"
 + "0^0^0^0^0^0^0^0^0`"
 + "0^0^0^0^0^0^0^0^0";
activeClass = "actTD";
inactiveClass = "inactTD";
boxClass = "boxTD";
cssname = "mlweb.css";
nextURL = "2_3x3_2.php";
expname = "1_3x3_2.php";
randomOrder = true;
recOpenCells = true;
masterCond = 1;
loadMatrices();
</SCRIPT>
<!--END TABLE STRUCTURE-->

<FORM name="mlwebform" onSubmit="return checkForm(this)" method="POST" action="msave.php"><INPUT type=hidden name="procdata" value="">
<input type=hidden name="wonne" value="">
<input type=hidden name="expname" value="">
<input type=hidden name="expversion" value="">
<input type=hidden name="nextURL" value="">
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
<p>Du bist der Zeilenspieler. Deine Aufgabe ist es nun, alle diejenigen Strategien zu eliminieren, die du ganz sicher nicht spielen wirst!
Benutze dabei die Maus als Gedankenstütze.</p>

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
<!--end cell--><TD ID="btn_0" style="border-left-style: none; border-right-style: none; border-bottom-style: none;" align=center valign=middle><INPUT type="button" class="btnStyle" name="btn1" value="Strategie 1" onMouseOver="timefunction('mouseover','btn1','Strategie 1')" onClick="recChoice('onclick','btn1','Strategie 1')" onMouseOut="timefunction('mouseout','btn1','Strategie 1')"></TD><TD rowspan="4"><INPUT type="button" value="fertig" style="height: 180px;" onClick=erwartungswert('submit','submit','submit') ></TD>
</TR><TR>
<!--cell b0(tag:b0)-->
<TD align=center valign=middle><DIV ID="b0_cont" style="position: relative; height: 50px; width: 100px;"><DIV ID="b0_txt" STYLE="position: absolute; left: 0px; top: 0px; height: 50px; width: 100px; clip: rect(0px 100px 50px 0px); z-index: 1;"><TABLE><TD ID="b0_td" align=center valign=center width=95 height=45 class="actTD">-1,1</TD></TABLE></DIV><DIV ID="b0_box" STYLE="position: absolute; left: 0px; top: 0px; height: 50px; width: 100px; clip: rect(0px 100px 50px 0px); z-index: 2;"><TABLE><TD ID="b0_tdbox" align=center valign=center width=95 height=45 class="boxTD">b0</TD></TABLE></DIV><DIV ID="b0_img" STYLE="position: absolute; left: 0px; top: 0px; height: 50px; width: 100px; z-index: 5;"><A HREF="javascript:void(0);" NAME="b0" onClick="SwitchCont('b0',event)" onMouseOver="timefunction('mouseover','b0','in')" onMouseOut="timefunction('mouseout','b0','out')" onMouseMove="timefunction_2(event,'b0')"><IMG NAME="b0" SRC="transp.gif" border=0 width=100 height=50></A></DIV></DIV></TD>
<!--end cell-->
<!--cell b1(tag:b1)-->
<TD align=center valign=middle><DIV ID="b1_cont" style="position: relative; height: 50px; width: 100px;"><DIV ID="b1_txt" STYLE="position: absolute; left: 0px; top: 0px; height: 50px; width: 100px; clip: rect(0px 100px 50px 0px); z-index: 1;"><TABLE><TD ID="b1_td" align=center valign=center width=95 height=45 class="actTD">1,-1</TD></TABLE></DIV><DIV ID="b1_box" STYLE="position: absolute; left: 0px; top: 0px; height: 50px; width: 100px; clip: rect(0px 100px 50px 0px); z-index: 2;"><TABLE><TD ID="b1_tdbox" align=center valign=center width=95 height=45 class="boxTD">b1</TD></TABLE></DIV><DIV ID="b1_img" STYLE="position: absolute; left: 0px; top: 0px; height: 50px; width: 100px; z-index: 5;"><A HREF="javascript:void(0);" NAME="b1" onClick="SwitchCont('b1',event)" onMouseOver="timefunction('mouseover','b1','in')" onMouseOut="timefunction('mouseout','b1','out')" onMouseMove="timefunction_2(event,'b1')"><IMG NAME="b1" SRC="transp.gif" border=0 width=100 height=50></A></DIV></DIV></TD>
<!--end cell-->
<!--cell b2(tag:b2)-->
<TD align=center valign=middle><DIV ID="b2_cont" style="position: relative; height: 50px; width: 100px;"><DIV ID="b2_txt" STYLE="position: absolute; left: 0px; top: 0px; height: 50px; width: 100px; clip: rect(0px 100px 50px 0px); z-index: 1;"><TABLE><TD ID="b2_td" align=center valign=center width=95 height=45 class="actTD">1,1</TD></TABLE></DIV><DIV ID="b2_box" STYLE="position: absolute; left: 0px; top: 0px; height: 50px; width: 100px; clip: rect(0px 100px 50px 0px); z-index: 2;"><TABLE><TD ID="b2_tdbox" align=center valign=center width=95 height=45 class="boxTD">b2</TD></TABLE></DIV><DIV ID="b2_img" STYLE="position: absolute; left: 0px; top: 0px; height: 50px; width: 100px; z-index: 5;"><A HREF="javascript:void(0);" NAME="b2" onClick="SwitchCont('b2',event)" onMouseOver="timefunction('mouseover','b2','in')" onMouseOut="timefunction('mouseout','b2','out')" onMouseMove="timefunction_2(event,'b2')"><IMG NAME="b2" SRC="transp.gif" border=0 width=100 height=50></A></DIV></DIV></TD>
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
<!--end cell--><TD ID="btn_2" style="border-left-style: none; border-right-style: none; border-bottom-style: none;" align=center valign=middle><INPUT type="button" class="btnStyle" name="btn3" value="Strategie 3" onMouseOver="timefunction('mouseover','btn3','Strategie 3')" onClick="recChoice('onclick','btn3','Strategie 3')" onMouseOut="timefunction('mouseout','btn3','Strategie 3')"></TD><TD></TD>
</TR><tr><td colspan=3><!-- Begin HTML Time Bar --><table><tr><td>Timer: </td><td colspan=2><div id="tmCont" class="tmCont"><div id="tmBar" class="tmBar"></div><div id="tmTime" class="tmTime"></div></div></td></TR></table><!-- End HTML Time Bar --></td><TD></TD></tr></TABLE>
<!-- END MOUSELAB TABLE -->
<!--BEGIN postHTML-->
<div class="footer" id="footer" align="center">Infos bitte an: <a href=mailto:ZeitdruckExp@hsu-hh.de>ZeitdruckExp@hsu-hh.de</a><br>Dieses Experiment wird unterstützt von den <I>Freunden und Förderern der Helmut-Schmidt-Universität Hamburg e.V. <b>.</b></I></div>

<!--END postHTML--></FORM></body></html>
