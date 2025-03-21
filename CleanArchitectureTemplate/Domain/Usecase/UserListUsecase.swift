//
//  UserListUsecase.swift
//  CleanArchitectureTemplate
//
//  Created by N4225 on 3/20/25.
//

import Foundation

protocol UserListUsecaseProtocol{
    func fetchUser(query:String, page:Int) async -> Result<UserListItem, NetworkError>
    func getFavoriteUsers() -> Result<[UserListItem], CoreDataError>
    func saveFavoriteUser(user:UserListItem)  -> Result<Bool,CoreDataError>
    func deleteFavoritreUser(userId:Int) ->Result<Bool, CoreDataError>
    
    // 유저리스트 - 즐겨찾기 포함된 유저인지
    func checkFavoriteState(fetchUsers:[UserListItem],favoriteUsers:[UserListItem]) -> [(user:UserListItem,isFavorite:Bool)]
    
    // 배열 -> Dictionary [초성:[유저리스트]]
    func convertListToDictionary(favoriteUsers:[UserListItem]) -> [String:[UserListItem]]
}

public struct UserListUsecase:UserListUsecaseProtocol{
    
    private let repository:UserRepositoryProtocol
    public init(repository: UserRepositoryProtocol) {
        self.repository = repository
    }
    func fetchUser(query: String, page: Int) async -> Result<UserListItem, NetworkError> {
        await repository.fetchUser(query: query, page: page)
    }
    
    func getFavoriteUsers() -> Result<[UserListItem], CoreDataError> {
        repository.getFavoriteUsers()
    }
    
    func saveFavoriteUser(user: UserListItem) -> Result<Bool, CoreDataError> {
        repository.saveFavoriteUser(user: user)
    }
    
    func deleteFavoritreUser(userId: Int) -> Result<Bool, CoreDataError> {
        repository.deleteFavoritreUser(userId: userId)
    }
    func checkFavoriteState(fetchUsers: [UserListItem], favoriteUsers: [UserListItem]) -> [(user: UserListItem, isFavorite: Bool)] {
        
        let favoriteSet = Set(favoriteUsers)
        
        return fetchUsers.map { user in
            if favoriteSet.contains(user){
                return (user:user, isFavorite:true)
            }else{
                return (user:user, isFavorite:false)
        
            }
        }
    }
    func convertListToDictionary(favoriteUsers: [UserListItem]) -> [String : [UserListItem]] {
        favoriteUsers.reduce(into:[String : [UserListItem]]()) { dict, user in
            if let firstString = user.login.first {
                let key = String(firstString).uppercased()
                dict[key, default: []].append(user)
            }
        }
    }
    
}
