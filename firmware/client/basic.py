#!/usr/bin/python3
import serial
from time import sleep
import max2870
import matplotlib.pyplot as plt
import numpy as np
from tqdm import tqdm

def set_reg(r, s):
    send_cmd("SPR:"+hex(r.r5.asbyte)+";", s)
    send_cmd("SPR:"+hex(r.r4.asbyte)+";", s)
    send_cmd("SPR:"+hex(r.r3.asbyte)+";", s)
    send_cmd("SPR:"+hex(r.r2.asbyte)+";", s)
    send_cmd("SPR:"+hex(r.r1.asbyte)+";", s)
    send_cmd("SPR:"+hex(r.r0.asbyte)+";", s)


def read_reg(ser_port):
    r = max2870.register()
    ser_port.write(bytes("STS;","utf-8"))
    r.r0.asbyte=int(ser_port.readline().decode("utf-8"), 16)
    r.r1.asbyte=int(ser_port.readline().decode("utf-8"), 16)
    r.r2.asbyte=int(ser_port.readline().decode("utf-8"), 16)
    r.r3.asbyte=int(ser_port.readline().decode("utf-8"), 16)
    r.r4.asbyte=int(ser_port.readline().decode("utf-8"), 16)
    r.r5.asbyte=int(ser_port.readline().decode("utf-8"), 16)
    r.r6.asbyte=int(ser_port.readline().decode("utf-8"), 16)
    sleep(0.2)
    return r


def send_cmd(com, ser_port):
    ser_port.write(bytes(com,"utf-8"))
    sleep(0.007)

def gen_reglist(start, stop, step):
    r = []
    fr = []
    for f in range(start, stop, step):
        r.append(max2870.makereg(f,"frac", 25))
        fr.append(max2870.GetFreqB(r[-1], 25))
    return r, fr

def get_power(ser_port):
    send_cmd("RP;", ser_port)
    return float(ser.readline().decode("utf-8").split(' ', 1)[0])

def test_power(ser_port):
    p = list()
    damp = range(0,128,1)
    for d in tqdm(damp, desc="Power sweep"):
        send_cmd("SA:"+hex(d)+";", ser_port)
        p.append(get_power(ser_port))
    damp_db = np.array([x/4.0 for x in damp])
    plt.plot(damp_db, np.array(p),'-*')

def sweep_f(ser_port, r):
    p = list()
    for reg in tqdm(r, desc="Freq sweep"):
        set_reg(reg, ser_port)
        p.append(get_power(ser_port))
    return p

def test_filters(ser_port):
    r, f = gen_reglist(25, 6000, 100)
    p = list()
    send_cmd("SA:0;", ser_port)
    for filt in range(0,4):
        send_cmd("SF:"+hex(filt)+";", ser_port)
        p.append(sweep_f(ser_port, r))
    power = np.transpose(np.array(p))
    freq  = np.array(f)
    plt.plot(freq, power)
    plt.legend(["0","1","2","3"])


# Serial port
ser = serial.Serial('/dev/ttyUSB0', 38400)
ser.setTimeout = 0.2

# Set up PLL
r = max2870.makereg(90, "frac")
set_reg(r, ser)

# Enable output
send_cmd("RFON;", ser)
send_cmd("AON;", ser)
send_cmd("SF:0;", ser) 
send_cmd("SA:0;", ser) 
ri = [max2870.makereg(x, "frac") for x in range(25, 300,100)]
#r, f = gen_reglist(25, 6000, 100) 
#p = sweep_f(ser, r)
#plt.plot(f,p)
#set_reg(r[0], ser)
for re in ri:
    max2870.InterpReg(re)
max2870.InterpReg(r)
#test_power(ser)
#max2870.InterpReg(read_reg(ser))
# Disable output
send_cmd("AOFF;", ser)
send_cmd("RFOFF;", ser)
send_cmd("SPP:13:1;", ser)

# Show the plot
#plt.show()
