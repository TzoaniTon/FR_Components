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
    let disposeBag = DisposeBag()
    
    var title = BehaviorRelay<String?>(value: nil)
    var detail = BehaviorRelay<String?>(value: nil)
    
    public init(
        title: String,
        detail: String,
        cellAccessoryType: UITableViewCell.AccessoryType = UITableViewCell.AccessoryType.none
    ) {
        super.init(cellHeight: nil, cellAccessoryType: cellAccessoryType)
        
        self.title.accept( title )
        self.detail.accept( detail )
    }
    
    open override func setupCellView() throws -> BaseCellView {
        let cellView = UIView.build(viewType: CellView_0002.self)
        
        _ = title.asObservable().bind(
            to: cellView.labelTitleView.rx.text
        ).disposed(by: disposeBag)
        _ = detail.asObservable().bind(
            to: cellView.textDetailView.rx.text
        ).disposed(by: disposeBag)
        _ = detail.asObservable().bind(onNext: { ( detail ) in
            let customHeight = cellView.textDetailView.getContentIncrementHeight() + cellView.getHeight()
            
            cellView.setHeight(height: customHeight)
        }).disposed(by: disposeBag)
        
        return cellView
    }
    
}
