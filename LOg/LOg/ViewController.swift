//
//  ViewController.swift
//  LOg
//
//  Created by Dalia on 24/08/2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var USER: UITextField!
    @IBOutlet weak var PASS: UITextField!
    @IBOutlet weak var LOGin_B: UIButton!
    @IBAction func ACTB(_ sender: Any) {
        
        if let user = USER.text , !user.isEmpty , let pass = PASS.text, !pass.isEmpty{
            let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let viewController: CatgoriesViewController = storyboard.instantiateViewController(withIdentifier: "CatgoriesViewController") as! CatgoriesViewController
            self.present(viewController, animated: true, completion: nil)
        }else{
            let Message = UIAlertController(title: "Confirm", message: "Unsucceful Log in", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
                print("Ok")
             })
            Message.addAction(ok)

            self.present(Message, animated: true, completion: nil)
    }
        func viewDidLoad() {
        super.viewDidLoad()
    }
}
}
