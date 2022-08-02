#!/usr/bin/env python
# -*- coding: utf-8 -*-

import datetime as dt
import array

def readFile(path):
    UncryptedText = ""
    try:
        f = open(path, "r")
        lines = f.readlines()
        #for i in range(0,len(lines)):
        UncryptedText = UncryptedText.join(lines)
    except IOError:
        # 'File not found' error message.
        print("file not found!")
        return False
    return UncryptedText

def mixer(arr, key, fix):
    sz = len(key)
    csz = int(256/sz)
    lst = [0] * sz

    for a in arr:
        clst = split(a, csz)
        for i in range(sz):
            if fix:
                lst[i] = clst[key[i] - 1 ]
            else:
                lst[key[i] - 1 ] = clst[i]
        lst = concatenate(lst)
    return lst

def concatenate(arr):
    r = []
    for i in arr:
        r = r + i
    return r

def xor(arr, key):
    r = []
    ar = split(arr, 128)
    for a in ar:
        for i in range(len(a)):
            if a[i] == key[i]:
                r.append(0)
            else:
                r.append(1) 
    return r

def split(arr, size):
     arrs = []
     while len(arr) > size:
         pice = arr[:size]
         arrs.append(pice)
         arr   = arr[size:]
     arrs.append(arr)
     return arrs

def tobits(s):
    result = []
    for c in s:
        bits = bin(ord(c))[2:]
        bits = '00000000'[len(bits):] + bits
        result.extend([int(b) for b in bits])
    return result

def frombits(bits):
    chars = []
    for b in range(int(len(bits)/8)):
        byte = bits[b*8:(b+1)*8]
        chars.append(chr(int(''.join([str(bit) for bit in byte]), 2)))
    return ''.join(chars)

def swapbits(bits):
    # Swap Two Elements in a Array using Function
    mx = len(bits)
    for i in range( int ( mx / 2 ) ):
        bits[i], bits[( mx - 1 ) - i] = bits[ ( mx - 1 ) - i], bits[i]
    return bits

def set_key1():
    while True:
        key = [int(i) for i in input("1.Anahtarı Girin:").split()]
        if  len(key) == 4 & 1 in key & 2 in key & 3 in key & 4 in key:
            break

def set_key1():
    while True:
        key = [int(i) for i in input("1.Anahtarı Girin:").split()]
        if 1 not in key:
            continue
        if 2 not in key:
            continue
        if 3 not in key:
            continue
        if 4 not in key:
            continue
        if len(key) == 4:
            break
    return key

def set_key2():
    while True:
        key = input("2.Anahtarı Girin:")
        if len(key) == 16:
            break
    return tobits( key )

def set_key3():
    while True:
        key = [int(i) for i in input("3.Anahtarı Girin:").split()]
        if 1 not in key or 2 not in key:
            continue
        if 3 not in key or 4 not in key:
            continue
        if 5 not in key or 6 not in key:
            continue
        if 7 not in key or 8 not in key:
            continue
        if len(key) == 8:
            break
    return key

def cipher_encryption(dec_msg, test):
    if test:
        key1 = [1,4,3,2]
        key2 = tobits( "Gizli.Anahtar.01" )
        key3 = [2,3,1,4,5,8,7,6]
    else:
        key1 = set_key1()
        key2 = set_key2()
        key3 = set_key3()
    
    b = tobits( dec_msg )
    
    #2.1 Bit çevirme
    b = swapbits( b )
    
    while len(b) % 256 != 0:
        b.append(0)
        pass

    #2.2 İkili akışı karıştırma
    
    b = split(b, 256)
    b = mixer(b, key1, True)

    #2.3 XOR
    b = xor( b, key2 )

    #2.4 İkinci ikili akışı karıştırma
    b = split(b, 256)
    b = mixer(b, key3, True)

    print("Metin şifrelendi.")
    return b

def cipher_decryption(cip_msg, test):

    if test:
        key1 = [1,4,3,2]
        key2 = tobits( "Gizli.Anahtar.01" )
        key3 = [2,3,1,4,5,8,7,6]
    else:
        key1 = set_key1()
        key2 = set_key2()
        key3 = set_key3()

    #2.4 İkinci ikili akışı karıştırma geri al
    b = split(cip_msg, 256)
    b = mixer(b, key3, False)

    #2.3 XOR
    b = xor(b, key2)

    #2.2 İkili akışı karıştırma geri al
    b = split(b, 256)
    b = mixer(b, key1, False)

    #2.1 Bit çevirme
    b = swapbits( b )
    b = frombits( b )

    print("Metin deşifre edildi.")
    return b

def test():
    print( cipher_decryption(cipher_encryption(readFile("file.txt"),True),True) )
    pass

def main():
    choice = int(input("1. Şifreleme\n2. Deşifrasyon\n3. Test (Dosyadan)\n4. Test (Metin Girişli)\nSeçim(1,2,3,4): "))
    if choice == 1:
        print("---Şifreleme---")
        print(cipher_encryption(input("Şifrelecek girdi: "),False))
    elif choice == 2:
        print("---Deşifrasyon---")
        print(cipher_decryption(input("Deşifre edilecek girdi: "),False))
    elif choice == 3:
        print("---Test---")
        test()
    elif choice == 4:
        print("---Test---")
        print( cipher_decryption(cipher_encryption(input("Şifrelecek girdi: "))) )
    else:
        print("Geçersiz Seçim")

if __name__=="__main__":
    main()