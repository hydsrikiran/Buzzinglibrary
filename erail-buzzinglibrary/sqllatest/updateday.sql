create or replace procedure updateday is
train_id   varchar2(20);
count_tmp number:=0;
v_sno number:=1;
orgnum_sun VARCHAR2(1):='N';
orgnum_mon VARCHAR2(1):='N';
orgnum_tue VARCHAR2(1):='N';
orgnum_wed VARCHAR2(1):='N';
orgnum_thu VARCHAR2(1):='N';
orgnum_fri VARCHAR2(1):='N';
orgnum_sat VARCHAR2(1):='N';
type schedule_cursor is ref cursor;
sched   schedule_cursor;
sched1 schedule%rowtype;
CURSOR trainid_cur IS select distinct train from train order by train;
  BEGIN
     OPEN trainid_cur;
     LOOP
        FETCH trainid_cur INTO train_id;
        EXIT WHEN trainid_cur%NOTFOUND;
        orgnum_sun:='N';
        orgnum_mon:='N';
        orgnum_tue:='N';
        orgnum_wed:='N';
        orgnum_thu:='N';
        orgnum_fri:='N';
        orgnum_sat:='N';
        --dbms_output.put_line(train_id||'~~'||count_tmp);
        v_sno:=1;
        open sched for select * from schedule where train = train_id  order by DISTANCE;
        loop
          fetch sched into sched1;
          EXIT WHEN sched%NOTFOUND;
          --dbms_output.put_line(sched1.train||'~~'||sched1.station||'~~'||sched1."day"||'~~'||sched1.SUN||'~~'||sched1.MON||'~~'||sched1.TUE||'~~'||sched1.WED||'~~'||sched1.THU||'~~'||sched1.FRI||'~~'||sched1.SAT);
          if(v_sno>1) then
          --(
              --dbms_output.put_line(sched1.train||'~~'||sched1.station||'~~'||sched1."day"||'~~'||sched1.SUN||'~~'||sched1.MON||'~~'||sched1.TUE||'~~'||sched1.WED||'~~'||sched1.THU||'~~'||sched1.FRI||'~~'||sched1.SAT);
              if orgnum_sun='Y' then
                if sched1."day" = 1 then
                  update schedule set sun='Y' where distance=sched1.distance and sun<>'Y';
                  commit;
                end if;
                if sched1."day" = 2 then
                  update schedule set mon='Y' where distance=sched1.distance and mon<>'Y';
                  commit;
                end if;
                if sched1."day" = 3 then
                  update schedule set tue='Y' where distance=sched1.distance and tue<>'Y';
                  commit;
                end if;
                if sched1."day" = 4 then
                  update schedule set wed='Y' where distance=sched1.distance and wed<>'Y';
                  commit;
                end if;
                if sched1."day" = 5 then
                  update schedule set thu='Y' where distance=sched1.distance and thu<>'Y';
                  commit;
                end if;
                if sched1."day" = 6 then
                  update schedule set fri='Y' where distance=sched1.distance and fri<>'Y';
                  commit;
                end if;
                if sched1."day" = 7 then
                  update schedule set sat='Y' where distance=sched1.distance and sat<>'Y';
                  commit;
                end if;
              end if;
              
              if orgnum_mon='Y' then
                if sched1."day" = 7 then
                  update schedule set sun='Y' where distance=sched1.distance and sun<>'Y';
                  commit;
                end if;
                if sched1."day" = 1 then
                  update schedule set mon='Y' where distance=sched1.distance and mon<>'Y';
                  commit;
                end if;
                if sched1."day" = 2 then
                  update schedule set tue='Y' where distance=sched1.distance and tue<>'Y';
                  commit;
                end if;
                if sched1."day" = 3 then
                  update schedule set wed='Y' where distance=sched1.distance and wed<>'Y';
                  commit;
                end if;
                if sched1."day" = 4 then
                  update schedule set thu='Y' where distance=sched1.distance and thu<>'Y';
                  commit;
                end if;
                if sched1."day" = 5 then
                  update schedule set fri='Y' where distance=sched1.distance and fri<>'Y';
                  commit;
                end if;
                if sched1."day" = 6 then
                  update schedule set sat='Y' where distance=sched1.distance and sat<>'Y';
                  commit;
                end if;
              end if;
              
              if orgnum_tue='Y' then
                if sched1."day" = 6 then
                  update schedule set sun='Y' where distance=sched1.distance and sun<>'Y';
                  commit;
                end if;
                if sched1."day" = 7 then
                  update schedule set mon='Y' where distance=sched1.distance and mon<>'Y';
                  commit;
                end if;
                if sched1."day" = 1 then
                  update schedule set tue='Y' where distance=sched1.distance and tue<>'Y';
                  commit;
                end if;
                if sched1."day" = 2 then
                  update schedule set wed='Y' where distance=sched1.distance and wed<>'Y';
                  commit;
                end if;
                if sched1."day" = 3 then
                  update schedule set thu='Y' where distance=sched1.distance and thu<>'Y';
                  commit;
                end if;
                if sched1."day" = 4 then
                  update schedule set fri='Y' where distance=sched1.distance and fri<>'Y';
                  commit;
                end if;
                if sched1."day" = 5 then
                  update schedule set sat='Y' where distance=sched1.distance and sat<>'Y';
                  commit;
                end if;
              end if;
              
              if orgnum_wed='Y' then
                if sched1."day" = 5 then
                  update schedule set sun='Y' where distance=sched1.distance and sun<>'Y';
                  commit;
                end if;
                if sched1."day" = 6 then
                  update schedule set mon='Y' where distance=sched1.distance and mon<>'Y';
                  commit;
                end if;
                if sched1."day" = 7 then
                  update schedule set tue='Y' where distance=sched1.distance and tue<>'Y';
                  commit;
                end if;
                if sched1."day" = 1 then
                  update schedule set wed='Y' where distance=sched1.distance and wed<>'Y';
                  commit;
                end if;
                if sched1."day" = 2 then
                  update schedule set thu='Y' where distance=sched1.distance and thu<>'Y';
                  commit;
                end if;
                if sched1."day" = 3 then
                  update schedule set fri='Y' where distance=sched1.distance and fri<>'Y';
                  commit;
                end if;
                if sched1."day" = 4 then
                  update schedule set sat='Y' where distance=sched1.distance and sat<>'Y';
                  commit;
                end if;
              end if;
              
              if orgnum_thu='Y' then
                if sched1."day" = 4 then
                  update schedule set sun='Y' where distance=sched1.distance and sun<>'Y';
                  commit;
                end if;
                if sched1."day" = 5 then
                  update schedule set mon='Y' where distance=sched1.distance and mon<>'Y';
                  commit;
                end if;
                if sched1."day" = 6 then
                  update schedule set tue='Y' where distance=sched1.distance and tue<>'Y';
                  commit;
                end if;
                if sched1."day" = 7 then
                  update schedule set wed='Y' where distance=sched1.distance and wed<>'Y';
                  commit;
                end if;
                if sched1."day" = 1 then
                  update schedule set thu='Y' where distance=sched1.distance and thu<>'Y';
                  commit;
                end if;
                if sched1."day" = 2 then
                  update schedule set fri='Y' where distance=sched1.distance and fri<>'Y';
                  commit;
                end if;
                if sched1."day" = 3 then
                  update schedule set sat='Y' where distance=sched1.distance and sat<>'Y';
                  commit;
                end if;
              end if;
              
              if orgnum_fri='Y' then
                if sched1."day" = 3 then
                  update schedule set sun='Y' where distance=sched1.distance and sun<>'Y';
                  commit;
                end if;
                if sched1."day" = 4 then
                  update schedule set mon='Y' where distance=sched1.distance and mon<>'Y';
                  commit;
                end if;
                if sched1."day" = 5 then
                  update schedule set tue='Y' where distance=sched1.distance and tue<>'Y';
                  commit;
                end if;
                if sched1."day" = 6 then
                  update schedule set wed='Y' where distance=sched1.distance and wed<>'Y';
                  commit;
                end if;
                if sched1."day" = 7 then
                  update schedule set thu='Y' where distance=sched1.distance and thu<>'Y';
                  commit;
                end if;
                if sched1."day" = 1 then
                  update schedule set fri='Y' where distance=sched1.distance and fri<>'Y';
                  commit;
                end if;
                if sched1."day" = 2 then
                  update schedule set sat='Y' where distance=sched1.distance and sat<>'Y';
                  commit;
                end if;
              end if;
              
              if orgnum_sat='Y' then
                if sched1."day" = 2 then
                  update schedule set sun='Y' where distance=sched1.distance and sun<>'Y';
                  commit;
                end if;
                if sched1."day" = 3 then
                  update schedule set mon='Y' where distance=sched1.distance and mon<>'Y';
                  commit;
                end if;
                if sched1."day" = 4 then
                  update schedule set tue='Y' where distance=sched1.distance and tue<>'Y';
                  commit;
                end if;
                if sched1."day" = 5 then
                  update schedule set wed='Y' where distance=sched1.distance and wed<>'Y';
                  commit;
                end if;
                if sched1."day" = 6 then
                  update schedule set thu='Y' where distance=sched1.distance and thu<>'Y';
                  commit;
                end if;
                if sched1."day" = 7 then
                  update schedule set fri='Y' where distance=sched1.distance and fri<>'Y';
                  commit;
                end if;
                if sched1."day" = 1 then
                  update schedule set sat='Y' where distance=sched1.distance and sat<>'Y';
                  commit;
                end if;
              end if;
          --)
          else
          --(
              orgnum_sun:=sched1.sun;
              orgnum_mon:=sched1.mon;
              orgnum_tue:=sched1.tue;
              orgnum_wed:=sched1.wed;
              orgnum_thu:=sched1.thu;
              orgnum_fri:=sched1.fri;
              orgnum_sat:=sched1.sat;
          --)
          end if;
          --update schedule set sno = v_sno where distance=sched1.distance;
          --commit;
          v_sno:=v_sno+1;
          end loop;
       close sched ;
    END LOOP;
    CLOSE trainid_cur;
end updateday;