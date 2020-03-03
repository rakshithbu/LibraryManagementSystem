//
//  Student.swift
//  LibraryManagementSystem
//
//  Created by Rakshith C0776530 on 2020-02-28.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import Foundation

// to create student objects
class Student{
    
    var name : String
    var id : Int
    var borrowedBooks = [Int]()
    var balanceInLambtonIdCard : Double
    
    init(name : String, id :  Int , borrowedBooks : [Int] , balanceInLambtonIdCard : Double){
        self.name = name
        self.id = id
        self.borrowedBooks = borrowedBooks
        self.balanceInLambtonIdCard = balanceInLambtonIdCard
    }
}
