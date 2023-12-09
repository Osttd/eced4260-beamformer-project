import scipy as sp
import scipy.io as io
import numpy as np


data={}
concatlist=[]
concatlist1=[]

data=io.loadmat("rawdata.mat")
rawdata=data['raw_data_full']
#print(rawdata[0])

for i in range(len(rawdata[0])):
    #concatlist.append(f'{rawdata[0][i]:016b}')
    concatlist.append(np.binary_repr(rawdata[7][i], 16)+np.binary_repr(rawdata[6][i], 16)+np.binary_repr(rawdata[5][i], 16)+np.binary_repr(rawdata[4][i], 16)+np.binary_repr(rawdata[3][i], 16)+np.binary_repr(rawdata[2][i], 16)+np.binary_repr(rawdata[1][i], 16)+np.binary_repr(rawdata[0][i], 16))
                      
print(concatlist)

with open("signals.mif", "w") as writefile:

    writefile.write('''
WIDTH=128;
DEPTH=2048;

ADDRESS_RADIX=UNS;
DATA_RADIX=BIN;

CONTENT BEGIN
''')
    for i in range(len(concatlist)):
        writefile.write(f"  {i}  :  {concatlist[i]};\n")

    writefile.write("END;")


