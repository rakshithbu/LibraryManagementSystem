//
//  main.swift
//  LibraryManagementSystem
//
//Created by Rakshith C0776530 on 2020-02-28.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import Foundation

var bookList = [Books]()
var studentList = [Student]()
var admin = Admin()
var studentFunctionality = StudentFunctionality()
var choice = 0

print("Welcome to Lambton College Library Management system")

// to display admin option menu

func adminOptions(){
    
    print("Please enter 1 for adding books")
    print("Please enter 2 for student registration")
    print("Please enter 3 for removing book from stock by ISBN")
    print("Please enter 4 for updating number of copies available based on ISBN")
    print("Please enter 5 to delete student")
    print("Please enter 6 to go back to home menu")
    print("Please enter 7 to exit the menu")
   
    
    let adminChoice = Int(readLine()!)
    
    if(adminChoice != nil){
        if(adminChoice == 1){
             admin.createBookList(books: bookList)
            adminOptions()
            
        }else if(adminChoice == 2){
             studentFunctionality.createStudentList(students: &studentList)
             adminOptions()
             
        }else if(adminChoice == 3){
            admin.removeBookFromStockByISBN(books: &bookList)
             adminOptions()
            
        }else if(adminChoice == 4){
            admin.updateNoOfCopiesAvailableByISBN(books: &bookList)
             adminOptions()
             
        }else if(adminChoice == 6){
            homeMenuOptions()
        }else if(adminChoice == 5){
            admin.deleteStudentsFromTheList(students: &studentList)
            adminOptions()
        }
        else if(adminChoice == 7){
            print("You have successfully exited the system")
        
        }else{
            print("Please enter valid option 1,2,3,4,5,6 from the above menu")
            print("--------------")
             adminOptions()
        }
    }else{
        print("Please enter only number for selecting menu")
              print("--------------")
              adminOptions()
    }
    
}

// to display student option menu
func studentOptions(){
    
        print("Please enter 1 for Borrowing books")
                  print("Please enter 2 for returning the book")
                  print("Please enter 3 for print copies")
                  print("Please enter 4 for loading amount into your Lambton card for printing")
                  print("Please enter 5 to go back to home menu")
           
    let studentChoice = Int(readLine()!)
           
    if(studentChoice != nil){
        if(studentChoice == 1){
                   studentFunctionality.borrowBook(students: &studentList, books: &bookList)
                studentOptions()
                   
               }else if(studentChoice == 2){
                    studentFunctionality.returnBook(students: &studentList, books: &bookList)
                studentOptions()
               
               }else if(studentChoice == 3){
                   studentFunctionality.usePrinter(students: &studentList)
                studentOptions()
                   
               }else if(studentChoice == 4){
                   studentFunctionality.updateBalanceInLambtonCard(students: &studentList)
                studentOptions()
               }
                else if(studentChoice == 5){
           homeMenuOptions()
        }else if(studentChoice == 6){
            print("You have successfully exited the system")
               }else{
                print("Please enter valid option 1,2,3,4,5,6 from the above menu")
                print("--------------")
                studentOptions()
        }
    }else{
        print("Please enter only number for selecting menu")
        print("--------------")
        studentOptions()
    }
}


// to display main menu
func homeMenuOptions(){
    
    print("Please enter 1 for admin login")

    print("Please enter 2 for student login")
    
     print("Please enter 3 to exit")
    let choice : Int?
    
    choice =  Int(readLine()!)
    
    if(choice != nil){
        if(choice == 1){
            adminOptions()
           
        } else if(choice == 2){
            
              studentOptions()
         
        }else if(choice == 3){
            print("You have successfully exited the system")
        }else{
            print("Please enter number 1,2,3 from the above menu for proceeding further")
                   print("--------------")
                   homeMenuOptions()
        }
    }else{
        print("Please enter only number for selecting menu")
        print("--------------")
        homeMenuOptions()
    }
}

homeMenuOptions()







