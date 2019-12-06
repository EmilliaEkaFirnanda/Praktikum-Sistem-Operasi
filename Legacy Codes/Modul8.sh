
declare -a nama
declare -a npm
declare -a jurusan
declare -a fakultas
i=0

input(){
    flag=0
        echo -n "Masukkan NPM : "
        read npm_temp
        echo -n "Masukkan Nama : "
        read nama_temp
        echo -n "Masukkan Jurusan : "
        read jurusan_temp
        echo -n "Masukkan Fakultas : "
        read fakultas_temp

        for npm_cari in ${npm[*]}
        do
            if [[ $npm_cari == $npm_temp ]]
            then
                flag=1
                break
            fi
        done
        if [[ $flag == 1 ]]
        then
            echo "NPM sudah digunakan"
        else
            npm[$i]=$npm_temp
            nama[$i]=$nama_temp
            jurusan[$i]=$jurusan_temp
            fakultas[$i]=$fakultas_temp
            i=$i+1
            n=$n+1
        fi
}

view(){
    if(( $n == 0 ))
        then
            echo "Data Masih Kosong"
        fi
      for(( i=0;i<n;i++ ))
      do
            echo -e "\n=== Data Mahasiswa ke-$[i+1] ==="
            echo -e "NPM = ${npm[$i]}"
            echo -e "Nama = ${nama[$i]}"
            echo -e "Jurusan = ${jurusan[$i]}"
            echo -e "Fakultas = ${fakultas[$i]}"
       done
}

update(){
    echo -n "Masukkan data yang ingin di-update (Masukkan NPM) : "
    read update
    u=0
        
    for((i=0;i<n;i++))
    do
        if(( $update == ${npm[$i]} ))
            then
                u=1
                break
            fi
        done

        if(( $u == 1 ))
        then
            flag=0
            echo -n "Masukkan NPM : "
            read npm_temp
            echo -n "Masukkan Nama : "
            read nama_temp
            echo -n "Masukkan Jurusan : "
            read jurusan_temp
            echo -n "Masukkan Fakultas : "
            read fakultas_temp

            for npm_cari in ${npm[*]}
            do
                if [[ $npm_cari == $npm_temp ]]
                then
                    flag=1
                    break
                fi
            done
            
        if [[ $flag == 1 ]]
        then
            echo "NPM sudah digunakan"
        else
            npm[$i]=$npm_temp
            nama[$i]=$nama_temp
            jurusan[$i]=$jurusan_temp
            fakultas[$i]=$fakultas_temp
        fi
        else
            echo "Data Tidak Ditemukan"
        fi    
}


while :; do
printf "\n=== Program Sistem Informasi Sederhana Mahasiswa ===\n"
echo "1. input data mahasiswa"
echo "2. view data mahasiswa"
echo "3. update data mahasiswa"
echo "4. exit"
echo -n "masukkan pilihan "
read pilih 

if (("$pilih" == 1)); # INPUT DATA
     then
        clear
            input
        clear
    
elif (("$pilih" == 2)); # VIEW DATA
     then
        clear
            view 

elif (("$pilih" == 3)); # UPDATE DATA
     then
        clear
            update
        clear
    
elif (("$pilih" != 2 && "$pilih" != 1 && "$pilih" != 3 && "$pilih" != 4)); # TIDAK KETEMU
     then
       echo "PILIHANNYA GAADA !!";
       read
       clear
    
else # EXIT
        exit
        fi
done


