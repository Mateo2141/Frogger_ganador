//=======================================================================================================================================
//  														MAQUINA DE ESTADOS GENERAL
//=======================================================================================================================================
//=======================================================
//  MODULE Definition
//=======================================================
module SC_STATEMACHINEGENERAL (
	//////////// OUTPUTS //////////

	//////////// INPUTS //////////
	SC_STATEMACHINEGENERAL_CLOCK_50,
	SC_STATEMACHINEGENERAL_RESET_InHigh,


);	
//=======================================================
//  PARAMETER declarations
//=======================================================
// states declaration
localparam STATE_RESET_0									= 0;
localparam STATE_START_0									= 1;
localparam 

//=======================================================
//  PORT declarations
//=======================================================
output reg		SC_STATEMACHINEGENERAL_clear_OutLow;
output reg		
input			SC_STATEMACHINEGENERAL_CLOCK_50;
input 			SC_STATEMACHINEGENERAL_RESET_InHigh;
input			SC_STATEMACHINEGENERAL_startButton_InLow;
input			
//=======================================================
//  REG/WIRE declarations
//=======================================================
reg [3:0] STATE_Register;
reg [3:0] STATE_Signal;
//=======================================================
//  Structural coding
//=======================================================
//INPUT LOGIC: COMBINATIONAL
// NEXT STATE LOGIC : COMBINATIONAL
always @(*)
begin
	case (STATE_Register)
		STATE_RESET_0: STATE_Signal = STATE_START_0;
		STATE_START_0: STATE_Signal =
		

		default : 		STATE_Signal = STATE_START_0;
	endcase
end
// STATE REGISTER : SEQUENTIAL
always @ ( posedge SC_STATEMACHINEGENERAL_CLOCK_50 , posedge SC_STATEMACHINEGENERAL_RESET_InHigh)
begin
	if (SC_STATEMACHINEGENERAL_RESET_InHigh == 1'b1)
		STATE_Register <= STATE_RESET_0;
	else
		STATE_Register <= STATE_Signal;
end
//=======================================================
//  Outputs
//=======================================================
// OUTPUT LOGIC : COMBINATIONAL
always @ (*)
begin
	case (STATE_Register)
//=========================================================
// STATE_RESET
//=========================================================
	STATE_RESET_0 :	
		begin
			SC_STATEMACHINEGENERAL_clear_OutLow = 1'b0;
			
		end
//=========================================================
// STATE_START
//=========================================================
	STATE_START_0 :	
		begin
			SC_STATEMACHINEGENERAL_clear_OutLow = 1'b1;
			
		end

		
		

//=========================================================
// DEFAULT
//=========================================================
	default :
		begin
			SC_STATEMACHINEGENERAL_clear_OutLow = 1'b1;
			
		end
	endcase
end
endmodule
