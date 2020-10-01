//
//  FabMenuView.swift
//  BuildingUIProgrammatically
//
//  Created by Евгений on 01.10.2020.
//  Copyright © 2020 Евгений Кузьмин. All rights reserved.
//

import Foundation
import UIKit

class FabMenuView: UIView {
    
    lazy var dividerView: UIView = {
        
        let view = UIView()
        view.backgroundColor = UIColor.defaultBlackColor.withAlphaComponent(0.1)
        
        return view
    }()
    
    lazy var newListImageView: UIImageView = {
        
        let imageView = UIImageView(image: UIImage(named: "newList"))
        
        return imageView
    }()
    
    lazy var newTaskImageView: UIImageView = {
        
        let imageView = UIImageView(image: UIImage(named: "newTask"))
        
        return imageView
    }()
    
    lazy var newTaskLabel: UILabel = {
        
        let label = UILabel()
        label.text = "Task"
        label.textColor = .defaultBlueColor
        label.font = UIFont(descriptor: UIFontDescriptor(fontAttributes: [.name: "SF Pro Text", .traits: [UIFontDescriptor.TraitKey.weight: UIFont.Weight.semibold]]), size: 18)
        
        return label
    }()
    
    lazy var newListLabel: UILabel = {
        
        let label = UILabel()
        label.text = "List"
        label.textColor = .defaultBlueColor
        label.font = UIFont(descriptor: UIFontDescriptor(fontAttributes: [.name: "SF Pro Text", .traits: [UIFontDescriptor.TraitKey.weight: UIFont.Weight.semibold]]), size: 18)
        
        return label
    }()
    
    func addSubviews() {
        
        addSubview(newTaskLabel)
        addSubview(newListLabel)
        addSubview(newListImageView)
        addSubview(newTaskImageView)
        addSubview(dividerView)
    }
    
    func makeConstraints() {
        
        newTaskImageView.snp.makeConstraints { make in
            
            make.size.equalTo(24)
            make.leading.top.equalToSuperview().offset(18)
        }
        
        newTaskLabel.snp.makeConstraints { make in
            
            make.leading.equalTo(newTaskImageView.snp.trailing).offset(12)
            make.centerY.equalTo(newTaskImageView)
        }
        
        dividerView.snp.makeConstraints { make in
            
            make.height.equalTo(1)
            make.leading.trailing.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        newListImageView.snp.makeConstraints { make in
            
            make.size.equalTo(24)
            make.leading.bottom.equalToSuperview().inset(18)
        }
        
        newListLabel.snp.makeConstraints { make in
            
            make.leading.equalTo(newListImageView.snp.trailing).offset(12)
            make.centerY.equalTo(newListImageView)
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        layer.cornerRadius = 10
        
        addSubviews()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
