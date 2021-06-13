//
//  ContentView.swift
//  Rogram
//
//  Created by David Jeong on 6/13/21.
//

import RxSwift
import SwiftUI

struct ContentView: View {

    var body: some View {
        Text("Hello, world!")
            .padding()
            .onAppear(perform: {
            })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
