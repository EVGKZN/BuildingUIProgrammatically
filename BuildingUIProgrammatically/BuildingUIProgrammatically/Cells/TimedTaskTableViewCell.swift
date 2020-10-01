//
//  TimedTaskTableViewCell.swift
//  BuildingUIProgrammatically
//
//  Created by Евгений on 01.10.2020.
//  Copyright © 2020 Евгений Кузьмин. All rights reserved.
//

import UIKit

class TimedTaskTableViewCell: UITableViewCell {
    
    lazy var doneMarkerImageView: UIImageView = {
        
        let imageView = UIImageView()
        let defaultImage = UIImage(named: "marked")
        imageView.image = defaultImage
        
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
    
    lazy var titleAndSubtitlesContainerView: UIView = {
        
        let view = UIView()
        
        return view
    }()
    
    lazy var dividerView: UIView = {
        
        let view = UIView()
        view.backgroundColor = UIColor.defaultBlackColor.withAlphaComponent(0.1)
        
        return view
    }()
    
    lazy var calendarSubtitleView: UIView = {
        
        let view = UIView()
        
        return view
    }()
    
    lazy var timeSubtitleView: UIView = {
        
        let view = UIView()
        
        return view
    }()
    
    lazy var calendarSubtitleLabel: UILabel = {
        
        let label = UILabel()
        label.font = UIFont(descriptor: UIFontDescriptor(fontAttributes: [.name: "SF Pro Text", .traits: [UIFontDescriptor.TraitKey.weight: UIFont.Weight.medium]]), size: 14)
        
        return label
    }()
    
    lazy var timeSubtitleLabel: UILabel = {
        
        let label = UILabel()
        label.font = UIFont(descriptor: UIFontDescriptor(fontAttributes: [.name: "SF Pro Text", .traits: [UIFontDescriptor.TraitKey.weight: UIFont.Weight.medium]]), size: 14)
        
        return label
    }()
    
    lazy var calendarSubtitleImageView: UIImageView = {
        
        let imageView = UIImageView()
        
        return imageView
    }()
    
    lazy var timeSubtitleImageView: UIImageView = {
        
        let imageView = UIImageView()
        
        return imageView
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
            markerView.backgroundColor = .inboxCategoryColor
        case .work:
            markerView.backgroundColor = .workCategoryColor
        case .shopping:
            markerView.backgroundColor = .shoppingCategoryColor
        case .family:
            markerView.backgroundColor = .familyCategoryColor
        case .personal:
            markerView.backgroundColor = .personalCategoryColor
        }
        
        if let date = task.date {
            
            calendarSubtitleView.isHidden = false
            calendarSubtitleImageView.image = UIImage(named: task.isNeedToBeWhiteAppearance ? "whiteCalendar" : "calendar")
            calendarSubtitleLabel.text = date
            
            if task.isNeedToBeWhiteAppearance {
                calendarSubtitleLabel.textColor = UIColor.white.withAlphaComponent(task.isMarked ? 0.25 : 0.5)
            }
            else {
                calendarSubtitleLabel.textColor = UIColor.defaultBlackColor.withAlphaComponent(task.isMarked ? 0.15 : 0.3)
            }
            calendarSubtitleImageView.alpha = task.isMarked ? 0.5 : 1
        } else {
            calendarSubtitleView.isHidden = true
        }
         
        if let time = task.time {
            
            if task.date != nil {
                timeSubtitleView.isHidden = false
                timeSubtitleImageView.image = UIImage(named: task.isNeedToBeWhiteAppearance ? "whiteClock" : "clock")
                timeSubtitleLabel.text = time
                
                if task.isNeedToBeWhiteAppearance {
                    timeSubtitleLabel.textColor = UIColor.white.withAlphaComponent(task.isMarked ? 0.25 : 0.5)
                }
                else {
                    timeSubtitleLabel.textColor = UIColor.defaultBlackColor.withAlphaComponent(task.isMarked ? 0.15 : 0.3)
                }
                
                timeSubtitleImageView.alpha = task.isMarked ? 0.5 : 1
            } else {
                calendarSubtitleView.isHidden = false
                calendarSubtitleImageView.image = UIImage(named: task.isNeedToBeWhiteAppearance ? "whiteClock" : "clock")
                calendarSubtitleLabel.text = time
                
                if task.isNeedToBeWhiteAppearance {
                    calendarSubtitleLabel.textColor = UIColor.white.withAlphaComponent(task.isMarked ? 0.25 : 0.5)
                }
                else {
                    calendarSubtitleLabel.textColor = UIColor.defaultBlackColor.withAlphaComponent(task.isMarked ? 0.15 : 0.3)
                }
                
                calendarSubtitleImageView.alpha = task.isMarked ? 0.5 : 1
            }
        } else {
            timeSubtitleView.isHidden = true
        }
    }
    
    func addSubviews() {
        
        contentView.addSubview(doneMarkerImageView)
        contentView.addSubview(titleAndSubtitlesContainerView)
        titleAndSubtitlesContainerView.addSubview(titleLabel)
        titleAndSubtitlesContainerView.addSubview(calendarSubtitleView)
        titleAndSubtitlesContainerView.addSubview(timeSubtitleView)
        calendarSubtitleView.addSubview(calendarSubtitleLabel)
        calendarSubtitleView.addSubview(calendarSubtitleImageView)
        timeSubtitleView.addSubview(timeSubtitleLabel)
        timeSubtitleView.addSubview(timeSubtitleImageView)
        contentView.addSubview(markerView)
        contentView.addSubview(dividerView)
    }
    
    func makeConstraints() {
        
        doneMarkerImageView.snp.makeConstraints { make in
            
            make.size.equalTo(28)
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
        }
        
        titleAndSubtitlesContainerView.snp.makeConstraints { make in
            
            make.top.bottom.equalToSuperview()
            make.leading.equalTo(doneMarkerImageView.snp.trailing).offset(16)
            make.trailing.equalTo(markerView.snp.leading).inset(16)
        }
        
        titleLabel.snp.makeConstraints { make in
            
            make.leading.equalToSuperview()
            make.top.equalToSuperview().offset(18)
            make.trailing.equalToSuperview()
        }
        
        calendarSubtitleView.snp.makeConstraints { make in
            
            make.top.equalTo(titleLabel.snp.bottom).offset(4)
            make.leading.equalToSuperview()
            make.bottom.equalToSuperview().inset(18)
        }
        
        calendarSubtitleImageView.snp.makeConstraints { make in
            
            make.size.equalTo(16)
            make.centerY.leading.equalToSuperview()
        }
        
        calendarSubtitleLabel.snp.makeConstraints { make in
            
            make.leading.equalTo(calendarSubtitleImageView.snp.trailing).offset(6)
            make.centerY.top.bottom.trailing.equalToSuperview()
        }
        
        timeSubtitleView.snp.makeConstraints { make in
            
            make.leading.equalTo(calendarSubtitleView.snp.trailing).offset(12)
            make.centerY.equalTo(calendarSubtitleView)
        }
        
        timeSubtitleImageView.snp.makeConstraints { make in
            
            make.size.equalTo(16)
            make.centerY.leading.equalToSuperview()
        }
        
        timeSubtitleLabel.snp.makeConstraints { make in
            
            make.leading.equalTo(timeSubtitleImageView.snp.trailing).offset(6)
            make.centerY.top.bottom.trailing.equalToSuperview()
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
