//
//  APIService.swift
//  CleanArchitectureTemplate
//
//  Created by N4225 on 3/20/25.
//

import Foundation

protocol APIServiceProtocol{
    
}


class APIService:APIServiceProtocol{
    
//    func request<T: Decodable>(url: String, completion: @escaping (Result<T, Error>) -> Void) {
//        guard let url = URL(string: url) else {
//            completion(.failure(NetworkError.invalidURL))
//            return
//        }
//
//        let task = URLSession.shared.dataTask(with: url) { data, response, error in
//            if let error = error {
//                completion(.failure(error))
//                return
//            }
//
//            guard let data = data else {
//                completion(.failure(NetworkError.noData))
//                return
//            }
//
//            do {
//                let decodedData = try JSONDecoder().decode(T.self, from: data)
//                completion(.success(decodedData))
//            } catch {
//                completion(.failure(error))
//            }
//        }
//        task.resume()
//    }
}

