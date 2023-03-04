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

include('mlwebdb.inc.php');

$expname = "";
$subject = "";
$expversion = "";
$choice = "";
$procdata = "";
$nextURL = "";
$addvar = "";
$adddata = "";
$erwartung = "";
$transform = "";
foreach ($_POST as $key => $value) { 
     switch ($key) {
			case "expname":
				$expname = $value;
				break;
			case "wonne":
				$subject = $value;
				break;
			case "expversion":
				$expversion= $value;
				break;
			case "choice":
				$choice= $value;
				break;
			case "procdata":
				$procdata= mysql_real_escape_string($value);
				break;
			case "nextURL":
				$nextURL= $value;
				break;
			case "to_email":
				// ignore emailaddress
				break;
			case "erwartung":				
				$erwartung= $value;
				break;
			case "transf":				
				$transform= $value;
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

$sqlquery = "INSERT INTO $table (id, expversion, transform, expname, subject, ip, choice, submitted, procdata, addvar, adddata) VALUES ($id,'$expversion','$transform','$expname','$subject','$ipstr','$choice',NOW(),'$procdata', '$addvar', '$adddata')";
$result = mysql_query($sqlquery);
mysql_close();

/* Redirect to a different page in the current directory that was requested */
$host  = $_SERVER['HTTP_HOST'];
$uri   = rtrim(dirname($_SERVER['PHP_SELF']), '/\\');
header("Location: http://$host$uri/$nextURL");
exit;
?>