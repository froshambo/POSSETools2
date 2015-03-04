-- Test script for pkg_Debug
-- The goal here is to make sure every line of code is tested at least once

set serveroutput on;

-- Test package constants.
exec dbms_output.put_line(pkg_Debug.G_OUTPUTTYPELINE);
exec dbms_output.put_line(pkg_Debug.G_OUTPUTTYPEFILE);

-- Test CreateTimestamp function;
exec dbms_output.put_line(pkg_Debug.CreateTimestamp);

-- Test WritetoConsole
exec pkg_Debug.WriteToConsole('This is a test of the WriteToConsole method.');

-- Test WritetoFile
exec app.pkg_Debug.enable('alan');
exec app.pkg_Debug.suspend();
exec pkg_Debug.WritetoFile('This is a test of the WriteToFile method.');
exec app.pkg_Debug.shutdown('alan');

-- Test WriteLine, to Console
exec pkg_Debug.WriteLine(pkg_Debug.G_OUTPUTTYPELINE, 'This is a test of WriteLine, to the Console.');

-- Test WriteLine, to File
exec app.pkg_Debug.enable('alan');
exec app.pkg_Debug.suspend();
exec pkg_Debug.WriteLine(pkg_Debug.G_OUTPUTTYPEFILE, 'This is a test of the WriteLine method, to a file.');
exec app.pkg_Debug.shutdown('alan');

-- Test BeginOutput, LINE
exec pkg_Debug.BeginOutput(pkg_Debug.G_OUTPUTTYPELINE, 'testscript1.sql', 'No paramters.');

-- Test BeginOutput, FILE
exec pkg_Debug.BeginOutput(pkg_Debug.G_OUTPUTTYPEFILE, 'testscript1.sql', 'No paramters.');

-- Test EndOutput, FILE
exec pkg_Debug.EndOutput(pkg_Debug.G_OUTPUTTYPEFILE, 'testscript1.sql', 'No return value.');

-- Test EndOutput, LINE
exec pkg_Debug.EndOutput(pkg_Debug.G_OUTPUTTYPELINE, 'testscript1.sql', 'No return value.');

set serveroutput off;
exit