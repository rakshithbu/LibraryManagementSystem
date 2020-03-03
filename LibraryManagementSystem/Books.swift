//
//  Books.swift
//  LibraryManagementSystem
//
//Created by Rakshith C0776530 on 2020-02-28.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import Foundation

// to create books object
class Books{
    
    var name : String
    var author : String
    var isbn : Int
    var numberOfCopiesAvailable : Int
    
    init(name: String, author: String, isbn : Int, numberOfCopiesAvailable : Int){
        self.name = name
        self.author = author
        self.isbn = isbn
        self.numberOfCopiesAvailable = numberOfCopiesAvailable
    }

}
