//
//  CategoryTitleTableViewCell.swift
//  BuildingUIProgrammatically
//
//  Created by Евгений on 01.10.2020.
//  Copyright © 2020 Евгений Кузьмин. All rights reserved.
//

import UIKit

class SubtitledLargeTitleTableViewCell: UITableViewCell {
    
    lazy var titleLabel: UILabel = {
        
        let label = UILabel()
        label.font = UIFont(descriptor: UIFontDescriptor(fontAttributes: [.name: "SF Pro Display", .traits: [UIFontDescriptor.TraitKey.weight: UIFont.Weight.bold]]), size: 32)
        label.textColor = .defaultBlackColor
        
        return label
    }()
    
    lazy var subtitleLabel: UILabel = {
        
        let label = UILabel()
        label.font = UIFont(descriptor: UIFontDescriptor(fontAttributes: [.name: "SF Pro Text", .traits: [UIFontDescriptor.TraitKey.weight: UIFont.Weight.regular]]), size: 14)
        label.textColor = UIColor.white.withAlphaComponent(0.5)
        
        return label
    }()
    
    lazy var editButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "edit"), for: .normal)
        
        return button
    }()
    
    func configure(with category: Category) {
        
        titleLabel.text = category.name
        subtitleLabel.text = category.numberOfTasks > 1 ? "\(category.numberOfTasks) tasks" : "\(category.numberOfTasks) task"
        
        switch category.category {
            
        case .inbox:
            
            editButton.setImage(UIImage(named: "edit"), for: .normal)
            editButton.tintColor = .defaultBlackColor
            titleLabel.textColor = .blackCategoryTitleColor
            subtitleLabel.textColor = .blackCategorySubtitleColor
        case .work:
            
            editButton.setImage(UIImage(named: "whiteEdit"), for: .normal)
            editButton.tintColor = .white
            titleLabel.textColor = .whiteCategoryTitleColor
            subtitleLabel.textColor = .whiteCategorySubtitleColor
        case .shopping:
            
            editButton.setImage(UIImage(named: "whiteEdit"), for: .normal)
            editButton.tintColor = .white
            titleLabel.textColor = .whiteCategoryTitleColor
            subtitleLabel.textColor = .whiteCategorySubtitleColor
        case .family:
            
            editButton.setImage(UIImage(named: "edit"), for: .normal)
            editButton.tintColor = .defaultBlackColor
            titleLabel.textColor = .blackCategoryTitleColor
            subtitleLabel.textColor = .blackCategorySubtitleColor
        case .personal:
            
            editButton.setImage(UIImage(named: "whiteEdit"), for: .normal)
            editButton.tintColor = .white
            titleLabel.textColor = .whiteCategoryTitleColor
            subtitleLabel.textColor = .whiteCategorySubtitleColor
        }
    }
    
    func addSubviews() {
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(subtitleLabel)
        contentView.addSubview(editButton)
    }
    
    func makeConstraints() {
        
        titleLabel.snp.makeConstraints { make in
            
            make.leading.equalToSuperview().offset(60)
            make.top.equalToSuperview().offset(32)
        }
        
        subtitleLabel.snp.makeConstraints { make in
            
            make.leading.equalToSuperview().offset(60)
            make.bottom.equalToSuperview().inset(17)
            make.top.equalTo(titleLabel.snp.bottom).offset(3)
        }
        
        editButton.snp.makeConstraints { make in
            
            make.centerY.equalTo(titleLabel)
            make.size.equalTo(24)
            make.trailing.equalToSuperview().inset(14)
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

