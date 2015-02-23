-- This package serves as a template for new packages
create or replace package pkg_PackageTemplate as

    --
    procedure Stub (
    );

    --
    function FNStub (
        a_Parameter varchar2
    );
end;
/

create or replace package body pkg_PackageTemplate as
    /* Documentation */
    procedure Stub (
        a_Parameter varchar2
    ) as

    begin
        pkg_Debug.BeginOutput('pkg_PackageTemplate.Stub()', 'a_Parameter: "<Value>"', 'LINE');

        pkg_Debug.EndOutput('pkg_PackageTemplate.Stub()', null, 'LINE');
    end;

    /* Documentation */
    function FNStub (
        a_Parameter varchar2
    ) return varchar2 as

    begin
        pkg_Debug.BeginOutput('pkg_PackageTemplate.FNStub()', 'a_Parameter: "<Value>"', 'LINE');

        pkg_Debug.EndOutput('pkg_PackageTemplate.FNStub()', 'Return: "<Value>"', 'LINE');
        return null;
    end;
end;
/
