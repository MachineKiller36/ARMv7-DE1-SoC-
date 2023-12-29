.global _start
_start:
	LDR R11, =Array	// R11 points to the first elements address
	MOV R10, #10	// Sets R10 with the size of the array
	BL  BubbleSort	// Calls bubble sort subroutine
STOP: B STOP		// Stops program from reading undefined instrucitons

/// BUBBLE SORT SUBROUTINE ///
// Ascending Order
// To make descending just make Line 21 and 22 STRGT
BubbleSort:
	PUSH {R0-R3, LR}	// Preserve registers on stack and program counter
	MOV R0, #1			// Outer loop counter
OuterL:
	MOV R1, #0			// Inner loop counter
InnerL:
	LDR R2, [R11, R0, LSL #2]	// Gets element in the array using the outer loop counter as a index.
	LDR R3, [R11, R1, LSL #2]	// Gets element in the array using the inner loop counter as a index.
	CMP R2, R3			// Compares the elements
	// Swaps values
	STRLT R2, [R11, R1, LSL #2] // If R2 < R3, Store R2 into in the array at the inner loop counter index.
	STRLT R3, [R11, R0, LSL #2] // If R2 < R3, Store R3 into in the array at the outer loop counter index.
	ADD R1, #1			// Increments inner loop counter
	CMP R1, R10			// Compares inner loop counter to the size of the array.
	BLE InnerL			// If its less than the size, jump to InnerL
/// InnerL Done ///
	ADD R0, #1			// Increments outer loop counter
	CMP R0, R10			// Compares outer loop counter to the size of the array.
	BLE OuterL			// If its less than the size, jump to OuterL
/// OuterL Done ///
	POP {R0-R3, LR}		// Restores registers and program counter by unstack values
	BX LR				// Return
/// END OF BUBBLE SORT SUBROUTINE ///

	.data
// Allocates 10 memory address each with the following values in a 32 bit format.
Array: .word 10, 15, 5, 9, 1, 1, 0, 30, 2, 3
	.end