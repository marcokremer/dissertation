<?php 
// 		create_table.php create a mouselabWEB table 
//
//       v 1.00b, Aug 2008
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

include('141001_Ergebnis_Test.inc.php');
$sqlquery = "CREATE TABLE IF NOT EXISTS $table (id INTEGER PRIMARY KEY, Rang VARCHAR(3), Spieler_Name VARCHAR(100), Anzahl_Spiele VARCHAR(2),
Ergebnis VARCHAR(10), relatives_Ergebnis VARCHAR(10), Zeitbedarf VARCHAR(10), ExpVersion VARCHAR(2), siegercode VARCHAR(15), Status VARCHAR(2), 
Gewinn VARCHAR (30), email VARCHAR(100), nextURL VARCHAR (100), addvar TEXT, adddata TEXT)";
$result=mysql_query($sqlquery) or die("Invalid Query : ".mysql_error()); 
echo('Table created');
mysql_close();
?>