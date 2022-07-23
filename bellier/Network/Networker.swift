//
//  Networker.swift
//  bellier
//
//  Created by Misha Causur on 22.07.2022.
//

import Foundation
import Combine

final class Networker {
    typealias completion = (Result<String, NetworkError>) -> Void
    
    func titleRequest(url: String, completion: @escaping completion) async {
        guard let url = URL(string: url) else { completion(.failure(.badURL)); return }
        do {
            let data = try await URLSession.shared.data(from: url)
            let title = try JSONDecoder().decode(String.self, from: data.0)
            completion(.success(title))
        } catch {
            completion(.failure(.badRequest))
        }
    }
    
    func descriptionRequest<T: Decodable>(urls: [String]) async -> AnyPublisher<[T], Error> {
        let urls = urls.compactMap { URL.init(string: $0) }
        return URLSession.shared.dataTaskPublisher(for: urls[0])
            .map { $0.0 }
            .decode(type: [T].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
