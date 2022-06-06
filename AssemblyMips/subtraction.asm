.data
string1: .asciiz "Digite o primeiro numero: "
string2: .asciiz "\nDigite o segundo numero: "
result: .asciiz "\nO Resultado e: "

.text

jal firstNum
jal secondNum
jal operate
j end

#exibe Primeira Msg
firstNum:
	li $v0,4
	la $a0,string1
	syscall

	#Ler Primeiro inteiro
	li $v0,5
	syscall
	move $t1,$v0
	jr $ra

secondNum:
	#exibe Segunda Msg
	li $v0,4
	la $a0,string2
	syscall

	#Ler Segundo inteiro
	li $v0,5
	syscall
	move $t2,$v0
	jr $ra

operate:
	#Realiza Subtracao
	sub $t3,$t1,$t2
	jr $ra

#Imprime msg do Resultado
end:
	li $v0,4
	la $a0,result
	syscall

	#Imprime Resultado da Subtracao
	li $v0,1
	move $a0,$t3
	syscall

	#Sai do Programa
	li $v0,10
	syscall