//
//  Data.swift
//  AppleDemo
//
//  Created by Goutham Boya on 05/01/23.
//

import Foundation

class Employee: Decodable {

    var userId: Int
    var id : Int
    var title : String
    var completed : Bool


    init(userId: Int, id: Int, title: String, completed: Bool) {
        self.userId = userId
        self.id = id
        self.title = title
        self.completed = completed

    }

}

//class Department: Decodable{
//    var employee: [Employee]
//    
//    init(employee: [Employee]) {
//        self.employee = employee
//    }
//}
