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
--sched1 schedule%rowtype;
begin
for j in (select distinct train from train order by train asc)
  --BEGIN
     --OPEN trainid_cur;
     LOOP
        --FETCH trainid_cur INTO train_id;
        --EXIT WHEN trainid_cur%NOTFOUND;
        orgnum_sun:='N';
        orgnum_mon:='N';
        orgnum_tue:='N';
        orgnum_wed:='N';
        orgnum_thu:='N';
        orgnum_fri:='N';
        orgnum_sat:='N';
        dbms_output.put_line(j.train||'~~'||count_tmp);
        v_sno:=1;
        for i in( select * from schedule where train = j.train  order by DISTANCE asc)
        loop
          --fetch sched into sched1;
          --EXIT WHEN sched%NOTFOUND;
          dbms_output.put_line(i.train||'~~'||i.station||'~~'||i.day||'~~'||i.SUN||'~~'||i.MON||'~~'||i.TUE||'~~'||i.WED||'~~'||i.THU||'~~'||i.FRI||'~~'||i.SAT);
          if(v_sno>1) then
          --(
              --dbms_output.put_line(i.train||'~~'||i.station||'~~'||i.day||'~~'||i.SUN||'~~'||i.MON||'~~'||i.TUE||'~~'||i.WED||'~~'||i.THU||'~~'||i.FRI||'~~'||i.SAT);
              if orgnum_sun='Y' then
                if i.day = 1 then
                  update schedule set sun='Y' where train=i.train and distance=i.distance and sun<>'Y';
                  commit;
                end if;
                if i.day = 2 then
                  update schedule set mon='Y' where train=i.train and distance=i.distance and mon<>'Y';
                  commit;
                end if;
                if i.day = 3 then
                  update schedule set tue='Y' where train=i.train and distance=i.distance and tue<>'Y';
                  commit;
                end if;
                if i.day = 4 then
                  update schedule set wed='Y' where train=i.train and distance=i.distance and wed<>'Y';
                  commit;
                end if;
                if i.day = 5 then
                  update schedule set thu='Y' where train=i.train and distance=i.distance and thu<>'Y';
                  commit;
                end if;
                if i.day = 6 then
                  update schedule set fri='Y' where train=i.train and distance=i.distance and fri<>'Y';
                  commit;
                end if;
                if i.day = 7 then
                  update schedule set sat='Y' where train=i.train and distance=i.distance and sat<>'Y';
                  commit;
                end if;
              end if;
              
              if orgnum_mon='Y' then
                if i.day = 7 then
                  update schedule set sun='Y' where train=i.train and distance=i.distance and sun<>'Y';
                  commit;
                end if;
                if i.day = 1 then
                  update schedule set mon='Y' where train=i.train and distance=i.distance and mon<>'Y';
                  commit;
                end if;
                if i.day = 2 then
                  update schedule set tue='Y' where train=i.train and distance=i.distance and tue<>'Y';
                  commit;
                end if;
                if i.day = 3 then
                  update schedule set wed='Y' where train=i.train and distance=i.distance and wed<>'Y';
                  commit;
                end if;
                if i.day = 4 then
                  update schedule set thu='Y' where train=i.train and distance=i.distance and thu<>'Y';
                  commit;
                end if;
                if i.day = 5 then
                  update schedule set fri='Y' where train=i.train and distance=i.distance and fri<>'Y';
                  commit;
                end if;
                if i.day = 6 then
                  update schedule set sat='Y' where train=i.train and distance=i.distance and sat<>'Y';
                  commit;
                end if;
              end if;
              
              if orgnum_tue='Y' then
                if i.day = 6 then
                  update schedule set sun='Y' where train=i.train and distance=i.distance and sun<>'Y';
                  commit;
                end if;
                if i.day = 7 then
                  update schedule set mon='Y' where train=i.train and distance=i.distance and mon<>'Y';
                  commit;
                end if;
                if i.day = 1 then
                  update schedule set tue='Y' where train=i.train and distance=i.distance and tue<>'Y';
                  commit;
                end if;
                if i.day = 2 then
                  update schedule set wed='Y' where train=i.train and distance=i.distance and wed<>'Y';
                  commit;
                end if;
                if i.day = 3 then
                  update schedule set thu='Y' where train=i.train and distance=i.distance and thu<>'Y';
                  commit;
                end if;
                if i.day = 4 then
                  update schedule set fri='Y' where train=i.train and distance=i.distance and fri<>'Y';
                  commit;
                end if;
                if i.day = 5 then
                  update schedule set sat='Y' where train=i.train and distance=i.distance and sat<>'Y';
                  commit;
                end if;
              end if;
              
              if orgnum_wed='Y' then
                if i.day = 5 then
                  update schedule set sun='Y' where train=i.train and distance=i.distance and sun<>'Y';
                  commit;
                end if;
                if i.day = 6 then
                  update schedule set mon='Y' where train=i.train and distance=i.distance and mon<>'Y';
                  commit;
                end if;
                if i.day = 7 then
                  update schedule set tue='Y' where train=i.train and distance=i.distance and tue<>'Y';
                  commit;
                end if;
                if i.day = 1 then
                  update schedule set wed='Y' where train=i.train and distance=i.distance and wed<>'Y';
                  commit;
                end if;
                if i.day = 2 then
                  update schedule set thu='Y' where train=i.train and distance=i.distance and thu<>'Y';
                  commit;
                end if;
                if i.day = 3 then
                  update schedule set fri='Y' where train=i.train and distance=i.distance and fri<>'Y';
                  commit;
                end if;
                if i.day = 4 then
                  update schedule set sat='Y' where train=i.train and distance=i.distance and sat<>'Y';
                  commit;
                end if;
              end if;
              
              if orgnum_thu='Y' then
                if i.day = 4 then
                  update schedule set sun='Y' where train=i.train and distance=i.distance and sun<>'Y';
                  commit;
                end if;
                if i.day = 5 then
                  update schedule set mon='Y' where train=i.train and distance=i.distance and mon<>'Y';
                  commit;
                end if;
                if i.day = 6 then
                  update schedule set tue='Y' where train=i.train and distance=i.distance and tue<>'Y';
                  commit;
                end if;
                if i.day = 7 then
                  update schedule set wed='Y' where train=i.train and distance=i.distance and wed<>'Y';
                  commit;
                end if;
                if i.day = 1 then
                  update schedule set thu='Y' where train=i.train and distance=i.distance and thu<>'Y';
                  commit;
                end if;
                if i.day = 2 then
                  update schedule set fri='Y' where train=i.train and distance=i.distance and fri<>'Y';
                  commit;
                end if;
                if i.day = 3 then
                  update schedule set sat='Y' where train=i.train and distance=i.distance and sat<>'Y';
                  commit;
                end if;
              end if;
              
              if orgnum_fri='Y' then
                if i.day = 3 then
                  update schedule set sun='Y' where train=i.train and distance=i.distance and sun<>'Y';
                  commit;
                end if;
                if i.day = 4 then
                  update schedule set mon='Y' where train=i.train and distance=i.distance and mon<>'Y';
                  commit;
                end if;
                if i.day = 5 then
                  update schedule set tue='Y' where train=i.train and distance=i.distance and tue<>'Y';
                  commit;
                end if;
                if i.day = 6 then
                  update schedule set wed='Y' where train=i.train and distance=i.distance and wed<>'Y';
                  commit;
                end if;
                if i.day = 7 then
                  update schedule set thu='Y' where train=i.train and distance=i.distance and thu<>'Y';
                  commit;
                end if;
                if i.day = 1 then
                  update schedule set fri='Y' where train=i.train and distance=i.distance and fri<>'Y';
                  commit;
                end if;
                if i.day = 2 then
                  update schedule set sat='Y' where train=i.train and distance=i.distance and sat<>'Y';
                  commit;
                end if;
              end if;
              
              if orgnum_sat='Y' then
                if i.day = 2 then
                  update schedule set sun='Y' where train=i.train and distance=i.distance and sun<>'Y';
                  commit;
                end if;
                if i.day = 3 then
                  update schedule set mon='Y' where train=i.train and distance=i.distance and mon<>'Y';
                  commit;
                end if;
                if i.day = 4 then
                  update schedule set tue='Y' where train=i.train and distance=i.distance and tue<>'Y';
                  commit;
                end if;
                if i.day = 5 then
                  update schedule set wed='Y' where train=i.train and distance=i.distance and wed<>'Y';
                  commit;
                end if;
                if i.day = 6 then
                  update schedule set thu='Y' where train=i.train and distance=i.distance and thu<>'Y';
                  commit;
                end if;
                if i.day = 7 then
                  update schedule set fri='Y' where train=i.train and distance=i.distance and fri<>'Y';
                  commit;
                end if;
                if i.day = 1 then
                  update schedule set sat='Y' where train=i.train and distance=i.distance and sat<>'Y';
                  commit;
                end if;
              end if;
          --)
          else
          --(
              orgnum_sun:=i.sun;
              orgnum_mon:=i.mon;
              orgnum_tue:=i.tue;
              orgnum_wed:=i.wed;
              orgnum_thu:=i.thu;
              orgnum_fri:=i.fri;
              orgnum_sat:=i.sat;
          --)
          end if;
          --update schedule set sno = v_sno where train=i.train and distance=i.distance;
          --commit;
          v_sno:=v_sno+1;
          end loop;
       --close sched ;
    END LOOP;
    --CLOSE trainid_cur;
end updateday;