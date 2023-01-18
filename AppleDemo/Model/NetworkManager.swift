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
            
            let decoder = JSONDecoder()
            let employer = employeData.data(using: .utf8)!
            let employer1 = try decoder.decode(Employee.self, from: employer)
            print(employer1.title)
            
            arrOfEmployees[1].title = employer1.title
            
            print(arrOfEmployees)

//            for i in arrOfEmployees {
//                for (key, value) in employer1 {
//                    switch key {
//                    case "Title":
//                        break
//                    case "Id":
//                        break
//                    default:
//                        break // Ignore unknown keys
//                    }
//                }
//            }
            
//            for arr in arrOfEmployees {
//                arr.id = employer1.id
//                arr.title = employer1.title
//                arr.userId = employer1.userId
//                arr.completed = employer1.completed
//                print(arr.title)
//            }
            
            }catch{
            print(error)
        }
        
    }.resume()

    return arrOfEmployees
}

let employeData = """
{
"userId": 1,
"id": 2,
"title": "Something that never change",
"completed": false
}
"""

