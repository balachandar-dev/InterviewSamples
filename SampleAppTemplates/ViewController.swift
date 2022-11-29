//
//  ViewController.swift
//  SampleAppTemplates
//
//  Created by Janani on 27/11/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.performSegue(withIdentifier: "CoreData", sender: nil)
        // Do any additional setup after loading the view.
    }
}

