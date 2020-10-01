//
//  ViewController.swift
//  BuildingUIProgrammatically
//
//  Created by Евгений on 30.09.2020.
//  Copyright © 2020 Евгений Кузьмин. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tasks: [Task] = []
    var categories: [Category] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.showsVerticalScrollIndicator = false
        let dataManager = DataManager()
        self.tasks = dataManager.getMainTasks()
        self.categories = dataManager.getMainCategories()
        
        registerCellsForTableView()
        addSubviews()
        makeConstraints()
        setupFabAction()
        
        fabMenuView.alpha = 0
        
        tableView.reloadData()
    }
    
    override func viewDidLayoutSubviews() {
        
        super.viewDidLayoutSubviews()
        
        setupFabMenuShadow()
        setupFabShadow()
    }
    
    lazy var tableView: UITableView = {
        
        let tableView = UITableView()
        tableView.separatorStyle = .none
        
        tableView.dataSource = self
        tableView.delegate = self
        
        return tableView
    }()
    
    let fabView = FabView()
    let fabMenuView = FabMenuView()
    
    func registerCellsForTableView() {
        
        tableView.register(cell: LargeTitleTableViewCell.self)
        tableView.register(cell: TaskTableViewCell.self)
        tableView.register(cell: TimedTaskTableViewCell.self)
        tableView.register(cell: ListsTitleTableViewCell.self)
        tableView.register(cell: ListCategoryTableViewCell.self)
    }
    
    func addSubviews() {
        
        view.addSubview(tableView)
        view.addSubview(fabMenuView)
        view.addSubview(fabView)
    }
    
    private func makeConstraints() {
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.bottom.equalToSuperview()
        }
        
        fabMenuView.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 220, height: 121))
            make.trailing.equalToSuperview().inset(16)
        }
        
        fabView.snp.makeConstraints { make in
            make.size.equalTo(64)
            make.bottom.equalToSuperview().inset(44)
            make.trailing.equalToSuperview().inset(16)
            make.top.equalTo(fabMenuView.snp.bottom).offset(18)
        }
    }
    
    private func setupFabAction() {
        
        fabView.activator = { [weak self] activated in
            
            guard let self = self else { return }
            
            if activated {
                
                UIView.animate(withDuration: 0.4, delay: .zero, options: .curveEaseOut, animations: {
                    
                    self.fabMenuView.alpha = 1
                    self.tableView.alpha = 0.3
                    self.tableView.isUserInteractionEnabled = false
                }, completion: nil)
            }
            else {
                
                UIView.animate(withDuration: 0.4, delay: .zero, options: .curveEaseOut, animations: {
                    
                    self.fabMenuView.alpha = 0
                    self.tableView.alpha = 1
                    self.tableView.isUserInteractionEnabled = true
                }, completion: nil)
            }
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
    
    private func setupFabMenuShadow() {
        
        let shadowPath = UIBezierPath(roundedRect: fabMenuView.bounds, cornerRadius: 0)
        fabMenuView.layer.shadowPath = shadowPath.cgPath
        fabMenuView.layer.shadowColor = UIColor(red: 0.075, green: 0.11, blue: 0.161, alpha: 0.2).cgColor
        fabMenuView.layer.shadowOpacity = 1
        fabMenuView.layer.shadowRadius = 30
        fabMenuView.layer.shadowOffset = CGSize(width: 0, height: 10)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2 + tasks.count + categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let rowIndex = indexPath.row
        
        switch rowIndex {
            
        case 0:
            return tableView.dequeueReusableCell(withIdentifier: LargeTitleTableViewCell.nameOfSelfClass, for: indexPath)
            
        case 1 ..< tasks.count + 1:
            
            let task = tasks[rowIndex - 1]
            
            
            if task.hasTimeCondition {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: TimedTaskTableViewCell.nameOfSelfClass, for: indexPath) as! TimedTaskTableViewCell
                cell.configure(with: task)
                return cell
            }
            else {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: TaskTableViewCell.nameOfSelfClass, for: indexPath) as! TaskTableViewCell
                cell.configure(with: task)
                return cell
            }
            
        case tasks.count + 1:
            
            return tableView.dequeueReusableCell(withIdentifier: ListsTitleTableViewCell.nameOfSelfClass, for: indexPath)
            
        default:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: ListCategoryTableViewCell.nameOfSelfClass, for: indexPath) as! ListCategoryTableViewCell
            cell.configure(with: categories[rowIndex - tasks.count - 2])
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let index = indexPath.row
        
        if ((index > 0) && (index < tasks.count + 1)) {
            
            if tasks[index - 1].isMarked {
                tasks[index - 1].isMarked = false
            } else {
                tasks[index - 1].isMarked = true
            }
            
            tableView.reloadData()
        }
        else if index > tasks.count + 1 {
            
            let category = categories[index - tasks.count - 2]
            let vc = CategoryViewController()
            
            vc.configure(with: category)
            
            present(vc, animated: true)
        }
    }
}
