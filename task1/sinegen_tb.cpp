#include "verilated.h"
#include "verilated_vcd_c.h"
#include "Vsinegen.h"
#include "vbuddy.cpp"

#define MAX_SIM_CYC 1000000  // Assign a value to MAX_SIM_CYC
#define ADDRESS_WIDTH 8
#define ROM_SZ 256

int main(int argc, char **argv, char **env) {
    int simcyc;
    int tick;

    Verilated::commandArgs(argc, argv);
    Vsinegen* top = new Vsinegen;
    Verilated::traceEverOn(true);
    VerilatedVcdC* tfp = new VerilatedVcdC;
    top->trace (tfp, 99);
    tfp->open ("sinegen.vcd");

    if (vbdOpen()!=1) return(-1);
    vbdHeader("L2T1: SigGen");

    top->clk = 1;
    top->rst = 0;
    top->en = 1;
    top->incr = 0x01;

    for (simcyc=0; simcyc<MAX_SIM_CYC; simcyc++){
        for(tick=0; tick<2; tick++){
            tfp->dump (2*simcyc+tick);
            top->clk = !top->clk;
            top->eval();
        }

        top->incr = vbdValue();
        vbdPlot(int(top->dout), 0, 255);
        vbdCycle(simcyc);

        if((Verilated::gotFinish()) || (vbdGetkey()=='q'))
            exit(0);
    }

    vbdClose();
    tfp->close();
    exit(0);
}