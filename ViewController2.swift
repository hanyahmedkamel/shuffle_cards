//
//  ViewController2.swift
//  new sec
//
//  Created by HanyAhmed on 7/25/20.
//  Copyright © 2020 HanyAhmed. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func one(_ sender: Any) {
        performSegue(withIdentifier: "first", sender: nil)
    }
    


}
