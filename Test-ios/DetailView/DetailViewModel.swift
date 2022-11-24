//
//  DetailViewModel.swift
//  Test-ios
//
//  Created by Daniele Tassone on 24/11/2022.
//

import Foundation



class DetailViewModel: ObservableObject {
    
    @Published var quots: [QuotModelElement] = []
    
    func fetch(id:Int) {
        guard let url = URL(string: "https://www.breakingbadapi.com/api/quotes/\(id)") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let character = try JSONDecoder().decode(QuotModel.self, from: data)
                debugPrint(character)
                DispatchQueue.main.async {
                    self?.quots = character
                }
                
            } catch {
                debugPrint(error)
            }
        }
        task.resume()
    }
}
