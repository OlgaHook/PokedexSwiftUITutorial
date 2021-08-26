//
//  PokemonViewModel.swift
//  PokedexSwiftUITutorial
//
//  Created by olga.krjuckova on 26/08/2021.
//

import SwiftUI

//create a class
class PokemonViewModel: ObservableObject {
    @Published var pokemon = [Pokemon]()
    let baseUrl = "https://pokedex-bb36f.firebaseio.com/pokemon.json"
    
    init(){
        fetchPokemon()
    }
    
    //to Get some data, parse and return in necessary format, using Decodable protocol(look in MODEL)
    func fetchPokemon(){
        guard let url = URL(string: baseUrl) else {
            return
        }
        URLSession.shared.dataTask(with: url){(data, response, error) in
            guard let data = data?.parseData(removeString: "null,") else {return}
            guard let pokemon = try? JSONDecoder().decode([Pokemon].self, from: data) else {return}
            
            DispatchQueue.main.async {
                self.pokemon = pokemon
            }
        }.resume()
    }

    //to change BacgroundColor
    
    func backgrounColor(forType type: String) -> UIColor{
        switch type {
        case "fire": return .systemRed
        case "poison": return .systemGreen
        case "water": return .systemTeal
        case "electric": return .systemYellow
        case "psychic": return .systemPurple
        case "normal": return .systemOrange
        case "groung": return .systemGray
        case "flying": return .systemBlue
        case "fairy": return .systemPink
        default:return .systemIndigo

        }
    }
    
}
//to be able to remove null in Json.Put parseData in URLSession

extension Data{
    func parseData(removeString string: String)-> Data?{
        let dataAsString = String(data: self, encoding: .utf8)
        let parsedDataString = dataAsString?.replacingOccurrences(of: string, with: "")
        guard let data = parsedDataString?.data(using: .utf8) else {return nil}
        return data
    }
}
