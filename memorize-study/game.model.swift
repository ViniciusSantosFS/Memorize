//
//  Game.swift
//  memorize-study
//
//  Created by Vinicius  Santos on 18/02/23.
//

import Foundation


struct Game<CardContent> {
    var cardsCount: Int
    var cardsContent: [CardContent]
    var cards: [Card<CardContent>] = []
    
    init(cardsCount: Int, cardsContent: [CardContent]) {
        self.cardsCount = cardsCount
        self.cardsContent = cardsContent
        
        if (cardsCount > cardsContent.count) {
            return
        }
        
        self._buildDeckOfCards()
    }
    
    mutating private func _buildDeckOfCards() {
        for index in 0...cardsCount {
            let cardContent = cardsContent[index]
        
            self.cards.insert(
                Card(id: UUID().uuidString, content: cardContent),
                at: index
            )
            
            self.cards.insert(
                Card(id: UUID().uuidString, content: cardContent),
                at: index + 1
            )
        }
    }
    
    mutating func onTapCard(_ id: String) {
        for index in 0..<cards.count {
            if (id == cards[index].id) {
                let currentCardState = cards[index].isShowing
                cards[index].isShowing = !currentCardState
            }
        }
    }
}


struct Card<CardContent> {
    var id: String
    var content: CardContent
    var isShowing = false
}

struct Tab {
    var tabIcon: String
    var tabLabel: String
    var onTap: () -> Void
}
