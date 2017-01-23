import ctypes
from math import log2,ceil,floor
from fractions import Fraction

c_u32 = ctypes.c_uint32

class Flag_bits_0(ctypes.LittleEndianStructure):
    _fields_ = [
        ('ADDR', c_u32, 3),
        ('FRAC', c_u32, 12),
        ('N', c_u32, 16),
        ('INT', c_u32, 1)
        ]

class Flags_0(ctypes.Union):
    _fields_ = [
        ('map', Flag_bits_0),
        ('asbyte', c_u32)
        ]
    def __init__(self, b=0):
        self.asbyte = b
    
class Flag_bits_1(ctypes.LittleEndianStructure):
    _fields_ = [
        ('ADDR', c_u32, 3),
        ('M', c_u32, 12),
        ('P', c_u32, 12),
        ('CPT', c_u32, 2),
        ('CPL', c_u32, 2),
        ('CPOC', c_u32, 1)
        ]

class Flags_1(ctypes.Union):
    _fields_ = [
        ('map', Flag_bits_1),
        ('asbyte', c_u32)
        ]
    def __init__(self, b=1):
        self.asbyte = b

class Flag_bits_2(ctypes.LittleEndianStructure):
    _fields_ = [
        ('ADDR', c_u32, 3),
        ('RST', c_u32, 1),
        ('TRI', c_u32, 1),
        ('SHDN', c_u32, 1),
        ('PDP', c_u32, 1),
        ('LDP', c_u32, 1),
        ('LDF', c_u32, 1),
        ('CP', c_u32, 4),
        ('REG4DB', c_u32, 1),
        ('R', c_u32, 10),
        ('RDIV2', c_u32, 1),
        ('DBR', c_u32, 1),
        ('MUX_lsb', c_u32, 3),
        ('SDN', c_u32, 2),
        ('LDS', c_u32, 1)
        ]

class Flags_2(ctypes.Union):
    _fields_ = [
        ('map', Flag_bits_2),
        ('asbyte', c_u32)
        ]
    def __init__(self, b=2):
        self.asbyte = b

class Flag_bits_3(ctypes.LittleEndianStructure):
    _fields_ = [
        ('ADDR', c_u32, 3),
        ('CDIV', c_u32, 12),
        ('CDM', c_u32, 2),
        ('_reserved', c_u32, 7),
        ('RETUNE', c_u32, 1),
        ('VAS_SHDN', c_u32, 1),
        ('VCO', c_u32, 6)
        ]

class Flags_3(ctypes.Union):
    _fields_ = [
        ('map', Flag_bits_3),
        ('asbyte', c_u32)
        ]
    def __init__(self, b=3):
        self.asbyte = b

class Flag_bits_4(ctypes.LittleEndianStructure):
    _fields_ = [
        ('ADDR', c_u32, 3),
        ('APWR', c_u32, 2),
        ('RFA_EN', c_u32, 1),
        ('BPWR', c_u32, 2),
        ('RFB_EN', c_u32, 1),
        ('BDIV', c_u32, 1),
        ('_reserved', c_u32, 2),
        ('BS_lsb', c_u32, 8),
        ('DIVA', c_u32, 3),
        ('FB', c_u32, 1),
        ('BS_msb', c_u32, 2),
        ('_reserved2', c_u32, 6)
        ]

class Flags_4(ctypes.Union):
    _fields_ = [
        ('map', Flag_bits_4),
        ('asbyte', c_u32)
        ]
    def __init__(self, b=4):
        self.asbyte = b

class Flag_bits_5(ctypes.LittleEndianStructure):
    _fields_ = [
        ('ADDR', c_u32, 3),
        ('_reserved', c_u32, 15),
        ('MUX_msb', c_u32, 1),
        ('_reserved2', c_u32, 3),
        ('LD', c_u32, 2),
        ('F01', c_u32, 1),
        ('_reserved3', c_u32, 7),
        ]

class Flags_5(ctypes.Union):
    _fields_ = [
        ('map', Flag_bits_5),
        ('asbyte', c_u32)
        ]
    def __init__(self, b=5):
        self.asbyte = b

class Flag_bits_6(ctypes.LittleEndianStructure):
    _fields_ = [
        ('ADDR', c_u32, 3),
        ('V', c_u32, 6),
        ('_reserved', c_u32, 11),
        ('ADC', c_u32, 3),
        ('POR', c_u32, 1),
        ('_reserved2', c_u32, 8)
        ]

class Flags_6(ctypes.Union):
    _fields_ = [
        ('map', Flag_bits_6),
        ('asbyte', c_u32)
        ]
    def __init__(self, b=6):
        self.asbyte = b

class register:
    def __init__(self, f = 900, mode = "frac", f_REF = 25):
        self.r0 = Flags_0()
        self.r1 = Flags_1()
        self.r2 = Flags_2()
        self.r3 = Flags_3()
        self.r4 = Flags_4()
        self.r5 = Flags_5()
        self.r6 = Flags_6()

        #Ports
        self.r4.map.RFA_EN = 0
        self.r4.map.APWR = 0
        self.r4.map.RFB_EN = 1
        self.r4.map.BPWR = 1
        self.r4.map.BDIV = 0

        #Ref
        self.r2.map.R = 1 # min 1
        self.r2.map.DBR = 0
        self.r2.map.RDIV2 = 0
        f_PDF = f_REF * (1+self.r2.map.DBR)/(self.r2.map.R*(1+self.r2.map.RDIV2)) 

        #Housekeeping
        self.r1.map.M = 2 # min 2
        self.r5.map.LD = 1 
        self.r2.map.PDP = 1
        self.r2.map.CP = 15
        self.r3.map.CDIV = 1
        self.r1.map.P = 1
        self.r4.map._reserved2 = 0b011000

        #noise cancellation
        self.r2.map.SDN = 0

        # exclude ADIV from feedback?
        self.r4.map.FB = 1

        BS = round(f_PDF/0.05)
        self.r4.map.BS_lsb = BS & 255
        self.r4.map.BS_msb = BS>> 8
        
        self.r2.map.MUX_lsb = 4
        self.r5.map.MUX_msb = 1

        self.r4.map.DIVA = max(0, ceil(log2(3000/f)))
        f_VCO = f* pow(2, self.r4.map.DIVA)

        if mode == "int":
            self.r0.map.INT = 1
            self.r2.map.LDF = 1
            self.r1.map.CPOC = 1
            if self.r4.map.FB == 0:
                self.r0.map.N = round(f_VCO / f_PDF/min(16, pow(2, self.r4.map.DIVA)))
                f_VCO_real = self.r0.map.N * f_PDF * min(16, pow(2, self.r4.map.DIVA))
            else:
                self.r0.map.N = round(f_VCO / f_PDF)
                f_VCO_real = self.r0.map.N * f_PDF
        else:
            self.r1.map.CPL = 1
            if self.r4.map.FB == 0:
                T = f_VCO / f_PDF/min(16, pow(2, self.r4.map.DIVA))
                self.r0.map.N = floor(T)
                F = Fraction(T%1).limit_denominator(4095)
                self.r1.map.M = F.denominator
                self.r0.map.FRAC = F.numerator
                f_VCO_real = (self.r0.map.N + self.r0.map.FRAC / self.r1.map.M ) * f_PDF * min(16, pow(2, self.r4.map.DIVA))
                
            else:
                T = f_VCO / f_PDF
                self.r0.map.N = floor(T)
                F = Fraction(T%1).limit_denominator(4095)
                self.r1.map.M = F.denominator
                self.r0.map.FRAC = F.numerator
                f_VCO_real = (self.r0.map.N + self.r0.map.FRAC / self.r1.map.M ) * f_PDF
                
        f_real = f_VCO_real / pow(2, self.r4.map.DIVA)

    def GetFreqB(self, f_REF = 25):
        f_PDF = f_REF * (1+self.r2.map.DBR)/(self.r2.map.R*(1+self.r2.map.RDIV2))
        f_VCO = f_PDF * (self.r0.map.N + self.r0.map.FRAC/self.r1.map.M)
        f_RFOUTA = f_VCO/pow(2,self.r4.map.DIVA)
        if self.r4.map.BDIV:
            f_RFOUTB = f_VCO
        else:
            f_RFOUTB = f_RFOUTA
        return f_RFOUTB
        
    def GetFreqA(self, f_REF = 25):
        f_PDF = f_REF * (1+self.r2.map.DBR)/(self.r2.map.R*(1+self.r2.map.RDIV2))
        f_VCO = f_PDF * (self.r0.map.N + self.r0.map.FRAC/self.r1.map.M)
        f_RFOUTA = f_VCO/pow(2,self.r4.map.DIVA)
        return f_RFOUTA

def enum(*sequential, **named):
    enums = dict(zip(sequential, range(len(sequential))), **named)
    return type('Enum', (), enums)

propnames = enum(
    'INT', 'N', 'FRAC', 'CPOC', 'CPL', 'CPT', 'P', 'M', 'LDS', 'SDN', 'MUX', 'DBR', 
    'RDIV2', 'R', 'REG4DB', 'CP', 'LDF', 'LDP', 'PDP', 'SHDN', 'TRI', 'RST', 'VCO', 
    'VAS_SHDN', 'RETUNE', 'CDM', 'CDIV', 'BS', 'FB', 'DIVA', 'BDIV', 'RFB_EN', 'BPWR', 
    'RFA_EN', 'APWR', 'F01', 'LD')

def InterpReg(reg: object, f_REF: object = 25, RSET: object = 5100) -> object:
    r0= reg.r0.map
    r1= reg.r1.map
    r2= reg.r2.map
    r3= reg.r3.map
    r4= reg.r4.map
    r5= reg.r5.map
    r6= reg.r6.map

    if r4.RFA_EN:
        print("RFA: Enabled " + str(r4.APWR*3 - 4)+" dBm")
        
    if r4.RFB_EN:
        print("RFB: Enabled " + str(r4.BPWR*3 - 4)+" dBm")

    if r0.INT == 1:
        print("Integer-N mode")
    else:
        print("Fractional-N mode")
    print ("\nPhase detector frequency: [Max 105 MHz (int)/ 50 (frac)]")
    print ("f_PDF = f_REF x ((1 + DBR[1])/(R[10] x (1 + RDIV2[1])))")
    f_PDF = f_REF * (1+r2.DBR)/(r2.R*(1+r2.RDIV2))
    print (str(f_PDF) + " MHz = "+ str(f_REF) +" MHz x [(1 + "+ str(r2.DBR) +")/("+ str(r2.R) +" x (1 + "+ str(r2.RDIV2) +"))]")

    print ("\nVCO Frequency:")
    f_VCO = f_PDF * (r0.N + r0.FRAC/r1.M)
    if r4.FB == 1:
        print("DIVA not in feedback loop (FB=1)")
        print("f_VCO = f_PDF x (N(16) + FRAC(12)/M(12))")
        print(str(f_VCO)+" = "+str(f_PDF)+" x ("+str(r0.N)+" + "+str(r0.FRAC)+"/"+str(r1.M)+")")
    else:
        f_VCO = f_VCO * min(16, pow(2, r4.DIVA))
        print("DIVA in feedback loop (FB=0)")
        print("f_VCO = f_PDF x DIVA[max:16] x (N(16) + FRAC(12)/M(12))")
        print(str(f_VCO)+" MHz = "+str(f_PDF)+" MHz x "+str(min(16, pow(2, r4.DIVA)))+" x ("+str(r0.N)+" + "+str(r0.FRAC)+"/"+str(r1.M)+")")
    if (f_VCO >6000) | (f_VCO<3000) :
        print("Error: f_VCO out of range")

    print ("\nOut frequency")
    DIVA=pow(2,r4.DIVA)
    f_RFOUTA = f_VCO/DIVA
    if r4.BDIV:
        f_RFOUTB = f_VCO
    else:
        f_RFOUTB = f_RFOUTA
    print ("f_RFOUTA = f_VCO / DIVA[pow-3]")
    print (str(f_RFOUTA)+" MHz = "+str(f_VCO)+" MHz / "+str(DIVA))
    print ("\nf_RFOUTB = BDIV[1]? f_VCO : f_RFOUTA" )
    print (str(f_RFOUTB)+" MHz")

    print ("\nCharge Pump Current:")
    I_CP = 1.63/RSET * (1+r2.CP)
    print ("I_CP = 1.63/RSET x (1+CP[4])")
    print (str(round(I_CP,5)*1000)+" mA = 1.63/"+str(RSET)+" Ohm x (1+"+str(r2.CP)+")\n")

    MUX_OUT = (r5.MUX_msb<<3) + r2.MUX_lsb
    if MUX_OUT == 0:
        print("MUX_OUT: Three-state output")
    elif MUX_OUT == 1:
        print("MUX_OUT: D_VDD")
    elif MUX_OUT == 2:
        print("MUX_OUT: D_GND")
    elif MUX_OUT == 3:
        print("MUX_OUT: R-divider out")
    elif MUX_OUT == 4:
        print("MUX_OUT: N-divider out/2")
    elif MUX_OUT == 5:
        print("MUX_OUT: Analog LD")
    elif MUX_OUT == 5:
        print("MUX_OUT: Digital LD")
    elif MUX_OUT == 12:
        print("MUX_OUT: Digital out")
    else:
        print("Error: MUX_OUT at a reserved configuration")

    BS=r4.BS_lsb+(r4.BS_msb<<8)
    if r3.VAS_SHDN==1:
        print ("\nVCO #" + str(r3.VCO)+ " manualy selected")
    else:
        f_SMC = f_PDF/BS
        print ("\nAutomatic VCO selection, State machine clock: "+str(f_SMC*1000)+"kHz, (Should be around 50kHz)")
        if r3.RETUNE:
            print("RETUNE is also enabled")

    if r2.SDN == 0:
        print("\nLow in-band noise mode")
    elif r2.SDN > 1:
        print("\nLow Spur mode "+ str(r2.SDN-1))
    else:
        print("\nError: SDN in reserved mode")

    # Find errors
    if r2.LDF != r0.INT:
        print("Error: LDF should be set during int mode (only)")
    if r5.F01 == 0 & r0.FRAC == 0 & r0.INT == 1:
        print("Error: FRAC=0 in fractional mode!")
    if r1.CPL == r0.INT:
        print("Error: CPL should be set during frac mode (only)")
    if r1.CPOC != r0.INT:
        print("Error: CPOC should be set during int mode (only)")
    if r2.TRI == 1:
        print("Error: Charge pump in high-z mode")
    if r2.PDP == 0:
        print("Error: The loop is not fitted with an active inverting filter, set PDP=1")
    if r5.LD != 1:
        print("Error: LD pin is not set as digital out")
    if r3.CDM == 1 & r2.CP != 0:
        print("Error: Fast-Lock set but CP != 0!")
    if r3.CDM == 2:
        print("Error: Phase shift mode!")
    
    print("\nPOR: "+str(r6.POR))
    print("ADC: "+str(r6.ADC))
    print("VCO: #"+str(r6.V))
    
