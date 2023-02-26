//
//  Game.swift
//  memorize-study
//
//  Created by Vinicius  Santos on 18/02/23.
//

import Foundation


struct Game<CardContent: Equatable> {
    var cardsCount: Int
    var cardsContent: [CardContent]
    var cards: [Card<CardContent>] = []
    var faceUpCardsCount = 0
    
    init(cardsCount: Int, cardsContent: [CardContent]) {
        self.cardsCount = cardsCount
        self.cardsContent = cardsContent
        
        if (cardsCount > cardsContent.count) {
            self.cardsCount = cardsContent.count
        }
        
        self._buildDeckOfCards()
    }
    
    mutating private func _buildDeckOfCards() {
        for index in 0..<cardsCount {
            let randomIndex = Int.random(in: 0..<cardsCount)
            
            let cardContent = cardsContent[randomIndex]
        
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
        var selectedCardIndex = -1
        
        for index in 0..<cards.count {
            if (id == cards[index].id) {
                turnCard(cardIndex: index)
                selectedCardIndex = index
            }
        }
        
        if (cards[selectedCardIndex].isShowing) {
            faceUpCardsCount += 1
        } else {
            faceUpCardsCount -= 1
        }
        
        if (faceUpCardsCount == 2) {
            for index in 0..<cards.count {
                if (cards[index].isShowing && index != selectedCardIndex) {
                    let selectedCardContent =  cards[selectedCardIndex].content
                    
                    if (cards[index].content == selectedCardContent) {
                        cards[selectedCardIndex].hasMatched = true
                        
                        cards[index].hasMatched = true
                    }
                }
            }
        }
        
        if (faceUpCardsCount > 2) {
            turnAllUnselectedCardsToFaceDown(selectedCardIndex)
        }
    }
    
    mutating private func turnCard(cardIndex: Int) {
        let currentCardState = cards[cardIndex].isShowing
        cards[cardIndex].isShowing = !currentCardState
    }
    
    mutating private func turnAllUnselectedCardsToFaceDown(_ cardIndex: Int) {
        for index in 0..<cards.count {
            if (index != cardIndex) {
                cards[index].isShowing = false
            }
        }
        faceUpCardsCount = 1
    }
}


struct Card<CardContent: Equatable> {
    var id: String
    var content: CardContent
    var isShowing = false
    var hasMatched = false
}
