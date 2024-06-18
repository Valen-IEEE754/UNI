.equ SCREEN_WIDTH,   640
.equ SCREEN_HEIGHT,   480
.equ BITS_PER_PIXEL, 32

.equ cubito1a,          0x0000      // Color #000000
.equ cubito1b,          0x0000      // Color #000000
.equ cubito2a,          0xA500      // Color #FF0000
.equ cubito2b,          0x00FF      // Color #FF0000
.equ cubito3a,          0x8080      // Color #808080
.equ cubito3b,          0x0080      // Color #808080
.equ cubito4a,          0x0000      // Color #000000
.equ cubito4b,          0x0000      // Color #000000
.equ cubito5a,          0xFF99      // Color #FFFFFF
.equ cubito5b,          0x00FF      // Color #FFFFFF
.equ cubito6a,          0x0000      // Color #000000
.equ cubito6b,          0x0000      // Color #000000
.equ cubito7a,          0x0000      // Color #000000
.equ cubito7b,          0x0000      // Color #000000
.equ cubito8a,          0x0000      // Color #000000
.equ cubito8b,          0x0000      // Color #000000
.equ pelota1a,          0x0000      // Color #000000
.equ pelota1b,          0x0000      // Color #000000
.equ pelota2a,          0xCA63      // Color #FFFFFF
.equ pelota2b,          0x0066      // Color #FFFFFF
.equ sombreroa,         0x0000      // Color #FF0000
.equ sombrerob,         0x00FF      // Color #FF0000
.equ bonzai1a,          0x4C00      // Color #994C00
.equ bonzai1b,          0x0099      // Color #994C00
.equ bonzai2a,          0x1D29      // Color #111D29
.equ bonzai2b,          0x0011      // Color #111D29
.equ bonzai3a,          0xFF66      // Color #B2FF66
.equ bonzai3b,          0x00B2      // Color #B2FF66
.equ bonzai4a,          0xFF66      // Color #B2FF66
.equ bonzai4b,          0x00B2      // Color #B2FF66
.equ bonzai5a,          0xFF66      // Color #B2FF66
.equ bonzai5b,          0x00B2      // Color #B2FF66

pintar_cubito1:
        // Configurar color
        movz x11, cubito1a, lsl 00
        movk x11, cubito1b, lsl 16

        // Dibujar
        mov x2, SCREEN_HEIGHT        // Resetear Y Size
        ldr x0, [x20]                // Resetear dirección base del framebuffer

        // Coordenadas
        .equ cubito1_TOP_X, 35
        .equ cubito1_TOP_Y, 365
        .equ cubito1_WIDTH, 100
        .equ cubito1_HEIGHT, 100

        // Dibujar la cara superior
        mov x3, cubito1_TOP_Y          // Y actual
    loop24:
        cmp x3, cubito1_TOP_Y + cubito1_HEIGHT
        b.ge end_pintar_cubito1
        mov x4, cubito1_TOP_X          // X actual

    loop25:
        cmp x4,cubito1_TOP_X + cubito1_WIDTH
        b.ge next_row_cubito1   

        // Dibujar píxel
        mov x1, SCREEN_WIDTH
        mul x5, x3, x1             // Y * SCREEN_WIDTH
        add x5, x5, x4             // (Y * SCREEN_WIDTH) + X
        lsl x5, x5, 2              // Dirección de memoria = Dirección base + 4 * índice
        add x5, x20, x5            // Agregar dirección base
        stur w11, [x5]             // Colorear el pixel con el color

        add x4, x4, 1              // Incrementar X
        b loop25
        next_row_cubito1:
        add x3, x3, 1              // Incrementar Y
        b loop24

    end_pintar_cubito1:
    ret

pintar_cubito2:
        // Configurar color
        movz x11, cubito2a, lsl 00
        movk x11, cubito2b, lsl 16

        // Dibujar
        mov x2, SCREEN_HEIGHT        // Resetear Y Size
        ldr x0, [x20]                // Resetear dirección base del framebuffer

        // Coordenadas
        .equ cubito2_TOP_X, 40
        .equ cubito2_TOP_Y, 370
        .equ cubito2_WIDTH, 90
        .equ cubito2_HEIGHT, 90

        // Dibujar la cara superior
        mov x3, cubito2_TOP_Y          // Y actual
    loop26:
        cmp x3, cubito2_TOP_Y + cubito2_HEIGHT
        b.ge end_pintar_cubito2
        mov x4, cubito2_TOP_X          // X actual

    loop27:
        cmp x4,cubito2_TOP_X + cubito2_WIDTH
        b.ge next_row_cubito2   

        // Dibujar píxel
        mov x1, SCREEN_WIDTH
        mul x5, x3, x1             // Y * SCREEN_WIDTH
        add x5, x5, x4             // (Y * SCREEN_WIDTH) + X
        lsl x5, x5, 2              // Dirección de memoria = Dirección base + 4 * índice
        add x5, x20, x5            // Agregar dirección base
        stur w11, [x5]             // Colorear el pixel con el color

        add x4, x4, 1              // Incrementar X
        b loop27
        next_row_cubito2:
        add x3, x3, 1              // Incrementar Y
        b loop26

    end_pintar_cubito2:
    ret

pintar_cubito3:
        // Configurar color
        movz x11, cubito3a, lsl 00
        movk x11, cubito3b, lsl 16

        // Dibujar
        mov x2, SCREEN_HEIGHT        // Resetear Y Size
        ldr x0, [x20]                // Resetear dirección base del framebuffer

        // Coordenadas
        .equ cubito3_TOP_X, 40
        .equ cubito3_TOP_Y, 400
        .equ cubito3_WIDTH, 90
        .equ cubito3_HEIGHT, 25

        // Dibujar la cara superior
        mov x3, cubito3_TOP_Y          // Y actual
    loop28:
        cmp x3, cubito3_TOP_Y + cubito3_HEIGHT
        b.ge end_pintar_cubito3
        mov x4, cubito3_TOP_X          // X actual

    loop29:
        cmp x4,cubito3_TOP_X + cubito3_WIDTH
        b.ge next_row_cubito3   

        // Dibujar píxel
        mov x1, SCREEN_WIDTH
        mul x5, x3, x1             // Y * SCREEN_WIDTH
        add x5, x5, x4             // (Y * SCREEN_WIDTH) + X
        lsl x5, x5, 2              // Dirección de memoria = Dirección base + 4 * índice
        add x5, x20, x5            // Agregar dirección base
        stur w11, [x5]             // Colorear el pixel con el color

        add x4, x4, 1              // Incrementar X
        b loop29
        next_row_cubito3:
        add x3, x3, 1              // Incrementar Y
        b loop28

    end_pintar_cubito3:
    ret

pintar_cubito4:
        // Configurar color del círculo en x13 (blanco)
        movz x13, cubito4a, lsl 00
        movk x13, cubito4b, lsl 16

        // Coordenadas del círculo
        .equ cubito4_CENTRO_X, 85
        .equ cubito4_CENTRO_Y, 415
        .equ cubito4_RADIO, 40

        // Dibujar el círculo
        mov x3, cubito4_CENTRO_Y - cubito4_RADIO   // Y actual
    loop30:
        cmp x3, cubito4_CENTRO_Y + cubito4_RADIO
        b.gt end_pintar_cubito4
        mov x4, cubito4_CENTRO_X - cubito4_RADIO   // X actual

    loop31:
        cmp x4, cubito4_CENTRO_X + cubito4_RADIO
        b.gt next_row_cubito4

        // Calcular la distancia desde el centro
        sub x5, x4, cubito4_CENTRO_X
        mul x5, x5, x5
        sub x6, x3, cubito4_CENTRO_Y
        mul x6, x6, x6
        add x5, x5, x6

        // Comprobar si el punto está dentro del círculo
        mov x6, cubito4_RADIO
        mul x6, x6, x6
        cmp x5, x6
        b.gt skip_pixel

        // Dibujar píxel del círculo
        mov x1, SCREEN_WIDTH
        mul x7, x3, x1             // Y * SCREEN_WIDTH
        add x7, x7, x4             // (Y * SCREEN_WIDTH) + X
        lsl x7, x7, 2              // Dirección de memoria = Dirección base + 4 * índice
        add x7, x20, x7            // Agregar dirección base
        stur w13, [x7]             // Colorear el pixel con el color del círculo

        skip_pixel:
        add x4, x4, 1              // Incrementar X
        b loop31
        next_row_cubito4:
        add x3, x3, 1              // Incrementar Y
        b loop30

    end_pintar_cubito4:
        ret

pintar_cubito5:
        // Configurar color del círculo en x13 (blanco)
        movz x13, cubito5a, lsl 00
        movk x13, cubito5b, lsl 16

        // Coordenadas del círculo
        .equ cubito5_CENTRO_X, 85
        .equ cubito5_CENTRO_Y, 415
        .equ cubito5_RADIO, 38

        // Dibujar el círculo
        mov x3, cubito5_CENTRO_Y - cubito5_RADIO   // Y actual
    loop32:
        cmp x3, cubito5_CENTRO_Y + cubito5_RADIO
        b.gt end_pintar_cubito5
        mov x4, cubito5_CENTRO_X - cubito5_RADIO   // X actual

    loop33:
        cmp x4, cubito5_CENTRO_X + cubito5_RADIO
        b.gt next_row_cubito5

        // Calcular la distancia desde el centro
        sub x5, x4, cubito5_CENTRO_X
        mul x5, x5, x5
        sub x6, x3, cubito5_CENTRO_Y
        mul x6, x6, x6
        add x5, x5, x6

        // Comprobar si el punto está dentro del círculo
        mov x6, cubito5_RADIO
        mul x6, x6, x6
        cmp x5, x6
        b.gt skip_pixel1

        // Dibujar píxel del círculo
        mov x1, SCREEN_WIDTH
        mul x7, x3, x1             // Y * SCREEN_WIDTH
        add x7, x7, x4             // (Y * SCREEN_WIDTH) + X
        lsl x7, x7, 2              // Dirección de memoria = Dirección base + 4 * índice
        add x7, x20, x7            // Agregar dirección base
        stur w13, [x7]             // Colorear el pixel con el color del círculo

        skip_pixel1:
        add x4, x4, 1              // Incrementar X
        b loop33
        next_row_cubito5:
        add x3, x3, 1              // Incrementar Y
        b loop32

    end_pintar_cubito5:
        ret

pintar_cubito6:
        // Configurar color del círculo en x13 (blanco)
        movz x13, cubito6a, lsl 00
        movk x13, cubito6b, lsl 16

        // Coordenadas del círculo
        .equ cubito6_CENTRO_X, 70
        .equ cubito6_CENTRO_Y, 405
        .equ cubito6_RADIO, 13

        // Dibujar el círculo
        mov x3, cubito6_CENTRO_Y - cubito6_RADIO   // Y actual
    loop34:
        cmp x3, cubito6_CENTRO_Y + cubito6_RADIO
        b.gt end_pintar_cubito6
        mov x4, cubito6_CENTRO_X - cubito6_RADIO   // X actual

    loop35:
        cmp x4, cubito6_CENTRO_X + cubito6_RADIO
        b.gt next_row_cubito6

        // Calcular la distancia desde el centro
        sub x5, x4, cubito6_CENTRO_X
        mul x5, x5, x5
        sub x6, x3, cubito6_CENTRO_Y
        mul x6, x6, x6
        add x5, x5, x6

        // Comprobar si el punto está dentro del círculo
        mov x6, cubito6_RADIO
        mul x6, x6, x6
        cmp x5, x6
        b.gt skip_pixel2

        // Dibujar píxel del círculo
        mov x1, SCREEN_WIDTH
        mul x7, x3, x1             // Y * SCREEN_WIDTH
        add x7, x7, x4             // (Y * SCREEN_WIDTH) + X
        lsl x7, x7, 2              // Dirección de memoria = Dirección base + 4 * índice
        add x7, x20, x7            // Agregar dirección base
        stur w13, [x7]             // Colorear el pixel con el color del círculo

        skip_pixel2:
        add x4, x4, 1              // Incrementar X
        b loop35
        next_row_cubito6:
        add x3, x3, 1              // Incrementar Y
        b loop34

    end_pintar_cubito6:
        ret

pintar_cubito7:
        // Configurar color del círculo en x13 (blanco)
        movz x13, cubito7a, lsl 00
        movk x13, cubito7b, lsl 16

        // Coordenadas del círculo
        .equ cubito7_CENTRO_X, 100
        .equ cubito7_CENTRO_Y, 405
        .equ cubito7_RADIO, 13

        // Dibujar el círculo
        mov x3, cubito7_CENTRO_Y - cubito7_RADIO   // Y actual
    loop36:
        cmp x3, cubito7_CENTRO_Y + cubito7_RADIO
        b.gt end_pintar_cubito7
        mov x4, cubito7_CENTRO_X - cubito7_RADIO   // X actual

    loop37:
        cmp x4, cubito7_CENTRO_X + cubito7_RADIO
        b.gt next_row_cubito7

        // Calcular la distancia desde el centro
        sub x5, x4, cubito7_CENTRO_X
        mul x5, x5, x5
        sub x6, x3, cubito7_CENTRO_Y
        mul x6, x6, x6
        add x5, x5, x6

        // Comprobar si el punto está dentro del círculo
        mov x6, cubito7_RADIO
        mul x6, x6, x6
        cmp x5, x6
        b.gt skip_pixel3

        // Dibujar píxel del círculo
        mov x1, SCREEN_WIDTH
        mul x7, x3, x1             // Y * SCREEN_WIDTH
        add x7, x7, x4             // (Y * SCREEN_WIDTH) + X
        lsl x7, x7, 2              // Dirección de memoria = Dirección base + 4 * índice
        add x7, x20, x7            // Agregar dirección base
        stur w13, [x7]             // Colorear el pixel con el color del círculo

        skip_pixel3:
        add x4, x4, 1              // Incrementar X
        b loop37
        next_row_cubito7:
        add x3, x3, 1              // Incrementar Y
        b loop36

    end_pintar_cubito7:
        ret

pintar_cubito8:
        // Configurar color del círculo en x13 (blanco)
        movz x13, cubito8a, lsl 00
        movk x13, cubito8b, lsl 16

        // Coordenadas del círculo
        .equ cubito8_CENTRO_X, 85
        .equ cubito8_CENTRO_Y, 435
        .equ cubito8_RADIO, 7

        // Dibujar el círculo
        mov x3, cubito8_CENTRO_Y - cubito8_RADIO   // Y actual
    loop38:
        cmp x3, cubito8_CENTRO_Y + cubito8_RADIO
        b.gt end_pintar_cubito8
        mov x4, cubito8_CENTRO_X - cubito8_RADIO   // X actual

    loop39:
        cmp x4, cubito8_CENTRO_X + cubito8_RADIO
        b.gt next_row_cubito8

        // Calcular la distancia desde el centro
        sub x5, x4, cubito8_CENTRO_X
        mul x5, x5, x5
        sub x6, x3, cubito8_CENTRO_Y
        mul x6, x6, x6
        add x5, x5, x6

        // Comprobar si el punto está dentro del círculo
        mov x6, cubito8_RADIO
        mul x6, x6, x6
        cmp x5, x6
        b.gt skip_pixel4

        // Dibujar píxel del círculo
        mov x1, SCREEN_WIDTH
        mul x7, x3, x1             // Y * SCREEN_WIDTH
        add x7, x7, x4             // (Y * SCREEN_WIDTH) + X
        lsl x7, x7, 2              // Dirección de memoria = Dirección base + 4 * índice
        add x7, x20, x7            // Agregar dirección base
        stur w13, [x7]             // Colorear el pixel con el color del círculo

        skip_pixel4:
        add x4, x4, 1              // Incrementar X
        b loop39
        next_row_cubito8:
        add x3, x3, 1              // Incrementar Y
        b loop38

    end_pintar_cubito8:
        ret

pintar_pelota:
        // Configurar color del círculo en x13 (blanco)
        movz x13, pelota1a, lsl 00
        movk x13, pelota1b, lsl 16

        // Coordenadas del círculo
        .equ CIRCULO_CENTRO_X, 200
        .equ CIRCULO_CENTRO_Y, 410
        .equ CIRCULO_RADIO, 50

        // Dibujar el círculo
        mov x3, CIRCULO_CENTRO_Y - CIRCULO_RADIO   // Y actual
    draw_circle_loop:
        cmp x3, CIRCULO_CENTRO_Y + CIRCULO_RADIO
        b.gt end_draw_circle
        mov x4, CIRCULO_CENTRO_X - CIRCULO_RADIO   // X actual

    draw_circle_row:
        cmp x4, CIRCULO_CENTRO_X + CIRCULO_RADIO
        b.gt next_circle_row

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
        b.gt skip_pixel5

        // Dibujar píxel del círculo
        mov x1, SCREEN_WIDTH
        mul x7, x3, x1             // Y * SCREEN_WIDTH
        add x7, x7, x4             // (Y * SCREEN_WIDTH) + X
        lsl x7, x7, 2              // Dirección de memoria = Dirección base + 4 * índice
        add x7, x20, x7            // Agregar dirección base
        stur w13, [x7]             // Colorear el pixel con el color del círculo

    skip_pixel5:
        add x4, x4, 1              // Incrementar X
        b draw_circle_row

    next_circle_row:
        add x3, x3, 1              // Incrementar Y
        b draw_circle_loop

    end_draw_circle:
        ret

pintar_pelota2:
        // Configurar color del círculo en x13 (blanco)
        movz x13, pelota2a, lsl 00
        movk x13, pelota2b, lsl 16

        // Coordenadas del círculo
        .equ CIRCULO_CENTRO_X, 200
        .equ CIRCULO_CENTRO_Y, 410
        .equ CIRCULO_RADIO, 45

        // Dibujar el círculo
        mov x3, CIRCULO_CENTRO_Y - CIRCULO_RADIO   // Y actual
    draw_circle_loop2:
        cmp x3, CIRCULO_CENTRO_Y + CIRCULO_RADIO
        b.gt end_draw_circle2
        mov x4, CIRCULO_CENTRO_X - CIRCULO_RADIO   // X actual

    draw_circle_row2:
        cmp x4, CIRCULO_CENTRO_X + CIRCULO_RADIO
        b.gt next_circle_row2

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
        b.gt skip_pixel6

        // Dibujar píxel del círculo
        mov x1, SCREEN_WIDTH
        mul x7, x3, x1             // Y * SCREEN_WIDTH
        add x7, x7, x4             // (Y * SCREEN_WIDTH) + X
        lsl x7, x7, 2              // Dirección de memoria = Dirección base + 4 * índice
        add x7, x20, x7            // Agregar dirección base
        stur w13, [x7]             // Colorear el pixel con el color del círculo

    skip_pixel6:
        add x4, x4, 1              // Incrementar X
        b draw_circle_row2

    next_circle_row2:
        add x3, x3, 1              // Incrementar Y
        b draw_circle_loop2

    end_draw_circle2:
        ret

pintar_sombrero:
    // Configurar color del triángulo en x14 (blanco)
    movz x14, sombreroa, lsl 00
    movk x14, sombrerob, lsl 16

    // Coordenadas del triángulo
    .equ sombrero_TOP_X, 77
    .equ sombrero_TOP_Y, 295
    .equ sombrero_BASE_WIDTH, 30
    .equ sombrero_HEIGHT, 70

    // Dibujar el triángulo
        mov x3, sombrero_TOP_Y          // Y actual
    draw_sombrero_loop:
        cmp x3, #sombrero_TOP_Y + sombrero_HEIGHT
        b.ge end_draw_sombrero

        // Calcular la posición inicial y final en X para cada línea
        sub x4, x3, #sombrero_TOP_Y
        lsl x4, x4, 1
        mov x10, #sombrero_BASE_WIDTH
        sub x4, x10, x4
        asr x4, x4, 1
        add x4, x4, #sombrero_TOP_X

        sub x5, x3, #sombrero_TOP_Y
        lsl x5, x5, 1
        asr x5, x5, 1
        add x5, x5, #sombrero_TOP_X

        mov x6, x4

    draw_sombrero_row:
        cmp x6, x5
        b.gt next_sombrero_row

        // Dibujar píxel del triángulo
        mov x1, #SCREEN_WIDTH
        mul x7, x3, x1             // Y * SCREEN_WIDTH
        add x7, x7, x6             // (Y * SCREEN_WIDTH) + X
        lsl x7, x7, 2              // Dirección de memoria = Dirección base + 4 * índice
        add x7, x20, x7            // Agregar dirección base
        str w14, [x7]              // Colorear el pixel con el color del triángulo

        add x6, x6, 1              // Incrementar X
        b draw_sombrero_row

    next_sombrero_row:
        add x3, x3, 1              // Incrementar Y
        b draw_sombrero_loop

    end_draw_sombrero:
        ret        

pintar_bonzai1:
        // Configurar color
        movz x11, bonzai1a, lsl 00
        movk x11, bonzai1b, lsl 16

        // Dibujar
        mov x2, SCREEN_HEIGHT        // Resetear Y Size
        ldr x0, [x20]                // Resetear dirección base del framebuffer

        // Coordenadas
        .equ bonzai1_TOP_X, 500
        .equ bonzai1_TOP_Y, 320
        .equ bonzai1_WIDTH, 45
        .equ bonzai1_HEIGHT, 90

        // Dibujar la cara superior
        mov x3, bonzai1_TOP_Y          // Y actual
    loop40:
        cmp x3, bonzai1_TOP_Y + bonzai1_HEIGHT
        b.ge end_pintar_bonzai1
        mov x4, bonzai1_TOP_X          // X actual

    loop41:
        cmp x4,bonzai1_TOP_X + bonzai1_WIDTH
        b.ge next_row_bonzai1   

        // Dibujar píxel
        mov x1, SCREEN_WIDTH
        mul x5, x3, x1             // Y * SCREEN_WIDTH
        add x5, x5, x4             // (Y * SCREEN_WIDTH) + X
        lsl x5, x5, 2              // Dirección de memoria = Dirección base + 4 * índice
        add x5, x20, x5            // Agregar dirección base
        stur w11, [x5]             // Colorear el pixel con el color

        add x4, x4, 1              // Incrementar X
        b loop41
        next_row_bonzai1:
        add x3, x3, 1              // Incrementar Y
        b loop40

    end_pintar_bonzai1:
    ret

pintar_bonzai2:
        // Configurar color
        movz x11, bonzai2a, lsl 00
        movk x11, bonzai2b, lsl 16

        // Dibujar
        mov x2, SCREEN_HEIGHT        // Resetear Y Size
        ldr x0, [x20]                // Resetear dirección base del framebuffer

        // Coordenadas
        .equ bonzai2_TOP_X, 515
        .equ bonzai2_TOP_Y, 275
        .equ bonzai2_WIDTH, 15
        .equ bonzai2_HEIGHT, 60

        // Dibujar la cara superior
        mov x3, bonzai2_TOP_Y          // Y actual
    loop42:
        cmp x3, bonzai2_TOP_Y + bonzai2_HEIGHT
        b.ge end_pintar_bonzai2
        mov x4, bonzai2_TOP_X          // X actual

    loop43:
        cmp x4,bonzai2_TOP_X + bonzai2_WIDTH
        b.ge next_row_bonzai2   

        // Dibujar píxel
        mov x1, SCREEN_WIDTH
        mul x5, x3, x1             // Y * SCREEN_WIDTH
        add x5, x5, x4             // (Y * SCREEN_WIDTH) + X
        lsl x5, x5, 2              // Dirección de memoria = Dirección base + 4 * índice
        add x5, x20, x5            // Agregar dirección base
        stur w11, [x5]             // Colorear el pixel con el color

        add x4, x4, 1              // Incrementar X
        b loop43
        next_row_bonzai2:
        add x3, x3, 1              // Incrementar Y
        b loop42

    end_pintar_bonzai2:
    ret

pintar_bonzai3:
        // Configurar color
        movz x11, bonzai3a, lsl 00
        movk x11, bonzai3b, lsl 16

        // Dibujar
        mov x2, SCREEN_HEIGHT        // Resetear Y Size
        ldr x0, [x20]                // Resetear dirección base del framebuffer

        // Coordenadas
        .equ bonzai3_TOP_X, 500
        .equ bonzai3_TOP_Y, 265
        .equ bonzai3_WIDTH, 17
        .equ bonzai3_HEIGHT, 17

        // Dibujar la cara superior
        mov x3, bonzai3_TOP_Y          // Y actual
    loop44:
        cmp x3, bonzai3_TOP_Y + bonzai3_HEIGHT
        b.ge end_pintar_bonzai3
        mov x4, bonzai3_TOP_X          // X actual

    loop45:
        cmp x4,bonzai3_TOP_X + bonzai3_WIDTH
        b.ge next_row_bonzai3   

        // Dibujar píxel
        mov x1, SCREEN_WIDTH
        mul x5, x3, x1             // Y * SCREEN_WIDTH
        add x5, x5, x4             // (Y * SCREEN_WIDTH) + X
        lsl x5, x5, 2              // Dirección de memoria = Dirección base + 4 * índice
        add x5, x20, x5            // Agregar dirección base
        stur w11, [x5]             // Colorear el pixel con el color

        add x4, x4, 1              // Incrementar X
        b loop45
        next_row_bonzai3:
        add x3, x3, 1              // Incrementar Y
        b loop44

    end_pintar_bonzai3:
    ret

pintar_bonzai4:
        // Configurar color
        movz x11, bonzai4a, lsl 00
        movk x11, bonzai4b, lsl 16

        // Dibujar
        mov x2, SCREEN_HEIGHT        // Resetear Y Size
        ldr x0, [x20]                // Resetear dirección base del framebuffer

        // Coordenadas
        .equ bonzai4_TOP_X, 528
        .equ bonzai4_TOP_Y, 260
        .equ bonzai4_WIDTH, 17
        .equ bonzai4_HEIGHT, 17

        // Dibujar la cara superior
        mov x3, bonzai4_TOP_Y          // Y actual
    loop46:
        cmp x3, bonzai4_TOP_Y + bonzai4_HEIGHT
        b.ge end_pintar_bonzai4
        mov x4, bonzai4_TOP_X          // X actual

    loop47:
        cmp x4,bonzai4_TOP_X + bonzai4_WIDTH
        b.ge next_row_bonzai4   

        // Dibujar píxel
        mov x1, SCREEN_WIDTH
        mul x5, x3, x1             // Y * SCREEN_WIDTH
        add x5, x5, x4             // (Y * SCREEN_WIDTH) + X
        lsl x5, x5, 2              // Dirección de memoria = Dirección base + 4 * índice
        add x5, x20, x5            // Agregar dirección base
        stur w11, [x5]             // Colorear el pixel con el color

        add x4, x4, 1              // Incrementar X
        b loop47
        next_row_bonzai4:
        add x3, x3, 1              // Incrementar Y
        b loop46

    end_pintar_bonzai4:
    ret

pintar_bonzai5:
        // Configurar color
        movz x11, bonzai5a, lsl 00
        movk x11, bonzai5b, lsl 16

        // Dibujar
        mov x2, SCREEN_HEIGHT        // Resetear Y Size
        ldr x0, [x20]                // Resetear dirección base del framebuffer

        // Coordenadas
        .equ bonzai5_TOP_X, 527
        .equ bonzai5_TOP_Y, 290
        .equ bonzai5_WIDTH, 14
        .equ bonzai5_HEIGHT, 17

        // Dibujar la cara superior
        mov x3, bonzai5_TOP_Y          // Y actual
    loop48:
        cmp x3, bonzai5_TOP_Y + bonzai5_HEIGHT
        b.ge end_pintar_bonzai5
        mov x4, bonzai5_TOP_X          // X actual

    loop49:
        cmp x4,bonzai5_TOP_X + bonzai5_WIDTH
        b.ge next_row_bonzai5   

        // Dibujar píxel
        mov x1, SCREEN_WIDTH
        mul x5, x3, x1             // Y * SCREEN_WIDTH
        add x5, x5, x4             // (Y * SCREEN_WIDTH) + X
        lsl x5, x5, 2              // Dirección de memoria = Dirección base + 4 * índice
        add x5, x20, x5            // Agregar dirección base
        stur w11, [x5]             // Colorear el pixel con el color

        add x4, x4, 1              // Incrementar X
        b loop49
        next_row_bonzai5:
        add x3, x3, 1              // Incrementar Y
        b loop48

    end_pintar_bonzai5:
    ret

