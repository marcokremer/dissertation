<HTML>
<HEAD>
<TITLE>Tipp 4/4</TITLE>
<script language=javascript src="mmlweb.js"></SCRIPT>
<link rel="stylesheet" href="mlweb.css" type="text/css">
<script language="javascript">
if(document.cookie){
	var expversion="";
	var inhalt=document.cookie;
	if(inhalt.indexOf("v3")>-1){expversion="v3";}
	else{
		if(inhalt.indexOf("v1")>-1){expversion="v1";}
		else{expversion="v2";}
	    }
}else{alert("Bitte Cookies aktivieren!");}

function FokusaufKnopf()
{
document.getElementById("Button1").focus();
}

function start_exp()
{
v1="http://localhost/Experimentdateien/Experiment_Zeitdruck_V3/Vorschlag1_geschlossene_Matrix/Repetitorium.php";
v2="http://localhost/Experimentdateien/Experiment_Zeitdruck_V3/Vorschlag2_offene_Matrix/Repetitorium2.php";
if(expversion=="v1" || expversion=="v3"){nextURL=v1;}else{nextURL=v2;}
var newWind=window.open(nextURL,"survey","height="+(screen.availHeight-60).toString()+",width="+(screen.availWidth-30).toString() +",scrollbars,status,resizable, left=2, top=2")
}

function Instruktionen()
{
if(expversion=="v3"){window.location.href="Instruktionen3.php";}else{window.location.href="Instruktionen1.php";}
}

</script>
</head>
<body onload=FokusaufKnopf()>
<h1>Tipp IV von IV</h1>
<form>


<TABLE><TR><TD valign="top" style="width:150 px"><br> </TD><TD valign="top"><br><p>Die Spieltheorie ist unter 
anderem einem breiten Publikum bekannt geworden durch die Verfilmung des Lebens einer der prominentesten Vertreter 
dieses Wissenschaftszweiges - John Forbes Nash Jr., mit Russell Crowe in der Hauptrolle (<I>"A beautiful mind."</I>).
</p><p>In neuester Zeit fand sie aber auch ihre wissenschaftliche Würdigung durch die Vergabe von mittlerweile acht 
Wirtschafts-Nobel-Preisen an Forscher, die sich auf dem Gebiet der Spieltheorie verdient gemacht haben.</p>
<br><p>Wie möchtest du weiter vorgehen?</p><br></TD></TR>
<TR><TD colspan=2 align="center"><input type="button" name="Button2" value="vorheriger Tipp" onClick="window.location.href='Tipps3.php'"><input type="button" name="Button" value="Experiment beginnen" onClick="startExp()">
<input type="button" name="Button1" value="Instruktionen" onClick="Instruktionen()"></TD></TR></TABLE>
</form>

</body></html>

