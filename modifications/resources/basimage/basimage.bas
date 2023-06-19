'==================
'BASIMAGE.BAS v0.21
'==================
'Coded by Dav for QB64GL 1.4, MAY/2020

'=-=-=-=
'ABOUT :
'=-=-=-=

'BASIMAGE lets you easily put images INSIDE your QB64 compiled programs.
'It does this by loading an image, then converting the screen memory to
'BAS code that you can add to your programs.  When you run the code, it
'recreates the data to an image handle you can use with _PUTIMAGE.

'BASIMAGE will ask you for an image load, and the BAS file to create.

'=========================================================================
'Modified by loopy750, JUNE 2023
'=========================================================================

DefInt A-Z
DECLARE FUNCTION E$ (B$)

Print
Print "=============="
Print "BASIMAGE v0.21"
Print "=============="
Print

If Command$(1) <> "" Then
    IN$ = Command$(1)
    OUT$ = IN$ + ".MEM"
Else
    Input "IMAGE File to load --> ", IN$
    Input "BAS File to make ----> ", OUT$: If OUT$ = "" Then End
End If

'Load image file to screen mode
Screen _LoadImage(IN$, 32): Sleep 1
Dim m As _MEM: m = _MemImage(0)

'Grab screen data
INDATA$ = Space$(m.SIZE)
_MemGet m, m.OFFSET, INDATA$
'Compress it
INDATA$ = _Deflate$(INDATA$)
'get screen specs
wid = _Width: hih = _Height

Screen 0

Open OUT$ For Output As 2
Print: Print "Converting image to BAS code...";

Q$ = Chr$(34) 'quotation mark
Screen _NewImage(600, 600, 32)
pic& = BASIMAGE1&
_PutImage (0, 0), pic&

Print #2, "'EXAMPLE USAGE OF BASIMAGE1&"
Print #2, "'==========================="
Print #2, "'SCREEN _NEWIMAGE(600, 600, 32)"
Print #2, "'pic& = BASIMAGE1&: _PUTIMAGE (0, 0), pic&"
Print #2, ""
Print #2, "FUNCTION BASIMAGE1& '"; IN$
Print #2, "v&=_NEWIMAGE("; wid; ","; hih; ",32)"
Print #2, "DIM m AS _MEM:m=_MEMIMAGE(v&)"
Print #2, "A$ = "; Q$; Q$
Print #2, "A$ = A$ + "; Q$;

BC& = 1

Do
    a$ = Mid$(INDATA$, BC&, 3)
    BC& = BC& + 3: LL& = LL& + 4
    If LL& = 60 Then
        LL& = 0
        Print #2, E$(a$);: Print #2, Q$
        Print #2, "A$ = A$ + "; Q$;
    Else
        Print #2, E$(a$);
    End If
    If Len(INDATA$) - BC& < 3 Then
        ' loopy750: added code
        a$ = Mid$(INDATA$, BC&, 3)
        BC& = BC& + 3: LL& = LL& + 4
        Print #2, E$(a$) + Q$;
        Exit Do ' exit now because the code below isn't required
        '
        a$ = Mid$(INDATA$, Len(INDATA$) - BC&, 1): B$ = E$(a$)
        Select Case Len(B$)
            Case 0: a$ = Q$
            Case 1: a$ = "%%%" + B$ + Q$
            Case 2: a$ = "%%" + B$ + Q$
            Case 3: a$ = "%" + B$ + Q$
        End Select: Print #2, a$;: Exit Do
    End If
Loop: Print #2, ""

Print #2, "btemp$="; Q$; Q$
Print #2, "FOR i&=1TO LEN(A$) STEP 4:B$=MID$(A$,i&,4)"
Print #2, "IF INSTR(1,B$,"; Q$; "%"; Q$; ") THEN"
Print #2, "FOR C%=1 TO LEN(B$):F$=MID$(B$,C%,1)"
Print #2, "IF F$<>"; Q$; "%"; Q$; "THEN C$=C$+F$"
Print #2, "NEXT:B$=C$:END IF:FOR j=1 TO LEN(B$)"
Print #2, "IF MID$(B$,j,1)="; Q$; "#"; Q$; " THEN"
Print #2, "MID$(B$,j)="; Q$; "@"; Q$; ":END IF:NEXT"
Print #2, "FOR t%=LEN(B$) TO 1 STEP-1"
Print #2, "B&=B&*64+ASC(MID$(B$,t%))-48"
Print #2, "NEXT:X$="; Q$; Q$; ":FOR t%=1 TO LEN(B$)-1"
Print #2, "X$=X$+CHR$(B& AND 255):B&=B&\256"
Print #2, "NEXT:btemp$=btemp$+X$:NEXT"
Print #2, "btemp$=_INFLATE$(btemp$)"
Print #2, "_MEMPUT m, m.OFFSET, btemp$: _MEMFREE m"
Print #2, "BASIMAGE1& = _COPYIMAGE(v&): _FREEIMAGE v&"
Print #2, "END FUNCTION"

Print "Done!"
Print UCase$(OUT$); " saved."
If Command$(1) = "" Then Sleep 3
System

Function E$ (B$)

    For T% = Len(B$) To 1 Step -1
        B& = B& * 256 + Asc(Mid$(B$, T%))
    Next

    a$ = ""
    For T% = 1 To Len(B$) + 1
        g$ = Chr$(48 + (B& And 63)): B& = B& \ 64
        'If @ is here, replace it with #
        'To fix problem posting code in the QB64 forum.
        'It'll be restored during the decoding process.
        If g$ = "@" Then g$ = "#"
        a$ = a$ + g$
    Next: E$ = a$

End Function

