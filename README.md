# ubuntu  
## 1 sudo whiout passwd  
   vim /etc/sudoers, add   
   andy    ALL=(ALL:ALL) ALL  
   %andy ALL=(ALL) NOPASSWD:NOPASSWD  
  
## 2 install google chrome  
   wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -  
   echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-          chrome.list  
   sudo apt-get update  
   sudo apt-get -y install google-chrome-stable  
   sudo apt-get -y install google-chrome-beta  
   
## 3 install pip,venv,flask  
   sudo apt install python3-pip  
   sudo apt install python3-venv  
   how to create venv? python3 -m venv flask  
   how to active venv? ssource activate   
   sudo apt install python3-flask  
   
## ping unkown host  
   vim /etc/resolv.conf  
   #nameserver 127.0.0.53(must be annotated)  
   nameserver 8.8.8.8  
   nameserver 4.4.4.4  

