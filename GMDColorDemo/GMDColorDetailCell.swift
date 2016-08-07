//
//  GMDColorDetailCell.swift
//  GMDColorDemo
//
//  Created by liuyubobobo on 8/7/16.
//  Copyright © 2016 Yubo Liu. All rights reserved.
//

import UIKit

class GMDColorDetailCell: UITableViewCell {

    var colorType: GMDColorType!
    var primaryLevel: GMDColorPrimaryLevel?
    var accentLevel: GMDColorAccentLevel?
    
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var hexLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

    }
    
    func configureCell(){
        
        assert( colorType != nil )
        assert( primaryLevel != nil || accentLevel != nil )
        
        let color:UIColor
        if let primaryLevel = primaryLevel{
            color = GMD.primaryColor(colorType, level: primaryLevel)
            self.backgroundColor = color
            
            levelLabel.textColor = GMD.textColor(colorType, level: primaryLevel)
            levelLabel.text = primaryLevel.name
            
            hexLabel.textColor = levelLabel.textColor
            hexLabel.text = color.hex
        }
        else if let accentLevel = accentLevel{
            color = GMD.accentColor(colorType, level: accentLevel)!
            self.backgroundColor = color
            
            levelLabel.textColor = GMD.textColor(colorType, level: accentLevel)!
            levelLabel.text = accentLevel.name
            
            hexLabel.textColor = levelLabel.textColor
            hexLabel.text = color.hex
        }
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
