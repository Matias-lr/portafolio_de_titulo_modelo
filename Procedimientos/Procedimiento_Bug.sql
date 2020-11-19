
-- Ejecutar en sql plus
-- Conectarse con conn / as sysdba
-- realizar grant select on v_$session to portafolio;
-- Reiniciar conexión;



create or replace procedure test_proceso
is
    v_sid varchar2(1000);
    v_serial varchar2(1000);
    v_querie varchar2(1000);
begin
    v_sid := ' immediate';
    for xd in (
    SELECT SID as esid, SERIAL# as serial FROM v$session where STATUS not in ('ACTIVE','KILLED')
    )
    loop
        v_querie := 'alter system disconnect session '''||xd.esid||','||xd.serial||''''||v_sid;
        --dbms_output.put_line(v_querie);
        EXECUTE IMMEDIATE v_querie;
    end loop;

end test_proceso;

begin
   test_proceso(); 
end;


