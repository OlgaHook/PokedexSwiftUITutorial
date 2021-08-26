//
//  PokemonCell.swift
//  PokedexSwiftUITutorial
//
//  Created by olga.krjuckova on 26/08/2021.
//

import SwiftUI

struct PokemonCell: View {
    var body: some View {
        //inside ZStack -> put VStack.Click on TEXT, hold CMD-> choose "Embed in VStack" Works only if Canvas is Open
        ZStack{
            //to apply modifying for all VStack (aligment.leading)
            VStack (alignment: .leading){
                Text("Bulbasaur")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.top, 4)
                    .padding(.leading)
                HStack{
                    Text("Poison")
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
                    
                    //Create image
                    Image("1")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 68, height: 68)
                }
            }
        }
        //set background color Cell color
        .background(Color.green)
        .cornerRadius(12)
        
    }
}

struct PokemonCell_Previews: PreviewProvider {
    static var previews: some View {
        PokemonCell()
    }
}
