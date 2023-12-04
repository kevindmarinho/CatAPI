//
//  CatViewModel.swift
//  CatAPI
//
//  Created by kevin marinho on 01/12/23.
//

import Foundation
import SwiftUI

class CatViewModel: ObservableObject {
    @Published var cats: [CatImage] = []
    @Published var breeds: [Breed] = []
    
    func fetchCats() {
        guard let apiURL = URL(string: "https://api.thecatapi.com/v1/images/search?api_key=live_EpchRaXMjiqgQUf3g6PEJ1AOwZXQ9wooSzckQHJ26KiSUvU2WGbH6ttw4Xg7YfNP&limit=250") else {return}
        
        URLSession.shared.dataTask(with: apiURL) { data, response, error in
            if let data = data {
                do {
                    let catData = try JSONDecoder().decode([CatImage].self, from: data)
                    
                    for cat in catData {
                        for breed in cat.breeds {
                            print("Breed Name: \(breed.name)")
                        }
                    }
                    
                    DispatchQueue.main.async {
                        self.cats = catData
                       // print(catData)
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            }
        }.resume()
    }
}



