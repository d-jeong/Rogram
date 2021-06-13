//
//  PhotoRowView.swift
//  Rogram
//
//  Created by David Jeong on 6/13/21.
//

import SDWebImageSwiftUI
import SwiftUI

struct PhotoRowView: View {

    let photo: Photo

    var body: some View {

        VStack {
            WebImage(url: URL(string: photo.thumbnailUrl))
                .frame(width: 150, height: 150, alignment: .center)
            Text(photo.title)
                .lineLimit(nil)
                .fixedSize(horizontal: false, vertical: true)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(16)
    }
}
