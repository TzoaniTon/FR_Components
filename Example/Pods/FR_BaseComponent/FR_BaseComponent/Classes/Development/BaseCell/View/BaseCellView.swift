//
//  BaseCellView.swift
//  FR_BaseComponent
//
//  Created by Sarinthon Mangkorn-ngam on 29/7/2561 BE.
//

import UIKit

open class BaseCellView: UITableViewCell {

    override open func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override open func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public static func build<T>( cellType: T.Type ) -> T {
        let className = String(describing: cellType)
        let bundle = Bundle(for: cellType as! AnyClass)
        
        let nib = bundle.loadNibNamed(className, owner: nil, options: nil)
        let cellView = nib!.last
        
        return cellView as! T
    }

}

extension UITableViewCell {
    public func getHeight() -> CGFloat {
        let frame = self.contentView.frame
        
        return frame.height
    }
    
    public func setHeight( height: CGFloat ) {
        var frame = self.contentView.frame
        frame.size.height = height
        
        self.contentView.frame = frame
    }
}
