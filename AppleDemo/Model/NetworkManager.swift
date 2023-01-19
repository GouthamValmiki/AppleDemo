//
//  NetworkManager.swift
//  AppleDemo
//
//  Created by Goutham Boya on 04/01/23.
//

import Foundation


func getUserData() -> [Employee]  {
    let url = URL(string: "https://jsonplaceholder.typicode.com/todos")!

    let arrOfEmployees: [Employee] = []

    
    var request = URLRequest(url: url)
    request.httpMethod = "GET"

    let session = URLSession.shared
    session.dataTask(with: request) { (data, response, error) in
        
        do {
            
            if let data = data,let json = try? JSONSerialization.jsonObject(with: data, options: []) {
                print(json)
            }
            if error == nil{
                let user = try JSONDecoder().decode([Employee].self, from: data ?? Data())
                print(user)
            }
                    
                    //            let decoder = JSONDecoder()
                    //            let employer = employeData.data(using: .utf8)!
                    //            let employer1 = try decoder.decode(Employee.self, from: employer)
                    ////            print(employer1.title)
                    //            arrOfEmployees[0].title = employer1.title
                    //            print(arrOfEmployees)
                    
                }catch{
                    print(error)
                }
                
            }.resume()
            
            return arrOfEmployees
        }
        
//        let employeData = """
//{
//"userId": 1,
//"id": 2,
//"title": "Something that never change",
//"completed": false
//}
//"""
