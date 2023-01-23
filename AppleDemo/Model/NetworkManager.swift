//
//  NetworkManager.swift
//  AppleDemo
//
//  Created by Goutham Boya on 04/01/23.
//

import Foundation

func getUserData() -> [Employee]  {
    
    let url = URL(string: "https://jsonplaceholder.typicode.com/todos")!
    
    var arrOfEmployees: [Employee] = []
    
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    
    let session = URLSession.shared
    session.dataTask(with: request) { (data, response, error) in
        
        do {
            if let error = error{
                print(error)
                return
            }
            if let data = data{
                let decodedData = try JSONDecoder().decode([Employee].self, from: data)
                arrOfEmployees.append(contentsOf: decodedData)
//                print(arrOfEmployees[1].completed)
                for employee in arrOfEmployees {
                    print(employee.userId)
                    print(employee.title)
                    print(employee.id)
                    print(employee.completed)
                }
                
                // let employeesDict = ["Department1": [Employee(userId: 1, id: 123, title: "i-exceed", completed: true)],
                //                                     "Department2": [Employee(userId: 9, id: 13, title: "exceed", completed: false)],]
                // for (_, value) in employeesDict {
                // arrOfEmployees.append(contentsOf: value)
                // print(arrOfEmployees)
                //
                //}
            }
            
        }catch{
            print(error)
        }
        
    }.resume()
    
    return arrOfEmployees
    
}
    
    



