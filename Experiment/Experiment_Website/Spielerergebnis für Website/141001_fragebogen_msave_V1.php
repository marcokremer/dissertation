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

$expversion = "";
$subject = "";
$sex = "";
$age = "";
$Schulabschluss= "";
$Ausbildung = "";
$ST = "";
$job = "";
$Status = "";
$Einsatz = "";
$Einsatztage = "";
$nextURL = "";
$addvar = "";
$adddata = "";
$trans = "";
$naviinfo = "";
$to_email="";
$quelle="";
foreach ($_POST as $key => $value) { 
     switch ($key) {
			case "expversion":
				$expversion = $value;
				break;
			case "subject":
				$subject = $value;
				break;
			case "sex":
				$sex= $value;
				break;
			case "age":
				$age= $value;
				break;
			case "Schulabschluss":
				$Schulabschluss= $value;
				break;
			case "Ausbildung":
				$Ausbildung= $value;
				break;
			case "ST":
				$ST= $value;
				break;
			case "job":
				$job= $value;
				break;
			case "sonstjob":
				$job= $value;
				break;
			case "Status":
				$Status= $value;
				break;
			case "Einsatz":
				$Einsatz= $value;
				break;
			case "Einsatztage":
				$Einsatztage= $value;
				break;
			case "nextURL":
				$nextURL= $value;
				break;
			case "trans":
				$trans= $value;
				break;
			case "naviinfo":
				$naviinfo= mysql_real_escape_string($value);			
				break;
			case "quelle":
				$quelle= $value;			
				break;
			case "to_email":
				// ignore emailaddress
				break;
			
			default:
			$addvar .= mysql_real_escape_string($key).";";
			$adddata .= "\"".mysql_real_escape_string($value)."\";" ; 
			}
    }
$ipstr = $_SERVER['REMOTE_ADDR'];

$sqlquery = "select MAX(id) from $table";
$result = mysql_query($sqlquery);

$id = mysql_result($result,0);

if (is_null($id)) $id=0; else $id++; 

$sqlquery = "INSERT INTO $table (id, expversion, trans, subject, ip, sex, age, Schulabschluss, Ausbildung, ST, job, Status, Einsatz, Einsatztage, submitted, naviinfo, quelle, addvar, adddata) VALUES ($id,'$expversion', '$trans','$subject','$ipstr','$sex','$age','$Schulabschluss','$Ausbildung','$ST','$job','$Status','$Einsatz','$Einsatztage', NOW(), '$naviinfo', '$quelle', '$addvar', '$adddata')";

$result = mysql_query($sqlquery);
mysql_close();
/* Redirect to a different page in the current directory that was requested */
$host  = $_SERVER['HTTP_HOST'];
$uri   = rtrim(dirname($_SERVER['PHP_SELF']), '/\\');
header("Location: http://$host$uri/$nextURL?subject=$subject&expversion=$expversion");
exit;
?>