//
//  memorize.modelview.swift
//  memorize-study
//
//  Created by Vinicius  Santos on 18/02/23.
//

import Foundation

let vehiclesCards = ["✈️", "🚇", "🚉", "🚄", "⛴️", "🛶", "🛩️", "🛳️", "🚆","🛬", "🛺"]

let peopleCards = ["🏋🏾", "🪂", "🧘🏼‍♂️","🧍🏽‍♂️", "👫","👩🏼‍🦼","👩🏼‍🚀", "🧑🏾‍🔧", "👨🏿‍🔧", "🎅🏼"]

let fruitsCards = ["🍎", "🍏", "🍐", "🍊", "🍋", "🍌", "🍅", "🥔", "🥕", "🥥", "🍆", "🥑", "🍉", "🍇", "🍒", "🍈", "🥒","🌽"]


class MemorizeModelView: ObservableObject {
    @Published var game = Game<String>(
        cardsCount: 10,
        cardsContent: fruitsCards)
    
    var deckOfCards: [Card<String>] {
        get {
            return game.cards
        }
    }
    
    func onTapCard(_ cardId: String) {
        game.onTapCard(cardId)
    }
}
