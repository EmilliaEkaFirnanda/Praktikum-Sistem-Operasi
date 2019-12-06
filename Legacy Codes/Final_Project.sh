declare -a nomor
declare -a nama
declare -a jumlah
declare -a waktu
declare -a pukul

i=0
n=0

folder(){
    echo "Buatlah folder"
    echo "Masukkan nama folder yang ingin dibuat : "
    read folder
    mkdir $folder
    echo "Folder anda telah berhasil dibuat"
    ls -l
}

manipulasi(){
    echo "Program ini namanya fp.sh"
    echo "Ketikkan nama program yang ingin kamu ubah"
    read ubah

    echo "---penjelasan---"
    echo "*hak akses untuk owner, group, dan other"
    echo "*r = 4 (read-mengizinkan membaca berkas)"
    echo "*w = 2 (write-mengizinkan mengedit berkas)"
    echo "*x = 1 (excutable-mengizinkan mengeksekusi berkas binary)"
    echo "masukkan angkanya : "
    read angka

    echo -e "\nOke anda memilih $ubah"
    sudo chmod $angka $ubah
    echo -e "\nManipulasi berkas sudah selesai"
    ls -l
    read
}

insert(){
    flag=0
    echo -n "Nomor Meja     : "
    read nomor_temp
    echo -n "Atas Nama      : "
    read nama_temp
    echo -n "Jumlah Orang   : "
    read jumlah_temp
    echo -n "Hari/Tanggal   : "
    read waktu_temp
    echo -n "Pukul          : "
    read pukul_temp

    for nomor_cari in ${nomor[*]}
    do
        if [[ $nomor_cari == $nomor_temp ]]
        then
            flag=1
            break
        fi
    done
    
    if [[ $flag == 1 ]]
    then
        echo "Nomor sudah digunakan"
    else
        nomor[$i]=$nomor_temp
        nama[$i]=$nama_temp
        jumlah[$i]=$jumlah_temp
        waktu[$i]=$waktu_temp
        pukul[$i]=$pukul_temp
        i=$i+1
        n=$n+1
    fi
}

view(){
    if(( $n==0 ))
    then
        echo "Data masih kosong"
    fi

    for((i=0;i<n;i++))
    do
        echo "=================================================="
        echo "Nomor Meja        : ${nomor[$i]}"
        echo "Atas Nama         : ${nama[$i]}"
        echo "Jumlah Orang      : ${jumlah[$i]}"
        echo "Hari/Tanggal      : ${waktu[$i]}"
        echo "Pukul             : ${pukul[$i]}"
        echo "=================================================="
    done
}

search(){
    echo -n "Masukkan data tamu yang ingin dicari (Nomor Meja) : "
    read cari
    a=0

    for((i=0;i<n;i++))
    do
        if(( $cari == ${nomor[$i]} ))
        then 
            a=1
            break
        fi
    done
    
    if(( $a == 1 ))
    then
        echo "Data ditemukan, meja sudah direservasi"
        echo ""
        echo "=================================================="
        echo "Nomor Meja        : ${nomor[$i]}"
        echo "Atas Nama         : ${nama[$i]}"
        echo "Jumlah Orang      : ${jumlah[$i]}"
        echo "Hari/Tanggal      : ${waktu[$i]}"
        echo "Pukul             : ${pukul[$i]}"
        echo "=================================================="
    else
        echo "Data tidak ditemukan, meja belum direservasi"
    fi
}

update(){
    echo -n "Masukkan data tamu yang ingin diupdate (Nomor Meja) : "
    read update
    b=0

    for((i=0;i<n;i++))
    do
        if(( $update == ${nomor[$i]} ))
        then 
            b=1
            break
        fi
    done

    if(( $b == 1 ))
    then
        u=0
        echo -n "Nomor Meja     : "
        read nomor_temp
        echo -n "Atas Nama      : "
        read nama_temp
        echo -n "Jumlah Orang   : "
        read jumlah_temp
        echo -n "Hari/Tanggal   : "
        read waktu_temp
        echo -n "Pukul          : "
        read pukul_temp
           
        for nomor_cari in ${nomor[*]}
        do
            if [[ $nomor_cari == $nomor_temp ]]
            then
                u=1
                break
            fi
        done
    
        if [[ $u == 1 ]]
        then
            echo "Nomor sudah digunakan"
        else
            nomor[$i]=$nomor_temp
            nama[$i]=$nama_temp
            jumlah[$i]=$jumlah_temp
            waktu[$i]=$waktu_temp
            pukul[$i]=$pukul_temp
        fi
    else
        echo "Data tamu belum terdaftar"
    fi
}

delete(){
    echo -n "Masukkan data tamu yang ingin dihapus (Nomor Meja) : "
    read hapus
    c=0

    for((i=0;i<n;i++))
    do 
        if(( $hapus == ${nomor[$i]} ))
        then
            c=1
            break
        fi
    done

    if(( $c == 1 ))
    then
        unset nomor[$i] 
        unset nama[$i]
        unset jumlah[$i] 
        unset waktu[$i]
        unset pukul[$i]
        echo "Data tamu telah dihapus"

        nomor=( "${nomor[@]}" )
        nama=( "${nama[@]}" )
        jumlah=( "${jumlah[@]}" )
        waktu=( "${waktu[@]}" )
        pukul=( "${pukul[@]}" )
        n=$n-1
    else
        echo "Data tamu tidak terdaftar"
    fi
}

while :;
do
    echo "==========================================================="
    echo "                  WELCOME TO MY RESTAURANT                 "
    echo "                   SISTEM RESERVASI MEJA                   "
    echo "==========================================================="
    echo ""
    echo " 1. Insert Tamu"
    echo " 2. View Tamu"
    echo " 3. Search Tamu"
    echo " 4. Update Tamu"
    echo " 5. Delete Tamu"
    echo " 6. Manipulasi Hak Akses Berkas"
    echo " 7. Buat folder"
    echo " 8. Exit"
    echo ""
    echo -n "Pilih menu : "
    read pilih

    if(( $pilih == 1 ))
    then
        clear
        insert
        clear
    elif(( $pilih == 2 ))
    then
        clear
        view
    elif(( $pilih == 3 ))
    then 
        clear
        search
    elif(( $pilih == 4 ))
    then
        clear
        update
        clear
    elif(( $pilih == 5 ))
    then 
        clear
        delete
    elif(( $pilih == 6 ))
    then
        clear
        manipulasi
        read
    elif(( $pilih == 7 ))
    then 
        clear
        folder
    elif(( $pilih == 8 ))
    then
        exit
    else
        echo "pilihannya gaada!"
    fi
done
