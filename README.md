# 4-bit-ALU-using-Verilog-NG-Spice-MAGIC

**Project Overview:**
In this VLSI project, our aim was to design a 4-Bit Arithmetic Logic Unit (ALU) capable of performing addition, subtraction, comparison, & AND operations and also to do delay analysis and finding the critical path in the circuit. The project utilizes NG-SPICE for circuit simulation, Magic for layout design, and Verilog for functional verification.

**Project Components:**

**1. Decoder:**
   - A 2-to-4 decoder is implemented to enable specific operations in the ALU.
   - Enables for different circuits: D0 – Adder; D1 – Subtractor; D2 – Comparator; D3 – And.
   - Magic layout is provided for the decoder.

**2. Enable Block:**
   - Comprises AND gates for handling 4-bit inputs (A3A2A1A0 and B3B2B1B0) to different modules based on enable signals.
   - Magic layout is included for the enable block.

**3. Modules:**

   a. **Adder/Subtractor:**
      - Single block that serves as both adder and subtractor.
      - Verilog code includes a full adder and a 4-bit adder for implementation.
      - NG-SPICE and GTKwave plots are provided for verification.
      - Magic layout for the adder/subtractor is included.

   b. **Comparator:**
      - Comparison of 4-bit numbers using logical formulas.
      - Verilog code, NG-SPICE, and GTKwave plots demonstrate functionality.
      - Magic layout is presented for the comparator.

   c. **4-Bit Adder:**
      - Verilog code, NG-SPICE, and GTKwave plots are provided.
      - Magic layout illustrates the design.

   d. **AND Block:**
      - Logical AND operations on specific bit pairs.
      - Verilog code, NG-SPICE, GTKwave plots, and Magic layout are included.

**4. Combined ALU:**
   - A comprehensive ALU design that integrates all the components.
   - Magic layout showcases the entire ALU circuit.

**Verification:**
   - NG-SPICE, GTKwave plots, and Magic layouts are used for verification.
   - Detailed explanations and illustrations are provided and for each module.

**Challenges Faced:**
   - Initial challenges in Verilog involving the definition of intermediate values.
   - Case-insensitivity issues in NG-SPICE coding.
   - Limitations in Magic layout editing, specifically with imported cells using getcell.
   - Design Rule Check (DRC) errors and challenges in locating specific errors in the layout.

**5. Delay Analysis:**
   - Delay scripts written for each module to analyze delay.
   - Maximum delay identified in the subtractor, making it the critical path.

**Observations & Conclusion:**
   - The critical path is determined by the maximum delay, identified in the subtractor.
   - Subtractor B0-O3 is identified as the critical path.
   - The overall project successfully demonstrates the design and analysis of a 4-Bit ALU.

**Acknowledgments:**
   - Gratitude to the VLSI tools (NG-SPICE, Magic) and Verilog for facilitating the project.
   - Special thanks to the project supervisor and mentors for guidance.

**Note:**
   - Detailed plots, diagrams, and layouts are available in the repository, but not included in this readme. Please refer to the report in the repository for   
     complete information.

**Thank You!**
