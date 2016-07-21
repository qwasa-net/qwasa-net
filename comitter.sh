dt="2010-01-01 01:01:01 UTC"

for i in {0..4096}
do
    echo $dt
    export GIT_COMMITTER_DATE="$dt"
    echo -n "." >> README.md
    git add README.md
    message=`fortune fortunes`
    git commit -m "${message}" --date="${GIT_COMMITTER_DATE}"
    dt=`date -d "$dt +$(( 3 * $RANDOM * ( 1 + $RANDOM % 3 ) )) seconds" +"%Y-%m-%d %H:%M:%S UTC"`
done
