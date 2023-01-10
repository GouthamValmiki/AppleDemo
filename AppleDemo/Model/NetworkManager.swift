//
//  NetworkManager.swift
//  AppleDemo
//
//  Created by Goutham Boya on 04/01/23.
//

import Foundation


func getUserData() -> [Employee]  {

    let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
    
    var arrOfEmployees : [Employee] = []
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    
    let session = URLSession.shared
    session.dataTask(with: request) { (data, response, error) in
        
        do {
            //if let data = data,let json = try? JSONSerialization.jsonObject(with: data, options: []) {
            //print(json)
            if error == nil{
                let user = try JSONDecoder().decode([Employee].self, from: data!)
                
                for arr in user{
                    print(arr.userId)
                }
                
            }
        }catch{
            print(error)
        }
        
    }.resume()
    
    return arrOfEmployees
}


//var arr : UInt32[] = [32,4,123,4,5,2];
//
//let data = NSData(bytes: arr, length: arr.count * sizeof(UInt32))
//
//println(data)
