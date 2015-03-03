create or replace package pkg_Debug as
	/* Standard methods for outputting debug and other logging messages.
	   Supports logging to file and to console.*/

	G_OUTPUTTYPELINE  char(4) := 'LINE';
	G_OUTPUTTYPEFILE  char(4) := 'FILE';

    -- CreateTimestamp
    function CreateTimestamp return varchar2;

    -- BeginOutput: Write header information (name of method, parameters, etc)
    procedure BeginOutput(
    	a_Destination char,
    	a_Method varchar2,
      a_Parameters varchar2
    );

    -- EndOutput: Write footer information (return values, success/failure)
    procedure EndOutput(
    	a_Destination char,
    	a_Method varchar2,
      a_ReturnValues varchar2
    );

    -- WriteLine: Write a line of output
    procedure WriteLine(
    	a_Destination char,
    	a_Message varchar2
    );

    -- WriteToFile
    procedure WriteToFile(
    	a_Message varchar2
    );

    -- WriteToConsole
    procedure WriteToConsole(
    	a_Message varchar2
    );
end pkg_Debug;
/

create or replace package body pkg_Debug as
	/* Standard methods for outputting debug and other logging messages.
	   Written for use with POSSE 7.1.5 */

	G_TIMESTAMPFORMAT varchar2(30) := 'MON dd, yyyy hh24:mi:ss';
	G_PIPENAME        char(4) := 'alan';

    /* CreateTimestamp
         Returns a formatted datetime to be used as the output timestamp. */
    function CreateTimestamp
    return varchar2 as
    begin
      return to_char(sysdate, G_TIMESTAMPFORMAT) || ' ';
    end CreateTimestamp;

    /* BeginOutput
         Used to output some header information about the code block currently running:
          - Name of owner, package, and method.
          - Name of parameters and parameter values passed into the method.
         If the output destination is a file (using POSSE logging),
         then create and suspend an pkg_Debug pipe. */
    procedure BeginOutput(
    	a_Destination char,
    	a_Method varchar2,
      a_Parameters varchar2
    ) as
    begin
      if a_Destination = G_OUTPUTTYPEFILE then
        app.pkg_Debug.Enable(G_PIPENAME);
        app.pkg_Debug.Suspend();
      end if;

      WriteLine(a_Destination, 'Execution entered new code block.');
      WriteLine(a_Destination, 'Name: ' || a_Method);
      if a_Parameters is not null then
        WriteLine(a_Destination, 'Parameters: ' || a_Parameters);
      end if;
    end BeginOutput;

    /* EndOutput
         Used to output some footer information about the code block currently running:
          - Name of owner, package, and method.
          - Name of return values and the actual values returned from the method, if any.
         If the output destination is a file (using POSSE logging),
         then shutdown the pkg_Debug pipe. */
    procedure EndOutput(
    	a_Destination char,
    	a_Method varchar2,
      a_ReturnValues varchar2
    ) as
    begin
      WriteLine(a_Destination, 'Execution of ' || a_Method || ' complete.');

      if a_ReturnValues is not null then
        WriteLine(a_Destination, 'Returning: ' || a_ReturnValues);
      else
        WriteLine(a_Destination, 'No return value.');
      end if;

      if a_Destination = G_OUTPUTTYPEFILE then
        app.pkg_Debug.Shutdown(G_PIPENAME);
      end if;
    end EndOutput;

    /* WriteLine
         Writes a line of output to the specified source.
         a_Destination must be either G_OUTPUTTYPELINE or G_OUTPUTTYPEFILE. */
    procedure WriteLine(
    	a_Destination char,
    	a_Message varchar2
    ) as
    begin
      if a_Destination = G_OUTPUTTYPELINE then
        WriteToConsole(a_Message);
      elsif a_Destination = G_OUTPUTTYPEFILE then
        WriteToFile(a_Message);
      end if;
    end WriteLine;

    /* WriteToFile
         Writes the specified message to the POSSE log writer. */
    procedure WriteToFile(
    	a_Message varchar2
    ) as
    begin
      app. pkg_Debug.putsingleline(a_Message);
    end WriteToFile;

	/* WriteToConsole
         Writes the specified message out to stdout. */
    procedure WriteToConsole(
    	a_Message varchar2
    ) as
    begin
      dbms_output.put_line(CreateTimestamp() || a_Message);
    end WriteToConsole;
end pkg_Debug;
/
