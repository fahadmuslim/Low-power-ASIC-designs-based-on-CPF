// *****************************************************************************
//                         Cadence C-to-Silicon Compiler
//          Version 13.20-p100  (64 bit), build 48535 Fri, 06 Dec 2013
// 
// File created on Mon Apr 27 19:46:43 2015
// 
// The code contained herein is generated for Cadences customer and third
// parties authorized by customer.  It may be used in accordance with a
// previously executed license agreement between Cadence and that customer.
// Absolutely no disassembling, decompiling, reverse-translations or
// reverse-engineering of the generated code is allowed.
// 
//*****************************************************************************
module topmodule_rtl(clk, read, reset, size, ms, adr, data_in, data_out);
  input clk;
  input read;
  input reset;
  input size;
  input ms;
  input [31:0] adr;
  input [31:0] data_in;
  output [31:0] data_out;
  wire XLXI_2_iso_en;
  wire XLXI_2_pse;
  wire XLXI_2_ret_en;
  wire [31:0] data_inn_fifo;
  wire [31:0] addr_fifo;

  // lint_checking URAREG OFF
`ifndef SYNTHESIS
  reg CtoS_rtl_topmodule_rtl;
`endif
  // lint_checking URAREG ON
  my_fifo_rtl XLXI_1(.clk(clk), .rst(reset), .adr(adr), .data_in(data_in), .adr_fifo(
              addr_fifo), .data_in_fifo(data_inn_fifo));
  xbus_hw_idct_rtl XLXI_3(.clk(clk), .reset(reset), .pse(XLXI_2_pse), .ret_en(
                   XLXI_2_ret_en), .iso_en(XLXI_2_iso_en), .ms(ms), .read(read), 
                   .size(size), .adr(addr_fifo), .data_in(data_inn_fifo), .data_out(
                   data_out));
  powercontrol_rtl XLXI_2(.clk(clk), .ms(ms), .reset(reset), .pse(XLXI_2_pse), .iso_en(
                   XLXI_2_iso_en), .ret_en(XLXI_2_ret_en));
endmodule


module my_fifo_rtl(clk, rst, adr, data_in, adr_fifo, data_in_fifo);
  input clk;
  input rst;
  input [31:0] adr;
  input [31:0] data_in;
  output reg [31:0] adr_fifo;
  output reg [31:0] data_in_fifo;
  wire _is_full_ln96_z;
  wire _is_busy_w_ln96_z;
  wire nb_can_get_ln46_z;
  wire _is_empty_ln46_z;
  wire _is_busy_r_ln46_z;
  reg [3:0] state_my_fifo_process_fifo;
  reg [3:0] state_my_fifo_process_fifo_next;
  wire local_m_buf_data_CE0;
  wire local_m_buf_data_A0;
  wire local_m_buf_data_CE1;
  wire local_m_buf_data_A1;
  wire [31:0] local_m_buf_data_D1;
  wire local_m_buf_data_WE1;
  wire [31:0] local_m_buf_data_Q0;
  wire local_m_buf_addr_CE0;
  wire local_m_buf_addr_A0;
  wire local_m_buf_addr_CE1;
  wire local_m_buf_addr_A1;
  wire [31:0] local_m_buf_addr_D1;
  wire local_m_buf_addr_WE1;
  wire [31:0] local_m_buf_addr_Q0;
  reg nb_can_get_ln46_nb_can_get_out_0_tag_0;
  reg [31:0] read_my_fifo_adr_ln42_q;
  reg local_m_r_clk_prev;
  reg local_m_r_top_prev;
  reg local_m_r_ind_prev;
  reg mux_local_m_w_clk_ln39_q;
  reg mux_local_m_r_clk_ln39_q;
  reg [31:0] read_my_fifo_data_in_ln41_q;
  reg local_m_w_clk_prev;
  reg local_m_w_top_prev;
  reg local_m_w_ind_prev;
  reg memread_my_fifo_local_m_buf_data_ln49_en;
  wire [31:0] memread_my_fifo_local_m_buf_data_ln49_rtl_Q;
  wire [31:0] memread_my_fifo_local_m_buf_addr_ln49_rtl_Q;
  reg ctrlAnd_1_ln96_z;
  reg [31:0] mux_read_my_fifo_adr_ln42_Z_v;
  reg [31:0] mux_read_my_fifo_data_in_ln41_Z_v;
  reg ctrlOr_ln46_0_z;
  reg unary_nor_ln392_z;
  reg unary_nor_ln410_z;
  reg unary_nor_ln386_z;
  reg mux_nb_can_get_ln46_nb_can_get_out_0_v;
  reg mux_local_m_w_clk_ln39_z;
  reg mux_unary_nor_ln386_Z_0_v;
  reg ternaryMux_ln46_0_z;
  reg mux_local_m_r_clk_ln46_0_z;
  reg mux_if_ln46_Z_0_v;
  reg unary_nor_ln404_z;
  reg mux_mux_local_m_w_clk_ln39_Z_0_v;
  reg mux_mux_local_m_r_clk_ln46_0_Z_0_v;
  reg ctrlAnd_while_ln46_z;
  reg mux_unary_nor_ln404_Z_0_v;
  reg mux_local_m_r_clk_ln39_z;
  reg ternaryMux_ln96_0_z;
  reg mux_mux_local_m_r_clk_ln39_Z_0_v;
  reg ctrlAnd_1_ln46_0_z;
  reg ctrlAnd_0_ln46_0_z;
  reg write_my_fifo_adr_fifo_ln50_en;
  reg write_my_fifo_local_m_r_ind_prev_ln391_en;
  reg write_my_fifo_local_m_r_ind_prev_ln394_en;
  reg ctrlOr_ln39_z;
  reg local_m_r_ind_prev_hold;
  reg ctrlOr_ln96_z;
  reg local_m_r_clk_prev_d;
  reg local_m_r_top_prev_d;
  reg local_m_r_ind_prev_d;
  reg mux_local_m_r_clk_ln39_mux_0_sel;
  reg ctrlAnd_0_ln96_z;
  reg write_my_fifo_local_m_w_ind_prev_ln409_en;
  reg write_my_fifo_local_m_w_ind_prev_ln412_en;
  reg [1:0] mux_local_m_r_clk_ln39_d_0;
  reg read_my_fifo_data_in_ln41_0_d;
  reg [31:0] data_in_fifo_d;
  reg [31:0] adr_fifo_d;
  reg local_m_w_clk_prev_d;
  reg local_m_w_ind_prev_hold;
  reg local_m_w_top_prev_d;
  reg local_m_w_ind_prev_d;

  // lint_checking URAREG OFF
`ifndef SYNTHESIS
  reg CtoS_rtl_my_fifo_rtl;
`endif
  // lint_checking URAREG ON
  ram_2x32_1ar_1w_r local_m_buf_data(.CLK(clk), .RST_N(rst), .CE0(
                    local_m_buf_data_CE0), .A0(local_m_buf_data_A0), .CE1(
                    local_m_buf_data_CE1), .A1(local_m_buf_data_A1), .D1(
                    local_m_buf_data_D1), .WE1(local_m_buf_data_WE1), .Q0(
                    local_m_buf_data_Q0));
  ram_2x32_1ar_1w_r local_m_buf_addr(.CLK(clk), .RST_N(rst), .CE0(
                    local_m_buf_addr_CE0), .A0(local_m_buf_addr_A0), .CE1(
                    local_m_buf_addr_CE1), .A1(local_m_buf_addr_A1), .D1(
                    local_m_buf_addr_D1), .WE1(local_m_buf_addr_WE1), .Q0(
                    local_m_buf_addr_Q0));
  identity_async_read_2x32m0 local_m_buf_data_bridge0(.rtl_CE(
                             memread_my_fifo_local_m_buf_data_ln49_en), .rtl_A(
                             local_m_r_ind_prev), .mem_Q(local_m_buf_data_Q0), .CLK(
                             clk), .mem_CE(local_m_buf_data_CE0), .mem_A(
                             local_m_buf_data_A0), .rtl_Q(
                             memread_my_fifo_local_m_buf_data_ln49_rtl_Q));
  identity_async_read_2x32m0 local_m_buf_addr_bridge0(.rtl_CE(
                             memread_my_fifo_local_m_buf_data_ln49_en), .rtl_A(
                             local_m_r_ind_prev), .mem_Q(local_m_buf_addr_Q0), .CLK(
                             clk), .mem_CE(local_m_buf_addr_CE0), .mem_A(
                             local_m_buf_addr_A0), .rtl_Q(
                             memread_my_fifo_local_m_buf_addr_ln49_rtl_Q));
  identity_sync_write_2x32m0 local_m_buf_addr_bridge1(.rtl_CE(ctrlAnd_1_ln96_z), 
                             .rtl_A(local_m_w_ind_prev), .rtl_D(
                             mux_read_my_fifo_adr_ln42_Z_v), .rtl_WE(
                             ctrlAnd_1_ln96_z), .CLK(clk), .mem_CE(
                             local_m_buf_addr_CE1), .mem_A(local_m_buf_addr_A1), 
                             .mem_D(local_m_buf_addr_D1), .mem_WE(
                             local_m_buf_addr_WE1));
  identity_sync_write_2x32m0 local_m_buf_data_bridge1(.rtl_CE(ctrlAnd_1_ln96_z), 
                             .rtl_A(local_m_w_ind_prev), .rtl_D(
                             mux_read_my_fifo_data_in_ln41_Z_v), .rtl_WE(
                             ctrlAnd_1_ln96_z), .CLK(clk), .mem_CE(
                             local_m_buf_data_CE1), .mem_A(local_m_buf_data_A1), 
                             .mem_D(local_m_buf_data_D1), .mem_WE(
                             local_m_buf_data_WE1));
  // pragma sync_set_reset_local my_fifo_process_fifo_seq_block rst
  always @(posedge clk) // my_fifo_process_fifo_sequential
    begin : my_fifo_process_fifo_seq_block
      if (!rst) // Initialize state and outputs
      begin
        nb_can_get_ln46_nb_can_get_out_0_tag_0 <= 1'b0;
        read_my_fifo_adr_ln42_q <= 32'h0;
        local_m_r_clk_prev <= 1'b0;
        local_m_r_top_prev <= 1'b0;
        local_m_r_ind_prev <= 1'b0;
        mux_local_m_w_clk_ln39_q <= 1'b0;
        mux_local_m_r_clk_ln39_q <= 1'b0;
        read_my_fifo_data_in_ln41_q <= 32'h0;
        local_m_w_clk_prev <= 1'b0;
        local_m_w_top_prev <= 1'b0;
        local_m_w_ind_prev <= 1'b0;
        state_my_fifo_process_fifo <= 4'h1;
      end
      else // Update Q values
      begin
        nb_can_get_ln46_nb_can_get_out_0_tag_0 <= 
        mux_nb_can_get_ln46_nb_can_get_out_0_v;
        read_my_fifo_adr_ln42_q <= mux_read_my_fifo_adr_ln42_Z_v;
        local_m_r_clk_prev <= local_m_r_clk_prev_d;
        local_m_r_top_prev <= local_m_r_top_prev_d;
        local_m_r_ind_prev <= local_m_r_ind_prev_d;
        mux_local_m_w_clk_ln39_q <= mux_local_m_r_clk_ln39_d_0[1];
        mux_local_m_r_clk_ln39_q <= mux_local_m_r_clk_ln39_d_0[0];
        read_my_fifo_data_in_ln41_q <= {mux_read_my_fifo_data_in_ln41_Z_v[31:1], 
        read_my_fifo_data_in_ln41_0_d};
        local_m_w_clk_prev <= local_m_w_clk_prev_d;
        local_m_w_top_prev <= local_m_w_top_prev_d;
        local_m_w_ind_prev <= local_m_w_ind_prev_d;
        state_my_fifo_process_fifo <= state_my_fifo_process_fifo_next;
      end
    end
  always @(posedge clk) // my_fifo_process_fifo_0_sequential
    begin
      data_in_fifo <= data_in_fifo_d;
      adr_fifo <= adr_fifo_d;
    end
  _is_busy_r _is_busy_r(.local_m_r_clk_in(mux_local_m_r_clk_ln39_q), .read_local_m_r_clk_prev(
             local_m_r_clk_prev), ._is_busy_r_out(_is_busy_r_ln46_z));
  _is_empty _is_empty(.read_local_m_r_ind_prev(local_m_r_ind_prev), .read_local_m_w_ind_prev(
            local_m_w_ind_prev), .read_local_m_r_top_prev(local_m_r_top_prev), .read_local_m_w_top_prev(
            local_m_w_top_prev), ._is_empty_out(_is_empty_ln46_z));
  _is_full _is_full(.read_local_m_w_ind_prev(local_m_w_ind_prev), .read_local_m_r_ind_prev(
           local_m_r_ind_prev), .read_local_m_w_top_prev(local_m_w_top_prev), .read_local_m_r_top_prev(
           local_m_r_top_prev), ._is_full_out(_is_full_ln96_z));
  nb_can_get nb_can_get(.local_m_r_clk_in(mux_local_m_r_clk_ln39_q), .read_local_m_r_clk_prev(
             local_m_r_clk_prev), .read_local_m_r_ind_prev(local_m_r_ind_prev), 
             .read_local_m_w_ind_prev(local_m_w_ind_prev), .read_local_m_r_top_prev(
             local_m_r_top_prev), .read_local_m_w_top_prev(local_m_w_top_prev), 
             .nb_can_get_out(nb_can_get_ln46_z));
  _is_busy_w _is_busy_w(.local_m_w_clk_in(mux_mux_local_m_w_clk_ln39_Z_0_v), .read_local_m_w_clk_prev(
             local_m_w_clk_prev), ._is_busy_w_out(_is_busy_w_ln96_z));
  always @(*) begin : my_fifo_process_fifo_combinational
      state_my_fifo_process_fifo_next = 4'h0;
      ctrlOr_ln46_0_z = state_my_fifo_process_fifo[3] | 
      state_my_fifo_process_fifo[2];
      unary_nor_ln392_z = ~local_m_r_top_prev;
      unary_nor_ln410_z = ~local_m_w_top_prev;
      unary_nor_ln386_z = ~mux_local_m_r_clk_ln39_q;
      if (state_my_fifo_process_fifo[2]) 
        mux_nb_can_get_ln46_nb_can_get_out_0_v = nb_can_get_ln46_z;
      else 
        mux_nb_can_get_ln46_nb_can_get_out_0_v = 
        nb_can_get_ln46_nb_can_get_out_0_tag_0;
      if (state_my_fifo_process_fifo[0]) 
        mux_local_m_w_clk_ln39_z = 1'b0;
      else 
        mux_local_m_w_clk_ln39_z = !mux_local_m_w_clk_ln39_q;
      if (state_my_fifo_process_fifo[1]) 
        mux_read_my_fifo_adr_ln42_Z_v = read_my_fifo_adr_ln42_q;
      else 
        mux_read_my_fifo_adr_ln42_Z_v = adr;
      if (state_my_fifo_process_fifo[1]) 
        mux_read_my_fifo_data_in_ln41_Z_v = read_my_fifo_data_in_ln41_q;
      else 
        mux_read_my_fifo_data_in_ln41_Z_v = data_in;
      if (state_my_fifo_process_fifo[2]) 
        mux_unary_nor_ln386_Z_0_v = unary_nor_ln386_z;
      else 
        mux_unary_nor_ln386_Z_0_v = !mux_local_m_r_clk_ln39_q;
      ternaryMux_ln46_0_z = _is_empty_ln46_z | _is_busy_r_ln46_z;
      mux_local_m_r_clk_ln46_0_z = nb_can_get_ln46_z ^ mux_local_m_r_clk_ln39_q;
      if (state_my_fifo_process_fifo[2]) 
        mux_if_ln46_Z_0_v = nb_can_get_ln46_z;
      else 
        mux_if_ln46_Z_0_v = nb_can_get_ln46_nb_can_get_out_0_tag_0;
      unary_nor_ln404_z = ~mux_local_m_w_clk_ln39_z;
      if (state_my_fifo_process_fifo[1]) 
        mux_mux_local_m_w_clk_ln39_Z_0_v = mux_local_m_w_clk_ln39_q;
      else 
        mux_mux_local_m_w_clk_ln39_Z_0_v = mux_local_m_w_clk_ln39_z;
      if (state_my_fifo_process_fifo[2]) 
        mux_mux_local_m_r_clk_ln46_0_Z_0_v = mux_local_m_r_clk_ln46_0_z;
      else 
        mux_mux_local_m_r_clk_ln46_0_Z_0_v = read_my_fifo_data_in_ln41_q[0];
      ctrlAnd_while_ln46_z = ternaryMux_ln46_0_z & mux_if_ln46_Z_0_v;
      if (state_my_fifo_process_fifo[1]) 
        mux_unary_nor_ln404_Z_0_v = !mux_local_m_w_clk_ln39_q;
      else 
        mux_unary_nor_ln404_Z_0_v = unary_nor_ln404_z;
      if (state_my_fifo_process_fifo[0]) 
        mux_local_m_r_clk_ln39_z = 1'b0;
      else 
        mux_local_m_r_clk_ln39_z = mux_mux_local_m_r_clk_ln46_0_Z_0_v;
      ternaryMux_ln96_0_z = _is_full_ln96_z | _is_busy_w_ln96_z;
      if (state_my_fifo_process_fifo[1]) 
        mux_mux_local_m_r_clk_ln39_Z_0_v = mux_local_m_r_clk_ln39_q;
      else 
        mux_mux_local_m_r_clk_ln39_Z_0_v = mux_local_m_r_clk_ln39_z;
      ctrlAnd_1_ln46_0_z = !ctrlAnd_while_ln46_z & ctrlOr_ln46_0_z;
      ctrlAnd_0_ln46_0_z = ctrlAnd_while_ln46_z & ctrlOr_ln46_0_z;
      memread_my_fifo_local_m_buf_data_ln49_en = mux_if_ln46_Z_0_v & 
      ctrlAnd_1_ln46_0_z;
      write_my_fifo_adr_fifo_ln50_en = rst & mux_if_ln46_Z_0_v & 
      ctrlAnd_1_ln46_0_z;
      write_my_fifo_local_m_r_ind_prev_ln391_en = mux_if_ln46_Z_0_v & 
      local_m_r_ind_prev & ctrlAnd_1_ln46_0_z;
      write_my_fifo_local_m_r_ind_prev_ln394_en = mux_if_ln46_Z_0_v & !
      local_m_r_ind_prev & ctrlAnd_1_ln46_0_z;
      ctrlOr_ln39_z = ctrlAnd_1_ln46_0_z | state_my_fifo_process_fifo[0];
      local_m_r_ind_prev_hold = ~(write_my_fifo_local_m_r_ind_prev_ln394_en | 
      write_my_fifo_local_m_r_ind_prev_ln391_en);
      ctrlOr_ln96_z = state_my_fifo_process_fifo[1] | ctrlOr_ln39_z;
      if (memread_my_fifo_local_m_buf_data_ln49_en) 
        local_m_r_clk_prev_d = mux_unary_nor_ln386_Z_0_v;
      else 
        local_m_r_clk_prev_d = local_m_r_clk_prev;
      if (write_my_fifo_local_m_r_ind_prev_ln391_en) 
        local_m_r_top_prev_d = unary_nor_ln392_z;
      else 
        local_m_r_top_prev_d = local_m_r_top_prev;
      case (1'b1)// pragma parallel_case
        write_my_fifo_local_m_r_ind_prev_ln391_en: local_m_r_ind_prev_d = 1'b0;
        write_my_fifo_local_m_r_ind_prev_ln394_en: local_m_r_ind_prev_d = 1'b1;
        local_m_r_ind_prev_hold: local_m_r_ind_prev_d = local_m_r_ind_prev;
        default: local_m_r_ind_prev_d = 1'bX;
      endcase
      ctrlAnd_1_ln96_z = !ternaryMux_ln96_0_z & ctrlOr_ln96_z;
      mux_local_m_r_clk_ln39_mux_0_sel = ctrlOr_ln96_z;
      ctrlAnd_0_ln96_z = ternaryMux_ln96_0_z & ctrlOr_ln96_z;
      write_my_fifo_local_m_w_ind_prev_ln409_en = local_m_w_ind_prev & 
      ctrlAnd_1_ln96_z;
      write_my_fifo_local_m_w_ind_prev_ln412_en = !local_m_w_ind_prev & 
      ctrlAnd_1_ln96_z;
      case (1'b1)// pragma parallel_case
        mux_local_m_r_clk_ln39_mux_0_sel: mux_local_m_r_clk_ln39_d_0 = {
          mux_mux_local_m_w_clk_ln39_Z_0_v, mux_mux_local_m_r_clk_ln39_Z_0_v};
        ctrlAnd_0_ln46_0_z: mux_local_m_r_clk_ln39_d_0 = {
          mux_local_m_w_clk_ln39_q, mux_local_m_r_clk_ln39_q};
        default: mux_local_m_r_clk_ln39_d_0 = 2'hX;
      endcase
      case (1'b1)// pragma parallel_case
        ctrlAnd_0_ln96_z: read_my_fifo_data_in_ln41_0_d = 
          mux_read_my_fifo_data_in_ln41_Z_v[0];
        ctrlAnd_0_ln46_0_z: read_my_fifo_data_in_ln41_0_d = 
          mux_mux_local_m_r_clk_ln46_0_Z_0_v;
        default: read_my_fifo_data_in_ln41_0_d = 1'bX;
      endcase
      if (write_my_fifo_adr_fifo_ln50_en) 
        data_in_fifo_d = memread_my_fifo_local_m_buf_data_ln49_rtl_Q;
      else 
        data_in_fifo_d = data_in_fifo;
      if (write_my_fifo_adr_fifo_ln50_en) 
        adr_fifo_d = memread_my_fifo_local_m_buf_addr_ln49_rtl_Q;
      else 
        adr_fifo_d = adr_fifo;
      if (ctrlAnd_1_ln96_z) 
        local_m_w_clk_prev_d = mux_unary_nor_ln404_Z_0_v;
      else 
        local_m_w_clk_prev_d = local_m_w_clk_prev;
      local_m_w_ind_prev_hold = ~(write_my_fifo_local_m_w_ind_prev_ln412_en | 
      write_my_fifo_local_m_w_ind_prev_ln409_en);
      if (write_my_fifo_local_m_w_ind_prev_ln409_en) 
        local_m_w_top_prev_d = unary_nor_ln410_z;
      else 
        local_m_w_top_prev_d = local_m_w_top_prev;
      case (1'b1)// pragma parallel_case
        write_my_fifo_local_m_w_ind_prev_ln409_en: local_m_w_ind_prev_d = 1'b0;
        write_my_fifo_local_m_w_ind_prev_ln412_en: local_m_w_ind_prev_d = 1'b1;
        local_m_w_ind_prev_hold: local_m_w_ind_prev_d = local_m_w_ind_prev;
        default: local_m_w_ind_prev_d = 1'bX;
      endcase
      case (1'b1)// pragma parallel_case
        state_my_fifo_process_fifo[0]: // Wait_ln37
          begin
            case (1'b1)// pragma parallel_case
              ctrlAnd_0_ln96_z: state_my_fifo_process_fifo_next[1] = 1'b1;
              ctrlAnd_1_ln96_z: state_my_fifo_process_fifo_next[2] = 1'b1;
              default: state_my_fifo_process_fifo_next = 4'hX;
            endcase
          end
        state_my_fifo_process_fifo[1]: // Wait_ln97
          begin
            case (1'b1)// pragma parallel_case
              ctrlAnd_0_ln96_z: state_my_fifo_process_fifo_next[1] = 1'b1;
              ctrlAnd_1_ln96_z: state_my_fifo_process_fifo_next[2] = 1'b1;
              default: state_my_fifo_process_fifo_next = 4'hX;
            endcase
          end
        state_my_fifo_process_fifo[2]: // Wait_ln44
          begin
            case (1'b1)// pragma parallel_case
              ctrlAnd_0_ln46_0_z: state_my_fifo_process_fifo_next[3] = 1'b1;
              ctrlAnd_0_ln96_z: state_my_fifo_process_fifo_next[1] = 1'b1;
              ctrlAnd_1_ln96_z: state_my_fifo_process_fifo_next[2] = 1'b1;
              default: state_my_fifo_process_fifo_next = 4'hX;
            endcase
          end
        state_my_fifo_process_fifo[3]: // Wait_ln47
          begin
            case (1'b1)// pragma parallel_case
              ctrlAnd_0_ln46_0_z: state_my_fifo_process_fifo_next[3] = 1'b1;
              ctrlAnd_0_ln96_z: state_my_fifo_process_fifo_next[1] = 1'b1;
              ctrlAnd_1_ln96_z: state_my_fifo_process_fifo_next[2] = 1'b1;
              default: state_my_fifo_process_fifo_next = 4'hX;
            endcase
          end
        default: // Don't care
          state_my_fifo_process_fifo_next = 4'hX;
      endcase
    end
endmodule


module _is_busy_r(local_m_r_clk_in, read_local_m_r_clk_prev, _is_busy_r_out);
  input local_m_r_clk_in;
  input read_local_m_r_clk_prev;
  output reg _is_busy_r_out;
  reg ne_ln351_z;

  // lint_checking URAREG OFF
`ifndef SYNTHESIS
  reg CtoS_rtl__is_busy_r;
`endif
  // lint_checking URAREG ON
  always @(*) begin : _is_busy_r_combinational
      ne_ln351_z = read_local_m_r_clk_prev ^ local_m_r_clk_in;
      _is_busy_r_out = ne_ln351_z;
    end
endmodule


module _is_empty(read_local_m_r_ind_prev, read_local_m_w_ind_prev, 
read_local_m_r_top_prev, read_local_m_w_top_prev, _is_empty_out);
  input read_local_m_r_ind_prev;
  input read_local_m_w_ind_prev;
  input read_local_m_r_top_prev;
  input read_local_m_w_top_prev;
  output reg _is_empty_out;
  reg eq_ln367_z;
  reg eq_ln368_z;
  reg ternaryMux_ln368_0_z;

  // lint_checking URAREG OFF
`ifndef SYNTHESIS
  reg CtoS_rtl__is_empty;
`endif
  // lint_checking URAREG ON
  always @(*) begin : _is_empty_combinational
      eq_ln367_z = ~(read_local_m_w_ind_prev ^ read_local_m_r_ind_prev);
      eq_ln368_z = ~(read_local_m_w_top_prev ^ read_local_m_r_top_prev);
      ternaryMux_ln368_0_z = eq_ln367_z & eq_ln368_z;
      _is_empty_out = ternaryMux_ln368_0_z;
    end
endmodule


module _is_full(read_local_m_w_ind_prev, read_local_m_r_ind_prev, 
read_local_m_w_top_prev, read_local_m_r_top_prev, _is_full_out);
  input read_local_m_w_ind_prev;
  input read_local_m_r_ind_prev;
  input read_local_m_w_top_prev;
  input read_local_m_r_top_prev;
  output reg _is_full_out;
  reg eq_ln376_z;
  reg ne_ln377_z;
  reg ternaryMux_ln377_0_z;

  // lint_checking URAREG OFF
`ifndef SYNTHESIS
  reg CtoS_rtl__is_full;
`endif
  // lint_checking URAREG ON
  always @(*) begin : _is_full_combinational
      eq_ln376_z = ~(read_local_m_r_ind_prev ^ read_local_m_w_ind_prev);
      ne_ln377_z = read_local_m_r_top_prev ^ read_local_m_w_top_prev;
      ternaryMux_ln377_0_z = eq_ln376_z & ne_ln377_z;
      _is_full_out = ternaryMux_ln377_0_z;
    end
endmodule


module nb_can_get(local_m_r_clk_in, read_local_m_r_clk_prev, 
read_local_m_r_ind_prev, read_local_m_w_ind_prev, read_local_m_r_top_prev, 
read_local_m_w_top_prev, nb_can_get_out);
  input local_m_r_clk_in;
  input read_local_m_r_clk_prev;
  input read_local_m_r_ind_prev;
  input read_local_m_w_ind_prev;
  input read_local_m_r_top_prev;
  input read_local_m_w_top_prev;
  output reg nb_can_get_out;
  wire _is_empty_ln80_z;
  wire _is_busy_r_ln80_z;
  reg unary_nor_ln80_0_z;
  reg ternaryMux_ln80_0_z;

  // lint_checking URAREG OFF
`ifndef SYNTHESIS
  reg CtoS_rtl_nb_can_get;
`endif
  // lint_checking URAREG ON
  _is_busy_r _is_busy_r_ln80(.local_m_r_clk_in(local_m_r_clk_in), .read_local_m_r_clk_prev(
             read_local_m_r_clk_prev), ._is_busy_r_out(_is_busy_r_ln80_z));
  _is_empty _is_empty_ln80(.read_local_m_r_ind_prev(read_local_m_r_ind_prev), .read_local_m_w_ind_prev(
            read_local_m_w_ind_prev), .read_local_m_r_top_prev(
            read_local_m_r_top_prev), .read_local_m_w_top_prev(
            read_local_m_w_top_prev), ._is_empty_out(_is_empty_ln80_z));
  always @(*) begin : nb_can_get_combinational
      unary_nor_ln80_0_z = ~_is_busy_r_ln80_z;
      ternaryMux_ln80_0_z = !_is_empty_ln80_z & unary_nor_ln80_0_z;
      nb_can_get_out = ternaryMux_ln80_0_z;
    end
endmodule


module _is_busy_w(local_m_w_clk_in, read_local_m_w_clk_prev, _is_busy_w_out);
  input local_m_w_clk_in;
  input read_local_m_w_clk_prev;
  output reg _is_busy_w_out;
  reg ne_ln359_z;

  // lint_checking URAREG OFF
`ifndef SYNTHESIS
  reg CtoS_rtl__is_busy_w;
`endif
  // lint_checking URAREG ON
  always @(*) begin : _is_busy_w_combinational
      ne_ln359_z = read_local_m_w_clk_prev ^ local_m_w_clk_in;
      _is_busy_w_out = ne_ln359_z;
    end
endmodule


module identity_async_read_2x32m0(rtl_CE, rtl_A, mem_Q, CLK, mem_CE, mem_A, rtl_Q);
    input rtl_CE;
    input rtl_A;
    input [31 : 0] mem_Q;
    input CLK;
    output mem_CE;
    output mem_A;
    output [31 : 0] rtl_Q;

    assign mem_CE = rtl_CE;
    assign mem_A = rtl_A;
`ifndef CTOS_SIM_MULTI_LANGUAGE_EXTERNAL_ARRAY
    assign rtl_Q = mem_Q;

`else
    // This is only required when simulating a multi-language design.
    reg [31:0] dpi_Q;
    bit use_dpi;
    wire m_ready;
    // Pick which Q drives the RTL Q.
    assign rtl_Q = use_dpi ? dpi_Q : mem_Q;
    initial begin
        use_dpi = 0;

        @(posedge m_ready)
        use_dpi = 1;
    end
    ctos_external_array_accessor #(.ADDR_WIDTH(1), .DATA_WIDTH(32), .TRACE(`CTOS_TRACE_EXT_ARRAY_)) arr_ref(m_ready);

    always @(posedge CLK) begin
        if (use_dpi) begin
            if (rtl_CE) begin
                arr_ref.read(rtl_A, dpi_Q);
            end
        end
    end
`endif
endmodule


module identity_sync_write_2x32m0(rtl_CE, rtl_A, rtl_D, rtl_WE, CLK, mem_CE, mem_A, mem_D, mem_WE);
    input rtl_CE;
    input rtl_A;
    input [31 : 0] rtl_D;
    input rtl_WE;
    input CLK;
    output mem_CE;
    output mem_A;
    output [31 : 0] mem_D;
    output mem_WE;

    assign mem_CE = rtl_CE;
    assign mem_A = rtl_A;
    assign mem_D = rtl_D;
    assign mem_WE = rtl_WE;
`ifdef CTOS_SIM_MULTI_LANGUAGE_EXTERNAL_ARRAY
    // This is only required when simulating a multi-language design.
    bit use_dpi;
    wire m_ready;
    initial begin
        use_dpi = 0;

        @(posedge m_ready)
        use_dpi = 1;
    end
    ctos_external_array_accessor #(.ADDR_WIDTH(1), .DATA_WIDTH(32), .TRACE(`CTOS_TRACE_EXT_ARRAY_)) arr_ref(m_ready);

    always @(posedge CLK) begin
        if (use_dpi) begin
            if (rtl_CE && rtl_WE) begin
                arr_ref.write(rtl_A, rtl_D);
            end
        end
    end
`endif
endmodule


module ram_2x32_1ar_1w_r(CLK, RST_N, CE0, A0, CE1, A1, D1, WE1, Q0);
    input CLK;
    input RST_N;
    input CE0;
    input A0;
    input CE1;
    input A1;
    input [31 : 0] D1;
    input WE1;
    output [31 : 0] Q0;

    reg [31 : 0] M [0 : 1];

    assign Q0 = {32{CE0}} & M[A0];

    always @(posedge CLK) begin
        if (!RST_N) begin  : reset_block
            M[0] <= 32'h0;
            M[1] <= 32'h0;
        end
        else begin
                        if (CE1 & WE1)
                M[A1] <= D1;
        end
    end
endmodule

module xbus_hw_idct_rtl(clk, reset, pse, ret_en, iso_en, ms, read, size, adr, 
data_in, data_out);
  input clk;
  input reset;
  input pse;
  input ret_en;
  input iso_en;
  input ms;
  input read;
  input size;
  input [31:0] adr;
  input [31:0] data_in;
  output reg [31:0] data_out;
  reg bus_if_CtoS_func_start;
  reg bus_if_CtoS_func_done;
  reg ctrlAnd_1_ln63_z;
  reg [1:0] if_ln65_z;
  wire [7:0] memread_xbus_hw_idct_output_buf_ln67_rtl_Q;
  reg Wait_ln70_q;
  reg read_xbus_hw_idct_read_ln65_Z_0_tag_0;
  reg [5:0] mux_in_ind_ln62_q;
  reg write_xbus_hw_idct_data_out_ln67_en;
  wire signed [7:0] range_limit_ln367_z;
  wire signed [7:0] range_limit_ln370_z;
  wire signed [7:0] range_limit_ln355_z;
  wire signed [7:0] range_limit_ln358_z;
  wire signed [7:0] range_limit_ln361_z;
  wire signed [7:0] range_limit_ln364_z;
  wire signed [7:0] range_limit_ln349_z;
  wire signed [7:0] range_limit_ln352_z;
  reg [31:0] data_out_bus_if_d;
  reg [31:0] data_out_d;
  reg [5:0] mux_mux_out_ind_ln62_Z_v;
  reg [4:0] state_bus_if;
  reg [4:0] state_bus_if_next;
  reg [6:0] mux_in_ind_ln65_q;
  reg [5:0] mux_out_ind_ln62_q;
  reg ctrlAnd_1_ln62_z;
  reg [5:0] mux_out_ind_ln62_z;
  reg [5:0] mux_in_ind_ln62_z;
  reg ctrlAnd_0_ln62_z;
  reg [5:0] mux_mux_in_ind_ln62_Z_v;
  reg ctrlOr_ln62_z;
  reg [5:0] add_ln68_z;
  reg [6:0] add_ln77_z;
  reg ctrlOr_ln63_z;
  reg [5:0] mux_out_ind_ln65_z;
  reg [6:0] mux_in_ind_ln65_z;
  reg ctrlAnd_0_ln63_z;
  reg ctrlAnd_rerun_z;
  reg ctrlAnd_not_rerun_z;
  reg ctrlAnd_start_z;
  reg ctrlAnd_not_start_z;
  reg [6:0] mux_in_ind_ln65_d;
  reg [5:0] mux_out_ind_ln62_d;
  reg ctrlOr_while_z;
  reg ctrlOr_run_z;
  reg ctrlOr_idle_z;
  reg [31:0] state_xbus_hw_idct_run;
  reg [31:0] state_xbus_hw_idct_run_next;
  wire coef_block_CE0;
  wire [5:0] coef_block_A0;
  wire coef_block_CE1;
  wire [5:0] coef_block_A1;
  wire [15:0] coef_block_D1;
  wire coef_block_WE1;
  wire [15:0] coef_block_Q0;
  wire output_buf_CE0;
  wire [5:0] output_buf_A0;
  wire output_buf_CE1;
  wire [5:0] output_buf_A1;
  wire [7:0] output_buf_D1;
  wire output_buf_WE1;
  wire [7:0] output_buf_Q0;
  wire workspace_CE0;
  wire [5:0] workspace_A0;
  wire workspace_CE1;
  wire [5:0] workspace_A1;
  wire [20:0] workspace_D1;
  wire workspace_WE1;
  wire [20:0] workspace_Q0;
  reg add_ln278_1_2_q;
  reg [1:0] add_ln277_0_1_q;
  reg add_ln279_0_1_q;
  reg mux_ctr_ln219_q;
  reg gt_ln219_q;
  reg [3:0] mux_inptr_ln219_q;
  reg [4:0] add_ln285_1_q;
  reg [5:0] mux_wsptr_ln219_q;
  reg add_ln247_2_q;
  reg add_ln246_1_q;
  reg mul_ln304_q;
  reg [15:0] mul_ln331_2_q;
  reg [12:0] sub_ln240_q;
  reg [11:0] add_ln305_q;
  reg [10:0] sub_ln312_q;
  reg [12:0] sub_ln314_q;
  reg [7:0] add_ln237_q;
  reg mul_ln227_q;
  reg [31:0] add_ln228_q;
  reg [31:0] sub_ln238_q;
  reg [11:0] add_ln229_q;
  reg [26:0] mul_ln257_q;
  reg [10:0] mul_ln333_q;
  reg [5:0] add_ln278_0_1_q;
  reg [12:0] mul_ln332_q;
  reg [2:0] add_ln277_1_q;
  reg [30:0] mul_ln258_q;
  reg [31:0] mul_ln263_q;
  reg [31:0] mul_ln262_q;
  reg [28:0] mul_ln259_q;
  reg memwrite_xbus_hw_idct_coef_block_ln76_en;
  reg workspace_bridge0_rtl_CE_en;
  reg [5:0] workspace_bridge0_rtl_a;
  wire [20:0] workspace_bridge0_rtl_Q;
  reg coef_block_bridge0_rtl_CE_en;
  reg [5:0] coef_block_bridge0_rtl_a;
  wire [15:0] coef_block_bridge0_rtl_Q;
  reg memread_xbus_hw_idct_output_buf_ln67_en;
  reg output_buf_bridge1_rtl_CE_en;
  reg [5:0] output_buf_bridge1_rtl_a;
  reg [7:0] output_buf_bridge1_rtl_d;
  reg workspace_bridge1_rtl_CE_en;
  reg [5:0] workspace_bridge1_rtl_a;
  reg [20:0] workspace_bridge1_rtl_d;
  reg Pass1_for_begin_or_0;
  reg add_ln228_13_mux_0_sel;
  reg add_ln228_13_mux_0_sel_0;
  reg add_ln228_24_mux_0_sel;
  reg mul_ln227_mux_0_sel;
  reg add_ln229_5_mux_0_sel;
  reg add_ln229_sel;
  reg add_ln246_1_mux_0_sel;
  reg coef_block_bridge0_rtl_a_sel_0;
  reg add_ln277_0_1_1_sel;
  reg add_ln277_0_1_sel;
  reg add_ln277_1_sel;
  reg add_ln277_1_sel_0;
  reg add_ln278_0_1_2_mux_0_sel;
  reg add_ln278_0_1_sel;
  reg add_ln279_0_1_sel;
  reg coef_block_bridge0_rtl_a_sel;
  reg coef_block_bridge0_rtl_a_sel_1;
  reg ctrlAnd_1_ln219_z;
  reg ctrlAnd_1_ln295_z;
  reg mul_ln257_13_mux_0_sel;
  reg mul_ln257_21_mux_0_sel;
  reg mul_ln257_9_mux_0_sel;
  reg mul_ln257_sel;
  reg mul_ln258_12_mux_0_sel;
  reg mul_ln258_15_mux_0_sel;
  reg mul_ln258_20_mux_0_sel;
  reg mul_ln258_28_mux_0_sel;
  reg mul_ln258_5_mux_0_sel;
  reg mul_ln259_25_mux_0_sel;
  reg mul_ln259_4_mux_0_sel;
  reg mul_ln262_17_mux_0_sel;
  reg mul_ln263_10_sel;
  reg mul_ln263_11_mux_0_sel;
  reg mul_ln263_8_sel;
  reg mul_ln263_9_sel;
  reg mul_ln304_mux_0_sel;
  reg mul_ln331_2_sel_0;
  reg mux_ctr_ln219_mux_0_sel;
  reg mux_inptr_ln219_1_sel;
  reg mux_inptr_ln219_2_sel;
  reg mux_inptr_ln219_3_sel;
  reg mux_wsptr_ln219_1_mux_0_sel;
  reg mux_wsptr_ln219_2_sel;
  reg workspace_bridge1_rtl_a_sel;
  reg workspace_bridge1_rtl_a_sel_0;
  reg ctrlAnd_0_ln295_z;
  reg ctrlAnd_0_ln219_z;
  reg ctrlOr_ln89_z;
  reg [2:0] mux_ctr_ln219_z;
  reg [2:0] mux_ctr_ln295_z;
  reg [5:0] mux_inptr_ln219_z;
  reg [2:0] mux_wsptr_ln295_z;
  reg [5:0] mux_wsptr_ln219_z;
  reg ctrlOr_ln295_z;
  reg [2:0] sub_ln219_z;
  reg [3:0] add_ln295_z;
  reg [2:0] add_ln249_z;
  reg [5:0] add_ln285_z;
  reg [1:0] add_ln225_z;
  reg [2:0] add_ln248_z;
  reg [2:0] add_ln247_z;
  reg [2:0] add_ln246_z;
  reg xor_ln232_z;
  reg [1:0] add_ln224_z;
  reg [2:0] add_ln374_z;
  reg [2:0] add_ln278_1_z;
  reg [5:0] add_ln286_z;
  reg [1:0] add_ln279_0_z;
  reg [2:0] add_ln282_1_z;
  reg [2:0] add_ln281_0_z;
  reg [2:0] add_ln277_0_z;
  reg xor_ln283_0_z;
  reg [1:0] add_ln280_1_z;
  reg ctrlAnd_bus_if_funcCallFork_ln90_1_z;
  reg ctrlAnd_bus_if_funcCallFork_ln90_0_z;
  reg gt_ln219_z;
  reg ctrlOr_bus_if_funcCallJoin_ln90_z;
  reg ctrlOr_ln219_z;
  reg [21:0] add_ln304_z;
  reg [21:0] add_ln325_z;
  reg [21:0] add_ln326_z;
  reg [21:0] add_ln327_z;
  reg [21:0] add_ln328_z;
  reg signed [26:0] mul_ln331_z;
  reg signed [27:0] mul_ln334_z;
  reg signed [27:0] mul_ln332_z;
  reg signed [26:0] mul_ln306_z;
  reg signed [25:0] mul_ln333_z;
  reg signed [27:0] mul_ln305_z;
  reg [14:0] sub_ln309_z;
  reg [14:0] add_ln308_0_z;
  reg add_ln277_0_1_1_d;
  reg [1:0] add_ln277_0_1_d;
  reg add_ln279_0_1_d;
  reg mul_ln331_2_sel;
  reg [6:0] mux_ctr_ln219_d_0;
  reg mux_inptr_ln219_1_d;
  reg mux_inptr_ln219_2_d;
  reg mux_inptr_ln219_3_d;
  reg [5:0] mux_wsptr_ln219_1_d_0;
  reg mux_wsptr_ln219_2_d;
  reg [1:0] add_ln246_1_d_0;
  reg signed [27:0] mul_ln304_z;
  reg signed [27:0] mul_ln335_z;
  reg signed [27:0] mul_ln336_z;
  reg signed [27:0] mul_ln337_z;
  reg signed [25:0] mul_ln338_z;
  reg [22:0] add_ln329_z;
  reg [27:0] sub_ln314_z;
  reg [14:0] add_ln313_z;
  reg [27:0] sub_ln312_z;
  reg [14:0] add_ln311_z;
  reg [27:0] add_ln305_z;
  reg [26:0] add_ln306_z;
  reg signed [27:0] mul_ln329_z;
  reg [6:0] mul_ln304_d_0;
  reg [27:0] add_ln340_z;
  reg [25:0] add_ln341_z;
  reg [27:0] add_ln345_z;
  reg [27:0] add_ln343_z;
  reg [27:0] add_ln346_z;
  reg [27:0] add_ln344_z;
  reg [16:0] add_ln234_z;
  reg [16:0] add_ln251_z;
  reg [16:0] add_ln252_z;
  reg [16:0] add_ln253_z;
  reg [16:0] add_ln254_z;
  reg [15:0] mul_ln331_2_d;
  reg signed [26:0] mul_ln257_z;
  reg signed [29:0] mul_ln260_z;
  reg signed [30:0] mul_ln258_z;
  reg signed [27:0] mul_ln229_z;
  reg signed [28:0] mul_ln259_z;
  reg signed [30:0] mul_ln228_z;
  reg [16:0] sub_ln235_z;
  reg [16:0] add_ln227_z;
  reg [25:0] add_ln345_0_z;
  reg [26:0] add_ln343_0_z;
  reg [27:0] add_ln346_0_z;
  reg [27:0] add_ln344_0_z;
  reg [31:0] sub_ln238_z;
  reg [18:0] add_ln237_z;
  reg signed [30:0] mul_ln261_z;
  reg signed [31:0] mul_ln262_z;
  reg signed [31:0] mul_ln263_z;
  reg signed [27:0] mul_ln264_z;
  reg [17:0] add_ln255_z;
  reg [8:0] mul_ln257_d;
  reg [31:0] sub_ln240_z;
  reg [18:0] add_ln239_z;
  reg signed [29:0] mul_ln227_z;
  reg [27:0] sub_ln358_z;
  reg [27:0] add_ln355_z;
  reg [27:0] sub_ln370_z;
  reg [27:0] add_ln367_z;
  reg [27:0] sub_ln352_z;
  reg [27:0] add_ln349_z;
  reg [27:0] sub_ln364_z;
  reg [27:0] add_ln361_z;
  reg [10:0] sub_ln238_2_d_0;
  reg signed [31:0] mul_ln255_z;
  reg [3:0] sub_ln240_9_d_0;
  reg [14:0] add_ln305_6_d_0;
  reg [34:0] add_ln237_d;
  reg [31:0] add_ln228_z;
  reg [29:0] add_ln229_z;
  reg [10:0] add_ln358_z;
  reg [10:0] add_ln355_0_z;
  reg [10:0] add_ln370_z;
  reg [10:0] add_ln367_0_z;
  reg [10:0] add_ln352_z;
  reg [10:0] add_ln349_0_z;
  reg [10:0] add_ln364_z;
  reg [10:0] add_ln361_0_z;
  reg [31:0] add_ln266_z;
  reg [29:0] add_ln267_z;
  reg [5:0] add_ln228_24_d_0;
  reg [1:0] add_ln228_30_d_0;
  reg [6:0] add_ln228_6_d_0;
  reg [6:0] mul_ln227_d_0;
  reg [10:0] add_ln228_13_d_0;
  reg [8:0] add_ln229_d;
  reg [1:0] sub_ln238_29_d_0;
  reg [18:0] add_ln229_5_d_0;
  reg [31:0] add_ln271_z;
  reg [31:0] add_ln269_z;
  reg [31:0] add_ln272_z;
  reg [31:0] add_ln270_z;
  reg [2:0] mul_ln258_12_d_0;
  reg [6:0] mul_ln258_5_d_0;
  reg [5:0] mul_ln257_21_d_0;
  reg [7:0] mul_ln257_13_d_0;
  reg [3:0] mul_ln257_9_d_0;
  reg [29:0] add_ln271_0_z;
  reg [30:0] add_ln269_0_z;
  reg [31:0] add_ln272_0_z;
  reg [31:0] add_ln270_0_z;
  reg [31:0] sub_ln279_z;
  reg [31:0] add_ln278_z;
  reg [31:0] sub_ln283_z;
  reg [31:0] add_ln282_z;
  reg [31:0] sub_ln277_z;
  reg [31:0] add_ln276_z;
  reg [31:0] sub_ln281_z;
  reg [31:0] add_ln280_z;
  reg [21:0] add_ln279_z;
  reg [21:0] add_ln278_0_z;
  reg [21:0] add_ln283_z;
  reg [21:0] add_ln282_0_z;
  reg [21:0] add_ln277_z;
  reg [21:0] add_ln276_0_z;
  reg [21:0] add_ln281_z;
  reg [21:0] add_ln280_0_z;
  reg [20:0] mul_ln259_4_d_0;
  reg [1:0] add_ln278_0_1_d;
  reg [10:0] mul_ln333_4_d_0;
  reg [7:0] add_ln278_0_1_2_d_0;
  reg [20:0] mul_ln263_11_d_0;
  reg [4:0] mul_ln258_d;
  reg [15:0] add_ln277_1_d;
  reg [7:0] mul_ln258_20_d_0;
  reg [2:0] mul_ln258_28_d_0;
  reg mul_ln263_10_d;
  reg [1:0] mul_ln263_6_d_0;
  reg mul_ln263_8_d;
  reg mul_ln263_9_d;
  reg [4:0] mul_ln258_15_d_0;
  reg [20:0] mul_ln262_17_d_0;
  reg [20:0] mul_ln259_25_d_0;

  // lint_checking URAREG OFF
`ifndef SYNTHESIS
  reg CtoS_rtl_xbus_hw_idct_rtl;
`endif
  // lint_checking URAREG ON
  // pragma sync_set_reset_local bus_if_seq_block reset
  always @(posedge clk) // bus_if_sequential
    begin : bus_if_seq_block
      if (!reset) // Initialize state and outputs
      begin
        read_xbus_hw_idct_read_ln65_Z_0_tag_0 <= 1'b0;
        mux_in_ind_ln62_q <= 6'h0;
        mux_in_ind_ln65_q <= 7'h0;
        mux_out_ind_ln62_q <= 6'h0;
        state_bus_if <= 5'h1;
      end
      else // Update Q values
      begin
        read_xbus_hw_idct_read_ln65_Z_0_tag_0 <= read;
        mux_in_ind_ln62_q <= mux_mux_in_ind_ln62_Z_v;
        mux_in_ind_ln65_q <= mux_in_ind_ln65_d;
        mux_out_ind_ln62_q <= mux_out_ind_ln62_d;
        state_bus_if <= state_bus_if_next;
      end
    end
  always @(posedge clk) // bus_if_0_sequential
    data_out <= data_out_d;
  always @(*) begin : bus_if_combinational
      state_bus_if_next = 5'h0;
      ctrlAnd_1_ln62_z = mux_in_ind_ln65_q[6] & state_bus_if[4];
      if_ln65_z = {!read, read};
      if (state_bus_if[1]) 
        mux_out_ind_ln62_z = 6'h0;
      else 
        mux_out_ind_ln62_z = mux_out_ind_ln62_q;
      if (state_bus_if[1]) 
        mux_in_ind_ln62_z = 6'h0;
      else 
        mux_in_ind_ln62_z = mux_in_ind_ln65_q[5:0];
      bus_if_CtoS_func_done = ctrlAnd_1_ln62_z;
      ctrlAnd_0_ln62_z = !mux_in_ind_ln65_q[6] & state_bus_if[4];
      if (state_bus_if[2]) 
        mux_mux_out_ind_ln62_Z_v = mux_out_ind_ln62_q;
      else 
        mux_mux_out_ind_ln62_Z_v = mux_out_ind_ln62_z;
      if (state_bus_if[2]) 
        mux_mux_in_ind_ln62_Z_v = mux_in_ind_ln62_q;
      else 
        mux_mux_in_ind_ln62_Z_v = mux_in_ind_ln62_z;
      ctrlOr_ln62_z = ctrlAnd_0_ln62_z | state_bus_if[1];
      add_ln68_z = mux_mux_out_ind_ln62_Z_v + 6'h1;
      add_ln77_z = {1'b0, mux_mux_in_ind_ln62_Z_v} + 7'h1;
      ctrlOr_ln63_z = state_bus_if[2] | ctrlOr_ln62_z;
      if (if_ln65_z[0]) 
        mux_out_ind_ln65_z = mux_mux_out_ind_ln62_Z_v;
      else 
        mux_out_ind_ln65_z = add_ln68_z;
      if (if_ln65_z[0]) 
        mux_in_ind_ln65_z = add_ln77_z;
      else 
        mux_in_ind_ln65_z = {1'b0, mux_mux_in_ind_ln62_Z_v};
      ctrlAnd_1_ln63_z = !ms & ctrlOr_ln63_z;
      ctrlAnd_0_ln63_z = ms & ctrlOr_ln63_z;
      ctrlAnd_rerun_z = bus_if_CtoS_func_start & ctrlAnd_1_ln62_z;
      ctrlAnd_not_rerun_z = !bus_if_CtoS_func_start & ctrlAnd_1_ln62_z;
      ctrlAnd_start_z = bus_if_CtoS_func_start & state_bus_if[0];
      ctrlAnd_not_start_z = !bus_if_CtoS_func_start & state_bus_if[0];
      case (1'b1)// pragma parallel_case
        ctrlAnd_1_ln63_z: mux_in_ind_ln65_d = mux_in_ind_ln65_z;
        state_bus_if[3]: mux_in_ind_ln65_d = mux_in_ind_ln65_q;
        default: mux_in_ind_ln65_d = 7'hX;
      endcase
      write_xbus_hw_idct_data_out_ln67_en = if_ln65_z[1] & ctrlAnd_1_ln63_z;
      case (1'b1)// pragma parallel_case
        ctrlAnd_0_ln63_z: mux_out_ind_ln62_d = mux_mux_out_ind_ln62_Z_v;
        ctrlAnd_1_ln63_z: mux_out_ind_ln62_d = mux_out_ind_ln65_z;
        state_bus_if[3]: mux_out_ind_ln62_d = mux_out_ind_ln62_q;
        default: mux_out_ind_ln62_d = 6'hX;
      endcase
      ctrlOr_while_z = ctrlAnd_not_rerun_z | 1'b0;
      ctrlOr_run_z = ctrlAnd_rerun_z | ctrlAnd_start_z;
      ctrlOr_idle_z = ctrlAnd_not_start_z | ctrlOr_while_z;
      data_out_bus_if_d = {{24{memread_xbus_hw_idct_output_buf_ln67_rtl_Q[7]}}, 
      memread_xbus_hw_idct_output_buf_ln67_rtl_Q};
      case (1'b1)// pragma parallel_case
        state_bus_if[0]: // idle_ln45
          begin
            case (1'b1)// pragma parallel_case
              ctrlOr_run_z: state_bus_if_next[1] = 1'b1;
              ctrlOr_idle_z: state_bus_if_next[0] = 1'b1;
              default: state_bus_if_next = 5'hX;
            endcase
          end
        state_bus_if[1]: // Wait_ln56
          begin
            case (1'b1)// pragma parallel_case
              ctrlAnd_0_ln63_z: state_bus_if_next[2] = 1'b1;
              ctrlAnd_1_ln63_z: state_bus_if_next[3] = 1'b1;
              default: state_bus_if_next = 5'hX;
            endcase
          end
        state_bus_if[2]: // Wait_ln63
          begin
            case (1'b1)// pragma parallel_case
              ctrlAnd_0_ln63_z: state_bus_if_next[2] = 1'b1;
              ctrlAnd_1_ln63_z: state_bus_if_next[3] = 1'b1;
              default: state_bus_if_next = 5'hX;
            endcase
          end
        state_bus_if[3]: // Wait_ln70
          state_bus_if_next[4] = 1'b1;
        state_bus_if[4]: // Wait_ln80
          begin
            case (1'b1)// pragma parallel_case
              ctrlAnd_0_ln63_z: state_bus_if_next[2] = 1'b1;
              ctrlAnd_1_ln63_z: state_bus_if_next[3] = 1'b1;
              ctrlOr_idle_z: state_bus_if_next[0] = 1'b1;
              ctrlOr_run_z: state_bus_if_next[1] = 1'b1;
              default: state_bus_if_next = 5'hX;
            endcase
          end
        default: // Don't care
          state_bus_if_next = 5'hX;
      endcase
      Wait_ln70_q = state_bus_if[3];
    end
  ram_64x16_1ar_1w_r coef_block(.CLK(clk), .RST_N(reset), .CE0(coef_block_CE0), 
                     .A0(coef_block_A0), .CE1(coef_block_CE1), .A1(coef_block_A1), 
                     .D1(coef_block_D1), .WE1(coef_block_WE1), .Q0(coef_block_Q0));
  ram_64x8_1ar_1w_r output_buf(.CLK(clk), .RST_N(reset), .CE0(output_buf_CE0), .A0(
                    output_buf_A0), .CE1(output_buf_CE1), .A1(output_buf_A1), .D1(
                    output_buf_D1), .WE1(output_buf_WE1), .Q0(output_buf_Q0));
  ram_64x21_1ar_1w_r workspace(.CLK(clk), .RST_N(reset), .CE0(workspace_CE0), .A0(
                     workspace_A0), .CE1(workspace_CE1), .A1(workspace_A1), .D1(
                     workspace_D1), .WE1(workspace_WE1), .Q0(workspace_Q0));
  identity_sync_write_64x16m0 coef_block_bridge1(.rtl_CE(
                              memwrite_xbus_hw_idct_coef_block_ln76_en), .rtl_A(
                              mux_in_ind_ln62_q), .rtl_D(data_in[15:0]), .rtl_WE(
                              memwrite_xbus_hw_idct_coef_block_ln76_en), .CLK(
                              clk), .mem_CE(coef_block_CE1), .mem_A(
                              coef_block_A1), .mem_D(coef_block_D1), .mem_WE(
                              coef_block_WE1));
  identity_async_read_64x21m0 workspace_bridge0(.rtl_CE(
                              workspace_bridge0_rtl_CE_en), .rtl_A(
                              workspace_bridge0_rtl_a), .mem_Q(workspace_Q0), .CLK(
                              clk), .mem_CE(workspace_CE0), .mem_A(workspace_A0), 
                              .rtl_Q(workspace_bridge0_rtl_Q));
  identity_async_read_64x16m0 coef_block_bridge0(.rtl_CE(
                              coef_block_bridge0_rtl_CE_en), .rtl_A(
                              coef_block_bridge0_rtl_a), .mem_Q(coef_block_Q0), 
                              .CLK(clk), .mem_CE(coef_block_CE0), .mem_A(
                              coef_block_A0), .rtl_Q(coef_block_bridge0_rtl_Q));
  identity_async_read_64x8m0 output_buf_bridge0(.rtl_CE(
                             memread_xbus_hw_idct_output_buf_ln67_en), .rtl_A(
                             mux_mux_out_ind_ln62_Z_v), .mem_Q(output_buf_Q0), .CLK(
                             clk), .mem_CE(output_buf_CE0), .mem_A(output_buf_A0), 
                             .rtl_Q(memread_xbus_hw_idct_output_buf_ln67_rtl_Q));
  identity_sync_write_64x8m0 output_buf_bridge1(.rtl_CE(
                             output_buf_bridge1_rtl_CE_en), .rtl_A(
                             output_buf_bridge1_rtl_a), .rtl_D(
                             output_buf_bridge1_rtl_d), .rtl_WE(
                             output_buf_bridge1_rtl_CE_en), .CLK(clk), .mem_CE(
                             output_buf_CE1), .mem_A(output_buf_A1), .mem_D(
                             output_buf_D1), .mem_WE(output_buf_WE1));
  identity_sync_write_64x21m0 workspace_bridge1(.rtl_CE(
                              workspace_bridge1_rtl_CE_en), .rtl_A(
                              workspace_bridge1_rtl_a), .rtl_D(
                              workspace_bridge1_rtl_d), .rtl_WE(
                              workspace_bridge1_rtl_CE_en), .CLK(clk), .mem_CE(
                              workspace_CE1), .mem_A(workspace_A1), .mem_D(
                              workspace_D1), .mem_WE(workspace_WE1));
  // pragma sync_set_reset_local xbus_hw_idct_run_seq_block reset
  always @(posedge clk) // xbus_hw_idct_run_sequential
    begin : xbus_hw_idct_run_seq_block
      if (!reset) // Initialize state and outputs
      begin
        add_ln278_1_2_q <= 1'b0;
        add_ln277_0_1_q <= 2'h0;
        add_ln279_0_1_q <= 1'b0;
        mux_ctr_ln219_q <= 1'b0;
        gt_ln219_q <= 1'b0;
        mux_inptr_ln219_q <= 4'h0;
        add_ln285_1_q <= 5'h0;
        mux_wsptr_ln219_q <= 6'h0;
        add_ln247_2_q <= 1'b0;
        add_ln246_1_q <= 1'b0;
        mul_ln304_q <= 1'b0;
        mul_ln331_2_q <= 16'h0;
        sub_ln240_q <= 13'h0;
        add_ln305_q <= 12'h0;
        sub_ln312_q <= 11'h0;
        sub_ln314_q <= 13'h0;
        add_ln237_q <= 8'h0;
        mul_ln227_q <= 1'b0;
        add_ln228_q <= 32'h0;
        sub_ln238_q <= 32'h0;
        add_ln229_q <= 12'h0;
        mul_ln257_q <= 27'h0;
        mul_ln333_q <= 11'h0;
        add_ln278_0_1_q <= 6'h0;
        mul_ln332_q <= 13'h0;
        add_ln277_1_q <= 3'h0;
        mul_ln258_q <= 31'h0;
        mul_ln263_q <= 32'h0;
        mul_ln262_q <= 32'h0;
        mul_ln259_q <= 29'h0;
        state_xbus_hw_idct_run <= 32'h1;
      end
      else // Update Q values
      begin
        add_ln278_1_2_q <= add_ln277_0_1_d[1];
        add_ln277_0_1_q <= {add_ln277_0_1_1_d, add_ln277_0_1_d[0]};
        add_ln279_0_1_q <= add_ln279_0_1_d;
        mux_ctr_ln219_q <= mux_ctr_ln219_d_0[0];
        gt_ln219_q <= mux_ctr_ln219_d_0[6];
        mux_inptr_ln219_q <= {mux_inptr_ln219_3_d, mux_inptr_ln219_2_d, 
        mux_inptr_ln219_1_d, mux_ctr_ln219_d_0[5]};
        add_ln285_1_q <= mux_wsptr_ln219_1_d_0[5:1];
        mux_wsptr_ln219_q <= {mux_ctr_ln219_d_0[4:2], mux_wsptr_ln219_2_d, 
        mux_wsptr_ln219_1_d_0[0], mux_ctr_ln219_d_0[1]};
        add_ln247_2_q <= add_ln246_1_d_0[1];
        add_ln246_1_q <= add_ln246_1_d_0[0];
        mul_ln304_q <= mul_ln304_d_0[0];
        mul_ln331_2_q <= mul_ln331_2_d;
        sub_ln240_q <= {sub_ln240_9_d_0, add_ln305_6_d_0[14:6]};
        add_ln305_q <= {add_ln305_6_d_0[5:0], mul_ln304_d_0[6:1]};
        sub_ln312_q <= add_ln237_d[18:8];
        sub_ln314_q <= add_ln237_d[34:22];
        add_ln237_q <= add_ln237_d[7:0];
        mul_ln227_q <= mul_ln227_d_0[0];
        add_ln228_q <= {add_ln228_30_d_0, add_ln228_24_d_0, add_ln228_13_d_0, 
        add_ln228_6_d_0, mul_ln227_d_0[6:1]};
        sub_ln238_q <= {add_ln237_d[21], sub_ln238_29_d_0, add_ln229_5_d_0[18:7], 
        add_ln229_d[8:5], sub_ln238_2_d_0, add_ln237_d[20:19]};
        add_ln229_q <= {add_ln229_5_d_0[6:0], add_ln229_d[4:0]};
        mul_ln257_q <= {mul_ln257_21_d_0, mul_ln257_13_d_0, mul_ln257_9_d_0, 
        mul_ln257_d};
        mul_ln333_q <= {mul_ln333_4_d_0[6:0], add_ln278_0_1_2_d_0[7:4]};
        add_ln278_0_1_q <= {add_ln278_0_1_2_d_0[3:0], add_ln278_0_1_d};
        mul_ln332_q <= add_ln277_1_d[15:3];
        add_ln277_1_q <= add_ln277_1_d[2:0];
        mul_ln258_q <= {mul_ln258_28_d_0, mul_ln258_20_d_0, mul_ln258_15_d_0, 
        mul_ln258_12_d_0, mul_ln258_5_d_0, mul_ln258_d};
        mul_ln263_q <= {mul_ln263_11_d_0, mul_ln263_10_d, mul_ln263_9_d, 
        mul_ln263_8_d, mul_ln263_6_d_0, mul_ln262_17_d_0[20:15]};
        mul_ln262_q <= {mul_ln262_17_d_0[14:0], mul_ln259_25_d_0[20:4]};
        mul_ln259_q <= {mul_ln259_25_d_0[3:0], mul_ln259_4_d_0, mul_ln333_4_d_0[
        10:7]};
        state_xbus_hw_idct_run <= state_xbus_hw_idct_run_next;
      end
    end
  range_limit range_limit_2(.ind_in(add_ln358_z[10:1]), .range_limit_out(
              range_limit_ln358_z));
  range_limit range_limit_1(.ind_in(add_ln355_0_z[10:1]), .range_limit_out(
              range_limit_ln355_z));
  range_limit range_limit_6(.ind_in(add_ln370_z[10:1]), .range_limit_out(
              range_limit_ln370_z));
  range_limit range_limit_5(.ind_in(add_ln367_0_z[10:1]), .range_limit_out(
              range_limit_ln367_z));
  range_limit range_limit_0(.ind_in(add_ln352_z[10:1]), .range_limit_out(
              range_limit_ln352_z));
  range_limit range_limit(.ind_in(add_ln349_0_z[10:1]), .range_limit_out(
              range_limit_ln349_z));
  range_limit range_limit_4(.ind_in(add_ln364_z[10:1]), .range_limit_out(
              range_limit_ln364_z));
  range_limit range_limit_3(.ind_in(add_ln361_0_z[10:1]), .range_limit_out(
              range_limit_ln361_z));
  always @(*) begin : xbus_hw_idct_run_combinational
      state_xbus_hw_idct_run_next = 32'h0;
      Pass1_for_begin_or_0 = state_xbus_hw_idct_run[15] | 
      state_xbus_hw_idct_run[1];
      add_ln228_13_mux_0_sel = state_xbus_hw_idct_run[22] | 
      state_xbus_hw_idct_run[21] | state_xbus_hw_idct_run[7] | 
      state_xbus_hw_idct_run[6] | state_xbus_hw_idct_run[5];
      add_ln228_13_mux_0_sel_0 = state_xbus_hw_idct_run[20] | 
      state_xbus_hw_idct_run[18] | state_xbus_hw_idct_run[16];
      add_ln228_24_mux_0_sel = state_xbus_hw_idct_run[20] | 
      state_xbus_hw_idct_run[16];
      mul_ln227_mux_0_sel = state_xbus_hw_idct_run[22] | 
      state_xbus_hw_idct_run[21] | state_xbus_hw_idct_run[20] | 
      state_xbus_hw_idct_run[19] | state_xbus_hw_idct_run[18] | 
      state_xbus_hw_idct_run[7] | state_xbus_hw_idct_run[6] | 
      state_xbus_hw_idct_run[5] | state_xbus_hw_idct_run[4];
      add_ln229_5_mux_0_sel = state_xbus_hw_idct_run[22] | 
      state_xbus_hw_idct_run[21] | state_xbus_hw_idct_run[20] | 
      state_xbus_hw_idct_run[7] | state_xbus_hw_idct_run[6] | 
      state_xbus_hw_idct_run[5];
      add_ln229_sel = state_xbus_hw_idct_run[22] | state_xbus_hw_idct_run[21] | 
      state_xbus_hw_idct_run[20] | state_xbus_hw_idct_run[18] | 
      state_xbus_hw_idct_run[7] | state_xbus_hw_idct_run[6] | 
      state_xbus_hw_idct_run[5];
      add_ln246_1_mux_0_sel = state_xbus_hw_idct_run[22] | 
      state_xbus_hw_idct_run[21] | state_xbus_hw_idct_run[20] | 
      state_xbus_hw_idct_run[19] | state_xbus_hw_idct_run[18] | 
      state_xbus_hw_idct_run[17] | state_xbus_hw_idct_run[16] | 
      state_xbus_hw_idct_run[3] | state_xbus_hw_idct_run[4] | 
      state_xbus_hw_idct_run[2];
      coef_block_bridge0_rtl_a_sel_0 = state_xbus_hw_idct_run[7] | 
      state_xbus_hw_idct_run[5];
      add_ln277_0_1_1_sel = state_xbus_hw_idct_run[3] | 
      state_xbus_hw_idct_run[9] | state_xbus_hw_idct_run[8] | 
      state_xbus_hw_idct_run[7] | state_xbus_hw_idct_run[6] | 
      state_xbus_hw_idct_run[5] | state_xbus_hw_idct_run[4] | 
      state_xbus_hw_idct_run[2];
      add_ln277_0_1_sel = state_xbus_hw_idct_run[3] | state_xbus_hw_idct_run[12] | 
      state_xbus_hw_idct_run[9] | state_xbus_hw_idct_run[8] | 
      state_xbus_hw_idct_run[7] | state_xbus_hw_idct_run[6] | 
      state_xbus_hw_idct_run[5] | state_xbus_hw_idct_run[4] | 
      state_xbus_hw_idct_run[13] | state_xbus_hw_idct_run[2];
      add_ln277_1_sel = state_xbus_hw_idct_run[6] | state_xbus_hw_idct_run[2];
      add_ln277_1_sel_0 = state_xbus_hw_idct_run[22] | state_xbus_hw_idct_run[9] | 
      state_xbus_hw_idct_run[7];
      add_ln278_0_1_2_mux_0_sel = state_xbus_hw_idct_run[24] | 
      state_xbus_hw_idct_run[10] | state_xbus_hw_idct_run[9];
      add_ln278_0_1_sel = state_xbus_hw_idct_run[10] | state_xbus_hw_idct_run[9];
      add_ln279_0_1_sel = state_xbus_hw_idct_run[3] | state_xbus_hw_idct_run[11] | 
      state_xbus_hw_idct_run[10] | state_xbus_hw_idct_run[9] | 
      state_xbus_hw_idct_run[8] | state_xbus_hw_idct_run[7] | 
      state_xbus_hw_idct_run[6] | state_xbus_hw_idct_run[5] | 
      state_xbus_hw_idct_run[4] | state_xbus_hw_idct_run[2];
      coef_block_bridge0_rtl_a_sel = state_xbus_hw_idct_run[3] | 
      state_xbus_hw_idct_run[2];
      coef_block_bridge0_rtl_a_sel_1 = state_xbus_hw_idct_run[8] | 
      state_xbus_hw_idct_run[6];
      memwrite_xbus_hw_idct_coef_block_ln76_en = 
      read_xbus_hw_idct_read_ln65_Z_0_tag_0 & Wait_ln70_q;
      ctrlAnd_1_ln219_z = gt_ln219_q & state_xbus_hw_idct_run[15];
      ctrlAnd_1_ln295_z = add_ln285_1_q[4] & state_xbus_hw_idct_run[31];
      mul_ln257_13_mux_0_sel = state_xbus_hw_idct_run[25] | 
      state_xbus_hw_idct_run[24] | state_xbus_hw_idct_run[22] | 
      state_xbus_hw_idct_run[28] | state_xbus_hw_idct_run[27] | 
      state_xbus_hw_idct_run[26] | state_xbus_hw_idct_run[7] | 
      state_xbus_hw_idct_run[6];
      mul_ln257_21_mux_0_sel = state_xbus_hw_idct_run[22] | 
      state_xbus_hw_idct_run[7] | state_xbus_hw_idct_run[6];
      mul_ln257_9_mux_0_sel = state_xbus_hw_idct_run[25] | 
      state_xbus_hw_idct_run[24] | state_xbus_hw_idct_run[22] | 
      state_xbus_hw_idct_run[27] | state_xbus_hw_idct_run[26] | 
      state_xbus_hw_idct_run[7] | state_xbus_hw_idct_run[6];
      mul_ln257_sel = state_xbus_hw_idct_run[22] | state_xbus_hw_idct_run[21] | 
      state_xbus_hw_idct_run[7] | state_xbus_hw_idct_run[6];
      mul_ln258_12_mux_0_sel = state_xbus_hw_idct_run[25] | 
      state_xbus_hw_idct_run[24] | state_xbus_hw_idct_run[22] | 
      state_xbus_hw_idct_run[7];
      mul_ln258_15_mux_0_sel = state_xbus_hw_idct_run[25] | 
      state_xbus_hw_idct_run[24] | state_xbus_hw_idct_run[7];
      mul_ln258_20_mux_0_sel = state_xbus_hw_idct_run[25] | 
      state_xbus_hw_idct_run[24] | state_xbus_hw_idct_run[26] | 
      state_xbus_hw_idct_run[7];
      mul_ln258_28_mux_0_sel = state_xbus_hw_idct_run[25] | 
      state_xbus_hw_idct_run[24] | state_xbus_hw_idct_run[27] | 
      state_xbus_hw_idct_run[26] | state_xbus_hw_idct_run[7];
      mul_ln258_5_mux_0_sel = state_xbus_hw_idct_run[25] | 
      state_xbus_hw_idct_run[24] | state_xbus_hw_idct_run[22] | 
      state_xbus_hw_idct_run[29] | state_xbus_hw_idct_run[28] | 
      state_xbus_hw_idct_run[27] | state_xbus_hw_idct_run[26] | 
      state_xbus_hw_idct_run[7];
      mul_ln259_25_mux_0_sel = state_xbus_hw_idct_run[12] | 
      state_xbus_hw_idct_run[11] | state_xbus_hw_idct_run[10] | 
      state_xbus_hw_idct_run[9];
      mul_ln259_4_mux_0_sel = state_xbus_hw_idct_run[11] | 
      state_xbus_hw_idct_run[10] | state_xbus_hw_idct_run[9];
      mul_ln262_17_mux_0_sel = state_xbus_hw_idct_run[12] | 
      state_xbus_hw_idct_run[11] | state_xbus_hw_idct_run[10] | 
      state_xbus_hw_idct_run[9] | state_xbus_hw_idct_run[13];
      mul_ln263_10_sel = state_xbus_hw_idct_run[3] | state_xbus_hw_idct_run[6] | 
      state_xbus_hw_idct_run[4] | state_xbus_hw_idct_run[2];
      mul_ln263_11_mux_0_sel = state_xbus_hw_idct_run[12] | 
      state_xbus_hw_idct_run[11] | state_xbus_hw_idct_run[10] | 
      state_xbus_hw_idct_run[9] | state_xbus_hw_idct_run[14] | 
      state_xbus_hw_idct_run[13];
      mul_ln263_8_sel = state_xbus_hw_idct_run[25] | state_xbus_hw_idct_run[24] | 
      state_xbus_hw_idct_run[27] | state_xbus_hw_idct_run[26];
      mul_ln263_9_sel = state_xbus_hw_idct_run[25] | state_xbus_hw_idct_run[24] | 
      state_xbus_hw_idct_run[29] | state_xbus_hw_idct_run[28] | 
      state_xbus_hw_idct_run[27] | state_xbus_hw_idct_run[26];
      mul_ln304_mux_0_sel = state_xbus_hw_idct_run[22] | 
      state_xbus_hw_idct_run[21] | state_xbus_hw_idct_run[20] | 
      state_xbus_hw_idct_run[19] | state_xbus_hw_idct_run[18] | 
      state_xbus_hw_idct_run[3] | state_xbus_hw_idct_run[12] | 
      state_xbus_hw_idct_run[11] | state_xbus_hw_idct_run[10] | 
      state_xbus_hw_idct_run[9] | state_xbus_hw_idct_run[8] | 
      state_xbus_hw_idct_run[7] | state_xbus_hw_idct_run[6] | 
      state_xbus_hw_idct_run[5] | state_xbus_hw_idct_run[4] | 
      state_xbus_hw_idct_run[14] | state_xbus_hw_idct_run[13] | 
      state_xbus_hw_idct_run[2];
      mul_ln331_2_sel_0 = state_xbus_hw_idct_run[22] | 
      state_xbus_hw_idct_run[21] | state_xbus_hw_idct_run[3] | 
      state_xbus_hw_idct_run[7] | state_xbus_hw_idct_run[6] | 
      state_xbus_hw_idct_run[2];
      mux_ctr_ln219_mux_0_sel = state_xbus_hw_idct_run[3] | 
      state_xbus_hw_idct_run[12] | state_xbus_hw_idct_run[11] | 
      state_xbus_hw_idct_run[10] | state_xbus_hw_idct_run[9] | 
      state_xbus_hw_idct_run[8] | state_xbus_hw_idct_run[7] | 
      state_xbus_hw_idct_run[6] | state_xbus_hw_idct_run[5] | 
      state_xbus_hw_idct_run[4] | state_xbus_hw_idct_run[14] | 
      state_xbus_hw_idct_run[13] | state_xbus_hw_idct_run[2];
      mux_inptr_ln219_1_sel = state_xbus_hw_idct_run[25] | 
      state_xbus_hw_idct_run[24] | state_xbus_hw_idct_run[23] | 
      state_xbus_hw_idct_run[22] | state_xbus_hw_idct_run[21] | 
      state_xbus_hw_idct_run[20] | state_xbus_hw_idct_run[19] | 
      state_xbus_hw_idct_run[18] | state_xbus_hw_idct_run[17] | 
      state_xbus_hw_idct_run[29] | state_xbus_hw_idct_run[28] | 
      state_xbus_hw_idct_run[27] | state_xbus_hw_idct_run[26] | 
      state_xbus_hw_idct_run[16] | state_xbus_hw_idct_run[3] | 
      state_xbus_hw_idct_run[7] | state_xbus_hw_idct_run[6] | 
      state_xbus_hw_idct_run[5] | state_xbus_hw_idct_run[4] | 
      state_xbus_hw_idct_run[2];
      mux_inptr_ln219_2_sel = state_xbus_hw_idct_run[25] | 
      state_xbus_hw_idct_run[24] | state_xbus_hw_idct_run[23] | 
      state_xbus_hw_idct_run[22] | state_xbus_hw_idct_run[21] | 
      state_xbus_hw_idct_run[20] | state_xbus_hw_idct_run[19] | 
      state_xbus_hw_idct_run[18] | state_xbus_hw_idct_run[17] | 
      state_xbus_hw_idct_run[30] | state_xbus_hw_idct_run[29] | 
      state_xbus_hw_idct_run[28] | state_xbus_hw_idct_run[27] | 
      state_xbus_hw_idct_run[26] | state_xbus_hw_idct_run[16] | 
      state_xbus_hw_idct_run[3] | state_xbus_hw_idct_run[7] | 
      state_xbus_hw_idct_run[6] | state_xbus_hw_idct_run[5] | 
      state_xbus_hw_idct_run[4] | state_xbus_hw_idct_run[2];
      mux_inptr_ln219_3_sel = state_xbus_hw_idct_run[3] | 
      state_xbus_hw_idct_run[7] | state_xbus_hw_idct_run[6] | 
      state_xbus_hw_idct_run[5] | state_xbus_hw_idct_run[4] | 
      state_xbus_hw_idct_run[2];
      mux_wsptr_ln219_1_mux_0_sel = state_xbus_hw_idct_run[25] | 
      state_xbus_hw_idct_run[24] | state_xbus_hw_idct_run[23] | 
      state_xbus_hw_idct_run[22] | state_xbus_hw_idct_run[21] | 
      state_xbus_hw_idct_run[20] | state_xbus_hw_idct_run[19] | 
      state_xbus_hw_idct_run[18] | state_xbus_hw_idct_run[17] | 
      state_xbus_hw_idct_run[30] | state_xbus_hw_idct_run[29] | 
      state_xbus_hw_idct_run[28] | state_xbus_hw_idct_run[27] | 
      state_xbus_hw_idct_run[26] | state_xbus_hw_idct_run[16] | 
      state_xbus_hw_idct_run[3] | state_xbus_hw_idct_run[12] | 
      state_xbus_hw_idct_run[11] | state_xbus_hw_idct_run[10] | 
      state_xbus_hw_idct_run[9] | state_xbus_hw_idct_run[8] | 
      state_xbus_hw_idct_run[7] | state_xbus_hw_idct_run[6] | 
      state_xbus_hw_idct_run[5] | state_xbus_hw_idct_run[4] | 
      state_xbus_hw_idct_run[14] | state_xbus_hw_idct_run[13] | 
      state_xbus_hw_idct_run[2];
      mux_wsptr_ln219_2_sel = state_xbus_hw_idct_run[25] | 
      state_xbus_hw_idct_run[24] | state_xbus_hw_idct_run[23] | 
      state_xbus_hw_idct_run[22] | state_xbus_hw_idct_run[21] | 
      state_xbus_hw_idct_run[20] | state_xbus_hw_idct_run[19] | 
      state_xbus_hw_idct_run[18] | state_xbus_hw_idct_run[17] | 
      state_xbus_hw_idct_run[29] | state_xbus_hw_idct_run[28] | 
      state_xbus_hw_idct_run[27] | state_xbus_hw_idct_run[26] | 
      state_xbus_hw_idct_run[16] | state_xbus_hw_idct_run[3] | 
      state_xbus_hw_idct_run[12] | state_xbus_hw_idct_run[11] | 
      state_xbus_hw_idct_run[10] | state_xbus_hw_idct_run[9] | 
      state_xbus_hw_idct_run[8] | state_xbus_hw_idct_run[7] | 
      state_xbus_hw_idct_run[6] | state_xbus_hw_idct_run[5] | 
      state_xbus_hw_idct_run[4] | state_xbus_hw_idct_run[14] | 
      state_xbus_hw_idct_run[13] | state_xbus_hw_idct_run[2];
      output_buf_bridge1_rtl_CE_en = state_xbus_hw_idct_run[25] | 
      state_xbus_hw_idct_run[24] | state_xbus_hw_idct_run[23] | 
      state_xbus_hw_idct_run[30] | state_xbus_hw_idct_run[29] | 
      state_xbus_hw_idct_run[28] | state_xbus_hw_idct_run[27] | 
      state_xbus_hw_idct_run[26];
      case (1'b1)// pragma parallel_case
        state_xbus_hw_idct_run[23]: output_buf_bridge1_rtl_a = {
          mux_inptr_ln219_q[1], mux_wsptr_ln219_q[2:1], 3'h3};
        state_xbus_hw_idct_run[24]: output_buf_bridge1_rtl_a = {
          mux_inptr_ln219_q[1], mux_wsptr_ln219_q[2:1], 3'h0};
        state_xbus_hw_idct_run[25]: output_buf_bridge1_rtl_a = {
          mux_inptr_ln219_q[1], mux_wsptr_ln219_q[2:1], 3'h7};
        state_xbus_hw_idct_run[26]: output_buf_bridge1_rtl_a = {
          mux_inptr_ln219_q[1], mux_wsptr_ln219_q[2:1], 3'h1};
        state_xbus_hw_idct_run[27]: output_buf_bridge1_rtl_a = {
          mux_inptr_ln219_q[1], mux_wsptr_ln219_q[2:1], 3'h6};
        state_xbus_hw_idct_run[28]: output_buf_bridge1_rtl_a = {
          mux_inptr_ln219_q[1], mux_wsptr_ln219_q[2:1], 3'h2};
        state_xbus_hw_idct_run[29]: output_buf_bridge1_rtl_a = {
          mux_inptr_ln219_q[1], mux_wsptr_ln219_q[2:1], 3'h5};
        state_xbus_hw_idct_run[30]: output_buf_bridge1_rtl_a = {
          mux_inptr_ln219_q[1], mux_wsptr_ln219_q[2:1], 3'h4};
        default: output_buf_bridge1_rtl_a = 6'hX;
      endcase
      workspace_bridge0_rtl_CE_en = state_xbus_hw_idct_run[23] | 
      state_xbus_hw_idct_run[22] | state_xbus_hw_idct_run[21] | 
      state_xbus_hw_idct_run[20] | state_xbus_hw_idct_run[19] | 
      state_xbus_hw_idct_run[18] | state_xbus_hw_idct_run[17] | 
      state_xbus_hw_idct_run[16];
      case (1'b1)// pragma parallel_case
        state_xbus_hw_idct_run[16]: workspace_bridge0_rtl_a = {add_ln247_2_q, 
          add_ln246_1_q, mux_inptr_ln219_q[2], 3'h2};
        state_xbus_hw_idct_run[17]: workspace_bridge0_rtl_a = {add_ln247_2_q, 
          add_ln246_1_q, mux_inptr_ln219_q[2], 3'h6};
        state_xbus_hw_idct_run[18]: workspace_bridge0_rtl_a = {add_ln247_2_q, 
          add_ln246_1_q, mux_inptr_ln219_q[2], 3'h0};
        state_xbus_hw_idct_run[19]: workspace_bridge0_rtl_a = {add_ln247_2_q, 
          add_ln246_1_q, mux_inptr_ln219_q[2], 3'h4};
        state_xbus_hw_idct_run[20]: workspace_bridge0_rtl_a = {add_ln247_2_q, 
          add_ln246_1_q, mux_inptr_ln219_q[2], 3'h7};
        state_xbus_hw_idct_run[21]: workspace_bridge0_rtl_a = {add_ln247_2_q, 
          add_ln246_1_q, mux_inptr_ln219_q[2], 3'h5};
        state_xbus_hw_idct_run[22]: workspace_bridge0_rtl_a = {add_ln247_2_q, 
          add_ln246_1_q, mux_inptr_ln219_q[2], 3'h3};
        state_xbus_hw_idct_run[23]: workspace_bridge0_rtl_a = {add_ln247_2_q, 
          add_ln246_1_q, mux_inptr_ln219_q[2], 3'h1};
        default: workspace_bridge0_rtl_a = 6'hX;
      endcase
      workspace_bridge1_rtl_CE_en = state_xbus_hw_idct_run[12] | 
      state_xbus_hw_idct_run[11] | state_xbus_hw_idct_run[10] | 
      state_xbus_hw_idct_run[9] | state_xbus_hw_idct_run[8] | 
      state_xbus_hw_idct_run[15] | state_xbus_hw_idct_run[14] | 
      state_xbus_hw_idct_run[13];
      workspace_bridge1_rtl_a_sel = state_xbus_hw_idct_run[11] | 
      state_xbus_hw_idct_run[14];
      workspace_bridge1_rtl_a_sel_0 = state_xbus_hw_idct_run[12] | 
      state_xbus_hw_idct_run[13];
      ctrlAnd_0_ln295_z = !add_ln285_1_q[4] & state_xbus_hw_idct_run[31];
      ctrlAnd_0_ln219_z = !gt_ln219_q & state_xbus_hw_idct_run[15];
      ctrlOr_ln89_z = ctrlAnd_1_ln295_z | state_xbus_hw_idct_run[0];
      if (state_xbus_hw_idct_run[1]) 
        mux_ctr_ln219_z = 3'h0;
      else 
        mux_ctr_ln219_z = {add_ln305_q[5:4], !mux_ctr_ln219_q};
      if (state_xbus_hw_idct_run[15]) 
        mux_ctr_ln295_z = 3'h0;
      else 
        mux_ctr_ln295_z = {add_ln285_1_q[3:2], !mux_wsptr_ln219_q[1]};
      if (state_xbus_hw_idct_run[1]) 
        mux_inptr_ln219_z = 6'h0;
      else 
        mux_inptr_ln219_z = {add_ln285_1_q, !mux_inptr_ln219_q[0]};
      if (state_xbus_hw_idct_run[15]) 
        mux_wsptr_ln295_z = 3'h0;
      else 
        mux_wsptr_ln295_z = {add_ln285_1_q[1:0], !mux_inptr_ln219_q[2]};
      if (state_xbus_hw_idct_run[1]) 
        mux_wsptr_ln219_z = 6'h0;
      else 
        mux_wsptr_ln219_z = {add_ln305_q[3:0], mul_ln304_q, !mux_wsptr_ln219_q[0]};
      case (1'b1)// pragma parallel_case
        state_xbus_hw_idct_run[8]: workspace_bridge1_rtl_a = {!add_ln277_0_1_q[1], 
          add_ln277_0_1_q[0], !mux_wsptr_ln219_q[3], mux_wsptr_ln219_q[2:0]};
        state_xbus_hw_idct_run[9]: workspace_bridge1_rtl_a = mux_wsptr_ln219_q;
        state_xbus_hw_idct_run[10]: workspace_bridge1_rtl_a = {add_ln277_0_1_q, 
          !mux_wsptr_ln219_q[3], mux_wsptr_ln219_q[2:0]};
        workspace_bridge1_rtl_a_sel: workspace_bridge1_rtl_a = {add_ln278_1_2_q, 
          add_ln277_0_1_q[0], !mux_wsptr_ln219_q[3], mux_wsptr_ln219_q[2:0]};
        workspace_bridge1_rtl_a_sel_0: workspace_bridge1_rtl_a = {
          add_ln279_0_1_q, !mux_wsptr_ln219_q[4], mux_wsptr_ln219_q[3:0]};
        state_xbus_hw_idct_run[15]: workspace_bridge1_rtl_a = {!
          mux_wsptr_ln219_q[5], mux_wsptr_ln219_q[4:0]};
        default: workspace_bridge1_rtl_a = 6'hX;
      endcase
      ctrlOr_ln295_z = ctrlAnd_0_ln295_z | ctrlAnd_1_ln219_z;
      bus_if_CtoS_func_start = ctrlOr_ln89_z;
      sub_ln219_z = mux_ctr_ln219_z - 3'h1;
      add_ln295_z = {1'b0, mux_ctr_ln295_z} + 4'h1;
      add_ln249_z = mux_inptr_ln219_z[5:3] + 3'h1;
      add_ln285_z = mux_inptr_ln219_z + 6'h1;
      add_ln225_z = mux_inptr_ln219_z[5:4] + 3'h3;
      add_ln248_z = mux_inptr_ln219_z[5:3] + 3'h3;
      add_ln247_z = mux_inptr_ln219_z[5:3] + 4'h5;
      add_ln246_z = mux_inptr_ln219_z[5:3] + 4'h7;
      case (1'b1)// pragma parallel_case
        Pass1_for_begin_or_0: coef_block_bridge0_rtl_a = mux_inptr_ln219_z;
        coef_block_bridge0_rtl_a_sel: coef_block_bridge0_rtl_a = {mul_ln263_q[8], 
          !mul_ln263_q[6], mux_inptr_ln219_q};
        state_xbus_hw_idct_run[4]: coef_block_bridge0_rtl_a = {!mul_ln263_q[7], 
          mul_ln263_q[6], mux_inptr_ln219_q};
        coef_block_bridge0_rtl_a_sel_0: coef_block_bridge0_rtl_a = {mul_ln263_q[
          10], add_ln246_1_q, !mux_inptr_ln219_q[3], mux_inptr_ln219_q[2:0]};
        coef_block_bridge0_rtl_a_sel_1: coef_block_bridge0_rtl_a = {
          add_ln247_2_q, add_ln246_1_q, !mux_inptr_ln219_q[3], mux_inptr_ln219_q
          [2:0]};
        default: coef_block_bridge0_rtl_a = 6'hX;
      endcase
      xor_ln232_z = ~mux_inptr_ln219_z[5];
      add_ln224_z = mux_inptr_ln219_z[5:4] + 2'h1;
      add_ln374_z = mux_wsptr_ln295_z + 3'h1;
      add_ln278_1_z = mux_wsptr_ln219_z[5:3] + 3'h1;
      add_ln286_z = mux_wsptr_ln219_z + 6'h1;
      add_ln279_0_z = mux_wsptr_ln219_z[5:4] + 3'h3;
      add_ln282_1_z = mux_wsptr_ln219_z[5:3] + 3'h3;
      add_ln281_0_z = mux_wsptr_ln219_z[5:3] + 4'h5;
      add_ln277_0_z = mux_wsptr_ln219_z[5:3] + 4'h7;
      xor_ln283_0_z = ~mux_wsptr_ln219_z[5];
      add_ln280_1_z = mux_wsptr_ln219_z[5:4] + 2'h1;
      ctrlAnd_bus_if_funcCallFork_ln90_1_z = !bus_if_CtoS_func_done & 
      state_xbus_hw_idct_run[1];
      ctrlAnd_bus_if_funcCallFork_ln90_0_z = bus_if_CtoS_func_done & 
      state_xbus_hw_idct_run[1];
      gt_ln219_z = sub_ln219_z == 3'h0;
      ctrlOr_bus_if_funcCallJoin_ln90_z = ctrlAnd_bus_if_funcCallFork_ln90_1_z | 
      ctrlOr_ln89_z;
      ctrlOr_ln219_z = ctrlAnd_0_ln219_z | ctrlAnd_bus_if_funcCallFork_ln90_0_z;
      add_ln304_z = {add_ln228_q[29], add_ln228_q[29:13], sub_ln240_q[12:9]} + {
      workspace_bridge0_rtl_Q[20], workspace_bridge0_rtl_Q};
      add_ln325_z = {add_ln228_q[29], add_ln228_q[29:13], sub_ln240_q[12:9]} + {
      workspace_bridge0_rtl_Q[20], workspace_bridge0_rtl_Q};
      add_ln326_z = {add_ln277_1_q[2], add_ln277_1_q, mul_ln257_q[26:9]} + {
      workspace_bridge0_rtl_Q[20], workspace_bridge0_rtl_Q};
      add_ln327_z = {add_ln228_q[29], add_ln228_q[29:13], sub_ln240_q[12:9]} + {
      workspace_bridge0_rtl_Q[20], workspace_bridge0_rtl_Q};
      add_ln328_z = {add_ln277_1_q[2], add_ln277_1_q, mul_ln257_q[26:9]} + {
      workspace_bridge0_rtl_Q[20], workspace_bridge0_rtl_Q};
      mul_ln331_z = $signed(workspace_bridge0_rtl_Q) * 21'sh4c7;
      mul_ln334_z = $signed(workspace_bridge0_rtl_Q) * 21'sh300b;
      mul_ln332_z = $signed(workspace_bridge0_rtl_Q) * 21'sh41b3;
      mul_ln306_z = $signed(workspace_bridge0_rtl_Q) * 21'shc3f;
      mul_ln333_z = $signed(workspace_bridge0_rtl_Q) * 21'sh1895;
      mul_ln305_z = $signed(workspace_bridge0_rtl_Q) * 21'sh1fc4df;
      sub_ln309_z = {add_ln228_q[23:13], sub_ln240_q[12:9]} - 
      workspace_bridge0_rtl_Q[14:0];
      add_ln308_0_z = {add_ln228_q[23:13], sub_ln240_q[12:9]} + 
      workspace_bridge0_rtl_Q[14:0];
      case (1'b1)// pragma parallel_case
        ctrlOr_ln219_z: add_ln277_0_1_1_d = add_ln277_0_z[2];
        add_ln277_0_1_1_sel: add_ln277_0_1_1_d = add_ln277_0_1_q[1];
        default: add_ln277_0_1_1_d = 1'bX;
      endcase
      case (1'b1)// pragma parallel_case
        ctrlOr_ln219_z: add_ln277_0_1_d = {add_ln278_1_z[2], add_ln277_0_z[1]};
        add_ln277_0_1_sel: add_ln277_0_1_d = {add_ln278_1_2_q, add_ln277_0_1_q[0]};
        state_xbus_hw_idct_run[10]: add_ln277_0_1_d = {add_ln278_1_2_q, !
          add_ln277_0_1_q[0]};
        state_xbus_hw_idct_run[11]: add_ln277_0_1_d = {!add_ln278_1_2_q, 
          add_ln277_0_1_q[0]};
        default: add_ln277_0_1_d = 2'hX;
      endcase
      case (1'b1)// pragma parallel_case
        ctrlOr_ln219_z: add_ln279_0_1_d = add_ln279_0_z[1];
        add_ln279_0_1_sel: add_ln279_0_1_d = add_ln279_0_1_q;
        state_xbus_hw_idct_run[12]: add_ln279_0_1_d = !add_ln279_0_1_q;
        default: add_ln279_0_1_d = 1'bX;
      endcase
      coef_block_bridge0_rtl_CE_en = state_xbus_hw_idct_run[3] | 
      state_xbus_hw_idct_run[8] | state_xbus_hw_idct_run[7] | 
      state_xbus_hw_idct_run[6] | state_xbus_hw_idct_run[5] | 
      state_xbus_hw_idct_run[4] | state_xbus_hw_idct_run[2] | ctrlOr_ln219_z;
      mul_ln331_2_sel = state_xbus_hw_idct_run[5] | ctrlOr_ln219_z;
      case (1'b1)// pragma parallel_case
        ctrlOr_ln219_z: mux_ctr_ln219_d_0 = {gt_ln219_z, mux_inptr_ln219_z[0], 
          mux_wsptr_ln219_z[5:3], mux_wsptr_ln219_z[0], mux_ctr_ln219_z[0]};
        mux_ctr_ln219_mux_0_sel: mux_ctr_ln219_d_0 = {gt_ln219_q, 
          mux_inptr_ln219_q[0], mux_wsptr_ln219_q[5:3], mux_wsptr_ln219_q[0], 
          mux_ctr_ln219_q};
        default: mux_ctr_ln219_d_0 = 7'hX;
      endcase
      case (1'b1)// pragma parallel_case
        ctrlOr_ln219_z: mux_inptr_ln219_1_d = mux_inptr_ln219_z[1];
        mux_inptr_ln219_1_sel: mux_inptr_ln219_1_d = mux_inptr_ln219_q[1];
        ctrlOr_ln295_z: mux_inptr_ln219_1_d = mux_ctr_ln295_z[2];
        default: mux_inptr_ln219_1_d = 1'bX;
      endcase
      case (1'b1)// pragma parallel_case
        ctrlOr_ln219_z: mux_inptr_ln219_2_d = mux_inptr_ln219_z[2];
        mux_inptr_ln219_2_sel: mux_inptr_ln219_2_d = mux_inptr_ln219_q[2];
        ctrlOr_ln295_z: mux_inptr_ln219_2_d = mux_wsptr_ln295_z[0];
        default: mux_inptr_ln219_2_d = 1'bX;
      endcase
      case (1'b1)// pragma parallel_case
        ctrlOr_ln219_z: mux_inptr_ln219_3_d = mux_inptr_ln219_z[3];
        mux_inptr_ln219_3_sel: mux_inptr_ln219_3_d = mux_inptr_ln219_q[3];
        default: mux_inptr_ln219_3_d = 1'bX;
      endcase
      case (1'b1)// pragma parallel_case
        ctrlOr_ln219_z: mux_wsptr_ln219_1_d_0 = {add_ln285_z[5:1], 
          mux_wsptr_ln219_z[1]};
        mux_wsptr_ln219_1_mux_0_sel: mux_wsptr_ln219_1_d_0 = {add_ln285_1_q, 
          mux_wsptr_ln219_q[1]};
        ctrlOr_ln295_z: mux_wsptr_ln219_1_d_0 = {add_ln295_z[3:1], add_ln374_z[2:
          1], mux_ctr_ln295_z[0]};
        default: mux_wsptr_ln219_1_d_0 = 6'hX;
      endcase
      case (1'b1)// pragma parallel_case
        ctrlOr_ln219_z: mux_wsptr_ln219_2_d = mux_wsptr_ln219_z[2];
        mux_wsptr_ln219_2_sel: mux_wsptr_ln219_2_d = mux_wsptr_ln219_q[2];
        ctrlOr_ln295_z: mux_wsptr_ln219_2_d = mux_ctr_ln295_z[1];
        default: mux_wsptr_ln219_2_d = 1'bX;
      endcase
      case (1'b1)// pragma parallel_case
        ctrlOr_ln219_z: add_ln246_1_d_0 = {add_ln247_z[2], add_ln246_z[1]};
        add_ln246_1_mux_0_sel: add_ln246_1_d_0 = {add_ln247_2_q, add_ln246_1_q};
        coef_block_bridge0_rtl_a_sel_0: add_ln246_1_d_0 = {add_ln247_2_q, !
          add_ln246_1_q};
        state_xbus_hw_idct_run[6]: add_ln246_1_d_0 = {!add_ln247_2_q, !
          add_ln246_1_q};
        ctrlOr_ln295_z: add_ln246_1_d_0 = mux_wsptr_ln295_z[2:1];
        default: add_ln246_1_d_0 = 2'hX;
      endcase
      memread_xbus_hw_idct_output_buf_ln67_en = if_ln65_z[1] & ctrlAnd_1_ln63_z;
      mul_ln304_z = $signed(add_ln304_z) * 22'sh1151;
      mul_ln335_z = $signed(add_ln325_z) * 22'sh3fe333;
      mul_ln336_z = $signed(add_ln326_z) * 22'sh3fadfd;
      mul_ln337_z = $signed(add_ln327_z) * 22'sh3fc13b;
      mul_ln338_z = $signed(add_ln328_z) * 22'sh3ffce1;
      add_ln329_z = {add_ln278_0_1_q[5], add_ln278_0_1_q, mul_ln258_q[30:15]} + 
      {add_ln328_z[21], add_ln328_z};
      sub_ln314_z = {sub_ln309_z, 13'h0} - {sub_ln240_q[8:0], add_ln305_q[11:6], 
      add_ln228_q[5:0], mul_ln227_q, add_ln305_q[5:0]};
      add_ln313_z = sub_ln309_z + {sub_ln240_q[8:0], add_ln305_q[11:6]};
      sub_ln312_z = {add_ln308_0_z, 13'h0} - {sub_ln238_q[16:2], add_ln229_q[4:0], 
      add_ln228_q[12:6], mul_ln304_q};
      add_ln311_z = add_ln308_0_z + sub_ln238_q[16:2];
      add_ln305_z = mul_ln304_z + mul_ln305_z;
      add_ln306_z = mul_ln304_z[27:1] + {sub_ln238_q[16:2], add_ln229_q[4:0], 
      add_ln228_q[12:6]};
      mul_ln329_z = $signed(add_ln329_z) * 23'sh25a1;
      case (1'b1)// pragma parallel_case
        ctrlOr_ln219_z: mul_ln304_d_0 = {sub_ln219_z[2:1], add_ln286_z[5:1]};
        mul_ln304_mux_0_sel: mul_ln304_d_0 = {add_ln305_q[5:0], mul_ln304_q};
        state_xbus_hw_idct_run[17]: mul_ln304_d_0 = {add_ln305_z[5:0], 
          mul_ln304_z[0]};
        default: mul_ln304_d_0 = 7'hX;
      endcase
      add_ln340_z = {mul_ln263_q[9:0], mul_ln262_q[31:14]} + mul_ln329_z;
      add_ln341_z = mul_ln338_z + mul_ln329_z[27:2];
      add_ln345_z = {mul_ln262_q[13:0], mul_ln259_q[28:15]} + add_ln340_z;
      add_ln343_z = mul_ln335_z + add_ln340_z;
      add_ln346_z = mul_ln335_z + {add_ln341_z, mul_ln329_z[1:0]};
      add_ln344_z = {mul_ln262_q[13:0], mul_ln259_q[28:15]} + {add_ln341_z, 
      mul_ln329_z[1:0]};
      add_ln234_z = {mul_ln331_2_q[15], mul_ln331_2_q} + {
      coef_block_bridge0_rtl_Q[15], coef_block_bridge0_rtl_Q};
      add_ln251_z = {mul_ln331_2_q[15], mul_ln331_2_q} + {
      coef_block_bridge0_rtl_Q[15], coef_block_bridge0_rtl_Q};
      add_ln252_z = {mul_ln332_q[12], mul_ln332_q, add_ln277_1_q} + {
      coef_block_bridge0_rtl_Q[15], coef_block_bridge0_rtl_Q};
      add_ln253_z = {mul_ln331_2_q[15], mul_ln331_2_q} + {
      coef_block_bridge0_rtl_Q[15], coef_block_bridge0_rtl_Q};
      add_ln254_z = {mul_ln332_q[12], mul_ln332_q, add_ln277_1_q} + {
      coef_block_bridge0_rtl_Q[15], coef_block_bridge0_rtl_Q};
      case (1'b1)// pragma parallel_case
        mul_ln331_2_sel: mul_ln331_2_d = coef_block_bridge0_rtl_Q;
        mul_ln331_2_sel_0: mul_ln331_2_d = mul_ln331_2_q;
        state_xbus_hw_idct_run[20]: mul_ln331_2_d = mul_ln331_z[17:2];
        default: mul_ln331_2_d = 16'hX;
      endcase
      mul_ln257_z = $signed(coef_block_bridge0_rtl_Q) * 16'sh4c7;
      mul_ln260_z = $signed(coef_block_bridge0_rtl_Q) * 16'sh300b;
      mul_ln258_z = $signed(coef_block_bridge0_rtl_Q) * 16'sh41b3;
      mul_ln229_z = $signed(coef_block_bridge0_rtl_Q) * 16'shc3f;
      mul_ln259_z = $signed(coef_block_bridge0_rtl_Q) * 16'sh1895;
      mul_ln228_z = $signed(coef_block_bridge0_rtl_Q) * 16'shc4df;
      sub_ln235_z = {mul_ln331_2_q[15], mul_ln331_2_q} - {
      coef_block_bridge0_rtl_Q[15], coef_block_bridge0_rtl_Q};
      add_ln227_z = {mul_ln332_q[12], mul_ln332_q, add_ln277_1_q} + {
      coef_block_bridge0_rtl_Q[15], coef_block_bridge0_rtl_Q};
      add_ln345_0_z = {mul_ln259_q[14:0], mul_ln333_q} + add_ln345_z[27:2];
      add_ln343_0_z = {mul_ln257_q[8:0], mul_ln331_2_q, add_ln228_q[31:30]} + 
      add_ln343_z[27:1];
      add_ln346_0_z = mul_ln334_z + add_ln346_z;
      add_ln344_0_z = {mul_ln258_q[14:0], mul_ln332_q} + add_ln344_z;
      sub_ln238_z = {{2{add_ln234_z[16]}}, add_ln234_z, 13'h0} - {sub_ln238_q[30], 
      sub_ln238_q[30:13], add_ln229_q, mul_ln227_q};
      add_ln237_z = {sub_ln238_q[30], sub_ln238_q[30:13]} + {{2{add_ln234_z[16]}}, 
      add_ln234_z};
      mul_ln261_z = $signed(add_ln251_z) * 17'sh1e333;
      mul_ln262_z = $signed(add_ln252_z) * 17'sh1adfd;
      mul_ln263_z = $signed(add_ln253_z) * 17'sh1c13b;
      mul_ln264_z = $signed(add_ln254_z) * 17'sh1fce1;
      add_ln255_z = {mul_ln333_q[10], mul_ln333_q, add_ln278_0_1_q} + {
      add_ln254_z[16], add_ln254_z};
      case (1'b1)// pragma parallel_case
        state_xbus_hw_idct_run[5]: mul_ln257_d = mul_ln257_z[8:0];
        mul_ln257_sel: mul_ln257_d = mul_ln257_q[8:0];
        state_xbus_hw_idct_run[20]: mul_ln257_d = mul_ln331_z[26:18];
        default: mul_ln257_d = 9'hX;
      endcase
      sub_ln240_z = {{2{sub_ln235_z[16]}}, sub_ln235_z, 13'h0} - add_ln228_q;
      add_ln239_z = add_ln228_q[31:13] + {{2{sub_ln235_z[16]}}, sub_ln235_z};
      mul_ln227_z = $signed(add_ln227_z) * 17'sh1151;
      if (write_xbus_hw_idct_data_out_ln67_en) 
        data_out_d = data_out_bus_if_d;
      else 
        data_out_d = data_out;
      sub_ln358_z = {sub_ln238_q[31:17], add_ln228_q[5:0], mul_ln227_q, 
      add_ln305_q[5:0]} - {add_ln345_0_z, add_ln345_z[1:0]};
      add_ln355_z = {sub_ln238_q[31:17], add_ln228_q[5:0], mul_ln227_q, 
      add_ln305_q[5:0]} + {add_ln345_0_z, add_ln345_z[1:0]};
      sub_ln370_z = {sub_ln238_q[16:0], sub_ln312_q} - {add_ln343_0_z, 
      add_ln343_z[0]};
      add_ln367_z = {sub_ln238_q[16:0], sub_ln312_q} + {add_ln343_0_z, 
      add_ln343_z[0]};
      sub_ln352_z = {add_ln237_q, add_ln229_q, add_ln228_q[12:6], mul_ln304_q} - 
      add_ln346_0_z;
      add_ln349_z = {add_ln237_q, add_ln229_q, add_ln228_q[12:6], mul_ln304_q} + 
      add_ln346_0_z;
      sub_ln364_z = {sub_ln240_q[8:0], add_ln305_q[11:6], sub_ln314_q} - 
      add_ln344_0_z;
      add_ln361_z = {sub_ln240_q[8:0], add_ln305_q[11:6], sub_ln314_q} + 
      add_ln344_0_z;
      case (1'b1)// pragma parallel_case
        state_xbus_hw_idct_run[4]: sub_ln238_2_d_0 = sub_ln238_z[12:2];
        add_ln229_sel: sub_ln238_2_d_0 = sub_ln238_q[12:2];
        state_xbus_hw_idct_run[16]: sub_ln238_2_d_0 = mul_ln306_z[22:12];
        state_xbus_hw_idct_run[17]: sub_ln238_2_d_0 = add_ln306_z[22:12];
        state_xbus_hw_idct_run[19]: sub_ln238_2_d_0 = sub_ln312_z[23:13];
        default: sub_ln238_2_d_0 = 11'hX;
      endcase
      mul_ln255_z = $signed(add_ln255_z) * 18'sh25a1;
      case (1'b1)// pragma parallel_case
        state_xbus_hw_idct_run[4]: sub_ln240_9_d_0 = sub_ln240_z[12:9];
        add_ln228_13_mux_0_sel: sub_ln240_9_d_0 = sub_ln240_q[12:9];
        add_ln228_13_mux_0_sel_0: sub_ln240_9_d_0 = workspace_bridge0_rtl_Q[3:0];
        default: sub_ln240_9_d_0 = 4'hX;
      endcase
      case (1'b1)// pragma parallel_case
        state_xbus_hw_idct_run[4]: add_ln305_6_d_0 = {sub_ln240_z[8:0], 
          add_ln239_z[18:13]};
        add_ln229_sel: add_ln305_6_d_0 = {sub_ln240_q[8:0], add_ln305_q[11:6]};
        state_xbus_hw_idct_run[17]: add_ln305_6_d_0 = add_ln305_z[27:13];
        state_xbus_hw_idct_run[19]: add_ln305_6_d_0 = sub_ln314_z[27:13];
        default: add_ln305_6_d_0 = 15'hX;
      endcase
      case (1'b1)// pragma parallel_case
        state_xbus_hw_idct_run[4]: add_ln237_d = {add_ln239_z[12:0], sub_ln238_z
          [31], sub_ln238_z[1:0], add_ln237_z};
        add_ln229_5_mux_0_sel: add_ln237_d = {sub_ln314_q, sub_ln238_q[31], 
          sub_ln238_q[1:0], sub_ln312_q, add_ln237_q};
        state_xbus_hw_idct_run[19]: add_ln237_d = {sub_ln314_z[12:0], 
          add_ln313_z[14], sub_ln312_z[12:0], add_ln311_z[14:7]};
        default: add_ln237_d = 35'hX;
      endcase
      add_ln228_z = {mul_ln228_z[30], mul_ln228_z} + {{2{mul_ln227_z[29]}}, 
      mul_ln227_z};
      add_ln229_z = {mul_ln227_z[29], mul_ln227_z[29:1]} + {{2{sub_ln238_q[28]}}, 
      sub_ln238_q[28:13], add_ln229_q};
      add_ln358_z = sub_ln358_z[27:17] + 11'h1;
      add_ln355_0_z = add_ln355_z[27:17] + 11'h1;
      add_ln370_z = sub_ln370_z[27:17] + 11'h1;
      add_ln367_0_z = add_ln367_z[27:17] + 11'h1;
      add_ln352_z = sub_ln352_z[27:17] + 11'h1;
      add_ln349_0_z = add_ln349_z[27:17] + 11'h1;
      add_ln364_z = sub_ln364_z[27:17] + 11'h1;
      add_ln361_0_z = add_ln361_z[27:17] + 11'h1;
      add_ln266_z = mul_ln263_q + mul_ln255_z;
      add_ln267_z = mul_ln255_z[31:2] + {{2{mul_ln264_z[27]}}, mul_ln264_z};
      case (1'b1)// pragma parallel_case
        state_xbus_hw_idct_run[3]: add_ln228_24_d_0 = add_ln228_z[29:24];
        state_xbus_hw_idct_run[4]: add_ln228_24_d_0 = sub_ln240_z[29:24];
        add_ln228_13_mux_0_sel: add_ln228_24_d_0 = add_ln228_q[29:24];
        add_ln228_24_mux_0_sel: add_ln228_24_d_0 = workspace_bridge0_rtl_Q[20:15];
        default: add_ln228_24_d_0 = 6'hX;
      endcase
      case (1'b1)// pragma parallel_case
        state_xbus_hw_idct_run[3]: add_ln228_30_d_0 = add_ln228_z[31:30];
        state_xbus_hw_idct_run[4]: add_ln228_30_d_0 = sub_ln240_z[31:30];
        add_ln228_13_mux_0_sel: add_ln228_30_d_0 = add_ln228_q[31:30];
        state_xbus_hw_idct_run[20]: add_ln228_30_d_0 = mul_ln331_z[1:0];
        default: add_ln228_30_d_0 = 2'hX;
      endcase
      case (1'b1)// pragma parallel_case
        state_xbus_hw_idct_run[3]: add_ln228_6_d_0 = add_ln228_z[12:6];
        mul_ln227_mux_0_sel: add_ln228_6_d_0 = add_ln228_q[12:6];
        state_xbus_hw_idct_run[16]: add_ln228_6_d_0 = mul_ln306_z[6:0];
        state_xbus_hw_idct_run[17]: add_ln228_6_d_0 = add_ln306_z[6:0];
        default: add_ln228_6_d_0 = 7'hX;
      endcase
      case (1'b1)// pragma parallel_case
        state_xbus_hw_idct_run[3]: mul_ln227_d_0 = {add_ln228_z[5:0], 
          mul_ln227_z[0]};
        mul_ln227_mux_0_sel: mul_ln227_d_0 = {add_ln228_q[5:0], mul_ln227_q};
        state_xbus_hw_idct_run[17]: mul_ln227_d_0 = add_ln305_z[12:6];
        default: mul_ln227_d_0 = 7'hX;
      endcase
      case (1'b1)// pragma parallel_case
        state_xbus_hw_idct_run[3]: add_ln228_13_d_0 = add_ln228_z[23:13];
        state_xbus_hw_idct_run[4]: add_ln228_13_d_0 = sub_ln240_z[23:13];
        add_ln228_13_mux_0_sel: add_ln228_13_d_0 = add_ln228_q[23:13];
        add_ln228_13_mux_0_sel_0: add_ln228_13_d_0 = workspace_bridge0_rtl_Q[14:
          4];
        default: add_ln228_13_d_0 = 11'hX;
      endcase
      case (1'b1)// pragma parallel_case
        state_xbus_hw_idct_run[2]: add_ln229_d = {mul_ln229_z[15:12], 
          mul_ln229_z[4:0]};
        state_xbus_hw_idct_run[3]: add_ln229_d = {add_ln229_z[15:12], 
          add_ln229_z[4:0]};
        state_xbus_hw_idct_run[4]: add_ln229_d = {sub_ln238_z[16:13], 
          add_ln229_q[4:0]};
        add_ln229_sel: add_ln229_d = {sub_ln238_q[16:13], add_ln229_q[4:0]};
        state_xbus_hw_idct_run[16]: add_ln229_d = {mul_ln306_z[26:23], 
          mul_ln306_z[11:7]};
        state_xbus_hw_idct_run[17]: add_ln229_d = {add_ln306_z[26:23], 
          add_ln306_z[11:7]};
        state_xbus_hw_idct_run[19]: add_ln229_d = {sub_ln312_z[27:24], 
          add_ln229_q[4:0]};
        default: add_ln229_d = 9'hX;
      endcase
      case (1'b1)// pragma parallel_case
        state_xbus_hw_idct_run[3]: sub_ln238_29_d_0 = add_ln229_z[29:28];
        state_xbus_hw_idct_run[4]: sub_ln238_29_d_0 = sub_ln238_z[30:29];
        add_ln229_5_mux_0_sel: sub_ln238_29_d_0 = sub_ln238_q[30:29];
        state_xbus_hw_idct_run[19]: sub_ln238_29_d_0 = add_ln313_z[13:12];
        default: sub_ln238_29_d_0 = 2'hX;
      endcase
      case (1'b1)// pragma parallel_case
        state_xbus_hw_idct_run[2]: add_ln229_5_d_0 = {mul_ln229_z[27:16], 
          mul_ln229_z[11:5]};
        state_xbus_hw_idct_run[3]: add_ln229_5_d_0 = {add_ln229_z[27:16], 
          add_ln229_z[11:5]};
        state_xbus_hw_idct_run[4]: add_ln229_5_d_0 = {sub_ln238_z[28:17], 
          add_ln229_q[11:5]};
        add_ln229_5_mux_0_sel: add_ln229_5_d_0 = {sub_ln238_q[28:17], 
          add_ln229_q[11:5]};
        state_xbus_hw_idct_run[19]: add_ln229_5_d_0 = {add_ln313_z[11:0], 
          add_ln311_z[6:0]};
        default: add_ln229_5_d_0 = 19'hX;
      endcase
      add_ln271_z = mul_ln262_q + add_ln266_z;
      add_ln269_z = add_ln266_z + {mul_ln261_z[30], mul_ln261_z};
      add_ln272_z = {add_ln267_z, mul_ln255_z[1:0]} + {mul_ln261_z[30], 
      mul_ln261_z};
      add_ln270_z = mul_ln262_q + {add_ln267_z, mul_ln255_z[1:0]};
      case (1'b1)// pragma parallel_case
        state_xbus_hw_idct_run[6]: mul_ln258_12_d_0 = mul_ln258_z[14:12];
        mul_ln258_12_mux_0_sel: mul_ln258_12_d_0 = mul_ln258_q[14:12];
        state_xbus_hw_idct_run[21]: mul_ln258_12_d_0 = mul_ln332_z[27:25];
        state_xbus_hw_idct_run[23]: mul_ln258_12_d_0 = range_limit_ln355_z[2:0];
        default: mul_ln258_12_d_0 = 3'hX;
      endcase
      case (1'b1)// pragma parallel_case
        state_xbus_hw_idct_run[6]: mul_ln258_5_d_0 = mul_ln258_z[11:5];
        mul_ln258_5_mux_0_sel: mul_ln258_5_d_0 = mul_ln258_q[11:5];
        state_xbus_hw_idct_run[21]: mul_ln258_5_d_0 = mul_ln332_z[24:18];
        state_xbus_hw_idct_run[23]: mul_ln258_5_d_0 = range_limit_ln370_z[7:1];
        default: mul_ln258_5_d_0 = 7'hX;
      endcase
      case (1'b1)// pragma parallel_case
        state_xbus_hw_idct_run[23]: output_buf_bridge1_rtl_d = 
          range_limit_ln367_z;
        state_xbus_hw_idct_run[24]: output_buf_bridge1_rtl_d = {add_ln278_0_1_q[
          1:0], mul_ln257_q[26:21]};
        state_xbus_hw_idct_run[25]: output_buf_bridge1_rtl_d = {mul_ln333_q[3:0], 
          add_ln278_0_1_q[5:2]};
        state_xbus_hw_idct_run[26]: output_buf_bridge1_rtl_d = mul_ln258_q[19:12];
        state_xbus_hw_idct_run[27]: output_buf_bridge1_rtl_d = mul_ln258_q[27:20];
        state_xbus_hw_idct_run[28]: output_buf_bridge1_rtl_d = {mul_ln257_q[12:9], 
          mul_ln263_q[8], mul_ln258_q[30:28]};
        state_xbus_hw_idct_run[29]: output_buf_bridge1_rtl_d = mul_ln257_q[20:13];
        state_xbus_hw_idct_run[30]: output_buf_bridge1_rtl_d = {mul_ln258_q[11:5], 
          mul_ln263_q[9]};
        default: output_buf_bridge1_rtl_d = 8'hX;
      endcase
      case (1'b1)// pragma parallel_case
        state_xbus_hw_idct_run[5]: mul_ln257_21_d_0 = mul_ln257_z[26:21];
        mul_ln257_21_mux_0_sel: mul_ln257_21_d_0 = mul_ln257_q[26:21];
        state_xbus_hw_idct_run[21]: mul_ln257_21_d_0 = workspace_bridge0_rtl_Q[
          17:12];
        state_xbus_hw_idct_run[23]: mul_ln257_21_d_0 = range_limit_ln349_z[5:0];
        default: mul_ln257_21_d_0 = 6'hX;
      endcase
      case (1'b1)// pragma parallel_case
        state_xbus_hw_idct_run[5]: mul_ln257_13_d_0 = mul_ln257_z[20:13];
        mul_ln257_13_mux_0_sel: mul_ln257_13_d_0 = mul_ln257_q[20:13];
        state_xbus_hw_idct_run[21]: mul_ln257_13_d_0 = workspace_bridge0_rtl_Q[
          11:4];
        state_xbus_hw_idct_run[23]: mul_ln257_13_d_0 = range_limit_ln364_z;
        default: mul_ln257_13_d_0 = 8'hX;
      endcase
      case (1'b1)// pragma parallel_case
        state_xbus_hw_idct_run[5]: mul_ln257_9_d_0 = mul_ln257_z[12:9];
        mul_ln257_9_mux_0_sel: mul_ln257_9_d_0 = mul_ln257_q[12:9];
        state_xbus_hw_idct_run[21]: mul_ln257_9_d_0 = workspace_bridge0_rtl_Q[3:
          0];
        state_xbus_hw_idct_run[23]: mul_ln257_9_d_0 = range_limit_ln361_z[7:4];
        default: mul_ln257_9_d_0 = 4'hX;
      endcase
      add_ln271_0_z = add_ln271_z[31:2] + {mul_ln259_q[28], mul_ln259_q};
      add_ln269_0_z = add_ln269_z[31:1] + {{4{mul_ln257_q[26]}}, mul_ln257_q};
      add_ln272_0_z = add_ln272_z + {{2{mul_ln260_z[29]}}, mul_ln260_z};
      add_ln270_0_z = add_ln270_z + {mul_ln258_q[30], mul_ln258_q};
      sub_ln279_z = {add_ln305_q[11:6], sub_ln314_q, add_ln228_q[12:0]} - {
      add_ln271_0_z, add_ln271_z[1:0]};
      add_ln278_z = {add_ln305_q[11:6], sub_ln314_q, add_ln228_q[12:0]} + {
      add_ln271_0_z, add_ln271_z[1:0]};
      sub_ln283_z = sub_ln238_q - {add_ln269_0_z, add_ln269_z[0]};
      add_ln282_z = sub_ln238_q + {add_ln269_0_z, add_ln269_z[0]};
      sub_ln277_z = {sub_ln312_q, add_ln237_q, add_ln229_q, mul_ln227_q} - 
      add_ln272_0_z;
      add_ln276_z = {sub_ln312_q, add_ln237_q, add_ln229_q, mul_ln227_q} + 
      add_ln272_0_z;
      sub_ln281_z = {add_ln228_q[31:13], sub_ln240_q} - add_ln270_0_z;
      add_ln280_z = {add_ln228_q[31:13], sub_ln240_q} + add_ln270_0_z;
      add_ln279_z = sub_ln279_z[31:10] + 22'h1;
      add_ln278_0_z = add_ln278_z[31:10] + 22'h1;
      add_ln283_z = sub_ln283_z[31:10] + 22'h1;
      add_ln282_0_z = add_ln282_z[31:10] + 22'h1;
      add_ln277_z = sub_ln277_z[31:10] + 22'h1;
      add_ln276_0_z = add_ln276_z[31:10] + 22'h1;
      add_ln281_z = sub_ln281_z[31:10] + 22'h1;
      add_ln280_0_z = add_ln280_z[31:10] + 22'h1;
      case (1'b1)// pragma parallel_case
        state_xbus_hw_idct_run[7]: mul_ln259_4_d_0 = mul_ln259_z[24:4];
        state_xbus_hw_idct_run[8]: mul_ln259_4_d_0 = add_ln279_z[21:1];
        mul_ln259_4_mux_0_sel: mul_ln259_4_d_0 = mul_ln259_q[24:4];
        state_xbus_hw_idct_run[22]: mul_ln259_4_d_0 = {mul_ln336_z[9:0], 
          mul_ln333_z[25:15]};
        default: mul_ln259_4_d_0 = 21'hX;
      endcase
      case (1'b1)// pragma parallel_case
        state_xbus_hw_idct_run[7]: add_ln278_0_1_d = add_ln253_z[1:0];
        state_xbus_hw_idct_run[8]: add_ln278_0_1_d = add_ln278_0_z[2:1];
        add_ln278_0_1_sel: add_ln278_0_1_d = add_ln278_0_1_q[1:0];
        state_xbus_hw_idct_run[22]: add_ln278_0_1_d = add_ln327_z[17:16];
        state_xbus_hw_idct_run[23]: add_ln278_0_1_d = range_limit_ln349_z[7:6];
        default: add_ln278_0_1_d = 2'hX;
      endcase
      case (1'b1)// pragma parallel_case
        state_xbus_hw_idct_run[7]: mul_ln333_4_d_0 = {mul_ln259_z[3:0], 
          add_ln253_z[16:10]};
        state_xbus_hw_idct_run[8]: mul_ln333_4_d_0 = add_ln278_0_z[21:11];
        add_ln278_0_1_sel: mul_ln333_4_d_0 = {mul_ln259_q[3:0], mul_ln333_q[10:4]};
        state_xbus_hw_idct_run[22]: mul_ln333_4_d_0 = mul_ln333_z[14:4];
        default: mul_ln333_4_d_0 = 11'hX;
      endcase
      case (1'b1)// pragma parallel_case
        state_xbus_hw_idct_run[7]: add_ln278_0_1_2_d_0 = add_ln253_z[9:2];
        state_xbus_hw_idct_run[8]: add_ln278_0_1_2_d_0 = add_ln278_0_z[10:3];
        add_ln278_0_1_2_mux_0_sel: add_ln278_0_1_2_d_0 = {mul_ln333_q[3:0], 
          add_ln278_0_1_q[5:2]};
        state_xbus_hw_idct_run[22]: add_ln278_0_1_2_d_0 = {mul_ln333_z[3:0], 
          add_ln327_z[21:18]};
        state_xbus_hw_idct_run[23]: add_ln278_0_1_2_d_0 = range_limit_ln352_z;
        default: add_ln278_0_1_2_d_0 = 8'hX;
      endcase
      case (1'b1)// pragma parallel_case
        state_xbus_hw_idct_run[7]: mul_ln263_11_d_0 = mul_ln263_z[31:11];
        state_xbus_hw_idct_run[8]: mul_ln263_11_d_0 = add_ln283_z[21:1];
        mul_ln263_11_mux_0_sel: mul_ln263_11_d_0 = mul_ln263_q[31:11];
        default: mul_ln263_11_d_0 = 21'hX;
      endcase
      case (1'b1)// pragma parallel_case
        state_xbus_hw_idct_run[8]: workspace_bridge1_rtl_d = add_ln282_0_z[21:1];
        state_xbus_hw_idct_run[9]: workspace_bridge1_rtl_d = {mul_ln263_q[10], 
          mul_ln258_q[30:15], mul_ln263_q[9:6]};
        state_xbus_hw_idct_run[10]: workspace_bridge1_rtl_d = {mul_ln258_q[4:0], 
          mul_ln332_q, add_ln277_1_q};
        state_xbus_hw_idct_run[11]: workspace_bridge1_rtl_d = {mul_ln259_q[3:0], 
          mul_ln333_q, add_ln278_0_1_q};
        state_xbus_hw_idct_run[12]: workspace_bridge1_rtl_d = mul_ln259_q[24:4];
        state_xbus_hw_idct_run[13]: workspace_bridge1_rtl_d = {mul_ln262_q[16:0], 
          mul_ln259_q[28:25]};
        state_xbus_hw_idct_run[14]: workspace_bridge1_rtl_d = {mul_ln263_q[5:0], 
          mul_ln262_q[31:17]};
        state_xbus_hw_idct_run[15]: workspace_bridge1_rtl_d = mul_ln263_q[31:11];
        default: workspace_bridge1_rtl_d = 21'hX;
      endcase
      case (1'b1)// pragma parallel_case
        state_xbus_hw_idct_run[6]: mul_ln258_d = mul_ln258_z[4:0];
        add_ln277_1_sel_0: mul_ln258_d = mul_ln258_q[4:0];
        state_xbus_hw_idct_run[8]: mul_ln258_d = add_ln277_z[21:17];
        state_xbus_hw_idct_run[21]: mul_ln258_d = mul_ln332_z[17:13];
        default: mul_ln258_d = 5'hX;
      endcase
      case (1'b1)// pragma parallel_case
        add_ln277_1_sel: add_ln277_1_d = coef_block_bridge0_rtl_Q;
        add_ln277_1_sel_0: add_ln277_1_d = {mul_ln332_q, add_ln277_1_q};
        state_xbus_hw_idct_run[8]: add_ln277_1_d = add_ln277_z[16:1];
        state_xbus_hw_idct_run[21]: add_ln277_1_d = {mul_ln332_z[12:0], 
          workspace_bridge0_rtl_Q[20:18]};
        default: add_ln277_1_d = 16'hX;
      endcase
      case (1'b1)// pragma parallel_case
        state_xbus_hw_idct_run[6]: mul_ln258_20_d_0 = mul_ln258_z[27:20];
        mul_ln258_20_mux_0_sel: mul_ln258_20_d_0 = mul_ln258_q[27:20];
        state_xbus_hw_idct_run[8]: mul_ln258_20_d_0 = add_ln276_0_z[17:10];
        state_xbus_hw_idct_run[22]: mul_ln258_20_d_0 = add_ln327_z[12:5];
        state_xbus_hw_idct_run[23]: mul_ln258_20_d_0 = range_limit_ln358_z;
        default: mul_ln258_20_d_0 = 8'hX;
      endcase
      case (1'b1)// pragma parallel_case
        state_xbus_hw_idct_run[6]: mul_ln258_28_d_0 = mul_ln258_z[30:28];
        mul_ln258_28_mux_0_sel: mul_ln258_28_d_0 = mul_ln258_q[30:28];
        state_xbus_hw_idct_run[8]: mul_ln258_28_d_0 = add_ln276_0_z[20:18];
        state_xbus_hw_idct_run[22]: mul_ln258_28_d_0 = add_ln327_z[15:13];
        state_xbus_hw_idct_run[23]: mul_ln258_28_d_0 = range_limit_ln361_z[2:0];
        default: mul_ln258_28_d_0 = 3'hX;
      endcase
      case (1'b1)// pragma parallel_case
        ctrlOr_ln219_z: mul_ln263_10_d = add_ln246_z[2];
        mul_ln263_10_sel: mul_ln263_10_d = mul_ln263_q[10];
        state_xbus_hw_idct_run[5]: mul_ln263_10_d = !mul_ln263_q[10];
        state_xbus_hw_idct_run[7]: mul_ln263_10_d = mul_ln263_z[10];
        state_xbus_hw_idct_run[8]: mul_ln263_10_d = add_ln276_0_z[21];
        default: mul_ln263_10_d = 1'bX;
      endcase
      case (1'b1)// pragma parallel_case
        ctrlOr_ln219_z: mul_ln263_6_d_0 = mux_inptr_ln219_z[5:4];
        coef_block_bridge0_rtl_a_sel: mul_ln263_6_d_0 = mul_ln263_q[7:6];
        state_xbus_hw_idct_run[7]: mul_ln263_6_d_0 = mul_ln263_z[7:6];
        state_xbus_hw_idct_run[8]: mul_ln263_6_d_0 = add_ln276_0_z[2:1];
        state_xbus_hw_idct_run[22]: mul_ln263_6_d_0 = mul_ln337_z[25:24];
        default: mul_ln263_6_d_0 = 2'hX;
      endcase
      case (1'b1)// pragma parallel_case
        ctrlOr_ln219_z: mul_ln263_8_d = add_ln224_z[1];
        state_xbus_hw_idct_run[2]: mul_ln263_8_d = !mul_ln263_q[8];
        state_xbus_hw_idct_run[7]: mul_ln263_8_d = mul_ln263_z[8];
        state_xbus_hw_idct_run[8]: mul_ln263_8_d = add_ln276_0_z[3];
        state_xbus_hw_idct_run[22]: mul_ln263_8_d = mul_ln337_z[26];
        state_xbus_hw_idct_run[23]: mul_ln263_8_d = range_limit_ln361_z[3];
        mul_ln263_8_sel: mul_ln263_8_d = mul_ln263_q[8];
        default: mul_ln263_8_d = 1'bX;
      endcase
      case (1'b1)// pragma parallel_case
        state_xbus_hw_idct_run[7]: mul_ln263_9_d = mul_ln263_z[9];
        state_xbus_hw_idct_run[8]: mul_ln263_9_d = add_ln276_0_z[4];
        state_xbus_hw_idct_run[22]: mul_ln263_9_d = mul_ln337_z[27];
        state_xbus_hw_idct_run[23]: mul_ln263_9_d = range_limit_ln370_z[0];
        mul_ln263_9_sel: mul_ln263_9_d = mul_ln263_q[9];
        default: mul_ln263_9_d = 1'bX;
      endcase
      case (1'b1)// pragma parallel_case
        state_xbus_hw_idct_run[6]: mul_ln258_15_d_0 = mul_ln258_z[19:15];
        mul_ln258_15_mux_0_sel: mul_ln258_15_d_0 = mul_ln258_q[19:15];
        state_xbus_hw_idct_run[8]: mul_ln258_15_d_0 = add_ln276_0_z[9:5];
        state_xbus_hw_idct_run[22]: mul_ln258_15_d_0 = add_ln327_z[4:0];
        state_xbus_hw_idct_run[23]: mul_ln258_15_d_0 = range_limit_ln355_z[7:3];
        default: mul_ln258_15_d_0 = 5'hX;
      endcase
      case (1'b1)// pragma parallel_case
        state_xbus_hw_idct_run[7]: mul_ln262_17_d_0 = {mul_ln263_z[5:0], 
          mul_ln262_z[31:17]};
        state_xbus_hw_idct_run[8]: mul_ln262_17_d_0 = add_ln281_z[21:1];
        mul_ln262_17_mux_0_sel: mul_ln262_17_d_0 = {mul_ln263_q[5:0], 
          mul_ln262_q[31:17]};
        state_xbus_hw_idct_run[22]: mul_ln262_17_d_0 = mul_ln337_z[23:3];
        default: mul_ln262_17_d_0 = 21'hX;
      endcase
      case (1'b1)// pragma parallel_case
        state_xbus_hw_idct_run[7]: mul_ln259_25_d_0 = {mul_ln262_z[16:0], 
          mul_ln259_z[28:25]};
        state_xbus_hw_idct_run[8]: mul_ln259_25_d_0 = add_ln280_0_z[21:1];
        mul_ln259_25_mux_0_sel: mul_ln259_25_d_0 = {mul_ln262_q[16:0], 
          mul_ln259_q[28:25]};
        state_xbus_hw_idct_run[22]: mul_ln259_25_d_0 = {mul_ln337_z[2:0], 
          mul_ln336_z[27:10]};
        default: mul_ln259_25_d_0 = 21'hX;
      endcase
      case (1'b1)// pragma parallel_case
        state_xbus_hw_idct_run[0]: // Wait_ln88
          state_xbus_hw_idct_run_next[1] = 1'b1;
        state_xbus_hw_idct_run[1]: // bus_if_funcCallState_ln90
          begin
            case (1'b1)// pragma parallel_case
              ctrlOr_ln219_z: state_xbus_hw_idct_run_next[2] = 1'b1;
              ctrlOr_bus_if_funcCallJoin_ln90_z: state_xbus_hw_idct_run_next[1] = 
                1'b1;
              default: state_xbus_hw_idct_run_next = 32'hX;
            endcase
          end
        state_xbus_hw_idct_run[2]: // expand_ln219_0
          state_xbus_hw_idct_run_next[3] = 1'b1;
        state_xbus_hw_idct_run[3]: // expand_ln219
          state_xbus_hw_idct_run_next[4] = 1'b1;
        state_xbus_hw_idct_run[4]: // expand_ln219_1
          state_xbus_hw_idct_run_next[5] = 1'b1;
        state_xbus_hw_idct_run[5]: // expand_ln219_2
          state_xbus_hw_idct_run_next[6] = 1'b1;
        state_xbus_hw_idct_run[6]: // expand_ln219_3
          state_xbus_hw_idct_run_next[7] = 1'b1;
        state_xbus_hw_idct_run[7]: // expand_ln219_4
          state_xbus_hw_idct_run_next[8] = 1'b1;
        state_xbus_hw_idct_run[8]: // expand_ln219_5
          state_xbus_hw_idct_run_next[9] = 1'b1;
        state_xbus_hw_idct_run[9]: // expand_ln219_6
          state_xbus_hw_idct_run_next[10] = 1'b1;
        state_xbus_hw_idct_run[10]: // expand_ln219_7
          state_xbus_hw_idct_run_next[11] = 1'b1;
        state_xbus_hw_idct_run[11]: // expand_ln219_8
          state_xbus_hw_idct_run_next[12] = 1'b1;
        state_xbus_hw_idct_run[12]: // expand_ln219_9
          state_xbus_hw_idct_run_next[13] = 1'b1;
        state_xbus_hw_idct_run[13]: // expand_ln219_10
          state_xbus_hw_idct_run_next[14] = 1'b1;
        state_xbus_hw_idct_run[14]: // expand_ln219_11
          state_xbus_hw_idct_run_next[15] = 1'b1;
        state_xbus_hw_idct_run[15]: // expand_ln219_12
          begin
            case (1'b1)// pragma parallel_case
              ctrlOr_ln219_z: state_xbus_hw_idct_run_next[2] = 1'b1;
              ctrlOr_ln295_z: state_xbus_hw_idct_run_next[16] = 1'b1;
              default: state_xbus_hw_idct_run_next = 32'hX;
            endcase
          end
        state_xbus_hw_idct_run[16]: // expand_ln295_0
          state_xbus_hw_idct_run_next[17] = 1'b1;
        state_xbus_hw_idct_run[17]: // expand_ln295_1
          state_xbus_hw_idct_run_next[18] = 1'b1;
        state_xbus_hw_idct_run[18]: // expand_ln295_2
          state_xbus_hw_idct_run_next[19] = 1'b1;
        state_xbus_hw_idct_run[19]: // expand_ln295_3
          state_xbus_hw_idct_run_next[20] = 1'b1;
        state_xbus_hw_idct_run[20]: // expand_ln295_4
          state_xbus_hw_idct_run_next[21] = 1'b1;
        state_xbus_hw_idct_run[21]: // expand_ln295_5
          state_xbus_hw_idct_run_next[22] = 1'b1;
        state_xbus_hw_idct_run[22]: // expand_ln295_6
          state_xbus_hw_idct_run_next[23] = 1'b1;
        state_xbus_hw_idct_run[23]: // expand_ln295_7
          state_xbus_hw_idct_run_next[24] = 1'b1;
        state_xbus_hw_idct_run[24]: // expand_ln295_8
          state_xbus_hw_idct_run_next[25] = 1'b1;
        state_xbus_hw_idct_run[25]: // expand_ln295_9
          state_xbus_hw_idct_run_next[26] = 1'b1;
        state_xbus_hw_idct_run[26]: // expand_ln295_10
          state_xbus_hw_idct_run_next[27] = 1'b1;
        state_xbus_hw_idct_run[27]: // expand_ln295_11
          state_xbus_hw_idct_run_next[28] = 1'b1;
        state_xbus_hw_idct_run[28]: // expand_ln295_12
          state_xbus_hw_idct_run_next[29] = 1'b1;
        state_xbus_hw_idct_run[29]: // expand_ln295_13
          state_xbus_hw_idct_run_next[30] = 1'b1;
        state_xbus_hw_idct_run[30]: // expand_ln295_14
          state_xbus_hw_idct_run_next[31] = 1'b1;
        state_xbus_hw_idct_run[31]: // expand_ln295
          begin
            case (1'b1)// pragma parallel_case
              ctrlOr_ln295_z: state_xbus_hw_idct_run_next[16] = 1'b1;
              ctrlOr_bus_if_funcCallJoin_ln90_z: state_xbus_hw_idct_run_next[1] = 
                1'b1;
              default: state_xbus_hw_idct_run_next = 32'hX;
            endcase
          end
        default: // Don't care
          state_xbus_hw_idct_run_next = 32'hX;
      endcase
    end
endmodule


module range_limit(ind_in, range_limit_out);
  input [9:0] ind_in;
  output reg signed [7:0] range_limit_out;
  reg lt_ln383_z;
  reg lt_ln385_z;
  reg xor_ln383_z;
  reg [2:0] case_mux_ret_ln384_z;
  reg and_case_mux_ret_ln384_0_z;
  reg or_lt_ln383_Z_0_z;
  reg and_case_mux_ret_ln384_z;
  reg [7:0] mux_ret_ln383_z;

  // lint_checking URAREG OFF
`ifndef SYNTHESIS
  reg CtoS_rtl_range_limit;
`endif
  // lint_checking URAREG ON
  always @(*) begin : range_limit_combinational
      lt_ln383_z = ind_in[9:7] == 3'h0;
      lt_ln385_z = ind_in[8:7] == 2'h3;
      xor_ln383_z = ~ind_in[7];
      case (1'b1)
        !ind_in[9]: case_mux_ret_ln384_z = 3'h1;
        !lt_ln385_z: case_mux_ret_ln384_z = 3'h2;
        default: case_mux_ret_ln384_z = 3'h4;
      endcase
      and_case_mux_ret_ln384_0_z = !lt_ln383_z & case_mux_ret_ln384_z[1];
      or_lt_ln383_Z_0_z = case_mux_ret_ln384_z[2] | lt_ln383_z;
      and_case_mux_ret_ln384_z = !lt_ln383_z & case_mux_ret_ln384_z[0];
      case (1'b1)// pragma parallel_case
        or_lt_ln383_Z_0_z: mux_ret_ln383_z = {xor_ln383_z, ind_in[6:0]};
        and_case_mux_ret_ln384_z: mux_ret_ln383_z = 8'hff;
        and_case_mux_ret_ln384_0_z: mux_ret_ln383_z = 8'h0;
        default: mux_ret_ln383_z = 8'hX;
      endcase
      range_limit_out = mux_ret_ln383_z;
    end
endmodule


module identity_sync_write_64x16m0(rtl_CE, rtl_A, rtl_D, rtl_WE, CLK, mem_CE, mem_A, mem_D, mem_WE);
    input rtl_CE;
    input [5 : 0] rtl_A;
    input [15 : 0] rtl_D;
    input rtl_WE;
    input CLK;
    output mem_CE;
    output [5 : 0] mem_A;
    output [15 : 0] mem_D;
    output mem_WE;

    assign mem_CE = rtl_CE;
    assign mem_A = rtl_A;
    assign mem_D = rtl_D;
    assign mem_WE = rtl_WE;
`ifdef CTOS_SIM_MULTI_LANGUAGE_EXTERNAL_ARRAY
    // This is only required when simulating a multi-language design.
    bit use_dpi;
    wire m_ready;
    initial begin
        use_dpi = 0;

        @(posedge m_ready)
        use_dpi = 1;
    end
    ctos_external_array_accessor #(.ADDR_WIDTH(6), .DATA_WIDTH(16), .TRACE(`CTOS_TRACE_EXT_ARRAY_)) arr_ref(m_ready);

    always @(posedge CLK) begin
        if (use_dpi) begin
            if (rtl_CE && rtl_WE) begin
                arr_ref.write(rtl_A, rtl_D);
            end
        end
    end
`endif
endmodule


module identity_async_read_64x21m0(rtl_CE, rtl_A, mem_Q, CLK, mem_CE, mem_A, rtl_Q);
    input rtl_CE;
    input [5 : 0] rtl_A;
    input [20 : 0] mem_Q;
    input CLK;
    output mem_CE;
    output [5 : 0] mem_A;
    output [20 : 0] rtl_Q;

    assign mem_CE = rtl_CE;
    assign mem_A = rtl_A;
`ifndef CTOS_SIM_MULTI_LANGUAGE_EXTERNAL_ARRAY
    assign rtl_Q = mem_Q;

`else
    // This is only required when simulating a multi-language design.
    reg [20:0] dpi_Q;
    bit use_dpi;
    wire m_ready;
    // Pick which Q drives the RTL Q.
    assign rtl_Q = use_dpi ? dpi_Q : mem_Q;
    initial begin
        use_dpi = 0;

        @(posedge m_ready)
        use_dpi = 1;
    end
    ctos_external_array_accessor #(.ADDR_WIDTH(6), .DATA_WIDTH(21), .TRACE(`CTOS_TRACE_EXT_ARRAY_)) arr_ref(m_ready);

    always @(posedge CLK) begin
        if (use_dpi) begin
            if (rtl_CE) begin
                arr_ref.read(rtl_A, dpi_Q);
            end
        end
    end
`endif
endmodule


module identity_async_read_64x16m0(rtl_CE, rtl_A, mem_Q, CLK, mem_CE, mem_A, rtl_Q);
    input rtl_CE;
    input [5 : 0] rtl_A;
    input [15 : 0] mem_Q;
    input CLK;
    output mem_CE;
    output [5 : 0] mem_A;
    output [15 : 0] rtl_Q;

    assign mem_CE = rtl_CE;
    assign mem_A = rtl_A;
`ifndef CTOS_SIM_MULTI_LANGUAGE_EXTERNAL_ARRAY
    assign rtl_Q = mem_Q;

`else
    // This is only required when simulating a multi-language design.
    reg [15:0] dpi_Q;
    bit use_dpi;
    wire m_ready;
    // Pick which Q drives the RTL Q.
    assign rtl_Q = use_dpi ? dpi_Q : mem_Q;
    initial begin
        use_dpi = 0;

        @(posedge m_ready)
        use_dpi = 1;
    end
    ctos_external_array_accessor #(.ADDR_WIDTH(6), .DATA_WIDTH(16), .TRACE(`CTOS_TRACE_EXT_ARRAY_)) arr_ref(m_ready);

    always @(posedge CLK) begin
        if (use_dpi) begin
            if (rtl_CE) begin
                arr_ref.read(rtl_A, dpi_Q);
            end
        end
    end
`endif
endmodule


module identity_async_read_64x8m0(rtl_CE, rtl_A, mem_Q, CLK, mem_CE, mem_A, rtl_Q);
    input rtl_CE;
    input [5 : 0] rtl_A;
    input [7 : 0] mem_Q;
    input CLK;
    output mem_CE;
    output [5 : 0] mem_A;
    output [7 : 0] rtl_Q;

    assign mem_CE = rtl_CE;
    assign mem_A = rtl_A;
`ifndef CTOS_SIM_MULTI_LANGUAGE_EXTERNAL_ARRAY
    assign rtl_Q = mem_Q;

`else
    // This is only required when simulating a multi-language design.
    reg [7:0] dpi_Q;
    bit use_dpi;
    wire m_ready;
    // Pick which Q drives the RTL Q.
    assign rtl_Q = use_dpi ? dpi_Q : mem_Q;
    initial begin
        use_dpi = 0;

        @(posedge m_ready)
        use_dpi = 1;
    end
    ctos_external_array_accessor #(.ADDR_WIDTH(6), .DATA_WIDTH(8), .TRACE(`CTOS_TRACE_EXT_ARRAY_)) arr_ref(m_ready);

    always @(posedge CLK) begin
        if (use_dpi) begin
            if (rtl_CE) begin
                arr_ref.read(rtl_A, dpi_Q);
            end
        end
    end
`endif
endmodule


module identity_sync_write_64x8m0(rtl_CE, rtl_A, rtl_D, rtl_WE, CLK, mem_CE, mem_A, mem_D, mem_WE);
    input rtl_CE;
    input [5 : 0] rtl_A;
    input [7 : 0] rtl_D;
    input rtl_WE;
    input CLK;
    output mem_CE;
    output [5 : 0] mem_A;
    output [7 : 0] mem_D;
    output mem_WE;

    assign mem_CE = rtl_CE;
    assign mem_A = rtl_A;
    assign mem_D = rtl_D;
    assign mem_WE = rtl_WE;
`ifdef CTOS_SIM_MULTI_LANGUAGE_EXTERNAL_ARRAY
    // This is only required when simulating a multi-language design.
    bit use_dpi;
    wire m_ready;
    initial begin
        use_dpi = 0;

        @(posedge m_ready)
        use_dpi = 1;
    end
    ctos_external_array_accessor #(.ADDR_WIDTH(6), .DATA_WIDTH(8), .TRACE(`CTOS_TRACE_EXT_ARRAY_)) arr_ref(m_ready);

    always @(posedge CLK) begin
        if (use_dpi) begin
            if (rtl_CE && rtl_WE) begin
                arr_ref.write(rtl_A, rtl_D);
            end
        end
    end
`endif
endmodule


module identity_sync_write_64x21m0(rtl_CE, rtl_A, rtl_D, rtl_WE, CLK, mem_CE, mem_A, mem_D, mem_WE);
    input rtl_CE;
    input [5 : 0] rtl_A;
    input [20 : 0] rtl_D;
    input rtl_WE;
    input CLK;
    output mem_CE;
    output [5 : 0] mem_A;
    output [20 : 0] mem_D;
    output mem_WE;

    assign mem_CE = rtl_CE;
    assign mem_A = rtl_A;
    assign mem_D = rtl_D;
    assign mem_WE = rtl_WE;
`ifdef CTOS_SIM_MULTI_LANGUAGE_EXTERNAL_ARRAY
    // This is only required when simulating a multi-language design.
    bit use_dpi;
    wire m_ready;
    initial begin
        use_dpi = 0;

        @(posedge m_ready)
        use_dpi = 1;
    end
    ctos_external_array_accessor #(.ADDR_WIDTH(6), .DATA_WIDTH(21), .TRACE(`CTOS_TRACE_EXT_ARRAY_)) arr_ref(m_ready);

    always @(posedge CLK) begin
        if (use_dpi) begin
            if (rtl_CE && rtl_WE) begin
                arr_ref.write(rtl_A, rtl_D);
            end
        end
    end
`endif
endmodule


module ram_64x16_1ar_1w_r(CLK, RST_N, CE0, A0, CE1, A1, D1, WE1, Q0);
    input CLK;
    input RST_N;
    input CE0;
    input [5 : 0] A0;
    input CE1;
    input [5 : 0] A1;
    input [15 : 0] D1;
    input WE1;
    output [15 : 0] Q0;

    reg [15 : 0] M [0 : 63];

    assign Q0 = {16{CE0}} & M[A0];

    always @(posedge CLK) begin
        if (!RST_N) begin  : reset_block
            M[0] <= 16'h0;
            M[1] <= 16'h0;
            M[2] <= 16'h0;
            M[3] <= 16'h0;
            M[4] <= 16'h0;
            M[5] <= 16'h0;
            M[6] <= 16'h0;
            M[7] <= 16'h0;
            M[8] <= 16'h0;
            M[9] <= 16'h0;
            M[10] <= 16'h0;
            M[11] <= 16'h0;
            M[12] <= 16'h0;
            M[13] <= 16'h0;
            M[14] <= 16'h0;
            M[15] <= 16'h0;
            M[16] <= 16'h0;
            M[17] <= 16'h0;
            M[18] <= 16'h0;
            M[19] <= 16'h0;
            M[20] <= 16'h0;
            M[21] <= 16'h0;
            M[22] <= 16'h0;
            M[23] <= 16'h0;
            M[24] <= 16'h0;
            M[25] <= 16'h0;
            M[26] <= 16'h0;
            M[27] <= 16'h0;
            M[28] <= 16'h0;
            M[29] <= 16'h0;
            M[30] <= 16'h0;
            M[31] <= 16'h0;
            M[32] <= 16'h0;
            M[33] <= 16'h0;
            M[34] <= 16'h0;
            M[35] <= 16'h0;
            M[36] <= 16'h0;
            M[37] <= 16'h0;
            M[38] <= 16'h0;
            M[39] <= 16'h0;
            M[40] <= 16'h0;
            M[41] <= 16'h0;
            M[42] <= 16'h0;
            M[43] <= 16'h0;
            M[44] <= 16'h0;
            M[45] <= 16'h0;
            M[46] <= 16'h0;
            M[47] <= 16'h0;
            M[48] <= 16'h0;
            M[49] <= 16'h0;
            M[50] <= 16'h0;
            M[51] <= 16'h0;
            M[52] <= 16'h0;
            M[53] <= 16'h0;
            M[54] <= 16'h0;
            M[55] <= 16'h0;
            M[56] <= 16'h0;
            M[57] <= 16'h0;
            M[58] <= 16'h0;
            M[59] <= 16'h0;
            M[60] <= 16'h0;
            M[61] <= 16'h0;
            M[62] <= 16'h0;
            M[63] <= 16'h0;
        end
        else begin
                        if (CE1 & WE1)
                M[A1] <= D1;
        end
    end
endmodule

module ram_64x8_1ar_1w_r(CLK, RST_N, CE0, A0, CE1, A1, D1, WE1, Q0);
    input CLK;
    input RST_N;
    input CE0;
    input [5 : 0] A0;
    input CE1;
    input [5 : 0] A1;
    input [7 : 0] D1;
    input WE1;
    output [7 : 0] Q0;

    reg [7 : 0] M [0 : 63];

    assign Q0 = {8{CE0}} & M[A0];

    always @(posedge CLK) begin
        if (!RST_N) begin  : reset_block
            M[0] <= 8'h0;
            M[1] <= 8'h0;
            M[2] <= 8'h0;
            M[3] <= 8'h0;
            M[4] <= 8'h0;
            M[5] <= 8'h0;
            M[6] <= 8'h0;
            M[7] <= 8'h0;
            M[8] <= 8'h0;
            M[9] <= 8'h0;
            M[10] <= 8'h0;
            M[11] <= 8'h0;
            M[12] <= 8'h0;
            M[13] <= 8'h0;
            M[14] <= 8'h0;
            M[15] <= 8'h0;
            M[16] <= 8'h0;
            M[17] <= 8'h0;
            M[18] <= 8'h0;
            M[19] <= 8'h0;
            M[20] <= 8'h0;
            M[21] <= 8'h0;
            M[22] <= 8'h0;
            M[23] <= 8'h0;
            M[24] <= 8'h0;
            M[25] <= 8'h0;
            M[26] <= 8'h0;
            M[27] <= 8'h0;
            M[28] <= 8'h0;
            M[29] <= 8'h0;
            M[30] <= 8'h0;
            M[31] <= 8'h0;
            M[32] <= 8'h0;
            M[33] <= 8'h0;
            M[34] <= 8'h0;
            M[35] <= 8'h0;
            M[36] <= 8'h0;
            M[37] <= 8'h0;
            M[38] <= 8'h0;
            M[39] <= 8'h0;
            M[40] <= 8'h0;
            M[41] <= 8'h0;
            M[42] <= 8'h0;
            M[43] <= 8'h0;
            M[44] <= 8'h0;
            M[45] <= 8'h0;
            M[46] <= 8'h0;
            M[47] <= 8'h0;
            M[48] <= 8'h0;
            M[49] <= 8'h0;
            M[50] <= 8'h0;
            M[51] <= 8'h0;
            M[52] <= 8'h0;
            M[53] <= 8'h0;
            M[54] <= 8'h0;
            M[55] <= 8'h0;
            M[56] <= 8'h0;
            M[57] <= 8'h0;
            M[58] <= 8'h0;
            M[59] <= 8'h0;
            M[60] <= 8'h0;
            M[61] <= 8'h0;
            M[62] <= 8'h0;
            M[63] <= 8'h0;
        end
        else begin
                        if (CE1 & WE1)
                M[A1] <= D1;
        end
    end
endmodule

module ram_64x21_1ar_1w_r(CLK, RST_N, CE0, A0, CE1, A1, D1, WE1, Q0);
    input CLK;
    input RST_N;
    input CE0;
    input [5 : 0] A0;
    input CE1;
    input [5 : 0] A1;
    input [20 : 0] D1;
    input WE1;
    output [20 : 0] Q0;

    reg [20 : 0] M [0 : 63];

    assign Q0 = {21{CE0}} & M[A0];

    always @(posedge CLK) begin
        if (!RST_N) begin  : reset_block
            M[0] <= 21'h0;
            M[1] <= 21'h0;
            M[2] <= 21'h0;
            M[3] <= 21'h0;
            M[4] <= 21'h0;
            M[5] <= 21'h0;
            M[6] <= 21'h0;
            M[7] <= 21'h0;
            M[8] <= 21'h0;
            M[9] <= 21'h0;
            M[10] <= 21'h0;
            M[11] <= 21'h0;
            M[12] <= 21'h0;
            M[13] <= 21'h0;
            M[14] <= 21'h0;
            M[15] <= 21'h0;
            M[16] <= 21'h0;
            M[17] <= 21'h0;
            M[18] <= 21'h0;
            M[19] <= 21'h0;
            M[20] <= 21'h0;
            M[21] <= 21'h0;
            M[22] <= 21'h0;
            M[23] <= 21'h0;
            M[24] <= 21'h0;
            M[25] <= 21'h0;
            M[26] <= 21'h0;
            M[27] <= 21'h0;
            M[28] <= 21'h0;
            M[29] <= 21'h0;
            M[30] <= 21'h0;
            M[31] <= 21'h0;
            M[32] <= 21'h0;
            M[33] <= 21'h0;
            M[34] <= 21'h0;
            M[35] <= 21'h0;
            M[36] <= 21'h0;
            M[37] <= 21'h0;
            M[38] <= 21'h0;
            M[39] <= 21'h0;
            M[40] <= 21'h0;
            M[41] <= 21'h0;
            M[42] <= 21'h0;
            M[43] <= 21'h0;
            M[44] <= 21'h0;
            M[45] <= 21'h0;
            M[46] <= 21'h0;
            M[47] <= 21'h0;
            M[48] <= 21'h0;
            M[49] <= 21'h0;
            M[50] <= 21'h0;
            M[51] <= 21'h0;
            M[52] <= 21'h0;
            M[53] <= 21'h0;
            M[54] <= 21'h0;
            M[55] <= 21'h0;
            M[56] <= 21'h0;
            M[57] <= 21'h0;
            M[58] <= 21'h0;
            M[59] <= 21'h0;
            M[60] <= 21'h0;
            M[61] <= 21'h0;
            M[62] <= 21'h0;
            M[63] <= 21'h0;
        end
        else begin
                        if (CE1 & WE1)
                M[A1] <= D1;
        end
    end
endmodule

module powercontrol_rtl(clk, ms, reset, pse, iso_en, ret_en);
  input clk;
  input ms;
  input reset;
  output reg pse;
  output reg iso_en;
  output reg ret_en;
  reg [2:0] state_powercontrol;
  reg [2:0] state_powercontrol_next;
  reg read_powercontrol_ms_ln33_Z_0_tag_0;
  reg ctrlOr_ln31_z;
  reg write_powercontrol_pse_ln40_en;
  reg write_powercontrol_ret_en_ln38_en;
  reg read_powercontrol_ms_ln33_Z_0_tag_d;
  reg write_powercontrol_pse_ln47_en;
  reg write_powercontrol_iso_en_ln36_en;
  reg write_powercontrol_ret_en_ln49_en;
  reg write_powercontrol_iso_en_ln51_en;
  reg pse_hold;
  reg ret_en_hold;
  reg iso_en_hold;
  reg pse_d;
  reg ret_en_d;
  reg iso_en_d;

  // lint_checking URAREG OFF
`ifndef SYNTHESIS
  reg CtoS_rtl_powercontrol_rtl;
`endif
  // lint_checking URAREG ON
  // pragma sync_set_reset_local powercontrol_seq_block reset
  always @(posedge clk) // powercontrol_sequential
    begin : powercontrol_seq_block
      if (!reset) // Initialize state and outputs
      begin
        read_powercontrol_ms_ln33_Z_0_tag_0 <= 1'b0;
        pse <= 1'b1;
        ret_en <= 1'b0;
        iso_en <= 1'b0;
        state_powercontrol <= 3'h1;
      end
      else // Update Q values
      begin
        read_powercontrol_ms_ln33_Z_0_tag_0 <= 
        read_powercontrol_ms_ln33_Z_0_tag_d;
        pse <= pse_d;
        ret_en <= ret_en_d;
        iso_en <= iso_en_d;
        state_powercontrol <= state_powercontrol_next;
      end
    end
  always @(*) begin : powercontrol_combinational
      state_powercontrol_next = 3'h0;
      ctrlOr_ln31_z = state_powercontrol[2] | state_powercontrol[0];
      write_powercontrol_pse_ln40_en = read_powercontrol_ms_ln33_Z_0_tag_0 & 
      state_powercontrol[2];
      write_powercontrol_ret_en_ln38_en = read_powercontrol_ms_ln33_Z_0_tag_0 & 
      state_powercontrol[1];
      case (1'b1)// pragma parallel_case
        ctrlOr_ln31_z: read_powercontrol_ms_ln33_Z_0_tag_d = ms;
        state_powercontrol[1]: read_powercontrol_ms_ln33_Z_0_tag_d = 
          read_powercontrol_ms_ln33_Z_0_tag_0;
        default: read_powercontrol_ms_ln33_Z_0_tag_d = 1'bX;
      endcase
      write_powercontrol_pse_ln47_en = !ms & ctrlOr_ln31_z;
      write_powercontrol_iso_en_ln36_en = ms & ctrlOr_ln31_z;
      write_powercontrol_ret_en_ln49_en = !read_powercontrol_ms_ln33_Z_0_tag_0 & 
      state_powercontrol[1];
      write_powercontrol_iso_en_ln51_en = !read_powercontrol_ms_ln33_Z_0_tag_0 & 
      state_powercontrol[2];
      pse_hold = ~(write_powercontrol_pse_ln47_en | 
      write_powercontrol_pse_ln40_en);
      ret_en_hold = ~(write_powercontrol_ret_en_ln49_en | 
      write_powercontrol_ret_en_ln38_en);
      iso_en_hold = ~(write_powercontrol_iso_en_ln51_en | 
      write_powercontrol_iso_en_ln36_en);
      case (1'b1)// pragma parallel_case
        write_powercontrol_pse_ln47_en: pse_d = 1'b1;
        write_powercontrol_pse_ln40_en: pse_d = 1'b0;
        pse_hold: pse_d = pse;
        default: pse_d = 1'bX;
      endcase
      case (1'b1)// pragma parallel_case
        write_powercontrol_ret_en_ln38_en: ret_en_d = 1'b1;
        write_powercontrol_ret_en_ln49_en: ret_en_d = 1'b0;
        ret_en_hold: ret_en_d = ret_en;
        default: ret_en_d = 1'bX;
      endcase
      case (1'b1)// pragma parallel_case
        write_powercontrol_iso_en_ln36_en: iso_en_d = 1'b1;
        write_powercontrol_iso_en_ln51_en: iso_en_d = 1'b0;
        iso_en_hold: iso_en_d = iso_en;
        default: iso_en_d = 1'bX;
      endcase
      case (1'b1)// pragma parallel_case
        state_powercontrol[0]: // Wait_ln30
          state_powercontrol_next[1] = 1'b1;
        state_powercontrol[1]: // Wait_ln37
          state_powercontrol_next[2] = 1'b1;
        state_powercontrol[2]: // Wait_ln39
          state_powercontrol_next[1] = 1'b1;
        default: // Don't care
          state_powercontrol_next = 3'hX;
      endcase
    end
endmodule


