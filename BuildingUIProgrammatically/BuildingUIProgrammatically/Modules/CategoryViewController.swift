//
//  CategoryViewController.swift
//  BuildingUIProgrammatically
//
//  Created by Евгений on 01.10.2020.
//  Copyright © 2020 Евгений Кузьмин. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var category: Category!
    
    let fabView = FabView()
    
    lazy var tableView: UITableView = {
        
        let tableView = UITableView()
        
        tableView.separatorStyle = .none
        tableView.dataSource = self
        
        return tableView
    }()
    
    
    func configure(with category: Category) {
        self.category = category
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCells()
        
        addSubviews()
        makeConstraints()
        
        switch category.category {
            
        case .inbox:
            tableView.backgroundColor = .inboxCategoryColor
        case .work:
            tableView.backgroundColor = .workCategoryColor
        case .shopping:
            tableView.backgroundColor = .shoppingCategoryColor
        case .family:
            tableView.backgroundColor = .familyCategoryColor
        case .personal:
            tableView.backgroundColor = .personalCategoryColor
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        setupFabShadow()
    }
    
    private func addSubviews() {
        
        view.addSubview(tableView)
        view.addSubview(fabView)
    }
    
    private func makeConstraints() {
        
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        fabView.snp.makeConstraints { make in
            make.size.equalTo(64)
            make.bottom.equalToSuperview().inset(44)
            make.trailing.equalToSuperview().inset(16)
        }
    }
    
    private func setupFabShadow() {
        
        let shadowPath = UIBezierPath(roundedRect: fabView.bounds, cornerRadius: 0)
        fabView.layer.shadowPath = shadowPath.cgPath
        fabView.layer.shadowColor = UIColor(red: 0.084, green: 0.139, blue: 0.218, alpha: 0.16).cgColor
        fabView.layer.shadowOpacity = 1
        fabView.layer.shadowRadius = 32
        fabView.layer.shadowOffset = CGSize(width: 0, height: 24)
    }
    
    private func registerCells() {
        
        tableView.register(cell: SubtitledLargeTitleTableViewCell.self)
        tableView.register(cell: TaskTableViewCell.self)
        tableView.register(cell: TimedTaskTableViewCell.self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return category.tasks.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let index = indexPath.row
        
        switch index {
            
        case 0:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: SubtitledLargeTitleTableViewCell.nameOfSelfClass, for: indexPath) as! SubtitledLargeTitleTableViewCell
            cell.configure(with: category)
            cell.backgroundColor = .clear
            return cell
        default:
            
            let task = category.tasks[index - 1]
            if task.hasTimeCondition {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: TimedTaskTableViewCell.nameOfSelfClass, for: indexPath) as! TimedTaskTableViewCell
                cell.configure(with: task)
                cell.backgroundColor = .clear
                return cell
            }
            else {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: TaskTableViewCell.nameOfSelfClass, for: indexPath) as! TaskTableViewCell
                cell.configure(with: task)
                cell.backgroundColor = .clear
                return cell
            }
        }
    }
}

