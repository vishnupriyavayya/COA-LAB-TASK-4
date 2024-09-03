org 100h             ; Set starting address

mov ax,0013h ;Load AX with 5678h
mov bx,0013h      ; Load BX with 1234h
mul bx               ; Multiply AX by BX, result in DX:AX

mov bx, ax           ; Move the lower 16 bits of the result (AX) into BX

; Convert and print the high nibble of BH
mov ah, bh           ; Move BH (high byte of BX) to AH
shr ah, 4            ; Shift right to isolate the high nibble
add ah, 30h          ; Convert to ASCII '0'-'9'
cmp ah, 39h          ; Compare with '9'
jle print_high_nibble ; If less than or equal, skip next step
add ah, 7            ; Adjust to ASCII 'A'-'F'

print_high_nibble:
mov dl, ah           ; Move the ASCII value to DL
mov ah, 02h          ; Set up for printing
int 21h              ; Print the high nibble of BH

; Convert and print the low nibble of BH
mov ah, bh           ; Move BH back to AH
and ah, 0fh          ; Mask the high nibble, keep the low nibble
add ah, 30h          ; Convert to ASCII '0'-'9'
cmp ah, 39h          ; Compare with '9'
jle print_low_nibble ; If less than or equal, skip next step
add ah, 7            ; Adjust to ASCII 'A'-'F'

print_low_nibble:
mov dl, ah           ; Move the ASCII value to DL
mov ah, 02h          ; Set up for printing
int 21h              ; Print the low nibble of BH

; Convert and print the high nibble of BL
mov ah, bl           ; Move BL (low byte of BX) to AH
shr ah, 4            ; Shift right to isolate the high nibble
add ah, 30h          ; Convert to ASCII '0'-'9'
cmp ah, 39h          ; Compare with '9'
jle print_high_nibble2 ; If less than or equal, skip next step
add ah, 7            ; Adjust to ASCII 'A'-'F'

print_high_nibble2:
mov dl, ah           ; Move the ASCII value to DL
mov ah, 02h          ; Set up for printing
int 21h              ; Print the high nibble of BL

; Convert and print the low nibble of BL
mov ah, bl           ; Move BL back to AH
and ah, 0fh          ; Mask the high nibble, keep the low nibble
add ah, 30h          ; Convert to ASCII '0'-'9'
cmp ah, 39h          ; Compare with '9'
jle print_low_nibble2 ; If less than or equal, skip next step
add ah, 7            ; Adjust to ASCII 'A'-'F'

print_low_nibble2:
mov dl, ah           ; Move the ASCII value to DL
mov ah, 02h          ; Set up for printing
int 21h              ; Print the low nibble of BL

; Terminate the program
mov ah, 4ch          ; Set up for program termination
int 21h              ; Terminate the program