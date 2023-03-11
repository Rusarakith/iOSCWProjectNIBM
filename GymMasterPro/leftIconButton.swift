//
//  leftIconButton.swift
//  GymMasterPro
//
//  Created by Rusara Kithsahan on 2023-03-12.
//

import UIKit

struct LeftIconButtonViewModel{
    let primaryText : String
    let icon : UIImage?
    let backgroundColor : UIColor?
    let iconSpace : CGFloat
}

final class leftIconButton: UIButton {
    
    private var iconSpaceFloat : CGFloat = 0
    
    private let primaryLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .center
        label.textColor = .black
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        
        return label
    }()
    
    private let iconImage : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(primaryLabel)
        addSubview(iconImage)
        clipsToBounds = true
        layer.cornerRadius = 30
        //layer.borderWidth = 1
        layer.backgroundColor = UIColor.secondarySystemBackground.cgColor
    }

    required init?(coder: NSCoder){
        fatalError()
    }
    
    func configure(with viewModel: LeftIconButtonViewModel){
        primaryLabel.text = viewModel.primaryText
        backgroundColor = viewModel.backgroundColor
        iconImage.image = viewModel.icon
        iconSpaceFloat = viewModel.iconSpace
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        primaryLabel.sizeToFit()
        let iconSize: CGFloat = 30
        let iconX: CGFloat = (frame.size.width - primaryLabel.frame.size.width - iconSize - 5) / 2
        primaryLabel.frame = CGRect(x: iconX + iconSize + iconSpaceFloat,
                                    y: 0,
                                    width: primaryLabel.frame.size.width,
                                    height: frame.size.height)
        iconImage.frame = CGRect(x: iconX,
                                 y: (frame.size.height - iconSize) / 2,
                                 width: iconSize,
                                 height: iconSize)
        
    }
}

