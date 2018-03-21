TITLE MASM Template(main.asm)
INCLUDE Irvine32.inc
.data

sum DWORD 0;
square DWORD 0;
point1 DWORD 0;
answer DWORD 0;
Aword DWORD 0;
Bword DWORD 0;
Cword DWORD 0;
number1 BYTE "�п�JA���Ʀr :",0;
number2 BYTE "�п�JB���Ʀr :",0;
number3 BYTE "�п�JC���Ʀr :",0;
point BYTE ".",0;
Q BYTE "�@���G����{�� AX^2+BX+C=0 ",0;
An1 BYTE "���L���h�ո�",0;
An2 BYTE "�L��",0;
An3 BYTE "���@��",0;
An4 BYTE "�����",0;

.code
main PROC

mov eax,0;

mov edx,OFFSET Q  ;�L�X�D��
call WriteString
Call Crlf;
RA:
mov edx,OFFSET number1  ;�L�X�X�JA
call WriteString
call ReadInt;  ;�I�s�X�J
mov Aword,eax;
Call Crlf;
RB:
mov edx,OFFSET number2  ;�L�X�X�JB
call WriteString
call ReadInt;  ;�I�s�X�J
mov Bword,eax;
Call Crlf;
RC:
mov edx,OFFSET number3  ;�L�X�X�JC
call WriteString
call ReadInt;  ;�I�s�X�J
mov Cword,eax;
Call Crlf;

I1:  
mov esi,0;
mov eax,Aword;
cmp eax,0;
je I2 
jne I5

I2:
mov eax,Bword;
cmp eax,0
je I3
jne I4

I3:
mov eax,Cword;
cmp eax,0
je A1         ;eax == 0 ����A1
jne A2        ;eax != 0 ����A2

I4:
mov eax,Cword;
cmp eax,0
je A3         ;eax == 0 ����A3
jne A3        ;eax != 0 ����A3

I5:
mov eax,Aword;
mov ebx,Bword;
mov ecx,Cword;
imul ebx,ebx; ;ebx=B*B
mov sum,ebx;  ;sum=ebx
imul eax,4; ; ;eax=A*4
imul eax,ecx; ;eax = eax*C
sub sum,eax;  ;sum = B*B - 4*A*C
mov eax,sum;  ;eax = sum
cmp eax,0;    ;�P0���
jg A4         ;eax>0�� ����A4
je A5         ;eax=0�� ����A5
jl A6         ;eax<0�� ����A6

A1: ;�L���h�ո�
mov edx,OFFSET An1
call WriteString
Call Crlf;
exit

A2: ;�L��
mov edx,OFFSET An2
call WriteString
Call Crlf;
exit

A3: ;���@�ո�
mov edx,OFFSET An3
call WriteString
mov eax,Cword;      ;eax = C
neg eax;            ;eax = -C
mov ebx,Bword;      ;ebx = B
cdq                 ;�۰ʧ�l�Ʃ��edx
idiv ebx;           ;eax / ebx = -C/B
call Writeint;      ;�L�X������
mov eax,edx;
neg eax;
mov point1,eax;
mov eax,10;
mul point1;
cdq
div ebx;
mov edx,OFFSET point
call WriteString
call Writedec;
Call Crlf;
exit


A4: ;����ո�
mov edx,OFFSET An4  
call WriteString
mov ebx,0;          ;ebx = 0
A41:
mov answer,ebx;     ;answer = ebx
imul ebx,ebx;       ;B����
mov ecx,answer;     ;ecx = answer
add ecx,1;          ;ecx = ecx + 1
imul ecx,ecx;       ;ecx = ecx * ecx
cmp sum,ebx;        ;���sum ebx
mov ebx,answer;     ;ebx = answer
inc ebx;            ;ebx = ebx + 1
jge A42             ;B*B-4*A*C >= 0 ����A42
jl A41              ;          <  0 ����A41
A42:  ;B*B-4*A*C >= 0
cmp sum,ecx;        ;���sum ecx
jl A43              ;sum < ecx ����A43
jg A41              ;sum > ecx ����A41
A43:
mov eax,Bword;      ;eax = B
neg eax;            ;eax = -eax
add eax,answer;     ;eax = eax + answer
mov ebx,Aword;      ;ebx = A
imul ebx,2;         ;ebx = ebx * 2;
cdq                 ;�۰ʧ�l�Ʃ��edx
idiv ebx;           ;2*A/-B
call Writeint;
mov eax,edx;        ;eax = edx
cmp eax,0;
jl A431
jge A432
A431:
neg eax;
jmp A432
A432:
mov point1,eax;     ;�p��p���I
mov eax,10;
mul point1;
cdq
div ebx;
mov edx,OFFSET point ;�L�X"."
call WriteString
call Writedec;
A44:
mov eax,Bword;
neg eax;
sub eax,answer;
mov ebx,Aword;
imul ebx,2;
cdq
idiv ebx;
call Writeint;
mov eax,edx;
cmp eax,0;
jl A441
jge A442
A441:
neg eax;
jmp A442
A442:
mov point1,eax;
mov eax,10;
mul point1;
cdq
div ebx;
mov edx,OFFSET point
call WriteString
call Writedec;
Call Crlf;
exit

A6:
jmp A7

A5:
mov edx,OFFSET An4
call WriteString
mov eax,Bword;
neg eax;
mov ebx,Aword;
imul ebx,2;
cdq
idiv ebx;
call writeint;
mov eax,edx;
mov point1,eax;
mov eax,10;
mul point1;
cdq
div ebx;
mov edx,OFFSET point
call WriteString
call Writedec;
Call Crlf;
exit

A7:
mov edx,OFFSET An4
call WriteString
mov eax,Aword;
mov ebx,Bword;
mov ecx,Cword;
imul eax,4;
imul eax,ecx;
imul ebx,ebx;
sub eax,ebx;
mov sum,eax;
mov ebx,0;
A71:
mov answer,ebx;
imul ebx,ebx;
mov ecx,answer;
add ecx,1;
imul ecx,ecx;
cmp sum,ebx;
mov ebx,answer;
inc ebx;
jge A72
jl A71
A72:
cmp sum,ecx;
jl A73
jg A71
A73:
mov eax,Bword;
neg eax;
add eax,answer;
mov ebx,Aword;
imul ebx,2;
cdq
idiv ebx;
call Writeint;
mov eax,edx;
cmp eax,0;
jl A731
jge A732
A731:
neg eax;
jmp A732
A732:
mov point1,eax;
mov eax,10;
mul point1;
cdq
div ebx;
mov edx,OFFSET point
call writestring
call writedec
A74:
mov eax,Bword;
neg eax;
sub eax,answer;
mov ebx,Aword;
imul ebx,2;
cdq
idiv ebx;
call Writeint;
mov eax,edx;
cmp eax,0;
jl A441
jge A442
A741:
neg eax;
jmp A442
A742:
mov point1,eax;
mov eax,10;
mul point1;
cdq
div ebx;
mov edx,OFFSET point
call WriteString
call Writedec;
Call Crlf;
exit

main ENDP
END main