org 0x0100

mov dx, hello
mov ah, 0x9
int 0x21
ret
hello: db 'Bonjour papi.', 10, 13, '$'