.include "objetos.s"
.include "interior.s"
.include "fondo.s"
.include "animaciones.s"

.equ SCREEN_WIDTH,   640
.equ SCREEN_HEIGHT,   480
.equ BITS_PER_PIXEL, 32

.equ GPIO_BASE,    0x3f200000
.equ GPIO_GPFSEL0, 0x00
.equ GPIO_GPLEV0,  0x34

.globl main 

main:
    // x0 contiene la dirección base del framebuffer
    mov x20, x0 // Guarda la dirección base del framebuffer en x20

    //---------------- CODE HERE ------------------------------------
/**/ 
//---------------- VIÑETA 1 ------------------------------------

    bl pintar_fondo             // Pinta el fondo
    bl pintar_sol               // Pinta el sol
    bl pintar_sol2              // Pinta el sol
    bl pintar_solecito          // Pinta el sol
    bl pintar_solecito2         // Pinta el sol
    bl pintar_solecito3         // Pinta el sol
    bl pintar_solecito4         // Pinta el sol 
    bl pintar_mar               // Pinta el mar
    bl pintar_costa             // Pinta la costa
    bl pintar_playa             // Pinta la playa
    bl parte_mastil             // Pinta el mastil
    bl parte_bote               // Pinta parte del bote
    bl pintar_mar_1             // Pinta parte del mar
    bl pintar_mar_2             // Pinta parte del mar
    bl pintar_vela              // Pinta la vela
    bl pintar_pared1            // Pinta la pared
    bl pintar_pared2            // Pinta la pared
    bl pintar_pared3            // Pinta la pared
    bl pintar_cortina1          // Pinta la cortina
    bl pintar_cortina2          // Pinta la cortina
    bl pintar_mesa              // Pinta la mesa
    bl pintar_marco_ventana1    // Pinta el marco de la ventana
    bl pintar_marco_ventana2    // Pinta el marco de la ventana
    bl pintar_marco_ventana3    // Pinta el marco de la ventana
    bl pintar_marco_ventana4    // Pinta el marco de la ventana
    bl pintar_palo_cortina      // Pinta el palo de la cortina
    bl pintar_deco_cortina      // Pinta la decoración de la cortina
    bl pintar_cubito1           // Pinta al Señor Cubo
    bl pintar_cubito2           // Pinta al Señor Cubo
    bl pintar_cubito3           // Pinta al Señor Cubo  
    bl pintar_cubito4           // Pinta al Señor Cubo
    bl pintar_cubito5           // Pinta al Señor Cubo
    bl pintar_cubito6           // Pinta al Señor Cubo
    bl pintar_cubito7           // Pinta al Señor Cubo
    bl pintar_cubito8           // Pinta al Señor Cubo
    bl pintar_sombrero          // Pinta el sombrero del Señor Cubo
    bl pintar_bonzai1           // Pinta un bonzai
    bl pintar_bonzai2           // Pinta un bonzai                                         
    bl pintar_bonzai3           // Pinta un bonzai 
    bl pintar_bonzai4           // Pinta un bonzai
    bl pintar_bonzai5           // Pinta un bonzai    
    bl pintar_pelota            // Pinta la pelota
    bl pintar_pelota2           // Pinta la pelota 
    bl delay1

 //---------------------------------------------------------------

//---------------- VIÑETA 2 ------------------------------------

    bl pintar_pared2            // Pinta la pared
    bl pintar_mesa              // Pinta la mesa
    bl pintar_marco_ventana4    // Pinta el marco de la ventana
    bl pintar_cubito1           // Pinta al Señor Cubo
    bl pintar_cubito2           // Pinta al Señor Cubo
    bl pintar_cubito3           // Pinta al Señor Cubo  
    bl pintar_cubito4           // Pinta al Señor Cubo
    bl pintar_cubito5           // Pinta al Señor Cubo
    bl pintar_cubito6           // Pinta al Señor Cubo
    bl pintar_cubito7           // Pinta al Señor Cubo
    bl pintar_cubito8           // Pinta al Señor Cubo
    bl pintar_sombrero          // Pinta el sombrero del Señor Cub
    bl pintar_bonzai1           // Pinta un bonzai
    bl pintar_bonzai2           // Pinta un bonzai                                         
    bl pintar_bonzai3           // Pinta un bonzai 
    bl pintar_bonzai4           // Pinta un bonzai
    bl pintar_bonzai5           // Pinta un bonzai    
    bl pintar_mpelota1          // Pinta la pelota
    bl pintar_mpelota2          // Pinta la pelota 
    bl delay1                   // Genera delay
  
 //---------------------------------------------------------------

//---------------- VIÑETA 3 ------------------------------------

    bl pintar_pared2            // Pinta la pared
    bl pintar_mesa              // Pinta la mesa
    bl pintar_marco_ventana4    // Pinta el marco de la ventana
    bl pintar_cubito1           // Pinta al Señor Cubo
    bl pintar_cubito2           // Pinta al Señor Cubo
    bl pintar_cubito3           // Pinta al Señor Cubo  
    bl pintar_cubito4           // Pinta al Señor Cubo
    bl pintar_cubito5           // Pinta al Señor Cubo
    bl pintar_cubito6           // Pinta al Señor Cubo
    bl pintar_cubito7           // Pinta al Señor Cubo
    bl pintar_cubito8           // Pinta al Señor Cubo
    bl pintar_sombrero          // Pinta el sombrero del Señor Cub
    bl pintar_bonzai1           // Pinta un bonzai
    bl pintar_bonzai2           // Pinta un bonzai                                         
    bl pintar_bonzai3           // Pinta un bonzai 
    bl pintar_bonzai4           // Pinta un bonzai
    bl pintar_bonzai5           // Pinta un bonzai    
    bl pintar_mpelota3          // Pinta la pelota
    bl pintar_mpelota4          // Pinta la pelota 
    bl delay1                   // Genera delay     
 
 //---------------------------------------------------------------

//---------------- VIÑETA 4 ------------------------------------

    bl pintar_pared2            // Pinta la pared
    bl pintar_mesa              // Pinta la mesa
    bl pintar_marco_ventana4    // Pinta el marco de la ventana
    bl pintar_cubito1           // Pinta al Señor Cubo
    bl pintar_cubito2           // Pinta al Señor Cubo
    bl pintar_cubito3           // Pinta al Señor Cubo  
    bl pintar_cubito4           // Pinta al Señor Cubo
    bl pintar_cubito5           // Pinta al Señor Cubo
    bl pintar_cubito6           // Pinta al Señor Cubo
    bl pintar_cubito7           // Pinta al Señor Cubo
    bl pintar_cubito8           // Pinta al Señor Cubo
    bl pintar_sombrero          // Pinta el sombrero del Señor Cub
    bl pintar_bonzai1           // Pinta un bonzai
    bl pintar_bonzai2           // Pinta un bonzai                                         
    bl pintar_bonzai3           // Pinta un bonzai 
    bl pintar_bonzai4           // Pinta un bonzai
    bl pintar_bonzai5           // Pinta un bonzai    
    bl pintar_mpelota5          // Pinta la pelota
    bl pintar_mpelota6          // Pinta la pelota 
    bl delay1                   // Genera delay 
 
 //---------------------------------------------------------------

//---------------- VIÑETA 5 ------------------------------------

    bl pintar_pared2            // Pinta la pared
    bl pintar_cortina1          // Pinta la cortina
    bl pintar_cortina2          // Pinta la cortina
    bl pintar_mesa              // Pinta la mesa
    bl pintar_marco_ventana1    // Pinta el marco de la ventana
    bl pintar_marco_ventana2    // Pinta el marco de la ventana
    bl pintar_marco_ventana3    // Pinta el marco de la ventana
    bl pintar_marco_ventana4    // Pinta el marco de la ventana
    bl pintar_palo_cortina      // Pinta el palo de la cortina
    bl pintar_deco_cortina      // Pinta la decoración de la cortina
    bl pintar_cubito1           // Pinta al Señor Cubo
    bl pintar_cubito2           // Pinta al Señor Cubo
    bl pintar_cubito3           // Pinta al Señor Cubo  
    bl pintar_cubito4           // Pinta al Señor Cubo
    bl pintar_cubito5           // Pinta al Señor Cubo
    bl pintar_cubito6           // Pinta al Señor Cubo
    bl pintar_cubito7           // Pinta al Señor Cubo
    bl pintar_cubito8           // Pinta al Señor Cubo
    bl pintar_sombrero          // Pinta el sombrero del Señor Cubo
    bl pintar_bonzai1           // Pinta un bonzai
    bl pintar_bonzai2           // Pinta un bonzai                                         
    bl pintar_bonzai3           // Pinta un bonzai 
    bl pintar_bonzai4           // Pinta un bonzai
    bl pintar_bonzai5           // Pinta un bonzai   
    bl pintar_mpelota7          // Pinta la pelota
    bl pintar_mpelota8          // Pinta la pelota 
    bl delay1                   // Genera delay     
  
 //---------------------------------------------------------------

//---------------- VIÑETA 6 ------------------------------------

    bl pintar_pared1            // Pinta la pared
    bl pintar_pared2            // Pinta la pared
    bl pintar_cortina1          // Pinta la cortina
    bl pintar_cortina2          // Pinta la cortina
    bl pintar_mesa              // Pinta la mesa
    bl pintar_marco_ventana1    // Pinta el marco de la ventana
    bl pintar_marco_ventana2    // Pinta el marco de la ventana
    bl pintar_marco_ventana3    // Pinta el marco de la ventana
    bl pintar_marco_ventana4    // Pinta el marco de la ventana
    bl pintar_palo_cortina      // Pinta el palo de la cortina
    bl pintar_deco_cortina      // Pinta la decoración de la cortina
    bl pintar_cubito1           // Pinta al Señor Cubo
    bl pintar_cubito2           // Pinta al Señor Cubo
    bl pintar_cubito3           // Pinta al Señor Cubo  
    bl pintar_cubito4           // Pinta al Señor Cubo
    bl pintar_cubito5           // Pinta al Señor Cubo
    bl pintar_cubito6           // Pinta al Señor Cubo
    bl pintar_cubito7           // Pinta al Señor Cubo
    bl pintar_cubito8           // Pinta al Señor Cubo
    bl pintar_sombrero          // Pinta el sombrero del Señor Cub
    bl pintar_bonzai1           // Pinta un bonzai
    bl pintar_bonzai2           // Pinta un bonzai                                         
    bl pintar_bonzai3           // Pinta un bonzai 
    bl pintar_bonzai4           // Pinta un bonzai
    bl pintar_bonzai5           // Pinta un bonzai    
    bl pintar_mpelota9          // Pinta la pelota
    bl pintar_mpelota10         // Pinta la pelota 
    bl delay1                   // Genera delay     
  
 //---------------------------------------------------------------

//---------------- VIÑETA 7 ------------------------------------
 
    bl pintar_pared2            // Pinta la pared
    bl pintar_mesa              // Pinta la mesa
    bl pintar_marco_ventana4    // Pinta el marco de la ventana
    bl pintar_cubito1           // Pinta al Señor Cubo
    bl pintar_cubito2           // Pinta al Señor Cubo
    bl pintar_cubito3           // Pinta al Señor Cubo  
    bl pintar_cubito4           // Pinta al Señor Cubo
    bl pintar_cubito5           // Pinta al Señor Cubo
    bl pintar_cubito6           // Pinta al Señor Cubo
    bl pintar_cubito7           // Pinta al Señor Cubo
    bl pintar_cubito8           // Pinta al Señor Cubo
    bl pintar_sombrero          // Pinta el sombrero del Señor Cub
    bl pintar_bonzai1           // Pinta un bonzai
    bl pintar_bonzai2           // Pinta un bonzai                                         
    bl pintar_bonzai3           // Pinta un bonzai 
    bl pintar_bonzai4           // Pinta un bonzai
    bl pintar_bonzai5           // Pinta un bonzai    
    bl pintar_mpelota11         // Pinta la pelota
    bl pintar_mpelota12         // Pinta la pelota 
    bl delay1                   // Genera delay   
  
 //---------------------------------------------------------------

//---------------- VIÑETA 8 ------------------------------------

    bl pintar_pared2            // Pinta la pared
    bl pintar_mesa              // Pinta la mesa
    bl pintar_marco_ventana4    // Pinta el marco de la ventana
    bl pintar_cubito1           // Pinta al Señor Cubo
    bl pintar_cubito2           // Pinta al Señor Cubo
    bl pintar_cubito3           // Pinta al Señor Cubo  
    bl pintar_cubito4           // Pinta al Señor Cubo
    bl pintar_cubito5           // Pinta al Señor Cubo
    bl pintar_cubito6           // Pinta al Señor Cubo
    bl pintar_cubito7           // Pinta al Señor Cubo
    bl pintar_cubito8           // Pinta al Señor Cubo
    bl pintar_sombrero          // Pinta el sombrero del Señor Cub
    bl pintar_bonzai1           // Pinta un bonzai
    bl pintar_bonzai2           // Pinta un bonzai                                         
    bl pintar_bonzai3           // Pinta un bonzai 
    bl pintar_bonzai4           // Pinta un bonzai
    bl pintar_bonzai5           // Pinta un bonzai    
    bl pintar_mpelota13         // Pinta la pelota
    bl pintar_mpelota14         // Pinta la pelota 
    bl delay1                   // Genera delay   
  
 //---------------------------------------------------------------

//---------------- VIÑETA 9 ------------------------------------

    bl pintar_pared2            // Pinta la pared
    bl pintar_mesa              // Pinta la mesa
    bl pintar_marco_ventana4    // Pinta el marco de la ventana
    bl pintar_cubito1           // Pinta al Señor Cubo
    bl pintar_cubito2           // Pinta al Señor Cubo
    bl pintar_cubito3           // Pinta al Señor Cubo  
    bl pintar_cubito4           // Pinta al Señor Cubo
    bl pintar_cubito5           // Pinta al Señor Cubo
    bl pintar_cubito6           // Pinta al Señor Cubo
    bl pintar_cubito7           // Pinta al Señor Cubo
    bl pintar_cubito8           // Pinta al Señor Cubo
    bl pintar_sombrero          // Pinta el sombrero del Señor Cub
    bl pintar_bonzai1           // Pinta un bonzai
    bl pintar_bonzai2           // Pinta un bonzai                                         
    bl pintar_bonzai3           // Pinta un bonzai 
    bl pintar_bonzai4           // Pinta un bonzai
    bl pintar_bonzai5           // Pinta un bonzai    
    bl pintar_mpelota15         // Pinta la pelota
    bl pintar_mpelota16         // Pinta la pelota 
    bl delay1                   // Genera delay     

 //--------------------------------------------------------------- 
/**/    
    //---------------------------------------------------------------
 
    // GPIOS
gpios:
    // Ejemplo de uso de gpios
    mov x9, GPIO_BASE

    // Setea gpios 0 - 9 como lectura
    str wzr, [x9, GPIO_GPFSEL0]

    // Lee el estado de los GPIO 0 - 31
    ldr w10, [x9, GPIO_GPLEV0]

    // And bit a bit mantiene el resultado del bit 2 en w10 (notar 0b... es binario)
    and w11, w10, 0b00000010

    // End
end:
    bl delay1
    b main

    // Infinite Loop
InfLoop:
    b InfLoop
      
            