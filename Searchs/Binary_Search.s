	.global _start
_start:
	LDR R0, =Array		// Array to be searched
	MOV R1, #10			// Size of the array
	MOV R2, #5			// Value to be searched for
	BL Binary_Search

Wait: B Wait

Binary_Search:
	/*
		Parameters:
			R0 - Array
			R1 - Size of array
			R2 - Value
	*/
	PUSH {R0-R5, LR}
	MOV R3, #0		// low = 0
	SUB R1, #1		// high = size - 1
	MOV R6, #0		// Return value = False
Loop:
	CMP R3, R1		// if low > high
	BGT Done		// 	return False
	SUB R4, R1, R3	// mid = high - low
	LSR R4, #1		// mid = mid / 2
	ADD R4, R3		// mid = mid + low
	LDR R5, [R0, R4, LSL #2] // key = Array[mid]
	//
	CMP R5, R2		// if key == value
	MOVEQ R6, #1	//	return True		
	BEQ Done		
	//
	CMP R5, R2		// if key < value
	MOVLT R3, R4	// 	low = mid
	ADDLT R3, #1	//	low = low + 1
	//
	CMP R5, R4		// if key > value
	MOVGT R1, R4	//	high = mid
	SUBGT R1, #1	//	high = high + 1
	//
	B Loop
Done:
	POP {R0-R5, LR}
	BX LR
	
	.data
Array: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
	.end
