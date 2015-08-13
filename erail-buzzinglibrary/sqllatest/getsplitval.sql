--@train.sql
create or replace function getsplitval(master_inp varchar2, slave_inp varchar2) return varchar2 is
master_inp_p VARCHAR2(100);
slave_inp_p VARCHAR2(100);
return_out_p VARCHAR2(100):=null;
substr_1 VARCHAR2(100);
substr_2 VARCHAR2(100);
begin
master_inp_p := master_inp||',';
slave_inp_p := slave_inp||',';
substr_2 := master_inp_p;
while(length(substr_2)>1)
loop
--(
substr_1 := substr(substr_2, 0, instr(substr_2,',',1));
--dbms_output.put_line('Ykiran!!'||slave_inp_p||'!!'||substr_1);
if(instr(slave_inp_p, substr_1)>0) then
--(
	return_out_p := return_out_p||'Y,';
--)
else
--(
	return_out_p := return_out_p||'N,';
--)
end if;
substr_2 := substr(substr_2, instr(substr_2,',',1)+1);
--dbms_output.put_line('kiran'||substr_1||substr_2);
--)
end loop;
return_out_p := substr(return_out_p,0,length(return_out_p)-1);
return_out_p := replace('"'||replace(return_out_p,',','","')||'"','"','''');
return return_out_p;
end;
/

set serveroutput on;
select getsplitval('SUN,MON,TUE,WED,THU,FRI,SAT','MON,TUE') FROM DUAL;


UPDATE train SET 
days=getsplitval('SUN,MON,TUE,WED,THU,FRI,SAT',days),
classes = getsplitval('1A,FC,2A,3A,3E,CC,SL,2S',classes);
commit;


alter table train add (SUN VARCHAR2(1),MON VARCHAR2(1),TUE VARCHAR2(1),WED VARCHAR2(1),THU VARCHAR2(1),FRI VARCHAR2(1),SAT VARCHAR2(1));
alter table train add ("1A" VARCHAR2(1),"FC" VARCHAR2(1),"2A" VARCHAR2(1),"3A" VARCHAR2(1),"3E" VARCHAR2(1),"CC" VARCHAR2(1),"SL" VARCHAR2(1),"2S" VARCHAR2(1));
create table train_temp (train varchar2(10), SUN VARCHAR2(1),MON VARCHAR2(1),TUE VARCHAR2(1),WED VARCHAR2(1),THU VARCHAR2(1),FRI VARCHAR2(1),SAT VARCHAR2(1), "1A" VARCHAR2(1),"FC" VARCHAR2(1),"2A" VARCHAR2(1),"3A" VARCHAR2(1),"3E" VARCHAR2(1),"CC" VARCHAR2(1),"SL" VARCHAR2(1),"2S" VARCHAR2(1));
declare
	inpval varchar2(1000):=null;
begin
	for i in (select train,days,classes from train)
	loop
		inpval := ''''||i.train||''','||i.days||','||i.classes;
		execute immediate 'insert into train_temp values ('||inpval||')';
	end loop;
	commit;
exception
	when others then
		dbms_output.put_line('Error Came');
end;
/

update 
  train t
set
  (
    t.SUN, 	t.MON, 	t.TUE, 	t.WED,
	t.THU, 	t.FRI, 	t.SAT,
	t."1A",	t."FC", 	t."2A",	t."3A",
	t."3E",	t."CC",	t."SL",	t."2S"
      ) = (
    select
	t1.SUN, 	t1.MON, 	t1.TUE, 	t1.WED, 	
	t1.THU, 	t1.FRI, 	t1.SAT,
	t1."1A",	t1."FC", 	t1."2A",	t1."3A",
	t1."3E",	t1."CC",	t1."SL",	t1."2S"
    from
      train_temp  t1
    where
      t1.train = t.train
     )
    where exists (
      select 
        null
      from 
        train_temp t1
      where 
        t1.train = t.train
      );
	  

drop table train_temp;
alter table train drop(days, classes);

--@schedule.sql

alter table schedule add (SUN VARCHAR2(1),MON VARCHAR2(1),TUE VARCHAR2(1),WED VARCHAR2(1),THU VARCHAR2(1),FRI VARCHAR2(1),SAT VARCHAR2(1));

update 
  schedule t
set
  (
    t.SUN, 	t.MON, 	t.TUE, 	t.WED,
	t.THU, 	t.FRI, 	t.SAT
      ) = (
    select
	t1.SUN, 	t1.MON, 	t1.TUE, 	t1.WED, 	
	t1.THU, 	t1.FRI, 	t1.SAT
    from
      train  t1
    where
      t1.train = t.train and
	  t.arrival='Source'
     )
    where exists (
      select 
        null
      from 
        train t1
      where 
        t1.train = t.train and
		t.arrival='Source'
      );
	  
update 
  schedule t
set
    t.SUN = NVL(t.SUN,'N'), 	t.MON = NVL(t.MON,'N'), 	t.TUE = NVL(t.TUE,'N'), 	t.WED = NVL(t.WED,'N'),
	t.THU = NVL(t.THU,'N'), 	t.FRI = NVL(t.FRI,'N'), 	t.SAT = NVL(t.SAT,'N');
commit;

@exec updateday;
update schedule set Arrival='00:00' where Arrival='Source';
update schedule set DEPARTURE='00:00' where DEPARTURE='Destination';
commit;
create table trail_detail_reg_sf as select * from schedule;


---
create table trail_detail_reg_sf_13082015 as select * from trail_detail_reg_sf;
create table train_13082015 as select * from train;

INSERT INTO trail_detail_reg_sf (STATIONCODE, TRAINNUMBER, ARRIVAL, DEPARTURE, DAY, SUN, MON, TUE, WED, THU, FRI, SAT, SNO)
(SELECT STATION, TRAIN, ARRIVAL, DEPARTURE, DAY, SUN, MON, TUE, WED, THU, FRI, SAT, DISTANCE FROM SCHEDULE);

alter table train modify column train -- number, train_name -- name
ALTER TABLE train CHANGE TRAIN number CHAR(10);
ALTER TABLE train CHANGE TRAIN_NAME train_name CHAR(3`0);


update trail_detail_reg_sf set SUN=if(SUN='Y',1,0), MON=if(MON='Y',1,0), TUE=if(TUE='Y',1,0), WED=if(WED='Y',1,0), THU=if(THU='Y',1,0), FRI=if(FRI='Y',1,0), SAT=if(SAT='Y',1,0);
update train set SUN=if(SUN='Y',1,0), MON=if(MON='Y',1,0), TUE=if(TUE='Y',1,0), WED=if(WED='Y',1,0), THU=if(THU='Y',1,0), FRI=if(FRI='Y',1,0), SAT=if(SAT='Y',1,0);
update train set 1A=if(1A='Y',1,0),FC=if(FC='Y',1,0),2A=if(2A='Y',1,0),3A=if(3A='Y',1,0),3E=if(3E='Y',1,0),CC=if(CC='Y',1,0),SL=if(SL='Y',1,0),2S=if(2S='Y',1,0);