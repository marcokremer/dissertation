<HTML>
<HEAD>
<TITLE>Repetitorium</TITLE>
<script type="text/javascript" src="mmlweb.js"></SCRIPT>
<link rel="stylesheet" href="mlweb.css" type="text/css">
<script type="text/javascript">
if(document.cookie){
	var cookie_length=document.cookie.length;
	var transform="";
	var expversion="";
	var inhalt=document.cookie;
	if(inhalt.indexOf("v1")>-1){expversion="v1";}
	else{expversion="v2";}
	transform=inhalt.charAt(cookie_length);
}else{alert("Bitte Cookies aktivieren!");}


function start_exp()
{
v1="http://www2.hsu-hh.de/wbox0024/writable/Experiment_Zeitdruck_V3/Vorschlag1_geschlossene_Matrix/1_2x2_2.php";
v2="http://www2.hsu-hh.de/wbox0024/writable/Experiment_Zeitdruck_V3/Vorschlag2_offene_Matrix/1_2x2_2.php";
v1_T="http://www2.hsu-hh.de/wbox0024/writable/Experiment_Zeitdruck_V3/Vorschlag1_geschlossene_Matrix/1_2x2_2_T.php";
v2_T="http://www2.hsu-hh.de/wbox0024/writable/Experiment_Zeitdruck_V3/Vorschlag2_offene_Matrix/1_2x2_2_T.php";

if(expversion=="v1"){
	if(transform=="Z"){nextURL=v1;}else{nextURL=v1_T;}}
else{
	if(transform=="Z"){nextURL=v2;}else{nextURL=v2_T;}}

var newWind=window.open(nextURL,"survey","height="+(screen.availHeight-60).toString()+",width="+(screen.availWidth-30).toString() +",scrollbars,status,resizable, left=2, top=2")

}

frage=0;

function falsch_geraten()
{frage=frage+1;
document.getElementById("z2").style.color="red";
document.getElementById("z2").style.fontWeight="bolder";
alert("Auf diese Frage gibt es eine bessere Antwort!");
window.location="http://www2.hsu-hh.de/wbox0024/writable/Experiment_Zeitdruck_V3/Instruktionen1.php";
}



function richtig_geraten()
{frage=frage+1;

if(frage==1)
{document.getElementById("Frage2").innerHTML="2. Die Zeit, die dir f?r deine Entscheidung bleibt, ist begrenzt. Wieviel Zeit steht dir laut dem obigen Bild noch zur Verf?gung?";
document.getElementById("Zeit").style.visibility="visible";
document.getElementById("Zeitfertig").style.visibility="visible";
document.getElementById("sec").innerHTML=" sec  ";
document.getElementById("z1").style.color="green";
document.getElementById("z1").style.fontWeight="bolder";
}

if(frage==2)
{document.getElementById("start").style.visibility="visible";
}

}

function test()
{
zahl=document.getElementById("Zeit").value;
if(zahl==11){richtig_geraten();}else{falsch_geraten();}
}

</script>
</head>

<body>

<form name="Tutorial">
<h1>Letztes check up - alle Instruktionen verstanden?</h1>
<p>An dieser Stelle sollst du zeigen, dass du alle Instruktionen zum Experiment verstanden hast. Dazu beantworte bitte die beiden nachfolgenden Fragen. 
Lies dir die Fragen aufmerksam durch und beantworte sie sorgf?ltig. Ein Fehler f?hrt dich automatisch zur?ck zu den Instruktionen, wo du dir die relevanten 
Informationen noch einmal durchlesen kannst. <br><br>Bitte wirf nun einen Blick auf das untere Bild und achte dabei besonders auf die Aufgabenstellung. Das Bild zeigt ein Beispiel f?r eine Spielrunde im Experiment, so wie 
du sie sp?ter antreffen wirst. Die Beschriftungen S1 und S2 f?r die Strategien des Gegenspielers und Z1 und Z2 f?r deine Strategien sind im Spiel nicht 
vorhanden, sondern stellen hier nur den Bezug zu den Fragen her.</p>
<p><img src="TutorialV2.png" alt="Matrix_BSp" id="TutorialPic" border="4" style="border-color:#3B4955; padding:5px"></p>
<h2>Fragen</h2>
<Table><TR><TD>1. Du willst deine Auszahlung maximieren, dein Gegenspieler auch. Er schlie?t Strategie S1 aus (und spielt sie damit nicht).<br>Welche schlie?t du aus?</TD></TR>
<TR><TD>Z1<input type="radio" name="Strategie" id="z1" value="Z1" onclick="richtig_geraten()"><input type="radio" name="Strategie" id="Z2" value="Z2" onclick="falsch_geraten()">Z2</TD></TR>
<TR><TD id="Frage2"></TD></TR>
<TR><TD id="Antwort2"></TD></TR>
<TR><TD></TD></TR>
</Table>
</form>
<input type="text" id="Zeit" style="visibility: hidden"  name="Zeit" value=""  size="4" maxlength="4"><span id="sec" style="border:0" ></span><input type="button" style="visibility: hidden" id="Zeitfertig" value="fertig" onclick="test()">
<br><br><input type="button" style="visibility: hidden" id="start" value="Alles verstanden - los geht's" onclick="start_exp()" >
</body></html>
