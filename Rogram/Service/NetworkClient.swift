//
//  NetworkRequester.swift
//  Rogram
//
//  Created by David Jeong on 6/13/21.
//

import Foundation
import RxCocoa
import RxSwift

class NetworkClient {

    static func get(request: URLRequest) -> Observable<Data> {
        URLSession.shared.rx.data(request: request)
    }
}
