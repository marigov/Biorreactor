Table table;
String fileName; 


void fileLoad()
{
  table = new Table();
  table.addColumn("Time");
  table.addColumn("RPM");
  table.addColumn("Temperature");
  table.addColumn("PH"); 
  
  fileName = ("data/"+getCurrentTime()+".csv");

  
  
}

void fileUpdate()
{
 
           TableRow newRow = table.addRow();
           newRow.setString("Time", getCurrentTime());
           newRow.setString("RPM", str(currentRPM));
           newRow.setString("Temperature", str(currentTEMP));
           newRow.setString("PH", str(currentPH));

           saveTable(table, fileName);
  
}

String getCurrentTime()
{
    int s = second();  // Values from 0 - 59
    int m = minute();  // Values from 0 - 59
    int h = hour();    // Values from 0 - 23

    String currentTime = (Integer.toString(h) + ":" + Integer.toString(m) + ":" + Integer.toString(s));


  return currentTime;
    
  
}