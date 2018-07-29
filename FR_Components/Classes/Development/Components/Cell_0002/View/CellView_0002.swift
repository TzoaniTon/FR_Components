//
//  CellView_0002.swift
//  FR_Components
//
//  Created by Sarinthon Mangkorn-ngam on 29/7/2561 BE.
//

import FR_BaseComponent

public class CellView_0002: BaseCellView {

    @IBOutlet weak var labelTitleView: UILabel!
    @IBOutlet weak var textDetailView: UITextView!
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override public func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
