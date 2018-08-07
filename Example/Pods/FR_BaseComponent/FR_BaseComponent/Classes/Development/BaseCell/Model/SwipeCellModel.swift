//
//  SwipeCellModel.swift
//  FR_BaseComponent
//
//  Created by Sarinthon Mangkorn-ngam on 6/8/2561 BE.
//

import SwipeCellKit

open class SwipeCellModel {
    public var swipeCellAction: [SwipeAction]?
    public var swipeCellOptions: SwipeOptions?
    
    public init( actions: [SwipeAction], option: SwipeOptions? = nil ) {
        swipeCellAction = actions
        swipeCellOptions = option
    }
}
