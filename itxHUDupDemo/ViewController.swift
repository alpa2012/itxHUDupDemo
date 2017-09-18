//
//  ViewController.swift
//  itxHUDupDemo
//
//  Created by Alen Palamar on 30.08.17.
//  Copyright © 2017 itxpalamar.eu. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    var aniImages: Array<UIImage> = Array()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func actionProgress(_ sender: Any) {
        itxHUDup.showProgress()
        itxHUDup.hideAfter(8.0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

