#!/usr/bin/bash

pemkey="$HOME/nb044266.pem"

FROM='nageswarrao.bandi@broadcom.com'
TO='nageswarrao.bandi@broadcom.com'
#TO='nageswarrao.bandi@broadcom.com'
DIR_PATH="$HOME/cron_jobs/"
ASM_SERVER_LIST="$HOME/cron_jobs/new_asm_server_list.txt"

function check(){
ssh -o "StrictHostKeyChecking=no" -i ${pemkey} root@stage08.watchmouse.net "$1"
}
function disk_check(){
ssh -o StrictHostKeyChecking=no -i ${pemkey}  $1@$2.watchmouse.net "$3" | awk -F " " 'NR==2 {print $5 }'
}
function check_server_status(){
ssh -o ConnectTimeout=20 -o StrictHostKeyChecking=no -i ${pemkey} $1@$2.watchmouse.net $3
}
function cpu_check(){
ssh -o StrictHostKeyChecking=no -i ${pemkey}  $1@$2.watchmouse.net "$3" | awk -F " " 'NR==4 {print $4 }'
}
function disk_check(){
ssh -o "StrictHostKeyChecking=no" -i ${pemkey} $1@$2.watchmouse.net "$3 && $4 "
}
function calculation(){
status=$(openssl s_client -connect $1.watchmouse.net:443 2>/dev/null |openssl x509 -noout -dates | tee -a $LOG_FILE)
}
function calculation_on_server(){
 status=$( ssh -o "StrictHostKeyChecking=no" -i ${pemkey} $1@$2.watchmouse.net "openssl s_client -connect ${2}.watchmouse.net:443 2>/dev/null |openssl x509 -noout -dates")
}


###########################################################
#!/usr/bin/bash
source $HOME/cron_jobs/primary.sh

#From mail 

#FROM='nageswarrao.bandi@broadcom.com'

DATE_TIME=$(date +"%Y_%m_%d_%H_%M")
OUT_PUT_FILE="ASM_Disk_Memory_out_${DATE_TIME}.txt"
LOG_FILE="$DIR_PATH$OUT_PUT_FILE"
SERVER_STATUS_FILE_NAME="ASM_Servers_live_status_${DATE_TIME}.txt"
SERVER_LOG_FILE="$DIR_PATH$SERVER_STATUS_FILE_NAME"
touch $SERVER_LOG_FILE
DATE=$(date +"%Y-%m-%d-%H_%M")

echo $LOG_FILE
echo "ASM Disk/Cpu Validation Time & Date: $(date)">$LOG_FILE

for i in `cat $ASM_SERVER_LIST`
do      
        locode=`echo $i | awk -F ":" '{print $1 }'`
        user_name=`echo $i | awk -F ":" '{print $2 }'` 
	check_server_status $user_name $locode date
	if [[ $? -eq 0 ]];
	then
		echo -e "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++" >>$LOG_FILE
                echo -e "Disk/Memory usage status on server: $locode \n">>$LOG_FILE
                disk_check $user_name $locode 'df -h ' 'free -h' >>$LOG_FILE
                echo -e "++++++++++++++  Cpu average ++++++++++ \n" >>$LOG_FILE
                cpu_average=$(cpu_check $user_name $locode 'mpstat -P ALL')
                echo Cpu average= $cpu_average >>$LOG_FILE

		echo -e "==============================================================================\n" >>$LOG_FILE
	else
        	echo "Hi Team, The server $locode not responding/Shutdown please check." >>$SERVER_LOG_FILE
	fi

done

#Send mail 

output="${DIR_PATH}ASM_Disk_Memory_output_${DATE}.txt"
echo $output
echo $DIR_PATH
$(sed -e 's/\x1b\[[0-9;]*m//g' $LOG_FILE >$output)

#Send mail

( echo "To: $TO"
  echo "From: $FROM"
  echo "subject: ASM Servers Disk/Cpu status "
  echo "mime-version: 1.0"
  echo "content-type: multipart/related; boundary=messageBoundary"
  echo
  echo "--messageBoundary"
  echo "content-type: text/plain"
  echo
  echo "Please find the document attached for all ASM servers Disk/Memory status."
  echo
  echo "--messageBoundary"
  echo "content-type: text/plain; name=ASM_Disk_Memory_${DATE}.txt"
  echo "content-transfer-encoding: base64"
  echo
  openssl base64 < $output ) | /usr/sbin/sendmail -t -i ;



sleep 5s ;

rm $LOG_FILE 
rm $SERVER_LOG_FILE 
rm $output 
#################################################################################################
#!/usr/bin/bash

source $HOME/cron_jobs/primary.sh

DATE_TIME=$(date +"%Y_%m_%d_%H_%M")
OUT_PUT_FILE="ASM_servers_live_check_out_${DATE_TIME}.txt"
LOG_FILE="$DIR_PATH$OUT_PUT_FILE"
SERVER_STATUS_FILE_NAME="ASM_Servers_shutdown_check_${DATE_TIME}.txt"
SERVER_LOG_FILE="$DIR_PATH$SERVER_STATUS_FILE_NAME"
touch $SERVER_LOG_FILE
DATE=$(date +"%Y-%m-%d-%H_%M")

echo $LOG_FILE
#echo "ASM Popch Validation check Time & Date: $(date)">$LOG_FILE

for i in `cat $ASM_SERVER_LIST`
do      
        locode=`echo $i | awk -F ":" '{print $1 }'`
        user_name=`echo $i | awk -F ":" '{print $2 }'` 
	check_server_status $user_name $locode date
	if [[ $? -eq 0 ]];
	then
		echo -e "**********************************************************************************************" >>$LOG_FILE
		echo -e " $locode Responding and healty \n">>$LOG_FILE

		echo -e "==============================================================================\n" >>$LOG_FILE
	else
        	echo "Hi Team, The server $locode not responding/Shutdown please check." >>$SERVER_LOG_FILE
	fi

done


#Send mail 
sleep 5s ;

( echo "To: $TO"
  echo "From: $FROM"
  echo "subject: ASM Servers Shutdown check "
  echo "Content-Type: text"
  echo
  cat $SERVER_LOG_FILE ) | /usr/sbin/sendmail -t -i


sleep 10s;

rm $LOG_FILE 
rm $SERVER_LOG_FILE 
