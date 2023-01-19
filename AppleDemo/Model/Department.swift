//
//  Department.swift
//  AppleDemo
//
//  Created by Goutham Boya on 19/01/23.
//

import Foundation


class Department: Decodable {
    var employees: [Employee]
    
    init(employees: [Employee]) {
        self.employees = employees
    }
  
}
