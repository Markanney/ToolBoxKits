//
//  CustomViewController.swift
//  toolBoxKit
//
//  Created by 44431670 on 10/13/2025.
//  Copyright (c) 2025 44431670. All rights reserved.
//

import UIKit
import toolBoxKit

class CustomViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initView()
        //        Task {
        //            await initData()
        //        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initData() async{
        
        let ss = URL(string: "")!
        
        await ss.getImage()
        
    }
    
    func initView(){
        
        let bb = UIButton()
        bb.setTitle("click", for: .normal)
        bb.setTitleColor(.white, for: .normal)
        bb.backgroundColor = .red
        bb.translatesAutoresizingMaskIntoConstraints = false
        bb.addTarget(self, action: #selector(click), for: .touchUpInside)
        
        view.addSubview(bb)
        
        NSLayoutConstraint.activate([
            bb.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bb.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            bb.widthAnchor.constraint(equalToConstant: 200),
            bb.heightAnchor.constraint(equalToConstant: 44)
        ])
        
        let lab = UIPLabel()
        lab.text = "ssss"
        lab.textColor = .white
        lab.backgroundColor = .red
        lab.padding = UIEdgeInsets(top: 100, left: 100, bottom: 100, right: 100)
        lab.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(lab)
        
        NSLayoutConstraint.activate([
            lab.topAnchor.constraint(equalTo: bb.bottomAnchor, constant: 20),
            lab.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc func click(){
        
        let vi  = UIViewController()
        vi.view.backgroundColor = .white
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            Debouncer.shared.debounce {
                self.navigationController?.pushViewController(vi, animated: false)
            }
        }
    }
}

