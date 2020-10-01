//
//  ListCategoryTableViewCell.swift
//  BuildingUIProgrammatically
//
//  Created by Евгений on 01.10.2020.
//  Copyright © 2020 Евгений Кузьмин. All rights reserved.
//

import UIKit

class ListCategoryTableViewCell: UITableViewCell {
    
    lazy var containerView: UIView = {
        
        let view = UIView()
        
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        
        let label = UILabel()
        label.font = UIFont(descriptor: UIFontDescriptor(fontAttributes: [.name: "SF Pro Text", .traits: [UIFontDescriptor.TraitKey.weight: UIFont.Weight.semibold]]), size: 19)
        
        return label
    }()
    
    lazy var subtitleLabel: UILabel = {
        
        let label = UILabel()
        label.font = UIFont(descriptor: UIFontDescriptor(fontAttributes: [.name: "SF Pro Text", .traits: [UIFontDescriptor.TraitKey.weight: UIFont.Weight.regular]]), size: 14)
        
        return label
    }()
    
    func configure(with category: Category) {
        
        titleLabel.text = category.name
        subtitleLabel.text = category.numberOfTasks > 1 ? "\(category.numberOfTasks) tasks" : "\(category.numberOfTasks) task"
        
        switch category.category {
            
        case .inbox:
            
            containerView.backgroundColor = .inboxCategoryColor
            titleLabel.textColor = .blackCategoryTitleColor
            subtitleLabel.textColor = .blackCategorySubtitleColor
        case .work:
            
            containerView.backgroundColor = .workCategoryColor
            titleLabel.textColor = .whiteCategoryTitleColor
            subtitleLabel.textColor = .whiteCategorySubtitleColor
        case .shopping:
            
            containerView.backgroundColor = .shoppingCategoryColor
            titleLabel.textColor = .whiteCategoryTitleColor
            subtitleLabel.textColor = .whiteCategorySubtitleColor
        case .family:
            
            containerView.backgroundColor = .familyCategoryColor
            titleLabel.textColor = .blackCategoryTitleColor
            subtitleLabel.textColor = .blackCategorySubtitleColor
        case .personal:
            
            containerView.backgroundColor = .personalCategoryColor
            titleLabel.textColor = .whiteCategoryTitleColor
            subtitleLabel.textColor = .whiteCategorySubtitleColor
        }
    }
    
    func addSubviews() {
        
        contentView.addSubview(containerView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(subtitleLabel)
        
        containerView.layer.cornerRadius = 10
    }
    
    func makeConstraints() {
        
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 4, left: 58, bottom: 4, right: 16))
        }
        
        titleLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalToSuperview().offset(12)
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(4)
            make.leading.trailing.equalTo(titleLabel)
            make.bottom.equalToSuperview().inset(13)
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
