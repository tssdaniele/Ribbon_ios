//
//  ViewModel.swift
//  Test-ios
//
//  Created by Daniele Tassone on 24/11/2022.
//

import Foundation
import SwiftUI



class ViewModel: ObservableObject {
    
    @Published var characters: [CharacterModelElement] = []
    
    func fetch() {
        guard let url = URL(string: "https://www.breakingbadapi.com/api/characters") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let character = try JSONDecoder().decode(CharacterModel.self, from: data)
                debugPrint(character)
                DispatchQueue.main.async {
                    self?.characters = character
                }
                
            } catch {
                debugPrint(error)
            }
        }
        task.resume()
    }
}
