//
//  YouTubeThumbnailView.swift
//  Heirloom
//
//  Created by Tyler Brodsky on 9/12/24.
//

import SwiftUI

struct YouTubeThumbnailView: View {
    let videoID: String
    
    var body: some View {
        if let thumbnailID = extractVideoID(from: videoID),
           let thumbnailURL = URL(string: "https://img.youtube.com/vi/\(thumbnailID)/hqdefault.jpg") {
            ZStack {
                AsyncImage(url: thumbnailURL) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(8)
                } placeholder: {
                    ZStack {
                        Rectangle()
                            .foregroundColor(.gray)
                            .cornerRadius(8)
                        
                        ProgressView()
                    }
                    .frame(width: 120, height: 90)
                }
                .frame(width: 120, height: 90)
                
                Image(systemName: "play.circle.fill")
                    .resizable()
                    .foregroundColor(.white)
                    .frame(width: 40, height: 40)
                    .shadow(radius: 4)
            }
        } else {
            Text("Invalid video ID")
        }
    }
    
    func extractVideoID(from url: String) -> String? {
        if let urlComponents = URLComponents(string: url),
           let queryItems = urlComponents.queryItems,
           let videoID = queryItems.first(where: { $0.name == "v" })?.value {
            return videoID
        }
        
        return nil
    }
}

#Preview {
    YouTubeThumbnailView(videoID: "https://www.youtube.com/watch?v=6R8ffRRJcrg")
}

