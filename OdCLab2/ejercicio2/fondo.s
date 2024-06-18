.equ SCREEN_WIDTH,   640
.equ SCREEN_HEIGHT,   480
.equ BITS_PER_PIXEL, 32

.equ sol1a,             0xA500      // Color #FFA500
.equ sol1b,             0x00FF      // Color #FFA500
.equ sol2a,             0xFF00      // Color #FFFF00
.equ sol2b,             0x00FF      // Color #FFFF00
.equ solecito1a,        0xFF00      // Color #FFFF00
.equ solecito1b,        0x00FF      // Color #FFFF00
.equ solecito2a,        0xFF00      // Color #FFFF00
.equ solecito2b,        0x00FF      // Color #FFFF00
.equ solecito3a,        0xFF00      // Color #FFFF00
.equ solecito3b,        0x00FF      // Color #FFFF00
.equ solecito4a,        0xFF00      // Color #FFFF00
.equ solecito4b,        0x00FF      // Color #FFFF00
.equ mara,              0x00CD      // Color #0000CD
.equ marb,              0x0000      // Color #0000CD
.equ costaa,            0xBFFF      // Color #00BFFF
.equ costab,            0x0000      // Color #00BFFF
.equ playaa,            0xE8AA      // Color #EEA8AA
.equ playab,            0x00EE      // Color #EEA8AA
.equ bote_a,            0x7F7F      // Color #7F7F7F
.equ bote_b,            0x7F7F      // Color #7F7F7F
.equ mar_1a,            0xCEFA      // Color #87CEFA
.equ mar_1b,            0x0087      // Color #87CEFA
.equ mar_2a,            0xCEFA      // Color #87CEFA
.equ mar_2b,            0x0087      // Color #87CEFA
.equ mastil_a,          0x4513      // Color #8B4513
.equ mastil_b,          0x008B      // Color #8B4513
.equ vela_1a,           0xFFFF      // Color #FFFFFF
.equ vela_1b,           0x00FF      // Color #FFFFFF

pintar_fondo:
        // Configurar color del fondo en x10 (#87CEFA)
        movz x10, 0xCE87, lsl 16
        movk x10, 0xCEFA, lsl 00

        // Inicializar el framebuffer con fondo
        mov x2, SCREEN_HEIGHT        // Y Size
    loop1:
        mov x1, SCREEN_WIDTH        // X Size
    loop0:
        stur w10, [x0]  // Colorear el pixel N con el color de fondo
        add x0, x0, 4    // Siguiente pixel
        sub x1, x1, 1    // Decrementar contador X
        cbnz x1, loop0  // Si no terminó la fila, salto
        sub x2, x2, 1    // Decrementar contador Y
        cbnz x2, loop1  // Si no es la última fila, salto 
    ret

pintar_sol:
        // Configurar color
        movz x11, sol1a, lsl 00
        movk x11, sol1b, lsl 16

        // Dibujar
        mov x2, SCREEN_HEIGHT        // Resetear Y Size
        ldr x0, [x20]                // Resetear dirección base del framebuffer

        // Coordenadas
        .equ sol_TOP_X, 288
        .equ sol_TOP_Y, 45
        .equ sol_WIDTH, 65
        .equ sol_HEIGHT, 65

        // Dibujar la cara superior
        mov x3, sol_TOP_Y          // Y actual
    loop2:
        cmp x3, sol_TOP_Y + sol_HEIGHT
        b.ge end_pintar_sol
        mov x4, sol_TOP_X          // X actual

    loop3:
        cmp x4,sol_TOP_X + sol_WIDTH
        b.ge next_row_sol   

        // Dibujar píxel
        mov x1, SCREEN_WIDTH
        mul x5, x3, x1             // Y * SCREEN_WIDTH
        add x5, x5, x4             // (Y * SCREEN_WIDTH) + X
        lsl x5, x5, 2              // Dirección de memoria = Dirección base + 4 * índice
        add x5, x20, x5            // Agregar dirección base
        stur w11, [x5]             // Colorear el pixel con el color

        add x4, x4, 1              // Incrementar X
        b loop3
        next_row_sol:
        add x3, x3, 1              // Incrementar Y
        b loop2

    end_pintar_sol:
    ret

pintar_sol2:
        // Configurar color
        movz x11, sol2a, lsl 00
        movk x11, sol2b, lsl 16

        // Dibujar
        mov x2, SCREEN_HEIGHT        // Resetear Y Size
        ldr x0, [x20]                // Resetear dirección base del framebuffer

        // Coordenadas
        .equ sol2_TOP_X, 296
        .equ sol2_TOP_Y, 52
        .equ sol2_WIDTH, 50
        .equ sol2_HEIGHT, 50

        // Dibujar la cara superior
        mov x3, sol2_TOP_Y          // Y actual
    loop4:
        cmp x3, sol2_TOP_Y + sol2_HEIGHT
        b.ge end_pintar_sol2
        mov x4, sol2_TOP_X          // X actual

    loop5:
        cmp x4,sol2_TOP_X + sol2_WIDTH
        b.ge next_row_sol2   

        // Dibujar píxel
        mov x1, SCREEN_WIDTH
        mul x5, x3, x1             // Y * SCREEN_WIDTH
        add x5, x5, x4             // (Y * SCREEN_WIDTH) + X
        lsl x5, x5, 2              // Dirección de memoria = Dirección base + 4 * índice
        add x5, x20, x5            // Agregar dirección base
        stur w11, [x5]             // Colorear el pixel con el color

        add x4, x4, 1              // Incrementar X
        b loop5
        next_row_sol2:
        add x3, x3, 1              // Incrementar Y
        b loop4

    end_pintar_sol2:
    ret

pintar_solecito:
        // Configurar color
        movz x11, solecito1a, lsl 00
        movk x11, solecito1b, lsl 16

        // Dibujar
        mov x2, SCREEN_HEIGHT        // Resetear Y Size
        ldr x0, [x20]                // Resetear dirección base del framebuffer

        // Coordenadas
        .equ solecito_TOP_X, 255
        .equ solecito_TOP_Y, 65
        .equ solecito_WIDTH, 25
        .equ solecito_HEIGHT, 25

        // Dibujar la cara superior
        mov x3, solecito_TOP_Y          // Y actual
    loop6:
        cmp x3, solecito_TOP_Y + solecito_HEIGHT
        b.ge end_pintar_solecito

        mov x4, solecito_TOP_X          // X actual
    loop7:
        cmp x4,solecito_TOP_X + solecito_WIDTH
        b.ge next_row_solecito   

        // Dibujar píxel
        mov x1, SCREEN_WIDTH
        mul x5, x3, x1             // Y * SCREEN_WIDTH
        add x5, x5, x4             // (Y * SCREEN_WIDTH) + X
        lsl x5, x5, 2              // Dirección de memoria = Dirección base + 4 * índice
        add x5, x20, x5            // Agregar dirección base
        stur w11, [x5]             // Colorear el pixel con el color

        add x4, x4, 1              // Incrementar X
        b loop7
        next_row_solecito:
        add x3, x3, 1              // Incrementar Y
        b loop6

    end_pintar_solecito:
    ret

pintar_solecito2:
        // Configurar color
        movz x11, solecito2a, lsl 00
        movk x11, solecito2b, lsl 16

        // Dibujar
        mov x2, SCREEN_HEIGHT        // Resetear Y Size
        ldr x0, [x20]                // Resetear dirección base del framebuffer

        // Coordenadas
        .equ solecito2_TOP_X, 361
        .equ solecito2_TOP_Y, 65
        .equ solecito2_WIDTH, 25
        .equ solecito2_HEIGHT, 25

        // Dibujar la cara superior
        mov x3, solecito2_TOP_Y          // Y actual
    loop8:
        cmp x3, solecito2_TOP_Y + solecito2_HEIGHT
        b.ge end_pintar_solecito2

        mov x4, solecito2_TOP_X          // X actual
    loop9:
        cmp x4,solecito2_TOP_X + solecito2_WIDTH
        b.ge next_row_solecito2   

        // Dibujar píxel
        mov x1, SCREEN_WIDTH
        mul x5, x3, x1             // Y * SCREEN_WIDTH
        add x5, x5, x4             // (Y * SCREEN_WIDTH) + X
        lsl x5, x5, 2              // Dirección de memoria = Dirección base + 4 * índice
        add x5, x20, x5            // Agregar dirección base
        stur w11, [x5]             // Colorear el pixel con el color

        add x4, x4, 1              // Incrementar X
        b loop9
        next_row_solecito2:
        add x3, x3, 1              // Incrementar Y
        b loop8

    end_pintar_solecito2:
    ret

pintar_solecito3:
        // Configurar color
        movz x11, solecito3a, lsl 00
        movk x11, solecito3b, lsl 16

        // Dibujar
        mov x2, SCREEN_HEIGHT        // Resetear Y Size
        ldr x0, [x20]                // Resetear dirección base del framebuffer

        // Coordenadas
        .equ solecito3_TOP_X, 309
        .equ solecito3_TOP_Y, 13
        .equ solecito3_WIDTH, 25
        .equ solecito3_HEIGHT, 25

        // Dibujar la cara superior
        mov x3, solecito3_TOP_Y          // Y actual
    loop10:
        cmp x3, solecito3_TOP_Y + solecito3_HEIGHT
        b.ge end_pintar_solecito3

        mov x4, solecito3_TOP_X          // X actual
    loop11:
        cmp x4,solecito3_TOP_X + solecito3_WIDTH
        b.ge next_row_solecito3   

        // Dibujar píxel
        mov x1, SCREEN_WIDTH
        mul x5, x3, x1             // Y * SCREEN_WIDTH
        add x5, x5, x4             // (Y * SCREEN_WIDTH) + X
        lsl x5, x5, 2              // Dirección de memoria = Dirección base + 4 * índice
        add x5, x20, x5            // Agregar dirección base
        stur w11, [x5]             // Colorear el pixel con el color

        add x4, x4, 1              // Incrementar X
        b loop11
        next_row_solecito3:
        add x3, x3, 1              // Incrementar Y
        b loop10

    end_pintar_solecito3:
    ret

pintar_solecito4:
        // Configurar color
        movz x11, solecito4a, lsl 00
        movk x11, solecito4b, lsl 16

        // Dibujar
        mov x2, SCREEN_HEIGHT        // Resetear Y Size
        ldr x0, [x20]                // Resetear dirección base del framebuffer

        // Coordenadas
        .equ solecito4_TOP_X, 309
        .equ solecito4_TOP_Y, 117
        .equ solecito4_WIDTH, 25
        .equ solecito4_HEIGHT, 25

        // Dibujar la cara superior
        mov x3, solecito4_TOP_Y          // Y actual
    loop12:
        cmp x3, solecito4_TOP_Y + solecito4_HEIGHT
        b.ge end_pintar_solecito4

        mov x4, solecito4_TOP_X          // X actual
    loop13:
        cmp x4,solecito4_TOP_X + solecito4_WIDTH
        b.ge next_row_solecito4   

        // Dibujar píxel
        mov x1, SCREEN_WIDTH
        mul x5, x3, x1             // Y * SCREEN_WIDTH
        add x5, x5, x4             // (Y * SCREEN_WIDTH) + X
        lsl x5, x5, 2              // Dirección de memoria = Dirección base + 4 * índice
        add x5, x20, x5            // Agregar dirección base
        stur w11, [x5]             // Colorear el pixel con el color

        add x4, x4, 1              // Incrementar X
        b loop13
        next_row_solecito4:
        add x3, x3, 1              // Incrementar Y
        b loop12

    end_pintar_solecito4:
    ret

pintar_mar:
        // Configurar color
        movz x11, mara, lsl 00
        movk x11, marb, lsl 16

        // Dibujar
        mov x2, SCREEN_HEIGHT        // Resetear Y Size
        ldr x0, [x20]                // Resetear dirección base del framebuffer

        // Coordenadas
        .equ mar_TOP_X, 0
        .equ mar_TOP_Y, 245
        .equ mar_WIDTH, 640
        .equ mar_HEIGHT, 230

        // Dibujar la cara superior
        mov x3, mar_TOP_Y          // Y actual
    loop14:
        cmp x3, mar_TOP_Y + mar_HEIGHT
        b.ge end_pintar_mar

        mov x4, mar_TOP_X          // X actual
    loop15:
        cmp x4,mar_TOP_X + mar_WIDTH
        b.ge next_row_mar   

        // Dibujar píxel
        mov x1, SCREEN_WIDTH
        mul x5, x3, x1             // Y * SCREEN_WIDTH
        add x5, x5, x4             // (Y * SCREEN_WIDTH) + X
        lsl x5, x5, 2              // Dirección de memoria = Dirección base + 4 * índice
        add x5, x20, x5            // Agregar dirección base
        stur w11, [x5]             // Colorear el pixel con el color

        add x4, x4, 1              // Incrementar X
        b loop15
        next_row_mar:
        add x3, x3, 1              // Incrementar Y
        b loop14

    end_pintar_mar:
    ret

pintar_costa:
        // Configurar color
        movz x11, costaa, lsl 00
        movk x11, costab, lsl 16

        // Dibujar
        mov x2, SCREEN_HEIGHT        // Resetear Y Size
        ldr x0, [x20]                // Resetear dirección base del framebuffer

        // Coordenadas
        .equ costa_TOP_X, 0
        .equ costa_TOP_Y, 270
        .equ costa_WIDTH, 640
        .equ costa_HEIGHT, 230

        // Dibujar la cara superior
        mov x3, costa_TOP_Y          // Y actual
    loop16:
        cmp x3, costa_TOP_Y + costa_HEIGHT
        b.ge end_pintar_costa

        mov x4, costa_TOP_X          // X actual
    loop17:
        cmp x4,costa_TOP_X + costa_WIDTH
        b.ge next_row_costa   

        // Dibujar píxel
        mov x1, SCREEN_WIDTH
        mul x5, x3, x1             // Y * SCREEN_WIDTH
        add x5, x5, x4             // (Y * SCREEN_WIDTH) + X
        lsl x5, x5, 2              // Dirección de memoria = Dirección base + 4 * índice
        add x5, x20, x5            // Agregar dirección base
        stur w11, [x5]             // Colorear el pixel con el color

        add x4, x4, 1              // Incrementar X
        b loop17
        next_row_costa:
        add x3, x3, 1              // Incrementar Y
        b loop16

    end_pintar_costa:
    ret

pintar_playa:
        // Configurar color
        movz x11, playaa, lsl 00
        movk x11, playab, lsl 16

        // Dibujar
        mov x2, SCREEN_HEIGHT        // Resetear Y Size
        ldr x0, [x20]                // Resetear dirección base del framebuffer

        // Coordenadas
        .equ playa_TOP_X, 0
        .equ playa_TOP_Y, 300
        .equ playa_WIDTH, 640
        .equ playa_HEIGHT, 200

        // Dibujar la cara superior
        mov x3, playa_TOP_Y          // Y actual
    loop18:
        cmp x3, playa_TOP_Y + playa_HEIGHT
        b.ge end_pintar_playa

        mov x4, playa_TOP_X          // X actual
    loop19:
        cmp x4,playa_TOP_X + playa_WIDTH
        b.ge next_row_playa   

        // Dibujar píxel
        mov x1, SCREEN_WIDTH
        mul x5, x3, x1             // Y * SCREEN_WIDTH
        add x5, x5, x4             // (Y * SCREEN_WIDTH) + X
        lsl x5, x5, 2              // Dirección de memoria = Dirección base + 4 * índice
        add x5, x20, x5            // Agregar dirección base
        stur w11, [x5]             // Colorear el pixel con el color

        add x4, x4, 1              // Incrementar X
        b loop19
        next_row_playa:
        add x3, x3, 1              // Incrementar Y
        b loop18

    end_pintar_playa:
    ret

 parte_mastil:
        // Configurar color
        movz x12,mastil_a, lsl 00
        movk x12, mastil_b, lsl 16

        // Dibujar
        mov x2, SCREEN_HEIGHT        // Resetear Y Size
        ldr x0, [x20]                // Resetear dirección base del framebuffer

        // Coordenadas
        .equ mastil_TOP_X,265
        .equ mastil_TOP_Y, 200 
        .equ mastil_WIDTH, 10
        .equ mastil_HEIGHT,30

        // Dibujar la cara superior
        mov x3, mastil_TOP_Y          // Y actual
    loop22:
        cmp x3, mastil_TOP_Y + mastil_HEIGHT
        b.ge end_parte_mastil
        mov x4, mastil_TOP_X          // X actual

    loop23:
        cmp x4,mastil_TOP_X + mastil_WIDTH
        b.ge next_row_mastil   

        // Dibujar píxel
        mov x1, SCREEN_WIDTH
        mul x5, x3, x1             // Y * SCREEN_WIDTH
        add x5, x5, x4             // (Y * SCREEN_WIDTH) + X
        lsl x5, x5, 2              // Dirección de memoria = Dirección base + 4 * índice
        add x5, x20, x5            // Agregar dirección base
        stur w12, [x5]             // Colorear el pixel con el color

        add x4, x4, 1              // Incrementar X
        b loop23
        next_row_mastil:
        add x3, x3, 1              // Incrementar Y
        b loop22

    end_parte_mastil:

parte_bote:        
        // Configurar color
        movz x11, bote_a, lsl 00 
        movk x11, bote_b, lsl 16

        // Dibujar   
        mov x2, SCREEN_HEIGHT        // Res etear Y Size
        ldr x0, [x20]                 // Resete ar dirección base del framebuffer
   
        // Coordenadas  
        .equ bote_TOP_X, 220
        .equ bote_TOP_Y, 225
        .equ bote_WIDTH, 100
        .equ bote_HEIGHT,20

        // Dibujar la cara superior
        mov x3, bote_TOP_Y          // Y actual
    loop20:
        cmp x3, bote_TOP_Y + bote_HEIGHT
        b.ge end_parte_bote

        mov x4, bote_TOP_X          // X actual
    loop21:
        cmp x4,bote_TOP_X + bote_WIDTH
        b.ge next_row_bote   

        // Dibujar píxel
        mov x1, SCREEN_WIDTH
        mul x5, x3, x1             // Y * SCREEN_WIDTH
        add x5, x5, x4             // (Y * SCREEN_WIDTH) + X
        lsl x5, x5, 2              // Dirección de memoria = Dirección base + 4 * índice
        add x5, x20, x5            // Agregar dirección base
        stur w11, [x5]             // Colorear el pixel con el color

        add x4, x4, 1              // Incrementar X
        b loop21
        next_row_bote:
        add x3, x3, 1              // Incrementar Y
        b loop20

    end_parte_bote:


pintar_mar_1:
    // Configurar color del triángulo en x14 (blanco)
    movz x14, mar_1a, lsl 00
    movk x14, mar_1b, lsl 16

    // Coordenadas del triángulo
    .equ mar_1_TOP_X, 210
    .equ mar_1_TOP_Y, 205
    .equ mar_1_BASE_WIDTH, 60
    .equ mar_1_HEIGHT, 40 
 
    // Dibujar el triángulo
        mov x3, mar_1_TOP_Y          // Y actual
    draw_mar_1_loop:
        cmp x3, #mar_1_TOP_Y + mar_1_HEIGHT
        b.ge end_draw_mar_1

        // Calcular la posición inicial y final en X para cada línea
        sub x4, x3, #mar_1_TOP_Y
        lsl x4, x4, 1
        mov x10, #mar_1_BASE_WIDTH
        sub x4, x10, x4
        asr x4, x4, 1
        add x4, x4, #mar_1_TOP_X

        sub x5, x3, #mar_1_TOP_Y
        lsl x5, x5, 1
        asr x5, x5, 1
        add x5, x5, #mar_1_TOP_X

        mov x6, x4

    draw_mar_1_row:
        cmp x6, x5
        b.gt next_mar_1_row

        // Dibujar píxel del triángulo
        mov x1, #SCREEN_WIDTH
        mul x7, x3, x1             // Y * SCREEN_WIDTH
        add x7, x7, x6             // (Y * SCREEN_WIDTH) + X
        lsl x7, x7, 2              // Dirección de memoria = Dirección base + 4 * índice
        add x7, x20, x7            // Agregar dirección base
        str w14, [x7]              // Colorear el pixel con el color del triángulo

        add x6, x6, 1              // Incrementar X
        b draw_mar_1_row

    next_mar_1_row:
        add x3, x3, 1              // Incrementar Y
        b draw_mar_1_loop

    end_draw_mar_1:
        ret

pintar_mar_2: 
    // Configurar color del triángulo en x14 (blanco)
    movz x14, mar_2a, lsl 00
    movk x14, mar_2b, lsl 16

    // Coordenadas del triángulo
    .equ mar_2_TOP_X, (90 + mar_1_TOP_X)
    .equ mar_2_TOP_Y, (0       + mar_1_TOP_Y)
    .equ mar_2_BASE_WIDTH, 60
    .equ mar_2_HEIGHT, 40

    // Dibujar el triángulo
        mov x3, mar_2_TOP_Y          // Y actual
    draw_mar_2_loop:
        cmp x3, #mar_2_TOP_Y + mar_2_HEIGHT
        b.ge end_draw_mar_2

        // Calcular la posición inicial y final en X para cada línea
        sub x4, x3, #mar_2_TOP_Y
        lsl x4, x4, 1
        mov x10, #mar_2_BASE_WIDTH
        sub x4, x10, x4
        asr x4, x4, 1
        add x4, x4, #mar_2_TOP_X

        sub x5, x3, #mar_2_TOP_Y
        lsl x5, x5, 1
        asr x5, x5, 1
        add x5, x5, #mar_2_TOP_X

        mov x6, x4

    draw_mar_2_row:
        cmp x6, x5
        b.gt next_mar_2_row

        // Dibujar píxel del triángulo
        mov x1, #SCREEN_WIDTH
        mul x7, x3, x1             // Y * SCREEN_WIDTH
        add x7, x7, x6             // (Y * SCREEN_WIDTH) + X
        lsl x7, x7, 2              // Dirección de memoria = Dirección base + 4 * índice
        add x7, x20, x7            // Agregar dirección base
        str w14, [x7]              // Colorear el pixel con el color del triángulo

        add x6, x6, 1              // Incrementar X
        b draw_mar_2_row

    next_mar_2_row:
        add x3, x3, 1              // Incrementar Y
        b draw_mar_2_loop

    end_draw_mar_2:
        ret 

pintar_vela: 
    // Configurar color del triángulo en x14 (blanco)
    movz x14, vela_1a, lsl 00
    movk x14, vela_1b, lsl 16

    // Coordenadas del triángulo
    .equ vela_TOP_X, 230
    .equ vela_TOP_Y, 140
    .equ vela_BASE_WIDTH, 150
    .equ vela_HEIGHT, 75
 
    // Dibujar el triángulo
        mov x3, vela_TOP_Y          // Y actual
    draw_vela_loop:
        cmp x3, #vela_TOP_Y + vela_HEIGHT
        b.ge end_draw_vela

        // Calcular la posición inicial y final en X para cada línea
        sub x4, x3, #vela_TOP_Y
        lsl x4, x4, 1
        mov x10, #vela_BASE_WIDTH
        sub x4, x10, x4
        asr x4, x4, 1
        add x4, x4, #vela_TOP_X

        sub x5, x3, #vela_TOP_Y
        lsl x5, x5, 1
        asr x5, x5, 1
        add x5, x5, #vela_TOP_X

        mov x6, x4

    draw_vela_row:
        cmp x6, x5
        b.gt next_vela_row

        // Dibujar píxel del triángulo
        mov x1, #SCREEN_WIDTH
        mul x7, x3, x1             // Y * SCREEN_WIDTH
        add x7, x7, x6             // (Y * SCREEN_WIDTH) + X
        lsl x7, x7, 2              // Dirección de memoria = Dirección base + 4 * índice
        add x7, x20, x7            // Agregar dirección base
        str w14, [x7]              // Colorear el pixel con el color del triángulo

        add x6, x6, 1              // Incrementar X
        b draw_vela_row

    next_vela_row:
        add x3, x3, 1              // Incrementar Y
        b draw_vela_loop

    end_draw_vela:
        ret 

 