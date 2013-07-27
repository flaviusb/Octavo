
module IO_Read_Port_Req
#(
    parameter       IO_READ_PORT_COUNT              = 0, 
    parameter       IO_READ_PORT_ADDR_WIDTH         = 0 
)
(
    input   wire                                    clock,
    input   wire                                    addr_in_io_range,
    input   wire    [IO_READ_PORT_ADDR_WIDTH-1:0]   port_addr,
    output  reg     [IO_READ_PORT_COUNT-1:0]        req
);
    // Read Enables, one per port
    integer port = 0;
    always @(posedge clock) begin
        for(port = 0; port < IO_READ_PORT_COUNT; port = port + 1) begin
            if(addr_in_io_range === `HIGH && 
               port_addr        === port) 
            begin
                req[port +: 1] <= `HIGH;
            end
            else begin
                req[port +: 1] <= `LOW;
            end
        end 
    end
endmodule

