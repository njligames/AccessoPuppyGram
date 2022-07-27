//
//  CardView.swift
//  AccessoPuppyGram
//
//  Created by James Folk on 7/27/22.
//

import SwiftUI

struct CardView: View {
    let title: String
    let published: Date
    let imageUrl: String
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: imageUrl), transaction: Transaction(animation: .spring())) { phase in
                switch phase {
                case .empty:
                    Color.purple.opacity(0.1)
             
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .transition(.slide)
             
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
            Text(title)
                .font(.headline)
            Text(published.puppyDate)
                .font(.subheadline)
        }
        
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(title: "Peek-a-boo Nemo 05-07-22", published: Date.now, imageUrl: "https://live.staticflickr.com/65535/52241992510_1582e60556_m.jpg")
    }
}
