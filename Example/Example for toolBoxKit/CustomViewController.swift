//
//  CustomViewController.swift
//  toolBox
//
//  Created by kanney on 10/11/2025.
//  Copyright (c) 2025 kanney. All rights reserved.
//

import UIKit
import toolBoxKit

class CustomViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Task {
            await initData()
        }
        
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
    
}

