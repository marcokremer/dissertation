<HTML>
<HEAD>
<TITLE>Instruktionen</TITLE>
<script language=javascript src="mmlweb.js"></SCRIPT>
<link rel="stylesheet" href="mlweb.css" type="text/css">
<script language="javascript">

function FokusaufKnopf()
{
this.document.getElementById("Button1").focus();
}

function start_exp()
{
nextURL="http://www2.hsu-hh.de/wbox0024/writable/Experiment_Zeitdruck_V3/Repetitorium.php";
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
du immer in der Fu?zeile. Ich werde die Fragen schnellstm?glich beantworten.</p><br><br>
<form>
<TABLE ><TR><TD valign="top">
<TD valign="top"><p>Die Aufgabe: Du nimmst heute an einem wissenschaftlichen Experiment teil. Deine Aufgabe besteht darin, Entscheidungen zu treffen - 
m?glichst schnell und mit m?glichst hohem Ergebnis f?r dich. Dabei sollst du dich f?r eine Strategie entscheiden.</p><br></TD></TR>
<TR><TD valign="top"><img src="ein_feld_offen.png" alt="ein_feld_offen"><br><span style="font: italic; font-size:70%;">Bild 1 Felder ?ffnen und schlie?en</span></TD>
<TD><p>Die Matrix: Alle Problemstellungen werden in Matrixform pr?sentiert, wie zum Beispiel im Bild 1. Du siehst hier eine 2x2-Ergebnis-Matrix mit jeweils zwei Zeilen und zwei Spalten. Die Zahlen in den Feldern symbolisieren Punkte: 
die erste Zahl deine und die zweite Zahl die deines Gegenspielers. Eine Zeile entspricht einer Entscheidungsm?glichkeit (=Strategie) f?r dich. Deinen Gegenspieler w?hlt eine Spalte aus. Zun?chst sind alle Felder geschlossen. Ein Feld ?ffnet sich, sobald die Maus hineinzeigt und bleibt sonst geschlossen. 
Unter der Auszahlungsmatrix zeigt dir der Timer an, wieviel Zeit dir noch f?r deine 
Entscheidung bleibt. In diesem Fall sind es noch 28 Sekunden.</p>
<p>Hast du deine Entscheidung getroffen und durch anklicken der jeweiligen Strategie angezeigt, so kannst du dieses Spiel durch Mausklick auf den 
Knopf "fertig" beenden. Du gelangst damit, je nach Spielrunde, entweder zu einem weiteren Spiel, zu einem Pausebildschirm zwischen den Spielrunden oder zum Endbildschirm. Pro Spielrunde spielst du vier Spiele 
gleicher Gr??e, aber unterschiedlicher Zeitbeschr?nkung. Mit fortschreitendem Experiment nehmen auch die Entscheidungsm?glichkeiten zu. 
Bei f?nf pro Spieler ist aber Schluss.</p><br></TD></TR>
<TR><TD valign="top"><img src="strategie_entscheidung_v1.png" alt="strategie_entscheidung_v1"><span style="font: italic; font-size:70%;"><br>Bild 2 Punkte erzielen</span></TD><TD><p> Die Punkte: In jedem Spiel bekommst du f?r deine Entscheidung Punkte. 
Die Anzahl richtet sich nach deiner Entscheidung und nach der deines Gegners: wenn du dich f?r eine Zeile entscheidest, h?ngt es von der Entscheidung des Gegenspielers ab 
(Spalte links oder Spalte rechts), ob du die Punkte aus dem Feld links oder aus dem Feld rechts bekommst. Was der jeweils andere f?r eine Strategie w?hlt, wisst ihr aber zum Zeitpunkt eurer Entscheidung nicht. Triffst du keine Entscheidung 
innerhalb der vorgegebenen Zeit, ist dein Ergebnis Null und dein Gegenspieler erzielt den jeweils h?chsten Wert seiner Strategiewahl.</p>
<p>Zum besseren Verst?ndnis sind in Bild 2 alle Auszahlungen aufgedeckt. W?hlst du dort Strategie 2 und dein Gegenspieler seine Strategie "links", so realisiert ihr das Ergebnisfeld links unten und jeder erh?lt 4 Punkte f?r die Endabrechnung. 
H?ttest du Strategie 1 gew?hlt und dein Gegenspieler seine Strategie "rechts", w?rde jeder 1 Punkt bekommen usw. Die jeweils erste Zahl entspricht dabei stets deinen Punkten.</p></TD></TR>
<TR><TD></TD><TD><br><p>Die Gegner: Deine Gegenspieler sind andere Experimentteilnehmer, die dir zuf?llig f?r jedes Spiel neu zugelost werden.</p></TD></TR>
<TR><TD></TD><TD><br><p>Der Gewinn: Am Ende des Experiments wird abgerechnet. Deine Punkte von jedem Spiele werden zusammengez?hlt und mit denen aller anderen Experimentteilnehmer verglichen.
 <b>Bei Punktegleichstand z?hlt die geringere Entscheidungszeit.</b> Die zehn besten Spieler erhalten
einen Gutschein von <I>buecher.de</I>. Im Anschluss an das letzte Spiel erhalten alle Spieler ein Los, mit dem sie weitere <I>buecher.de</I>-Gutscheine gewinnen k?nnen.</p></TD></TR>
<TR><TD colspan=2 align="center"><br><input type="button" name="startExp" value="Experiment beginnen" onClick="start_exp()">
<input type="button" name="Button1" value="zu den Tipps" onClick="window.location.href='Tipps1.php'"></TD><TD></TD></TR></TABLE>
</form>
<div id="footer" align="center">Infos bitte an: <a href=mailto:ZeitdruckExp@hsu-hh.de>ZeitdruckExp@hsu-hh.de</a></div>
</body></html>