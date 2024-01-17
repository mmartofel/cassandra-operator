# Delete beforehand
oc delete CassandraDatacenter cassandra-dc1
sleep 10
oc delete sa cass-sa
oc delete secret cluster1-superuser


# Create service account for Cassandra server 
oc create sa cass-sa

# Grant anuuid (server runs under 999 uid which is forbiden)
oc adm policy add-scc-to-user anyuid -z cass-sa

# Create superuser secret to fix creds to cluster1-superuser/cassandra for your credentials
# oc apply -f cluster1-superuser-secret.yaml

# Create Cassandra cluster according to your yaml
oc apply -f cassandradatacenter-cassandra-dc1.yaml

