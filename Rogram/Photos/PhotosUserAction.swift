//
//  PhotosUserAction.swift
//  Rogram
//
//  Created by David Jeong on 6/13/21.
//

import ComposableArchitecture

enum PhotosAction {
    case selectPhoto(Photo)
    case dismissModal
    case loadPhotos
    case didLoadPhotos(Result<[Photo], Error>)
}

extension PhotosAction {
    static let reducer = Reducer<PhotosState, PhotosAction, PhotosEnvironment> { state, action, environment in
        switch action {
        case .selectPhoto(let photo):
            state.presentationMode = .presenting(photo)
            return .none

        case .dismissModal:
            state.presentationMode = .notPresenting
            return .none

        case .loadPhotos:
            state.isLoading = true
            return environment.service.list()
                .receive(on: DispatchQueue.main)
                .catchToEffect()
                .map(PhotosAction.didLoadPhotos)

        case .didLoadPhotos(.success(let photos)):
            state.isLoading = false
            state.photos = photos
            return .none

        case .didLoadPhotos(.failure):
            state.isLoading = false
            return .none
        }
    }
}
