#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>
#include <assert.h>

#define CELLS_LARGE 5
#define CELL_MAX (CELLS_LARGE * CELLS_LARGE - 1)

void print_sep(unsigned int length) 
{
    printf("\t ");
    for (size_t i = 0; i < length; i++) printf("................");
    printf("\n");
}

void print_board(char board[CELLS_LARGE][CELLS_LARGE])
{
    int cell = 0;
    print_sep(CELLS_LARGE);
    for (int row = 0; row < CELLS_LARGE; ++row) 
    {
        for (int col = 0; col < CELLS_LARGE; ++col) 
        {
            printf("\t | %d: %c ", cell, board[row][col]);
            ++cell;
        }
        printf("\t | \n");
        print_sep(CELLS_LARGE);
    }
}

char get_winner(char board[CELLS_LARGE][CELLS_LARGE])
{
    char winner = '-';
    char character;

    // Check the rows.
    for (size_t r = 0; r < CELLS_LARGE; r++) {
        bool eq_row = true;
        character = board[r][0];
        for (size_t c = 0; c < CELLS_LARGE; c++) {
            eq_row = eq_row && character == board[r][c];
        }
        if (eq_row && character != '-') {
            winner = character;
        }
    }

    // Check the columns.
    for (size_t c = 0; c < CELLS_LARGE; c++) {
        bool eq_col = true;
        character = board[0][c];
        for (size_t r = 0; r < CELLS_LARGE; r++) {
            eq_col = eq_col && character == board[r][c];
        } 
        if (eq_col && character != '-') {
            winner = character;
        }
    }

    // Check the diagonals.
    bool eq_dig = true;
    character = board[0][0];
    for (size_t i = 0; i < CELLS_LARGE; i++) {
        eq_dig = eq_dig && character == board[i][i]; 
    }
    if (eq_dig && character != '-') {
        winner = character;
    }      

    eq_dig = true;
    character = board[0][CELLS_LARGE-1];
    for (size_t i = 0; i < CELLS_LARGE; i++) {
        eq_dig = eq_dig && character == board[i][(CELLS_LARGE-1)-i]; 
    }
    if (eq_dig && character != '-') {
        winner = character;
    }    
     
    return winner;
}

bool has_free_cell(char board[CELLS_LARGE][CELLS_LARGE])
{
    bool free_cell = false;
    for (size_t row = 0; row < CELLS_LARGE; row++) {
        for (size_t col = 0; col < CELLS_LARGE; col++) {
            if (board[row][col] == '-') {
                free_cell = true;
            }
        }    

    }
    return free_cell;
}

int main(void) {
    char turn = 'X';
    char winner = '-';
    int cell = 0;
    char board[CELLS_LARGE][CELLS_LARGE];

    // Init array in '-'.
    for (size_t r = 0; r < CELLS_LARGE; r++) {
        for (size_t c = 0; c < CELLS_LARGE; c++) {
            board[r][c] = '-';
        }
    }

    while (winner == '-' && has_free_cell(board)) {
        print_board(board);
        printf("\nTurno %c - Elija posición (número del 0 al %d): ", turn, CELL_MAX);
        int scanf_result = scanf("%d", &cell);
        if (scanf_result <= 0) {
            printf("Error al leer un número desde teclado\n");
            exit(EXIT_FAILURE);
        }
        if (cell >= 0 && cell <= CELL_MAX) {
            int row = cell / CELLS_LARGE;
            int colum = cell % CELLS_LARGE;
            if (board[row][colum] == '-') {
                board[row][colum] = turn;
                turn = turn == 'X' ? 'O' : 'X';
                winner = get_winner(board);
            } else {
                printf("\nCelda ocupada!\n");
            }
        } else {
            printf("\nCelda inválida!\n");
        }
    }
    print_board(board);
    if (winner == '-') {
        printf("Empate!\n");
    } else {
        printf("Ganó %c\n", winner);
    }
    return 0;
}