//
//  File.swift
//  MotionShooter
//
//  Created by Christian Gonzalez on 1/13/16.
//  Copyright © 2016 Christian Gonzalez. All rights reserved.
//
import Foundation
import SpriteKit

class endScene : SKScene {
    
    var restartBtn: UIButton!
    var gameStatus = UILabel()
    
    override func didMoveToView(view: SKView) {
        scene?.backgroundColor = UIColor.grayColor()
        
        gameStatus = UILabel(frame: CGRect(x: 200, y: 200, width: 200, height: 200))
        gameStatus.textColor = UIColor.redColor()
        gameStatus.text = "Oh No! You have to hang out with Spongebob. Hit Restart to try again?"
        
        restartBtn = UIButton(frame: CGRect(x: 0, y:0, width: self.view!.frame.size.width / 3, height: 30))
        //restartBtn.center = CGPoint(x: self.frame.size.width / 2, y: self.frame.size.width / 7)
        restartBtn.setTitle("Restart", forState: UIControlState.Normal)
        restartBtn.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        restartBtn.addTarget(self, action: Selector("restart"), forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view?.addSubview(restartBtn)
        self.view?.addSubview(gameStatus)
        
    }
    
    func restart(){
        self.view?.presentScene(GameScene(size: self.size), transition: SKTransition.crossFadeWithDuration(0.3))
        self.restartBtn.removeFromSuperview()
        self.gameStatus.removeFromSuperview()
    }
}