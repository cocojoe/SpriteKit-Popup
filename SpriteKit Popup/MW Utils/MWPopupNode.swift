//
//  MWReferenceNode.swift
//  SpriteKit Popup
//
//  Created by Martin Walsh on 03/08/2016.
//  Copyright (c) 2016 cocojoe. All rights reserved.
//

import SpriteKit

class MWPopupNode: SKReferenceNode {
    
    /* Node connections */
    var exitButton: MWButtonNode!
    
    override func didLoadReferenceNode(node: SKNode?) {
        
        /* Set reference to scene exit button node */
        exitButton = childNodeWithName("//exitButton") as! MWButtonNode
        
        /* Exit button handler */
        exitButton.selectedHandler = { [unowned self] in
            self.animateOut()
        }
        
        /*
         Steal touches
         Set this to false if you want the game scene to be clickable
         */
        userInteractionEnabled = true
        
        /* Animation */
        animateIn()
        self.alpha = 0
    }
    
    func animateIn() {
        
        /* Animation */
        let actionFadeIn = SKAction.fadeInWithDuration(0.2)
        runAction(actionFadeIn)
        
    }
    
    func animateOut() {
        
        /* Animation */
        let actionFadeOut = SKAction.fadeOutWithDuration(0.2)
        let actionRemove   = SKAction.removeFromParent()
        let actionSequence = SKAction.sequence([actionFadeOut,actionRemove])
        runAction(actionSequence)
        
    }
}