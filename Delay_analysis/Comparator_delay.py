import os
import subprocess
# import time

# This clears the output file
fp3 = open("Comp_delay_analysis.txt",'w')
fp3.close()

#this is the command this helps to choose which file to run
command = "ngspice destination_comp.spice"

#start of script
select_list = ["0","'SUPPLY'"]

Input_list = ["A0","A1","A2","A3","B0","B1","B2","B3"]
Output_list = ["Out0","Out1","Out2"]



for l in range(3):
    for k in range(8):
        fp1 = open("ALU.spice",'r')
        fp2 = open("destination_comp.spice",'w')
        fp3 = open("Comp_delay_analysis.txt",'a')
        mode1 = "RISE"
        mode2 = "RISE"
        mode3 = "FALL"
        mode4 = "FALL"

        data = fp1.read()

        if (l==2):
            if (k<4):
                #Rise Rise Fall Fall
                input = f'''
V_in_A0 A0 gnd PULSE(0 1.8 0ns 100ps 100ps 30ns 60ns)
V_in_A1 A1 gnd PULSE(0 1.8 0ns 100ps 100ps 30ns 60ns)
V_in_A2 A2 gnd PULSE(0 1.8 0ns 100ps 100ps 30ns 60ns)
V_in_A3 A3 gnd PULSE(0 1.8 0ns 100ps 100ps 30ns 60ns)
V_in_B0 B0 gnd dc 0
V_in_B1 B1 gnd dc 0
V_in_B2 B2 gnd dc 0
V_in_B3 B3 gnd dc 0
                '''
                
                search_input = "*Input"
                data = data.replace(search_input,input)
                
                search_text = "*target text"
                replace_text = f'''
.measure tran trise 
+ TRIG v({Input_list[k]}) VAL = 'SUPPLY/2' {mode1} =1
+ TARG v({Output_list[l]}) VAL = 'SUPPLY/2' {mode2} =1 

.measure tran tfall 
+ TRIG v({Input_list[k]}) VAL = 'SUPPLY/2' {mode3} =1 
+ TARG v({Output_list[l]}) VAL = 'SUPPLY/2' {mode4}=1

.measure tran tpd param = '(trise + tfall)/2' goal = 0
                '''

                data = data.replace(search_text,replace_text)
            
            else:
                # Fall Rise Rise Fall
                input = f'''
V_in_A0 A0 gnd dc 'SUPPLY'
V_in_A1 A1 gnd dc 'SUPPLY'
V_in_A2 A2 gnd dc 'SUPPLY'
V_in_A3 A3 gnd dc 'SUPPLY'
V_in_B0 B0 gnd PULSE(0 1.8 0ns 100ps 100ps 30ns 60ns)
V_in_B1 B1 gnd PULSE(0 1.8 0ns 100ps 100ps 30ns 60ns)
V_in_B2 B2 gnd PULSE(0 1.8 0ns 100ps 100ps 30ns 60ns)
V_in_B3 B3 gnd PULSE(0 1.8 0ns 100ps 100ps 30ns 60ns)
                '''

                search_input = "*Input"
                data = data.replace(search_input,input)
                
                search_text = "*target text"
                replace_text = f'''
.measure tran trise 
+ TRIG v({Input_list[k]}) VAL = 'SUPPLY/2' {mode3} =1
+ TARG v({Output_list[l]}) VAL = 'SUPPLY/2' {mode1} =1 

.measure tran tfall 
+ TRIG v({Input_list[k]}) VAL = 'SUPPLY/2' {mode2} =1 
+ TARG v({Output_list[l]}) VAL = 'SUPPLY/2' {mode4}=1

.measure tran tpd param = '(trise + tfall)/2' goal = 0
                '''

                data = data.replace(search_text,replace_text)
        
        
        elif (l==1):
            if (k<4):
                #Fall Rise Rise Fall
                input = f'''
V_in_A0 A0 gnd PULSE(0 1.8 0ns 100ps 100ps 30ns 60ns)
V_in_A1 A1 gnd PULSE(0 1.8 0ns 100ps 100ps 30ns 60ns)
V_in_A2 A2 gnd PULSE(0 1.8 0ns 100ps 100ps 30ns 60ns)
V_in_A3 A3 gnd PULSE(0 1.8 0ns 100ps 100ps 30ns 60ns)
V_in_B0 B0 gnd dc 'SUPPLY'
V_in_B1 B1 gnd dc 'SUPPLY'
V_in_B2 B2 gnd dc 'SUPPLY'
V_in_B3 B3 gnd dc 'SUPPLY'
                '''

                search_input = "*Input"
                data = data.replace(search_input,input)
                
                search_text = "*target text"
                replace_text = f'''
.measure tran trise 
+ TRIG v({Input_list[k]}) VAL = 'SUPPLY/2' {mode3} =1
+ TARG v({Output_list[l]}) VAL = 'SUPPLY/2' {mode1} =1 

.measure tran tfall 
+ TRIG v({Input_list[k]}) VAL = 'SUPPLY/2' {mode2} =1 
+ TARG v({Output_list[l]}) VAL = 'SUPPLY/2' {mode4}=1

.measure tran tpd param = '(trise + tfall)/2' goal = 0
                '''

                data = data.replace(search_text,replace_text)
            
            else:
                #Fall Rise Rise Fall
                input = f'''
V_in_A1 A1 gnd dc 'SUPPLY'
V_in_A0 A0 gnd dc 'SUPPLY'
V_in_A2 A2 gnd dc 'SUPPLY'
V_in_A3 A3 gnd dc 'SUPPLY'
V_in_B0 B0 gnd PULSE(0 1.8 0ns 100ps 100ps 30ns 60ns)
V_in_B1 B1 gnd PULSE(0 1.8 0ns 100ps 100ps 30ns 60ns)
V_in_B2 B2 gnd PULSE(0 1.8 0ns 100ps 100ps 30ns 60ns)
V_in_B3 B3 gnd PULSE(0 1.8 0ns 100ps 100ps 30ns 60ns)
                '''

                search_input = "*Input"
                data = data.replace(search_input,input)
                
                search_text = "*target text"
                replace_text = f'''
.measure tran trise 
+ TRIG v({Input_list[k]}) VAL = 'SUPPLY/2' {mode3} =1
+ TARG v({Output_list[l]}) VAL = 'SUPPLY/2' {mode1} =1 

.measure tran tfall 
+ TRIG v({Input_list[k]}) VAL = 'SUPPLY/2' {mode2} =1 
+ TARG v({Output_list[l]}) VAL = 'SUPPLY/2' {mode4}=1

.measure tran tpd param = '(trise + tfall)/2' goal = 0
                '''

                data = data.replace(search_text,replace_text)
                
        else:
            if (k<4):
                #Fall Rise Rise Fall
                input = f'''
V_in_A0 A0 gnd PULSE(0 1.8 0ns 100ps 100ps 30ns 60ns)
V_in_A1 A1 gnd PULSE(0 1.8 0ns 100ps 100ps 30ns 60ns)
V_in_A2 A2 gnd PULSE(0 1.8 0ns 100ps 100ps 30ns 60ns)
V_in_A3 A3 gnd PULSE(0 1.8 0ns 100ps 100ps 30ns 60ns)
V_in_B0 B0 gnd dc 'SUPPLY'
V_in_B1 B1 gnd dc 'SUPPLY'
V_in_B2 B2 gnd dc 'SUPPLY'
V_in_B3 B3 gnd dc 'SUPPLY'
                '''

                search_input = "*Input"
                data = data.replace(search_input,input)
                
                search_text = "*target text"
                replace_text = f'''
.measure tran trise 
+ TRIG v({Input_list[k]}) VAL = 'SUPPLY/2' {mode3} =1
+ TARG v({Output_list[l]}) VAL = 'SUPPLY/2' {mode1} =1 

.measure tran tfall 
+ TRIG v({Input_list[k]}) VAL = 'SUPPLY/2' {mode2} =1 
+ TARG v({Output_list[l]}) VAL = 'SUPPLY/2' {mode4}=1

.measure tran tpd param = '(trise + tfall)/2' goal = 0
                '''

                data = data.replace(search_text,replace_text)

            else:
                #Rise Rise Fall Fall
                input = f'''
V_in_A1 A1 gnd dc 0
V_in_A0 A0 gnd dc 0
V_in_A2 A2 gnd dc 0
V_in_A3 A3 gnd dc 0
V_in_B0 B0 gnd PULSE(0 1.8 0ns 100ps 100ps 30ns 60ns)
V_in_B1 B1 gnd PULSE(0 1.8 0ns 100ps 100ps 30ns 60ns)
V_in_B2 B2 gnd PULSE(0 1.8 0ns 100ps 100ps 30ns 60ns)
V_in_B3 B3 gnd PULSE(0 1.8 0ns 100ps 100ps 30ns 60ns)
                '''

                search_input = "*Input"
                data = data.replace(search_input,input)
                
                search_text = "*target text"
                replace_text = f'''
.measure tran trise 
+ TRIG v({Input_list[k]}) VAL = 'SUPPLY/2' {mode1} =1
+ TARG v({Output_list[l]}) VAL = 'SUPPLY/2' {mode2} =1 

.measure tran tfall 
+ TRIG v({Input_list[k]}) VAL = 'SUPPLY/2' {mode3} =1 
+ TARG v({Output_list[l]}) VAL = 'SUPPLY/2' {mode4}=1

.measure tran tpd param = '(trise + tfall)/2' goal = 0
                '''

                data = data.replace(search_text,replace_text)
                

        fp2.write(data)
        fp1.close()
        fp2.close()

        completed_process = subprocess.run(command, shell=True, text=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        if completed_process.returncode == 0:
            # Capture the standard output into a string
            output = completed_process.stdout
        else:
            output = ("Command execution failed. at",str(k),str(l))

        output = output.split('\n') #helps to seperate the string based on the new line characters
        output = output[-4] 
        
        additional_text = f" input = {Input_list[k]} output = {Output_list[l]}\n"

        fp3.write(output+additional_text)
        # time.sleep(0.4)
        