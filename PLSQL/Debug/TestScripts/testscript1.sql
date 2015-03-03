-- Test script for pkg_Debug
-- The goal here is to make sure every line of code is tested at least once

set serveroutput on;

-- Test package constants.
exec dbms_output.put_line(pkg_Debug.G_OUTPUTTYPELINE);
exec dbms_output.put_line(pkg_Debug.G_OUTPUTTYPEFILE);

-- Test CreateTimestamp function;
exec dbms_output.put_line(pkg_Debug.CreateTimestamp);

set serveroutput off;