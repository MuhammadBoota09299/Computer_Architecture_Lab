package single_cycle_processor
    typedef enum logic[6:0] { 
        R_TYPE=7'b0110011,
        I_TYPE=7'b0010011,
        STORE =7'b0100011,
        LOAD  =7'b0000011,
        BRANCH=7'b1100011,
        LUI   =7'b0110111,
        AUIPC =7'b0010111,
        JAL   =7'b1101111,
        JALR  =7'b1100111
     } opcodes;

    typedef enum logic [3:0] { 
        ADD =4'b0000,
        SUB =4'b0001,
        SLL =4'b0010,
        SLT =4'b0100,
        SLTU=4'b0110,
        XOR =4'b1000,
        SRL =4'b1010,
        SRA =4'b1011,
        OR  =4'b1100,
        AND =4'b1110
    } alu_op;

    typedef enum logic [2:0] { 
        BEQ =3'b000,
        BNE =3'b001,
        BLT =3'b100,
        BGE =3'b101,
        BLTU=3'b110,
        BGEU=3'b111,
    } br_type;

    typedef enum logic [2:0] { 
        LB_SB=3'b000,
        LH_SH=3'b001,
        LW_SB=3'b010,
        LBU  =3'b100,
        LHU  =3'b101
    } load_store;

endpackage