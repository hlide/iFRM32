; FONT: Western European > OEM-US
;������������������������������������������������������������������������������
;������������������������������������������������������������������������������
;������������������������������������������������������������������������������
;������������������������������������������������������������������������������
;������������������������������������������������������������������������������
;������������������������������������������������������������������������������
;������������������������������������������������������������������������������
;         �
;         � �������      ������        ��������           ��������� �
;         : �������  �����  ���� �����     ������������� ���� � ����:      
;         � ��� ���� ��  �   ��� ��  � ������� ��  ��  � ���     ���|
; ��������� ���   ��� ���    ���  ���  �������� ��� ���  ���     �����������Ŀ
; | �n �XAMPL� of ASS�MBLY SOU�C� using � HPatch � for including DATA FIL�S! �
; :                       �y CH�STOPH� AVO���� 95-96                        |
; �                           ��� V��SION 1.0 ���                            :
;
;������������������������������������������������������������������������������
;������������������������������������������������������������������������������
;������������������������������������������������������������������������������
;������������������������������������������������������������������������������
;������������������������������������������������������������������������������
;������������������������������������������������������������������������������
;������������������������������������������������������������������������������
;
;             Source & Co�e �y Christophe AVOINN� (HLIDE), 95 - 96
;                                    - * -
;
; INSTRUCTIONS FOR USE:
; To slow down or speed up the zooming of � RoToZooM! �, press :
; - � down-arrow � or � up-arrow �
; To slow down or speed up or invert the rotating, press :
; - � left-arrow � or � right-arrow �
; To choose the number of text directions, press :
; - between � 1 � to � 9 �
; 
; To do a pause, press � TAB � so long as you want a pause
; To escape, press � ESC �.
; 
;   NOTE: the greater will the number of text directions be, the more important
;   will the flicking of the screen be !
;
;������������������������������������������������������������������������������
;������������������������������������������������������������������������������
;������������������������������������������������������������������������������
;������������������������������������������������������������������������������
;������������������������������������������������������������������������������
;������������������������������������������������������������������������������
;������������������������������������������������������������������������������

        .386P
        LOCALS
        
B       EQU     <BYTE PTR>
W       EQU     <WORD PTR>
D       EQU     <DWORD PTR>
O       EQU     <OFFSET>

ANGL�   EQU     <W angle-2>
Z��M    EQU     <W zoom-2>
D�LTA   EQU     <W delta-2>
D�LTAX  EQU     <W deltaX-2>
D�LTAY  EQU     <W deltaY-2>
D�LTAZ  EQU     <B deltaz-1>
END�OIT EQU     <W endroit-2>
VI�UX   EQU     <D vieux-4>
ST�PS   EQU     <W steps-2>
KOVNT   EQU     <W count-2>
EK�AN   EQU     0A000h

ASSUME  cs:K�D�;M�SIK
K�D�    SEGMENT USE16
d�but:  mov     ax,IMAG�
        mov     ds,ax
        in      al,21h
        out     4Fh,al
        or      al,2
        out     21h,al
        cld
        mov     ax,EK�AN
        mov     es,ax
        mov     ax,13h
        int     10h 
        mov     dx,3C8h
        mov     al,0
        mov     si,O palette
        out     dx,al
        mov     dl,0C9h
        mov     cx,300h
        rep     outs dx,B cs:[si]
        mov     di,0*320+32
        mov     eax,3020100h
@@1:    mov     cl,200
@@2:    mov     es:[di],eax
        add     di,1*320+0
        dec     cx
        jnz     @@2
        sub     di,200*320-4
        add     eax,04040404h
        jnc     @@1
        mov     bp,128
        mov     di,36*320+96
@@3:    mov     cx,20h
        rep     stosd
        add     di,192
        dec     bp
        jnz     @@3
        mov     D es:[0*320+0],7F7F7F7Fh
        mov     dx,3DAh
        in      al,dx
        and     al,8
        jz      $-3
        in      al,dx
        and     al,8
        jnz     $-3
        mov     cx,64
@@4:    mov     bp,0
angle   LABEL
        shr     bp,8
        mov     bh,SIN[bp]
        mov     ah,COS[bp]
        sar     bx,8
        sar     ax,8
        imul    bx,cx
        imul    ax,cx
        push    bx ax
        sar     bx,5
        sar     ax,5
        call    R�T�Z�M
        mov     cx,64
zoom    LABEL   
        pop     ax bx
        mov     di,320
        sar     bx,10
        sar     ax,10
        imul    di,bx
        add     di,ax
        mov     B es:[di][100*320+160],7Fh
        sub     D es:[0*320+0],01010101h
        add     cx,1
deltaz  LABEL
        cmp     cx,250
        jae     @@5
        cmp     cx,32
        ja      @@6
@@5:    neg     D�LTAZ
@@6:    add     ANGL�,(256/2)*256
delta   LABEL
        in      al,60h
        add     END�OIT,255*2+3
        cmp     al,1
        mov     Z��M,cx
        jnz     @@7
        mov     ax,3
        int     10h
        in      al,21h
        out     4Fh,al
        and     al,-3
        out     21h,al
        mov     ax,4C00h
        int     21h
@@7:    cmp     al,75
        jb      @@11
        jnz     @@8
        sub     D�LTA,128
        jmp     @@4
@@8:    cmp     al,77
        jnz     @@9
        add     D�LTA,128
        jmp     @@4
@@9:    cmp     al,72
        jnz     @@10
        inc     D�LTAZ
        jmp     @@4
@@10:   cmp     al,80
        jnz     @@11
        dec     D�LTAZ
        jmp     @@4
@@11:   cmp     al,2
        jbe     @@12
        cmp     al,10
        ja      @@13
        mov     dl,al
        mov     ax,256
        dec     dl
        div     dl
        xchg    al,ah
        mov     D�LTA,ax
        jmp     @@4
@@12:   cmp     al,2
        jne     @@4
        mov     D�LTA,0
        jmp     @@4
@@13:   cmp     al,15
        jnz     @@4
@@14:   in      al,60h
        cmp     al,15
        jz      @@14
        jmp     @@4
R�T�Z�M:mov     bp,64
        mov     di,O @@1[EV�N]
        mov     cx,ax
        mov     dx,bx
        mov     D�LTAX,ax
        mov     D�LTAY,bx
        mov     si,bx
@@0:    mov     bl,ah
        mov     cs:[di],bx
        add     ax,cx
        add     si,dx
        mov     bx,si
        mov     bl,ah
        mov     cs:ODD[di],bx
        add     ax,cx
        add     si,dx
        add     di,N�XT
        dec     bp
        mov     bx,si
        jnz     @@0
        mov     di,36*320+96
        mov     si,END�OIT
        mov     bp,dx
        mov     dx,3C8h
;       mov     al,0
;       out     dx,al
;       inc     dx
;       out     dx,al
;       out     dx,al
;       out     dx,al
        mov     dl,0DAh
        in      al,dx
        and     al,8
        jz      $-3
        in      al,dx
        and     al,8
        jnz     $-3
        mov     dl,0C8h
        out     dx,al
        inc     dx
        mov     ax,Z��M
        shr     ax,2
        out     dx,al
        shr     al,2
        out     dx,al
        xor     ax,ax
        out     dx,al
        mov     dx,bp
        mov     bp,128
@@1:    mov     ax,es:[di]
        add     al,ds:[si]["C�"]
EV�N    EQU     $-@@1-2
        add     ah,ds:[si]["C�"]
ODD     EQU     $-@@1-2-EV�N
        shr     ax,1
        and     al,7Fh
        stosw
N�XT    EQU     $-@@1
        REPT 63
        mov     ax,es:[di]
        add     al,ds:[si]["C�"]
        add     ah,ds:[si]["C�"]
        shr     ax,1
        and     al,7Fh
        stosw
        ENDM
        mov     si,"C�"
deltaX  LABEL
        mov     bx,"C�"
deltaY  LABEL
        mov     ax,"C�"
endroit LABEL
        sub     al,bh
        xchg    si,ax
        mov     al,0
        add     si,ax
        add     D�LTAX,cx
        add     D�LTAY,dx
        add     di,192
        dec     bp
        jnz     @@1
        retn
SIN     DB      0,3,6,9,12,16,19,22,25,28,31,34,37,40,43,46
        DB      49,52,54,57,60,63,66,68,71,73,76,78,81,83,86,88
        DB      90,92,94,96,98,100,102,104,106,108,109,111,112,114,115,116
        DB      118,119,120,121,122,123,123,124,125,125,126,126,126,127,127,127
COS     DB      127,127,127,127,126,126,125,125,124,124,123,122,121,120,119,118
        DB      117,116,114,113,112,110,108,107,105,103,101,99,97,95,93,91
        DB      89,87,84,82,80,77,75,72,69,67,64,61,59,56,53,50
        DB      47,44,41,39,36,32,29,26,23,20,17,14,11,8,5,2
        DB      -1,-4,-7,-10,-14,-17,-20,-23,-26,-29,-32,-35,-38,-41,-44,-47
        DB      -50,-53,-55,-58,-61,-64,-66,-69,-72,-74,-77,-79,-82,-84,-86,-88
        DB      -91,-93,-95,-97,-99,-101,-103,-104,-106,-108,-109,-111,-112,-114,-115,-116
        DB      -118,-119,-120,-121,-122,-122,-123,-124,-124,-125,-125,-126,-126,-126,-126,-126
        DB      -126,-126,-126,-126,-126,-125,-125,-124,-124,-123,-122,-121,-120,-119,-118,-117
        DB      -116,-115,-113,-112,-110,-109,-107,-105,-104,-102,-100,-98,-96,-94,-92,-90
        DB      -87,-85,-83,-80,-78,-75,-73,-70,-68,-65,-62,-60,-57,-54,-51,-48
        DB      -45,-42,-39,-37,-34,-30,-27,-24,-21,-18,-15,-12,-9,-6,-3,-1
        DB      0,3,6,9,12,16,19,22,25,28,31,34,37,40,43,46
        DB      49,52,54,57,60,63,66,68,71,73,76,78,81,83,86,88
        DB      90,92,94,96,98,100,102,104,106,108,109,111,112,114,115,116
        DB      118,119,120,121,122,123,123,124,125,125,126,126,126,127,127,127

palette DB      "HPatch rotozoom.pic",0
        DD      0
        DD      768
        DB      768 - ($ - O palette) DUP (0)
K�D�    ENDS
ST�CK   SEGMENT STACK USE16 'STACK'
        DB      128 DUP (0)
ST�CK   ENDS
IMAG�   SEGMENT USE32
image   DB      "HPatch rotozoom.pic",0
        DD      768
        DD      65536
        DB      65536 - ($ - O image) DUP (0)
IMAG�   ENDS    
        END     K�D�:d�but
        