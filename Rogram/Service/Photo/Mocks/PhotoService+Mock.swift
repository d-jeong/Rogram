//
//  MockPhotoService.swift
//  Rogram
//
//  Created by David Jeong on 6/13/21.
//

import Combine

class MockPhotoService: PhotoServiceProvidable {
    var mockList: [Photo]?

    func list() -> AnyPublisher<[Photo], Error> {
        guard let mockList = mockList else {
            return Fail(error: NetworkError.invalidURL).eraseToAnyPublisher()
        }

        return Just(mockList).setFailureType(to: Error.self).eraseToAnyPublisher()
    }
}
