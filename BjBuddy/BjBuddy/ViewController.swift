//
//  ViewController.swift
//  BjBuddy
//
//  Created by Barry Nailor on 12/7/19.
//  Copyright © 2019 barrynailor. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var dealerImage1: UIImageView!
    @IBOutlet weak var dealerImage2: UIImageView!
    @IBOutlet weak var playerImage1: UIImageView!
    @IBOutlet weak var playerImage2: UIImageView!
    @IBOutlet weak var drawButton: UIButton!
    @IBOutlet weak var hitButton: UIButton!
    @IBOutlet weak var stayButton: UIButton!
    @IBOutlet weak var dealerValueLabel: UILabel!
    @IBOutlet weak var playerValueLabel: UILabel!
    @IBOutlet weak var dealerHit1: UIImageView!
    @IBOutlet weak var dealerHit2: UIImageView!
    @IBOutlet weak var dealerHit3: UIImageView!
    @IBOutlet weak var dealerHit4: UIImageView!
    @IBOutlet weak var dealerHit5: UIImageView!
    @IBOutlet weak var playerHit1: UIImageView!
    @IBOutlet weak var playerHit2: UIImageView!
    @IBOutlet weak var playerHit3: UIImageView!
    @IBOutlet weak var playerHit4: UIImageView!
    @IBOutlet weak var playerHit5: UIImageView!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var winLabel: UILabel!
    @IBOutlet weak var loseLabel: UILabel!
    @IBOutlet weak var pushLabel: UILabel!
    
    
    
    var dealerHand: [Int] = []
    var playerHand: [Int] = []
    var dealerHitCounter: Int = 0
    var playerHitCounter: Int = 0
    var winCount: Int = 0
    var loseCount: Int = 0
    var pushCount: Int = 0
    
    let myDeck: [UIImage: Int] = [
        UIImage(named: "card_images/ac.png")!:1,
        UIImage(named: "card_images/ad.png")!:1,
        UIImage(named: "card_images/ah.png")!:1,
        UIImage(named: "card_images/as.png")!:1,
        UIImage(named: "card_images/c2.png")!:2,
        UIImage(named: "card_images/c3.png")!:3,
        UIImage(named: "card_images/c4.png")!:4,
        UIImage(named: "card_images/c5.png")!:5,
        UIImage(named: "card_images/c6.png")!:6,
        UIImage(named: "card_images/c7.png")!:7,
        UIImage(named: "card_images/c8.png")!:8,
        UIImage(named: "card_images/c9.png")!:9,
        UIImage(named: "card_images/c10.png")!:10,
        UIImage(named: "card_images/d2.png")!:2,
        UIImage(named: "card_images/d3.png")!:3,
        UIImage(named: "card_images/d4.png")!:4,
        UIImage(named: "card_images/d5.png")!:5,
        UIImage(named: "card_images/d6.png")!:6,
        UIImage(named: "card_images/d7.png")!:7,
        UIImage(named: "card_images/d8.png")!:8,
        UIImage(named: "card_images/d9.png")!:9,
        UIImage(named: "card_images/d10.png")!:10,
        UIImage(named: "card_images/h2.png")!:2,
        UIImage(named: "card_images/h3.png")!:3,
        UIImage(named: "card_images/h4.png")!:4,
        UIImage(named: "card_images/h5.png")!:5,
        UIImage(named: "card_images/h6.png")!:6,
        UIImage(named: "card_images/h7.png")!:7,
        UIImage(named: "card_images/h8.png")!:8,
        UIImage(named: "card_images/h9.png")!:9,
        UIImage(named: "card_images/h10.png")!:10,
        UIImage(named: "card_images/s2.png")!:2,
        UIImage(named: "card_images/s3.png")!:3,
        UIImage(named: "card_images/s4.png")!:4,
        UIImage(named: "card_images/s5.png")!:5,
        UIImage(named: "card_images/s6.png")!:6,
        UIImage(named: "card_images/s7.png")!:7,
        UIImage(named: "card_images/s8.png")!:8,
        UIImage(named: "card_images/s9.png")!:9,
        UIImage(named: "card_images/s10.png")!:10,
        UIImage(named: "card_images/jc.png")!:10,
        UIImage(named: "card_images/jh.png")!:10,
        UIImage(named: "card_images/jd.png")!:10,
        UIImage(named: "card_images/js.png")!:10,
        UIImage(named: "card_images/qc.png")!:10,
        UIImage(named: "card_images/qh.png")!:10,
        UIImage(named: "card_images/qd.png")!:10,
        UIImage(named: "card_images/qs.png")!:10,
        UIImage(named: "card_images/kc.png")!:10,
        UIImage(named: "card_images/kh.png")!:10,
        UIImage(named: "card_images/kd.png")!:10,
        UIImage(named: "card_images/ks.png")!:10
    ]
    
    var cardsInPlay: [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func DrawCards(_ sender: Any) {
        
        statusLabel.text = "GLHF"
        cardsInPlay.removeAll()
        playerHand.removeAll()
        dealerHand.removeAll()
        dealerImage1.isHidden = true
        playerHitCounter = 0
        dealerHitCounter = 0
        
        let cardsDrawn: [(key: UIImage, value: Int)] = [GetCard(),GetCard(),GetCard(),GetCard()]
        
        // Draw dealer cards
        dealerImage1.image = cardsDrawn[0].key
        dealerHand.append(cardsDrawn[0].value)
        dealerImage2.image = cardsDrawn[1].key
        dealerHand.append(cardsDrawn[1].value)
        
        //Draw player cards
        playerImage1.image = cardsDrawn[2].key
        playerHand.append(cardsDrawn[2].value)
        playerImage2.image = cardsDrawn[3].key
        playerHand.append(cardsDrawn[3].value)
        
        drawButton.isHidden = true
        hitButton.isHidden = false
        stayButton.isHidden = false
        
        //Clean Table
        
        dealerHit1.image = nil
        dealerHit2.image = nil
        dealerHit3.image = nil
        dealerHit4.image = nil
        dealerHit5.image = nil
        
        playerHit1.image = nil
        playerHit2.image = nil
        playerHit3.image = nil
        playerHit4.image = nil
        playerHit5.image = nil
        
        //Update values
        playerValueLabel.text = GetValueString(hand: playerHand)
        dealerValueLabel.text = String(dealerHand[1])
        
    }
    
    @IBAction func HitMe(_ sender: Any) {
        playerHitCounter += 1
        let newCard: (key: UIImage, value: Int) = GetCard()
        
        playerHand.append(newCard.value)
        
        switch playerHitCounter {
        case 1:
            playerHit1.image = newCard.key
        case 2:
            playerHit2.image = newCard.key
        case 3:
            playerHit3.image = newCard.key
        case 4:
            playerHit4.image = newCard.key
        case 5:
            playerHit5.image = newCard.key
        default:
            playerHitCounter = 0
        }
        
        playerValueLabel.text = GetValueString(hand: playerHand)
        
        if (IsPlayerBust()) {
            statusLabel.text = "BUST"
            loseCount += 1
            hitButton.isHidden = true
            stayButton.isHidden = true
            drawButton.isHidden = false
            UpdateResults()
        }
        
    }
    
    @IBAction func IllStay(_ sender: Any) {
        hitButton.isHidden = true
        stayButton.isHidden = true
        FinishDealerHand()
    }
    
    func IsPlayerBust()-> Bool {
        var totalValue: Int = 0
        
        for num : Int in playerHand {
            totalValue += num
        }
        
        if (totalValue > 21) {
            return true
        } else { return false }
        
    }
    
    func GetCard()-> (key: UIImage, value: Int)!{
    
        if (cardsInPlay.count > 50){
            cardsInPlay.removeAll()
            }
        var tempCards: (key: UIImage, value: Int)! = nil
        
        var foundCard: Bool = false
        
        while (!foundCard){
            tempCards = myDeck.randomElement()
            
            if (!cardsInPlay.contains(tempCards.key)){
                foundCard = true
            }
        }
        
        return tempCards
    }
    
    func GetValueString(hand: [Int]) -> String {
        
        var totalValue: Int = 0
        
        for num : Int in hand {
            totalValue += num
        }
        
        if (!hand.contains(1)){ //no ace
            return String(totalValue)
        }else { //is ace
            if (totalValue + 10 <= 21){
                return String(totalValue) + " or " + String(totalValue + 10)
            }
            else {
                return String(totalValue)
            }
        }
    }
    
    func FinishDealerHand(){
        
        dealerImage1.isHidden = false
        
        while (DealerWillHit()){
            dealerHitCounter += 1
            let newCard: (key: UIImage, value: Int) = GetCard()
            
            dealerHand.append(newCard.value)
            
            switch dealerHitCounter {
            case 1:
                dealerHit1.image = newCard.key
            case 2:
                dealerHit2.image = newCard.key
            case 3:
                dealerHit3.image = newCard.key
            case 4:
                dealerHit4.image = newCard.key
            case 5:
                dealerHit5.image = newCard.key
            default:
                dealerHitCounter = 0
            }
        }
        
        dealerValueLabel.text = String(GetFinalValue(hand: dealerHand))
        
        if (IsDealerBust()) {
            statusLabel.text = "You Win!"
            winCount += 1
        } else {
            if (GetFinalValue(hand: dealerHand) > GetFinalValue(hand: playerHand)){
                statusLabel.text = "Dealer Wins"
                loseCount += 1
            } else if (GetFinalValue(hand: playerHand) > GetFinalValue(hand: dealerHand)) {
                statusLabel.text = "You Win!"
                winCount += 1
            } else {
                statusLabel.text = "Push"
                pushCount += 1
            }
        }
        
        EndHand()
        UpdateResults()
        
    }
    
    func DealerWillHit()-> Bool{
        var valueTotal: Int = 0
        for value: Int in dealerHand {
            valueTotal += value
        }
        if (!dealerHand.contains(1)){
            
            if (valueTotal < 17){
                return true
            } else {
                return false
            }
        } else {
            if (valueTotal + 10 < 18) {
                return true
            } else {
                return false
            }
        }
    }
    
    func IsDealerBust()-> Bool{
        var valueTotal: Int = 0
        for value: Int in dealerHand {
            valueTotal += value
        }
        if (valueTotal > 21){
            return true
        } else {
            return false
        }
    }
    
    func GetFinalValue(hand: [Int])-> Int {
        var valueTotal: Int = 0
        for value: Int in hand {
            valueTotal += value
        }
        if (!hand.contains(1)){
            
            return valueTotal
            
        } else {
            if (valueTotal + 10 <= 21) {
                return valueTotal + 10
            } else {
                return valueTotal
            }
        }
    }
    
    func EndHand(){
        hitButton.isHidden = true
        stayButton.isHidden = true
        drawButton.isHidden = false
    }
    
    func UpdateResults(){
        winLabel.text = String(winCount)
        loseLabel.text = String(loseCount)
        pushLabel.text = String(pushCount)
    }
    
}

