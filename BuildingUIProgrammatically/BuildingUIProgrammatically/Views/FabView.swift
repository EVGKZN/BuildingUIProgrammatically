//
//  FabView.swift
//  BuildingUIProgrammatically
//
//  Created by Евгений on 01.10.2020.
//  Copyright © 2020 Евгений Кузьмин. All rights reserved.
//

import Foundation
import UIKit

class FabView: UIView {
    
    public var activator: ((Bool) -> Void)?
    
    lazy var button: UIButton = {
        
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "plus"), for: .normal)
        button.addTarget(self, action: #selector(FABButtonPressed), for: .touchUpInside)
        button.tintColor = .defaultBlueColor
        
        return button
    }()
    
    func addSubviews() {
        addSubview(button)
    }
    
    func makeConstraints() {
        
        button.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    @objc private func FABButtonPressed() {
        activated.toggle()
    }
    
    private var activated: Bool = false {
        
        didSet {
            
            guard let activator = activator else { return }
            
            activator(activated)
            
            if activated {
                
                UIView.animate(withDuration: 0.4, delay: .zero, options: .curveEaseOut, animations: {
                    
                    self.button.transform = CGAffineTransform(rotationAngle: .pi / 4)
                    self.backgroundColor = .defaultBlueColor
                    self.button.tintColor = .white
                }, completion: nil)
            }
            else {
                
                UIView.animate(withDuration: 0.4, delay: .zero, options: .curveEaseOut, animations: {
                    
                    self.button.transform = .identity
                    self.backgroundColor = .white
                    self.button.tintColor = .defaultBlueColor
                }, completion: nil)
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        layer.cornerRadius = 32
        
        addSubviews()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
