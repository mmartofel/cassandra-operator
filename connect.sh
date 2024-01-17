
USERNAME=`oc get secret cluster1-superuser -o jsonpath="{.data.username}" -n mycassandra | base64 --decode`
PASSWORD=`oc get secret cluster1-superuser -o jsonpath="{.data.password}" -n mycassandra | base64 --decode ; echo`

# echo cqlsh -u $USERNAME -p $PASSWORD

echo ""
echo "#####################################################"
echo "## You are now connected to your Cassandra Cluster ##"
echo "#####################################################"
echo ""

oc exec -n mycassandra -i -t -c cassandra cluster1-cassandra-dc1-rack1-sts-0 -- /opt/cassandra/bin/cqlsh -u $USERNAME -p $PASSWORD

