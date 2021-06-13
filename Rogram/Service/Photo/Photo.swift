//
//  Photo.swift
//  Rogram
//
//  Created by David Jeong on 6/13/21.
//

import Foundation

struct Photo: Decodable {
    let id: Int
    let albumId: Int
    let title: String
    let url: String
    let thumbnailUrl: String
}
