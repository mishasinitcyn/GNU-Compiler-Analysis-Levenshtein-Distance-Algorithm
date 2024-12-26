levenshtein_distance:
        push    r15
        push    r14
        push    r13
        push    r12
        push    rbp
        push    rbx
        sub     rsp, 56
        mov     QWORD PTR [rsp+8], rdi
        mov     r14, rsi
        call    strlen
        mov     r15, rax
        mov     QWORD PTR [rsp+24], rax
        mov     rdi, r14
        call    strlen
        mov     rbp, rax
        mov     QWORD PTR [rsp+16], rax
        mov     ebx, eax
        mov     eax, r15d
        inc     eax
        cdqe
        sal     rax, 3
        mov     QWORD PTR [rsp+32], rax
        mov     rdi, rax
        call    malloc
        mov     r12, rax
        test    r15d, r15d
        js      .L2
        lea     r13d, [rbp+1]
        movsx   r13, r13d
        sal     r13, 2
        mov     rbp, r12
        mov     ecx, r15d
        lea     r15, [r12+8+rcx*8]
        mov     QWORD PTR [rsp+40], rcx
.L3:
        mov     rdi, r13
        call    malloc
        mov     QWORD PTR [rbp+0], rax
        add     rbp, 8
        cmp     rbp, r15
        jne     .L3
        mov     rcx, QWORD PTR [rsp+40]
        mov     eax, 0
.L4:
        mov     rdx, QWORD PTR [r12+rax*8]
        mov     DWORD PTR [rdx], eax
        mov     rdx, rax
        inc     rax
        cmp     rcx, rdx
        jne     .L4
        cmp     DWORD PTR [rsp+16], 0
        js      .L5
.L21:
        mov     rdx, QWORD PTR [r12]
        mov     eax, 0
.L6:
        mov     DWORD PTR [rdx+rax*4], eax
        inc     rax
        cmp     ebx, eax
        jge     .L6
.L5:
        mov     rax, QWORD PTR [rsp+24]
        test    eax, eax
        jle     .L7
        mov     rdi, r12
        mov     r9, QWORD PTR [rsp+8]
        lea     eax, [rax-1]
        lea     r10, [r12+8+rax*8]
        mov     rax, QWORD PTR [rsp+16]
        lea     eax, [rax-1]
        lea     rbp, [4+rax*4]
        mov     DWORD PTR [rsp+8], ebx
        jmp     .L8
.L32:
        mov     rsi, QWORD PTR [rdi]
        mov     r8d, DWORD PTR [rsi+rax]
        mov     rsi, QWORD PTR [rdi+8]
        mov     DWORD PTR [rsi+rdx], r8d
        jmp     .L10
.L11:
        mov     ebx, DWORD PTR [rsi+rax]
        lea     r15d, [r11+1]
        lea     esi, [rbx+1]
        cmp     r11d, ebx
        cmovl   esi, r15d
.L13:
        mov     DWORD PTR [r8+rdx], esi
.L10:
        inc     rcx
        add     rax, 4
        add     rdx, 4
        cmp     rax, rbp
        je      .L18
.L15:
        cmp     r13b, BYTE PTR [rcx]
        je      .L32
        mov     rsi, QWORD PTR [rdi]
        mov     ebx, DWORD PTR [rsi+rdx]
        mov     r8, QWORD PTR [rdi+8]
        mov     r11d, DWORD PTR [r8+rax]
        cmp     ebx, r11d
        jge     .L11
        mov     r11d, DWORD PTR [rsi+rax]
        lea     r15d, [rbx+1]
        lea     esi, [r11+1]
        cmp     ebx, r11d
        cmovl   esi, r15d
        jmp     .L13
.L18:
        add     rdi, 8
        inc     r9
        cmp     rdi, r10
        je      .L16
.L8:
        cmp     DWORD PTR [rsp+8], 0
        jle     .L18
        movzx   r13d, BYTE PTR [r9]
        mov     rcx, r14
        mov     edx, 4
        mov     eax, 0
        jmp     .L15
.L7:
        movsx   rdx, DWORD PTR [rsp+16]
        mov     rax, QWORD PTR [rsp+32]
        mov     rax, QWORD PTR [r12-8+rax]
        mov     r13d, DWORD PTR [rax+rdx*4]
        cmp     DWORD PTR [rsp+24], 0
        js      .L19
        jmp     .L23
.L2:
        cmp     DWORD PTR [rsp+16], 0
        jns     .L21
        movsx   rax, DWORD PTR [rsp+16]
        mov     rcx, QWORD PTR [rsp+32]
        mov     rdx, QWORD PTR [r12-8+rcx]
        mov     r13d, DWORD PTR [rdx+rax*4]
        jmp     .L19
.L16:
        movsx   rdx, DWORD PTR [rsp+16]
        mov     rax, QWORD PTR [rsp+32]
        mov     rax, QWORD PTR [r12-8+rax]
        mov     r13d, DWORD PTR [rax+rdx*4]
.L23:
        mov     rbx, r12
        mov     eax, DWORD PTR [rsp+24]
        lea     rbp, [r12+8+rax*8]
.L20:
        mov     rdi, QWORD PTR [rbx]
        call    free
        add     rbx, 8
        cmp     rbp, rbx
        jne     .L20
.L19:
        mov     rdi, r12
        call    free
        mov     eax, r13d
        add     rsp, 56
        pop     rbx
        pop     rbp
        pop     r12
        pop     r13
        pop     r14
        pop     r15
        ret