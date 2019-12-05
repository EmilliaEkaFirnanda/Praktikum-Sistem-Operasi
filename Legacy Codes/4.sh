
select menu in “menu utama” “exit program”
do
     case $menu in
     “menu utama”)
     echo -n “masukkan input : “
     read input;
     for((angka=1;angka=$input;angka=angka+1))
     do 
     a=5
     b=2
                        if [[ $angka%$a -eq 0 ]]
                        then
                                        echo “Kode -” $angka “Khusus”
                       el if [[ $angka%$b -eq 0 ]]
                       then
                                        echo “Kode -” $angka “Genap”
                       else
                       then
                                        echo “Kode -” $angka “Ganjil”
                       fi
    done
    ;;
    “exit program”)
    break
    ;;
*) echo “tidak ada”
;;
esac
done


