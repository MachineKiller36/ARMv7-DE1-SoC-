	.global _start
_start:
	MOV R10, #10	// Size of array
	LDR R11, =Array	// Pointer to the first element in the array
	BL SelectionSort
	
STOP: B STOP

/// SELECTION SORT SUBROUTINE ///
SelectionSort:
	PUSH {R0-R4, LR}
	MOV R0, #0			// Outer loop counter
Outerl:
	MOV R1, R0			// Inner loop counter
	MOV R2, R0			// Smallest index
Innerl:
	LDR R3, [R11, R2, LSL #2]	// Smallest value
	LDR R4, [R11, R1, LSL #2]	// Current value
	CMP R3, R4					// Compares values
	MOVGE R2, R1				// Updates the current smallest values
	ADD R1, #1					// Increment inner loop counter
	CMP R1, R10					// Compare inner loop counter to size
	BLT Innerl					// If less than size, continue looping
///	End of Inner loop ///
	LDR R3, [R11, R2, LSL #2]	// Smallest value
	LDR R4, [R11, R0, LSL #2]	// Outer loop index element
	// Swap values
	STR R3, [R11, R0, LSL #2]	// Stores smallest value at outer loop index
	STR R4, [R11, R2, LSL #2]	// Stores outer loop value in smallest index
	ADD R0, #1			// Increment outer loop counter
	CMP R0, R10			// Compare outer loop counter against size
	BLE Outerl
///	End of Outer loop ///
	POP {R0-R4, LR}
	BX LR
/// END OF SELECTION SORT ///

	.data
Array: .word 1, 9, 8, 7, 6, 5, 4, 3, 2, 1
	.end
