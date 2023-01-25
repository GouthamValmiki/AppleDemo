//
//  NetworkManager.swift
//  AppleDemo
//
//  Created by Goutham Boya on 04/01/23.
//

import Foundation

class NetworkManager {
    func getUserData(userCompletionHandler: @escaping (Bool) -> ()) {
        let url = URL(string: "https:jsonplaceholder.typicode.com/todos")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            do {
                if let error = error{
                    print(error)
                    userCompletionHandler(false)
                }
                if let data = data{
                    let decodedEmpArray = try JSONDecoder().decode([Employee].self, from: data)
                    userCompletionHandler(!decodedEmpArray.isEmpty)
                }
            }catch{
                print(error)
            }
        }.resume()
    }
}
