//
//  restartScene.swift
//  MotionShooter
//
//  Created by Christian Gonzalez on 1/13/16.
//  Copyright © 2016 Christian Gonzalez. All rights reserved.
//

//import CocoaTouch
//import SpriteKit
//
//class restartScene: SKScene {
//
//    
//    var restartBtn: UIButton!
//    
//    override func didMoveToView(view: SKView) {
//        scene?.backgroundColor = UIColor.grayColor()
//        restartBtn = UIButton(frame: CGRect(x: 0, y:0, width: self.view!.frame.size.width / 2, height: 30))
//        //restartBtn.center = CGPoint(x: self.frame.size.width / 2, y: self.frame.size.width / 7)
//        restartBtn.setTitle("Restart", forState: UIControlState.Normal)
//        restartBtn.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
//        restartBtn.addTarget(self, action: Selector("restart"), forControlEvents: UIControlEvents.TouchUpInside)
//        self.view?.addSubview(restartBtn)
//    }
//    
//    func restart(){
//        self.view?.presentScene(GameScene(), transition: SKTransition.crossFadeWithDuration(0.3))
//        self.restartBtn.removeFromSuperview()
//    }
//
//}


//class endScene : SKScene {
//    
//    var restartBtn: UIButton!
//    
//    override func didMoveToView(view: SKView) {
//        scene?.backgroundColor = UIColor.grayColor()
//        restartBtn = UIButton(frame: CGRect(x: 0, y:0, width: self.view!.frame.size.width / 2, height: 30))
//        //restartBtn.center = CGPoint(x: self.frame.size.width / 2, y: self.frame.size.width / 7)
//        restartBtn.setTitle("Restart", forState: UIControlState.Normal)
//        restartBtn.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
//        restartBtn.addTarget(self, action: Selector("restart"), forControlEvents: UIControlEvents.TouchUpInside)
//        self.view?.addSubview(restartBtn)
//    }
//    
//    func restart(){
//        self.view?.presentScene(GameScene(), transition: SKTransition.crossFadeWithDuration(0.3))
//        self.restartBtn.removeFromSuperview()
//    }
//}