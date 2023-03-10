//
//  memorize.modelview.swift
//  memorize-study
//
//  Created by Vinicius  Santos on 18/02/23.
//

import Foundation

let vehiclesCards = ["âī¸", "đ", "đ", "đ", "â´ī¸", "đļ", "đŠī¸", "đŗī¸", "đ","đŦ", "đē"]

let peopleCards = ["đđž", "đĒ", "đ§đŧââī¸","đ§đŊââī¸", "đĢ","đŠđŧâđĻŧ","đŠđŧâđ", "đ§đžâđ§", "đ¨đŋâđ§", "đđŧ"]

let fruitsCards = ["đ", "đ", "đ", "đ", "đ", "đ", "đ", "đĨ", "đĨ", "đĨĨ", "đ", "đĨ", "đ", "đ", "đ", "đ", "đĨ","đŊ"]


class MemorizeModelView: ObservableObject {
    @Published var game = Game<String>(
        cardsCount: 20,
        cardsContent: peopleCards)
    
    var deckOfCards: [Card<String>] {
        get {
            return game.cards
        }
    }
    
    func onTapCard(_ cardId: String) {
        game.onTapCard(cardId)
    }
    
}
