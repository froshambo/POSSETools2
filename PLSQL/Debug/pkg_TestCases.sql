-- This package serves as a template for new packages
create or replace package pkg_TestCases as

    --
    procedure TestBeginEndNoReturnLineOut (
        a_ParameterA varchar2,
        a_ParameterB number
    );

    function TestBeginEndReturnLineOut (
        a_ParameterA varchar2,
        a_ParameterB number
    ) return varchar2;
end;
/

create or replace package body pkg_TestCases as
    /* Documentation */
    procedure TestBeginEndNoReturnLineOut (
        a_ParameterA varchar2,
        a_ParameterB number
    ) as

    begin
        pkg_Debug.BeginOutput('LINE', 'pkg_TestCases.TestBeginEndNoReturnLineOut()',
            'a_ParameterA: "<ValueA>"; a_ParameterB: "<ValueB>"');

        pkg_Debug.WriteLine('LINE', 'Here is a line of debug output.');

        pkg_Debug.EndOutput('LINE', 'pkg_TestCases.TestBeginEndNoReturnLineOut()', null);
    end;

    /* Documentation */
    function TestBeginEndReturnLineOut (
        a_ParameterA varchar2,
        a_ParameterB number
    ) return varchar2 as

    begin
        pkg_Debug.BeginOutput('LINE', 'pkg_TestCases.TestBeginEndReturnLineOut()',
            'a_ParameterA: "<ValueA>"; a_ParameterB: "<ValueB>"');

        pkg_Debug.WriteLine('LINE', 'Here is also a line of debug output.');

        pkg_Debug.EndOutput('LINE', 'pkg_TestCases.TestBeginEndReturnLineOut()', 'Return: "<Value>"');
        return
    end;
end;
/
