//
//  NetworkManager.swift
//  CleanArchitectureTemplate
//
//  Created by N4225 on 3/20/25.
//

import Foundation
import Alamofire


public protocol NetworkManagerProtocol{
    func fetchData<T:Decodable>(url:String,method:HTTPMethod, parameters:Parameters?) async -> Result<T,NetworkError>
}

//GitHub access token
//a06e00c32144c78121c227ad6a244d0127dd03d9

public class NetworkManager{
    private var session:SessionProtocol
    
    init(session: SessionProtocol) {
        self.session = session
    }
    private let headers:HTTPHeaders = {
        let tokenHeader = HTTPHeader(name: "Authorization", value: "Bearer a06e00c32144c78121c227ad6a244d0127dd03d9")
        return HTTPHeaders([tokenHeader])
    }()
    func fetchData<T:Decodable>(url:String,method:HTTPMethod, parameters:Parameters?) async -> Result<T,NetworkError>{
        guard let url  = URL(string: url) else {
            return .failure(.urlError)
        }
        let result = await session.request(url, method: method, parameters: parameters, headers: headers).serializingData().response
        
        if let error = result.error {
            return .failure(.requestFailed(error.localizedDescription))
        }
        guard let data = result.data else { return .failure(.dataNil)}
        guard let response = result.response else { return .failure(.invalidResponse)}
        
        if 200..<400 ~= response.statusCode {
            do{
                let data = try JSONDecoder().decode(T.self, from: data)
                return .success(data)

            }catch{
                return .failure(.failToDecode(error.localizedDescription))
            }
        }else{
            return .failure(.serverError(response.statusCode))
        }
    }
}
