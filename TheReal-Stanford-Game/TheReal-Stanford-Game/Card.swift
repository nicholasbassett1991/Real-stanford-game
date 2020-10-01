//
//  Card.swift
//  TheReal-Stanford-Game
//
//  Created by App Dev on 9/22/20.
//

import Foundation


struct Card: Hashable
{
////  var hashValue: Int {return identifier}
////
//    func hash(into hasher: inout Hasher) {
//        hasher.combine(identifier)
//    }
//
//
   var hashValue: Int {return identifier}

     static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.identifier == rhs.identifier

    }

        
        
        
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    private static var identifierFactory = 0
    
    
    private static func getUniqueIdentifier() -> Int {
        Card.identifierFactory += 1
        return Card.identifierFactory
    }
    
    init () {
        self.identifier = Card.getUniqueIdentifier()
    }
    
//    mutating func reset() {
//        if isFaceUp == true {
//            isFaceUp = false
//        }
//        if isMatched == true {
//            isMatched = false
//        }
//}
}

