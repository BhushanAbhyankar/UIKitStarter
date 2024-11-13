//
//  NetworkManager.swift
//  FirstUIKitProj
//
//  Created by Bhushan Abhyankar on 11/11/2024.
//

import Foundation
protocol NetworkManagerDelegate{
    func didRecieveData<T:Decodable>(data:T)
    func didReceiveError(error:Error)
}

class NetworkManager{
    var delegate:NetworkManagerDelegate?
    
    func getDataFromAPIUsingProtocolDelegate<T:Decodable>(urlString:String, modelType:T.Type) {
        guard let url = URL(string: urlString) else{
            return
        }
        let task = URLSession.shared.dataTask(with: url) {  data, response, error in
            if let error = error{
                print(error.localizedDescription)
                self.delegate?.didReceiveError(error: error)
                return
            }
            guard let response =  response as? HTTPURLResponse else{ return }
            guard (200...299).contains(response.statusCode) else{ return}
            
            guard let data = data else{ return }
            
            do{
                let parsedData =  try JSONDecoder().decode(modelType.self, from: data)
                //print("parsedData = \(parsedData)")
                self.delegate?.didRecieveData(data: parsedData)

            }catch{
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    
    
    func getDataFromAPI(completion: @escaping ([UserResponse]) -> Void) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else{
            return
        }
        let task = URLSession.shared.dataTask(with: url) {  data, response, error in
            if let error = error{
                print(error.localizedDescription)
                return
            }
            guard let response =  response as? HTTPURLResponse else{ return }
            guard (200...299).contains(response.statusCode) else{ return}
            
            guard let data = data else{ return }
            
            do{
                let parsedData =  try JSONDecoder().decode([UserResponse].self, from: data)
                print("parsedData = \(parsedData)")
                completion(parsedData)

            }catch{
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}
