//
//  PhotoService.swift
//  Rogram
//
//  Created by David Jeong on 6/13/21.
//

import Combine

protocol PhotoServiceProvidable {
    func list() -> AnyPublisher<[Photo], Error>
}

class PhotoService: NetworkService, PhotoServiceProvidable {
    typealias Model = Photo

    let baseURL = "https://jsonplaceholder.typicode.com/album/1/photos"
}
