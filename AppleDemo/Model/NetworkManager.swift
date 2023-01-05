//
//  NetworkManager.swift
//  AppleDemo
//
//  Created by Goutham Boya on 04/01/23.
//

import Foundation


 func ProjectManager(){
    let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
    
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    
    let session = URLSession.shared
    session.dataTask(with: request) { (data, response, error) in

        do {
            if let data = data,let json = try? JSONSerialization.jsonObject(with: data, options: []) {
                print(json)
//          if error == nil{
//              self.DataManager = try JSONDecoder().decode([Data].self, from: data!)
            }
        }catch{
            print(error)
        }
        
    }.resume()
}
