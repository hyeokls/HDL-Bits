module top_module(
    input clk,
    input areset,

    input  predict_valid,
    input  [6:0] predict_pc,
    output predict_taken,
    output [6:0] predict_history,

    input train_valid,
    input train_taken,
    input train_mispredicted,
    input [6:0] train_history,
    input [6:0] train_pc
);

reg [1:0] PHT [0:127];
reg [6:0] history;

wire [6:0] w_pre_index = predict_pc ^ history;
wire [6:0] w_train_index = train_pc ^ train_history;


integer i;

always@(posedge clk, posedge areset) begin
    if(areset) begin
        for(i = 0; i< 128; i++) begin
            PHT[i] <= 2'b01;
        end

    end else begin
        if(train_valid) begin
            if(train_taken) begin
                PHT[w_train_index] <= (PHT[w_train_index] == 2'b11) ? 2'b11 : PHT[w_train_index] + 1'b1;
            end else begin
                PHT[w_train_index] <= (PHT[w_train_index] == 2'b00) ? 2'b00 : PHT[w_train_index] - 1'b1;
            end
        end
    end
end
        
always@(posedge clk, posedge areset) begin
    if(areset) begin
        history <= 7'b0;
    end else begin
        if(train_valid && train_mispredicted) begin
            history <= {train_history[5:0],train_taken};
        end else if(predict_valid) begin
            history <= {history[5:0],predict_taken};
        end
    end
end

assign predict_taken = PHT[w_pre_index][1];
assign predict_history = history;

endmodule