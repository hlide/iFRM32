; FONT: Western European > OEM-US
                                .386P
                                LOCALS

B                               EQU     <BYTE PTR>
W                               EQU     <WORD PTR>
D                               EQU     <DWORD PTR>
O                               EQU     <OFFSET>
with                            EQU     <PASCAL,>
ligneúdeúcommande               EQU     <ds:[80h]>
                                
code                            SEGMENT USE16 PARA
d‚butúdeúcode                   LABEL
                                ASSUME  cs:code, ds:code
                                ORG     100h
commenceúici:                   cld
                                call    afficheútexte with O messageúdúaccueil
                                mov     sp, ((finúdeúcode - d‚butúdeúcode) + 128)
                                mov     bx, ((finúdeúcode - d‚butúdeúcode) + 143) / 16
                                mov     ah, 4Ah
                                int     21h
                                mov     ah, 48h
                                mov     bx, 4096
                                int     21h
                                jnc     okúpourúleúsegment
                                mov     dx, O erreurúdeúm‚moire                 
                                jmp     quitteúl…
okúpourúleúsegment:             mov     W segmentútampon, ax
                                cmp     B ligneúdeúcommande, 0
                                jne     okúr‚cupŠreúleúfichier
                                mov     dx, O syntaxeúdúutilisation
                                jmp     quitteúl…       
okúr‚cupŠreúleúfichier:         call    lisúcommande with O nomúduúfichierú…ú®patcher¯
                                call    ouvreúfichier with O nomúduúfichierú…ú®patcher¯, 2
                                jnc     @@0
                                mov     dx, O leúfichierú…ú®patcher¯?
                                jmp     quitteúl…
@@0:                            mov     W num‚roúduúfichierú…ú®patcher¯, ax
                                mov     ds, segmentútampon
                                ASSUME  ds:NOTHING
                                call    afficheútexte with O rechercheúlesúmarqueurs
rechercheúunúmarqueur:          mov     di, O marqueur
                                mov     bx, num‚roúduúfichierú…ú®patcher¯
lisúunúblocú…ú®scanner¯:        xor     si, si
                                mov     cx, 0FFFFh
                                mov     dx, si
                                mov     ah, 3Fh
                                int     21h
                                mov     cx, ax
continueúlaúrecherche:          cmp     si, cx
                                jz      finúduúblocú…ú®scanner¯
                                cmpsb
                                jz      okúpourúleúmarqueur
                                inc     positionúduúblocú…ú®patcher¯
                                mov     di, O marqueur
                                jmp     continueúlaúrecherche
okúpourúleúmarqueur:            inc     positionúduúblocú…ú®patcher¯
                                cmp     B -1[si], " "
                                jnz     continueúlaúrecherche                            
                                push    cx si
                                call    afficheútexte with O marqueurútrouv‚
                                mov     edx, positionúduúblocú…ú®patcher¯
                                shld    ecx, edx, 16
                                mov     ax, 4200h
                                int     21h
                                mov     ax, cs
                                mov     ds, ax
                                ASSUME  ds:code
                                mov     dx, O nomúduúfichierú…úinclure
                                mov     si, dx
                                mov     cx, 1
@@0:                            mov     ah, 3Fh
                                int     21h
                                lodsb
                                inc     dx
                                or      al, al
                                jnz     @@0
                                call    ouvreúfichier with O nomúduúfichierú…úinclure,0
                                jnc     @@1
                                call    afficheútexte with O leúfichierú…úinclure?
                                mov     ds, segmentútampon
                                jmp     passeúauúfichierúsuivant
@@1:                            mov     W num‚roúduúfichierú…úinclure, ax
                                mov     B -1[si], "$"
                                call    afficheútexte with O inclusionúenúcours
                                call    afficheútexte with O nomúduúfichierú…úinclure
                                mov     bx, num‚roúduúfichierú…ú®patcher¯
                                mov     ah, 3Fh
                                mov     cx, 8
                                mov     dx, O positionúduúblocú…úinclure
                                int     21h
                                mov     bx, num‚roúduúfichierú…úinclure
                                mov     edx, D positionúduúblocú…úinclure
                                shld    ecx, edx, 16
                                mov     ax, 4200h
                                int     21h
                                sub     D positionúduúblocú…ú®patcher¯, 7
                                mov     bx, num‚roúduúfichierú…ú®patcher¯
                                mov     edx, D positionúduúblocú…ú®patcher¯
                                shld    ecx, edx, 16
                                mov     ax, 4200h
                                int     21h
                                mov     eax, D longueurúduúblocú…úinclure
                                or      eax,eax
                                je      plusúdeúbloc
                                shld    edx,eax,16
                                mov     cx, 0FFFFh
                                div     cx
                                mov     cx,ax
                                shl     ecx,16
                                mov     cx,dx
                                xor     eax, eax
                                mov     ds, segmentútampon
                                ASSUME  ds:NOTHING
lisúunúblocú…úinclure:          call    afficheútexte with O point
                                mov     bx, num‚roúduúfichierú…úinclure
                                xor     dx, dx
                                mov     ah, 3Fh
                                int     21h
                                cmp     ax, cx
                                je      copieúleúbloc
                                call    afficheútexte with O lectureúincomplŠte
                                jmp     passeúauúfichierúsuivant
copieúleúbloc:                  mov     bx, num‚roúduúfichierú…ú®patcher¯
                                xor     dx, dx
                                mov     ah, 40h
                                int     21h
                                jnc     passeúauúblocúsuivant
                                call    fermeúfichier with num‚roúduúfichierú…ú®patcher¯
                                call    fermeúfichier with num‚roúduúfichierú…úinclure
                                pop     si cx
                                mov     dx, O erreurúdú‚criture
                                jmp     quitteúl…
passeúauúblocúsuivant:          and     ecx, 0FFFF0000h
                                je      plusúdeúbloc
                                dec     ecx
                                jmp     lisúunúblocú…úinclure
plusúdeúbloc:                   call    afficheútexte with O ok
passeúauúfichierúsuivant:       call    fermeúfichier with num‚roúduúfichierú…úinclure
                                mov     edx, positionúduúblocú…ú®patcher¯
                                mov     bx, num‚roúduúfichierú…ú®patcher¯
                                shld    ecx, edx, 16
                                mov     ax, 4200h
                                int     21h
                                pop     si cx
                                jmp     rechercheúunúmarqueur
finúduúblocú…ú®scanner¯:        cmp     cx, 0FFFFh
                                jz      lisúunúblocú…ú®scanner¯
                                call    fermeúfichier with bx
                                mov     dx, O finúduúfichier
quitteúl…:                      call    afficheútexte with dx
                                mov     es, segmentútampon
                                mov     ah, 49h
                                int     21h
                                mov     ax, 4C00h
                                int     21h

                                ASSUME  ds:code
afficheútexte:                  push    bp ds
                                mov     bp, sp
                                mov     ax, cs
                                mov     dx, 6[bp]
                                mov     ds, ax
                                mov     ah, 9
                                int     21h
                                pop     ds bp
                                retn    2       
        
lisúcommande:                   push    bp
                                mov     bp, sp
                                mov     si, 82h ; le fichier … ®patcher¯ dans la ligne de commande
                                mov     di, 4[bp]
                                xor     bx, bx
                                mov     cl, 33
caractŠreúsuivant:              lodsb
                                cmp     al, " "
                                jz      finúdeúnom
                                cmp     al, 9
                                jz      finúdeúnom
                                cmp     al, 13
                                jz      finúdeúnom
                                or      bx, bx
                                jz      @@0
                                inc     bx
@@0:                            cmp     al, "."
                                jnz     @@1
                                mov     bx, 1                   
@@1:                            stosb
                                dec     cl
                                jnz     caractŠreúsuivant
finúdeúnom:                     or      bx, bx
                                jz      @@0
                                cmp     bx, 4
                                jbe     okúpourúlúextension
@@0:                            mov     bx, ax
                                mov     eax,"exe."
                                stosd
                                mov     ax, bx
okúpourúlúextension:            pop     bp
                                retn    2

ouvreúfichier:                  push    bp
                                mov     bp, sp
                                mov     ah, 3Dh
                                mov     dx, 6[bp]
                                mov     al, 4[bp]
                                int     21h
                                pop     bp
                                retn    4

fermeúfichier:                  push    bp
                                mov     bp, sp
                                mov     ah, 3Eh
                                mov     bx, 4[bp]
                                int     21h
                                pop     bp
                                retn    2

finúdeúligne                    EQU     <13,10>
finúdeútexte                    EQU     <13,10,'$'>
messageúdúaccueil               DB " HPatch v1.0 - ® Huge Files Patcher ¯ by Christophe AVOINNE - FREEWARE",finúdeútexte
syntaxeúdúutilisation           DB " Usage: HPatch [chemin]nom du fichier … ® patcher ¯[.extension]",    finúdeúligne,10
                                DB "  o— le fichier … ® patcher ¯ est le fichier … modifier contenant",  finúdeúligne
                                DB "  le ou les marqueurs ""HPatch "" suivi du nom du fichier … inclure",finúdeúligne
                                DB "  partiellement: aprŠs le nom du fichier, un double-mot indique …",  finúdeúligne
                                DB "  partir de quelle adresse logique de ce fichier commence le bloc",  finúdeúligne
                                DB "  … inclure dans le fichier … modifier;  un autre double-mot suit",  finúdeúligne
                                DB "  pour indiquer le nombre d'octet … copier. Le chemin et l'exten-",  finúdeúligne
                                DB "  sion du fichier … modifier sont facultatifs."                   ,  finúdeúligne
                                DB "  Si l'extension est omise, ® .exe ¯ est prise par d‚faut."       ,  finúdeútexte
   
leúfichierú…ú®patcher¯?         DB " Impossible d'ouvrir le fichier … modifier!", finúdeútexte
leúfichierú…úinclure?           DB " Impossible d'ouvrir le fichier … inclure!", finúdeútexte
erreurúdeúm‚moire               DB " Pas assez de m‚moire libre!",finúdeútexte
rechercheúlesúmarqueurs         DB " Recherche des marqueurs...",finúdeútexte
finúduúfichier                  DB " Modification termin‚e.",finúdeútexte
marqueurútrouv‚                 DB " Marqueur trouv‚! recherche du fichier … inclure:",finúdeútexte
inclusionúenúcours              DB " Inclusion en cours du fichier $"
point                           DB ".$"
lectureúincomplŠte              DB " Lecture incomplŠte!",finúdeútexte
erreurúdú‚criture               DB " Erreur d'‚criture!",finúdeútexte
ok                              DB " Ok! ",finúdeútexte
marqueur                        DB "HPatch "
                                ORG (($ - d‚butúdeúcode + 1) SHL 1) SHR 1
segmentútampon                  DW ?

num‚roúduúfichierú…ú®patcher¯   DW ?
num‚roúduúfichierú…úinclure     DW ?
positionúduúblocú…ú®patcher¯    DD 0
positionúduúblocú…úinclure      DD 0
longueurúduúblocú…úinclure      DD 0
nomúduúfichierú…ú®patcher¯      LABEL   BYTE
nomúduúfichierú…úinclure        DB 34 DUP (0)
finúdeúcode                     LABEL
code                            ENDS
                                END     commenceúici
