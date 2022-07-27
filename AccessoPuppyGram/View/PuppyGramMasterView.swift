//
//  PuppyGramMasterView.swift
//  AccessoPuppyGram
//
//  Created by James Folk on 7/27/22.
//

import SwiftUI

struct PuppyGramMasterView: View {
    
    @ObservedObject private var viewModel = PuppyGramViewModel()
    
    var columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    let height: CGFloat = 150
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(viewModel.items) { item in
                        NavigationLink(destination: PuppyGramDetailView(item: item)) {
                            CardView(title: item.title, published: item.published, imageUrl: item.media.m)
                        }
                    }
                }
                .overlay {
                    if viewModel.fetching {
                        ProgressView("Fetching data, please wait...")
                                  .progressViewStyle(CircularProgressViewStyle(tint: .accentColor))

                    }
                }
                .animation(.easeIn, value: viewModel.items)
                .onAppear {
                    if nil != self.viewModel.getPuppyGramElements() {
                        print("error")
                    }
                }
            }
        }
    }
}

struct PuppyGramMasterView_Previews: PreviewProvider {
    static var previews: some View {
        PuppyGramMasterView()
    }
}
