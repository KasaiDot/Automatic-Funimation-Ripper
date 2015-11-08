import requests
from bs4 import BeautifulSoup
import subprocess  
import time



r = requests.get('http://www.funimation.com/videos/episodes')
soup = BeautifulSoup(r.text)
print soup.title
subtitles = soup.findAll('div',{'class':'item-resume-info clearfix'})
file = open("TempLinks.txt", "w")
for show in subtitles:
  x = show.find_all('a', limit=1)
  #print(len(x))
  for a in x:
   #print a['href']
   url = a['href']
   
   file.write(url+'\n')

file = open('TempLinks.txt', 'r')
#print file.read()
lobo = file.readline() 
print lobo  
lobo1 = str.strip(lobo)
urlH = lobo1 + ' -l jpn -q 1080p'
urlM = lobo1 + ' -l jpn -q 720p -B 2500K'
urlL = lobo1 + ' -l jpn -q 480p -B 750K'
file = open("Funicom-DL.que", "w")
file.write(urlH+'\n')
file.write(urlM+'\n')
file.write(urlL)
file.close()

p = subprocess.Popen('Funicom-DL.bat')
  