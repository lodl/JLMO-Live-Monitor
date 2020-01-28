# JLMÖ Live Monitor for Jormungandr (for Linux)

Prior to launch the script, please open it and set variables in following lines:

### BLOCKCHAIN DIR and DB ###
LINE 10: export BCHAINDIR="$HOME/<YOUR-PATH>"
LINE 11: export BCHAINDB="$HOME/<YOUR-PATH>/blocks.sqlite"

### REST API STRING ###
LINE 14: export RESTPORT=<YOUR-REST-PORT>
LINE 15: export HOST="--host http://127.0.0.1:$RESTPORT/api"
LINE 16: export FORMAT="--output-format yaml"

### STAKEPOOL OWNER ACCOUNTS ###
LINE 19: export STKPOOLOWNACC=<YOUR-STAKEPOOL-OWNER-ACCOUNT>

### STAKE POOL ID ###
LINE 22: export STKPOOLID=<YOUR-STAKEPOOL-ID>
  
If you encounter issues, please report them here and not in Stakepool Group.

Thanks.
