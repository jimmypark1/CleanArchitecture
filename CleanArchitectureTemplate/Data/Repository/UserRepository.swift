//
//  UserRepository.swift
//  CleanArchitectureTemplate
//
//  Created by N4225 on 3/21/25.
//

import Foundation

public struct UserRepository:UserRepositoryProtocol{
    
    private let coreData:UserCoreDataProtocol, network:UserNetworkProtocol
    
    init(coreData:UserCoreDataProtocol, network:UserNetworkProtocol){
        self.coreData = coreData
        self.network = network
    }
    
    public func fetchUser(query: String, page: Int) async -> Result<UserListItem, NetworkError> {
        return await network.fetchUsers(query: query, page: page)
    }
    
    public func getFavoriteUsers() -> Result<[UserListItem], CoreDataError> {
        return coreData.getFavoriteUsers()
    }
    
    public func saveFavoriteUser(user: UserListItem) -> Result<Bool, CoreDataError> {
        return coreData.saveFavoriteUser(user: user)
    }
    
    public func deleteFavoritreUser(userId: Int) -> Result<Bool, CoreDataError> {
        return coreData.deleteFavoritreUser(userId: userId)
    }
    
    
}
