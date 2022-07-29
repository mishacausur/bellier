//
//  APIClient.swift
//  bellier
//
//  Created by Misha Causur on 29.07.2022.
//

import Foundation

public actor APIClient {
    
    private let session: URLSession
    private let baseURL: URL
    
    public init(baseURL: URL, configuration: URLSessionConfiguration = .default, delegate: String? = nil) {
        self.baseURL = baseURL
        self.session = URLSession(configuration: configuration)
    }
}

extension APIClient {
    
    public func send<T: Decodable>(_ request: Request<T>) async throws -> T {
        try await send(request, decode)
    }
    
    public func send(_ request: Request<Void>) async throws -> Void {
        try await send(request, { _ in () })
    }
    
    private func send<T>(_ request: Request<T>, _ decode: @escaping (Data) async throws -> T) async throws -> T {
        let urlRequest = try await makeURLRequest(for: request)
    }
    
    func makeRequest(url: URL, method: String, body: Encodable?) async throws -> URLRequest {
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = headers
        request.httpMethod = method
        if let body = body {
            request.httpBody = try await Task.detached { [encoder] in
                try encoder.encode(AnyEncodable(value: body))
            }.value
            if request.value(forHTTPHeaderField: "Content-Type") == nil {
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            }
        }
        if request.value(forHTTPHeaderField: "Accept") == nil {
            request.setValue("application/json", forHTTPHeaderField: "Accept")
        }
        return request
    }
}
