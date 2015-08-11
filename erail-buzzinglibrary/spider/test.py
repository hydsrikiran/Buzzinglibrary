import time
from bs4 import BeautifulSoup
from fetchpage import fetchpage
import sqlite3

def namedb(db,number,name,rundays,classes):
    t=db.execute("SELECT number FROM train WHERE number=(?)",(number,))
    if(t.fetchone()==None):
        rundays=','.join(rundays)
        classes=','.join(classes)
        db.execute("INSERT INTO train VALUES (?,?,?,?)",(number,name,rundays,classes))

def validate_class(s):
    s=s.strip()
    if '1A' in s:
        return True
    if 'FC' in s:
        return True
    if '2A' in s:
        return True
    if '3A' in s:
        return True
    if '3E' in s:
        return True
    if 'CC' in s:
        return True
    if 'SL' in s:
        return True
    if '2S' in s:
        return True
    return False
	
def extract_class(train):
    url="http://erail.in/"+str(train)+"/route"
    print(url)
    html=fetchpage(url)
    l=[]
    soup=BeautifulSoup(html,"html.parser")
    length=0
    for i in soup.find_all("b"):
        if len(i.attrs)==0:
            if(validate_class(i.text)):
                for j in i.text.split(" "):
                       length+=1
                       l.append(j.strip())
    if length<1: # rough heuristic to detect error
        print('No data extract_class: ',train)
        return None
    classcode=['1A','FC','2A','3A','3E','CC','SL','2S']
    d1={}
    d1['class-code']=[]
    not_encoutered_class=0
    for i,txt in enumerate(l):
        if txt in classcode:
            d1['class-code'].append(txt)
            not_encoutered_class=1
        elif not_encoutered_class==1:
            break
    return d1
	
def dbcreate():   
     eonn=sqlite3.connect('train.db')
     edb=eonn.cursor()
     for row in edb.execute("SELECT number FROM train WHERE classes='' LIMIT 300"):
        try:
            ret=str(row)[2:7]
            f=extract_class(ret)
            if f==None: 
                continue
            #print("update train set classes='"+",".join(f['class-code'])+"' where train='"+ret+"'")
        except:
            print('Error in: ')
            eonn.commit()
            exit(11)
        else:
            #f=extract_class(ret)
            #if f==None: 
                #continue
            #print('kiran')
            print("update train set classes='"+",".join(f['class-code'])+"' where train='"+ret+"'")
            try:
                   eonn.execute("update train set classes='"+",".join(f['class-code'])+"' where number='"+ret+"'")
                   print ("Total number of rows updated :", eonn.total_changes)
            except:
                  print('Error in: ')
                  eonn.commit()
                  exit(11)

     #conn.commit()
     #donn.commit()
     eonn.commit()
     #conn.close()
     #donn.close()
     eonn.close()
     


if __name__=="__main__":
    #extract('11091')
    dbcreate()                  

             
