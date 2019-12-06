declare -a matriks_1  
declare -a matriks_2    

while :; do  
clear 
echo "Program Perkalian Matriks"  
echo "1. Masukkan nilai" 
echo "2. Lihat nilai matriks"  
echo "3. Hasil Perkalian matriks" 
echo "4. Keluar program" 
read pilih 

if [ $pilih == 1 ]  
then     
    clear     
    echo "Masukkan nilai pada matriks pertama :"     
    for ((i=0; i<=3; i++)) do   
                 echo "Nilai ke "$(( $i + 1))    
                 read nilai    
                 matriks_1[$i]=$nilai     
    done      
    echo ""     
    echo "Masukkan nilai pada matriks kedua :"     
    for ((i=0; i<=3; i++)) do    
                 echo "Nilai ke "$(( $i + 1))    
                 read nilai    
                 matriks_2[$i]=$nilai     
                 done  
fi 
 
if [ $pilih == 2 ]  
then     
     clear    
      echo "Tampilan matriks pertama"     
      for ((i=0; i<4; i++)) do    
                  echo -n "${matriks_1[$i]} "     
                  if [ $i == 1 ]   
                  then    echo ""    
                  fi     
       done     
      echo ""     
      echo ""     
      echo "Tampilan matrik kedua"    
      for ((i=0; i<4; i++)) do    
                  echo -n "${matriks_2[$i]} "      
                  if [ $i == 1 ]    
                  then    
                  echo ""   
                  fi     
       done     
       read  
fi 

if [ $pilih == 3 ]     
       then     
       clear     
       declare -a matriks_3       
       for ((i=0; i<2; i++)) do 
                for ((j=0; j<2; j++)) do    
                               let matriks_3[$i]+=matriks_1[$j]*matriks_2[$i+$j*2]   
               done     
       done     
       for ((i=0; i<2; i++)) do    
                 for ((j=0; j<2; j++)) do    
                               let matriks_3[$i+2]+=matriks_1[$j+2]*matriks_2[$i+$j*2]    
                done       
       done     
       echo "Hasil perkalian"     
       for ((i=0; i<4; i++)) do    
                echo -n "${matriks_3[$i]} "      
                if [ $i == 1 ]    
                then    
                echo ""    
                fi     
     done     
     unset matriks_3     
     read  
fi  

if [ $pilih == 4 ]  
then     
       exit  
fi 
 done 
