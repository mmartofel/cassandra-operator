# Delete beforehand
oc new-project mycassandra
oc delete CassandraDatacenter cassandra-dc1 -n mycassandra
sleep 10
oc delete sa cass-sa -n mycassandra
oc delete secret cluster1-superuser -n mycassandra


# Create service account for Cassandra server 
oc create sa cass-sa -n mycassandra

# Grant anuuid (server runs under 999 uid which is forbiden)
oc adm policy add-scc-to-user anyuid -z cass-sa -n mycassandra

# Create superuser secret to fix creds to cluster1-superuser/cassandra for your credentials
# oc apply -f cluster1-superuser-secret.yaml -n mycassandra

# Create Cassandra cluster according to your yaml
oc apply -f cassandradatacenter-cassandra-dc1.yaml -n mycassandra

