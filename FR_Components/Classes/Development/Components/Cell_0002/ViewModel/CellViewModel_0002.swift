//
//  CellViewModel_0002.swift
//  FR_Components
//
//  Created by Sarinthon Mangkorn-ngam on 29/7/2561 BE.
//

import FR_BaseComponent
import RxCocoa
import RxSwift

open class CellViewModel_0002: BaseCellViewModel {
    
    var title = Variable<String?>(nil)
    var detail = Variable<String?>(nil)
    
    public init(
        title: String,
        detail: String,
        cellAccessoryType: UITableViewCell.AccessoryType = UITableViewCell.AccessoryType.none
    ) {
        super.init(cellHeight: nil, cellAccessoryType: cellAccessoryType)
        
        self.title.value = title
        self.detail.value = detail
    }
    
    open override func setupCellView() throws -> BaseCellView {
        let cellView = BaseCellView.build(cellType: CellView_0002.self)
        
        _ = title.asObservable().bind(to: cellView.labelTitleView.rx.text)
        _ = detail.asObservable().bind(to: cellView.textDetailView.rx.text)
        _ = detail.asObservable().bind(onNext: { ( detail ) in
            
            let customHeight = cellView.textDetailView.getContentIncrementHeight() + cellView.getHeight()
            
            cellView.setHeight(height: customHeight)
            
        })
        
        return cellView
    }
    
}
