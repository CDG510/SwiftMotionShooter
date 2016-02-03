//
//  GameScene.swift
//  MotionShooter
//
//  Created by Christian Gonzalez on 1/12/16.
//  Copyright (c) 2016 Christian Gonzalez. All rights reserved.
//

import SpriteKit
import CoreMotion


var airplane = SKSpriteNode()
var motionManager = CMMotionManager()
var destX: CGFloat = 0.0
var destY: CGFloat = 0.0

struct physicsCategory {
    static let player:  UInt32 = 1
    static let Enemy: UInt32 = 2
}



class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var score = Int()
    var ScoreLabel = UILabel()
    var gameStatus = UILabel()
    
    var lastUpdateTimeInterval: CFTimeInterval = 0
    

    override func didMoveToView(view: SKView) {
        
        let scene = GameScene(size: view.bounds.size)
        //this should make the walls edges
        self.physicsBody = SKPhysicsBody(edgeLoopFromRect: self.frame)
        var borderBody = SKPhysicsBody(edgeLoopFromRect: self.frame)
        self.physicsBody = borderBody
        self.physicsBody!.friction = 0.0

        self.physicsWorld.contactDelegate = self



let EnemyTimer = NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: Selector("SpawnEnemies"), userInfo: nil, repeats: true)
ScoreLabel.text = "\(score)"
ScoreLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
ScoreLabel.backgroundColor = UIColor.blueColor()
ScoreLabel.textColor = UIColor.whiteColor()
ScoreLabel.text = "0"

gameStatus.text = "\(score)"
gameStatus = UILabel(frame: CGRect(x: self.frame.width / 2, y: self.frame.height / 2, width: 50, height: 50))
gameStatus.hidden = true

self.view?.addSubview(ScoreLabel)
//
        airplane = SKSpriteNode(imageNamed: "squidward-1")

        airplane.physicsBody = SKPhysicsBody(rectangleOfSize: airplane.size)
        airplane.physicsBody?.affectedByGravity = false
        airplane.physicsBody?.restitution = 1;
        airplane.physicsBody?.dynamic = true
        airplane.physicsBody?.categoryBitMask = physicsCategory.player
        airplane.physicsBody?.mass = 0.2
        
        //1
        airplane.position = CGPointMake(frame.size.width/2, frame.size.height * 0.1)
        self.addChild(airplane)
        
        //don't need this afterall
        
//
        
        if motionManager.accelerometerAvailable == true {
            // 2
            motionManager.startAccelerometerUpdatesToQueue(NSOperationQueue.currentQueue()!, withHandler:{
                data, error in
                
                let currentX = airplane.position.x
                let currentY = airplane.position.y
                
                // 3
                if data!.acceleration.x < 0 && data!.acceleration.y < 0 {
                        destX = currentX + (CGFloat(data!.acceleration.x * 200))
                        destY = currentY + (CGFloat(data!.acceleration.y * 200))
                }
                else if data!.acceleration.x > 0 &&  data!.acceleration.y < 0 {
//
                        destX = currentX + (CGFloat(data!.acceleration.x * 200))
                        destY = currentY + (CGFloat(data!.acceleration.y * 200))

                }
                else if data!.acceleration.x < 0 || data!.acceleration.y > 0 {
                        destX = currentX + (CGFloat(data!.acceleration.x * 200))
                        destY = currentY + (CGFloat(data!.acceleration.y * 200 ))
//
                }
                    
                else if data!.acceleration.x > 0 && data!.acceleration.y > 0 {
//
                        destX = currentX + (CGFloat(data!.acceleration.x * 200) )
                        destY = currentY + (CGFloat(data!.acceleration.y * 200))
//
                }
                
            })
            
        }
        
    }
    
    
     func SpawnEnemies() {

let Enemy = SKSpriteNode(imageNamed: "avatar")
let MinValue = Enemy.size.width / 2
let MaxValue = self.frame.size.width - Enemy.size.width/2
let spawnPoint = UInt32(MaxValue - MinValue)
let enemyPosition: CGFloat = CGFloat(arc4random()) % CGFloat(spawnPoint) + CGFloat(MinValue)

Enemy.position = CGPoint(x: enemyPosition,y: self.frame.size.height + Enemy.size.height)
//print(Enemy.position,Enemy.size)
Enemy.physicsBody = SKPhysicsBody(rectangleOfSize: Enemy.frame.size)
Enemy.physicsBody?.categoryBitMask = physicsCategory.Enemy
Enemy.physicsBody?.contactTestBitMask = physicsCategory.player
Enemy.physicsBody?.collisionBitMask = physicsCategory.player
Enemy.physicsBody?.affectedByGravity = false
Enemy.physicsBody?.dynamic = true
let action = SKAction.moveToY(-60, duration: 2.0)
Enemy.runAction(action,completion: {
    ++self.score
    self.ScoreLabel.text = "\(self.score)"
    SKAction.removeFromParent()
    
})
self.addChild(Enemy)
print("Enemy bit mask is \(Enemy.physicsBody?.categoryBitMask)")
}

func didBeginContact(contact: SKPhysicsContact) {
    print("Entering function")
    var firstBody : SKPhysicsBody = contact.bodyA
    var secondBody : SKPhysicsBody = contact.bodyB
    
    if (((firstBody.categoryBitMask  == physicsCategory.Enemy) && (secondBody.categoryBitMask == physicsCategory.player)) || ((firstBody.categoryBitMask  == physicsCategory.player ) && (secondBody.categoryBitMask == physicsCategory.Enemy))) {
        CollisionWithPlayer(firstBody.node as! SKSpriteNode, airplane: secondBody.node as! SKSpriteNode)
    }
}


func CollisionWithPlayer(Enemy: SKSpriteNode, airplane: SKSpriteNode) {
    self.gameStatus.hidden = false
    self.gameStatus.text = "You lose!"
    self.view?.presentScene(endScene(size: self.size))
    self.ScoreLabel.removeFromSuperview()
    self.gameStatus.removeFromSuperview()
}

    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        if destX < ((self.size.width-self.size.width) + 140) {
            return
        }
        else if destX > self.size.width - 140 {

                return
            }

        else if destY < ((self.size.height - self.size.height) + 30){

            return
        }
            
        else {
            let actionX = SKAction.moveToX(destX, duration: 0.5)
            let actionY = SKAction.moveToY(destY, duration: 0.5)
            airplane.runAction(actionX)
            airplane.runAction(actionY)
            
        }
        
        
        
    }
}
