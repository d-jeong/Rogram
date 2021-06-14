//
//  PhotosView.swift
//  Rogram
//
//  Created by David Jeong on 6/13/21.
//

import ComposableArchitecture
import SwiftUI

struct PhotosView: View {
    let store = Store(initialState: PhotosState(),
                      reducer: PhotosAction.reducer,
                      environment: PhotosEnvironment())

    var body: some View {
        WithViewStore(store) { store in
            if store.photos.isEmpty {
                emptyView
            } else {
                listView
            }
        }
    }

    var listView: some View {
        WithViewStore(store) { store in
            List(store.photos, id: \.id) { photo in
                PhotoRowView(photo: photo)
                    .onTapGesture {
                        store.send(.selectPhoto(photo))
                    }
            }
            .sheet(
                item: store.binding(get: { $0.presentedPhoto }, send: .dismissModal),
                content: { PhotoDetailView(photo: $0) }
            )
        }
    }

    var emptyView: some View {
        WithViewStore(store) { store in
            VStack(spacing: 16) {
                Text("No results found 🥶")
                    .font(.system(size: 26))

                if store.isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                } else {
                    Button("Load Photos") {
                        store.send(.loadPhotos)
                    }
                }
            }
        }
    }
}

