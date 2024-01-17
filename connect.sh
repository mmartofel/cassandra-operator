
USERNAME=`oc get secret cluster1-superuser -o jsonpath="{.data.username}" -n mycassandra | base64 --decode`
PASSWORD=`oc get secret cluster1-superuser -o jsonpath="{.data.password}" -n mycassandra | base64 --decode ; echo`

echo cqlsh -u $USERNAME -p $PASSWORD

