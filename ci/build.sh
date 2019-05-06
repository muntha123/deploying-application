#!/usr/bin/env bash

set -x

target="cf api $API_ENDPOINT --skip-ssl-validation"
#echo $target
eval $target

echo "Login....."
login="cf auth $USERNAME $PASSWORD"
#echo $login
eval $login

echo "Target Org and Space"
org_space="cf target -o $ORG -s $SPACE"
eval $org_space

cd deploying-application/

cf push springmusic -p ./spring-music.war -i 1




#curl -u "${artifactory_userid}":"${artifactory_pass}" -X PUT  "${artifactory_path}"jar/ -T ../build_folder/Conversion-Service-$project_version.jar -k
