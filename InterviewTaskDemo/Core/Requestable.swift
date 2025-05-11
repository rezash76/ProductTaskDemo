//
//  Requestable.swift
//  InterviewTaskDemo
//
//  Created by Reza Sharifi on 5/11/25.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
    case patch = "PATCH"
}

protocol Requestable {
    
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String]? { get }
    var parameters: [String: Any]? { get set}
}

extension Requestable {
    var method: HTTPMethod { .get }
    var headers: [String: String]? {
        ["Content-Type": "application/json"]
    }
    
    var parameters: [String: Any]? {
        switch method {
        case .get, .delete:
            return nil
        default:
            return nil
        }
    }
}


