//
//  CellViewModel_0001.swift
//  FR_Components
//
//  Created by Sarinthon Mangkorn-ngam on 29/7/2561 BE.
//

import Foundation
import FR_BaseComponent
import RxCocoa
import RxSwift

open class CellViewModel_0001: BaseCellViewModel {
    
    public var imageLeft = Variable<UIImage?>(nil)
    public var title = Variable<String?>(nil)
    public var subtitle = Variable<String?>(nil)
    public var imageRight = Variable<UIImage?>(nil)
    
    public init(
        imageLeft: UIImage,
        title: String,
        subtitle: String,
        imageRight: UIImage?,
        cellAccessoryType: UITableViewCellAccessoryType = UITableViewCellAccessoryType.none
    ) {
        super.init(cellHeight: nil, cellAccessoryType: cellAccessoryType)
        
        self.imageLeft.value = imageLeft
        self.title.value = title
        self.subtitle.value = subtitle
        self.imageRight.value = imageRight
    }
    
    override open func setupCellView() throws -> BaseCellView {
        let cellView = BaseCellView.build(cellType: CellView_0001.self)
        
        _ = imageLeft.asObservable().bind(to: cellView.imageLeftView.rx.image)
        _ = title.asObservable().bind(to: cellView.labelTitleView.rx.text)
        _ = subtitle.asObservable().bind(to: cellView.labelSubtitleView.rx.text)
        _ = imageRight.asObservable().bind(to: cellView.imageRightView.rx.image)
        
        return cellView
    }
}
