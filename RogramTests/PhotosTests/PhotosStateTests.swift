//
//  PhotosStateTests.swift
//  RogramTests
//
//  Created by David Jeong on 6/13/21.
//

@testable import Rogram
import XCTest

class PhotosStateTests: XCTestCase {
    func testInitialState() {
        let state = PhotosState()
        XCTAssertTrue(state.photos.isEmpty)
        XCTAssertEqual(state.presentationMode, .notPresenting)
        XCTAssertFalse(state.isLoading)
        XCTAssertNil(state.presentedPhoto)
    }

    func testPresentedPhoto() {
        let state = PhotosState(photos: [], presentationMode: .presenting(.mock), isLoading: false)

        if case .presenting(let photo) = state.presentationMode {
            XCTAssertEqual(photo, .mock)
            XCTAssertEqual(photo, state.presentedPhoto)
        } else {
            XCTFail("Should be in presenting mode.")
        }
    }
}
