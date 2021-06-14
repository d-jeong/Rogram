//
//  MockPhotoService.swift
//  Rogram
//
//  Created by David Jeong on 6/13/21.
//

import Combine

class MockPhotoService: PhotoServiceProvidable {
    var mockList: () -> AnyPublisher<[Photo], Error> = {
        Fail(error: NetworkError.invalidURL).eraseToAnyPublisher()
    }

    func list() -> AnyPublisher<[Photo], Error> {
        mockList()
    }
}
