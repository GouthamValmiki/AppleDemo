//
//  NetworkManager.swift
//  AppleDemo
//
//  Created by Goutham Boya on 04/01/23.
//

import Foundation


func getUserData() -> [Employee]  {
    let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!

    var arrOfEmployees: [Employee] = []

    var request = URLRequest(url: url)
    request.httpMethod = "GET"

    let session = URLSession.shared
    session.dataTask(with: request) { (data, response, error) in

        do {
            if let data = data,let json = try? JSONSerialization.jsonObject(with: data, options: []) {
                print(json)

            }
            if error == nil{

                // let user = try JSONDecoder().decode([Employee].self, from: data!)
                //    print(user)

            }
        }catch{
            print(error)
        }

    }.resume()

    return arrOfEmployees
}

struct ArrayModel: Codable {
    var userid = 2
    var id = 2
    var title = ""
    var completed = ""
}

//if let _address = try? values.decode([Address].self, forKey: .address) {
//    address = _address
//} else {
//    address = []
//}
//
//func fetchCategoryInfo(completion: @escaping ([CategoryInfo]?) -> Void) {
//    let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
//    let task = URLSession.shared.dataTask(with: url) {
//        (data, response, error) in
//        let jsonDecoder = JSONDecoder()
//        if let data = data,
//            let categories = try? jsonDecoder.decode([CategoryInfo].self, from: data) {
//                completion(categories)
//            } else {
//                print("Nothing reutrned or Not decoded")
//                completion(nil)
//            }
//    }
//    task.resume()
//}
