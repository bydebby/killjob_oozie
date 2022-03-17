#oozie jobs -oozie http://masterbtkdi02.bpom.go.id:11000/oozie -jobtype Bundle | grep RUNN | awk -F" " '{print $1}' > listKillOozie.dat
oozie jobs -oozie http://masterbtkdi02.bpom.go.id:11000/oozie -filter "status=RUNNING" -jobtype Bundle | grep RUNN | awk -F" " '{print $1}' > listKillOozie.dat
for xx in `cat listKillOozie.dat`; do
#for xx in `cat listKillOozieError.dat`; do
        oozie job -oozie http://masterbtkdi02.bpom.go.id:11000/oozie -kill $xx
done
echo "Kill all bundle is done..."
