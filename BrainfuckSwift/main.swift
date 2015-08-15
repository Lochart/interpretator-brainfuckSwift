//
//  main.swift
//  BrainfuckSwift
//
//  Created by Nikolay on 01.08.15.
//  Copyright (c) 2015 Nikolay. All rights reserved.
//



import Foundation

func get_loops_block(source: String) -> [Int: Int] {
    var begin_block = [Int]()
    var blocks = [Int: Int]()
    for (i, s) in enumerate(source) {
        if s == "[" {
            begin_block.append(i)
        }else if s == "]"{
            var b_i = begin_block.removeLast()
            blocks[i] = b_i
            blocks[b_i] = i
        }
    }
    return blocks
    
}

var i = 0
var x = 0

var bf = [Int: Int]()
var source_str = "++++++++++[>+++++++>++++++++++>+++>+<<<<-]>++.>+.+++++++..+++.>++.<<+++++++++++++++.>.+++.------.--------.>+.>."
var source = Array(source_str)

var l = source.count
var loops_block = get_loops_block(source_str)


while i < l {
    var s = source[i]
    
    if s == ">"{
    x += 1
    }else if s == "<"{
    x -= 1
    }else if s == "+"{
        if bf[x] == nil{ //проверяем если клча x нету то приравниваем 0
            bf[x] = 0
        }
        bf[x] = bf[x]! + 1
    }else if s == "-"{
        if bf[x] == nil{ //проверяем если клча x нету то приравниваем 0
            bf[x] = 0
        }
        bf[x] = bf[x]! - 1
    }else if s == "."{
        if bf[x] == nil{ //проверяем если клча x нету то приравниваем 0
            bf[x] = 0
        }
    print(Character(UnicodeScalar(bf[x]!)))
    }else if s == ","{
//        bf[x] = Int(
    }else if s == "["{
        if bf[x] == 0{
            i = loops_block[i]!
        }
    }else if s == "]"{
        if bf[x] != 0{
            i = loops_block[i]!
        }
    }
    
    i += 1
    
}

