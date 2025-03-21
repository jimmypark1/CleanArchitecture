//
//  UserNetwork.swift
//  CleanArchitectureTemplate
//
//  Created by N4225 on 3/20/25.
//

import Foundation

public protocol UserNetworkProtocol{
    func fetchUsers(query:String, page:Int) async -> Result<UserListItem, NetworkError>
}


final public class UserNetwork:UserNetworkProtocol{
    private let manager:NetworkManagerProtocol
    init(manager: NetworkManagerProtocol) {
        self.manager = manager
    }
    
    public func fetchUsers(query:String, page:Int) async -> Result<UserListItem, NetworkError>{
        let url = "https://api.github.com/search/users?q=\(query)&page=\(page)"
        
        return await manager.fetchData(url: url, method: .get, parameters: nil)
    }
}
