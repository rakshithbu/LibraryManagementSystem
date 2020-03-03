//
//  Admin.swift
//  LibraryManagementSystem
//
//Created by Rakshith C0776530 on 2020-02-28.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import Foundation
class  Admin
{
 
    // functionality to create booklist object based on user inputs
    func createBookList(books : inout [Books]){
        print("Please enter how many books to add")
        
        let numberOfBooks = Int(readLine()!)
        
        if(numberOfBooks != nil){
            
            for _ in 0..<numberOfBooks! {
                       
                       print("Please enter the book name");
                       let name = readLine()!
                       
                       print("Please enter the book author");
                       let author = readLine()!;
                       
                       print("Please enter the book ISBN");
                       let isbn = Int(readLine()!)
                
                if(isbn != nil){
                    print("Please the number of book copies available ")
                    let  copies = Int(readLine()!)
                    if(copies != nil){
                        books.append(Books(name:name,author: author,isbn: isbn!,numberOfCopiesAvailable: copies!))
                    }else{
                         print("Please enter ISBN in correct number format")
                    }
                    
                }else{
                      print("Please enter ISBN in correct number format")
                }
                       
          }
        }else{
            print("Please enter how many books to add in correct number format")
        }
}
    
    // functionality to remove books from booklist based on book ISBN
    func removeBookFromStockByISBN(books : inout [Books]){
         print("Available books are")
        
        if(!books.isEmpty){
            books.forEach {
                
            print("Book name: \($0.name) , ISBN : \($0.isbn) ")
                
            }
            
            print("Please enter the book ISBN to remove")
            let ISBN = Int(readLine()!)
            var flag = false
            
            if(ISBN != nil){
                for (index, element) in books.enumerated() {
                           if(element.isbn == ISBN!){
                                 books.remove(at: index)
                                 print("Book \(element.name) with ISBN \(element.isbn) is removed successfully")
                            flag = true
                           }
                    }
                 
                if(flag == false){
                   print("There are no books available with the entered ISBN")
                }
            }else{
                 print("Please enter ISBN in correct number format")
            }
            
        }else{
              print("No books are available")
        }
    }
    
    //update the number of copies available for the book based on user input
    func updateNoOfCopiesAvailableByISBN(books : inout [Books]){
        
                  books.forEach {
                       
                    print("Book name: \($0.name) , ISBN : \($0.isbn) , number of copies available: \($0.numberOfCopiesAvailable)")
                       
                   }
        
            print("Please enter the book ISBN to update the copies available")
            let ISBN = Int(readLine()!)
            var flag = false
      
        if(ISBN != nil){
            print("Please enter number of copies available")
                   let numberOfCopies = Int(readLine()!)
            
            if(numberOfCopies != nil){
                if(numberOfCopies! > 0){
                    books.forEach {
                        if($0.isbn == ISBN){
                         let temp = $0.numberOfCopiesAvailable
                            $0.numberOfCopiesAvailable = numberOfCopies!
                             print("Number of copies has been updated from \(temp) to \($0.numberOfCopiesAvailable)")
                            flag = true
                        }
                    }
                }else{
                     print("Please enter the number of copies greater than 0")
                }
            }else{
                 print("Please enter the number of copies available in correct number format")
            }
                   
            if(flag == false){
                 print("There are no books available with the entered ISBN")
            }
        }else{
            print("Please enter ISBN in correct number format")
        }
    }
    
    
    // to delete student from student list object
    
    func deleteStudentsFromTheList(students : inout [Student]){
           print("List of Students are")
        if(!students.isEmpty){
            students.forEach {
                print("Student Name : \($0.name) and Student ID is \($0.id)")
               }
               print("Please enter the Student ID to delete")
               let studentID = Int(readLine()!)
               var flag = false
               if(studentID != nil){
                for (index, element) in students.enumerated() {
                    if(element.id == studentID){
                        students.remove(at: index)
                        flag = true
                        print("Student Name : \(element.name) with Student ID is \(element.id) is deleted successfully")
                    }
                }
            }else{
                print("Entered student ID is in wrong format. Please enter Student ID in numbers only")
            }
            
            if(flag == false){
                print("The entered student ID does not exist. Please enter the correct Student ID")
            }
        }else{
             print("No students are available")
        }
    }
}
