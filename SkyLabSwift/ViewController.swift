//
//  ViewController.swift
//  SkyLabSwift
//
//  Created by snow on 2019/5/8.
//  Copyright © 2019 snow. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        SkyLab.ABTestWithName(name: "Title", A: {
            self.titleLabel.text = "This is A Plan"
        }) {
            self.titleLabel.text = "This is B Plan"
        }
        
        SkyLab.splitTestWithName(name: "Color", conditions: ["red","green","blue"]) { (color) in
          
            let colorStr = color as! String;
            if (colorStr == "red"){
                self.titleLabel.textColor = UIColor.red
            }else if (colorStr == "green"){
                self.titleLabel.textColor = UIColor.green
            }else if (colorStr == "blue"){
                self.titleLabel.textColor = UIColor.blue
            }
        }

    }
    
    @IBAction func resetAction(_ sender: Any) {
        
        UserDefaults.standard.removeObject(forKey: "Title")
        UserDefaults.standard.removeObject(forKey: "Color")
        
        let alert = UIAlertController.init(title: "重置", message: "将在下次启动后看到变化", preferredStyle: .alert)
        let cacelAct = UIAlertAction.init(title: "取消", style: .cancel, handler:nil);
        
        alert.addAction(cacelAct)
        self.present(alert, animated: true, completion: nil)
   

    }
    

}

