module top_module(
    input clk,
    input areset,

    input predict_valid,
    input predict_taken,
    output [31:0] predict_history,

    input train_mispredicted,
    input train_taken,
    input [31:0] train_history
);

reg [31:0] history;

always@(posedge clk , posedge areset) begin
    if(areset) begin
        history <= 32'b0;
    end else if(train_mispredicted) begin
        history <= {train_history[30:0], train_taken};
    end else if(predict_valid) begin
        history <= {history[30:0], predict_taken};
    end
end

    assign predict_history = history;
endmodule