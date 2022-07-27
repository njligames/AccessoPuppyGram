//
//  PuppyGramDetailView.swift
//  AccessoPuppyGram
//
//  Created by James Folk on 7/27/22.
//

import SwiftUI

struct PuppyGramDetailView: View {
    var item: Item
    
    var body: some View {
        VStack {
            Text(item.title)
                .font(.largeTitle)
            AsyncImage(url: URL(string: item.media.m), transaction: Transaction(animation: .spring())) { phase in
                switch phase {
                case .empty:
                    Color.purple.opacity(0.1)
             
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .transition(.opacity)
             
                case .failure(_):
                    Image(systemName: "exclamationmark.icloud")
                        .resizable()
                        .scaledToFit()
                        .transition(.opacity)
             
                @unknown default:
                    Image(systemName: "exclamationmark.icloud")
                }
            }
            .cornerRadius(10)
            Text(item.author)
                .font(.title)
            Text(item.published.puppyDate)
                .font(.title2)
            
        }
        
    }
}

struct PuppyGramDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PuppyGramDetailView(item: Item(title: "Peek-a-boo Nemo 05-07-22", media: Media(m: "https://live.staticflickr.com/65535/52241992510_1582e60556_m.jpg"), published: Date.now, author: "nobody@flickr.com (\"MelenaMe\")"))
    }
}
