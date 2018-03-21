TITLE MASM Template(main.asm)
INCLUDE Irvine32.inc
.data
Q BYTE "Enter n : ",0;
Ans1 BYTE "? ",0;
Ans2 BYTE " ????: ",0;
input DWORD 0;
number DWORD 2;
count DWORD 0;
return_num DWORD 0;


.code

IsPrime PROC
   LOCAL i:DWORD,flag:DWORD
   mov flag,0
   mov return_num,1
   mov i,2
   
   L1:
      mov eax,number
	  cmp i,eax
	  jae R
	  mov eax,number
	  mov ebx,i
	  cdq
	  idiv ebx
	  cmp edx,0
	  jne L11
	  jmp R0
      
	  L11:
	     inc i
		 jmp L1
	  
	  R:
	     ret

	  R0:
	     mov return_num,0
		 ret


IsPrime ENDP

Prime PROC
   L1:
     mov eax,count
     cmp eax,input
     jae R1
     Call IsPrime
     cmp return_num,0
     je L11
	 ;jne L12
	 inc count

	 L11:
	   inc number
	   jmp L1
	 L12:
	   jmp L1

     R1:
       dec number
	   ret

Prime ENDP

main PROC
   mov edx,OFFSET Q
   Call writeString
   Call Crlf
   Call ReadInt
   mov input,eax
   Call Prime
   mov edx,OFFSET Ans1
   Call writeString
   mov eax,input
   Call WriteDec
   mov edx,OFFSET Ans2
   Call writeString
   mov eax,number
   Call WriteDec
   Call Crlf
exit
main ENDP
END main