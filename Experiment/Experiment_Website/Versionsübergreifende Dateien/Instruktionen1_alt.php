<HTML>
<HEAD>
<TITLE>Instruktionen</TITLE>
<script language=javascript src="mmlweb.js"></SCRIPT>
<link rel="stylesheet" href="mlweb.css" type="text/css">
<script language="javascript">
if(document.cookie){
	var expversion="";
	var inhalt=document.cookie;
	if(inhalt.indexOf("v1")>-1){expversion="v1";}else{expversion="v2";}
}else{alert("Bitte Cookies aktivieren!");}

function FokusaufKnopf()
{
this.document.getElementById("Button1").focus();
}
function start_exp()
{
v1="http://www2.hsu-hh.de/wbox0024/writable/Experiment_Zeitdruck_V3/Repetitorium.php";
v2="http://www2.hsu-hh.de/wbox0024/writable/Experiment_Zeitdruck_V3/Repetitorium2.php";

if(expversion=="v1"){nextURL=v1;}else{nextURL=v2;}

var newWind=window.open(nextURL,"survey","height="+(screen.availHeight-60).toString()+",width="+(screen.availWidth-30).toString() +",scrollbars,status,resizable, left=2, top=2")
}

</script>
<style>
#footer {
    position:fixed;
    bottom:0px;
    font-size: 0.9em;
    background:#fed; border: 1px solid silver;
    text-align:center;
    padding:0.1em;
    width:100%;
</style>
</head>
<body>
<h1>Instruktionen</h1>
<br><p>Ein Hinweis: Bitte lies dir die nachfolgenden Instruktionen aufmerksam durch. Bei Fragen kannst du mir eine Email schreiben. Die Adresse findest 
du immer in der Fußzeile. Ich werde die Fragen schnellstmöglich beantworten.</p><br><br>
<form>
<TABLE ><TR><TD valign="top"><img src="ein_feld_offen.png" alt="ein_feld_offen"><br><span style="font: italic; font-size:70%;">Bild 1 Felder öffnen und schließen</span>
<TD valign="top"><p>Die Aufgabe: Du nimmst heute an einem wissenschaftlichen Experiment teil. Deine Aufgabe besteht darin, Entscheidungen zu treffen - 
möglichst schnell und mit möglichst hohem Ergebnis für dich. Je nach Experimentversion sollst du dich dabei für eine Strategie oder gegen alle bis auf eine Strategie entscheiden (siehe Bild 1).</p></TD></TR>
<TR><TD valign="top"><img src="alle_felder_offen.png" alt="alle_felder_offen"><br><span style="font: italic; font-size:70%;">Bild 2 Strategiewahl und Abschluss</span></TD>
<TD><p>Die Matrix: Alle Problemstellungen werden in Matrixform präsentiert, wie zum Beispiel im Bild 2. Du siehst hier eine 2x2-Auszahlungs-Matrix mit jeweils zwei Zeilen für deine beiden 
Entscheidungsmöglichkeiten (=Strategien) und zwei Spalten für die deiner Gegenspieler. Gegebenenfalls sind die Auszahlungen anfangs noch verdeckt. 
Durch Klick mit der Maus auf das Feld kannst du sie anzeigen lassen oder wieder verschließen, falls du sie nicht mehr benötigst. Unter der Auszahlungsmatrix zeigt dir der Timer an, wieviel Zeit dir noch für deine 
Entscheidung bleibt. In diesem Fall sind es noch 18 Sekunden.</p>
<p>Hast du deine Entscheidung getroffen und durch anklicken der jeweiligen Strategie(n) angezeigt, so kannst du dieses Spiel durch Mausklick auf den 
Knopf "fertig" beenden. Du gelangst damit, je nach Spielrunde, entweder zu einem weiteren Spiel, zu einem Pausebildschirm zwischen den Spielrunden oder zum Endbildschirm. Pro Spielrunde spielst du vier Spiele 
gleicher Größe, aber unterschiedlicher Zeitbeschränkung. Mit fortschreitendem Experiment nehmen auch die Entscheidungsmöglichkeiten zu. 
Bei fünf pro Spieler ist aber Schluss.</p><br></TD></TR>
<TR><TD valign="top"><img src="strategie_entscheidung_v1.png" alt="strategie_entscheidung_v1"><span style="font: italic; font-size:70%;"><br>Bild 3 Punkte erzielen</span></TD><TD><p> Die Punkte: Für jede Entscheidung bekommst du Punkte. 
Die Anzahl richtet sich nach deiner Entscheidung und nach der deines Gegners. Da ihr euer Ergebnis durch eure Strategiewahl 
also gegenseitig beeinflusst, wird deine Entscheidung eine sogenannte „Strategische Entscheidung“. Triffst du keine Entscheidung innerhalb der vorgegebenen Zeit, ist dein Ergebnis Null und dein Gegenspieler erzielt den jeweils
höchsten Wert seiner Strategiewahl.</p>
<p>Wählst du im Beispiel-Bild 3 Strategie 2 und dein Gegner seine Strategie 1 (Feld links unten), so erzielt jeder 4 Punkte. Die jeweils erste Zahl entspricht dabei stets deinen Punkten. Die Werte für alle anderen 
Strategiekombinationen können entsprechend abgelesen werden.</p></TD></TR>
<TR><TD></TD><TD><br><p>Die Gegner: Deine Gegenspieler sind andere Experimentteilnehmer, die dir zufällig für jedes Spiel neu zugelost werden.</p></TD></TR>
<TR><TD></TD><TD><br><p>Der Gewinn: Am Ende wird abgerechnet. Die Punkte werden zusammengezählt. <b>Bei Punktegleichstand zählt die geringere Entscheidungszeit.</b> Die zehn besten Spieler erhalten
einen Gutschein von <I>buecher.de</I>. Im Anschluss an das letzte Spiel erhalten alle Spieler ein Los, mit dem sie weitere <I>buecher.de</I>-Gutscheine gewinnen können.</p></TD></TR>
<TR><TD colspan=2 align="center"><br><input type="button" name="startExp" value="Experiment beginnen" onClick="start_exp()">
<input type="button" name="Button1" value="zu den Tipps" onClick="window.location.href='Tipps1.php'"></TD><TD></TD></TR></TABLE>
</form>
<div id="footer" align="center">Infos bitte an: <a href=mailto:ZeitdruckExp@hsu-hh.de>ZeitdruckExp@hsu-hh.de</a></div>
</body></html>