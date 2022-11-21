//=======================================================================================================================================
//  														MAQUINA DE ESTADOS GENERAL
//=======================================================================================================================================
//=======================================================
//  MODULE Definition
//=======================================================
module SC_STATEMACHINEGENERAL(
	//////////// OUTPUTS //////////
	SC_STATEMACHINEGENERAL_contador_niveles_OutLow,
	SC_STATEMACHINEGENERAL_contador_vidas_OutLow,
	//////////// INPUTS //////////
	SC_STATEMACHINEGENERAL_CLOCK_50,
	SC_STATEMACHINEGENERAL_RESET_InHigh,
	SC_STATEMACHINEGENERAL_COMPARATOR_LIVES,
	SC_STATEMACHINEGENERAL_COMPARATOR_LEVELS,
	SC_STATEMACHINEGENERAL_startButton_InLow,
	SC_STATEMACHINEGENERAL_Losing_InLow,
	SC_STATEMACHINEGENERAL_LastRegisterComparator_InLow	
);	
//=======================================================
//  PARAMETER declarations
//=======================================================
// states declaration
localparam STATE_RESET_0									= 0;
localparam STATE_START_0									= 1;
localparam STATE_CHECK										= 2;
localparam STATE_PIERDE										= 3;
localparam STATE_GANO										= 4;
localparam STATE_MENOS_UNA_VIDA								= 5;
localparam STATE_SUME_UNA_VIDA								= 6;

//=======================================================
//  PORT declarations
//=======================================================
output reg		SC_STATEMACHINEGENERAL_contador_niveles_OutLow;	
output reg 		SC_STATEMACHINEGENERAL_contador_vidas_OutLow;
input			SC_STATEMACHINEGENERAL_CLOCK_50;
input 			SC_STATEMACHINEGENERAL_RESET_InHigh;
input 			SC_STATEMACHINEGENERAL_COMPARATOR_LIVES;
input			SC_STATEMACHINEGENERAL_COMPARATOR_LEVELS;
input			SC_STATEMACHINEGENERAL_startButton_InLow;
input 			SC_STATEMACHINEGENERAL_Losing_InLow;
input 			SC_STATEMACHINEGENERAL_LastRegisterComparator_InLow;
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
		STATE_START_0: STATE_Signal = STATE_CHECK;
		STATE_CHECK: if (SC_STATEMACHINEGENERAL_COMPARATOR_LIVES == 1'b0) STATE_Signal = STATE_PIERDE;
						else if (SC_STATEMACHINEGENERAL_COMPARATOR_LEVELS == 3'b101)STATE_Signal = STATE_GANO;
						else if (SC_STATEMACHINEGENERAL_Losing_InLow == 1'b0)	STATE_Signal = STATE_MENOS_UNA_VIDA;
						else if (SC_STATEMACHINEGENERAL_LastRegisterComparator_InLow == 2'b00) STATE_Signal = STATE_SUME_UNA_VIDA;
						else 
							STATE_Signal = STATE_START_0
///STATE_CONTINUA: if (SC_STATEMACHINEGENERAL_Losing_InLow  == 1'b0 | SC_STATEMACHINEGENERAL_LastRegisterComparator_InLow != 2'b11) STATE_Signal = STATE_PIERDE;				
///					else if (SC_STATEMACHINEGENERAL_LastRegisterComparator_InLow == 2'b10) STATE_Signal = STATE_LOAD_LAST_REGISTER;
///					else if (SC_STATEMACHINEGENERAL_LastRegisterComparator_InLow == 2'b11) STATE_Signal = STATE_RESET_0;
///
		default : 	STATE_Signal = STATE_START_0;
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
// STATE_RESET_0
//=========================================================
	STATE_RESET_0 :	
		begin
		SC_STATEMACHINEGENERAL_contador_niveles_OutLow = 1'b1;
		SC_STATEMACHINEGENERAL_contador_vidas_OutLow= 1'b1;
		end
//=========================================================
// STATE_START_0
//=========================================================
	STATE_START_0 :	
		begin
		SC_STATEMACHINEGENERAL_contador_niveles_OutLow = 1'b1;
		SC_STATEMACHINEGENERAL_contador_vidas_OutLow= 1'b1;
		end
//=========================================================
// STATE_CHECK
//=========================================================
	STATE_CHECK :	
		begin
		SC_STATEMACHINEGENERAL_contador_niveles_OutLow = 1'b1;
		SC_STATEMACHINEGENERAL_contador_vidas_OutLow= 1'b1;
		end
//=========================================================
// STATE_PIERDE
//=========================================================
	STATE_PIERDE :	
		begin
		SC_STATEMACHINEGENERAL_contador_niveles_OutLow = 1'b1;
		SC_STATEMACHINEGENERAL_contador_vidas_OutLow= 1'b1;
		end
//=========================================================
// STATE_GANO
//=========================================================
	STATE_GANO :	
		begin
		SC_STATEMACHINEGENERAL_contador_niveles_OutLow = 1'b1;
		SC_STATEMACHINEGENERAL_contador_vidas_OutLow= 1'b1;
		end
		
//=========================================================
// STATE_MENOS_UNA_VIDA
//=========================================================
	STATE_MENOS_UNA_VIDA :	
		begin
		SC_STATEMACHINEGENERAL_contador_niveles_OutLow = 1'b1;
		SC_STATEMACHINEGENERAL_contador_vidas_OutLow= 1'b1;
		end
		
//=========================================================
// STATE_SUME_UNA_VIDA
//=========================================================
	STATE_SUME_UNA_VIDA :	
		begin
		SC_STATEMACHINEGENERAL_contador_niveles_OutLow = 1'b1;
		SC_STATEMACHINEGENERAL_contador_vidas_OutLow= 1'b1;
		end
		

//=========================================================
// DEFAULT
//=========================================================
	default :
		begin
		SC_STATEMACHINEGENERAL_contador_niveles_OutLow = 1'b1;
		SC_STATEMACHINEGENERAL_contador_vidas_OutLow= 1'b1;
		end
	endcase
end
endmodule
