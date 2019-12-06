While :; do 
Dd if=out.fifo bs=1b count=1 2 >/dev/null |grep $1 
If [ $? –eq 0]; then 
“$2” > in.fifo 
Exit 0 
Fi 
done 
