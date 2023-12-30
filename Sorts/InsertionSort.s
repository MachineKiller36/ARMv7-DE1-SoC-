	.global _start
_start:
	MOV R10, #10				// Size of array
	LDR R11, =Array				// Pointer to the first element of the array
	BL InsertionSort			// Calls selection sort subroutine
STOP: B STOP

/// Insertion Sort Subroutine ///
InsertionSort:
	PUSH {R0-R4, LR}
	MOV R0, #1					// Outer loop counter
Outerl:
	SUB R1, R0, #1				// Inner loop counter
	LDR R2, [R11, R0, LSL #2] 	// Key
Innerl:
	CMP R1, #0					// Checks if inner loop counter is >= 0
	LDRGE R3, [R11, R1, LSL #2] // Current value
	CMPGE R3, R2				// Checks if array at inner loop counter > key
	ADDGE R4, R1, #1			// Updates indexor for array
	STRGT R3, [R11, R4, LSL #2] // If greater than, shift elements to the right
	SUBGT R1, #1				// Decrement inner loop counter
	BGT Innerl					// If greater than, continue looping
/// End of Inner loop ///
Done:
	ADD R1, #1					// Updates indexor for array
	STR R2, [R11, R1, LSL #2]	// Puts key in correct position
	ADD R0, #1					// Increment outer loop counter
	CMP R0, R10					// Outer loop counter < size
	BLT Outerl					// If so, continue looping
/// End of Outer loop //
	POP {R0-R4, LR}
	BX LR
/// End of Insertion Sort ///
	.data
Array: .word 10, 9, 8, 7, 6, 5, 4, 3, 2, 1
	.end
