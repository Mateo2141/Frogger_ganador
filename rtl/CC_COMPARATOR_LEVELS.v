//=======================================================
//  MODULE Definition
//=======================================================
module CC_COMPARATOR_LEVELS #(parameter LEVELS_DATAWIDTH=5)(
//////////// OUTPUTS //////////
	CC_COMPARATOR_LEVELS_señal_OutLow,
//////////// INPUTS //////////
	CC_COMPARATOR_LEVELS_señal_InLow
);

//=======================================================
//  PARAMETER declarations
//=======================================================
//=======================================================
//  PORT declarations
//=======================================================
output	reg CC_COMPARATOR_LEVELS_señal_OutLow;
input 	[LEVELS_DATAWIDTH-1:0] CC_COMPARATOR_LEVELS_señal_InLow;
//=======================================================
//  REG/WIRE declarations
//=======================================================
//=======================================================
//  Structural coding
//=======================================================
always @(CC_COMPARATOR_LEVELS_señal_InLow)
begin
	if( CC_COMPARATOR_LEVELS_señal_InLow == 2'b101)
		CC_COMPARATOR_LEVELS_señal_OutLow = 1'b0;
	else
		CC_COMPARATOR_LEVELS_señal_OutLow = 1'b1;
end

endmodule