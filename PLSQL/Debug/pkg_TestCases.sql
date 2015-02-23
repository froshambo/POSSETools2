-- This package serves as a template for new packages
create or replace package pkg_TestCases as

    --
    procedure TestBeginEndNoReturnLineOutput (
        a_ParameterA varchar2,
        a_ParameterB number
    );
end;
/

create or replace package body pkg_TestCases as
    /* Documentation */
    procedure TestBeginEndNoReturnLineOutput (
        a_ParameterA varchar2,
        a_ParameterB number
    ) as

    begin
        pkg_Debug.BeginOutput('pkg_TestCases.TestBeginEndNoReturnLineOutput()',
            'a_ParameterA: "<ValueA>"; a_ParameterB: "<ValueB>"', 'LINE');

        pkg_Debug.EndOutput('pkg_TestCases.TestBeginEndNoReturnLineOutput()', null, 'LINE');
    end;

    /* Documentation */
    -- function X (
    --     a_Parameter varchar2
    -- ) return varchar2 as

    -- begin
    --     pkg_Debug.BeginOutput('pkg_TestCases.X()', 'a_Parameter: "<Value>"', 'LINE');

    --     pkg_Debug.EndOutput('pkg_TestCases.X()', 'Return: "<Value>"', 'LINE');
    --     return
    -- end;
end;
/
