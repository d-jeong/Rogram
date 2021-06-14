//
//  PhotosActionTests.swift
//  RogramTests
//
//  Created by David Jeong on 6/13/21.
//

import Combine
import ComposableArchitecture
@testable import Rogram
import XCTest

class PhotosActionTests: XCTestCase {

    private var mockPhotoService = MockPhotoService()
    private var state = PhotosState()
    private lazy var testStore = TestStore(initialState: state,
                                           reducer: PhotosAction.reducer,
                                           environment: PhotosEnvironment(service: mockPhotoService))

    override func setUp() {
        super.setUp()
        mockPhotoService = MockPhotoService()
        state = PhotosState()
        testStore = TestStore(initialState: state,
                              reducer: PhotosAction.reducer,
                              environment: PhotosEnvironment(service: mockPhotoService))
    }

    func testSelectPhoto() {
        testStore.assert(
            .send(.selectPhoto(.mock)) {
                $0.presentationMode = .presenting(.mock)
            }
        )
    }

    func testDismissModal() {
        testStore.assert(
            .send(.selectPhoto(.mock)) {
                $0.presentationMode = .presenting(.mock)
            },
            .send(.dismissModal) {
                $0.presentationMode = .notPresenting
            }
        )
    }

    func testSuccessfulLoadPhotos() {
        mockPhotoService.mockList = {
            Just(Photo.mockList)
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        }

        testStore.assert(
            .send(.loadPhotos) {
                $0.isLoading = true
            },
            .do {
                _ = XCTWaiter.wait(for: [self.expectation(description: "wait")], timeout: 0.1)
            },
            .receive(.didLoadPhotos(.success(Photo.mockList))) {
                $0.isLoading = false
                $0.photos = Photo.mockList
            }
        )
    }

    func testFailedLoadPhotos() {
        mockPhotoService.mockList = {
            Fail(error: NetworkError.invalidURL)
                .eraseToAnyPublisher()
        }

        testStore.assert(
            .send(.loadPhotos) {
                $0.isLoading = true
            },
            .do {
                _ = XCTWaiter.wait(for: [self.expectation(description: "wait")], timeout: 0.1)
            },
            .receive(.didLoadPhotos(.failure(NetworkError.invalidURL))) {
                $0.isLoading = false
                $0.photos = []
            }
        )
    }
}
