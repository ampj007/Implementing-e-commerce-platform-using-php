<html>
<head>
<style>
table
{
border-style:solid;
border-width:2px;
border-color:pink;
}
</style>
</head>
<body bgcolor="white">
<h1>BOUGHT_BY ITEM</h1>
<?php
$con = mysql_connect("localhost","root","");
if (!$con)
  {
  die('Could not connect: ' . mysql_error());
  }
 
mysql_select_db("de", $con);
 
$result = mysql_query("SELECT * FROM bought_by");
 
echo "<table border='1'>
<tr>
<th>Item_Name</th>
</tr>";
 
while($row = mysql_fetch_array($result))
  {
  echo "<tr>";
  echo "<td>" . $row['item_name'] . "</td>";
  echo "</tr>";
  }
echo "</table>";
 
mysql_close($con);
?>
</body>
</html>
