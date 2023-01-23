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
    URLSession.shared.dataTask(with: request) { (data, response, error) in
        do {
            if let error = error{
                print(error)
            }
            if let data = data{
                let decodedEmpArray = try JSONDecoder().decode([Employee].self, from: data)
                arrOfEmployees = decodedEmpArray
//                print(arrOfEmployees)
////                arrOfEmployees.append(contentsOf: decodedEmpArray)
//                for i in arrOfEmployees{
//                    print(i.title)
//                    print(i.id)
//                }
            }
        }catch{
            print(error)
        }
    }.resume()
    return arrOfEmployees
}
  
//
//let url = URL(string: "https://jsonplaceholder.typicode.com/todos")
//
////   var statusCodee: Int?
//   var arrOfEmployees: [Employee] = []
////   var status = false
//
//   func callAPI(userCompletionHandler: @escaping (String) -> Void){
//
//       guard let rUrl = url else { return}
//
//       var request = URLRequest(url: rUrl)
//
//       request.httpMethod = "GET"
//
//       let urlSession = URLSession.shared
//
//       let task = urlSession.dataTask(with: request,completionHandler: { data, response, error in
//
//           if let data = data, let dataString = String(data: data, encoding: .utf8) {
//
//               print("Response\n \(dataString)")
////               arrOfEmployees.append(<#T##newElement: Employee##Employee#>)
//           }
//       })
//
//       task.resume()
//
//   }
