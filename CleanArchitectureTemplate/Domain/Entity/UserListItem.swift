//
//  UserListItem.swift
//  CleanArchitectureTemplate
//
//  Created by N4225 on 3/20/25.
//

import Foundation

public struct UserListResult: Decodable{
    let totalcount:Int
    let incompleteResult:Bool
    let items:[UserListItem]
    
    enum CodingKeys: String, CodingKey {
        case totalcount = "total_count"
        case incompleteResult = "incomplete_results"
        case items
    }
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.totalcount = try container.decode(Int.self, forKey: .totalcount)
        self.incompleteResult = try container.decode(Bool.self, forKey: .incompleteResult)
        self.items = try container.decode([UserListItem].self, forKey: .items)
    }
}

public struct UserListItem :Decodable,Hashable {
    let id:Int
    let login:String
    let imageUrl:String
    
    enum CodingKeys: String,CodingKey {
        case id
        case login
        case imageUrl = "avatar_url"
    }
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.login = try container.decode(String.self, forKey: .login)
        self.imageUrl = try container.decode(String.self, forKey: .imageUrl)
    }
    public init(id: Int, login: String, imageUrl: String) {
        self.id = id
        self.login = login
        self.imageUrl = imageUrl
    }
}
