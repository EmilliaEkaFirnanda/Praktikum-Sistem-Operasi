
echo "Masukkan Detik"
read detik

let jam=$detik/3600
let detik=$detik-$(expr 3600*$jam)
let menit=$detik/60
let detik=$detik-$(expr 60*menit)

if [ $jam != 0 ]
then
hasiljam="$jam jam"
else
hasiljam=" "
fi

if [ $menit != 0 ]
then
hasilmenit="$menit menit"
else
hasilmenit=" "
fi

if [ $detik != 0 ]
then
hasildetik="$detik detik"
else
hasildetik=" "
fi

echo "$hasiljam $hasilmenit $hasildetik"
