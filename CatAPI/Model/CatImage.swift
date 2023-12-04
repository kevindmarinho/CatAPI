//
//  CatModel.swift
//  CatAPI
//
//  Created by kevin marinho on 30/11/23.
//

import Foundation

struct CatImage: Decodable, Identifiable {
    let id: String
    let url: URL
    let breeds: [Breed]
}

struct Breed: Decodable, Identifiable {
    var id: String
    let name: String
    let temperament: String
    let reference_image_id: String?
}
