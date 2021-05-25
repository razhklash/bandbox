#
# a simple proof of concept to demonstrate how to interact with the server.

# make a new record
curl -i localhost:5000/create_record/some_pid

# delete the record
curl -i localhost:5000/delete_record/some_pid

# make a couple of records
curl -i localhost:5000/create_record/some_pid
echo
curl -i localhost:5000/create_record/some_other_pid

# list the records
curl -i localhost:5000/list_records
echo

# delete one record, then cause an error trying to delete it again
curl -i localhost:5000/delete_record/some_pid
echo
curl -i localhost:5000/delete_record/some_pid
