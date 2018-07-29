//
//  CellView_0001.swift
//  FR_Components
//
//  Created by Sarinthon Mangkorn-ngam on 29/7/2561 BE.
//

import UIKit
import FR_BaseComponent

public class CellView_0001: BaseCellView {

    @IBOutlet var imageLeftView: UIImageView!
    @IBOutlet var labelTitleView: UILabel!
    @IBOutlet var labelSubtitleView: UILabel!
    @IBOutlet var imageRightView: UIImageView!
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override public func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
