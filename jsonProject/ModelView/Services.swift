//
//  Services.swift
//  jsonProject
//
//  Created by Abdoulaye Aliou SALL on 15/02/2023.
//

import Foundation

class UserServices: ObservableObject {
    @Published var userList:[User] = []
//    let prefixeUrl = "http://localhost:3000/api"
    
    func loadUserList(){
        guard let userListApiUrl = URL(string: "http://localhost:3000/api/users") else { return }
        let urlSession = URLSession.shared
        
        var request = URLRequest(url: userListApiUrl)
        request.httpMethod = "GET"
        
        let dataTask = urlSession.dataTask(with: request) {(data, response, error) in
            guard error == nil,
                  let httpResponse = response as? HTTPURLResponse,
                  let userListJsonData = data else{
                return
            }
            if httpResponse.statusCode >= 200 && httpResponse.statusCode < 300{
                if let downloadedUserList = try? JSONDecoder().decode([User].self, from: userListJsonData){
                    DispatchQueue.main.async {
                        self.userList = downloadedUserList
                    }
                }
            }
        }
        dataTask.resume()
    }

    
    func sendPostData(user:User){
        
        guard let url = URL(string: "http://localhost:3000/api/users") else { return  }
                
                // create a URLRequest with POST method and JSON content type
                var request = URLRequest(url: url)
                request.httpMethod = "POST"
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                print("voila l'objet\(user)")

                // encode the user object as JSON
                let encoder = JSONEncoder()
                let jsonData = try! encoder.encode(user)
//                print("je me suis bien encoder")
                
                // set the JSON data as the HTTP body of the request
                request.httpBody = jsonData
                
                // send the HTTP request and handle the response
                let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                    // handle the response here
                    if let error = error {print("Error: \(error.localizedDescription)")
                    }else if let data = data, let response = response as? HTTPURLResponse {
                        print("Status code: \(response.statusCode)")
                        print("Response data: \(data) ?? ")
                    }
                }
                task.resume()

    }
}

