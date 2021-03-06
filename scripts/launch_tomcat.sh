#!/bin/bash -x

set -e

echo ">>>>>>>>>>>>>>>>>>>>>>>> whoami: >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> (start)"
whoami
id
echo ">>>>>>>>>>>>>>>>>>>>>>>> whoami: >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> (end)"

env | sort

echo "Inputs: $*"

function launch_tomcat() {
    ls -al $HOME
    if [ ! -s $HOME/data ]; then
        mkdir -p $HOME/data
    else
        sudo chown -R $USER:$USER $HOME/data
    fi
    echo "=============================================================="
    echo "=========== Setup APP: Tomcat: ==========="
    echo "=============================================================="
    #${CATALINA_HOME}/bin/catalina.sh start
    #sleep 5
    #${CATALINA_HOME}/bin/catalina.sh stop

    echo "=============================================================="
    echo "=========== Setup Tomcat Admin/User configuration: ==========="
    echo "=============================================================="
    env | grep -i PASS
    ${CATALINA_HOME}/create_tomcat_admin_user.sh ${TOMCAT_PASSWORD}

    echo "=================================================="
    echo "=========== Setup HTTPS configuration: ==========="
    echo "=================================================="
    # - To enable HTTPS or not: 1=true / 0=false -
    # TOMCAT_HTTPS_ENABLED=1
    if [ ${TOMCAT_HTTPS_ENABLED} -gt 0 ]; then
        echo ">>>> Tomcat: Enable HTTPS per configuration from environment variable TOMCAT_HTTPS_ENABLED=$TOMCAT_HTTPS_ENABLED"
        ${CATALINA_HOME}/setup-https-tomcat.sh ${HOME}
    else
        echo ">>>> Tomcat: Disabled HTTPS per configuration from environment variable TOMCAT_HTTPS_ENABLED=$TOMCAT_HTTPS_ENABLED"
    fi

    #### **** Start processing command **** ####

    #### 0.) Setup needed stuffs, e.g., init db etc. ....
    #### (do something here for preparation if any)
        

    #### 1.) Use cap_net_bind_service to allow Non-root user to access lower 1000 ports
    exec ${CATALINA_HOME}/bin/catalina.sh run "$@"
}

launch_tomcat


#tail -f /dev/null
