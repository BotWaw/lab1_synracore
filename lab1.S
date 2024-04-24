.data
N: .word 5
M: .word 6
posCount: .word 0
negCount: .word 0
matrix:
.word 8, 3, 14, 19, 8
.word 6, -7, 41, 10, -9
.word 4, 15, 64, -3, 17
.word 33, -5, 88, 12, 36
.word 48, -9, -4, -10, 54
.word 97, -74, 6, 7, -1

.text

main:
    la a2, posCount # Загрузка posCount в регистр a2
    la a3, negCount # Загрузка negCount в регистр a3
    la a4, matrix # Загрузка адреса матрицы в регистр a4
    la a5, N # Загрузка значения N в регистр a5
    la a6, M # Загрузка значения M в регистр a6
    call process # Вызов функции

    # Выход
    addi a0, x0, 10 
    ecall 



process:
addi t0, x0, 0 # Номер текущей строки
addi t4, x0, 0 # Счетчик положительных элементов
addi t5, x0, 0 # Счетчик отрицательных элементов


colomn_loop:
    addi t2, x0, 0 # номер элемента строки
    row_loop:
        lw t3, 0(a4)
        addi a4, a4, 4 
        addi t2, t2, 1 # Увеличиваем номер элемента строки на 1

        blt t3, x0, negative_case # Проверка на положительность

        positive_case:
            addi t4, t4, 1 # Если положительное увеличиваем счетчик
            call end

        negative_case:
            addi t5, t5, 1 # УВеличение счетчика отрицательных чисел

        end:
            lw t6, 0(a5)
            blt t2, t6 row_loop # Проверка достигли ли мы конца строки
            addi t0, t0, 1 # Увеличиваем счетчик строк (переходим на следующую строку)
            lw t6, 0(a6)
            blt t0, t6 colomn_loop # Проверка прошли ли мы по всем строкам

            # Запись результата
            addi a2, t4, 0 
            addi a3, t5, 0
            