//
//  ListsTitleTableViewCell.swift
//  BuildingUIProgrammatically
//
//  Created by Евгений on 01.10.2020.
//  Copyright © 2020 Евгений Кузьмин. All rights reserved.
//

import UIKit

class ListsTitleTableViewCell: UITableViewCell {
    
    lazy var titleLabel: UILabel = {
        
        let label = UILabel()
        label.text = "Lists"
        label.font = UIFont(descriptor: UIFontDescriptor(fontAttributes: [.name: "SF Pro Text", .traits: [UIFontDescriptor.TraitKey.weight: UIFont.Weight.bold]]), size: 16)
        label.textColor = UIColor.defaultBlackColor.withAlphaComponent(0.3)
        
        return label
    }()
    
    func addSubviews() {
        contentView.addSubview(titleLabel)
    }
    
    func makeConstraints() {
        
        titleLabel.snp.makeConstraints { make in
            
            make.leading.equalToSuperview().offset(60)
            make.top.equalToSuperview().offset(32)
            make.bottom.equalToSuperview().inset(11)
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        
        addSubviews()
        makeConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
