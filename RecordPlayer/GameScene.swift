//
//  GameScene.swift
//  RecordPlayer
//
//  Created by John Datserakis on 4/1/15.
//  Copyright (c) 2015 John Datserakis. All rights reserved.
//

import SpriteKit
import AVFoundation

//Variable setup
var disk = SKSpriteNode(imageNamed: "disknew001.png")
var playButton = SKLabelNode(fontNamed:"Helvetica")
var pauseButton = SKLabelNode(fontNamed:"Helvetica")
let action = SKAction.rotateByAngle(CGFloat(-M_PI), duration:1.5)

//Song setup
let song1 = NSBundle.mainBundle().pathForResource("bensound-funkyelement", ofType:"mp3")
let fileURL1 = NSURL(fileURLWithPath: song1!)
var player1 = AVAudioPlayer(contentsOfURL: fileURL1, error: nil)

class GameScene: SKScene {
    override func didMoveToView(view: SKView) {
        
        //Background Color
        scene?.backgroundColor = UIColor.whiteColor()
        
        //Disk
        disk.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame) + 25)
        disk.yScale = 1.00
        disk.xScale = 1.00
        disk.name = "disk"
        self.addChild(disk)
        
        //Play Button
        playButton.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame) - 250)
        playButton.name = "Play"
        playButton.text = "Play"
        playButton.fontSize = 40
        playButton.fontColor = UIColor.blackColor()
        self.addChild(playButton)
        
        //Play Button
        pauseButton.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame) - 250)
        pauseButton.name = "Pause"
        pauseButton.text = "Pause"
        pauseButton.fontColor = UIColor.blackColor()
        pauseButton.fontSize = 40;
        
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self)
            let touchedNode = self.nodeAtPoint(location)
            
            if touchedNode.name == "Play" {
                disk.runAction(SKAction.repeatActionForever(action))
                playButton.removeFromParent()
                self.addChild(pauseButton)
                
                //Set up and start the player
                player1.prepareToPlay()
                player1.play()
            }
            
            if touchedNode.name == "Pause" {
                disk.removeAllActions()
                pauseButton.removeFromParent()
                self.addChild(playButton)
                
                //Pause the player
                player1.pause()
                
            }
            
        }
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
