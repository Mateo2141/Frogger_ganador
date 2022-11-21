//=======================================================================================================================================
//  														MAQUINA DE ESTADOS GENERAL
//=======================================================================================================================================
//=======================================================
//  MODULE Definition
//=======================================================
module SC_STATEMACHINEGENERAL (
	//////////// OUTPUTS //////////
	SC_STATEMACHINEGENERAL_contador_niveles_OutLow,
	//////////// INPUTS //////////
	SC_STATEMACHINEGENERAL_CLOCK_50,
	SC_STATEMACHINEGENERAL_RESET_InHigh,
	SC_STATEMACHINEGENERAL_COMPARATOR_LEVELS,
	
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
output reg		SC_STATEMACHINEGENERAL_contador_niveles_OutLow;	
input			SC_STATEMACHINEGENERAL_CLOCK_50;
input 			SC_STATEMACHINEGENERAL_RESET_InHigh;
input			SC_STATEMACHINEGENERAL_COMPARATOR_LEVELS;
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
		
		
		
		else if (SC_STATEMACHINEBACKG_LastRegisterComparator_InLow == 2'b10) STATE_Signal = STATE_LOAD_LAST_REGISTER;
		else if (SC_STATEMACHINEBACKG_LastRegisterComparator_InLow == 2'b11) STATE_Signal = STATE_RESET_0;
//=========================================================
// STATE_LOAD_LAST_REGISTER
//=========================================================
	STATE_LOAD_LAST_REGISTER :	
		begin
			SC_STATEMACHINEBACKG_clear_OutLow = 1'b1;
			SC_STATEMACHINEBACKG_load_OutLow = 1'b1;
			SC_STATEMACHINEBACKG_shiftselection_Out  = 2'b11;  
			SC_STATEMACHINEBACKG_upcount_out = 1'b0;
			SC_STATEMACHINEBACKG_loadLastRegister_OutLow = 1'b0;
		end
						

else if (SC_STATEMACHINEPOINT_Losing_InLow  == 1'b0 | SC_STATEMACHINEPOINT_LastRegisterComparator_InLow != 2'b11) STATE_Signal = STATE_RESET_0;


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
