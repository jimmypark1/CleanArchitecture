//
//  MockUserRepository.swift
//  CleanArchitectureTemplateTests
//
//  Created by N4225 on 3/21/25.
//

import Foundation
@testable import CleanArchitectureTemplate

public struct MockUserRepository:UserRepositoryProtocol{
    public func fetchUser(query: String, page: Int) async -> Result<CleanArchitectureTemplate.UserListItem, CleanArchitectureTemplate.NetworkError> {
        .failure(.dataNil)
    }
    
    public func getFavoriteUsers() -> Result<[CleanArchitectureTemplate.UserListItem], CleanArchitectureTemplate.CoreDataError> {
        .failure(.entityNotFound(""))

    }
    
    public func saveFavoriteUser(user: CleanArchitectureTemplate.UserListItem) -> Result<Bool, CleanArchitectureTemplate.CoreDataError> {
        .failure(.saveError(""))
    }
    
    public func deleteFavoritreUser(userId: Int) -> Result<Bool, CleanArchitectureTemplate.CoreDataError> {
        .failure(.deleteError(""))
    }
    
    
}
