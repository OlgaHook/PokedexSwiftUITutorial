//
//  PokemonCell.swift
//  PokedexSwiftUITutorial
//
//  Created by olga.krjuckova on 26/08/2021.
//

import SwiftUI
import Kingfisher


struct PokemonCell: View {
    let pokemon: Pokemon
    //to get acces to viewModel
    let viewModel: PokemonViewModel
    var body: some View {
        //inside ZStack -> put VStack.Click on TEXT, hold CMD-> choose "Embed in VStack" Works only if Canvas is Open
        ZStack{
            //to apply modifying for all VStack (aligment.leading)
            VStack (alignment: .leading){
                //inside () -> Model data
                Text(pokemon.name.capitalized)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.top, 8)
                    .padding(.leading)
                HStack{
                    Text(pokemon.type)
                        .font(.subheadline).bold()
                        .foregroundColor(.white)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.white.opacity(0.25))
                        )
                        //set Cell frame
                        .frame(width: 100, height: 24)
                    
                    //Create image. Replace Image("1") with KFImage
                    KFImage(URL(string: pokemon.imageUrl))
                        .resizable()
                        .scaledToFit()
                        .frame(width: 68, height: 68)
                        //array of padding if for all constraints there will be the same
                        .padding([.bottom, .trailing], 4)
                }
            }
        }
        //set background color Cell color
        .background(Color(viewModel.backgrounColor(forType: pokemon.type)))
        .cornerRadius(12)
        .shadow(color: .green, radius: 6, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 0.0)
        
    }
}
/*
//used in beginning to explane how it works
struct PokemonCell_Previews: PreviewProvider {
    static var previews: some View {
        PokemonCell(pokemon: MOCK_POKEMON)
 }
}
*/
