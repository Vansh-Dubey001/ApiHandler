//
//  FetchData.swift
//  basic app
//
//  Created by Vansh Dubey on 05/06/23.
//

import Foundation
import UIKit

class FetchData{
    
         func fetchData(completion : @escaping (Result<[DataModel],Error>)->()){
             let url="https://pokeapi.co/api/v2/\(ApiPath.base.rawValue)"
             let req = URLRequest(url: URL(string: url)!)
            URLSession.shared.dataTask(with: req){
                (data,resp,err) in
                if let err = err{
                    completion(.failure(err))
                    return
                }
                do{
                    let data = try JSONDecoder().decode(jsonData.self, from: data!)
                    completion(.success(data.results!))
                }catch let jsonErr{
                    completion(.failure(jsonErr))
                }
            }.resume()
        }
}
