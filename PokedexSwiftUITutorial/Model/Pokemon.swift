//
//  Pokemon.swift
//  PokedexSwiftUITutorial
//
//  Created by olga.krjuckova on 26/08/2021.
//

import Foundation
//This Model will applied to our ViewLayer
//This Struct gonna conform Decodable protocol and Identifiable
struct Pokemon:Decodable, Identifiable {
    let id: Int
    let name: String
    let imageUrl: String
    let type: String
}

//after this assigned-> go to PokemonCell
let MOCK_POKEMON:[Pokemon] = [
    .init(id: 0, name: "Bulbasour", imageUrl: "1", type: "Poison"),
    .init(id: 1, name: "222", imageUrl: "1", type: "Poison"),
    .init(id: 2, name: "333", imageUrl: "1", type: "Poison"),
    .init(id: 3, name: "444", imageUrl: "1", type: "Fire"),
    .init(id: 4, name: "555", imageUrl: "1", type: "Fire"),
    .init(id: 5, name: "666", imageUrl: "1", type: "Fire")
    
]
