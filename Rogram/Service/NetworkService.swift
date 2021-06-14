//
//  NetworkService.swift
//  Rogram
//
//  Created by David Jeong on 6/13/21.
//

import Combine
import Foundation

protocol NetworkService {
    associatedtype Model: Decodable
    var baseURL: String { get }
}

enum NetworkError: Error {
    case invalidURL
}

// MARK: - List

extension NetworkService {

    func list() -> AnyPublisher<[Model], Error> {
        list(url: baseURL)
    }

    func list(url: String) -> AnyPublisher<[Model], Error> {
        fetch(url: url)
    }
}

// MARK: - Private Helpers

extension NetworkService {

    private func fetch<T: Decodable>(url: URL) -> AnyPublisher<T, Error> {
        NetworkClient.get(request: URLRequest(url: url))
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }

    private func fetch<T: Decodable>(url: String) -> AnyPublisher<T, Error> {
        guard let url = URL(string: url) else {
            return Fail(error: NetworkError.invalidURL).eraseToAnyPublisher()
        }

        return fetch(url: url)
    }
}
