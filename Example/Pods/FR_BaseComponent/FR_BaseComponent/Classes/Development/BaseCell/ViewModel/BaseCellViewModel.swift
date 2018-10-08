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
    public var cellSelectionStyle: UITableViewCell.SelectionStyle
    public var cellAccessoryType: UITableViewCell.AccessoryType?
    
    public var swipeLeftCell: SwipeCellModel?
    public var swipeRightCell: SwipeCellModel?
    
    public init(
        cellHeight: CGFloat?,
        cellSelectionStyle: UITableViewCell.SelectionStyle = .none,
        cellAccessoryType:  UITableViewCell.AccessoryType? = .none
    ) {
        self.cellHeight = cellHeight
        self.cellSelectionStyle = cellSelectionStyle
        self.cellAccessoryType = cellAccessoryType
        
        _ = cellSelected.asObservable().subscribe(onNext: { ( isSelected ) in
            
            self.selectionHandler()
            
        })
    }
    
    public func getCellView( _ indexPath: IndexPath ) throws -> BaseCellView {
        self.indexPath = indexPath
        
        do {
            if cellView == nil {
                cellView = try setupCellView()
            }
            
            cellView!.selectionStyle = cellSelectionStyle
            
            if let cellAccessoryType = cellAccessoryType {
                cellView!.accessoryType = cellAccessoryType
            }
            else {
                selectionHandler()
            }
            
            return cellView!
        } catch {
            throw error
        }
    }
    
    open func setupCellView() throws -> BaseCellView {
        throw ErrorCellViewModel.NotSetupCellView
    }
    
    // MARK: - Utility
    
    func selectionHandler() {
        if cellSelected.value {
            self.cellView?.accessoryType = UITableViewCell.AccessoryType.checkmark
        }
        else {
            self.cellView?.accessoryType = UITableViewCell.AccessoryType.none
        }
    }
}
