.equ SCREEN_WIDTH,   640
.equ SCREEN_HEIGHT,   480
.equ BITS_PER_PIXEL, 32

.equ mpelota1a,          0x0000      // Color #000000
.equ mpelota1b,          0x0000      // Color #000000
.equ mpelota2a,          0xCA63      // Color #FFFFFF
.equ mpelota2b,          0x0066      // Color #FFFFFF
.equ mpelota3a,          0x0000      // Color #000000
.equ mpelota3b,          0x0000      // Color #000000
.equ mpelota4a,          0xCA63      // Color #FFFFFF
.equ mpelota4b,          0x0066      // Color #FFFFFF
.equ mpelota5a,          0x0000      // Color #000000
.equ mpelota5b,          0x0000      // Color #000000
.equ mpelota6a,          0xCA63      // Color #FFFFFF
.equ mpelota6b,          0x0066      // Color #FFFFFF
.equ mpelota7a,          0x0000      // Color #000000
.equ mpelota7b,          0x0000      // Color #000000
.equ mpelota8a,          0xCA63      // Color #FFFFFF
.equ mpelota8b,          0x0066      // Color #FFFFFF
.equ mpelota9a,          0x0000      // Color #000000
.equ mpelota9b,          0x0000      // Color #000000
.equ mpelota10a,         0xCA63      // Color #FFFFFF
.equ mpelota10b,         0x0066      // Color #FFFFFF
.equ mpelota11a,         0x0000      // Color #FFFFFF
.equ mpelota11b,         0x0000      // Color #FFFFFF
.equ mpelota12a,         0xCA63      // Color #FFFFFF
.equ mpelota12b,         0x0066      // Color #FFFFFF
.equ mpelota13a,         0x0000      // Color #FFFFFF
.equ mpelota13b,         0x0000      // Color #FFFFFF
.equ mpelota14a,         0xCA63      // Color #FFFFFF
.equ mpelota14b,         0x0066      // Color #FFFFFF
.equ mpelota15a,         0x0000      // Color #FFFFFF
.equ mpelota15b,         0x0000      // Color #FFFFFF
.equ mpelota16a,         0xCA63      // Color #FFFFFF
.equ mpelota16b,         0x0066      // Color #FFFFFF

delay1:
    movz x3 , 0x01000, lsl 16 // 0x0200 ideal time
    l1:
    sub x3, x3, 1
    cbnz x3, l1
    br lr

pintar_mpelota1:
        // Configurar color del círculo en x13 (blanco)
        movz x13, mpelota1a, lsl 00
        movk x13, mpelota1b, lsl 16

        // Coordenadas del círculo
        .equ CIRCULO_CENTRO_X, 300
        .equ CIRCULO_CENTRO_Y, 410
        .equ CIRCULO_RADIO, 50

        // Dibujar el círculo
        mov x3, CIRCULO_CENTRO_Y - CIRCULO_RADIO   // Y actual
    draw_mpelota1_loop:
        cmp x3, CIRCULO_CENTRO_Y + CIRCULO_RADIO
        b.gt end_draw_mpelota1
        mov x4, CIRCULO_CENTRO_X - CIRCULO_RADIO   // X actual

    draw_mpelota1_row:
        cmp x4, CIRCULO_CENTRO_X + CIRCULO_RADIO
        b.gt next_mpelota1_row

        // Calcular la distancia desde el centro
        sub x5, x4, CIRCULO_CENTRO_X
        mul x5, x5, x5
        sub x6, x3, CIRCULO_CENTRO_Y
        mul x6, x6, x6
        add x5, x5, x6

        // Comprobar si el punto está dentro del círculo
        mov x6, CIRCULO_RADIO
        mul x6, x6, x6
        cmp x5, x6
        b.gt skip_mpelota1

        // Dibujar píxel del círculo
        mov x1, SCREEN_WIDTH
        mul x7, x3, x1             // Y * SCREEN_WIDTH
        add x7, x7, x4             // (Y * SCREEN_WIDTH) + X
        lsl x7, x7, 2              // Dirección de memoria = Dirección base + 4 * índice
        add x7, x20, x7            // Agregar dirección base
        stur w13, [x7]             // Colorear el pixel con el color del círculo

    skip_mpelota1:
        add x4, x4, 1              // Incrementar X
        b draw_mpelota1_row

    next_mpelota1_row:
        add x3, x3, 1              // Incrementar Y
        b draw_mpelota1_loop

    end_draw_mpelota1:
        ret

pintar_mpelota2:
        // Configurar color del círculo en x13 (blanco)
        movz x13, mpelota2a, lsl 00
        movk x13, mpelota2b, lsl 16

        // Coordenadas del círculo
        .equ CIRCULO_CENTRO_X, 300
        .equ CIRCULO_CENTRO_Y, 410
        .equ CIRCULO_RADIO, 45

        // Dibujar el círculo
        mov x3, CIRCULO_CENTRO_Y - CIRCULO_RADIO   // Y actual
    draw_mpelota2_loop2:
        cmp x3, CIRCULO_CENTRO_Y + CIRCULO_RADIO
        b.gt end_draw_mpelota2
        mov x4, CIRCULO_CENTRO_X - CIRCULO_RADIO   // X actual

    draw_mpelota2_row2:
        cmp x4, CIRCULO_CENTRO_X + CIRCULO_RADIO
        b.gt next_mpelota2_row2

        // Calcular la distancia desde el centro
        sub x5, x4, CIRCULO_CENTRO_X
        mul x5, x5, x5
        sub x6, x3, CIRCULO_CENTRO_Y
        mul x6, x6, x6
        add x5, x5, x6

        // Comprobar si el punto está dentro del círculo
        mov x6, CIRCULO_RADIO
        mul x6, x6, x6
        cmp x5, x6
        b.gt skip_mpelota2

        // Dibujar píxel del círculo
        mov x1, SCREEN_WIDTH
        mul x7, x3, x1             // Y * SCREEN_WIDTH
        add x7, x7, x4             // (Y * SCREEN_WIDTH) + X
        lsl x7, x7, 2              // Dirección de memoria = Dirección base + 4 * índice
        add x7, x20, x7            // Agregar dirección base
        stur w13, [x7]             // Colorear el pixel con el color del círculo

    skip_mpelota2:
        add x4, x4, 1              // Incrementar X
        b draw_mpelota2_row2

    next_mpelota2_row2:
        add x3, x3, 1              // Incrementar Y
        b draw_mpelota2_loop2

    end_draw_mpelota2:
        ret

pintar_mpelota3:
        // Configurar color del círculo en x13 (blanco)
        movz x13, mpelota3a, lsl 00
        movk x13, mpelota3b, lsl 16

        // Coordenadas del círculo
        .equ CIRCULO_CENTRO_X, 400
        .equ CIRCULO_CENTRO_Y, 410
        .equ CIRCULO_RADIO, 50

        // Dibujar el círculo
        mov x3, CIRCULO_CENTRO_Y - CIRCULO_RADIO   // Y actual
    draw_mpelota3_loop:
        cmp x3, CIRCULO_CENTRO_Y + CIRCULO_RADIO
        b.gt end_draw_mpelota3
        mov x4, CIRCULO_CENTRO_X - CIRCULO_RADIO   // X actual

    draw_mpelota3_row:
        cmp x4, CIRCULO_CENTRO_X + CIRCULO_RADIO
        b.gt next_mpelota3_row

        // Calcular la distancia desde el centro
        sub x5, x4, CIRCULO_CENTRO_X
        mul x5, x5, x5
        sub x6, x3, CIRCULO_CENTRO_Y
        mul x6, x6, x6
        add x5, x5, x6

        // Comprobar si el punto está dentro del círculo
        mov x6, CIRCULO_RADIO
        mul x6, x6, x6
        cmp x5, x6
        b.gt skip_mpelota3

        // Dibujar píxel del círculo
        mov x1, SCREEN_WIDTH
        mul x7, x3, x1             // Y * SCREEN_WIDTH
        add x7, x7, x4             // (Y * SCREEN_WIDTH) + X
        lsl x7, x7, 2              // Dirección de memoria = Dirección base + 4 * índice
        add x7, x20, x7            // Agregar dirección base
        stur w13, [x7]             // Colorear el pixel con el color del círculo

    skip_mpelota3:
        add x4, x4, 1              // Incrementar X
        b draw_mpelota3_row

    next_mpelota3_row:
        add x3, x3, 1              // Incrementar Y
        b draw_mpelota3_loop

    end_draw_mpelota3:
        ret

pintar_mpelota4:
        // Configurar color del círculo en x13 (blanco)
        movz x13, mpelota4a, lsl 00
        movk x13, mpelota4b, lsl 16

        // Coordenadas del círculo
        .equ CIRCULO_CENTRO_X, 400
        .equ CIRCULO_CENTRO_Y, 410
        .equ CIRCULO_RADIO, 45

        // Dibujar el círculo
        mov x3, CIRCULO_CENTRO_Y - CIRCULO_RADIO   // Y actual
    draw_mpelota4_loop2:
        cmp x3, CIRCULO_CENTRO_Y + CIRCULO_RADIO
        b.gt end_draw_mpelota4
        mov x4, CIRCULO_CENTRO_X - CIRCULO_RADIO   // X actual

    draw_mpelota4_row2:
        cmp x4, CIRCULO_CENTRO_X + CIRCULO_RADIO
        b.gt next_mpelota4_row2

        // Calcular la distancia desde el centro
        sub x5, x4, CIRCULO_CENTRO_X
        mul x5, x5, x5
        sub x6, x3, CIRCULO_CENTRO_Y
        mul x6, x6, x6
        add x5, x5, x6

        // Comprobar si el punto está dentro del círculo
        mov x6, CIRCULO_RADIO
        mul x6, x6, x6
        cmp x5, x6
        b.gt skip_mpelota4

        // Dibujar píxel del círculo
        mov x1, SCREEN_WIDTH
        mul x7, x3, x1             // Y * SCREEN_WIDTH
        add x7, x7, x4             // (Y * SCREEN_WIDTH) + X
        lsl x7, x7, 2              // Dirección de memoria = Dirección base + 4 * índice
        add x7, x20, x7            // Agregar dirección base
        stur w13, [x7]             // Colorear el pixel con el color del círculo

    skip_mpelota4:
        add x4, x4, 1              // Incrementar X
        b draw_mpelota4_row2

    next_mpelota4_row2:
        add x3, x3, 1              // Incrementar Y
        b draw_mpelota4_loop2

    end_draw_mpelota4:
        ret

pintar_mpelota5:
        // Configurar color del círculo en x13 (blanco)
        movz x13, mpelota5a, lsl 00
        movk x13, mpelota5b, lsl 16

        // Coordenadas del círculo
        .equ CIRCULO_CENTRO_X, 500
        .equ CIRCULO_CENTRO_Y, 410
        .equ CIRCULO_RADIO, 50

        // Dibujar el círculo
        mov x3, CIRCULO_CENTRO_Y - CIRCULO_RADIO   // Y actual
    draw_mpelota5_loop:
        cmp x3, CIRCULO_CENTRO_Y + CIRCULO_RADIO
        b.gt end_draw_mpelota5
        mov x4, CIRCULO_CENTRO_X - CIRCULO_RADIO   // X actual

    draw_mpelota5_row:
        cmp x4, CIRCULO_CENTRO_X + CIRCULO_RADIO
        b.gt next_mpelota5_row

        // Calcular la distancia desde el centro
        sub x5, x4, CIRCULO_CENTRO_X
        mul x5, x5, x5
        sub x6, x3, CIRCULO_CENTRO_Y
        mul x6, x6, x6
        add x5, x5, x6

        // Comprobar si el punto está dentro del círculo
        mov x6, CIRCULO_RADIO
        mul x6, x6, x6
        cmp x5, x6
        b.gt skip_mpelota5

        // Dibujar píxel del círculo
        mov x1, SCREEN_WIDTH
        mul x7, x3, x1             // Y * SCREEN_WIDTH
        add x7, x7, x4             // (Y * SCREEN_WIDTH) + X
        lsl x7, x7, 2              // Dirección de memoria = Dirección base + 4 * índice
        add x7, x20, x7            // Agregar dirección base
        stur w13, [x7]             // Colorear el pixel con el color del círculo

    skip_mpelota5:
        add x4, x4, 1              // Incrementar X
        b draw_mpelota5_row

    next_mpelota5_row:
        add x3, x3, 1              // Incrementar Y
        b draw_mpelota5_loop

    end_draw_mpelota5:
        ret

pintar_mpelota6:
        // Configurar color del círculo en x13 (blanco)
        movz x13, mpelota6a, lsl 00
        movk x13, mpelota6b, lsl 16

        // Coordenadas del círculo
        .equ CIRCULO_CENTRO_X, 500
        .equ CIRCULO_CENTRO_Y, 410
        .equ CIRCULO_RADIO, 45

        // Dibujar el círculo
        mov x3, CIRCULO_CENTRO_Y - CIRCULO_RADIO   // Y actual
    draw_mpelota6_loop2:
        cmp x3, CIRCULO_CENTRO_Y + CIRCULO_RADIO
        b.gt end_draw_mpelota6
        mov x4, CIRCULO_CENTRO_X - CIRCULO_RADIO   // X actual

    draw_mpelota6_row2:
        cmp x4, CIRCULO_CENTRO_X + CIRCULO_RADIO
        b.gt next_mpelota6_row2

        // Calcular la distancia desde el centro
        sub x5, x4, CIRCULO_CENTRO_X
        mul x5, x5, x5
        sub x6, x3, CIRCULO_CENTRO_Y
        mul x6, x6, x6
        add x5, x5, x6

        // Comprobar si el punto está dentro del círculo
        mov x6, CIRCULO_RADIO
        mul x6, x6, x6
        cmp x5, x6
        b.gt skip_mpelota6

        // Dibujar píxel del círculo
        mov x1, SCREEN_WIDTH
        mul x7, x3, x1             // Y * SCREEN_WIDTH
        add x7, x7, x4             // (Y * SCREEN_WIDTH) + X
        lsl x7, x7, 2              // Dirección de memoria = Dirección base + 4 * índice
        add x7, x20, x7            // Agregar dirección base
        stur w13, [x7]             // Colorear el pixel con el color del círculo

    skip_mpelota6:
        add x4, x4, 1              // Incrementar X
        b draw_mpelota6_row2

    next_mpelota6_row2:
        add x3, x3, 1              // Incrementar Y
        b draw_mpelota6_loop2

    end_draw_mpelota6:
        ret

pintar_mpelota7:
        // Configurar color del círculo en x13 (blanco)
        movz x13, mpelota7a, lsl 00
        movk x13, mpelota7b, lsl 16

        // Coordenadas del círculo
        .equ CIRCULO_CENTRO_X, 590
        .equ CIRCULO_CENTRO_Y, 310
        .equ CIRCULO_RADIO, 50

        // Dibujar el círculo
        mov x3, CIRCULO_CENTRO_Y - CIRCULO_RADIO   // Y actual
    draw_mpelota7_loop:
        cmp x3, CIRCULO_CENTRO_Y + CIRCULO_RADIO
        b.gt end_draw_mpelota7
        mov x4, CIRCULO_CENTRO_X - CIRCULO_RADIO   // X actual

    draw_mpelota7_row:
        cmp x4, CIRCULO_CENTRO_X + CIRCULO_RADIO
        b.gt next_mpelota7_row

        // Calcular la distancia desde el centro
        sub x5, x4, CIRCULO_CENTRO_X
        mul x5, x5, x5
        sub x6, x3, CIRCULO_CENTRO_Y
        mul x6, x6, x6
        add x5, x5, x6

        // Comprobar si el punto está dentro del círculo
        mov x6, CIRCULO_RADIO
        mul x6, x6, x6
        cmp x5, x6
        b.gt skip_mpelota7

        // Dibujar píxel del círculo
        mov x1, SCREEN_WIDTH
        mul x7, x3, x1             // Y * SCREEN_WIDTH
        add x7, x7, x4             // (Y * SCREEN_WIDTH) + X
        lsl x7, x7, 2              // Dirección de memoria = Dirección base + 4 * índice
        add x7, x20, x7            // Agregar dirección base
        stur w13, [x7]             // Colorear el pixel con el color del círculo

    skip_mpelota7:
        add x4, x4, 1              // Incrementar X
        b draw_mpelota7_row

    next_mpelota7_row:
        add x3, x3, 1              // Incrementar Y
        b draw_mpelota7_loop

    end_draw_mpelota7:
        ret

pintar_mpelota8:
        // Configurar color del círculo en x13 (blanco)
        movz x13, mpelota8a, lsl 00
        movk x13, mpelota8b, lsl 16

        // Coordenadas del círculo
        .equ CIRCULO_CENTRO_X, 590
        .equ CIRCULO_CENTRO_Y, 310
        .equ CIRCULO_RADIO, 45

        // Dibujar el círculo
        mov x3, CIRCULO_CENTRO_Y - CIRCULO_RADIO   // Y actual
    draw_mpelota8_loop2:
        cmp x3, CIRCULO_CENTRO_Y + CIRCULO_RADIO
        b.gt end_draw_mpelota8
        mov x4, CIRCULO_CENTRO_X - CIRCULO_RADIO   // X actual

    draw_mpelota8_row2:
        cmp x4, CIRCULO_CENTRO_X + CIRCULO_RADIO
        b.gt next_mpelota8_row2

        // Calcular la distancia desde el centro
        sub x5, x4, CIRCULO_CENTRO_X
        mul x5, x5, x5
        sub x6, x3, CIRCULO_CENTRO_Y
        mul x6, x6, x6
        add x5, x5, x6

        // Comprobar si el punto está dentro del círculo
        mov x6, CIRCULO_RADIO
        mul x6, x6, x6
        cmp x5, x6
        b.gt skip_mpelota8

        // Dibujar píxel del círculo
        mov x1, SCREEN_WIDTH
        mul x7, x3, x1             // Y * SCREEN_WIDTH
        add x7, x7, x4             // (Y * SCREEN_WIDTH) + X
        lsl x7, x7, 2              // Dirección de memoria = Dirección base + 4 * índice
        add x7, x20, x7            // Agregar dirección base
        stur w13, [x7]             // Colorear el pixel con el color del círculo

    skip_mpelota8:
        add x4, x4, 1              // Incrementar X
        b draw_mpelota8_row2

    next_mpelota8_row2:
        add x3, x3, 1              // Incrementar Y
        b draw_mpelota8_loop2

    end_draw_mpelota8:
        ret

pintar_mpelota9:
        // Configurar color del círculo en x13 (blanco)
        movz x13, mpelota9a, lsl 00
        movk x13, mpelota9b, lsl 16

        // Coordenadas del círculo
        .equ CIRCULO_CENTRO_X, 500
        .equ CIRCULO_CENTRO_Y, 410
        .equ CIRCULO_RADIO, 50

        // Dibujar el círculo
        mov x3, CIRCULO_CENTRO_Y - CIRCULO_RADIO   // Y actual
    draw_mpelota9_loop:
        cmp x3, CIRCULO_CENTRO_Y + CIRCULO_RADIO
        b.gt end_draw_mpelota9
        mov x4, CIRCULO_CENTRO_X - CIRCULO_RADIO   // X actual

    draw_mpelota9_row:
        cmp x4, CIRCULO_CENTRO_X + CIRCULO_RADIO
        b.gt next_mpelota9_row

        // Calcular la distancia desde el centro
        sub x5, x4, CIRCULO_CENTRO_X
        mul x5, x5, x5
        sub x6, x3, CIRCULO_CENTRO_Y
        mul x6, x6, x6
        add x5, x5, x6

        // Comprobar si el punto está dentro del círculo
        mov x6, CIRCULO_RADIO
        mul x6, x6, x6
        cmp x5, x6
        b.gt skip_mpelota9

        // Dibujar píxel del círculo
        mov x1, SCREEN_WIDTH
        mul x7, x3, x1             // Y * SCREEN_WIDTH
        add x7, x7, x4             // (Y * SCREEN_WIDTH) + X
        lsl x7, x7, 2              // Dirección de memoria = Dirección base + 4 * índice
        add x7, x20, x7            // Agregar dirección base
        stur w13, [x7]             // Colorear el pixel con el color del círculo

    skip_mpelota9:
        add x4, x4, 1              // Incrementar X
        b draw_mpelota9_row

    next_mpelota9_row:
        add x3, x3, 1              // Incrementar Y
        b draw_mpelota9_loop

    end_draw_mpelota9:
        ret

pintar_mpelota10:
        // Configurar color del círculo en x13 (blanco)
        movz x13, mpelota10a, lsl 00
        movk x13, mpelota10b, lsl 16

        // Coordenadas del círculo
        .equ CIRCULO_CENTRO_X, 500
        .equ CIRCULO_CENTRO_Y, 410
        .equ CIRCULO_RADIO, 45

        // Dibujar el círculo
        mov x3, CIRCULO_CENTRO_Y - CIRCULO_RADIO   // Y actual
    draw_mpelota10_loop2:
        cmp x3, CIRCULO_CENTRO_Y + CIRCULO_RADIO
        b.gt end_draw_mpelota10
        mov x4, CIRCULO_CENTRO_X - CIRCULO_RADIO   // X actual

    draw_mpelota10_row2:
        cmp x4, CIRCULO_CENTRO_X + CIRCULO_RADIO
        b.gt next_mpelota10_row2

        // Calcular la distancia desde el centro
        sub x5, x4, CIRCULO_CENTRO_X
        mul x5, x5, x5
        sub x6, x3, CIRCULO_CENTRO_Y
        mul x6, x6, x6
        add x5, x5, x6

        // Comprobar si el punto está dentro del círculo
        mov x6, CIRCULO_RADIO
        mul x6, x6, x6
        cmp x5, x6
        b.gt skip_mpelota10

        // Dibujar píxel del círculo
        mov x1, SCREEN_WIDTH
        mul x7, x3, x1             // Y * SCREEN_WIDTH
        add x7, x7, x4             // (Y * SCREEN_WIDTH) + X
        lsl x7, x7, 2              // Dirección de memoria = Dirección base + 4 * índice
        add x7, x20, x7            // Agregar dirección base
        stur w13, [x7]             // Colorear el pixel con el color del círculo

    skip_mpelota10:
        add x4, x4, 1              // Incrementar X
        b draw_mpelota10_row2

    next_mpelota10_row2:
        add x3, x3, 1              // Incrementar Y
        b draw_mpelota10_loop2

    end_draw_mpelota10:
        ret

pintar_mpelota11:
        // Configurar color del círculo en x13 (blanco)
        movz x13, mpelota11a, lsl 00
        movk x13, mpelota11b, lsl 16

        // Coordenadas del círculo
        .equ CIRCULO_CENTRO_X, 400
        .equ CIRCULO_CENTRO_Y, 410
        .equ CIRCULO_RADIO, 50

        // Dibujar el círculo
        mov x3, CIRCULO_CENTRO_Y - CIRCULO_RADIO   // Y actual
    draw_mpelota11_loop:
        cmp x3, CIRCULO_CENTRO_Y + CIRCULO_RADIO
        b.gt end_draw_mpelota11
        mov x4, CIRCULO_CENTRO_X - CIRCULO_RADIO   // X actual

    draw_mpelota11_row:
        cmp x4, CIRCULO_CENTRO_X + CIRCULO_RADIO
        b.gt next_mpelota11_row

        // Calcular la distancia desde el centro
        sub x5, x4, CIRCULO_CENTRO_X
        mul x5, x5, x5
        sub x6, x3, CIRCULO_CENTRO_Y
        mul x6, x6, x6
        add x5, x5, x6

        // Comprobar si el punto está dentro del círculo
        mov x6, CIRCULO_RADIO
        mul x6, x6, x6
        cmp x5, x6
        b.gt skip_mpelota11

        // Dibujar píxel del círculo
        mov x1, SCREEN_WIDTH
        mul x7, x3, x1             // Y * SCREEN_WIDTH
        add x7, x7, x4             // (Y * SCREEN_WIDTH) + X
        lsl x7, x7, 2              // Dirección de memoria = Dirección base + 4 * índice
        add x7, x20, x7            // Agregar dirección base
        stur w13, [x7]             // Colorear el pixel con el color del círculo

    skip_mpelota11:
        add x4, x4, 1              // Incrementar X
        b draw_mpelota11_row

    next_mpelota11_row:
        add x3, x3, 1              // Incrementar Y
        b draw_mpelota11_loop

    end_draw_mpelota11:
        ret

pintar_mpelota12:
        // Configurar color del círculo en x13 (blanco)
        movz x13, mpelota12a, lsl 00
        movk x13, mpelota12b, lsl 16

        // Coordenadas del círculo
        .equ CIRCULO_CENTRO_X, 400
        .equ CIRCULO_CENTRO_Y, 410
        .equ CIRCULO_RADIO, 45

        // Dibujar el círculo
        mov x3, CIRCULO_CENTRO_Y - CIRCULO_RADIO   // Y actual
    draw_mpelota12_loop2:
        cmp x3, CIRCULO_CENTRO_Y + CIRCULO_RADIO
        b.gt end_draw_mpelota12
        mov x4, CIRCULO_CENTRO_X - CIRCULO_RADIO   // X actual

    draw_mpelota12_row2:
        cmp x4, CIRCULO_CENTRO_X + CIRCULO_RADIO
        b.gt next_mpelota12_row2

        // Calcular la distancia desde el centro
        sub x5, x4, CIRCULO_CENTRO_X
        mul x5, x5, x5
        sub x6, x3, CIRCULO_CENTRO_Y
        mul x6, x6, x6
        add x5, x5, x6

        // Comprobar si el punto está dentro del círculo
        mov x6, CIRCULO_RADIO
        mul x6, x6, x6
        cmp x5, x6
        b.gt skip_mpelota12

        // Dibujar píxel del círculo
        mov x1, SCREEN_WIDTH
        mul x7, x3, x1             // Y * SCREEN_WIDTH
        add x7, x7, x4             // (Y * SCREEN_WIDTH) + X
        lsl x7, x7, 2              // Dirección de memoria = Dirección base + 4 * índice
        add x7, x20, x7            // Agregar dirección base
        stur w13, [x7]             // Colorear el pixel con el color del círculo

    skip_mpelota12:
        add x4, x4, 1              // Incrementar X
        b draw_mpelota12_row2

    next_mpelota12_row2:
        add x3, x3, 1              // Incrementar Y
        b draw_mpelota12_loop2

    end_draw_mpelota12:
        ret

pintar_mpelota13:
        // Configurar color del círculo en x13 (blanco)
        movz x13, mpelota13a, lsl 00
        movk x13, mpelota13b, lsl 16

        // Coordenadas del círculo
        .equ CIRCULO_CENTRO_X, 300
        .equ CIRCULO_CENTRO_Y, 410
        .equ CIRCULO_RADIO, 50

        // Dibujar el círculo
        mov x3, CIRCULO_CENTRO_Y - CIRCULO_RADIO   // Y actual
    draw_mpelota13_loop:
        cmp x3, CIRCULO_CENTRO_Y + CIRCULO_RADIO
        b.gt end_draw_mpelota13
        mov x4, CIRCULO_CENTRO_X - CIRCULO_RADIO   // X actual

    draw_mpelota13_row:
        cmp x4, CIRCULO_CENTRO_X + CIRCULO_RADIO
        b.gt next_mpelota13_row

        // Calcular la distancia desde el centro
        sub x5, x4, CIRCULO_CENTRO_X
        mul x5, x5, x5
        sub x6, x3, CIRCULO_CENTRO_Y
        mul x6, x6, x6
        add x5, x5, x6

        // Comprobar si el punto está dentro del círculo
        mov x6, CIRCULO_RADIO
        mul x6, x6, x6
        cmp x5, x6
        b.gt skip_mpelota13

        // Dibujar píxel del círculo
        mov x1, SCREEN_WIDTH
        mul x7, x3, x1             // Y * SCREEN_WIDTH
        add x7, x7, x4             // (Y * SCREEN_WIDTH) + X
        lsl x7, x7, 2              // Dirección de memoria = Dirección base + 4 * índice
        add x7, x20, x7            // Agregar dirección base
        stur w13, [x7]             // Colorear el pixel con el color del círculo

    skip_mpelota13:
        add x4, x4, 1              // Incrementar X
        b draw_mpelota13_row

    next_mpelota13_row:
        add x3, x3, 1              // Incrementar Y
        b draw_mpelota13_loop

    end_draw_mpelota13:
        ret

pintar_mpelota14:
        // Configurar color del círculo en x13 (blanco)
        movz x13, mpelota14a, lsl 00
        movk x13, mpelota14b, lsl 16

        // Coordenadas del círculo
        .equ CIRCULO_CENTRO_X, 300
        .equ CIRCULO_CENTRO_Y, 410
        .equ CIRCULO_RADIO, 45

        // Dibujar el círculo
        mov x3, CIRCULO_CENTRO_Y - CIRCULO_RADIO   // Y actual
    draw_mpelota14_loop2:
        cmp x3, CIRCULO_CENTRO_Y + CIRCULO_RADIO
        b.gt end_draw_mpelota14
        mov x4, CIRCULO_CENTRO_X - CIRCULO_RADIO   // X actual

    draw_mpelota14_row2:
        cmp x4, CIRCULO_CENTRO_X + CIRCULO_RADIO
        b.gt next_mpelota14_row2

        // Calcular la distancia desde el centro
        sub x5, x4, CIRCULO_CENTRO_X
        mul x5, x5, x5
        sub x6, x3, CIRCULO_CENTRO_Y
        mul x6, x6, x6
        add x5, x5, x6

        // Comprobar si el punto está dentro del círculo
        mov x6, CIRCULO_RADIO
        mul x6, x6, x6
        cmp x5, x6
        b.gt skip_mpelota14

        // Dibujar píxel del círculo
        mov x1, SCREEN_WIDTH
        mul x7, x3, x1             // Y * SCREEN_WIDTH
        add x7, x7, x4             // (Y * SCREEN_WIDTH) + X
        lsl x7, x7, 2              // Dirección de memoria = Dirección base + 4 * índice
        add x7, x20, x7            // Agregar dirección base
        stur w13, [x7]             // Colorear el pixel con el color del círculo

    skip_mpelota14:
        add x4, x4, 1              // Incrementar X
        b draw_mpelota14_row2

    next_mpelota14_row2:
        add x3, x3, 1              // Incrementar Y
        b draw_mpelota14_loop2

    end_draw_mpelota14:
        ret

pintar_mpelota15:
        // Configurar color del círculo en x13 (blanco)
        movz x13, mpelota15a, lsl 00
        movk x13, mpelota15b, lsl 16

        // Coordenadas del círculo
        .equ CIRCULO_CENTRO_X, 200
        .equ CIRCULO_CENTRO_Y, 410
        .equ CIRCULO_RADIO, 50

        // Dibujar el círculo
        mov x3, CIRCULO_CENTRO_Y - CIRCULO_RADIO   // Y actual
    draw_mpelota15_loop:
        cmp x3, CIRCULO_CENTRO_Y + CIRCULO_RADIO
        b.gt end_draw_mpelota15
        mov x4, CIRCULO_CENTRO_X - CIRCULO_RADIO   // X actual

    draw_mpelota15_row:
        cmp x4, CIRCULO_CENTRO_X + CIRCULO_RADIO
        b.gt next_mpelota15_row

        // Calcular la distancia desde el centro
        sub x5, x4, CIRCULO_CENTRO_X
        mul x5, x5, x5
        sub x6, x3, CIRCULO_CENTRO_Y
        mul x6, x6, x6
        add x5, x5, x6

        // Comprobar si el punto está dentro del círculo
        mov x6, CIRCULO_RADIO
        mul x6, x6, x6
        cmp x5, x6
        b.gt skip_mpelota15

        // Dibujar píxel del círculo
        mov x1, SCREEN_WIDTH
        mul x7, x3, x1             // Y * SCREEN_WIDTH
        add x7, x7, x4             // (Y * SCREEN_WIDTH) + X
        lsl x7, x7, 2              // Dirección de memoria = Dirección base + 4 * índice
        add x7, x20, x7            // Agregar dirección base
        stur w13, [x7]             // Colorear el pixel con el color del círculo

    skip_mpelota15:
        add x4, x4, 1              // Incrementar X
        b draw_mpelota15_row

    next_mpelota15_row:
        add x3, x3, 1              // Incrementar Y
        b draw_mpelota15_loop

    end_draw_mpelota15:
        ret

pintar_mpelota16:
        // Configurar color del círculo en x13 (blanco)
        movz x13, mpelota16a, lsl 00
        movk x13, mpelota16b, lsl 16

        // Coordenadas del círculo
        .equ CIRCULO_CENTRO_X, 200
        .equ CIRCULO_CENTRO_Y, 410
        .equ CIRCULO_RADIO, 45

        // Dibujar el círculo
        mov x3, CIRCULO_CENTRO_Y - CIRCULO_RADIO   // Y actual
    draw_mpelota16_loop2:
        cmp x3, CIRCULO_CENTRO_Y + CIRCULO_RADIO
        b.gt end_draw_mpelota16
        mov x4, CIRCULO_CENTRO_X - CIRCULO_RADIO   // X actual

    draw_mpelota16_row2:
        cmp x4, CIRCULO_CENTRO_X + CIRCULO_RADIO
        b.gt next_mpelota16_row2

        // Calcular la distancia desde el centro
        sub x5, x4, CIRCULO_CENTRO_X
        mul x5, x5, x5
        sub x6, x3, CIRCULO_CENTRO_Y
        mul x6, x6, x6
        add x5, x5, x6

        // Comprobar si el punto está dentro del círculo
        mov x6, CIRCULO_RADIO
        mul x6, x6, x6
        cmp x5, x6
        b.gt skip_mpelota16

        // Dibujar píxel del círculo
        mov x1, SCREEN_WIDTH
        mul x7, x3, x1             // Y * SCREEN_WIDTH
        add x7, x7, x4             // (Y * SCREEN_WIDTH) + X
        lsl x7, x7, 2              // Dirección de memoria = Dirección base + 4 * índice
        add x7, x20, x7            // Agregar dirección base
        stur w13, [x7]             // Colorear el pixel con el color del círculo

    skip_mpelota16:
        add x4, x4, 1              // Incrementar X
        b draw_mpelota16_row2

    next_mpelota16_row2:
        add x3, x3, 1              // Incrementar Y
        b draw_mpelota16_loop2

    end_draw_mpelota16:
        ret


