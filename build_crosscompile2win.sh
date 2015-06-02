#!/bin/bash

:'
	Build static library for win32 x86_64
'

CC=i686-w64-mingw32-g++
AR=i686-w64-mingw32-ar

for i in *.cpp; 
do 
	$CC -std=gnu++11 -static-libgcc -static-libstdc++ -O3 -c $i -Inspr-emu -Imozilla/extensions/universalchardet/src/base; 
 	echo $i;
done

for i in mozilla/extensions/universalchardet/src/base/*.cpp;
do
	$CC -std=gnu++11 -static-libgcc -static-libstdc++ -O3 -c $i -I. -Inspr-emu;
	echo $i;
done


$AR rcs charsetdetect32.lib *.o;
echo charsetdetect32.lib
$CC -shared -o charsetdetect32.dll *.o -static-libgcc -static-libstdc++;
echo charsetdetect32.dll

rm *.o;
echo "clear *.o"


:'
	Build static library for win32 x86_64
'

CC=x86_64-w64-mingw32-g++
AR=x86_64-w64-mingw32-ar

for i in *.cpp; 
do 
	$CC -std=gnu++11 -static-libgcc -static-libstdc++ -O3 -c $i -Inspr-emu -Imozilla/extensions/universalchardet/src/base; 
 	echo $i;
done

for i in mozilla/extensions/universalchardet/src/base/*.cpp;
do
	$CC -std=gnu++11 -static-libgcc -static-libstdc++ -O3 -c $i -I. -Inspr-emu;
	echo $i;
done


$AR rcs charsetdetect64.lib *.o;
echo charsetdetect64.lib
$CC -shared -o charsetdetect64.dll *.o -static-libgcc -static-libstdc++;
echo charsetdetect64.dll

rm *.o;
echo "clear *.o"


