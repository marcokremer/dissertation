<?php
// 		save.php: saves MouselabWEB data in database
//
//       v 1.00betav2 , 14 Aug 2008    
//		updated version v2 using real_escape_string functions to escape quotes 
//		before loading into the database
//
//     (c) 2003-2008 Martijn C. Willemsen and Eric J. Johnson 
//
//    This program is free software; you can redistribute it and/or modify
//    it under the terms of the GNU General Public License as published by
//    the Free Software Foundation; either version 2 of the License, or
//    (at your option) any later version.
//
//    This program is distributed in the hope that it will be useful,
//    but WITHOUT ANY WARRANTY; without even the implied warranty of
//    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//    GNU General Public License for more details.
//
//    You should have received a copy of the GNU General Public License
//    along with this program; if not, write to the Free Software
//    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

include('141001_fragebogen_mlwebdb.inc.php');


$gewinncode = "";
$nextURL = "";
$addvar = "";
$adddata = "";
$gewinn="";
$email="";
foreach ($_POST as $key => $value) { 
     switch ($key) {
			case "gewinncode":
				$gewinncode = $value;
				break;
			case "email":
				$email = $value;
				break;
			default:
			$addvar .= mysql_real_escape_string($key).";";
			$adddata .= "\"".mysql_real_escape_string($value)."\";" ; 
			}
    }


$abfrage = mysqli_query( "SELECT * FROM $table WHERE Gewinncode LIKE '%$gewinncode%'";);
if($email==""){
if($ausgabe = mysql_fetch_assoc($abfrage))
        { $nextURL= $ausgabe['nextURL'];
	$gewinn=$ausgabe['Gewinn']; } //* Bei Gewinn werden hier die Variablen gesetzt.
    else
        { echo "Leider nichts gewonnen. Ich danke dir trotzdem sehr für deine Teilnahme!<br/>
        <br/>Gruß, M.Kremer<br/>;
	exit;
    	}    // * Ausgabe bei keinem Gewinn.
       }else{
$ausgabe = mysql_fetch_assoc($abfrage);
$ausgabe['email']=$email;
//$sqlquery = "INSERT INTO $table ( email, addvar, adddata) VALUES (  '$email', '$addvar', '$adddata')";
}

//$result = mysql_query($sqlquery);
    
mysql_close();
/* Redirect to a different page in the current directory that was requested */
$host  = $_SERVER['HTTP_HOST'];
$uri   = rtrim(dirname($_SERVER['PHP_SELF']), '/\\');
header("Location: http://$host$uri/$nextURL?gewinn=$gewinn&gewinncode=$gewinncode");
exit;
?>