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
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        
        helpButton = childNodeWithName("//helpButton") as! MWButtonNode
        
        /* Help button show popupNode */
        helpButton.selectedHandler = { [unowned self] in
            self.displayPopup()
        }
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
