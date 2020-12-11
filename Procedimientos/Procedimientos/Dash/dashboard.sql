set serveroutput on;

CREATE OR REPLACE PROCEDURE dash_proce
(anio number)
is
BEGIN
    DECLARE
        v_gancia_anual number;
        v_anio_anual number;
        v_ganancia_mes number;
        v_mes varchar2(20);
        v_anio_mes number;
        v_ganancia_semanal number;
        v_semana varchar2(50);
        v_anio_semana number;
        v_meses varchar2(3000);
        v_semanal varchar2(3000);
        
    CURSOR cursor_anual is
        select sum(ar.precio) as precio,
        TO_CHAR(fp.fecha_periodo, 'YYYY') as anio
        from fecha_peri_arr fp
        join arriendo ar on ar.id_arriendo=fp.fk_id_arriendo
        where TO_CHAR(fp.fecha_periodo, 'YYYY')= anio
        GROUP BY 
        TO_CHAR(fp.fecha_periodo, 'YYYY');
    CURSOR cursor_mes is
        select sum(ar.precio) as ganancia,
        TO_CHAR(fp.fecha_periodo,'month') as mes,
        TO_CHAR(fp.fecha_periodo, 'YYYY') as anio
        from fecha_peri_arr fp
        join arriendo ar on ar.id_arriendo=fp.fk_id_arriendo
        where TO_CHAR(fp.fecha_periodo, 'YYYY')= anio
        GROUP BY TO_CHAR(fp.fecha_periodo, 'month'),
        TO_CHAR(fp.fecha_periodo, 'YYYY');
        
    CURSOR cursor_semanal is 
        select sum(ar.precio) as precio,
        TRUNC(fp.fecha_periodo, 'IW')  as semana,
        TO_CHAR(fp.fecha_periodo, 'YYYY') as anio
        from fecha_peri_arr fp
        join arriendo ar on ar.id_arriendo=fp.fk_id_arriendo
        WHERE TRUNC(fp.fecha_periodo, 'IW') = TRUNC(SYSDATE, 'IW')
        GROUP BY
        TO_CHAR(fp.fecha_periodo, 'YYYY'),
        TRUNC(fp.fecha_periodo, 'IW');
        
    BEGIN
        OPEN cursor_anual;
            DBMS_OUTPUT.put_line('[');
        LOOP
        FETCH cursor_anual into v_gancia_anual,v_anio_anual;
            EXIT WHEN cursor_anual%notfound; 
            
            OPEN cursor_mes;
            LOOP
            FETCH cursor_mes into v_ganancia_mes,v_mes,v_anio_mes;
                EXIT WHEN cursor_mes%notfound;
                v_meses:= v_meses || '{"gananciaMes":' ||v_ganancia_mes || ',"mes":"' || v_mes || '","anioMes":' ||v_anio_mes || '},';
            END LOOP;
            CLOSE cursor_mes;
            
            OPEN cursor_semanal;
            LOOP
            FETCH cursor_semanal into v_ganancia_semanal,v_semana,v_anio_semana;
                EXIT WHEN cursor_semanal%notfound;
                v_semanal:= v_semanal || '{"gananciaSemanal":' ||v_ganancia_semanal || ',"semana":"' || v_semana || '","anioSemana":' ||v_anio_semana || '},';
            END LOOP;
            CLOSE cursor_semanal;
                  
            dbms_output.put_line('{"gananciaAnual":'||v_gancia_anual ||',"anio":'|| v_anio_anual ||',"mes": ['||v_meses ||'],"gananciaSemanal": ['||v_semanal ||']},');         
        END LOOP;
        DBMS_OUTPUT.put_line(']');
        CLOSE cursor_anual;
        END;
END;
    
begin
    dash_proce(2020);
end;
    
    insert into arriendo values(5,to_date('17-11-2020','DD-MM-yyyy'),1,15000,1,null,null,1,1);
    ''23-03-2020'',1,234000,2,null,null,1
    select* from arriendo;