//
//  Extensions.swift
//  SpriteKit Popup
//
//  Created by Martin Walsh on 08/08/2016.
//  Copyright © 2016 cocojoe. All rights reserved.
//

import SpriteKit

enum GradientDirection {
    case up
    case left
    case upLeft
    case upRight
}
extension SKTexture {
    
    convenience init (size:CGSize, color1:CIColor, color2:CIColor, direction:GradientDirection = .up) {
        let coreImageContext = CIContext(options: nil)
        let gradientFilter = CIFilter(name: "CILinearGradient")
        gradientFilter!.setDefaults()
        var startVector:CIVector
        var endVector:CIVector
        switch direction {
        case .up:
            startVector = CIVector(x: size.width/2, y: 0)
            endVector = CIVector(x: size.width/2, y: size.height)
        case .left:
            startVector = CIVector(x: size.width, y: size.height/2)
            endVector = CIVector(x: 0, y: size.height/2)
        case .upLeft:
            startVector = CIVector(x: size.width, y: 0)
            endVector = CIVector(x: 0, y: size.height)
        case .upRight:
            startVector = CIVector(x: 0, y: 0)
            endVector = CIVector(x: size.width, y: size.height)
            
        }
        
        gradientFilter!.setValue(startVector, forKey: "inputPoint0")
        gradientFilter!.setValue(endVector, forKey: "inputPoint1")
        gradientFilter!.setValue(color1, forKey: "inputColor0")
        gradientFilter!.setValue(color2, forKey: "inputColor1")
        let cgimg = coreImageContext.createCGImage(gradientFilter!.outputImage!, fromRect: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        self.init(CGImage:cgimg)
    }
}
