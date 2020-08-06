echo "
 #####                                                              #######           #     #    #     #####  
#     #  ####  #    # #    # ######  ####  ##### # #    #  ####        #     ####     ##    #   # #   #     # 
#       #    # ##   # ##   # #      #    #   #   # ##   # #    #       #    #    #    # #   #  #   #  #       
#       #    # # #  # # #  # #####  #        #   # # #  # #            #    #    #    #  #  # #     #  #####  
#       #    # #  # # #  # # #      #        #   # #  # # #  ###       #    #    #    #   # # #######       # 
#     # #    # #   ## #   ## #      #    #   #   # #   ## #    #       #    #    #    #    ## #     # #     # 
 #####   ####  #    # #    # ######  ####    #   # #    #  ####        #     ####     #     # #     #  ##### 




 "
USER=$(whoami) #by default uses the current local user.
PASSWORD="[insert password here]"

SERVER="[insert ip here]"
MOUNTLOC="/home/$(whoami)/NAS"

sudo mount -t cifs -o username=$USER,password=$PASSWORD,uid=$(id -u),gid=$(id -g) $SERVER $MOUNTLOC
