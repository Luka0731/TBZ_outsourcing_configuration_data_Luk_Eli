# Load the SQLite .NET assembly (.dll file)
Add-Type -Path "C:\ProgramData\MySQL\MySQL Server 9.1\MySql.Data.dll" # Put your path here 
 
$Connection = New-Object MySQL.Data.MySqlClient.MySQLConnection("User=root;Database=Mysql;Server=localhost;Port=3306;")  # Put your database configurations here 
$Connection.Open()

# Define the SQLite connection string
$sql = New-Object MySql.Data.MySqlClient.MySqlCommand
$sql.Connection = $Connection
$sql.CommandText = "SHOW Tables"
$myreader = $sql.ExecuteReader()
while($myreader.Read()){ $myreader.GetString(0) }
$myreader.Close()

