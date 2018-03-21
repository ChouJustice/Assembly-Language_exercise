TITLE MASM Template(main.asm)
INCLUDE Irvine32.inc
.data
arrayA DWORD 6 DUP(0) ;初始'0'
arrayB DWORD 6 DUP(0)
arrayC DWORD 6 DUP(0)
arrayD DWORD 6 DUP(0)
arrayE DWORD 6 DUP(0)
arrayF DWORD 6 DUP(0)
keyInputName BYTE "請輸入學號後八碼:",0
keyInputChinese BYTE "請輸入國文成績(0~100):",0
keyInputEnglish BYTE "請輸入英文成績(0~100):",0
keyInputMath    BYTE "請輸入數學成績(0~100):",0
output  BYTE " ",0
output1 BYTE "學號    國文 英文 數學 總分 名次:",0 

.code
main PROC
mov ecx,6
mov esi,0 

K1:
  mov eax,0
  mov edx,OFFSET keyInputName
  call WriteString
  call ReadInt
  mov [arrayA+esi],eax

K2:
  mov eax,0
  mov edx,OFFSET keyInputChinese
  call WriteString 
  call ReadInt
  cmp eax,0
  jb K2
  cmp eax,100
  ja K2
  mov [arrayB+esi],eax

K3:
  mov eax,0
  mov edx,OFFSET keyInputEnglish
  call WriteString 
  call ReadInt
  cmp eax,0
  jb K3
  cmp eax,100
  ja K3
  mov [arrayC+esi],eax

K4:
  mov eax,0
  mov edx,OFFSET keyInputMath
  call WriteString 
  call ReadInt
  cmp eax,0
  jb K4
  cmp eax,100
  ja K4
  mov [arrayD+esi],eax

K5:
  mov eax,0
  mov eax,[arrayB+esi]
  add eax,[arrayC+esi]
  add eax,[arrayD+esi]
  mov [arrayE+esi],eax

add esi,4
dec ecx 
cmp ecx,0
ja k1
mov ecx,0
mov ebx,0

mov ecx,5   ;排列
L2:
  push ecx
  mov esi,0
L3:
  mov eax,[arrayE+esi]
  mov ebx,[arrayE+esi+4]
  cmp ebx,eax
  jb L4
  mov [arrayE+esi],ebx
  mov [arrayE+esi+4],eax
  jmp Sort
Mid2:
  jmp L3
Mid3:
  jmp L2
Sort:
  mov eax,[arrayA+esi]
  mov ebx,[arrayA+esi+4]
  mov [arrayA+esi],ebx
  mov [arrayA+esi+4],eax
  mov eax,[arrayB+esi]
  mov ebx,[arrayB+esi+4]
  mov [arrayB+esi],ebx
  mov [arrayB+esi+4],eax
  mov eax,[arrayC+esi]
  mov ebx,[arrayC+esi+4]
  mov [arrayC+esi],ebx
  mov [arrayC+esi+4],eax
  mov eax,[arrayD+esi]
  mov ebx,[arrayD+esi+4]
  mov [arrayD+esi],ebx
  mov [arrayD+esi+4],eax
L4:
  add esi,4
  loop Mid2
  pop ecx
  loop Mid3

mov ecx, 5
mov esi, 0
mov edx, 2
mov [arrayF], 1
L5:                 ;排名
  push ecx
  mov eax, [arrayE+esi]
  mov ebx, [arrayE+esi+4]
  cmp eax ,ebx
  je L6
  mov [arrayF+esi+4], edx
  inc edx
  add esi, 4
  loop L5
L6:
  mov ecx, [arrayF+esi]
  mov [arrayF+esi+4],ecx
  inc edx
  add esi,4
  pop ecx
  loop L5     


mov edx,OFFSET output1   ;印出
call WriteString
call Crlf
mov ecx,6 
mov esi,0 
mov eax,0 

PrintOutput:
  mov eax,[arrayA+esi] 
  call WriteDec
  mov edx,OFFSET output
  call WriteString
  mov eax,[arrayB+esi] 
  call WriteDec
  mov edx,OFFSET output
  call WriteString
  mov eax,[arrayC+esi] 
  call WriteDec
  mov edx,OFFSET output
  call WriteString
  mov eax,[arrayD+esi]
  call WriteDec
  mov edx,OFFSET output
  call WriteString
  mov eax,[arrayE+esi] 
  call WriteDec
  mov edx,OFFSET output
  call WriteString
  mov eax,[arrayF+esi] 
  call WriteDec
  add esi, 4
  call Crlf 
  call WriteString
  dec ecx 
  cmp ecx,0
  ja PrintOutput

exit
main ENDP
END main
