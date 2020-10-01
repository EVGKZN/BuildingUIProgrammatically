//
//  LargeTitleTableViewCell.swift
//  BuildingUIProgrammatically
//
//  Created by Евгений on 01.10.2020.
//  Copyright © 2020 Евгений Кузьмин. All rights reserved.
//

import UIKit

class LargeTitleTableViewCell: UITableViewCell {
    
    lazy var titleLabel: UILabel = {
        
        let label = UILabel()
        label.font = UIFont(descriptor: UIFontDescriptor(fontAttributes: [.name: "SF Pro Display", .traits: [UIFontDescriptor.TraitKey.weight: UIFont.Weight.bold]]), size: 32)
        label.text = "Today"
        label.textColor = .defaultBlackColor
        
        return label
    }()
    
    lazy var moreButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "more"), for: .normal)
        
        return button
    }()
    
    func addSubviews() {
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(moreButton)
    }
    
    func makeConstraints() {
        
        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(60)
            make.bottom.equalToSuperview().inset(17)
            make.top.equalToSuperview().offset(16)
        }
        
        moreButton.snp.makeConstraints { make in
            make.centerY.equalTo(titleLabel)
            make.trailing.equalToSuperview().inset(13.5)
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
