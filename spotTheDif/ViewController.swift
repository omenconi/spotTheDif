//
//  ViewController.swift
//  spotTheDif
//
//  Created by omenconi on 12/1/16.
//  Copyright © 2016 Student. All rights reserved.
//

import UIKit

class ViewController:UIViewController
{
    @IBOutlet weak var name: UITextField!

    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
  
    }

    @IBAction func moveName(_ sender: Any)
    {
        //performSegue(withIdentifier: "segue", sender: gameViewViewController.self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let gameController = segue.destination as? gameViewViewController
        
        gameController?.playerName = name.text!
    }
    

}

