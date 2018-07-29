//
//  UITextView+AdjustContentHeight.swift
//  FR_BaseComponent
//
//  Created by Sarinthon Mangkorn-ngam on 29/7/2561 BE.
//

import Foundation

extension UITextView {
    public func getContentIncrementHeight() -> CGFloat {
        self.isScrollEnabled = true
        
        let currentHeight = self.frame.height
        let contentHeight = self.contentSize.height
        
        if contentHeight > currentHeight {
            let increaseHeight = contentHeight - currentHeight
            
            return increaseHeight
        }
        
        return 0
    }
}
