<?php 
if (isset($_GET['subject'])) {$subject=$_GET['subject'];}
 else {$subject="anonymous";}
if (isset($_GET['condnum'])) {$condnum=$_GET['condnum'];}
	else {$condnum=-1;}?><HTML>
<HEAD>
<TITLE>Auswertung Experiment-Serie 1</TITLE>
<script language=javascript src="mmlweb.js"></SCRIPT>
<link rel="stylesheet" href="mlweb.css" type="text/css">
</head>

<body onLoad="timefunction('onload','body','body')">
<CENTER><H1>Auswertung Experiment - Serie 1</H1></CENTER>
<script language="javascript">
ref_cur_hit = <?php echo($condnum);?>;
subject = "<?php echo($subject);?>";
</script>
<P>
<CENTER><TABLE border=1 width=80%>
<TR>
<TH> # </TH><TH>Spieler-ID</TH><TH>Ergebnis</TH></TR>

