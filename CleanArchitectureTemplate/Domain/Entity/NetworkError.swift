//
//  NetworkError.swift
//  CleanArchitectureTemplate
//
//  Created by N4225 on 3/20/25.
//

import Foundation

public enum NetworkError:Error{
    case urlError
    case invalidResponse
    case failToDecode(String)
    case dataNil
    case serverError(Int)
    case requestFailed(String)
    
    public var descriotion:String{
        switch self{
        case .urlError:
            "URL이 올바르지 않습니다."
        case .invalidResponse:
            "응답값이 유효하지 않습니다."
        case .failToDecode(let descriotion):
            "디코딩 에러 \(descriotion)"
        case .dataNil:
            "데이타가 없습니다."
        case .serverError(let statusCode):
            "서버에러 \(statusCode)"
        case .requestFailed(let message):
            "서버요청 실패 \(message)"
        }
        
    }
}
