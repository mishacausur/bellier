//
//  Request.swift
//  bellier
//
//  Created by Misha Causur on 29.07.2022.
//

import Foundation

public struct Request<Response> {
    
    var method: String
    var url: String
    var query: [String: String]?
    var body: Encodable?
}

extension Request {
    
    public static func get(_ url: String, query: [String: String]? = nil) -> Request {
        Request(method: "GET", url: url, query: query)
    }
    
    public static func post(_ url: String, body: Encodable? = nil) -> Request {
        Request(method: "POST", url: url, body: body)
    }
}
