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
        pkg_Debug.BeginOutput('LINE', 'pkg_PackageTemplate.Stub()', 'a_Parameter: "<Value>"');

        pkg_Debug.EndOutput('LINE', 'pkg_PackageTemplate.Stub()', null);
    end;

    /* Documentation */
    function FNStub (
        a_Parameter varchar2
    ) return varchar2 as

    begin
        pkg_Debug.BeginOutput('LINE', 'pkg_PackageTemplate.FNStub()', 'a_Parameter: "<Value>"');

        pkg_Debug.EndOutput('LINE', 'pkg_PackageTemplate.FNStub()', 'Return: "<Value>"');
        return null;
    end;
end;
/
