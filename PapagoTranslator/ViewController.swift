//
//  ViewController.swift
//  PapagoTranslator
//
//  Created by moon on 19/09/2019.
//  Copyright © 2019 Bugking. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let pt = PapagoTranslator.init(id: "", secret: "")
        pt.run("hello", "en", "ko") { (text, err) in
            guard let text = text, err == nil else {
                print(err?.localizedDescription)
                return
            }
            
            print(text)
        }
    }


}

