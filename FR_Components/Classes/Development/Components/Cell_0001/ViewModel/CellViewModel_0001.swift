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
    let disposeBag = DisposeBag()
    
    public var imageLeft = BehaviorRelay<UIImage?>(value: nil)
    public var title = BehaviorRelay<String?>(value: nil)
    public var subtitle = BehaviorRelay<String?>(value: nil)
    public var imageRight = BehaviorRelay<UIImage?>(value: nil)
    
    public init(
        imageLeft: UIImage,
        title: String,
        subtitle: String,
        imageRight: UIImage?,
        cellAccessoryType: UITableViewCell.AccessoryType = UITableViewCell.AccessoryType.none
    ) {
        super.init(cellHeight: 70, cellAccessoryType: cellAccessoryType)
        
        self.imageLeft.accept( imageLeft )
        self.title.accept( title )
        self.subtitle.accept( subtitle )
        self.imageRight.accept( imageRight )
    }
    
    override open func setupCellView() throws -> BaseCellView {
        let cellView = UIView.build(viewType: CellView_0001.self)
        
        _ = imageLeft.asObservable().bind(
            to: cellView.imageLeftView.rx.image
        ).disposed(by: disposeBag)
        _ = title.asObservable().bind(
            to: cellView.labelTitleView.rx.text
        ).disposed(by: disposeBag)
        _ = subtitle.asObservable().bind(
            to: cellView.labelSubtitleView.rx.text
        ).disposed(by: disposeBag)
        _ = imageRight.asObservable().bind(
            to: cellView.imageRightView.rx.image
        ).disposed(by: disposeBag)
        
        return cellView
    }
}
