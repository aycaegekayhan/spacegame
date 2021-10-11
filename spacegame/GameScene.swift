//
//  GameScene.swift
//  spacegame
//
//  Created by Ayça ege Kayhan on 10/6/21.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    var leftCar = SKSpriteNode()
    
    var canMove = false
    var leftToMoveLeft = true
    var leftCarAtRight = false
    var CentrePoint : CGFloat!
    
    let leftCarMinimumX : CGFloat = -200
    let leftCarMaximumX : CGFloat = 200
    
    override func didMove(to view: SKView) {
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        setUp()
        Timer.scheduledTimer(timeInterval: TimeInterval(0.1), target: self, selector: #selector(GameScene.createRoadStrip), userInfo: nil, repeats: true)
        
    }
    
    func setUp(){
        leftCar = self.childNode(withName: "leftCar") as! SKSpriteNode
        CentrePoint = self.frame.size.width / self.frame.size.height
    }
    
    override func update(_ currentTime: TimeInterval) {
        showRoadStrip()
    }
    
    
    @objc func createRoadStrip(){
        let leftRoadStrip = SKShapeNode(rectOf: CGSize(width: 10, height: 40))
        leftRoadStrip.strokeColor = SKColor.white
        leftRoadStrip.fillColor = SKColor.white
        leftRoadStrip.alpha = 0.4
        leftRoadStrip.name = "leftRoadStrip"
        leftRoadStrip.zPosition = 10
        leftRoadStrip.position.x = -187.5
        leftRoadStrip.position.y = 700
        addChild(leftRoadStrip)
        
        let rightRoadStrip = SKShapeNode(rectOf: CGSize(width: 10, height: 40))
            rightRoadStrip.strokeColor = SKColor.white
            rightRoadStrip.fillColor = SKColor.white
            rightRoadStrip.alpha = 0.4
            rightRoadStrip.name = "rightRoadStrip"
            rightRoadStrip.zPosition = 10
            rightRoadStrip.position.x = 187.5
            rightRoadStrip.position.y = 700
            addChild(rightRoadStrip)
        
        let middleRoadStrip = SKShapeNode(rectOf: CGSize(width: 10, height: 40))
            middleRoadStrip.strokeColor = SKColor.white
            middleRoadStrip.fillColor = SKColor.white
            middleRoadStrip.alpha = 0.4
            middleRoadStrip.name = "rightRoadStrip"
            middleRoadStrip.zPosition = 10
        middleRoadStrip.position.x = -2.5
            middleRoadStrip.position.y = 700
            addChild(middleRoadStrip)
        
    }
    
    ///Mark Show Road Strip
    
    func showRoadStrip() {
        enumerateChildNodes(withName: "leftRoadStrip", using: { (roadStrip, stop) in
            let strip = roadStrip as! SKShapeNode
            strip.position.y -= 30
        })
        
        enumerateChildNodes(withName: "rightRoadStrip", using: { (roadStrip, stop) in
            let strip = roadStrip as! SKShapeNode
            strip.position.y -= 30
        
        })
        
        enumerateChildNodes(withName: "middleRoadStrip", using: { (roadStrip, stop) in
            let strip = roadStrip as! SKShapeNode
            strip.position.y -= 30
        
        })
    }
    
    func move(leftSide: Bool) {
        if leftSide{
            leftCar.position.x -= 20
            
        }
    }
}
