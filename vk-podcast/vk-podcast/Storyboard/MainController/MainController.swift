//
//  MainController.swift
//  vk-podcast
//
//  Created by Александр on 16.09.2020.
//  Copyright © 2020 AlexBugatti. All rights reserved.
//

import UIKit

class MainController: UIViewController {
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.navigationItem.title = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        addShadow()
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
