//
//  Data.swift
//  AppleDemo
//
//  Created by Goutham Boya on 05/01/23.
//

import Foundation

class Employee: Codable {
    
    let userId: Int
    let id : Int
    let title : String
    let completed : Bool
    
    init(userId: Int, id: Int, title: String, completed: Bool) {
        self.userId = userId
        self.id = id
        self.title = title
        self.completed = completed
    }
    
    
    
    
    
    
}
