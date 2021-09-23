//
//  CardModel.swift
//  new sec
//
//  Created by HanyAhmed on 7/8/20.
//  Copyright © 2020 HanyAhmed. All rights reserved.
//

import Foundation
class CardModel{
    func getcards()->[card]{
        var x=[Int]()
        var GenerateCards=[card]()
        while x.count<=9 {
            let y=Int.random(in: 1...13)
            if !x.contains(y){
                x+=[y]
                let FirstCard=card()
                let SecondCard=card()
                FirstCard.CardName="card\(y)"
                SecondCard.CardName="card\(y)"
                GenerateCards+=[FirstCard,SecondCard]
            }
        }
        print(x)
        GenerateCards.shuffle()
        return GenerateCards
    }
    }



