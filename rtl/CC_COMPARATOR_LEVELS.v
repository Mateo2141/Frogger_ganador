//=======================================================
//  MODULE Definition
//=======================================================
module CC_COMPARATOR_LEVELS #(parameter LEVELS_DATAWIDTH=2)(
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
output	reg CC_LIFE_COMPARATOR_data_OutLow;
input 	[LIFECOMPARATOR_DATAWIDTH-1:0] CC_LIFE_COMPARATOR_data_InBUS;
//=======================================================
//  REG/WIRE declarations
//=======================================================
//=======================================================
//  Structural coding
//=======================================================
always @(CC_LIFE_COMPARATOR_data_InBUS)
begin
	if( CC_LIFE_COMPARATOR_data_InBUS == 2'b11)
		CC_LIFE_COMPARATOR_data_OutLow = 1'b0;
	else
		CC_LIFE_COMPARATOR_data_OutLow = 1'b1;
end

endmodule