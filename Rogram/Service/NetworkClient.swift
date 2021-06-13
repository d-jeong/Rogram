//
//  NetworkRequester.swift
//  Rogram
//
//  Created by David Jeong on 6/13/21.
//

import Combine
import Foundation

class NetworkClient {

    static func get(request: URLRequest) -> AnyPublisher<Data, URLError> {
        URLSession.shared.dataTaskPublisher(for: request)
            .map(\.data)
            .eraseToAnyPublisher()
    }
}
