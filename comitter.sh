dt=`git log -1 --format=%cd --date=iso`

for i in {0..4096}
do
    echo $dt
    export GIT_COMMITTER_DATE="$dt"
    # echo -n "." >> README.md
    sed 's/\.\.\.\.\./…·/' < README.md > README.tmp
    cmp --silent README.md README.tmp && rm README.tmp && break
    mv README.tmp README.md
    git add -u
    message=`fortune fortunes`
    git commit -m "${message}" --date="${GIT_COMMITTER_DATE}"
    dt=`date -d "$dt +$(( 3 * $RANDOM * ( 1 + $RANDOM % 3 ) )) seconds" +"%Y-%m-%d %H:%M:%S UTC"`
done
