//
//  BaseCellViewModel.swift
//  FR_BaseComponent
//
//  Created by Sarinthon Mangkorn-ngam on 29/7/2561 BE.
//

import Foundation
import RxCocoa
import RxSwift

enum ErrorCellViewModel: Error {
    case NotSetupCellView
}

open class BaseCellViewModel {
    public var cellView: BaseCellView?
    public var indexPath: IndexPath?
    public var cellSelected = Variable<Bool>(false)
    
    public var cellHeight: CGFloat?
    public var cellSelectionStyle: UITableViewCellSelectionStyle?
    public var cellAccessoryType: UITableViewCellAccessoryType?
    
    public var swipeLeftCell: SwipeCellModel?
    public var swipeRightCell: SwipeCellModel?
    
    public init(
        cellHeight: CGFloat?,
        cellAccessoryType: UITableViewCellAccessoryType?
        ) {
        self.cellHeight = cellHeight
        self.cellAccessoryType = cellAccessoryType
        
        _ = cellSelected.asObservable().subscribe(onNext: { ( isSelected ) in
            
            if isSelected {
                self.cellView?.accessoryType = UITableViewCellAccessoryType.checkmark
            }
            else {
                self.cellView?.accessoryType = UITableViewCellAccessoryType.none
            }
            
        })
    }
    
    public func getCellView( _ indexPath: IndexPath ) throws -> BaseCellView {
        self.indexPath = indexPath
        
        do {
            if cellView == nil {
                cellView = try setupCellView()
            }
            
            if let cellSelectionStyle = cellSelectionStyle {
                cellView!.selectionStyle = cellSelectionStyle
            }
            
            if let cellAccessoryType = cellAccessoryType {
                cellView!.accessoryType = cellAccessoryType
            }
            
            return cellView!
        } catch {
            throw error
        }
    }
    
    open func setupCellView() throws -> BaseCellView {
        throw ErrorCellViewModel.NotSetupCellView
    }
}
