//
//  ViewController.swift
//  TheReal-Stanford-Game
//
//  Created by App Dev on 9/22/20.
//

import UIKit

class ViewController: UIViewController
{
    
    private lazy var game: Concentration =
        Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    
    var numberOfPairsOfCards: Int {
        return (cardButtons.count+1) / 2
    }
    
    private(set) var flipCount = 0 {
        didSet {
            updateFlipCountLabel()
        }
    }
    
    private func updateFlipCountLabel() {
        let attributes: [NSAttributedString.Key:Any] =
                [
                .strokeWidth : 5.0,
                .strokeColor : #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
            ]
            let attributedString = NSAttributedString(string: "Flips: \(flipCount)", attributes: attributes); flipCountLabel.attributedText = attributedString
            //flipCountLabel.text = "Flips: \(flipCount)"

        
    }

    @IBOutlet private weak var flipCountLabel: UILabel! {
        didSet {
        updateFlipCountLabel()
        }
    }
    
    
    @IBOutlet private var resetButtonYeah: UILabel!
    
    @IBOutlet private var cardButtons: [UIButton]!
    
    
    
    
    @IBAction private func resetButton(_ sender: UIButton) {
        flipCount = 0
       // resetTheGame()


    }
    
    
    
    @IBAction private func touchCard(_ sender: UIButton) {
        flipCount += 1
        
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
    }
        else {
            print("This is not in the card buttons")
        }
    }
    
  private func updateViewFromModel () {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                
            }
            else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 0) : #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
            
            }
        }
    }
    
    // private var emojiChoices = ["🦇","😱","🙀","😈","🎃","👻","🍭","🍬","🍎"]
    
    private var emojiChoices = "🦇😱🙀😈🎃👻🍭🍬🍎"
    

    private var emoji = [Card:String]()
    
   private func emoji(for card: Card) -> String {
    if emoji[card] == nil, emojiChoices.count > 0 {
        let randomStringIndex = emojiChoices.index(emojiChoices.startIndex, offsetBy: emojiChoices.count.arc4random)
        emoji[card] = String(emojiChoices.remove(at: randomStringIndex))
        }
           
        return emoji[card] ?? "?"
        }
}
    extension Int {
        var arc4random: Int {
            if self > 0 {
        return Int(arc4random_uniform(UInt32(self)))
        }
            else if self < 0 {
                return -Int(arc4random_uniform(UInt32(self)))
            }
            else {
                return 0
            }
    }
    }
    
    
//    func resetTheGame() {
//        for index in cardButtons.indices {
//            let button = cardButtons[index]
//            let card = game.cards[index]
//            if card.isMatched {
//                button.setTitle("", for: .normal)
//                button.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
//
//    }
//
//}

