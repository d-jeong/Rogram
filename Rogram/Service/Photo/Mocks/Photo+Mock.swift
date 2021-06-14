//
//  Photo+Mock.swift
//  Rogram
//
//  Created by David Jeong on 6/13/21.
//

import Foundation

extension Photo {
    static let mock = Photo(id: 1, albumId: 5, title: "Mock Photo", url: "ro.co", thumbnailUrl: "ro.co")
    static let mockList: [Photo] = [.mock, .mock, .mock]
}
