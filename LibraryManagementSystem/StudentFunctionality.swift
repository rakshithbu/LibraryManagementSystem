//
//  StudentFunctionality.swift
//  LibraryManagementSystem
//
//Created by Rakshith C0776530 on 2020-02-28.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import Foundation

class StudentFunctionality{
    
    // to create student list object
    func createStudentList (students : inout [Student]){
        let emptyBorrowedList = [Int]()
        print("Please enter how many student you want to add")
        
        let tempNumberOfstudents = Int(readLine()!)
        var numberOfstudents = 0
        if(tempNumberOfstudents != nil){
            numberOfstudents = tempNumberOfstudents!
            for _ in 0..<numberOfstudents {
                 
                 print("Please enter the student name");
                 let name = readLine()!
                 
                 print("Please enter the student ID");
                 let studentID = Int(readLine()!)
                if(studentID != nil){
                     students.append(Student(name: name, id: studentID!, borrowedBooks: emptyBorrowedList, balanceInLambtonIdCard: 0.0))
                }else{
                     print("Please enter the correct Student ID in number format")
                }
             }
        }else{
            print("Please enter number of students in correct number format")
        }
}
    // functionality to borrow book
    func borrowBook(students : inout [Student],books : inout [Books]){
        
             books.forEach {
                print($0.numberOfCopiesAvailable)
                if($0.numberOfCopiesAvailable > 0){
                    print("Book with name \($0.name) and ISBN \($0.isbn) and number of copies \($0.numberOfCopiesAvailable) is available to borrow")
                }
           }
        
        print("Please enter the student ID");
        let studentID = Int(readLine()!)
        
        if(studentID != nil){
            students.forEach{
                if($0.id == studentID){
                    if(!$0.borrowedBooks.isEmpty){
                        $0.borrowedBooks.forEach{
                            let borrowedISBN = $0
                            books.forEach {
                                if($0.isbn == borrowedISBN){
                                    print("You have already borrowed books with name \($0.name) and book ISBN is \($0.isbn)")
                                }
                            }
                        }
                    }
                }
            }
            
            print("Please enter the book ISBN to borrow");
            let ISBN =  Int(readLine()!)
            
            if(ISBN != nil){
                var flag = false
                
                for (_, studentElement) in students.enumerated() {
                    if(studentElement.id == studentID){
                       flag = true
                        for(_,bookElement) in books.enumerated(){
                            if(bookElement.isbn == ISBN && bookElement.numberOfCopiesAvailable > 0){
                                studentElement.borrowedBooks.append(bookElement.isbn)
                                let tempbookElement = bookElement.numberOfCopiesAvailable
                                bookElement.numberOfCopiesAvailable = bookElement.numberOfCopiesAvailable-1
                                print("The book \(bookElement.name) with \(bookElement.isbn) and copies has been updated from \(tempbookElement) to \(bookElement.numberOfCopiesAvailable)")
                            }
                        }
                    }
                }
                if(flag == false){
                    print("The entered student ID or the ISBN does not exist. Please enter the correct student ID")
                }
            }else{
                  print("Please enter the ISBN in correct number format")
            }
        }else{
            print("Please enter the correct Student ID in correct number format")
        }
}
    
    // functionality to return book
    
    func returnBook(students : inout [Student],books : inout [Books]){
        
        
        books.forEach {
                      
                print("Book with name \($0.name) and ISBN \($0.isbn) and number of copies \($0.numberOfCopiesAvailable)")
                       
                  }
        
              print("Please enter the student ID");
              let studentID = Int(readLine()!)
        
        if(studentID != nil){
            print("Please enter the book ISBN to return");
            let ISBN =  Int(readLine()!)
            
            if(ISBN != nil){
                for (_, studentElement) in students.enumerated() {
                    if(studentElement.id == studentID){
                       
                      for(_,bookElement) in books.enumerated(){
                            if(bookElement.isbn == ISBN){
                              
                              
                              for(index,element) in studentElement.borrowedBooks.enumerated(){
                                  if(element == ISBN){
                                      studentElement.borrowedBooks.remove(at: index)
                                      print("Book has been returned successfully")
                                  }
                              }
                                let tempBookElemnt = bookElement.numberOfCopiesAvailable;
                                let addedBookelement = tempBookElemnt+1
                                print("The number of copies available for book \(bookElement.name) and ISBN \(bookElement.isbn) has been increased from \(tempBookElemnt) to \(addedBookelement)")
                              bookElement.numberOfCopiesAvailable = bookElement.numberOfCopiesAvailable + 1
                            }
                        }
                    }
                }
            }else{
                 print("Please enter the ISBN in correct number format")
            }
        }else{
            print("Please enter the correct Student ID correct in number format")
        }
}
    
    // functionality to print copies sheet
 func usePrinter(students : inout [Student]){
        print("Please enter the student ID");
        let studentID = Int(readLine()!)
        
        if(studentID != nil){
            var studentBalance = 0.0;
            students.forEach {
                if($0.id == studentID){
                    print("Avaialble balance in card is \($0.balanceInLambtonIdCard)")
                    studentBalance = $0.balanceInLambtonIdCard
                }
            }
            print("Please enter the number of copies to print")
            print("Note you will be charged 10 cents per copy")
            let numberOfPrintCopies = Int(readLine()!)
            
            if(numberOfPrintCopies != nil){
                if(numberOfPrintCopies! > 0 ){
                    if((Double(numberOfPrintCopies!)  *   0.10) > studentBalance){
                        print("Insufficient balance!!!!!")
                        print("Please load \(( Double(numberOfPrintCopies!) * 0.10) - studentBalance) $ to print the copies")
                    }else{
                         print("Print successfull")
                         print("You are charged \( Double(numberOfPrintCopies!) * 0.10)")
                         print("You are available balance is \(studentBalance-( Double(numberOfPrintCopies!) * 0.10))")
                        students.forEach {
                                   if($0.id == studentID){
                                        $0.balanceInLambtonIdCard = (studentBalance-( Double(numberOfPrintCopies!) * 0.10))
                                   }
                               }
                    }
                }else{
                       print("Please enter the number of copies print wanted greater than 0")
                }
                
            }else{
                 print("Please enter the number of copies in correct number format")
            }
        }else{
             print("Please enter the Student ID in correct number format")
        }
}
    
    // functionality to update lambton college balance amount
    func updateBalanceInLambtonCard(students : inout [Student]){
        print("Please enter the student ID");
        let studentID = Int(readLine()!)
        
        if(studentID != nil){
            
            students.forEach {
                if($0.id == studentID){
                     print("Your available amount in the card is \($0.balanceInLambtonIdCard)");
                }
            }
            
            print("Please enter the amount to add in the card")
            
              let amount = Double(readLine()!)
             
            if(amount != nil){
                if(amount! > 0){
                    students.forEach {
                        if($0.id == studentID){
                            $0.balanceInLambtonIdCard = $0.balanceInLambtonIdCard + amount!
                             print("Your available amount in the card is \($0.balanceInLambtonIdCard)");
                        }
                    }
                }else{
                      print("Please enter the Amount greater than 0")
                }
            }else{
                 print("Please enter the Amount in correct number format")
            }
        }else{
            print("Please enter the Student ID in correct number format")
        }
    }
    
}
