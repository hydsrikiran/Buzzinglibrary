from bs4 import BeautifulSoup
from fetchpage import fetchpage
import sqlite3

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
        print('No data: ',train)
        return None
    classcode=['1A','FC','2A','3A','3E','CC','SL','2S']
    d={}
    #d['train-number']=l[3]
    #d['train-name']=l[4]
    d['class-code']=[]
    not_encoutered_day=0
    for i,txt in enumerate(l):
        if txt in classcode:
            d['class-code'].append(txt)
            not_encoutered_day=1
        elif not_encoutered_day==1:
            break
    d['route']=[]    
    return d
	
if __name__=="__main__":
    #extract('14615')
    r=extract_class(14114)
    if r==None:
        exit(11)
    print(r['class-code'])