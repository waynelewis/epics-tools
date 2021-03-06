# training-setup

The end goal is to install and configure epics tools and services
The tools are installed in the epics-tools folder

epics-tools/services : hosts the epics and other services  
epics-tools/libs     : includes third party libraries  
epics-tools/client   : contains the users tools/clients   

#### Setup 


**Arrange for environment to be set using settings.sh**  
```
echo >>~/.bashrc source ~/epics-tools/setup/settings/settings.sh
source source ~/epics-tools/setup/settings/settings.sh
```

**Download requirements**  
`
download_requirements.sh
`
This script downloads all the third party binaries like, java, maven, elastic, kafka etc... and organized them under epics-tools

Manual steps  
Copy the training-setup/setup/services/* to /etc/systemd/system

**Install phoebus**  

`install_phoebus`  
This script checks out the latest phoebus repo and builds
1. phoebus cs-studio produce
2. alarm-server
3. alarm-logger-service
4. alarm-config-logger-service

**Install channel finder**  
`install_cf`  
This scripts check out channelfinder version 4 from github and build the binaries

Ensure that elastic and channelfinder are running

Manual step: (or use `configure_cf`)  
Create CF indexes  
```systemctl start elastic``` 
```source ~/epics-tools/services/ChannelFinder-SpringBoot/src/main/resources/mapping_definitions.sh```  

Create sample channels, tags, and properties  

curl -L -v -X PUT -H "Content-Type: application/json" -d '{"owner": "user", "name": "SR"}' --basic -u user:userpass --insecure http://localhost:9090/ChannelFinder/resources/tags/SR  
curl -L -v -X PUT -H "Content-Type: application/json" -d '{"owner": "user", "name": "archive"}' --basic -u user:userpass --insecure http://localhost:9090/ChannelFinder/resources/tags/archive

curl -L -v -X PUT -H "Content-Type: application/json" -d '{"owner": "user", "name": "device"}' --basic -u user:userpass --insecure http://localhost:9090/ChannelFinder/resources/properties/device  
curl -L -v -X PUT -H "Content-Type: application/json" -d '{"owner": "user", "name": "serialNumber"}' --basic -u user:userpass --insecure http://localhost:9090/ChannelFinder/resources/properties/serialNumber

curl -L -v -X PUT -H "Content-Type: application/json" -d '{"owner": "user", "name": "test_channel_1"}' --basic -u user:userpass --insecure http://localhost:9090/ChannelFinder/resources/channels/test_channel_1  
curl -L -v -X PUT -H "Content-Type: application/json" -d '{"owner": "user", "name": "test_channel_2"}' --basic -u user:userpass --insecure http://localhost:9090/ChannelFinder/resources/channels/test_channel_2  

**Install Alarm server**  

Manually Update the kafka  
```
mkdir /var/kafka
chown train /var/kafka
# Update to use dirs under /var/kafka
vi kafka_2.11-2.1.0/config/zookeeper.properties 
vi kafka_2.11-2.1.0/config/server.properties 
```  

Copy the kafka.service and zookeeper.service to /etc/systemd/system  

Create the alarm topics  
```configure_alarm.sh```


**Install Alarm logger server**  

Create the indexes  
```source ~/epics-tools/clients/phoebus/services/alarm-logger/startup/create_alarm_index.sh accelerator```  

startup  
```
cd ~/epics-tools/setup/startup/
start_alarm_logger_server.sh
```

**Install Archiver Appliance**

The download requirements script should have downloaded the required binaries  
After copying the archappl.service to /etc/systemd/system the archiver should be ready to go  

Configure the Archiver with the following channels

Sampling period 0.1  
XF:31IDA-BI{Dev:1}E-I  
XF:31IDA-BI{Dev:2}E-I  
XF:31IDA-BI{Dev:3}E-I  
XF:31IDA-BI{Dev:4}E-I  
XF:31IDA-BI{Dev:5}E-I  
XF:31IDA-BI{Dev:6}E-I  
XF:31IDA-OP{Tbl-Ax:X1}Mtr.RBV  
XF:31IDA-OP{Tbl-Ax:X2}Mtr.RBV  
XF:31IDA-OP{Tbl-Ax:X3}Mtr.RBV  
XF:31IDA-OP{Tbl-Ax:X4}Mtr.RBV  
XF:31IDA-OP{Tbl-Ax:X5}Mtr.RBV  
XF:31IDA-OP{Tbl-Ax:X6}Mtr.RBV  
  
Sampling period 1  
XF:31IDA-OP{Tbl-Ax:X1}Mtr  
XF:31IDA-OP{Tbl-Ax:X2}Mtr  
XF:31IDA-OP{Tbl-Ax:X3}Mtr  
XF:31IDA-OP{Tbl-Ax:X4}Mtr  
XF:31IDA-OP{Tbl-Ax:X5}Mtr  
XF:31IDA-OP{Tbl-Ax:X6}Mtr  
XF:31IDA-OP{Tbl-Ax:X1}Mtr_Alarm  
XF:31IDA-OP{Tbl-Ax:X2}Mtr_Alarm  
XF:31IDA-OP{Tbl-Ax:X3}Mtr_Alarm  
XF:31IDA-OP{Tbl-Ax:X4}Mtr_Alarm  
XF:31IDA-OP{Tbl-Ax:X5}Mtr_Alarm  
XF:31IDA-OP{Tbl-Ax:X6}Mtr_Alarm  
  
