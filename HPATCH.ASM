; FONT: Western European > OEM-US
                                .386P
                                LOCALS

B                               EQU     <BYTE PTR>
W                               EQU     <WORD PTR>
D                               EQU     <DWORD PTR>
O                               EQU     <OFFSET>
with                            EQU     <PASCAL,>
ligne�de�commande               EQU     <ds:[80h]>
                                
code                            SEGMENT USE16 PARA
d�but�de�code                   LABEL
                                ASSUME  cs:code, ds:code
                                ORG     100h
commence�ici:                   cld
                                call    affiche�texte with O message�d�accueil
                                mov     sp, ((fin�de�code - d�but�de�code) + 128)
                                mov     bx, ((fin�de�code - d�but�de�code) + 143) / 16
                                mov     ah, 4Ah
                                int     21h
                                mov     ah, 48h
                                mov     bx, 4096
                                int     21h
                                jnc     ok�pour�le�segment
                                mov     dx, O erreur�de�m�moire                 
                                jmp     quitte�l�
ok�pour�le�segment:             mov     W segment�tampon, ax
                                cmp     B ligne�de�commande, 0
                                jne     ok�r�cup�re�le�fichier
                                mov     dx, O syntaxe�d�utilisation
                                jmp     quitte�l�       
ok�r�cup�re�le�fichier:         call    lis�commande with O nom�du�fichier����patcher�
                                call    ouvre�fichier with O nom�du�fichier����patcher�, 2
                                jnc     @@0
                                mov     dx, O le�fichier����patcher�?
                                jmp     quitte�l�
@@0:                            mov     W num�ro�du�fichier����patcher�, ax
                                mov     ds, segment�tampon
                                ASSUME  ds:NOTHING
                                call    affiche�texte with O recherche�les�marqueurs
recherche�un�marqueur:          mov     di, O marqueur
                                mov     bx, num�ro�du�fichier����patcher�
lis�un�bloc����scanner�:        xor     si, si
                                mov     cx, 0FFFFh
                                mov     dx, si
                                mov     ah, 3Fh
                                int     21h
                                mov     cx, ax
continue�la�recherche:          cmp     si, cx
                                jz      fin�du�bloc����scanner�
                                cmpsb
                                jz      ok�pour�le�marqueur
                                inc     position�du�bloc����patcher�
                                mov     di, O marqueur
                                jmp     continue�la�recherche
ok�pour�le�marqueur:            inc     position�du�bloc����patcher�
                                cmp     B -1[si], " "
                                jnz     continue�la�recherche                            
                                push    cx si
                                call    affiche�texte with O marqueur�trouv�
                                mov     edx, position�du�bloc����patcher�
                                shld    ecx, edx, 16
                                mov     ax, 4200h
                                int     21h
                                mov     ax, cs
                                mov     ds, ax
                                ASSUME  ds:code
                                mov     dx, O nom�du�fichier���inclure
                                mov     si, dx
                                mov     cx, 1
@@0:                            mov     ah, 3Fh
                                int     21h
                                lodsb
                                inc     dx
                                or      al, al
                                jnz     @@0
                                call    ouvre�fichier with O nom�du�fichier���inclure,0
                                jnc     @@1
                                call    affiche�texte with O le�fichier���inclure?
                                mov     ds, segment�tampon
                                jmp     passe�au�fichier�suivant
@@1:                            mov     W num�ro�du�fichier���inclure, ax
                                mov     B -1[si], "$"
                                call    affiche�texte with O inclusion�en�cours
                                call    affiche�texte with O nom�du�fichier���inclure
                                mov     bx, num�ro�du�fichier����patcher�
                                mov     ah, 3Fh
                                mov     cx, 8
                                mov     dx, O position�du�bloc���inclure
                                int     21h
                                mov     bx, num�ro�du�fichier���inclure
                                mov     edx, D position�du�bloc���inclure
                                shld    ecx, edx, 16
                                mov     ax, 4200h
                                int     21h
                                sub     D position�du�bloc����patcher�, 7
                                mov     bx, num�ro�du�fichier����patcher�
                                mov     edx, D position�du�bloc����patcher�
                                shld    ecx, edx, 16
                                mov     ax, 4200h
                                int     21h
                                mov     eax, D longueur�du�bloc���inclure
                                or      eax,eax
                                je      plus�de�bloc
                                shld    edx,eax,16
                                mov     cx, 0FFFFh
                                div     cx
                                mov     cx,ax
                                shl     ecx,16
                                mov     cx,dx
                                xor     eax, eax
                                mov     ds, segment�tampon
                                ASSUME  ds:NOTHING
lis�un�bloc���inclure:          call    affiche�texte with O point
                                mov     bx, num�ro�du�fichier���inclure
                                xor     dx, dx
                                mov     ah, 3Fh
                                int     21h
                                cmp     ax, cx
                                je      copie�le�bloc
                                call    affiche�texte with O lecture�incompl�te
                                jmp     passe�au�fichier�suivant
copie�le�bloc:                  mov     bx, num�ro�du�fichier����patcher�
                                xor     dx, dx
                                mov     ah, 40h
                                int     21h
                                jnc     passe�au�bloc�suivant
                                call    ferme�fichier with num�ro�du�fichier����patcher�
                                call    ferme�fichier with num�ro�du�fichier���inclure
                                pop     si cx
                                mov     dx, O erreur�d��criture
                                jmp     quitte�l�
passe�au�bloc�suivant:          and     ecx, 0FFFF0000h
                                je      plus�de�bloc
                                dec     ecx
                                jmp     lis�un�bloc���inclure
plus�de�bloc:                   call    affiche�texte with O ok
passe�au�fichier�suivant:       call    ferme�fichier with num�ro�du�fichier���inclure
                                mov     edx, position�du�bloc����patcher�
                                mov     bx, num�ro�du�fichier����patcher�
                                shld    ecx, edx, 16
                                mov     ax, 4200h
                                int     21h
                                pop     si cx
                                jmp     recherche�un�marqueur
fin�du�bloc����scanner�:        cmp     cx, 0FFFFh
                                jz      lis�un�bloc����scanner�
                                call    ferme�fichier with bx
                                mov     dx, O fin�du�fichier
quitte�l�:                      call    affiche�texte with dx
                                mov     es, segment�tampon
                                mov     ah, 49h
                                int     21h
                                mov     ax, 4C00h
                                int     21h

                                ASSUME  ds:code
affiche�texte:                  push    bp ds
                                mov     bp, sp
                                mov     ax, cs
                                mov     dx, 6[bp]
                                mov     ds, ax
                                mov     ah, 9
                                int     21h
                                pop     ds bp
                                retn    2       
        
lis�commande:                   push    bp
                                mov     bp, sp
                                mov     si, 82h ; le fichier � �patcher� dans la ligne de commande
                                mov     di, 4[bp]
                                xor     bx, bx
                                mov     cl, 33
caract�re�suivant:              lodsb
                                cmp     al, " "
                                jz      fin�de�nom
                                cmp     al, 9
                                jz      fin�de�nom
                                cmp     al, 13
                                jz      fin�de�nom
                                or      bx, bx
                                jz      @@0
                                inc     bx
@@0:                            cmp     al, "."
                                jnz     @@1
                                mov     bx, 1                   
@@1:                            stosb
                                dec     cl
                                jnz     caract�re�suivant
fin�de�nom:                     or      bx, bx
                                jz      @@0
                                cmp     bx, 4
                                jbe     ok�pour�l�extension
@@0:                            mov     bx, ax
                                mov     eax,"exe."
                                stosd
                                mov     ax, bx
ok�pour�l�extension:            pop     bp
                                retn    2

ouvre�fichier:                  push    bp
                                mov     bp, sp
                                mov     ah, 3Dh
                                mov     dx, 6[bp]
                                mov     al, 4[bp]
                                int     21h
                                pop     bp
                                retn    4

ferme�fichier:                  push    bp
                                mov     bp, sp
                                mov     ah, 3Eh
                                mov     bx, 4[bp]
                                int     21h
                                pop     bp
                                retn    2

fin�de�ligne                    EQU     <13,10>
fin�de�texte                    EQU     <13,10,'$'>
message�d�accueil               DB " HPatch v1.0 - � Huge Files Patcher � by Christophe AVOINNE - FREEWARE",fin�de�texte
syntaxe�d�utilisation           DB " Usage: HPatch [chemin]nom du fichier � � patcher �[.extension]",    fin�de�ligne,10
                                DB "  o� le fichier � � patcher � est le fichier � modifier contenant",  fin�de�ligne
                                DB "  le ou les marqueurs ""HPatch "" suivi du nom du fichier � inclure",fin�de�ligne
                                DB "  partiellement: apr�s le nom du fichier, un double-mot indique �",  fin�de�ligne
                                DB "  partir de quelle adresse logique de ce fichier commence le bloc",  fin�de�ligne
                                DB "  � inclure dans le fichier � modifier;  un autre double-mot suit",  fin�de�ligne
                                DB "  pour indiquer le nombre d'octet � copier. Le chemin et l'exten-",  fin�de�ligne
                                DB "  sion du fichier � modifier sont facultatifs."                   ,  fin�de�ligne
                                DB "  Si l'extension est omise, � .exe � est prise par d�faut."       ,  fin�de�texte
   
le�fichier����patcher�?         DB " Impossible d'ouvrir le fichier � modifier!", fin�de�texte
le�fichier���inclure?           DB " Impossible d'ouvrir le fichier � inclure!", fin�de�texte
erreur�de�m�moire               DB " Pas assez de m�moire libre!",fin�de�texte
recherche�les�marqueurs         DB " Recherche des marqueurs...",fin�de�texte
fin�du�fichier                  DB " Modification termin�e.",fin�de�texte
marqueur�trouv�                 DB " Marqueur trouv�! recherche du fichier � inclure:",fin�de�texte
inclusion�en�cours              DB " Inclusion en cours du fichier $"
point                           DB ".$"
lecture�incompl�te              DB " Lecture incompl�te!",fin�de�texte
erreur�d��criture               DB " Erreur d'�criture!",fin�de�texte
ok                              DB " Ok! ",fin�de�texte
marqueur                        DB "HPatch "
                                ORG (($ - d�but�de�code + 1) SHL 1) SHR 1
segment�tampon                  DW ?

num�ro�du�fichier����patcher�   DW ?
num�ro�du�fichier���inclure     DW ?
position�du�bloc����patcher�    DD 0
position�du�bloc���inclure      DD 0
longueur�du�bloc���inclure      DD 0
nom�du�fichier����patcher�      LABEL   BYTE
nom�du�fichier���inclure        DB 34 DUP (0)
fin�de�code                     LABEL
code                            ENDS
                                END     commence�ici
