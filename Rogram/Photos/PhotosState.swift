//
//  PhotosState.swift
//  Rogram
//
//  Created by David Jeong on 6/13/21.
//

struct PhotosState: Equatable {
    enum PresentationMode: Equatable {
        case presenting(Photo)
        case notPresenting
    }

    var photos: [Photo] = []
    var presentationMode: PresentationMode = .notPresenting
    var isLoading = false

    var presentedPhoto: Photo? {
        switch presentationMode {
        case .notPresenting:
            return nil
        case .presenting(let photo):
            return photo
        }
    }
}
