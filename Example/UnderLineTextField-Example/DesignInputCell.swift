//
//  DesignInputCell.swift
//  UnderLineTextField-Example
//
//  Created by IDEAL YANG on 2019/8/29.
//  Copyright © 2019 Mohammad Ali Jafarian. All rights reserved.
//

import UIKit
import UnderLineTextField
import SnapKit

enum InputType {
    case textFlied
    case selection
}

class DesignInputCell: UITableViewCell {

    var inputContent: UnderLineTextField
    
    
    var type:InputType {
        didSet {
            switch type {
            case .selection:
                inputContent.isEnabled = false
                let arrowView = UIView(frame: .init(origin: .zero, size: .init(width: 29, height: 14)))
                arrowView.backgroundColor = .green
                let arrowImgView = UIImageView(frame: .init(origin: .zero, size: .init(width: 14, height: 14)))
                arrowImgView.backgroundColor = .red
                arrowView.addSubview(arrowImgView)
                inputContent.rightView = arrowView
                inputContent.rightViewMode = .always
                inputContent.inactivePlaceholderTextColor = .black
            default:
                inputContent.isEnabled = true
                inputContent.clearButtonMode = .whileEditing
                inputContent.inactivePlaceholderTextColor = .lightGray
                inputContent.errorTextColor = .red
            }
            inputContent.activePlaceholderTextColor = .blue
            inputContent.inactiveLineColor = .gray
            
            inputContent.font = UIFont.systemFont(ofSize: 15)
            inputContent.clearButton.tintColor = .gray
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        inputContent = UnderLineTextField(frame: .zero)
        
        type = .textFlied
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(inputContent)
        inputContent.snp.makeConstraints { (maker) in
            maker.leading.equalTo(15)
            maker.centerY.trailing.equalToSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
