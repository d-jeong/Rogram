//
//  PhotoDetailView.swift
//  Rogram
//
//  Created by David Jeong on 6/13/21.
//

import SDWebImageSwiftUI
import SwiftUI

struct PhotoDetailView: View {
    let photo: Photo

    var body: some View {
        VStack {
            WebImage(url: URL(string: photo.url))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
            Text(photo.title)
                .lineLimit(nil)
                .font(.system(size: 24))
                .fixedSize(horizontal: false, vertical: true)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 16)
        }
    }
}
