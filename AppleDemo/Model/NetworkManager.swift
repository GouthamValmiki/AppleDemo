//
//  NetworkManager.swift
//  AppleDemo
//
//  Created by Goutham Boya on 04/01/23.
//

import Foundation

/*func getUserData() -> [Employee]  {
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
                print(arrOfEmployees)
                arrOfEmployees.append(contentsOf: decodedEmpArray)
                for i in arrOfEmployees{
                    print(i.title)
                    print(i.id)
                }
            }
        }catch{
            print(error)
        }
    }.resume()
    return arrOfEmployees
}*/


//let url = URL(string: "https://jsonplaceholder.typicode.com/todos")
//
//   var arrOfEmployees: [Employee] = []
//   func callAPI(userCompletionHandler: @escaping (Bool) -> ()){
//       guard let rUrl = url else { return}
//       var request = URLRequest(url: rUrl)
//       request.httpMethod = "GET"
//       URLSession.shared.dataTask(with: request,completionHandler: { data, response, error in
//           if let data = data, let dataString = String(data: data, encoding: .utf8) {
//               print("Response\n \(dataString)")
//           }
//       })
//
//       .resume()
//   }

let url = URL(string: "https://jsonplaceholder.typicode.com/todos")
var arrOfEmployees: [Employee] = []
var statusCodee: Int?
var status = false

func getUserData(userCompletionHandler: @escaping (Bool) -> ()){
    guard let rUrl = url else { return}
    var request = URLRequest(url: rUrl)
    request.httpMethod = "GET"
    request.addValue("application/json", forHTTPHeaderField: "Accept")
//    let postStr = "userId=300&title=My urgent task&completed=false"
//    request.httpBody = postStr.data(using: String.Encoding.utf8)
    let urlSession = URLSession.shared
    let task = urlSession.dataTask(with: request,completionHandler: { data, response, error in
        if let data = data, let dataString = String(data: data, encoding: .utf8) {
            print("Response\n \(dataString)")
        }
        if let response = response{
            print(response)
        }
        if let error = error{
            print(error)
        }
        if let httpResponse = response as? HTTPURLResponse {
            print("statusCode: \(httpResponse.statusCode)")
            if httpResponse.statusCode == 200{
                status = true
            }else if httpResponse.statusCode == 202{
                status = true
                userCompletionHandler(status)
            }else{
                status = false
                userCompletionHandler(status)
            }
        }
    })
    task.resume()
}

