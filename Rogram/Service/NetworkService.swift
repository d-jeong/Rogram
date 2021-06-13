//
//  NetworkService.swift
//  Rogram
//
//  Created by David Jeong on 6/13/21.
//

import Foundation
import RxSwift

protocol NetworkService {
    associatedtype Model: Decodable
    var baseURL: String { get }
}

enum NetworkError: Error {
    case invalidURL
}

// MARK: - List

extension NetworkService {

    func list() -> Single<[Model]> {
        list(url: baseURL)
    }

    func list(url: String) -> Single<[Model]> {
        fetch(url: url)
    }
}

// MARK: - Private Helpers

extension NetworkService {

    private func fetch<T: Decodable>(url: URL) -> Single<T> {
        NetworkClient.get(request: URLRequest(url: url))
            .map { try JSONDecoder().decode(T.self, from: $0) }
            .asSingle()
    }

    private func fetch<T: Decodable>(url: String) -> Single<T> {
        guard let url = URL(string: url) else {
            return .error(NetworkError.invalidURL)
        }

        return fetch(url: url)
    }
}
