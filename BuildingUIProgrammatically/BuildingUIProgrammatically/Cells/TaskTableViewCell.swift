//
//  TaskTableViewCell.swift
//  BuildingUIProgrammatically
//
//  Created by Евгений on 01.10.2020.
//  Copyright © 2020 Евгений Кузьмин. All rights reserved.
//

import UIKit

class TaskTableViewCell: UITableViewCell {
    
    lazy var doneMarkerImageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: "unmarked")
        
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        
        let label = UILabel()
        label.font = UIFont(descriptor: UIFontDescriptor(fontAttributes: [.name: "SF Pro Text", .traits: [UIFontDescriptor.TraitKey.weight: UIFont.Weight.medium]]), size: 18)
        label.textColor = .defaultBlackColor
        label.numberOfLines = .zero
        
        return label
    }()
    
    lazy var markerView: UIView = {
        
        let view = UIView()
        view.layer.cornerRadius = 6
        
        return view
    }()
    
    lazy var dividerView: UIView = {
        
        let view = UIView()
        view.backgroundColor = UIColor.defaultBlackColor.withAlphaComponent(0.1)
        
        return view
    }()
    
    func configure(with task: Task) {
        
        let doneMarkerImageName = task.isNeedToBeWhiteAppearance ? "whiteUnmarked" : "unmarked"
        doneMarkerImageView.image = UIImage(named: task.isMarked ? "marked" : doneMarkerImageName)
        titleLabel.text = task.text
        
        if task.isNeedToBeWhiteAppearance {
            
            dividerView.backgroundColor = UIColor.white.withAlphaComponent(0.2)
            titleLabel.textColor = UIColor.white.withAlphaComponent(task.isMarked ? 0.5 : 1)
        }
        else {
            titleLabel.textColor = UIColor.defaultBlackColor.withAlphaComponent(task.isMarked ? 0.5 : 1)
        }
        
        switch task.category {
            
        case .inbox:
            markerView.backgroundColor = .clear
        case .work:
            markerView.backgroundColor = .workCategoryColor
        case .shopping:
            markerView.backgroundColor = .shoppingCategoryColor
        case .family:
            markerView.backgroundColor = .familyCategoryColor
        case .personal:
            markerView.backgroundColor = .personalCategoryColor
        }
    }
    
    func addSubviews() {
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(doneMarkerImageView)
        contentView.addSubview(markerView)
        contentView.addSubview(dividerView)
    }
    
    func makeConstraints() {
        
        doneMarkerImageView.snp.makeConstraints { make in
            
            make.size.equalTo(28)
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
        }
        
        titleLabel.snp.makeConstraints { make in
            
            make.top.bottom.equalToSuperview().inset(18)
            make.leading.equalTo(doneMarkerImageView.snp.trailing).offset(16)
            make.trailing.equalTo(markerView.snp.leading).inset(16)
        }
        
        markerView.snp.makeConstraints { make in
            
            make.size.equalTo(12)
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(16)
        }
        
        dividerView.snp.makeConstraints { make in
            
            make.height.equalTo(1)
            make.leading.equalToSuperview().offset(60)
            make.bottom.trailing.equalToSuperview()
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
