//
//  PuppyGramViewModel.swift
//  AccessoPuppyGram
//
//  Created by James Folk on 7/26/22.
//

import Foundation
import Combine
import UIKit

class PuppyGramViewModel: ObservableObject {
    @Published var items: [Item] = []
    @Published var fetching = false
    
    private var task: AnyCancellable?
}

extension PuppyGramViewModel {
    
    func getPuppyGramElements(onCompletion: @escaping ()-> Void = {}) -> Error? {
        var myError: Error?
        
        fetching = true
        
        task = PuppyGram.get(.photos_public)
            .mapError({ (error) -> Error in
                myError = error
                return error
            })
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure:
                    self.items = []
                    self.fetching = false
                case .finished:
                    print("Combine TimeOut Finish")
                }
            }, receiveValue: { value in
                self.items = value.items
                self.fetching = false
                onCompletion()
            })
        
        
        return myError
    }
}
