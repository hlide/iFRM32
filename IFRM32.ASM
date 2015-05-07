; FONT: Western European > OEM-US
;°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°
;±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
;²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²
;ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ
;²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²
;±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
;°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°
;              ú
;              ù ßßß   ÜÛÛÛÛÛ ÛÛÛßßÛÜ  ÜÛÛÛÜÛÛÛÜ  ÜßßÛÜ ÜßßÛÜ ú
;              : ÛÛÛ  ŞÛÛß    ÛÛÛ   ß ŞÛÛß ß ßÛÛİ ß ÜÛÛ ß  ÛÛ :      
;              ³ ÛÛÛ  ÛÛÛßß   ÛÛÛ     ÛÛÛ     ÛÛÛ Û  ÛÛ ÜÛÛß  |
;        ÚÄÄÄÄÄÙ ßßß  ßßß     ßßß     ßßß     ßßß  ßßß  ßßßßß ÀÄÄÄÄÄ¿
;        ³  à ÜßßÜ ÜßßÜ    ÛÛßßÜ ÛÛ ßßßÛÜ FLAT âîAL MODî DOS-îXTîïDîâ ³
;        |      ßÛ  ÜÛß Ü  ÛÛßßÜ ÛÛ    ÛÛ                             ³
;        :    ßÜÜß ÛÛÜÜ    ßßßß  ßß    ßß áy CHâSTOPHî AVOïïî 95-96 |
;        ú                                                            :
;                             ¯¯¯ VîâSION 1.0 ®®®
;
;°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°
;±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
;²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²
;ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ
;²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²
;±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
;°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°
;
;              Source & Coëe áy Christophe AVOINNî (C’), 95 - 96
;                                   - * -
;                          also known as Hli/Hlide.

        .486P
        LOCALS
FLATSEG GROUP   DS32SEG,CS32SEG,CS16SEG,SS16SEG,STUBSEG
        ASSUME  cs:FLATSEG

DS32SEG SEGMENT PUBLIC 'DATA' USE32 DWORD
DS32SEG ENDS
CS32SEG SEGMENT PUBLIC 'CODE' USE32 BYTE
CS32SEG ENDS
CS16SEG SEGMENT PUBLIC 'CODE' USE16 BYTE
CS16SEG ENDS
SS16SEG SEGMENT STACK 'STACK' USE16 PARA
        DB 256 DUP(0)
SS16SEG ENDS
STUBSEG SEGMENT PUBLIC 'STUB' USE16 PARA
STUBSEG ENDS

INCLUDE iFRM32.ASI

CS32SEG SEGMENT

CS16®32:push    eax
        cli
        mov     eax,cr0
        inc     eax
        mov     cr0,eax
        dec     eax
        DB      0EAh
        DD L    cs:CS®CS16SEL
        DW      CS16SEL

CS32SEG¯CS16SEG

CS®CS16SEL:
        mov     cr0,eax
        DB      0EAh
        DW S    cs:CS®CS16SEG
        DW      FLATSEG

CS®CS16SEG:
        pop     D [S iFâM32ùeax]
        mov     al,B 5[esp]             ; r‚cupŠre l'IOPL ...
        shr     al,4
        and     eax,3
        jmp     S @@0[eax+eax]
@@0     DW S    cs:CS16®32üSS32®32      ; pas de commutation de pile!
        DW S    cs:CS16®32üSS16®32      ; commutation de pile 32-bit vers 16-bit
        DW S    cs:CS16®32üSS32®16      ; commutation de pile 16-bit vers 32-bit
        DW S    cs:CS16®32üSS16®16      ; pas de commutation de pile!
CS16®32üSS16®32:
        pop     W [S iFâM32ùip]
        pop     W [S iFâM32ùcs]
        pop     W [S iFâM32ùflags]
        mov     W [S iFâM32ùssÿ32],ss
        mov     D [S iFâM32ùespÿ32],esp
        lss     esp,F [S iFâM32ùssÿespÿ16]
        push    W [S iFâM32ùflags]
        push    W [S iFâM32ùcs]
        push    W [S iFâM32ùip]
CS16®32üSS16®16:
        lidt    F [S iFâM32ùIDTPÿ16]
        mov     eax,D [S iFâM32ùeax]
        iretw
CS16®32üSS32®16:
        pop     W [S iFâM32ùip]         
        pop     W [S iFâM32ùcs]
        pop     W [S iFâM32ùflags]
        mov     W [S iFâM32ùssÿ16],ss
        mov     D [S iFâM32ùespÿ16],esp
        lss     esp,F [S iFâM32ùssÿespÿ32]
        push    W [S iFâM32ùflags]
        push    W [S iFâM32ùcs]
        push    W [S iFâM32ùip]
CS16®32üSS32®32:
        lidt    F [S iFâM32ùIDTPÿ16ı]
        mov     eax,D [S iFâM32ùeax]
CS16®16:iretw   

CS16®16ÿFLAT:
        push    eax bx cx
        pushfw
        lgdt    F [S iFâM32ùGDTP]
        mov     bx,ss
        mov     cx,FLATSEL
        cli
        mov     eax,cr0 
        inc     eax                     
        mov     cr0,eax
        dec     eax
        DB      0EAh
        DW S    cs:CS®CS16SELı,CS16SEL

CS16®16ÿTINY:
        push    eax bx cx
        pushfw
        lgdt    F [S iFâM32ùGDTP]
        mov     bx,ss
        mov     cx,DATASEL
        mov     eax,cr0 
        inc     eax                     
        mov     cr0,eax
        dec     eax
        DB      0EAh
        DW S    cs:CS®CS16SELı,CODESEL

CS®CS16SELı:
        push    ds es fs gs
        mov     ds,cx
        mov     es,cx
        mov     fs,cx
        mov     gs,cx
        mov     ss,cx
        mov     cr0,eax
        DB      0EAh
        DW S    cs:CS®CS16SEGı,FLATSEG

CS®CS16SEGı:
        mov     ss,bx
        lidt    F [S iFâM32ùIDTPÿ16]
        pop     gs fs es ds
        popfw           
        pop     cx bx eax
        retn

CS32®16:push    eax ebx ecx
        lgdt    F [S iFâM32ùGDTP]
        mov     bx,ss
        mov     cx,FLATSEL
        cli
        mov     eax,cr0 
        inc     eax                     
        mov     cr0,eax
        dec     eax
        DB      0EAh
        DW S    cs:CS®CS32SEL
        DW      CS32SEL

CS16SEG¯CS32SEG

CS®CS32SEL:
        push    ds es fs gs
        mov     ds,ecx
        mov     es,ecx
        mov     fs,ecx
        mov     gs,ecx
        mov     ss,ecx
        mov     cr0,eax
        DB      0EAh
        DD L    cs:CS®CS32SEG
        DW      FLATSEG

CS®CS32SEG:
        mov     ss,ebx
        pop     gs fs es ds
        pop     ecx ebx
        pop     D [L iFâM32ùeax]
        mov     al,B 5[esp]
        shr     al,4
        and     eax,3
        jmp     S @@0[eax+eax]
@@0     DW      S cs:CS32®16üSS32®32
        DW      S cs:CS32®16üSS32®16
        DW      S cs:CS32®16üSS16®32
        DW      S cs:CS32®16üSS16®16

CS32®16üSS16®32:
        pop     W [L iFâM32ùip]
        pop     W [L iFâM32ùcs]
        pop     W [L iFâM32ùflags]
        mov     D [L iFâM32ùssÿ32],ss
        mov     D [L iFâM32ùespÿ32],esp
        lss     esp,F [L iFâM32ùssÿespÿ16]
        push    W [L iFâM32ùflags]
        push    W [L iFâM32ùcs]
        push    W [L iFâM32ùip]

CS32®16üSS16®16:
        lidt    F [L iFâM32ùIDTPÿ32]
        mov     eax,D [L iFâM32ùeax]
        iretw

CS32®16üSS32®16:
        pop     W [L iFâM32ùip]
        pop     W [L iFâM32ùcs]
        pop     W [L iFâM32ùflags]
        mov     [L iFâM32ùssÿ16],ss
        mov     [L iFâM32ùespÿ16],esp
        lss     esp,F [L iFâM32ùssÿespÿ32]
        push    W [L iFâM32ùflags]
        push    W [L iFâM32ùcs]
        push    W [L iFâM32ùip]

CS32®16üSS32®32:
        lidt    F [L iFâM32ùIDTPÿ32]
        mov     eax,D [L iFâM32ùeax]

CS32®32:iretw
                  
SS32®??üCS32®32:
        cli
        btr     D 5[esp],5
        jnc     @@0
        pop     W [L iFâM32ùip]
        pop     W [L iFâM32ùcs]
        pop     W [L iFâM32ùflags]
        mov     D [L iFâM32ùssÿ16],ss
        mov     D [L iFâM32ùespÿ16],esp
        lss     esp,[L iFâM32ùssÿespÿ32]
        push    W [L iFâM32ùflags]
        push    W [L iFâM32ùcs]
        push    W [L iFâM32ùip]
@@0:    iretw

SS16®??üCS32®32:
        cli
        bts     D 5[esp],5
        jc      @@0
        pop     W [L iFâM32ùip]
        pop     W [L iFâM32ùcs]
        pop     W [L iFâM32ùflags]
        mov     D [L iFâM32ùssÿ32],ss
        mov     D [L iFâM32ùespÿ32],esp
        lss     esp,F [L iFâM32ùssÿespÿ16]
        push    W [L iFâM32ùflags]
        push    W [L iFâM32ùcs]
        push    W [L iFâM32ùip]
@@0:    iretw

CS32SEG¯CS16SEG

SS32®??üCS16®16:
        cli
        btr     W 5[esp],4
        jnc     @@0
        pop     W [S iFâM32ùip]
        pop     W [S iFâM32ùcs]
        pop     W [S iFâM32ùflags]
        mov     W [S iFâM32ùssÿ16],ss
        mov     D [S iFâM32ùespÿ16],esp
        lss     esp,F [S iFâM32ùssÿespÿ32]
        push    W [S iFâM32ùflags]
        push    W [S iFâM32ùcs]
        push    W [S iFâM32ùip]
        lidt    F [L iFâM32ùIDTPÿ16ı]
@@0:    iretw

SS16®??üCS16®16:
        cli
        bts     W 5[esp],4
        jc      @@0
        pop     W [S iFâM32ùip]
        pop     W [S iFâM32ùcs]
        pop     W [S iFâM32ùflags]
        mov     W [S iFâM32ùssÿ32],ss
        mov     D [S iFâM32ùespÿ32],esp
        lss     esp,F [S iFâM32ùssÿespÿ16]
        push    W [S iFâM32ùflags]
        push    W [S iFâM32ùcs]
        push    W [S iFâM32ùip]
        lidt    F [L iFâM32ùIDTPÿ16]
@@0:    iretw

GENERICúINT     <00h>
GENERICúINT     <01h>
GENERICúINT     <02h>
GENERICúINT     <03h>
GENERICúINT     <04h>
GENERICúINT     <05h>
GENERICúINT     <06h>
GENERICúINT     <07h>
GENERICúIRQ     <08h>
GENERICúIRQ     <09h>
GENERICúIRQ     <0Ah>
GENERICúIRQ     <0Bh>
GENERICúIRQ     <0Ch>
GENERICúIRQ     <0Dh>
GENERICúIRQ     <0Eh>
GENERICúIRQ     <0Fh>
GENERICúINT     <10h>
GENERICúINT     <11h>
GENERICúINT     <12h>
GENERICúINT     <13h>
GENERICúINT     <14h>
GENERICúINT     <15h>
GENERICúINT     <16h>
GENERICúINT     <17h>
GENERICúINT     <18h>
GENERICúINT     <19h>
GENERICúINT     <1Ah>
GENERICúINT     <1Bh>
GENERICúINT     <1Ch>
GENERICúINT     <1Dh>
GENERICúINT     <1Eh>
GENERICúINT     <1Fh>
GENERICúINT     <20h>
GENERICúINT     <21h>
GENERICúINT     <22h>
GENERICúINT     <23h>
GENERICúINT     <24h>
GENERICúINT     <25h>
GENERICúINT     <26h>
GENERICúINT     <27h>
GENERICúINT     <28h>
GENERICúINT     <29h>
GENERICúINT     <2Ah>
GENERICúINT     <2Bh>
GENERICúINT     <2Ch>
GENERICúINT     <2Dh>
GENERICúINT     <2Eh>
GENERICúINT     <2Fh>
GENERICúINT     <30h>
GENERICúINT     <31h>
GENERICúINT     <32h>
GENERICúINT     <33h>
GENERICúINT     <34h>
GENERICúINT     <35h>
GENERICúINT     <36h>
GENERICúINT     <37h>
GENERICúINT     <38h>
GENERICúINT     <39h>
GENERICúINT     <3Ah>
GENERICúINT     <3Bh>
GENERICúINT     <3Ch>
GENERICúINT     <3Dh>
GENERICúINT     <3Eh>
GENERICúINT     <3Fh>
GENERICúINT     <40h>
GENERICúINT     <41h>
GENERICúINT     <42h>
GENERICúINT     <43h>
GENERICúINT     <44h>
GENERICúINT     <45h>
GENERICúINT     <46h>
GENERICúINT     <47h>
GENERICúINT     <48h>
GENERICúINT     <49h>
GENERICúINT     <4Ah>
GENERICúINT     <4Bh>
GENERICúINT     <4Ch>
GENERICúINT     <4Dh>
GENERICúINT     <4Eh>
GENERICúINT     <4Fh>
GENERICúINT     <50h>
GENERICúINT     <51h>
GENERICúINT     <52h>
GENERICúINT     <53h>
GENERICúINT     <54h>
GENERICúINT     <55h>
GENERICúINT     <56h>
GENERICúINT     <57h>
GENERICúINT     <58h>
GENERICúINT     <59h>
GENERICúINT     <5Ah>
GENERICúINT     <5Bh>
GENERICúINT     <5Ch>
GENERICúINT     <5Dh>
GENERICúINT     <5Eh>
GENERICúINT     <5Fh>
GENERICúINT     <60h>
GENERICúINT     <61h>
GENERICúINT     <62h>
GENERICúINT     <63h>
GENERICúINT     <64h>
GENERICúINT     <65h>
GENERICúINT     <66h>
GENERICúINT     <67h>
GENERICúINT     <68h>
GENERICúINT     <69h>
GENERICúINT     <6Ah>
GENERICúINT     <6Bh>
GENERICúINT     <6Ch>
GENERICúINT     <6Dh>
GENERICúINT     <6Eh>
GENERICúINT     <6Fh>
GENERICúIRQ     <70h>
GENERICúIRQ     <71h>
GENERICúIRQ     <72h>
GENERICúIRQ     <73h>
GENERICúIRQ     <74h>
GENERICúIRQ     <75h>
GENERICúIRQ     <76h>
GENERICúIRQ     <77h>
GENERICúINT     <78h>
GENERICúINT     <79h>
GENERICúINT     <7Ah>
GENERICúINT     <7Bh>
GENERICúINT     <7Ch>
GENERICúINT     <7Dh>
GENERICúINT     <7Eh>
GENERICúINT     <7Fh>
GENERICúINT     <80h>
GENERICúINT     <81h>
GENERICúINT     <82h>
GENERICúINT     <83h>
GENERICúINT     <84h>
GENERICúINT     <85h>
GENERICúINT     <86h>
GENERICúINT     <87h>
GENERICúINT     <88h>
GENERICúINT     <89h>
GENERICúINT     <8Ah>
GENERICúINT     <8Bh>
GENERICúINT     <8Ch>
GENERICúINT     <8Dh>
GENERICúINT     <8Eh>
GENERICúINT     <8Fh>
GENERICúINT     <90h>
GENERICúINT     <91h>
GENERICúINT     <92h>
GENERICúINT     <93h>
GENERICúINT     <94h>
GENERICúINT     <95h>
GENERICúINT     <96h>
GENERICúINT     <97h>
GENERICúINT     <98h>
GENERICúINT     <99h>
GENERICúINT     <9Ah>
GENERICúINT     <9Bh>
GENERICúINT     <9Ch>
GENERICúINT     <9Dh>
GENERICúINT     <9Eh>
GENERICúINT     <9Fh>
GENERICúINT     <A0h>
GENERICúINT     <A1h>
GENERICúINT     <A2h>
GENERICúINT     <A3h>
GENERICúINT     <A4h>
GENERICúINT     <A5h>
GENERICúINT     <A6h>
GENERICúINT     <A7h>
;               ...
GENERICúINT     <B4h>
GENERICúINT     <B5h>
GENERICúINT     <B6h>
GENERICúINT     <B7h>
GENERICúINT     <B8h>
GENERICúINT     <B9h>
GENERICúINT     <BAh>
GENERICúINT     <BBh>
GENERICúINT     <BCh>
GENERICúINT     <BDh>
GENERICúINT     <BEh>
GENERICúINT     <BFh>
GENERICúINT     <C0h>
GENERICúINT     <C1h>
GENERICúINT     <C2h>
GENERICúINT     <C3h>
GENERICúINT     <C4h>
GENERICúINT     <C5h>
GENERICúINT     <C6h>
GENERICúINT     <C7h>
GENERICúINT     <C8h>
GENERICúINT     <C9h>
GENERICúINT     <CAh>
GENERICúINT     <CBh>
GENERICúINT     <CCh>
GENERICúINT     <CDh>
GENERICúINT     <CEh>
GENERICúINT     <CFh>
GENERICúINT     <D0h>
GENERICúINT     <D1h>
GENERICúINT     <D2h>
GENERICúINT     <D3h>
GENERICúINT     <D4h>
GENERICúINT     <D5h>
GENERICúINT     <D6h>
GENERICúINT     <D7h>
GENERICúINT     <D8h>
GENERICúINT     <D9h>
GENERICúINT     <DAh>
GENERICúINT     <DBh>
GENERICúINT     <DCh>
GENERICúINT     <DDh>
GENERICúINT     <DEh>
GENERICúINT     <DFh>
GENERICúINT     <E0h>
GENERICúINT     <E1h>
GENERICúINT     <E2h>
GENERICúINT     <E3h>
GENERICúINT     <E4h>
GENERICúINT     <E5h>
GENERICúINT     <E6h>
GENERICúINT     <E7h>
GENERICúINT     <E8h>
GENERICúINT     <E9h>
GENERICúINT     <EAh>
GENERICúINT     <EBh>
GENERICúINT     <ECh>
GENERICúINT     <EDh>
GENERICúINT     <EEh>
GENERICúINT     <EFh>
GENERICúINT     <F0h>
GENERICúINT     <F1h>
GENERICúINT     <F2h>
GENERICúINT     <F3h>
GENERICúINT     <F4h>
GENERICúINT     <F5h>
GENERICúINT     <F6h>
GENERICúINT     <F7h>
GENERICúINT     <F8h>
GENERICúINT     <F9h>
GENERICúINT     <FAh>
GENERICúINT     <FBh>
GENERICúINT     <FCh>
GENERICúINT     <FDh>
GENERICúINT     <FEh>
GENERICúINT     <FFh>

INTB0hÿ16:
        push    eax
        mov     al,ah
        and     eax,127
        jmp     S [iFâM32ùserviceÿ16][4*eax]
        
CS16SEG¯CS32SEG

INTB0hÿ32:
        push    eax
        mov     al,ah
        and     eax,127
        jmp     S [iFâM32ùserviceÿ32][4*eax]

INTB0hÿ32ÿfunctionÿ125: ; ® installation check  ¯
        pop     eax
        and     eax,255
        cmp     [L iFâM32ùservice][4*eax],0
        clc
        oso
        retf    2
        
INTB0hÿ32ÿfunctionÿ126: ; ® get entry point ¯
        pop     eax
        and     eax,255
        mov     edx,[L iFâM32ùservice][4*eax]
        oso
        retf    2
        
INTB0hÿ32ÿfunctionÿ127: ; ® set entry point ¯
        pop     eax
        and     eax,255
        xchg    edx,[L iFâM32ùservice][4*eax]
        oso
        retf    2
        
fonctionÿinvalideÿ32:
        pop     eax

fonctionÿinvalideÿ32ı:
        xor     eax,eax
        stc
        oso
        retf    2

initialiseÿlaÿpileÿ32ùbit:
        pop     eax
        mov     eax,iFâM32ùEMBÿbase
        add     eax,iFâM32ùEMBÿsize
        cmp     edx,eax
        ja      fonctionÿinvalideÿ32ı
        test    B 5[esp],32
        jz      fonctionÿinvalideÿ32ı
        mov     W [S iFâM32ùssÿ32],ds
        mov     D [S iFâM32ùespÿ32],edx
        and     B 4[esp],-2
        jmp     SS32®??üCS32®32

INTB0hÿ32ÿfunctionÿ3: ; ® allocate DOS memory block ¯
        pop     eax
        mov     ah,48h
        int     21h
        jc      @@2
@@0:    xor     edx,edx ; we first zero edx since the zero-extension of ds 
        mov     edx,ds  ; into edx wouldn't seemingly work on all CPU !
        xchg    eax,edx
        sub     eax,edx
        shl     eax,4
@@1:    clc
@@2:    oso
        retf    2
        
INTB0hÿ32ÿfunctionÿ4: ; ® release DOS memory block ¯
        pop     eax
        push    es
        mov     es,edx
        mov     ah,49h
        int     21h
        pop     es
        oso
        retf    2
        
INTB0hÿ32ÿfunctionÿ5: ; ® resize DOS memory block ¯
        pop     eax
        push    es
        mov     es,edx
        mov     ah,4Ah
        int     21h
        pop     es
        oso
        retf    2

INTB0hÿ32ÿfunctionÿ6: ; ® get IDTP ¯
        cli
        xor     eax,eax ; Fucking AMD which doesn't imply
        mov     eax,ds  ; a zero-extension of DS into EAX !
        mov     esi,[L iFâM32ùIDTPÿ32ÿBASE]
        mov     edi,[L iFâM32ùIDTPÿ16ÿBASE]
        mov     ebx,[L iFâM32ùIDTPÿ16ıÿBASE]
        shl     eax,4
        sub     esi,eax
        sub     edi,eax
        sub     ebx,eax
        pop     eax
        and     B 4[esp],-2
        iretw
        
INTB0hÿ32ÿfunctionÿ7: ; ® set IDTP ¯
        cli
        xor     eax,eax ; ugly, ugly, ugly !
        mov     eax,ds
        shl     eax,4
        add     esi,eax
        add     edi,eax
        add     ebx,eax
        xchg    esi,[L iFâM32ùIDTPÿ32ÿBASE]
        xchg    edi,[L iFâM32ùIDTPÿ16ÿBASE]
        xchg    ebx,[L iFâM32ùIDTPÿ16ıÿBASE]
        sub     esi,eax
        sub     edi,eax
        sub     ebx,eax
        pop     eax
        lidt    F [L iFâM32ùIDTPÿ32]
        and     B 4[esp],-2
        iretw

INTB0hÿ32ÿfunctionÿ8: ; ® get EMB info ¯
        pop     eax
        mov     ecx,D [S iFâM32ùEMBÿsize]
        mov     eax,D [S iFâM32ùEMBÿbase]
        mov     edx,D [S iFâM32ùEMBÿheap]
        and     B 4[esp],-2
        iretw

; ATTENTION : LOG2ÿBLOCKÿSIZE doit ˆtre sup‚rieur ou ‚gale … 5
; pour que l'algorithme fonctionne, car un bloc libre possŠde
; une entˆte dont la taille est de 24 octets, ce qui fait de 32
; ( 2^5 = 32 ) le candidat le plus proche pour la taille minimale
; d'un bloc libre.
LOG2ÿBLOCKÿSIZE EQU     5

; soit 32 octets minimals pour un bloc libre !
MINÿBLOCKÿSIZE  EQU     1 SHL LOG2ÿBLOCKÿSIZE

; d‚finissent les attributs dans l'entˆte
; des blocs qu'ils soient libres ou non :
SIZEÿBLOCK      EQU     <D -16> ; taille en unit‚ de LOG2ÿBLOCKÿSIZE
PREDÿBLOCK      EQU     <D -12> ; bloc en amont (libre ou non)
SUCCÿBLOCK      EQU     <D  -8> ; bloc en aval (libre ou non)
TYPEÿBLOCK      EQU     <D  -4> ; pointeur sur une VMT
NEXTÿBLOCK      EQU     <D  +0> ; bloc libre suivant dans la liste
PREVÿBLOCK      EQU     <D  +4> ; bloc libre pr‚c‚dent dans la liste

SIZEÿOFÿFREEÿBLOCKÿHEADER = MINÿBLOCKÿSIZE
SIZEÿOFÿLASTÿBLOCKÿHEADER = MINÿBLOCKÿSIZE

; lorsque qu'un bloc libre est allou‚, l'entˆte est r‚duite
; … 16 octets, laissant donc 16 autres octets au minimum
; au programme qui a command‚ l'allocation.
SIZEÿOFÿUSEDÿBLOCKÿHEADER = 16

; les blocs sont g‚r‚s comme des objets polymorphes,
; ce qui permet d'influencer sur leur comportement
; simplement en modifiant leur table des m‚thodes
; virtuelles.
FREEÿBLOCK      EQU     <O cs:FREEÿBLOCKÿMETHODS>
USEDÿBLOCK      EQU     <O cs:USEDÿBLOCKÿMETHODS>
LASTÿBLOCK      EQU     <O cs:LASTÿBLOCKÿMETHODS>
NULL            EQU     00000000h

REQUESTÿBLOCK           EQU     +0
EXPANDÿUPÿBLOCK         EQU     +4
EXPANDÿDOWNÿBLOCK       EQU     +8

createÿaÿmemoryÿsystem:
        push    ecx edx
        lea     edx,[eax+ecx]
        add     eax,SIZEÿOFÿUSEDÿBLOCKÿHEADER
        sub     edx,SIZEÿOFÿUSEDÿBLOCKÿHEADER
        sub     ecx,SIZEÿOFÿLASTÿBLOCKÿHEADER+SIZEÿOFÿFREEÿBLOCKÿHEADER
        mov     SIZEÿBLOCK[edx],0
        mov     PREDÿBLOCK[edx],eax
        mov     SUCCÿBLOCK[edx],eax
        mov     TYPEÿBLOCK[edx],LASTÿBLOCK
        mov     NEXTÿBLOCK[edx],eax
        mov     PREVÿBLOCK[edx],eax
        shr     ecx,LOG2ÿBLOCKÿSIZE
        mov     SIZEÿBLOCK[eax],ecx
        mov     PREDÿBLOCK[eax],edx
        mov     SUCCÿBLOCK[eax],edx
        mov     TYPEÿBLOCK[eax],FREEÿBLOCK
        mov     NEXTÿBLOCK[eax],edx
        mov     PREVÿBLOCK[eax],edx
        mov     eax,edx
        clc
@@0:    pop     edx ecx
        retn
INTB1hÿ16:
        CS32
        call    createÿaÿmemoryÿsystem
        CS16
        retf    2       
INTB1hÿ32:
        call    createÿaÿmemoryÿsystem
        oso
        retf    2

allocateÿaÿblock:
        add     eax,SIZEÿOFÿUSEDÿBLOCKÿHEADER-1
        shr     eax,LOG2ÿBLOCKÿSIZE
        push    ebx esi edi
        mov     esi,NEXTÿBLOCK[ebx]
requestÿanotherÿfreeÿblockÿ?:
        cmp     eax,SIZEÿBLOCK[esi]
        jbe     requestÿthisÿfreeÿblock
requestÿanotherÿblock:
        mov     esi,NEXTÿBLOCK[esi]
        mov     edi,TYPEÿBLOCK[esi]
        jmp     cs:REQUESTÿBLOCK[edi]

requestÿthisÿfreeÿblock:        
        push    ecx edx
        mov     TYPEÿBLOCK[esi],USEDÿBLOCK
        mov     ecx,SIZEÿBLOCK[esi]
        mov     edx,eax
        shl     edx,LOG2ÿBLOCKÿSIZE
        add     edx,esi
        sub     ecx,eax
        mov     SIZEÿBLOCK[esi],eax
        jnz     @@1
        mov     ecx,PREVÿBLOCK[esi]
        mov     ebx,NEXTÿBLOCK[esi]
        mov     NEXTÿBLOCK[ecx],ebx
        mov     PREVÿBLOCK[ebx],ecx
        jmp     @@2
@@1:    dec     ecx
        add     edx,SIZEÿOFÿFREEÿBLOCKÿHEADER
        mov     SIZEÿBLOCK[edx],ecx
        mov     ebx,SUCCÿBLOCK[esi]
        mov     ecx,NEXTÿBLOCK[esi]
        mov     SUCCÿBLOCK[edx],ebx
        mov     PREDÿBLOCK[ebx],edx
        mov     SUCCÿBLOCK[esi],edx
        mov     ebx,PREVÿBLOCK[esi]
        mov     NEXTÿBLOCK[edx],ecx
        mov     PREVÿBLOCK[edx],ebx
        mov     PREDÿBLOCK[edx],esi
        mov     NEXTÿBLOCK[ebx],edx
        mov     PREVÿBLOCK[ecx],edx
        mov     TYPEÿBLOCK[edx],FREEÿBLOCK
@@2:    pop     edx ecx
        mov     eax,esi
        pop     edi esi ebx
        clc
        retn
INTB2hÿ16:
        CS32
        call    allocateÿaÿblock
        CS16
        retf    2       
INTB2hÿ32:
        call    allocateÿaÿblock
        oso
        retf    2

invalidÿblock:
        pop     edi esi ebx
        stc
        retn

INTB3hÿ16:
        CS32
        call    releaseÿthisÿblock
        CS16
        retf    2       
INTB3hÿ32:
        call    releaseÿthisÿblock
        oso
        retf    2
releaseÿthisÿblock:
        push    ebx esi edi
        cmp     TYPEÿBLOCK[eax],L USEDÿBLOCK
        mov     esi,eax
        jnz     invalidÿblock
        push    ecx edx
        mov     eax,SUCCÿBLOCK[esi]
        mov     edi,PREDÿBLOCK[esi]
        mov     edx,TYPEÿBLOCK[edi]
        call    cs:EXPANDÿUPÿBLOCK[edx]
        mov     edx,TYPEÿBLOCK[edi]
        call    cs:EXPANDÿDOWNÿBLOCK[edx]
        pop     edx ecx edi esi ebx
        xor     eax,eax
        retn

expandÿupÿtheÿnewÿfreeÿblock:
        mov     ecx,SIZEÿBLOCK[esi]
        mov     esi,edi
        inc     ecx
        mov     SUCCÿBLOCK[edi],eax
        add     SIZEÿBLOCK[edi],ecx
        xchg    eax,edi
        retn
cannotÿexpandÿupÿthisÿblock:
        mov     edi,eax
        mov     TYPEÿBLOCK[esi],FREEÿBLOCK
        retn
        
expandÿdownÿtheÿnewÿfreeÿblock:
        mov     ecx,SIZEÿBLOCK[edi]
        mov     edx,SUCCÿBLOCK[edi]
        inc     ecx
        add     SIZEÿBLOCK[esi],ecx
        cmp     eax,edi
        jz      @@0
        mov     ebx,NEXTÿBLOCK[edi]
        mov     ecx,PREVÿBLOCK[edi]
        mov     NEXTÿBLOCK[ecx],ebx
        mov     PREVÿBLOCK[ebx],ecx
@@0:    mov     ebx,NEXTÿBLOCK[eax]
        mov     ecx,PREVÿBLOCK[eax]
        mov     PREVÿBLOCK[ebx],esi
        mov     NEXTÿBLOCK[ecx],esi
        mov     PREDÿBLOCK[edx],esi
        mov     SUCCÿBLOCK[esi],edx
        mov     PREVÿBLOCK[esi],ecx
        mov     NEXTÿBLOCK[esi],ebx
        retn
cannotÿexpandÿdownÿthisÿblock:
        cmp     eax,edi
        jz      @@0
        mov     PREDÿBLOCK[edi],esi
        retn
@@0:    mov     edi,NEXTÿBLOCK[ebx]
        mov     PREVÿBLOCK[esi],ebx
        mov     NEXTÿBLOCK[esi],edi
        mov     NEXTÿBLOCK[ebx],esi
        mov     PREVÿBLOCK[edi],esi
        retn

CS32SEG¯CS16SEG

fonctionÿinvalideÿ16:
        pop     eax

fonctionÿinvalideÿ16ı:
        xor     eax,eax
        stc
        retf    2

termineÿlÿapplicationÿiFâM32:
        SS16
        CS16
        call    S CS16®16ÿTINY
        dec     [S iFâM32ùcount]
        jnz     @@2
        mov     dx,W [S iFâM32ùEMBÿhandle]
        or      dx,dx
        je      @@1
        mov     ah,0Dh
        call    [S iFâM32ùXMMÿhandler]
        mov     dx,W [S iFâM32ùEMBÿhandle]
        mov     ah,0Ah
        call    [S iFâM32ùXMMÿhandler]
        mov     D [S iFâM32ùEMBÿsize],0
        mov     ah,6
        call    [S iFâM32ùXMMÿhandler]
@@1:    mov     D [S iFâM32ùEMBÿbase],0
        mov     D [S iFâM32ùEMBÿheap],0
        mov     D [S iFâM32ùEMBÿhandle],0
@@2:    mov     ax,4C00h
        int     21h

passeÿenÿcodeÿ32ùbit:
        pop     eax
        inc     [S iFâM32ùcount]
        test    [S iFâM32ùstateÿhiúhi],01000000b
        je      @@0
        mov     ah,5
        call    [S iFâM32ùXMMÿhandler]
        or      ax,ax
        je      fonctionÿinvalideÿ16ı
@@0:    call    m‚thodeÿPSÿpourÿlib‚rerÿlaÿligneÿdÿadresseÿA20
        jne     fonctionÿinvalideÿ16ı
        call    m‚thodeÿATÿpourÿlib‚rerÿlaÿligneÿdÿadresseÿA20
        jne     fonctionÿinvalideÿ16ı
blocÿEMBÿallou‚ÿouÿnon: 
        and     B 4[esp],-2
        jmp     CS32®16

alloueÿunÿEMB:
        pop     eax
        add     ecx,3
        and     ecx,-4
        push    SúO  blocÿEMBÿallou‚ÿouÿnon
        jmp     alloue

installeÿlaÿpileÿ32ùbit:
        pop     eax
        mov     ebp,edx
        add     ecx,3
        add     ebp,3
        and     ecx,-4
        and     ebp,-4
        cmp     ecx,ebp
        jb      fonctionÿinvalideÿ16ı
        call    alloue
        
placeÿlaÿpileÿ32ùbitÿdansÿlÿEMB:
        add     edx,eax
        sub     edx,ebp
        mov     D [S iFâM32ùespÿ32],edx
        mov     W [S iFâM32ùssÿ32],ds
        mov     D [S iFâM32ùEMBÿheap],edx
        and     W 4[esp],1101111111111110b
        jmp     CS32®16
        
alloue: inc     [S iFâM32ùcount]
        test    [S iFâM32ùstateÿhiúhi],01000000b
        je      pasÿdeÿXMS
        
alloueÿtouteÿlaÿm‚moireÿ‚tendueÿdisponible:
        mov     ah,5
        call    [S iFâM32ùXMMÿhandler]
        or      ax,ax
        je      fonctionÿinvalideÿ16
        mov     ah,08h  ; taille maximale d'un bloc EMB?
        call    [S iFâM32ùXMMÿhandler]
        mov     dx,ax
        and     eax,0FFFFh
        shl     eax,10
        cmp     eax,ecx
        jb      fonctionÿinvalideÿ16
        mov     [S iFâM32ùEMBÿsize],eax
        mov     ah,09h  ; allocation d'un EMB de cette taille
        call    [S iFâM32ùXMMÿhandler]
        or      ax,ax
        je      fonctionÿinvalideÿ16
        mov     W [S iFâM32ùEMBÿhandle],dx
        mov     ah,0Ch  ; obtient son adresse lin‚aire (A.L)
        call    [S iFâM32ùXMMÿhandler]
        or      ax,ax
        je      lÿEMBÿnÿaÿpasÿpuÿˆtreÿallou‚

okÿlÿEMBÿestÿcorrectementÿallou‚:
        xor     eax,eax ; Fucking AMD !
        mov     eax,ds  ; traduit l'A.L en adresse accessible
        shl     edx,16  ; … partir du segment r‚f‚renc‚ par DS
        shl     eax,4
        mov     dx,bx
        sub     edx,eax
        mov     D [S iFâM32ùEMBÿbase],edx
        mov     D [S iFâM32ùEMBÿheap],edx
        mov     eax,[S iFâM32ùEMBÿsize]
        retn

lÿEMBÿnÿaÿpasÿpuÿˆtreÿallou‚:
        mov     dx,W [S iFâM32ùEMBÿhandle]
        mov     ah,0Ah  ; A‹e! libŠre l'EMB...
        call    [S iFâM32ùXMMÿhandler]
        jmp     fonctionÿinvalideÿ16

pasÿdeÿXMS:
        cmp     [S iFâM32ùEMBÿsize],ecx
        jb      fonctionÿinvalideÿ16
        call    m‚thodeÿPSÿpourÿlib‚rerÿlaÿligneÿdÿadresseÿA20
        jne     fonctionÿinvalideÿ16
        call    m‚thodeÿATÿpourÿlib‚rerÿlaÿligneÿdÿadresseÿA20
        jne     fonctionÿinvalideÿ16
        xor     bx,bx
        mov     dx,10h
        mov     eax,[S iFâM32ùEMBÿsize]
        jmp     okÿlÿEMBÿestÿcorrectementÿallou‚

‚muleÿINTB0hÿ32:
        pop     eax
        int     0A9h
        int     0B0h
        int     0A8h
        retf    2
        
chargeÿlÿapplicationÿiFâM32:
        push    es bx
        mov     ax,fs
        mov     bx,STUBSEG
        mov     es,ax
        sub     bx,ax
        mov     ah,4Ah
        int     21h
        pop     bx es
        mov     [S iFâM32ùssı],ss
        mov     [S iFâM32ùspı],sp
        mov     ax,4B00h
        int     21h
        lss     sp,iFâM32ùssÿspı
        mov     ax,cs
        mov     ds,ax
        jnc     @@0
        mov     dx,O cs:erreurÿdeÿchargement
        jmp     @@1
@@0:    mov     dx,O cs:iFâM32ÿestÿd‚log‚
@@1:    call    ‚changeÿlaÿtableÿdesÿinterruptionsÿ16ùbit

retourneÿauÿDOS:
        mov     ah,9
        int     21h
        mov     ax,4C00h
        int     21h

strat‚gie:
        mov     W cs:blocÿdeÿdonn‚e[0],bx
        mov     W cs:blocÿdeÿdonn‚e[2],es
        retf

commandes:
        pushad
        push    ds es fs gs
        pushfd
        mov     ax,cs
        mov     ds,ax
        les     di,cs:blocÿdeÿdonn‚e
        mov     ax,8003h
        cmp     B es:2[di],0
        jne     @@0
        mov     ah,9
        mov     dx,O cs:copyright
        int     21h
        push    es di
        call    initialiseÿiFâM32
        pop     di es
        xor     ax,ax
        mov     W es:14[di],O cs:finÿdeÿr‚sident
        mov     W es:16[di],cs
@@0:    or      ah,1
        mov     es:3[di],ax
        popfd
        pop     gs fs es ds
        popad
        retf

newÿINT2Fh:
        cmp     ax,43FFh
        jne     @@1
        mov     eax,"iFRM"
        mov     edx,"32C’"
        mov     bx,cs
        mov     es,bx
        mov     ebx,O [L cs:iFâM32ùstate]
        iret
@@1:    DB      0EAh
oldÿINT2Fh      LABEL   DWORD
        DW      O cs:newÿINT2Fh,FLATSEG

ASSUME  cs:FLATSEG,ds:FLATSEG

m‚thodeÿPSÿpourÿlib‚rerÿlaÿligneÿdÿadresseÿA20:
        in      al,92h
        out     4Fh,al
        and     al,-3
        out     92h,al
        out     4Fh,al
        call    v‚rifieÿlaÿligneÿdÿadresseÿA20
        retn

m‚thodeÿATÿpourÿlib‚rerÿlaÿligneÿdÿadresseÿA20:
        call    contr“leurÿ8042ÿ…ÿlÿ‚coute?
        mov     al,0D1h
        out     64h,al
        call    contr“leurÿ8042ÿ…ÿlÿ‚coute?
        mov     al,0DFh
        out     60h,al
        call    contr“leurÿ8042ÿ…ÿlÿ‚coute?
        call    v‚rifieÿlaÿligneÿdÿadresseÿA20
        retn
                
v‚rifieÿlaÿligneÿdÿadresseÿA20:
        push    es
        xor     ax,ax
        mov     es,ax
        mov     al,es:[000000000h]
        mov     ah,al
        not     al
        xchg    al,es:[000100000h]
        cmp     ah,es:[000000000h]
        mov     es:[000100000h],al
        pop     es
        retn

contr“leurÿ8042ÿ…ÿlÿ‚coute?:
        in      al,64h
        out     4Fh,al
        test    al,1
        jz      @@0
        in      al,60h
        out     4Fh,al
        jmp     contr“leurÿ8042ÿ…ÿlÿ‚coute?
@@0:    test    al,2
        jnz     contr“leurÿ8042ÿ…ÿlÿ‚coute?
        retn
                
‚changeÿlaÿtableÿdesÿinterruptionsÿ16ùbit:
        xor     ax,ax
        mov     es,ax
        mov     ax,cs
        mov     ds,ax
        mov     cx,IDTÿ16ÿSIZE
        mov     si,O cs:[S iFâM32ùIDTÿ16]
        cld
        mov     di,4*0A8h
@@1:    mov     eax,es:[di]
        movsd
        mov     [si][-4],eax                    
        loopw   @@1
        mov     eax,oldÿINT2Fh
        xchg    es:[4*2Fh],eax
        mov     oldÿINT2Fh,eax
        retn

copyright:
        DB "iFâM32 Version 1.00 - (C) 1996 by Christophî AVOINNî (C’).",13,10,10,'$'
iFâM32ÿestÿd‚log‚:
        DB 10,13," Merci d'avoir utilis‚ iFâM32 ;-)",13,10,'$'
erreurÿdeÿchargement:
        DB 10,13," Error : file or arguments incorrect !",13,10,'$'

CS16SEG¯CS32SEG

CS32SEG ENDS

DS32SEG SEGMENT
        DD      -1
        DW      0A000h
        DW S    cs:strat‚gie
        DW S    cs:commandes
        DB      "iFâM32C’"
iFâM32ùstate            LABEL   DWORD
iFâM32ùstateÿloúlo      DB      0
iFâM32ùstateÿloúhi      DB      0
iFâM32ùstateÿhiúlo      DB      0
iFâM32ùstateÿhiúhi      DB      80h
iFâM32ùcount            DD      0
iFâM32ùmajorÿversion    DB      01h
iFâM32ùminorÿversion    DB      00h
iFâM32ùGDTP             LABEL   FWORD
iFâM32ùGDTPÿSIZE        DW      GDTÿSIZE
iFâM32ùGDTPÿBASE        DD L    ds:iFâM32ùGDT
iFâM32ùIDTPÿ16          LABEL   FWORD
iFâM32ùIDTPÿ16ÿSIZE     DW      (03FFh)
iFâM32ùIDTPÿ16ÿBASE     DD      0
iFâM32ùIDTPÿ32          LABEL   FWORD
iFâM32ùIDTPÿ32ÿSIZE     DW      (03FFh)
iFâM32ùIDTPÿ32ÿBASE     DD L    ds:iFâM32ùIDTÿ32
                        DW      0
iFâM32ùssÿespÿ16        LABEL   FWORD
iFâM32ùespÿ16           DD      0
iFâM32ùssÿ16            DW      0,0
iFâM32ùssÿespÿ32        LABEL   FWORD
iFâM32ùespÿ32           DD      0
iFâM32ùssÿ32            DW      0,0

iFâM32ùIDTPÿ16ı         LABEL   FWORD
iFâM32ùIDTPÿ16ıÿSIZE    DW      (03FFh)
iFâM32ùIDTPÿ16ıÿBASE    DD      0
                                        
iFâM32ùXMMÿhandler      LABEL   DWORD
iFâM32ùXMMÿhandlerúOFS  DW      0
iFâM32ùXMMÿhandlerúSEG  DW      0,0

iFâM32ùEMBÿhandle       DD      0
iFâM32ùEMBÿsize         DD      0
iFâM32ùEMBÿbase         DD      0
iFâM32ùEMBÿheap         DD      0

iFâM32ùeax              DD      0
iFâM32ùip               DW      0,0
iFâM32ùcs               DW      0,0
iFâM32ùflags            DW      0,0
iFâM32ùssÿspı           LABEL   DWORD
iFâM32ùspı              DW      0
iFâM32ùssı              DW      0

blocÿdeÿdonn‚e          DD      0

iFâM32ùGDT              LABEL   QWORD
iFâM32ùGDTEÿZERO        DQ      (00000000000000000h)
iFâM32ùGDTEÿCS32        DQ      (000CF9A000000FFFFh)
iFâM32ùGDTEÿCS16        DQ      (0008F9A000000FFFFh) 
iFâM32ùGDTEÿFLAT        DQ      (000CF92000000FFFFh)
iFâM32ùGDTEÿCODE        DQ      (000009A000000FFFFh)
iFâM32ùGDTEÿDATA        DQ      (0000092000000FFFFh)
GDTÿSIZE                EQU     (cs:$ - cs:iFâM32ùGDT) 

iFâM32ùIDTÿ32           LABEL DWORD
        DW S    cs:INT00h,FLATSEG
        DW S    cs:INT01h,FLATSEG
        DW S    cs:INT02h,FLATSEG
        DW S    cs:INT03h,FLATSEG
        DW S    cs:INT04h,FLATSEG
        DW S    cs:INT05h,FLATSEG
        DW S    cs:INT06h,FLATSEG
        DW S    cs:INT07h,FLATSEG
        DW S    cs:INT08h,FLATSEG
        DW S    cs:INT09h,FLATSEG
        DW S    cs:INT0Ah,FLATSEG
        DW S    cs:INT0Bh,FLATSEG
        DW S    cs:INT0Ch,FLATSEG
        DW S    cs:INT0Dh,FLATSEG
        DW S    cs:INT0Eh,FLATSEG
        DW S    cs:INT0Fh,FLATSEG
        DW S    cs:INT10h,FLATSEG
        DW S    cs:INT11h,FLATSEG
        DW S    cs:INT12h,FLATSEG
        DW S    cs:INT13h,FLATSEG
        DW S    cs:INT14h,FLATSEG
        DW S    cs:INT15h,FLATSEG
        DW S    cs:INT16h,FLATSEG
        DW S    cs:INT17h,FLATSEG
        DW S    cs:INT18h,FLATSEG
        DW S    cs:INT19h,FLATSEG
        DW S    cs:INT1Ah,FLATSEG
        DW S    cs:INT1Bh,FLATSEG
        DW S    cs:INT1Ch,FLATSEG
        DW S    cs:INT1Dh,FLATSEG
        DW S    cs:INT1Eh,FLATSEG
        DW S    cs:INT1Fh,FLATSEG
        DW S    cs:INT20h,FLATSEG
        DW S    cs:INT21h,FLATSEG
        DW S    cs:INT22h,FLATSEG
        DW S    cs:INT23h,FLATSEG
        DW S    cs:INT24h,FLATSEG
        DW S    cs:INT25h,FLATSEG
        DW S    cs:INT26h,FLATSEG
        DW S    cs:INT27h,FLATSEG
        DW S    cs:INT28h,FLATSEG
        DW S    cs:INT29h,FLATSEG
        DW S    cs:INT2Ah,FLATSEG
        DW S    cs:INT2Bh,FLATSEG
        DW S    cs:INT2Ch,FLATSEG
        DW S    cs:INT2Dh,FLATSEG
        DW S    cs:INT2Eh,FLATSEG
        DW S    cs:INT2Fh,FLATSEG
        DW S    cs:INT30h,FLATSEG
        DW S    cs:INT31h,FLATSEG
        DW S    cs:INT32h,FLATSEG
        DW S    cs:INT33h,FLATSEG
        DW S    cs:INT34h,FLATSEG
        DW S    cs:INT35h,FLATSEG
        DW S    cs:INT36h,FLATSEG
        DW S    cs:INT37h,FLATSEG
        DW S    cs:INT38h,FLATSEG
        DW S    cs:INT39h,FLATSEG
        DW S    cs:INT3Ah,FLATSEG
        DW S    cs:INT3Bh,FLATSEG
        DW S    cs:INT3Ch,FLATSEG
        DW S    cs:INT3Dh,FLATSEG
        DW S    cs:INT3Eh,FLATSEG
        DW S    cs:INT3Fh,FLATSEG
        DW S    cs:INT40h,FLATSEG
        DW S    cs:INT41h,FLATSEG
        DW S    cs:INT42h,FLATSEG
        DW S    cs:INT43h,FLATSEG
        DW S    cs:INT44h,FLATSEG
        DW S    cs:INT45h,FLATSEG
        DW S    cs:INT46h,FLATSEG
        DW S    cs:INT47h,FLATSEG
        DW S    cs:INT48h,FLATSEG
        DW S    cs:INT49h,FLATSEG
        DW S    cs:INT4Ah,FLATSEG
        DW S    cs:INT4Bh,FLATSEG
        DW S    cs:INT4Ch,FLATSEG
        DW S    cs:INT4Dh,FLATSEG
        DW S    cs:INT4Eh,FLATSEG
        DW S    cs:INT4Fh,FLATSEG
        DW S    cs:INT50h,FLATSEG
        DW S    cs:INT51h,FLATSEG
        DW S    cs:INT52h,FLATSEG
        DW S    cs:INT53h,FLATSEG
        DW S    cs:INT54h,FLATSEG
        DW S    cs:INT55h,FLATSEG
        DW S    cs:INT56h,FLATSEG
        DW S    cs:INT57h,FLATSEG
        DW S    cs:INT58h,FLATSEG
        DW S    cs:INT59h,FLATSEG
        DW S    cs:INT5Ah,FLATSEG
        DW S    cs:INT5Bh,FLATSEG
        DW S    cs:INT5Ch,FLATSEG
        DW S    cs:INT5Dh,FLATSEG
        DW S    cs:INT5Eh,FLATSEG
        DW S    cs:INT5Fh,FLATSEG
        DW S    cs:INT60h,FLATSEG
        DW S    cs:INT61h,FLATSEG
        DW S    cs:INT62h,FLATSEG
        DW S    cs:INT63h,FLATSEG
        DW S    cs:INT64h,FLATSEG
        DW S    cs:INT65h,FLATSEG
        DW S    cs:INT66h,FLATSEG
        DW S    cs:INT67h,FLATSEG
        DW S    cs:INT68h,FLATSEG
        DW S    cs:INT69h,FLATSEG
        DW S    cs:INT6Ah,FLATSEG
        DW S    cs:INT6Bh,FLATSEG
        DW S    cs:INT6Ch,FLATSEG
        DW S    cs:INT6Dh,FLATSEG
        DW S    cs:INT6Eh,FLATSEG
        DW S    cs:INT6Fh,FLATSEG
        DW S    cs:INT70h,FLATSEG
        DW S    cs:INT71h,FLATSEG
        DW S    cs:INT72h,FLATSEG
        DW S    cs:INT73h,FLATSEG
        DW S    cs:INT74h,FLATSEG
        DW S    cs:INT75h,FLATSEG
        DW S    cs:INT76h,FLATSEG
        DW S    cs:INT77h,FLATSEG
        DW S    cs:INT78h,FLATSEG
        DW S    cs:INT79h,FLATSEG
        DW S    cs:INT7Ah,FLATSEG
        DW S    cs:INT7Bh,FLATSEG
        DW S    cs:INT7Ch,FLATSEG
        DW S    cs:INT7Dh,FLATSEG
        DW S    cs:INT7Eh,FLATSEG
        DW S    cs:INT7Fh,FLATSEG
        DW S    cs:INT80h,FLATSEG
        DW S    cs:INT81h,FLATSEG
        DW S    cs:INT82h,FLATSEG
        DW S    cs:INT83h,FLATSEG
        DW S    cs:INT84h,FLATSEG
        DW S    cs:INT85h,FLATSEG
        DW S    cs:INT86h,FLATSEG
        DW S    cs:INT87h,FLATSEG
        DW S    cs:INT88h,FLATSEG
        DW S    cs:INT89h,FLATSEG
        DW S    cs:INT8Ah,FLATSEG
        DW S    cs:INT8Bh,FLATSEG
        DW S    cs:INT8Ch,FLATSEG
        DW S    cs:INT8Dh,FLATSEG
        DW S    cs:INT8Eh,FLATSEG
        DW S    cs:INT8Fh,FLATSEG
        DW S    cs:INT90h,FLATSEG
        DW S    cs:INT91h,FLATSEG
        DW S    cs:INT92h,FLATSEG
        DW S    cs:INT93h,FLATSEG
        DW S    cs:INT94h,FLATSEG
        DW S    cs:INT95h,FLATSEG
        DW S    cs:INT96h,FLATSEG
        DW S    cs:INT97h,FLATSEG
        DW S    cs:INT98h,FLATSEG
        DW S    cs:INT99h,FLATSEG
        DW S    cs:INT9Ah,FLATSEG
        DW S    cs:INT9Bh,FLATSEG
        DW S    cs:INT9Ch,FLATSEG
        DW S    cs:INT9Dh,FLATSEG
        DW S    cs:INT9Eh,FLATSEG
        DW S    cs:INT9Fh,FLATSEG
        DW S    cs:INTA0h,FLATSEG
        DW S    cs:INTA1h,FLATSEG
        DW S    cs:INTA2h,FLATSEG
        DW S    cs:INTA3h,FLATSEG
        DW S    cs:INTA4h,FLATSEG
        DW S    cs:INTA5h,FLATSEG
        DW S    cs:INTA6h,FLATSEG
        DW S    cs:INTA7h,FLATSEG
        DW S    cs:CS16®32        ,FLATSEG;>> INTA8h
        DW S    cs:CS32®32        ,FLATSEG;>> INTA9h
        DW S    cs:CS32®32        ,FLATSEG;>> INTAAh
        DW S    cs:CS32®32        ,FLATSEG;>> INTABh
        DW S    cs:SS16®??üCS32®32,FLATSEG;>> INTACh
        DW S    cs:SS32®??üCS32®32,FLATSEG;>> INTADh
        DW S    cs:CS32®32        ,FLATSEG;>> INTAEh
        DW S    cs:CS32®32        ,FLATSEG;>> INTAFh
        DW S    cs:INTB0hÿ32      ,FLATSEG;>> INTB0h
        DW S    cs:INTB1hÿ32      ,FLATSEG;>> INTB1h
        DW S    cs:INTB2hÿ32      ,FLATSEG;>> INTB2h
        DW S    cs:INTB3hÿ32      ,FLATSEG;>> INTB3h
        DW S    cs:INTB4h,FLATSEG
        DW S    cs:INTB5h,FLATSEG
        DW S    cs:INTB6h,FLATSEG
        DW S    cs:INTB7h,FLATSEG
        DW S    cs:INTB8h,FLATSEG
        DW S    cs:INTB9h,FLATSEG
        DW S    cs:INTBAh,FLATSEG
        DW S    cs:INTBBh,FLATSEG
        DW S    cs:INTBCh,FLATSEG
        DW S    cs:INTBDh,FLATSEG
        DW S    cs:INTBEh,FLATSEG
        DW S    cs:INTBFh,FLATSEG
        DW S    cs:INTC0h,FLATSEG
        DW S    cs:INTC1h,FLATSEG
        DW S    cs:INTC2h,FLATSEG
        DW S    cs:INTC3h,FLATSEG
        DW S    cs:INTC4h,FLATSEG
        DW S    cs:INTC5h,FLATSEG
        DW S    cs:INTC6h,FLATSEG
        DW S    cs:INTC7h,FLATSEG
        DW S    cs:INTC8h,FLATSEG
        DW S    cs:INTC9h,FLATSEG
        DW S    cs:INTCAh,FLATSEG
        DW S    cs:INTCBh,FLATSEG
        DW S    cs:INTCCh,FLATSEG
        DW S    cs:INTCDh,FLATSEG
        DW S    cs:INTCEh,FLATSEG
        DW S    cs:INTCFh,FLATSEG
        DW S    cs:INTD0h,FLATSEG
        DW S    cs:INTD1h,FLATSEG
        DW S    cs:INTD2h,FLATSEG
        DW S    cs:INTD3h,FLATSEG
        DW S    cs:INTD4h,FLATSEG
        DW S    cs:INTD5h,FLATSEG
        DW S    cs:INTD6h,FLATSEG
        DW S    cs:INTD7h,FLATSEG
        DW S    cs:INTD8h,FLATSEG
        DW S    cs:INTD9h,FLATSEG
        DW S    cs:INTDAh,FLATSEG
        DW S    cs:INTDBh,FLATSEG
        DW S    cs:INTDCh,FLATSEG
        DW S    cs:INTDDh,FLATSEG
        DW S    cs:INTDEh,FLATSEG
        DW S    cs:INTDFh,FLATSEG
        DW S    cs:INTE0h,FLATSEG
        DW S    cs:INTE1h,FLATSEG
        DW S    cs:INTE2h,FLATSEG
        DW S    cs:INTE3h,FLATSEG
        DW S    cs:INTE4h,FLATSEG
        DW S    cs:INTE5h,FLATSEG
        DW S    cs:INTE6h,FLATSEG
        DW S    cs:INTE7h,FLATSEG
        DW S    cs:INTE8h,FLATSEG
        DW S    cs:INTE9h,FLATSEG
        DW S    cs:INTEAh,FLATSEG
        DW S    cs:INTEBh,FLATSEG
        DW S    cs:INTECh,FLATSEG
        DW S    cs:INTEDh,FLATSEG
        DW S    cs:INTEEh,FLATSEG
        DW S    cs:INTEFh,FLATSEG
        DW S    cs:INTF0h,FLATSEG
        DW S    cs:INTF1h,FLATSEG
        DW S    cs:INTF2h,FLATSEG
        DW S    cs:INTF3h,FLATSEG
        DW S    cs:INTF4h,FLATSEG
        DW S    cs:INTF5h,FLATSEG
        DW S    cs:INTF6h,FLATSEG
        DW S    cs:INTF7h,FLATSEG
        DW S    cs:INTF8h,FLATSEG
        DW S    cs:INTF9h,FLATSEG
        DW S    cs:INTFAh,FLATSEG
        DW S    cs:INTFBh,FLATSEG
        DW S    cs:INTFCh,FLATSEG
        DW S    cs:INTFDh,FLATSEG
        DW S    cs:INTFEh,FLATSEG
        DW S    cs:INTFFh,FLATSEG
iFâM32ùIDTÿ16   LABEL WORD
        DW S    cs:CS16®16        ,FLATSEG;>> INTA8h
        DW S    cs:CS32®16        ,FLATSEG;>> INTA9h
        DW S    cs:CS16®16        ,FLATSEG;>> INTAAh
        DW S    cs:CS16®16        ,FLATSEG;>> INTABh
        DW S    cs:SS16®??üCS16®16,FLATSEG;>> INTACh
        DW S    cs:SS32®??üCS16®16,FLATSEG;>> INTADh
        DW S    cs:CS16®16        ,FLATSEG;>> INTAEh
        DW S    cs:CS16®16        ,FLATSEG;>> INTAFh
        DW S    cs:INTB0hÿ16      ,FLATSEG;>> INTB0h
        DW S    cs:INTB1hÿ16      ,FLATSEG;>> INTB1h
        DW S    cs:INTB2hÿ16      ,FLATSEG;>> INTB2h
        DW S    cs:INTB3hÿ16      ,FLATSEG;>> INTB3h
IDTÿ16ÿSIZE     EQU     (cs:$ - cs:iFâM32ùIDTÿ16) / 4

iFâM32ùservice          LABEL   DWORD
iFâM32ùserviceÿ32       LABEL   DWORD
        DW S    cs:termineÿlÿapplicationÿiFâM32,FLATSEG
        DW S    cs:fonctionÿinvalideÿ32,FLATSEG
        DW S    cs:initialiseÿlaÿpileÿ32ùbit,FLATSEG
        DW S    cs:INTB0hÿ32ÿfunctionÿ3,FLATSEG
        DW S    cs:INTB0hÿ32ÿfunctionÿ4,FLATSEG
        DW S    cs:INTB0hÿ32ÿfunctionÿ5,FLATSEG
        DW S    cs:INTB0hÿ32ÿfunctionÿ6,FLATSEG
        DW S    cs:INTB0hÿ32ÿfunctionÿ7,FLATSEG
        DW S    cs:INTB0hÿ32ÿfunctionÿ8,FLATSEG
        DD 125-9 DUP (0)
        DW S    cs:INTB0hÿ32ÿfunctionÿ125,FLATSEG
        DW S    cs:INTB0hÿ32ÿfunctionÿ126,FLATSEG
        DW S    cs:INTB0hÿ32ÿfunctionÿ127,FLATSEG
        
iFâM32ùserviceÿ16       LABEL DWORD
        DW S    cs:passeÿenÿcodeÿ32ùbit,FLATSEG
        DW S    cs:alloueÿunÿEMB,FLATSEG
        DW S    cs:installeÿlaÿpileÿ32ùbit,FLATSEG
        DW S    cs:‚muleÿINTB0hÿ32,FLATSEG
        DW S    cs:‚muleÿINTB0hÿ32,FLATSEG
        DW S    cs:‚muleÿINTB0hÿ32,FLATSEG
        DW S    cs:‚muleÿINTB0hÿ32,FLATSEG
        DW S    cs:‚muleÿINTB0hÿ32,FLATSEG
        DW S    cs:‚muleÿINTB0hÿ32,FLATSEG
        DD 125-9 DUP (0)
        DW S    cs:‚muleÿINTB0hÿ32,FLATSEG
        DW S    cs:‚muleÿINTB0hÿ32,FLATSEG
        DW S    cs:‚muleÿINTB0hÿ32,FLATSEG
           
FREEÿBLOCKÿMETHODS      LABEL   DWORD
                DD      O cs:requestÿanotherÿfreeÿblockÿ?
                DD      O cs:expandÿupÿtheÿnewÿfreeÿblock
                DD      O cs:expandÿdownÿtheÿnewÿfreeÿblock
USEDÿBLOCKÿMETHODS      LABEL   DWORD
                DD      O cs:invalidÿblock
                DD      O cs:cannotÿexpandÿupÿthisÿblock
                DD      O cs:cannotÿexpandÿdownÿthisÿblock
LASTÿBLOCKÿMETHODS      LABEL   DWORD
                DD      O cs:invalidÿblock
                DD      O cs:cannotÿexpandÿupÿthisÿblock
                DD      O cs:cannotÿexpandÿdownÿthisÿblock
 
DS32SEG ENDS
            
STUBSEG SEGMENT
ASSUME  cs:FLATSEG,ds:FLATSEG
            
finÿdeÿr‚sident LABEL
            
d‚buteÿiFâM32:
        push    es
        pop     fs
        mov     ax,cs
        mov     ds,ax
            
estÿceÿunÿmicroprocesseurÿ32ùbit?:      
        pushfw
        pushfw
        pop     ax
        or      ax,08000h
        push    ax
        popfw
        pushfw
        pop     ax
        popfw
        and     ax,08000h
        mov     dx,O cs:ceÿnÿestÿpasÿunÿmicroprocesseurÿ32ùbit
        jne     retourneÿauÿDOS
        smsw    ax
        and     al,1
        mov     dx,O cs:leÿmicroprocesseurÿnÿestÿpasÿenÿmodeÿr‚el
        je      okÿleÿmicroprocesseurÿestÿenÿmodeÿr‚el
        jmp     retourneÿauÿDOS
            
okÿleÿmicroprocesseurÿestÿenÿmodeÿr‚el:
        mov     dx,O cs:copyright
        mov     ah,9
        int     21h
        cmp     B fs:[S 80h],0
        mov     dx,O cs:donneÿlaÿsyntaxeÿdÿutilisation
        je      retourneÿauÿDOS
            
        mov     ax,43FFh
        int     2Fh
        cmp     eax,"iFRM"
        mov     dx,O cs:iFâM32ÿestÿd‚j…ÿinstall‚
        je      retourneÿauÿDOS
        call    initialiseÿiFâM32
            
chercheÿlÿapplicationÿiFâM32:   
        mov     ax,ss
        mov     es,ax
        mov     ds,ax
        cld 
        sub     sp,33
        mov     si,O fs:[S 82h]
        mov     di,sp
        xor     bx,bx
        mov     cl,33
@@0:    lods    B fs:[si]
        mov     dl,al
        cmp     al,"@"
        je      @@8
        cmp     al,32 ; ® SPACE ¯
        je      @@3
        cmp     al,09 ; ® TAB ¯
        je      @@3
        cmp     al,13 ; ® ENTER ¯
        je      @@3
        or      bx,bx
        je      @@1
        inc     bx
@@1:    cmp     al,"."
        jnz     @@2
        mov     bx,1                    
@@2:    stosb
        dec     cl
        jnz     @@0
@@3:    or      bx,bx
        je      @@4
        cmp     bx,4
        jbe     @@5
@@4:    mov     eax,"exe."
        stosd
@@5:    mov     B [di],0
        mov     al,dl
        mov     dx,sp
        sub     sp,33
        xor     bx,bx
        mov     bp,sp
        mov     di,sp
        inc     di
@@6:    cmp     al,13 ; ® ENTER ¯
        stosb
        je      @@7
        inc     bx
        lods    B fs:[si]
        jmp     @@6
@@7:    mov     [bp],bl
        sub     sp,14
        mov     bx,sp
        xor     eax,eax
        mov     00[bx],ax
        mov     02[bx],bp
        mov     04[bx],ss
        mov     06[bx],eax
        mov     10[bx],eax
        jmp     chargeÿlÿapplicationÿiFâM32
@@8:    mov     ax,cs
        mov     ds,ax
        call    CS16®16ÿTINY
        mov     ah,9
        mov     dx,O cs:iFâM32ÿestÿinstall‚
        int     21h
        mov     es,fs:[2Ch]
        mov     ah,49h
        int     21h
        mov     ax,fs
        mov     dx,ss
        sub     dx,ax
        mov     ax,3100h
        int     21h
            
initialiseÿiFâM32:
        xor     eax,eax
        mov     ax,cs
        shl     eax,4
        add     [S iFâM32ùGDTPÿBASE],eax
        add     [S iFâM32ùIDTPÿ32ÿBASE],eax
        add     [S iFâM32ùGDTEÿCS32].GDTEÿBASE,eax
        add     [S iFâM32ùGDTEÿCS16].GDTEÿBASE,eax
        add     [S iFâM32ùGDTEÿFLAT].GDTEÿBASE,eax
        add     [S iFâM32ùGDTEÿCODE].GDTEÿBASE,eax
        add     [S iFâM32ùGDTEÿDATA].GDTEÿBASE,eax
        push    S 3002h
        popfw
        lidt    iFâM32ùIDTPÿ16

;COMMENT ~
v‚rifieÿlaÿpr‚senceÿdeÿHIMEMùSYS:
        mov     ax,4300h
        int     2Fh                       
        cmp     al,80h                    
        jne     installeÿlesÿinterruptions

okÿilÿestÿpr‚sent:
        or      B [S iFâM32ùstateÿhiúhi],01000000b

demandeÿlÿadresseÿduÿ®handler¯ÿXMSÿ…ÿappeler:
        mov     ax,4310h
        int     2Fh                         
        mov     W [S iFâM32ùXMMÿhandlerúOFS],bx
        mov     W [S iFâM32ùXMMÿhandlerúSEG],es                        
        mov     dx,O cs:compatibleÿXMSÿd‚tect‚
        mov     ah,9
        int     21h

libŠreÿlocalementÿlaÿligneÿdÿadresseÿA20:
        mov     ah,5
        call    [S iFâM32ùXMMÿhandler]
;~

installeÿlesÿinterruptions:
        call    ‚changeÿlaÿtableÿdesÿinterruptionsÿ16ùbit

passeÿenÿmodeÿr‚elÿplat:
        call    CS16®16ÿFLAT
        test    B [S iFâM32ùstateÿhiúhi],01000000b
        je      d‚termineÿlaÿm‚moireÿtotaleÿdisponible

        call    v‚rifieÿlaÿligneÿdÿadresseÿA20
        je      laÿligneÿdÿadresseÿA20ÿestÿactiv‚e
        jmp     laÿligneÿdÿadresseÿA20ÿnÿaÿpuÿˆtreÿlib‚r‚e

laÿligneÿdÿadresseÿA20ÿestÿlib‚r‚e?:
        call    v‚rifieÿlaÿligneÿdÿadresseÿA20
        je      laÿligneÿdÿadresseÿA20ÿestÿactiv‚e

        call    m‚thodeÿPSÿpourÿlib‚rerÿlaÿligneÿdÿadresseÿA20
        je      laÿligneÿdÿadresseÿA20ÿestÿactiv‚e
        
        call    m‚thodeÿATÿpourÿlib‚rerÿlaÿligneÿdÿadresseÿA20
        je      laÿligneÿdÿadresseÿA20ÿestÿactiv‚e
        
laÿligneÿdÿadresseÿA20ÿnÿaÿpuÿˆtreÿlib‚r‚e:
        or      B [S iFâM32ùstateÿhiúhi],00100000b

laÿligneÿdÿadresseÿA20ÿestÿactiv‚e:
        test    B [S iFâM32ùstateÿhiúhi],01000000b
        je      @@0
        mov     ah,6
        call    [S iFâM32ùXMMÿhandler]
@@0:    sti
        retn

d‚termineÿlaÿm‚moireÿtotaleÿdisponible:
        xor     esi,esi
        mov     dx,O cs:compatibleÿXMSÿnonÿd‚tect‚
        mov     ah,9
        int     21h             
        mov     al,98h
        out     70h,al
        out     4Fh,al
        in      al,71h
        mov     ah,al
        mov     al,97h
        out     70h,al
        out     4Fh,al
        in      al,71h
        and     eax,0FFFFh
        mov     cx,ax
        shl     eax,10
        shr     cx,10
        mov     dx,O cs:m‚gaÿoctet
        mov     S iFâM32ùEMBÿsize,eax
        mov     ah,9
@@0:    int     21h
        loop    @@0
        mov     dx,O cs:finÿdeÿligne
        int     21h
        jmp     laÿligneÿdÿadresseÿA20ÿestÿlib‚r‚e?

ceÿnÿestÿpasÿunÿmicroprocesseurÿ32ùbit:
        DB " Error : iFâM32 requires a 32-bit CPU like a 80386 or above !",13,10,'$'
leÿmicroprocesseurÿnÿestÿpasÿenÿmodeÿr‚el:
        DB " Error : DPMI or VCPI are not supported : iFâM32 can not run",13,10
        DB "         under virtual mode (V86) and only supports raw or XMS",13,10
        DB "         memory when HIMEM is present. So remove any other memory",13,10
        DB "         manager, please !"
finÿdeÿligne:
        DB 13,10,'$'
compatibleÿXMSÿd‚tect‚:
        DB " XMS memory available ! ",13,10,'$'         
compatibleÿXMSÿnonÿd‚tect‚:
        DB " raw memory available (Mb) : ş$"            
m‚gaÿoctet:
        DB "ş$"
iFâM32ÿestÿinstall‚:
        DB 10,13," iFâM32 stays resident !",13,10,'$'
iFâM32ÿestÿd‚j…ÿinstall‚:
        DB 10,13," iFâM32 is already resident !",13,10,'$'
donneÿlaÿsyntaxeÿdÿutilisation:
        DB " Usage: iFRM32 ® [path]file-name[.extension] ¯ ® [arguments] ¯",13,10
        DB "  where the file is such an executable as must run under iFâM32.",13,10
        DB "  The path and extension of the file are optional. If no extension",13,10
        DB "  is given, ® .exe ¯ will be the default one.",13,10,10,'$'
STUBSEG ENDS
        END     cs:d‚buteÿiFâM32
