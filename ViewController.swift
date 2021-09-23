//
//  ViewController.swift
//  new sec
//
//  Created by HanyAhmed on 7/8/20.
//  Copyright © 2020 HanyAhmed. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    @IBOutlet weak var collectionview: UICollectionView!
    var AllCards=[card]()
    let cards=CardModel()
    var sound=soundmanager()
     @IBOutlet weak var timerlabel: UILabel!
    var timer:Timer?
    var minuts:Int=600000
    var cardoneselect:IndexPath?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        AllCards=cards.getcards()
        collectionview.dataSource=self
        collectionview.delegate=self
        timer=Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(timerfire), userInfo: nil, repeats: true)
        RunLoop.main.add(timer!, forMode: .common )
        sound.play(event: .shufle)
    }
   
    @objc func timerfire(){
        minuts-=1
        let seconds:Double=Double(minuts)/1000
        timerlabel.text=String(format: "Time remaining %.2f", seconds)
        if minuts==0 {
            timer?.invalidate()
            timerlabel.textColor=UIColor.red
            checkforgameend()
            
        }
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return AllCards.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let cell = cell as? CardCollectionViewCell
        let card = AllCards[ indexPath.row]
        cell?.cellconfiguration(card:card)
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if minuts==0{
            return
        }
        let cell =  collectionView.cellForItem(at: indexPath) as? CardCollectionViewCell
        if cell?.card?.IsFlipet==false&&cell?.card?.IsMatched==false{
            cell?.flipup(speed: 0.5)
            sound.play(event:.isflip)

            if cardoneselect==nil{
                cardoneselect=indexPath
            }else{
                comparison(indexPath)
            }
        }
        
    }
    func comparison(_ secondcardselect:IndexPath){
        let cardone=AllCards[cardoneselect!.row]
        let cardtwo=AllCards[secondcardselect.row]
        
        let caone=collectionview.cellForItem(at: cardoneselect!) as? CardCollectionViewCell
        let catwo=collectionview.cellForItem(at: secondcardselect) as? CardCollectionViewCell
        if cardone.CardName==cardtwo.CardName {
            sound.play(event: .ismatch)

            cardone.IsMatched=true
            cardtwo.IsMatched=true
            caone?.remove()
            catwo?.remove()
            checkforgameend()

        }else{
            cardone.IsFlipet=false
            caone?.flipdown(speed: 0.5 )
            catwo?.flipdown(speed: 0.5)
            sound.play(event: .nomatch)

        }
        cardoneselect=nil
       
    }
    func checkforgameend(){
               var haswon=true
               for card in AllCards{
                   if card.IsMatched==false{
                       haswon=false
                       break
                   }
               }
               if haswon{
                alert(title: "You Win", massage: "fast as hell")
               }else{
                   if minuts<=0{
                    alert(title: "You are a Loser", massage: "Try Again")
                   }
                   
               }
           }
    func alert(title:String,massage:String){
        let alert=UIAlertController(title: title, message: massage, preferredStyle: .alert)
        let aleraction=UIAlertAction(title:  "Ok", style: .default) { (UIAlertAction) in
            self.dismiss(animated: true, completion: nil)
        }
        alert.addAction(aleraction)
        present(alert, animated: true, completion: nil)
        
    }
    
}

