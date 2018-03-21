TITLE MASM Template(main.asm)
INCLUDE Irvine32.inc

.data

Msg1 BYTE "A/B  C/D Please enter A,B,C,D ",0;
Msg2 BYTE "/",0;
Space BYTE "  ",0;
Negative2 BYTE "-",0;
Dot BYTE ".",0;
Aq BYTE "A : ",0;
Bq BYTE "B : ",0;
Cq BYTE "C : ",0;
Dques BYTE "D : ",0;
inputA SDWORD 0
inputB SDWORD 0
inputC SDWORD 0
inputD SDWORD 0
Mom SDWORD 0
Son SDWORD 0
Num SDWORD 0
negative SDWORD 0

.code
;-----------------------------------------------------------------
Addnumber PROC

mov eax,inputB
mov ebx,inputD
imul eax,ebx
mov Mom,eax

mov eax,inputA
mov ebx,inputD
imul eax,ebx
mov ecx,eax

mov eax,inputB
mov ebx,inputC
imul eax,ebx
mov edx,eax

adc ecx,edx
mov Son,ecx

mov eax,Son
Call writeInt
mov edx,OFFSET Msg2
Call writeString
mov eax,Mom
Call writeInt
mov edx,OFFSET Space
Call writeString

mov negative,0
cmp Mom,0
jge L1
neg Mom
neg Son
L1: 
   cmp Son,0
   jge L2
   neg Son
   inc negative 
L2:
   mov eax,Son
   mov ebx,Mom

L3:
   cmp eax,0
   je L4
   cmp eax,ebx
   jge L5
   mov edx,eax
   mov eax,ebx
   mov ebx,edx
L5:   
   cdq
   div ebx
   mov eax,edx
   jmp L3
   
L4:
   mov Num,ebx
   
   mov eax,Son
   cdq
   idiv Num
   mov Son,eax
   mov eax,Mom
   cdq
   div Num
   mov Mom,eax

   cmp negative,1
   jne L6
   neg Son

L6:
   mov eax,Son
   Call writeInt
   mov edx,OFFSET Msg2
   Call writeString
   mov eax,Mom
   Call writeInt
   mov edx,OFFSET Space
   Call writeString

   mov eax,Son
   mov ebx,Mom

   cmp Son,0
   jl L7
   cdq
   div ebx
   mov ecx,eax
   Call writeDec
   mov edx,OFFSET Dot
   Call writeString
   mov eax,Son
   imul eax,10
   cdq
   div ebx
   imul ecx,10
   sub eax,ecx
   Call writeDec
   ret
L7:
   mov edx,OFFSET negative2 
   Call writeString
   neg eax
   cdq 
   div ebx
   mov ecx,eax
   Call writeDec
   mov edx,OFFSET Dot
   Call writeString
   mov eax,Son
   neg eax
   imul eax,10
   cdq
   div ebx
   imul ecx,10
   sub eax,ecx
   Call writeDec
   ret

Addnumber ENDP
;-----------------------------------------------------------------
Subnumber PROC

mov eax,inputB
mov ebx,inputD
imul eax,ebx
mov Mom,eax

mov eax,inputA
mov ebx,inputD
imul eax,ebx
mov ecx,eax

mov eax,inputB
mov ebx,inputC
imul eax,ebx
mov edx,eax

sbb ecx,edx
mov Son,ecx

mov eax,Son
Call writeInt
mov edx,OFFSET Msg2
Call writeString
mov eax,Mom
Call writeInt
mov edx,OFFSET Space
Call writeString

mov negative,0
cmp Mom,0
jge L1
neg Mom
neg Son
L1: 
   cmp Son,0
   jge L2
   neg Son
   inc negative 
L2:
   mov eax,Son
   mov ebx,Mom

L3:
   cmp eax,0
   je L4
   cmp eax,ebx
   jge L5
   mov edx,eax
   mov eax,ebx
   mov ebx,edx
L5:   
   cdq
   div ebx
   mov eax,edx
   jmp L3
   
L4:
   mov Num,ebx
   
   mov eax,Son
   cdq
   idiv Num
   mov Son,eax
   mov eax,Mom
   cdq
   div Num
   mov Mom,eax

   cmp negative,1
   jne L6
   neg Son

L6:
   mov eax,Son
   Call writeInt
   mov edx,OFFSET Msg2
   Call writeString
   mov eax,Mom
   Call writeInt
   mov edx,OFFSET Space
   Call writeString

   mov eax,Son
   mov ebx,Mom

   cmp Son,0
   jl L7
   cdq
   div ebx
   mov ecx,eax
   Call writeDec
   mov edx,OFFSET Dot
   Call writeString
   mov eax,Son
   imul eax,10
   cdq
   div ebx
   imul ecx,10
   sub eax,ecx
   Call writeDec
   ret
L7:
   mov edx,OFFSET negative2 
   Call writeString
   neg eax
   cdq 
   div ebx
   mov ecx,eax
   Call writeDec
   mov edx,OFFSET Dot
   Call writeString
   mov eax,Son
   neg eax
   imul eax,10
   cdq
   div ebx
   imul ecx,10
   sub eax,ecx
   Call writeDec
   ret

Subnumber ENDP
;-----------------------------------------------------------------
Mulnumber PROC

mov eax,inputA
mov ebx,inputC
imul eax,ebx
mov Son,eax

mov eax,inputB
mov ebx,inputD
imul eax,ebx
mov Mom,eax

mov eax,Son
Call writeInt
mov edx,OFFSET Msg2
Call writeString
mov eax,Mom
Call writeInt
mov edx,OFFSET Space
Call writeString

mov negative,0
cmp Mom,0
jge L1
neg Mom
neg Son
L1: 
   cmp Son,0
   jge L2
   neg Son
   inc negative 
L2:
   mov eax,Son
   mov ebx,Mom

L3:
   cmp eax,0
   je L4
   cmp eax,ebx
   jge L5
   mov edx,eax
   mov eax,ebx
   mov ebx,edx
L5:   
   cdq
   div ebx
   mov eax,edx
   jmp L3
   
L4:
   mov Num,ebx
   
   mov eax,Son
   cdq
   idiv Num
   mov Son,eax
   mov eax,Mom
   cdq
   div Num
   mov Mom,eax

   cmp negative,1
   jne L6
   neg Son

L6:
   cmp Son,0
   je K1
   mov eax,Son
   Call writeInt
   mov edx,OFFSET Msg2
   Call writeString
   mov eax,Mom
   Call writeInt
   mov edx,OFFSET Space
   Call writeString

K1: 
   mov eax,Son
   mov eax,0
   Call writeInt
   mov edx,OFFSET Msg2
   Call writeString
   mov eax,Mom
   mov eax,0
   Call writeInt
   mov edx,OFFSET Space
   Call writeString
K2:
   mov eax,Son
   mov ebx,Mom

   cmp Son,0
   jl L7
   cdq
   div ebx
   mov ecx,eax
   Call writeDec
   mov edx,OFFSET Dot
   Call writeString
   mov eax,Son
   imul eax,10
   cdq
   div ebx
   imul ecx,10
   sub eax,ecx
   Call writeDec
   ret
L7:
   mov edx,OFFSET negative2 
   Call writeString
   neg eax
   cdq 
   div ebx
   mov ecx,eax
   Call writeDec
   mov edx,OFFSET Dot
   Call writeString
   mov eax,Son
   neg eax
   imul eax,10
   cdq
   div ebx
   imul ecx,10
   sub eax,ecx
   Call writeDec
   ret

Mulnumber ENDP
;-----------------------------------------------------------------
Divnumber PROC

mov eax,inputA
mov ebx,inputD
imul eax,ebx
mov Son,eax

mov eax,inputB
mov ebx,inputC
imul eax,ebx
mov Mom,eax

mov eax,Son
Call writeInt
mov edx,OFFSET Msg2
Call writeString
mov eax,Mom
Call writeInt
mov edx,OFFSET Space
Call writeString

mov negative,0
cmp Mom,0
jge L1
neg Mom
neg Son
L1: 
   cmp Son,0
   jge L2
   neg Son
   inc negative 
L2:
   mov eax,Son
   mov ebx,Mom

L3:
   cmp eax,0
   je L4
   cmp eax,ebx
   jge L5
   mov edx,eax
   mov eax,ebx
   mov ebx,edx
L5:   
   cdq
   div ebx
   mov eax,edx
   jmp L3
   
L4:
   mov Num,ebx
   
   mov eax,Son
   cdq
   idiv Num
   mov Son,eax
   mov eax,Mom
   cdq
   div Num
   mov Mom,eax

   cmp negative,1
   jne L6
   neg Son

L6:
   cmp Son,0
   je K1
   mov eax,Son
   Call writeInt
   mov edx,OFFSET Msg2
   Call writeString
   mov eax,Mom
   Call writeInt
   mov edx,OFFSET Space
   Call writeString

K1: 
   mov eax,Son
   mov eax,0
   Call writeInt
   mov edx,OFFSET Msg2
   Call writeString
   mov eax,Mom
   mov eax,0
   Call writeInt
   mov edx,OFFSET Space
   Call writeString
K2:
   mov eax,Son
   mov ebx,Mom

   cmp Son,0
   jl L7
   cdq
   div ebx
   mov ecx,eax
   Call writeDec
   mov edx,OFFSET Dot
   Call writeString
   mov eax,Son
   imul eax,10
   cdq
   div ebx
   imul ecx,10
   sub eax,ecx
   Call writeDec
   ret
L7:
   mov edx,OFFSET negative2 
   Call writeString
   neg eax
   cdq 
   div ebx
   mov ecx,eax
   Call writeDec
   mov edx,OFFSET Dot
   Call writeString
   mov eax,Son
   neg eax
   imul eax,10
   cdq
   div ebx
   imul ecx,10
   sub eax,ecx
   Call writeDec
   ret

Divnumber ENDP
;-----------------------------------------------------------------
main PROC

mov edx,OFFSET Msg1
Call writeString
Call Crlf
mov edx,OFFSET Aq
Call writeString
Call ReadInt
mov inputA,eax
mov edx,OFFSET Bq
Call writeString
Call ReadInt
mov inputB,eax
mov edx,OFFSET Cq
Call writeString
Call ReadInt
mov inputC,eax
mov edx,OFFSET Dques
Call writeString
Call ReadInt
mov inputD,eax
Call Crlf

Call Addnumber
Call Crlf
Call Subnumber
Call Crlf
Call Mulnumber
Call Crlf
Call Divnumber
Call Crlf
Call Crlf
exit
main ENDP
END main