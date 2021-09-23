//
//  CardCollectionViewCell.swift
//  new sec
//
//  Created by HanyAhmed on 7/8/20.
//  Copyright © 2020 HanyAhmed. All rights reserved.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var FrontCard: UIImageView!
    @IBOutlet weak var BackCard: UIImageView!
    var card:card?
    func cellconfiguration(card:card){
        FrontCard.image=UIImage(named:card.CardName )
        self.card=card
        if card.IsMatched==true{
            BackCard.alpha=0
            FrontCard.alpha=0
            return
        }else{
            BackCard.alpha=1
            FrontCard.alpha=1
        }
        if card.IsFlipet==true{
            flipup(speed: 0)
        }else{
            flipdown(speed:0,delay: 0)
        }
    }
    func flipup(speed:TimeInterval){
        UIView.transition(from: BackCard, to: FrontCard, duration: speed, options: [.transitionFlipFromLeft,.showHideTransitionViews], completion: nil)
        card?.IsFlipet=true
    }
    func flipdown(speed:TimeInterval=0.5,delay:TimeInterval=0.5){
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+delay ) {
            UIView.transition(from: self.FrontCard, to: self.BackCard, duration: speed, options: [.showHideTransitionViews,.transitionFlipFromLeft], completion: nil)
        }
        card?.IsFlipet=false
    }
    func remove(){
            BackCard.alpha=0
            UIView.animate(withDuration: 0.5, delay: 0.5, options: .curveEaseOut, animations: {
                self.FrontCard.alpha=0
            }, completion: nil )
        
    }
    
}
