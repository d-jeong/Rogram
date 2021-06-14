//
//  PhotosEnvironment.swift
//  Rogram
//
//  Created by David Jeong on 6/13/21.
//

struct PhotosEnvironment {

    let service: PhotoServiceProvidable

    init(service: PhotoServiceProvidable = PhotoService()) {
        self.service = service
    }
}
