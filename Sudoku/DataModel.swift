//
//  DataModel.swift
//  Sudoku
//
//  Created by fox on 15/1/18.
//  Copyright (c) 2015年 fox. All rights reserved.
//

import Foundation

class DataModel{
    var data=[[Int]](count: 9, repeatedValue: [Int](count: 9, repeatedValue: 0))
    
    
    //check if the given array contain 1-9 only
    func checkBase(array:[Int]) -> Bool{
        var count = array.count
        if (count != 9) {
            return false
        }
        var standardArray = [true,false,false,false,false,false,false,false,false,false]
        for i in array {
            if standardArray[i] {
             return true
            } else {
                standardArray[i]=true
            }
        }
        for b in standardArray{
            if !b {
                return false
            }
        }
        return true
    }
    
    //to get an array of the row and return it
    func getRowArray(row:Int) -> [Int]{
        var rowArray=[Int](count: 9, repeatedValue: 0)
        for i in 0..<9{
            rowArray[i]=data[row][i]
        }
        return rowArray
    }
    
    //to get an array of the colomn and return it
    func getColomnArray(colomn:Int) -> [Int]{
        var colomnArray=[Int](count: 9, repeatedValue: 0)
        for i in 0..<9{
            colomnArray[i]=data[i][colomn]
        }
        return colomnArray
    }
    
    
    //to get an array of the segment and return it
    func getSegArray(position:Int) -> [Int]{
        var segArray=[Int](count: 9, repeatedValue: 0)
        let standardSegment=[(0,0),(0,1),(0,2),(1,0),(1,1),(1,2),(2,0),(2,1),(2,2),
                             (0,3),(0,4),(0,5),(1,3),(1,4),(1,5),(2,3),(2,4),(2,5),
                             (0,6),(0,7),(0,8),(1,6),(1,7),(1,8),(2,6),(2,7),(2,8),
                             (3,0),(3,1),(3,2),(4,0),(4,1),(4,2),(5,0),(5,1),(5,2),
                             (3,3),(3,4),(3,5),(4,3),(4,4),(4,5),(5,3),(5,4),(5,5),
                             (3,6),(3,7),(3,8),(4,6),(4,7),(4,8),(5,6),(5,7),(5,8),
                             (6,0),(6,1),(6,2),(7,0),(7,1),(7,2),(8,0),(8,1),(8,2),
                             (6,3),(6,4),(6,5),(7,3),(7,4),(7,5),(8,3),(8,4),(8,5),
                             (6,6),(6,7),(6,8),(7,6),(7,7),(7,8),(8,6),(8,7),(8,8)]
        for i in 0..<9{
            var (row,colomn)=standardSegment[position*9+i]
            segArray[i]=data[row][colomn]
        }
        
        return segArray
    }
    
    //check if all rows are ok
    func checkRow() -> Bool{
        for row in 0..<9{
            if !checkBase(getRowArray(row)){
                return false
            }
        }
        return true
    }
    
    //check if all rows are ok
    func checkColumn() -> Bool{
        for colomn in 0..<9{
            if !checkBase(getColomnArray(colomn)){
                return false
            }
        }
        return true
    }
    
    //check if all segments are ok
    func checkSegment() -> Bool{
        for seg in 0..<9{
            if !checkBase(getSegArray(seg)){
                return false
            }
        }
        
        return true
    }
}