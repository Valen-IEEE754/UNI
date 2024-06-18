.equ SCREEN_WIDTH,   640
.equ SCREEN_HEIGHT,   480
.equ BITS_PER_PIXEL, 32

.equ pared1a,           0xFFFF      // Color #FFFFFF
.equ pared1b,           0x00FF      // Color #FFFFFF
.equ pared2a,           0xFFFF      // Color #FFFFFF
.equ pared2b,           0x00FF      // Color #FFFFFF
.equ pared3a,           0xFFFF      // Color #FFFFFF
.equ pared3b,           0x00FF      // Color #FFFFFF
.equ cortina1a,         0xE68C      // Color #F0E68C
.equ cortina1b,         0x00F0      // Color #F0E68C
.equ cortina2a,         0xE68C      // Color #F0E68C
.equ cortina2b,         0x00F0      // Color #F0E68C
.equ mesaa,             0x522D      // Color #A0522D
.equ mesab,             0x00A0      // Color #A0522D
.equ palocortinaa,      0x3812      // Color #7A3812
.equ palocortinab,      0x007A      // Color #7A3812
.equ decocortinaa,      0xA460      // Color #F4A460
.equ decocortinab,      0x00F4      // Color #F4A460
.equ marco1a,           0x6639      // Color #B56639
.equ marco1b,           0x00B5      // Color #B56639
.equ marco2a,           0x6639      // Color #B56639
.equ marco2b,           0x00B5      // Color #B56639
.equ marco3a,           0x6639      // Color #B56639
.equ marco3b,           0x00B5      // Color #B56639
.equ marco4a,           0x6639      // Color #B56639
.equ marco4b,           0x00B5      // Color #B56639

pintar_pared1:
        // Configurar color
        movz x11, pared1a, lsl 00
        movk x11, pared1b, lsl 16

        // Dibujar
        mov x2, SCREEN_HEIGHT        // Resetear Y Size
        ldr x0, [x20]                // Resetear dirección base del framebuffer

        // Coordenadas
        .equ pared1_TOP_X, 440
        .equ pared1_TOP_Y, 0
        .equ pared1_WIDTH, 400
        .equ pared1_HEIGHT, 480

        // Dibujar la cara superior
        mov x3, pared1_TOP_Y          // Y actual
    loop00:
        cmp x3, pared1_TOP_Y + pared1_HEIGHT
        b.ge end_pintar_pared1

        mov x4, pared1_TOP_X          // X actual
    loop01:
        cmp x4,pared1_TOP_X + pared1_WIDTH
        b.ge next_row_pared1   

        // Dibujar píxel
        mov x1, SCREEN_WIDTH
        mul x5, x3, x1             // Y * SCREEN_WIDTH
        add x5, x5, x4             // (Y * SCREEN_WIDTH) + X
        lsl x5, x5, 2              // Dirección de memoria = Dirección base + 4 * índice
        add x5, x20, x5            // Agregar dirección base
        stur w11, [x5]             // Colorear el pixel con el color

        add x4, x4, 1              // Incrementar X
        b loop01
        next_row_pared1:
        add x3, x3, 1              // Incrementar Y
        b loop00

    end_pintar_pared1:
    ret

pintar_pared2:
        // Configurar color
        movz x12, pared2a, lsl 00
        movk x12, pared2b, lsl 16

        // Dibujar
        mov x2, SCREEN_HEIGHT        // Resetear Y Size
        ldr x0, [x20]                // Resetear dirección base del framebuffer

        // Coordenadas
        .equ pared2_TOP_X, 0
        .equ pared2_TOP_Y, 330
        .equ pared2_WIDTH, 640
        .equ pared2_HEIGHT, 200

        // Dibujar la cara superior
        mov x3, pared2_TOP_Y          // Y actual
    loop02:
        cmp x3, pared2_TOP_Y + pared2_HEIGHT
        b.ge end_pintar_pared2
        mov x4, pared2_TOP_X          // X actual

    loop03:
        cmp x4,pared2_TOP_X + pared2_WIDTH
        b.ge next_row_pared2   

        // Dibujar píxel
        mov x1, SCREEN_WIDTH
        mul x5, x3, x1             // Y * SCREEN_WIDTH
        add x5, x5, x4             // (Y * SCREEN_WIDTH) + X
        lsl x5, x5, 2              // Dirección de memoria = Dirección base + 4 * índice
        add x5, x20, x5            // Agregar dirección base
        stur w12, [x5]             // Colorear el pixel con el color

        add x4, x4, 1              // Incrementar X
        b loop03
        next_row_pared2:
        add x3, x3, 1              // Incrementar Y
        b loop02

    end_pintar_pared2:
    ret

pintar_pared3:
        // Configurar color
        movz x12, pared3a, lsl 00
        movk x12, pared3b, lsl 16

        // Dibujar
        mov x2, SCREEN_HEIGHT        // Resetear Y Size
        ldr x0, [x20]                // Resetear dirección base del framebuffer

        // Coordenadas
        .equ pared3_TOP_X, 0
        .equ pared3_TOP_Y, 0
        .equ pared3_WIDTH, 640
        .equ pared3_HEIGHT, 40

        // Dibujar la cara superior
        mov x3, pared3_TOP_Y          // Y actual
    loop04:
        cmp x3, pared3_TOP_Y + pared3_HEIGHT
        b.ge end_pintar_pared3
        mov x4, pared3_TOP_X          // X actual

    loop05:
        cmp x4,pared3_TOP_X + pared3_WIDTH
        b.ge next_row_pared3

        // Dibujar píxel
        mov x1, SCREEN_WIDTH
        mul x5, x3, x1             // Y * SCREEN_WIDTH
        add x5, x5, x4             // (Y * SCREEN_WIDTH) + X
        lsl x5, x5, 2              // Dirección de memoria = Dirección base + 4 * índice
        add x5, x20, x5            // Agregar dirección base
        stur w12, [x5]             // Colorear el pixel con el color

        add x4, x4, 1              // Incrementar X
        b loop05
        next_row_pared3:
        add x3, x3, 1              // Incrementar Y
        b loop04

    end_pintar_pared3:
    ret

pintar_cortina1:
        // Configurar color
        movz x12, cortina1a, lsl 00
        movk x12, cortina1b, lsl 16

        // Dibujar
        mov x2, SCREEN_HEIGHT        // Resetear Y Size
        ldr x0, [x20]                // Resetear dirección base del framebuffer

        // Coordenadas
        .equ cortina1_TOP_X, 0
        .equ cortina1_TOP_Y, 10
        .equ cortina1_WIDTH, 160
        .equ cortina1_HEIGHT, 290

        // Dibujar la cara superior
        mov x3, cortina1_TOP_Y          // Y actual
    loop06:
        cmp x3, cortina1_TOP_Y + cortina1_HEIGHT
        b.ge end_pintar_cortina1
        mov x4, cortina1_TOP_X          // X actual

    loop07:
        cmp x4,cortina1_TOP_X + cortina1_WIDTH
        b.ge next_row_cortina1   

        // Dibujar píxel
        mov x1, SCREEN_WIDTH
        mul x5, x3, x1             // Y * SCREEN_WIDTH
        add x5, x5, x4             // (Y * SCREEN_WIDTH) + X
        lsl x5, x5, 2              // Dirección de memoria = Dirección base + 4 * índice
        add x5, x20, x5            // Agregar dirección base
        stur w12, [x5]             // Colorear el pixel con el color

        add x4, x4, 1              // Incrementar X
        b loop07
        next_row_cortina1:
        add x3, x3, 1              // Incrementar Y
        b loop06

    end_pintar_cortina1:
    ret
 
pintar_cortina2:
        // Configurar color
        movz x12, cortina2a, lsl 00
        movk x12, cortina2b, lsl 16

        // Dibujar
        mov x2, SCREEN_HEIGHT        // Resetear Y Size
        ldr x0, [x20]                // Resetear dirección base del framebuffer

        // Coordenadas
        .equ cortina2_TOP_X, 480
        .equ cortina2_TOP_Y, 10
        .equ cortina2_WIDTH, 160
        .equ cortina2_HEIGHT, 290

        // Dibujar la cara superior
        mov x3, cortina2_TOP_Y          // Y actual
    loop08:
        cmp x3, cortina2_TOP_Y + cortina2_HEIGHT
        b.ge end_pintar_cortina2
        mov x4, cortina2_TOP_X          // X actual

    loop09:
        cmp x4,cortina2_TOP_X + cortina2_WIDTH
        b.ge next_row_cortina2 

        // Dibujar píxel
        mov x1, SCREEN_WIDTH
        mul x5, x3, x1             // Y * SCREEN_WIDTH
        add x5, x5, x4             // (Y * SCREEN_WIDTH) + X
        lsl x5, x5, 2              // Dirección de memoria = Dirección base + 4 * índice
        add x5, x20, x5            // Agregar dirección base
        stur w12, [x5]             // Colorear el pixel con el color

        add x4, x4, 1              // Incrementar X
        b loop09
        next_row_cortina2:
        add x3, x3, 1              // Incrementar Y
        b loop08

    end_pintar_cortina2:
    ret

pintar_mesa:

        // Configurar color
        movz x12, mesaa, lsl 00
        movk x12, mesab, lsl 16

        // Dibujar
        mov x2, SCREEN_HEIGHT        // Resetear Y Size
        ldr x0, [x20]                // Resetear dirección base del framebuffer

        // Coordenadas
        .equ mesa_TOP_X, 0
        .equ mesa_TOP_Y, 400
        .equ mesa_WIDTH, 640
        .equ mesa_HEIGHT, 480

        // Dibujar la cara superior
        mov x3, mesa_TOP_Y          // Y actual
    loop010:
        cmp x3, mesa_TOP_Y + mesa_HEIGHT
        b.ge end_pintar_mesa
        mov x4, mesa_TOP_X          // X actual

    loop011:
        cmp x4,mesa_TOP_X + mesa_WIDTH
        b.ge next_row_mesa

        // Dibujar píxel
        mov x1, SCREEN_WIDTH
        mul x5, x3, x1             // Y * SCREEN_WIDTH
        add x5, x5, x4             // (Y * SCREEN_WIDTH) + X
        lsl x5, x5, 2              // Dirección de memoria = Dirección base + 4 * índice
        add x5, x20, x5            // Agregar dirección base
        stur w12, [x5]             // Colorear el pixel con el color

        add x4, x4, 1              // Incrementar X
        b loop011
        next_row_mesa:
        add x3, x3, 1              // Incrementar Y
        b loop010

    end_pintar_mesa:
    ret

pintar_palo_cortina:

        // Configurar color
        movz x12, palocortinaa, lsl 00
        movk x12, palocortinab, lsl 16

        // Dibujar
        mov x2, SCREEN_HEIGHT        // Resetear Y Size
        ldr x0, [x20]                // Resetear dirección base del framebuffer

        // Coordenadas
        .equ palocortina_TOP_X, 0
        .equ palocortina_TOP_Y, 15
        .equ palocortina_WIDTH, 640
        .equ palocortina_HEIGHT, 10

        // Dibujar la cara superior
        mov x3, palocortina_TOP_Y          // Y actual
    loop012:
        cmp x3, palocortina_TOP_Y + palocortina_HEIGHT
        b.ge end_pintar_palo_cortina
        mov x4, palocortina_TOP_X          // X actual

    loop013:
        cmp x4,palocortina_TOP_X + palocortina_WIDTH
        b.ge next_row_palo_cortina

        // Dibujar píxel
        mov x1, SCREEN_WIDTH
        mul x5, x3, x1             // Y * SCREEN_WIDTH
        add x5, x5, x4             // (Y * SCREEN_WIDTH) + X
        lsl x5, x5, 2              // Dirección de memoria = Dirección base + 4 * índice
        add x5, x20, x5            // Agregar dirección base
        stur w12, [x5]             // Colorear el pixel con el color

        add x4, x4, 1              // Incrementar X
        b loop013
        next_row_palo_cortina:
        add x3, x3, 1              // Incrementar Y
        b loop012

    end_pintar_palo_cortina:
    ret

pintar_deco_cortina:

        // Configurar color del segundo cubo en x12 (azul)
        movz x12, decocortinaa, lsl 00
        movk x12, decocortinab, lsl 16

        // Dibujar el segundo cubo
        mov x2, SCREEN_HEIGHT        // Resetear Y Size
        ldr x0, [x20]                // Resetear dirección base del framebuffer

        // Coordenadas del segundo cubo
        .equ decocortina_TOP_X, 480
        .equ decocortina_TOP_Y, 250
        .equ decocortina_WIDTH, 320
        .equ decocortina_HEIGHT, 40

        // Dibujar la cara superior del segundo cubo
        mov x3, decocortina_TOP_Y          // Y actual
    loop014:
        cmp x3, decocortina_TOP_Y + decocortina_HEIGHT
        b.ge end_pintar_deco_cortina
        mov x4, decocortina_TOP_X          // X actual

    loop015:
        cmp x4,decocortina_TOP_X + decocortina_WIDTH
        b.ge next_row_deco_cortina

        // Dibujar píxel del segundo cubo
        mov x1, SCREEN_WIDTH
        mul x5, x3, x1             // Y * SCREEN_WIDTH
        add x5, x5, x4             // (Y * SCREEN_WIDTH) + X
        lsl x5, x5, 2              // Dirección de memoria = Dirección base + 4 * índice
        add x5, x20, x5            // Agregar dirección base
        stur w12, [x5]             // Colorear el pixel con el color del segundo cubo

        add x4, x4, 1              // Incrementar X
        b loop015
        next_row_deco_cortina:
        add x3, x3, 1              // Incrementar Y
        b loop014

    end_pintar_deco_cortina:
    ret

pintar_marco_ventana1:
        // Configurar color
        movz x11, marco1a, lsl 00
        movk x11, marco1b, lsl 16

        // Dibujar
        mov x2, SCREEN_HEIGHT        // Resetear Y Size
        ldr x0, [x20]                // Resetear dirección base del framebuffer

        // Coordenadas
        .equ marco_ventana1_TOP_X, 190
        .equ marco_ventana1_TOP_Y, 40
        .equ marco_ventana1_WIDTH, 10
        .equ marco_ventana1_HEIGHT, 290

        // Dibujar la cara superior
        mov x3, marco_ventana1_TOP_Y          // Y actual
    loop016:
        cmp x3, marco_ventana1_TOP_Y + marco_ventana1_HEIGHT
        b.ge end_pintar_marco_ventana1
        mov x4, marco_ventana1_TOP_X          // X actual

    loop017:
        cmp x4,marco_ventana1_TOP_X + marco_ventana1_WIDTH
        b.ge next_row_marco_ventana1   

        // Dibujar píxel
        mov x1, SCREEN_WIDTH
        mul x5, x3, x1             // Y * SCREEN_WIDTH
        add x5, x5, x4             // (Y * SCREEN_WIDTH) + X
        lsl x5, x5, 2              // Dirección de memoria = Dirección base + 4 * índice
        add x5, x20, x5            // Agregar dirección base
        stur w11, [x5]             // Colorear el pixel con el color

        add x4, x4, 1              // Incrementar X
        b loop017
        next_row_marco_ventana1:
        add x3, x3, 1              // Incrementar Y
        b loop016

    end_pintar_marco_ventana1:
    ret

pintar_marco_ventana2:
        // Configurar color
        movz x11, marco2a, lsl 00
        movk x11, marco2b, lsl 16

        // Dibujar
        mov x2, SCREEN_HEIGHT        // Resetear Y Size
        ldr x0, [x20]                // Resetear dirección base del framebuffer

        // Coordenadas
        .equ marco_ventana2_TOP_X, 440
        .equ marco_ventana2_TOP_Y, 40
        .equ marco_ventana2_WIDTH, 10
        .equ marco_ventana2_HEIGHT, 290

        // Dibujar la cara superior
        mov x3, marco_ventana2_TOP_Y          // Y actual
    loop018:
        cmp x3, marco_ventana2_TOP_Y + marco_ventana2_HEIGHT
        b.ge end_pintar_marco_ventana2
        mov x4, marco_ventana2_TOP_X          // X actual

    loop019:
        cmp x4,marco_ventana2_TOP_X + marco_ventana2_WIDTH
        b.ge next_row_marco_ventana2   

        // Dibujar píxel
        mov x1, SCREEN_WIDTH
        mul x5, x3, x1             // Y * SCREEN_WIDTH
        add x5, x5, x4             // (Y * SCREEN_WIDTH) + X
        lsl x5, x5, 2              // Dirección de memoria = Dirección base + 4 * índice
        add x5, x20, x5            // Agregar dirección base
        stur w11, [x5]             // Colorear el pixel con el color

        add x4, x4, 1              // Incrementar X
        b loop019
        next_row_marco_ventana2:
        add x3, x3, 1              // Incrementar Y
        b loop018

    end_pintar_marco_ventana2:
    ret

pintar_marco_ventana3:
        // Configurar color
        movz x11, marco3a, lsl 00
        movk x11, marco3b, lsl 16

        // Dibujar
        mov x2, SCREEN_HEIGHT        // Resetear Y Size
        ldr x0, [x20]                // Resetear dirección base del framebuffer

        // Coordenadas
        .equ marco_ventana3_TOP_X, 190
        .equ marco_ventana3_TOP_Y, 30
        .equ marco_ventana3_WIDTH, 260
        .equ marco_ventana3_HEIGHT, 10

        // Dibujar la cara superior
        mov x3, marco_ventana3_TOP_Y          // Y actual
    loop020:
        cmp x3, marco_ventana3_TOP_Y + marco_ventana3_HEIGHT
        b.ge end_pintar_marco_ventana3
        mov x4, marco_ventana3_TOP_X          // X actual

    loop021:
        cmp x4,marco_ventana3_TOP_X + marco_ventana3_WIDTH
        b.ge next_row_marco_ventana3   

        // Dibujar píxel
        mov x1, SCREEN_WIDTH
        mul x5, x3, x1             // Y * SCREEN_WIDTH
        add x5, x5, x4             // (Y * SCREEN_WIDTH) + X
        lsl x5, x5, 2              // Dirección de memoria = Dirección base + 4 * índice
        add x5, x20, x5            // Agregar dirección base
        stur w11, [x5]             // Colorear el pixel con el color

        add x4, x4, 1              // Incrementar X
        b loop021
        next_row_marco_ventana3:
        add x3, x3, 1              // Incrementar Y
        b loop020

    end_pintar_marco_ventana3:
    ret

pintar_marco_ventana4:
        // Configurar color
        movz x11, marco4a, lsl 00
        movk x11, marco4b, lsl 16

        // Dibujar
        mov x2, SCREEN_HEIGHT        // Resetear Y Size
        ldr x0, [x20]                // Resetear dirección base del framebuffer

        // Coordenadas
        .equ marco_ventana4_TOP_X, 190
        .equ marco_ventana4_TOP_Y, 330
        .equ marco_ventana4_WIDTH, 260
        .equ marco_ventana4_HEIGHT, 10

        // Dibujar la cara superior
        mov x3, marco_ventana4_TOP_Y          // Y actual
    loop022:
        cmp x3, marco_ventana4_TOP_Y + marco_ventana4_HEIGHT
        b.ge end_pintar_marco_ventana4
        mov x4, marco_ventana4_TOP_X          // X actual

    loop023:
        cmp x4,marco_ventana4_TOP_X + marco_ventana4_WIDTH
        b.ge next_row_marco_ventana4   

        // Dibujar píxel
        mov x1, SCREEN_WIDTH
        mul x5, x3, x1             // Y * SCREEN_WIDTH
        add x5, x5, x4             // (Y * SCREEN_WIDTH) + X
        lsl x5, x5, 2              // Dirección de memoria = Dirección base + 4 * índice
        add x5, x20, x5            // Agregar dirección base
        stur w11, [x5]             // Colorear el pixel con el color

        add x4, x4, 1              // Incrementar X
        b loop023
        next_row_marco_ventana4:
        add x3, x3, 1              // Incrementar Y
        b loop022

    end_pintar_marco_ventana4:
    ret

