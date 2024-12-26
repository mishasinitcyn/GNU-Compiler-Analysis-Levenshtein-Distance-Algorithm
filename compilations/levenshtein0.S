levenshtein_distance:
        push    rbp
        mov     rbp, rsp
        push    rbx
        sub     rsp, 56
        mov     QWORD PTR [rbp-56], rdi
        mov     QWORD PTR [rbp-64], rsi
        mov     rax, QWORD PTR [rbp-56]
        mov     rdi, rax
        call    strlen
        mov     DWORD PTR [rbp-28], eax
        mov     rax, QWORD PTR [rbp-64]
        mov     rdi, rax
        call    strlen
        mov     DWORD PTR [rbp-32], eax
        mov     eax, DWORD PTR [rbp-28]
        inc     eax
        cdqe
        sal     rax, 3
        mov     rdi, rax
        call    malloc
        mov     QWORD PTR [rbp-40], rax
        mov     DWORD PTR [rbp-20], 0
        jmp     .L2
.L3:
        mov     eax, DWORD PTR [rbp-32]
        inc     eax
        cdqe
        sal     rax, 2
        mov     edx, DWORD PTR [rbp-20]
        movsx   rdx, edx
        lea     rcx, [0+rdx*8]
        mov     rdx, QWORD PTR [rbp-40]
        lea     rbx, [rcx+rdx]
        mov     rdi, rax
        call    malloc
        mov     QWORD PTR [rbx], rax
        inc     DWORD PTR [rbp-20]
.L2:
        mov     eax, DWORD PTR [rbp-20]
        cmp     eax, DWORD PTR [rbp-28]
        jle     .L3
        mov     DWORD PTR [rbp-20], 0
        jmp     .L4
.L5:
        mov     eax, DWORD PTR [rbp-20]
        cdqe
        lea     rdx, [0+rax*8]
        mov     rax, QWORD PTR [rbp-40]
        add     rax, rdx
        mov     rax, QWORD PTR [rax]
        mov     edx, DWORD PTR [rbp-20]
        mov     DWORD PTR [rax], edx
        inc     DWORD PTR [rbp-20]
.L4:
        mov     eax, DWORD PTR [rbp-20]
        cmp     eax, DWORD PTR [rbp-28]
        jle     .L5
        mov     DWORD PTR [rbp-24], 0
        jmp     .L6
.L7:
        mov     rax, QWORD PTR [rbp-40]
        mov     rdx, QWORD PTR [rax]
        mov     eax, DWORD PTR [rbp-24]
        cdqe
        sal     rax, 2
        add     rax, rdx
        mov     edx, DWORD PTR [rbp-24]
        mov     DWORD PTR [rax], edx
        inc     DWORD PTR [rbp-24]
.L6:
        mov     eax, DWORD PTR [rbp-24]
        cmp     eax, DWORD PTR [rbp-32]
        jle     .L7
        mov     DWORD PTR [rbp-20], 1
        jmp     .L8
.L19:
        mov     DWORD PTR [rbp-24], 1
        jmp     .L9
.L18:
        mov     eax, DWORD PTR [rbp-20]
        cdqe
        lea     rdx, [rax-1]
        mov     rax, QWORD PTR [rbp-56]
        add     rax, rdx
        movzx   edx, BYTE PTR [rax]
        mov     eax, DWORD PTR [rbp-24]
        cdqe
        lea     rcx, [rax-1]
        mov     rax, QWORD PTR [rbp-64]
        add     rax, rcx
        movzx   eax, BYTE PTR [rax]
        cmp     dl, al
        jne     .L10
        mov     eax, DWORD PTR [rbp-20]
        cdqe
        sal     rax, 3
        lea     rdx, [rax-8]
        mov     rax, QWORD PTR [rbp-40]
        add     rax, rdx
        mov     rdx, QWORD PTR [rax]
        mov     eax, DWORD PTR [rbp-24]
        cdqe
        sal     rax, 2
        sub     rax, 4
        add     rdx, rax
        mov     eax, DWORD PTR [rbp-20]
        cdqe
        lea     rcx, [0+rax*8]
        mov     rax, QWORD PTR [rbp-40]
        add     rax, rcx
        mov     rcx, QWORD PTR [rax]
        mov     eax, DWORD PTR [rbp-24]
        cdqe
        sal     rax, 2
        add     rax, rcx
        mov     edx, DWORD PTR [rdx]
        mov     DWORD PTR [rax], edx
        jmp     .L11
.L10:
        mov     eax, DWORD PTR [rbp-20]
        cdqe
        sal     rax, 3
        lea     rdx, [rax-8]
        mov     rax, QWORD PTR [rbp-40]
        add     rax, rdx
        mov     rdx, QWORD PTR [rax]
        mov     eax, DWORD PTR [rbp-24]
        cdqe
        sal     rax, 2
        add     rax, rdx
        mov     edx, DWORD PTR [rax]
        mov     eax, DWORD PTR [rbp-20]
        cdqe
        lea     rcx, [0+rax*8]
        mov     rax, QWORD PTR [rbp-40]
        add     rax, rcx
        mov     rcx, QWORD PTR [rax]
        mov     eax, DWORD PTR [rbp-24]
        cdqe
        sal     rax, 2
        sub     rax, 4
        add     rax, rcx
        mov     eax, DWORD PTR [rax]
        cmp     edx, eax
        jge     .L12
        mov     eax, DWORD PTR [rbp-20]
        cdqe
        sal     rax, 3
        lea     rdx, [rax-8]
        mov     rax, QWORD PTR [rbp-40]
        add     rax, rdx
        mov     rdx, QWORD PTR [rax]
        mov     eax, DWORD PTR [rbp-24]
        cdqe
        sal     rax, 2
        add     rax, rdx
        mov     edx, DWORD PTR [rax]
        mov     eax, DWORD PTR [rbp-20]
        cdqe
        sal     rax, 3
        lea     rcx, [rax-8]
        mov     rax, QWORD PTR [rbp-40]
        add     rax, rcx
        mov     rcx, QWORD PTR [rax]
        mov     eax, DWORD PTR [rbp-24]
        cdqe
        sal     rax, 2
        sub     rax, 4
        add     rax, rcx
        mov     eax, DWORD PTR [rax]
        cmp     edx, eax
        jge     .L13
        mov     eax, DWORD PTR [rbp-20]
        cdqe
        sal     rax, 3
        lea     rdx, [rax-8]
        mov     rax, QWORD PTR [rbp-40]
        add     rax, rdx
        mov     rdx, QWORD PTR [rax]
        mov     eax, DWORD PTR [rbp-24]
        cdqe
        sal     rax, 2
        add     rax, rdx
        mov     eax, DWORD PTR [rax]
        inc     eax
        jmp     .L15
.L13:
        mov     eax, DWORD PTR [rbp-20]
        cdqe
        sal     rax, 3
        lea     rdx, [rax-8]
        mov     rax, QWORD PTR [rbp-40]
        add     rax, rdx
        mov     rdx, QWORD PTR [rax]
        mov     eax, DWORD PTR [rbp-24]
        cdqe
        sal     rax, 2
        sub     rax, 4
        add     rax, rdx
        mov     eax, DWORD PTR [rax]
        inc     eax
        jmp     .L15
.L12:
        mov     eax, DWORD PTR [rbp-20]
        cdqe
        lea     rdx, [0+rax*8]
        mov     rax, QWORD PTR [rbp-40]
        add     rax, rdx
        mov     rdx, QWORD PTR [rax]
        mov     eax, DWORD PTR [rbp-24]
        cdqe
        sal     rax, 2
        sub     rax, 4
        add     rax, rdx
        mov     edx, DWORD PTR [rax]
        mov     eax, DWORD PTR [rbp-20]
        cdqe
        sal     rax, 3
        lea     rcx, [rax-8]
        mov     rax, QWORD PTR [rbp-40]
        add     rax, rcx
        mov     rcx, QWORD PTR [rax]
        mov     eax, DWORD PTR [rbp-24]
        cdqe
        sal     rax, 2
        sub     rax, 4
        add     rax, rcx
        mov     eax, DWORD PTR [rax]
        cmp     edx, eax
        jge     .L16
        mov     eax, DWORD PTR [rbp-20]
        cdqe
        lea     rdx, [0+rax*8]
        mov     rax, QWORD PTR [rbp-40]
        add     rax, rdx
        mov     rdx, QWORD PTR [rax]
        mov     eax, DWORD PTR [rbp-24]
        cdqe
        sal     rax, 2
        sub     rax, 4
        add     rax, rdx
        mov     eax, DWORD PTR [rax]
        inc     eax
        jmp     .L15
.L16:
        mov     eax, DWORD PTR [rbp-20]
        cdqe
        sal     rax, 3
        lea     rdx, [rax-8]
        mov     rax, QWORD PTR [rbp-40]
        add     rax, rdx
        mov     rdx, QWORD PTR [rax]
        mov     eax, DWORD PTR [rbp-24]
        cdqe
        sal     rax, 2
        sub     rax, 4
        add     rax, rdx
        mov     eax, DWORD PTR [rax]
        inc     eax
.L15:
        mov     edx, DWORD PTR [rbp-20]
        movsx   rdx, edx
        lea     rcx, [0+rdx*8]
        mov     rdx, QWORD PTR [rbp-40]
        add     rdx, rcx
        mov     rcx, QWORD PTR [rdx]
        mov     edx, DWORD PTR [rbp-24]
        movsx   rdx, edx
        sal     rdx, 2
        add     rdx, rcx
        mov     DWORD PTR [rdx], eax
.L11:
        inc     DWORD PTR [rbp-24]
.L9:
        mov     eax, DWORD PTR [rbp-24]
        cmp     eax, DWORD PTR [rbp-32]
        jle     .L18
        inc     DWORD PTR [rbp-20]
.L8:
        mov     eax, DWORD PTR [rbp-20]
        cmp     eax, DWORD PTR [rbp-28]
        jle     .L19
        mov     eax, DWORD PTR [rbp-28]
        cdqe
        lea     rdx, [0+rax*8]
        mov     rax, QWORD PTR [rbp-40]
        add     rax, rdx
        mov     rdx, QWORD PTR [rax]
        mov     eax, DWORD PTR [rbp-32]
        cdqe
        sal     rax, 2
        add     rax, rdx
        mov     eax, DWORD PTR [rax]
        mov     DWORD PTR [rbp-44], eax
        mov     DWORD PTR [rbp-20], 0
        jmp     .L20
.L21:
        mov     eax, DWORD PTR [rbp-20]
        cdqe
        lea     rdx, [0+rax*8]
        mov     rax, QWORD PTR [rbp-40]
        add     rax, rdx
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    free
        inc     DWORD PTR [rbp-20]
.L20:
        mov     eax, DWORD PTR [rbp-20]
        cmp     eax, DWORD PTR [rbp-28]
        jle     .L21
        mov     rax, QWORD PTR [rbp-40]
        mov     rdi, rax
        call    free
        mov     eax, DWORD PTR [rbp-44]
        mov     rbx, QWORD PTR [rbp-8]
        leave
        ret