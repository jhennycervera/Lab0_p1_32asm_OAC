global asmMedia32womin

section	.text

asmMedia32womin:
    ; Prólogo para calling conventions en 32 bits
    push ebp
    mov ebp, esp
    push esi
    push edi
    push ebx

    ; Limpiar los registros a utilizar
    xor eax,eax
    xor ebx,ebx
    xor ecx,ecx
    xor edx,edx

    ; Punteros iniciales (esto se inicializa en el archivo laboratorio0.c)
	mov edi,[ebp + 8]   ; edi <- *arr
    mov ecx,[ebp + 12]  ; ecx <- N

; -------------------------------------------- ;
; -------------------------------------------- ;
; ---------- Escriba aqui su código ---------- ;
; -------------------------------------------- ;
; -------------------------------------------- ;

    mov eax,[edi]   ; eax <- arr[0]
    mov ebx,ecx
    dec ecx 
    jz exit
    push edi   ; guarda la dm del arr[0]

suma:
    add edi,4 ;sgte entero del arreglo
    add eax,[edi]  ; suma el entero
    loop suma

    pop edi  ;recupero el arreglo
    push eax  ; guardo la suma

    mov ecx,ebx     ; recuperamos ecx <- N
    dec ecx         ; ecx <- N-1
    mov edx,[edi]   ; edx siempre almacena el min

min:
    add edi,4
    mov eax,[edi]   ;
    cmp edx,eax  ; 1er elem del arr lo compara con el 2do  
    jg updatemin  ; si el minelemento es mayor que eax , actualizo el min
    loop min
    jmp exit

updatemin:
    xchg edx,eax    ; edx <- eax y eax <- edx
    cmp ecx,1       ; si no coloco esto va intentar leer un valor fuera del rango, si es 1 ya fue el ultimo
    jg min   

exit:
    pop eax         ;recupero la suma del arreglo
    sub eax,edx     ; eax <- eax - min(arreglo)
    cdq             ; extender el signo de eax hacia edx
    dec ebx         ; desacarto un elemento: N-1
    idiv ebx        ; cociente: eax <- (edx:eax)/ebx ---- residuo: edx    calculo la media o promedio

; -------------------------------------------- ;
; -------------------------------------------- ;
; ------------- Fin de su código ------------- ;
; -------------------------------------------- ;
; -------------------------------------------- ;

    ; Epílogo de calling conventions de 32 bits
    pop ebx
    pop edi
    pop esi 
    mov esp,ebp
    pop ebp
    ret
