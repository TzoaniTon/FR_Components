//
//  UIView+LoadFromNib.swift
//  FR_BaseComponent
//
//  Created by Sarinthon Mangkorn-ngam on 7/8/2561 BE.
//

extension UIView {
    public static func build<T>( cellType: T.Type ) -> T {
        let className = String(describing: cellType)
        let bundle = Bundle(for: cellType as! AnyClass)
        
        let nib = bundle.loadNibNamed(className, owner: nil, options: nil)
        let cellView = nib!.last
        
        return cellView as! T
    }
}
