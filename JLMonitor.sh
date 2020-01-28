#!/bin/bash

### JLMÖ Jormungandr Live Monitor v0.6.0 ###
### Author: ADASnakePool ### 
### Updated: 20200128 ###

### TO BE UPDATE WHEN DEPLOYED ON GITHUB
### Important!!! ### ######################################################## ###
### DECLARE VARIABLES ###

### BLOCKCHAIN DIR and DB ###
export BCHAINDIR="$HOME/JormungandrWorkDir/Blockchain"
export BCHAINDB="$HOME/JormungandrWorkDir/Blockchain/blocks.sqlite"

### REST API STRING ###
export RESTPORT=8443
export HOST="--host http://127.0.0.1:$RESTPORT/api"
export FORMAT="--output-format yaml"

### STAKEPOOL OWNER ACCOUNTS ###
export STKPOOLOWNACC=ca1s5eag5na0gparzgpg3myve39xsd9rtct89tnk3uuyt93gzfu0v6pcxzcvwz

### STAKE POOL ID ###
export STKPOOLID=902a7e2e723456177e807ba6c115ba9203dc3151a03f6113691c93cb01d35bd5

### CALCULATE THE SIZE OF THE TERMINAL - NEED FEEDBACK FROM TESTERS ###
terminal_size() {
terminal_cols="$(tput cols)"
terminal_rows="$(tput lines)"
}

terminal_size

### SET COLORS AND FORMAT #####
export red=`printf "\033[1;33m"`
export blu=`printf "\033[1;94m"`
export whi=`printf "\033[1;37m"`
export gre=`printf "\033[1;32m"`
export gre2=`printf "\033[1;36m"`
export black=`printf "\033[0;30m"`
export undline=`echo -e "\e[4m"`

### CUSTOM  UNICODE DELIMITERS ###
export d1=$(printf "\U2501")   #:line - bold
export d2=$(printf "\U2503")   #:| bold
export d3=$(printf "\U254B")   #: cross bold
export d4=$(printf "\U250F")   #: ┏
export d5=$(printf "\U251B")   #: ┛
export d6=$(printf "\U2513")   #: ┓
export d7=$(printf "\U2517")   #: ┗
export d8=$(printf "\U2523")   #: ┣
export d9=$(printf "\U252B")   #: ┫
export d10=$(printf "\U2533")  #: ┳
export d11=$(printf "\U253B")  #: ┻

### CUSTOM  UNICODE SYMBOLS ###
export s1=$(printf "\U221E")  #: ∞
export s2=$(printf "\U1F432") #: 🐲
export s3=$(printf "\U1F409") #: 🐉
export ada=$(printf "\U20B3") #: ₳

### GRID UNICODE DECORATON ### 
export top=$black$d4$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d6

export middle=$black$d8$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d9


export bottom=$black$d7$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d1$d5


### SET FUNCTIONS CUSTOM FIXED DELIMITERS ###
delcol1() { # green pipe
awk '{len=51-length;printf("%s%*s\n",$0,len,"'$gre2"|"'")}'
}

delcol2() { # green pipe
awk '{len=47-length;printf("%s%*s\n",$0,len,"'$gre2"|"'")}'
}

delcol3() { # green pipe
awk '{len=47-length;printf("%s%*s\n",$0,len,"'$gre2"|"'")}'
}

delcol4() { # green pipe
awk '{len=112-length;printf("%s%*s\n",$0,len,"'$gre2"|"'")}'
}

delcol5() { # green pipe
awk '{len=105-length;printf("%s%*s\n",$0,len,"'$gre2"|"'")}'
}
# 
delcol6() { # green pipe
awk '{len=98-length;printf("%s%*s\n",$0,len,"'$gre2"|"'")}'
}

delcol7() { # green pipe
awk '{len=64-length;printf("%s%*s\n",$0,len,"'$gre2"|"'")}'
}

delcol8() { # green pipe
awk '{len=61-length;printf("%s%*s\n",$0,len,"'$gre2"|"'")}'
}

delcol9() { # green pipe
awk '{len=44-length;printf("%s%*s\n",$0,len,"'$black"|"'")}'
}

delcol10() { # green pipe
awk '{len=40-length;printf("%s%*s\n",$0,len,"'$gre2"|"'")}'
}

delcol11() { # black pipe
awk '{len=40-length;printf("%s%*s\n",$0,len,"'$black"|"'")}'
}

delcol12() { # black pipe
awk '{len=41-length;printf("%s%*s\n",$0,len,"'$black"|"'")}'
}

delcol13() { # green pipe
awk '{len=62-length;printf("%s%*s\n",$0,len,"'$gre2"|"'")}'
} ### UNUSED

delcol14() { # black pipe
awk '{len=55-length;printf("%s%*s\n",$0,len,"'$black"|"'")}'
}

delcol15() { # green pipe
awk '{len=56-length;printf("%s%*s\n",$0,len,"'$gre2"|"'")}'
}

delcol16() { # black pipe
awk '{len=32-length;printf("%s%*s\n",$0,len,"'$red"|"'")}'
}

delcol17() { # black pipe
awk '{len=34-length;printf("%s%*s\n",$0,len,"'$black"|"'")}'
}

delcol18() { # green pipe
awk '{len=45-length;printf("%s%*s\n",$0,len,"'$gre2"|"'")}'
}  ### UNUSED

delcol19() { # black pipe
awk '{len=35-length;printf("%s%*s\n",$0,len,"'$black"|"'")}'
}

delcol20() { # black pipe
awk '{len=36-length;printf("%s%*s\n",$0,len,"'$black"|"'")}'
}

delcol21() { # green pipe
awk '{len=76-length;printf("%s%*s\n",$0,len,"'$gre2"|"'")}'
}

delcol22() { # black pipe
awk '{len=46-length;printf("%s%*s\n",$0,len,"'$black"|"'")}'
}

delcol23() { # green pipe
awk '{len=42-length;printf("%s%*s\n",$0,len,"'$gre2"|"'")}'
} ### UNUSED

delcol24() { # black pipe
awk '{len=91-length;printf("%s%*s\n",$0,len,"'$gre2"|"'")}'
}

delcol25() { # green pipe
awk '{len=38-length;printf("%s%*s\n",$0,len,"'$gre2"|"'")}'
} ### UNUSED

delcol26() { # green pipe
awk '{len=37-length;printf("%s%*s\n",$0,len,"'$gre2"|"'")}'
} ### UNUSED

delcol27() { # black pipe
awk '{len=21-length;printf("%s%*s\n",$0,len,"'$red"|"'")}'
} ### UNUSED

delcol28() { # green pipe
awk '{len=60-length;printf("%s%*s\n",$0,len,"'$gre2"|"'")}'
}

delcol29() { # green pipe
awk '{len=98-length;printf("%s%*s\n",$0,len,"'$gre2"|"'")}'
}

delcol30() { # green pipe
awk '{len=109-length;printf("%s%*s\n",$0,len,"'$gre2"|"'")}'
} ### UNUSED

delcol31() { # green pipe
awk '{len=61-length;printf("%s%*s\n",$0,len,"'$gre2"|"'")}'
} ### UNUSED

delcol32() { # green pipe
awk '{len=82-length;printf("%s%*s\n",$0,len,"'$gre2"|"'")}'
}

delcol33() { # green pipe
awk '{len=74-length;printf("%s%*s\n",$0,len,"'$gre2"|"'")}'
}

delcol34() { # green pipe
awk '{len=70-length;printf("%s%*s\n",$0,len,"'$gre2"|"'")}'
}

delcol35() { # black pipe
awk '{len=37-length;printf("%s%*s\n",$0,len,"'$black"|"'")}'
}

delcol36() { # green pipe
awk '{len=49-length;printf("%s%*s\n",$0,len,"'$gre2"|"'")}'
}

delcol37() { # black pipe
awk '{len=30-length;printf("%s%*s\n",$0,len,"'$red"|"'")}'
} ### UNUSED

delcol38() { # black pipe
awk '{len=35-length;printf("%s%*s\n",$0,len,"'$red"|"'")}'
}

delcol39() { # black pipe
awk '{len=49-length;printf("%s%*s\n",$0,len,"'$red"|"'")}'
} ### UNUSED

delcol40() { # black pipe
awk '{len=28-length;printf("%s%*s\n",$0,len,"'$red"|"'")}'
} ### UNUSED

delcol41() { # black pipe
awk '{len=75-length;printf("%s%*s\n",$0,len,"'$gre"|"'")}'
} ### UNUSED

delcol42() { # green pipe
awk '{len=54-length;printf("%s%*s\n",$0,len,"'$gre2"|"'")}'
}

delcol43() { # green pipe
awk '{len=81-length;printf("%s%*s\n",$0,len,"'$gre2"|"'")}'
}

delcol44() { # black pipe
awk '{len=52-length;printf("%s%*s\n",$0,len,"'$black"|"'")}'
}

delcol45() { # black pipe
awk '{len=73-length;printf("%s%*s\n",$0,len,"'$gre2"|"'")}'
}
###################################### ###

### RIGHT SCREEN BLACK BOLD DELIMITERS ###
delcolboldpipe1() { 
awk '{len=93-length;printf("%s%*s\n",$0,len,"'$black$d2'")}'
}

delcolboldpipe2() { 
awk '{len=191-length;printf("%s%*s\n",$0,len,"'$black$d2'")}'
}

delcolboldpipe3() { 
awk '{len=100-length;printf("%s%*s\n",$0,len,"'$black$d2'")}'
}

delcolboldpipe4() { 
awk '{len=39-length;printf("%s%*s\n",$0,len,"'$black$d2'")}'
} ### UNUSED

delcolboldpipe5() { 
awk '{len=185-length;printf("%s%*s\n",$0,len,"'$black$d2'")}'
}

delcolboldpipe6() { 
awk '{len=72-length;printf("%s%*s\n",$0,len,"'$black$d2'")}'
} ### UNUSED

delcolboldpipe7() {
awk '{len=62-length;printf("%s%*s\n",$0,len,"'$black$d2'")}'
}

delcolboldpipe8() { 
awk '{len=134-length;printf("%s%*s\n",$0,len,"'$black$d2'")}'
}

delcolboldpipe9() { 
awk '{len=41-length;printf("%s%*s\n",$0,len,"'$black$d2'")}'
} ### UNUSED

delcolboldpipe10() { 
awk '{len=192-length;printf("%s%*s\n",$0,len,"'$black$d2'")}'
}

delcolboldpipe11() { 
awk '{len=93-length;printf("%s%*s\n",$0,len,"'$black$d2'")}'
}

delcolboldpipe12() { 
awk '{len=148-length;printf("%s%*s\n",$0,len,"'$black$d2'")}'
}

delcolboldpipe13() { 
awk '{len=27-length;printf("%s%*s\n",$0,len,"'$black$d2'")}'
}

delcolboldpipe14() { 
awk '{len=178-length;printf("%s%*s\n",$0,len,"'$black$d2'")}'
}

delcolboldpipe15() { 
awk '{len=185-length;printf("%s%*s\n",$0,len,"'$black$d2'")}'
}

delcolboldpipe16() { 
awk '{len=168-length;printf("%s%*s\n",$0,len,"'$black$d2'")}'
}

delcolboldpipe17() { 
awk '{len=34-length;printf("%s%*s\n",$0,len,"'$black$d2'")}'
}

delcolboldpipe18() { 
awk '{len=161-length;printf("%s%*s\n",$0,len,"'$black$d2'")}'
}

delcolboldpipe19() { 
awk '{len=148-length;printf("%s%*s\n",$0,len,"'$black$d2'")}'
}

delcolboldpipe20() { 
awk '{len=163-length;printf("%s%*s\n",$0,len,"'$black$d2'")}'
}

delcolboldpipe21() { 
awk '{len=199-length;printf("%s%*s\n",$0,len,"'$black$d2'")}'
}

delcolboldpipe22() { 
awk '{len=92-length;printf("%s%*s\n",$0,len,"'$black$d2'")}'
}
### END CUSTOM FIXED DELIMITERS ###

### VARS RETURNING JORMUNGANDR AND JCLI VERSION ###
export JORMVER=`jormungandr --version | sed 's/jormungandr//'`
export JCLIVER=`jcli --version | sed 's/jcli//'`

###  GET JORMUNGANDR PID (RETURNS IF IT'S RUNNING OR NOT) ###
export JPID=$(pgrep -x jormungandr 2>&1)

### JCLI REST COMMANDS ###
export JCLIREST="jcli rest v0"
export NODESTATS="$JCLIREST node stats get $FORMAT $HOST"
export NODESETUP="$JCLIREST settings get $FORMAT $HOST"
export STKPOOLS="$JCLIREST stake-pools get $FORMAT $HOST"
export STAKEINFO="$JCLIREST stake get $FORMAT $HOST"
export GETLEADERSLOG="$JCLIREST leaders logs get $FORMAT $HOST"
export STKPOOL="$JCLIREST stake-pool get $STKPOOLID $FORMAT $HOST"
export DIAGNOS="$JCLIREST diagnostic get $HOST"

### ACCOUNTS BALANCE ###
export BALANCE="$JCLIREST account get $STKPOOLOWNACC $FORMAT $HOST"

### FUNCTION: EXIT ON Q KEY PRESS ###
pressqexit() {
read -n 1 -t 0.5 input
if [[ $input = "q"  ]]
then
echo $whi
tput cnorm  
tput clear
exit
fi
}

### START JLMO JORMUGANDR LIVE MONITOR ###
if [ "$JPID" ] ;  then
echo
echo
echo -e $gre\Jormungandr Status: $whi\Running Pid - $JPID
echo
echo
export NODERESTARTTIM=`echo -e $(ps -p $(pgrep jormungandr) -o lstart 2>/dev/null | sed 's/                 STARTED/'${gre}'Node Restart Time:'${whi}'/')`
echo -e $NODERESTARTTIM 2>/dev/null
echo
echo
echo -e $red\If Node has been started/restarted, $whi\please wait for full REST API availability.
echo
echo
echo -e $gre\Starting JLMÖ Jormungandr Live Monitor $s2
echo
tput civis
sleep 1

### START LOOP ###

while true ; do

################## ###
### GLOBAL WIDGETS ###
export JPROCMSG=`pgrep -x jormungandr >/dev/null && echo -e $gre\Jormungandr status $whi\Running Pid - $(echo $JPID) || echo -e $gre\Jormungandr status: $whi\Not Running`
export JORVERSION=`echo $gre2\JORMUNGANDR:$whi $JORMVER | delcol1`
export JCLIVERSION=`echo $gre2\JCLI:$whi$JCLIVER | delcol1`
export CPUUSAGE=`echo -e $gre2\CPU USAGE: $whi$(ps -C jormungandr -o %cpu) | delcol2`
export MEMUSAGE=`echo -e $gre2\MEMORY USAGE: $whi$(ps -C jormungandr -o %mem) | delcol2`
export BCHAINSIZE=`echo -e $gre2\LOCAL STORAGE: $whi$(du -hs $BCHAINDIR | cut -f1) | delcol3`
export BLOCKSINDB=`echo -e $gre2\STORED BLOCKS: $whi$(sqlite3 $BCHAINDB "select count (*) from blocks" 2>/dev/null) | delcol3`
################## ###


################################# ###
### CHECK ESTABLISHED CONNECTIONS ###
export ESTABLCONNS=`netstat -natup 2>/dev/null | grep 'ESTABLISHED' | grep jormungandr | wc -l`
export CONNESTABLISHED=`echo $gre2\ESTABLISHED CONNECTIONS:$whi $(echo $ESTABLCONNS)  | delcol1`
################################# ###


########################################## ###
### WIDGETS: TEXT HEADERS AND OTHER STUFFS ###
export HEADMAIN=`echo -e $gre2\JLMÖ Jormungandr Live Monitor:$whi $(date -u) $gre2$s2 | delcolboldpipe2`
export HEADINFO1=`echo $red\SYSTEM INFO: | delcol6`  
export HEADINFO2=`echo $red\NODE STATISTICS: | delcol6`
export HEADINFO3=`echo $red\NODE SETTINGS: | delcol6 | delcolboldpipe15`
export HEADINFO4=`echo $red\STAKEPOOL ACTIVITY: | delcolboldpipe1` 
export HALFDELIM=`echo -e $gre | delcol6`
export HALFDELIM2=`echo -e $gre | delcol6 | delcolboldpipe5`
export HALFDELIM3=`echo -e $gre | delcol6`
export QEXIT=`echo -e $gre2\ "(q)"to quit | delcolboldpipe13`
export QEXIT=`echo -e $gre2\ "(q)"to quit`
export NEXT=`echo -e $gre2\ "(n)"to next page`
export BACK=`echo -e $gre2\ "(b)"to go back`
########################################## ###


################################### ###
### WIDGETS: REST NODE STATS VALUES ### 
export NODSTATUS=`echo -e $gre2\NODE STATUS:$whi $(eval $NODESTATS 2>/dev/null | grep state | cut -f2- -d:) | delcol1`
export NODUPTIME=`echo -e $gre2\NODE UPTIME:$whi $(eval $NODESTATS 2>/dev/null | grep uptime | cut -f2- -d:) | delcol2` 
export BCHAINTIME=`echo -e $gre2\EPOCH SLOT:$whi $(eval $NODESTATS 2>/dev/null | grep lastBlockDate | cut -f2- -d:) | delcol3` 
export BLKRECVNUM=`echo -e $gre2\RECEIVING BLOCKS:$whi $(eval $NODESTATS 2>/dev/null | grep blockRecvCnt | cut -f2- -d:) | delcol1` 
export LSTBLTXC=`echo -e $gre2\RECEIVED TXS:$whi $(eval $NODESTATS 2>/dev/null | grep txRecvCnt | cut -f2- -d:) | delcol2`
export LSTBLTRX=`echo -e $gre2\LAST BLOCK TX:$whi $(eval $NODESTATS 2>/dev/null | grep lastBlockTx | cut -f2- -d:) | delcol3 | delcolboldpipe8`
export LSTBLKHT=`echo -e $gre2\LAST BLOCK EIGHT:$whi $(eval $NODESTATS 2>/dev/null | grep lastBlockHeight | cut -f2- -d:) | delcol1`
export LSTBLSUM=`echo -e $gre2\LAST BLOCK SUM:$whi $(eval $NODESTATS 2>/dev/null | grep lastBlockSum | cut -f2- -d:) | delcol33 | delcolboldpipe18`
export LSTBLKFS=`echo -e $gre2\LAST BLOCK FEES:$whi $(eval $NODESTATS 2>/dev/null | grep lastBlockFees | cut -f2- -d:) | delcol5 | delcolboldpipe10`
export LSTBLKHASH=`echo -e $gre2\LAST BLOCK HASH:$whi $(eval $NODESTATS 2>/dev/null | grep lastBlockHash | cut -f2- -d:) | delcol5`
export LSTBLTIM=`echo -e $gre2\LAST BLOCK TIME:$whi $(eval $NODESTATS 2>/dev/null | grep lastBlockTime | cut -f2- -d:) | delcol5 | delcolboldpipe10`
export PEERAVACNT=`echo -e $gre2\PEER AVAILABLE COUNT:$whi $(eval $NODESTATS 2>/dev/null | grep peerAvailableCnt | cut -f2- -d:) | delcol44`
export PEERQUACNT=`echo -e $gre2\PEER QUARANTINED COUNT:$whi $(eval $NODESTATS 2>/dev/null | grep peerQuarantinedCnt | cut -f2- -d:) | delcol45`
export PEERUNRCNT=`echo -e $gre2\PEER UNREACHABLE COUNT:$whi $(eval $NODESTATS 2>/dev/null | grep peerUnreachableCnt | cut -f2- -d:) | delcol5`
################################### ###


###################################### ###
### WIDGETS: REST NODE SETTINGS VALUES ### 
export CONSVER=`echo -e $gre2\CONSENSUS VERSION:$whi $(eval $NODESETUP 2>/dev/null | grep consensusVersion | cut -f2- -d:) | delcol36`
export BLK0HASH=`echo -e $gre2\BLOCK 0 HASH$gre2:$whi $(eval $NODESETUP 2>/dev/null | grep block0Hash | cut -f2- -d:) | delcol4 | delcolboldpipe21`
export BLK0TIM=`echo -e $gre2\BLOCK 0 TIME:$whi$(eval $NODESETUP 2>/dev/null | grep block0Time | cut -f2- -d:) | delcol7`
export BLKMAXSIZE=`echo -e $gre2\BLOCK CONTENT MAX SIZE:$whi $(eval $NODESETUP 2>/dev/null | grep blockContentMaxSize | cut -f2- -d:) | delcol8 | delcolboldpipe12` 
export SLTPEPC=`echo -e $gre2\SLOTS PER EPOCH:$whi $(eval $NODESETUP 2>/dev/null | grep slotsPerEpoch | cut -f2- -d:) | delcol9`
export SLTDURA=`echo -e $gre2\SLOT DURATION:$whi $(eval $NODESETUP 2>/dev/null | grep slotDuration | cut -f2- -d:) | delcol10`
export EPCSTBDPTH=`echo -e $gre2\EPOCH STABILITY DEPTH:$whi $(eval $NODESETUP 2>/dev/null | grep epochStabilityDepth | cut -f2- -d:) | delcol8 | delcolboldpipe19` 
export CURSLSTR=`echo -e $gre2\CURRENT SLOT START TIME:$whi$(eval $NODESETUP 2>/dev/null | grep currSlotStartTime | cut -f2- -d:) | delcol21 | delcolboldpipe20`
###################################### ###


############################################ ###
### WIDGETS: REST STAKEPOOL AND STAKE VALUES ###
export MYPOOL=`echo -e $gre2\ID:$whi $(eval $STKPOOLS 2>/dev/null | grep $STKPOOLID | sed 's/- //') | delcolboldpipe3`
export HEADINFO5=`echo $gre2\STAKEPOOL FIXED TAX:`
export TAXPERCENT=`echo -e $whi $(eval $STKPOOL 2>/dev/null | grep denominator | sed 's/    denominator/denominator/' | cut -f2 -d:)`
export PERCENT=`echo "%" | delcolboldpipe7`
export TOTALSTK=`echo -e $gre2\TOTAL STAKE:$whi $(eval $STKPOOL 2>/dev/null | grep total_stake | cut -f2 -d: | sed 's/ //') | delcolboldpipe3`
export REWDSEPOCH=`echo -e $gre2\REWARDS IN EPOCH:$whi $(eval $STKPOOL 2>/dev/null | grep epoch | cut -f2 -d: | sed 's/ //') | delcol42`
export STKPOOLACCREW=`echo $gre2\LAST REWARDS FOR STAKEPOOL OWNER ACCOUNT:$whi $(eval $BALANCE 2>/dev/null | grep reward | cut -f2 -d:) | delcolboldpipe3`
export VALFORSTKERS=`echo -e $gre2\VALUE FOR STAKERS$whi $(eval $STKPOOL 2>/dev/null | grep value_for_stakers | cut -f2 -d:) | delcol44`
export VALTAXED=`echo -e $gre2\TAXED$whi $(eval $STKPOOL 2>/dev/null | grep value_taxed | cut -f2 -d:) | delcolboldpipe17`
export STKPOOLNUM=`echo -e $gre2\STAKEPOOLS COUNT:$whi $(eval $STKPOOLS 2>/dev/null | wc -l) | delcol2 | delcol43 | delcolboldpipe16`
#export FIXTAX=`echo -e $gre2\FIXED$whi $(eval $STKPOOL 2>/dev/null | grep fixed | cut -f2 -d: | sed 's/ //') | delcol38` ### UNUSED
#export MAXTAX=`echo -e $gre2\MAX$whi $(eval $STKPOOL 2>/dev/null | grep max | cut -f2 -d: | sed 's/ //') | delcol16` ### UNUSED
#export TAXRATIO=`echo $gre2\RATIO:` ### UNUSED
#export TAXNUM=`echo -e $gre2\NUMERATOR$whi $(eval $STKPOOL 2>/dev/null | grep numerator | sed 's/    numerator/numerator/' | cut -f2 -d:)` ### UNUSED
############################################ ###


#################################### ###
### WIDGETS: REST LEADER LOGS VALUES ###
export SLTLEADHEAD=`echo $red\SLOT LEADER: | delcolboldpipe11`
export ENCLEAD=`echo $gre2\EVENTS:$whi $(eval $GETLEADERSLOG 2>/dev/null | grep enclave_leader_id | sed 's/  //' | tr -s '\n' ' ' | cut -f2- -d: | sed 's/enclave_leader_id://')`
export LEADSTAT=`echo $gre2\STATUS:$whi $(eval $GETLEADERSLOG 2>/dev/null | grep status | sed 's/  //' | tr -s '\n' ' ' | cut -f2- -d: | sed 's/status: //' | sed 's/ //')`
export LEADSCHED=`echo -e $gre2\SCHEDULED AT EPOCH:$whi $(eval $GETLEADERSLOG 2>/dev/null | grep scheduled_at_date | sed 's/  //' | tr -s '\n' ' ' | cut -f2- -d: | sed 's/scheduled_at_date://')`
#export SCHEDTIM=`echo $gre2\SCHEDULED TIME:$whi $(eval $GETLEADERSLOG 2>/dev/null | grep scheduled_at_time | sed 's/  //' | tr -s '\n' ' ' | cut -f2- -d: | sed 's/ scheduled_at_time://' | sed 's/T/-/' | sed 's/ "//' | sed 's/" "/ /' | sed 's/+00:00"//' | sed 's/+00:00//' | sed 's/T/-/')` ### UNUSED 
#export SCHEDCREAT=`echo $gre2\CREATED TIME:$whi $(eval $GETLEADERSLOG 2>/dev/null | grep created_at_time | sed 's/- //' | tr -s '\n' ' ' | cut -f2- -d: | sed 's/ created_at_time://' | sed 's/T/-/' | sed 's/ "//' | sed 's/" "/ /' | sed 's/+00:00//' | sed 's/+00:00"//')` ### UNUSED 
#export ENDSCHED=`echo $gre2\FINISHED TIME:$whi $(eval $GETLEADERSLOG 2>/dev/null | grep finished_at_time | sed 's/  //' | tr -s '\n' ' ' | cut -f2- -d: | sed #'s/finished_at_time//' | sed 's/T/-/' | sed 's/ "//' | sed 's/" "/ /' | sed 's/+00:00"//' | sed 's/+00:00//' | sed 's/T/-/')` ### UNUSED 
#export WAKEAT=`echo $gre2\WAKE TIME:$whi $(eval $GETLEADERSLOG 2>/dev/null | grep wake_at_time | sed 's/  //' | tr -s '\n' ' ' | cut -f2- -d: | sed 's/wake_at_time//' | sed 's/T/-/' | sed 's/ "//' | sed 's/" "/ /' | sed 's/+00:00"//' | sed 's/+00:00//' | sed 's/T/-/')` ### UNUSED 
#################################### ###


### HIDE CURSOR AND DISPLAY FIRST SCREEN ###
tput civis
tput clear

echo -e $top
echo -e $black$d2" $HEADMAIN"
echo -e $black$middle                                                                                                                                                                   
echo -e $black$d2" $HEADINFO1 $HEADINFO4"
echo -e $black$d2" $HALFDELIM2"
echo -e $black$d2" $JORVERSION $CPUUSAGE $BCHAINSIZE $MYPOOL"
echo -e $black$d2" $JCLIVERSION $MEMUSAGE $BLOCKSINDB $HEADINFO5$TAXPERCENT $PERCENT"
echo -e $black$d2" $CONNESTABLISHED $STKPOOLNUM"
echo -e $black$d2" $HALFDELIM $TOTALSTK"
echo -e $black$d2" $HALFDELIM2"
echo -e $black$d2" $HEADINFO2 $REWDSEPOCH $VALFORSTKERS $VALTAXED"
echo -e $black$d2" $HALFDELIM2"            
echo -e $black$d2" $NODSTATUS $NODUPTIME $BCHAINTIME $STKPOOLACCREW"    
echo -e $black$d2" $BLKRECVNUM $LSTBLTXC $LSTBLTRX"                        
echo -e $black$d2" $LSTBLKHT $LSTBLSUM"              
echo -e $black$d2" $LSTBLKFS"                                                                              
echo -e $black$d2" $LSTBLKHASH $SLTLEADHEAD"                                         
echo -e $black$d2" $LSTBLTIM"                                              
echo -e $black$d2" $PEERAVACNT $PEERQUACNT $ENCLEAD $LEADSTAT"                                             
echo -e $black$d2" $PEERUNRCNT $LEADSCHED"
echo -e $black$d2" $HALFDELIM2"
echo -e $black$d2" $HEADINFO3"              
echo -e $black$d2" $HALFDELIM2"
echo -e $black$d2" $CONSVER $CURSLSTR"
echo -e $black$d2" $BLK0HASH"
echo -e $black$d2" $HALFDELIM2"
echo -e $black$d2" $BLK0TIM $BLKMAXSIZE"         
echo -e $black$d2" $SLTPEPC $SLTDURA $EPCSTBDPTH"
echo -e $black$d2" $HALFDELIM2"
echo -e $black$d2" $HALFDELIM2"
echo -e $black$d2" $HALFDELIM2 $HEADINFO6"
echo -e $black$d2" $HALFDELIM2"
echo -e $black$d2" $HALFDELIM2"
echo -e $black$d2" $HALFDELIM2"
echo -e $black$d2" $HALFDELIM2"                                                                                                                                                                                                                                                                                                                                                                                                                  
echo -e $black$d2"                                                                                    $gre2|                                                                    $QEXIT" "$black$d2"
echo -e $bottom

pressqexit

done

### IF JORMUGANDR IS NOT RUNNING, JLMO MONITOR WILL EXIT ###
elif [ -z "$JPID" ] ; then
echo
echo
echo -e $red\Jormungandr is not Running. $gre\JLMÓ Jormungandr Live Monitor will Exit. $s2
echo
echo
echo
echo
tput civis
sleep 3
tput cnorm
tput clear
exit
fi
