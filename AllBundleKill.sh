#oozie jobs -oozie http://testing.by.id:11000/oozie -jobtype Bundle | grep RUNN | awk -F" " '{print $1}' > listKillOozie.dat
oozie jobs -oozie http://testing02.by.id:11000/oozie -filter "status=RUNNING" -jobtype Bundle | grep RUNN | awk -F" " '{print $1}' > listKillOozie.dat
for xx in `cat listKillOozie.dat`; do
#for xx in `cat listKillOozieError.dat`; do
        oozie job -oozie http://testing02.by.id:11000/oozie -kill $xx
done
echo "Kill all bundle is done..."
