//
//  GameScene.swift
//  SpriteKit Popup
//
//  Created by Martin Walsh on 03/08/2016.
//  Copyright (c) 2016 cocojoe. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    var helpButton: MWButtonNode!
    var backgroundNode: SKSpriteNode!
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        
        helpButton = childNodeWithName("//helpButton") as! MWButtonNode
        backgroundNode = childNodeWithName("//backgroundNode") as! SKSpriteNode
        
        /* Help button show popupNode */
        helpButton.selectedHandler = { [unowned self] in
            self.displayPopup()
        }
        
        /* Background radient */
        let gradient = SKTexture(size: size, color1: CIColor(red: 0, green: 0.0, blue: 255.0/255.0), color2: CIColor(red: 0, green: 255.0/255.0, blue: 0.0), direction: .up)
        backgroundNode.runAction(SKAction.setTexture(gradient))
        
        
    }
    
    func displayPopup() {
        
        let resourcePath = NSBundle.mainBundle().pathForResource("Popup", ofType: "sks")
        let popupNode = MWPopupNode(URL: NSURL (fileURLWithPath: resourcePath!))
        popupNode.zPosition = 100
        addChild(popupNode)
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Called when a touch begins */
        
        for touch in touches {
            let location = touch.locationInNode(self)
            print(location)
        }
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
