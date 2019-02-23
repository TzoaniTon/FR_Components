//
//  UIView+LoadFromNib.swift
//  FR_BaseComponent
//
//  Created by Sarinthon Mangkorn-ngam on 7/8/2561 BE.
//

extension UIView {
    public static func build<T>( viewType: T.Type ) -> T {
        let className = String(describing: viewType)
        let bundle = Bundle(for: viewType as! AnyClass)
        
        let nib = bundle.loadNibNamed(className, owner: nil, options: nil)
        let view = nib!.last
        
        return view as! T
    }
}
