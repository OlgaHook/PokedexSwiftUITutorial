//
//  PokedexView.swift
//  PokedexSwiftUITutorial
//
//  Created by olga.krjuckova on 26/08/2021.
//

import SwiftUI

struct PokedexView: View {
    //Thiss tels to our VGrid, that we need only 2 Items in a row
    private let gridItems = [GridItem(.flexible()), GridItem(.flexible())]
    //create a ViewModel
   @ObservedObject  var viewModel = PokemonViewModel()
    
    var body: some View {
        //Put inside a Navigation view-> navigation controller
        NavigationView{
            ScrollView{
                //use LazyVGrid to load data as it is necessary, not all at one time.Need to create Grid Item.UP
                LazyVGrid(columns: gridItems, spacing: 16) {
                    
                    //replace ForEach(0..<151) with (viewModel.pokemon)
                    //replace { _ in with { pokemon in
                    
                    ForEach(viewModel.pokemon) { pokemon in
                        //presed Enter and, pass here our Pokemon Cell
                        //replace (pokemon: MOCK_POKEMON[2]) ->(pokemon: pokemon)
                        PokemonCell(pokemon: pokemon, viewModel: viewModel)
                    }
                }
                
                
            }
            //navigationTitle must be inside of NavigationView
            .navigationTitle("Pokedex")
        }
        
    }
}

struct PokedexView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexView()
    }
}
