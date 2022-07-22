//
//  Networker.swift
//  bellier
//
//  Created by Misha Causur on 22.07.2022.
//

import Foundation

final class Networker {
    typealias completion = (Result<String, NetworkError>) -> Void
    
    func request(url: String, completion: @escaping completion) async {
        guard let url = URL(string: url) else { completion(.failure(.badURL)); return }
        do {
            let data = try await URLSession.shared.data(from: url)
            let title = try JSONDecoder().decode(String.self, from: data.0)
            completion(.success(title))
        } catch {
            completion(.failure(.badRequest))
        }
       
    }
}
