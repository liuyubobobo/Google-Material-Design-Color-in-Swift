//
//  GMDColorTypeCell.swift
//  GMDColorDemo
//
//  Created by liuyubobobo on 7/17/16.
//  Copyright © 2016 Yubo Liu. All rights reserved.
//

import UIKit

class GMDColorTypeCell: UITableViewCell {

    var colorType: GMDColorType!{
        didSet{
            //print("set color type")
            self.contentView.backgroundColor = GMD.primaryColor(colorType, level: .Default)
            
            self.GMDColorTypeNameLabel.textColor = GMD.textColor(colorType, level: .Default)
            self.GMDColorTypeNameLabel.text = colorType.name
            
            self.GMDColorTypeDefaultHexLabel.textColor = GMD.textColor(colorType, level: .Default)
            self.GMDColorTypeDefaultHexLabel.text = "#" + GMD.primaryColor(colorType, level: .Default).hex
        }
    }
    
    @IBOutlet weak var GMDColorTypeNameLabel: UILabel!
    @IBOutlet weak var GMDColorTypeDefaultHexLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //print("awake from nib")
        
        self.selectionStyle = .None
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
