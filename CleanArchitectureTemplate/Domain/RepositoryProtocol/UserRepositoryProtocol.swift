//
//  UserRepositoryProtocol.swift
//  CleanArchitectureTemplate
//
//  Created by N4225 on 3/20/25.
//

import Foundation

public protocol UserRepositoryProtocol{
    func fetchUser(query:String, page:Int) async -> Result<UserListItem, NetworkError>
    func getFavoriteUsers() -> Result<[UserListItem], CoreDataError>
    func saveFavoriteUser(user:UserListItem)  -> Result<Bool,CoreDataError>
    func deleteFavoritreUser(userId:Int) ->Result<Bool, CoreDataError>

}
