//
//  NetworkError.swift
//  bellier
//
//  Created by Misha Causur on 22.07.2022.
//

import Foundation

enum NetworkError: Error {
    case badURL
    case badRequest
    case unauth
    case unknown
}
