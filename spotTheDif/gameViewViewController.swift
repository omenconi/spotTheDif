//
//  gameViewViewController.swift
//  spotTheDif
//
//  Created by omenconi on 12/2/16.
//  Copyright © 2016 Student. All rights reserved.
//

import UIKit

class gameViewViewController: UIViewController
{

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var picView: UIView!
    //labels
    @IBOutlet weak var labOne: PicLabel!
    @IBOutlet weak var labTwo: PicLabel!
    @IBOutlet weak var labThree: PicLabel!
    @IBOutlet weak var labFour: PicLabel!
    @IBOutlet weak var labFive: PicLabel!
    @IBOutlet weak var labSix: PicLabel!
    @IBOutlet weak var labSev: PicLabel!
    @IBOutlet weak var labEight: PicLabel!
    @IBOutlet weak var labNine: PicLabel!
    @IBOutlet weak var labTen: PicLabel!
    @IBOutlet weak var labEleven: PicLabel!
    
    //labels (differences) are put into array
    var labelsArray : [PicLabel] = []
    var myPic = PicLabel()
    
    var playerName = ""
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        labelsArray = [labOne, labTwo, labThree, labFour, labFive, labSix, labSev, labEight, labNine, labTen, labEleven]
//puts name entered on first view controller into a label that shows on the bottom of the second view controller
        nameLabel.text = playerName + " is spotting the differences!"
    }

       @IBAction func screenTapped(_ sender: UITapGestureRecognizer)
    {
        print("tap")
        //goes through array of labels to see if it is in the picview (right side of pic) and then if it is true (untapped) then a red circle will appear on the spotted difference
        for label in labelsArray
        {
            if label.frame.contains(sender.location(in: picView))
            {
                if label.canTap == true
                {
                    label.text = "⭕️"
                    //once the label is tapped, the difference has been spotted so it can not be tapped again
                    label.canTap = false
                    myPic.count += 1
                }
                
                
            }
        }
        checkWinner()
    }
    
    func checkWinner()
    {
        //when 11 differences are spotted (11 labels tapped) then the game is over
        if myPic.count == 11
        {
            //print("CONGRATS!" + playerName + " has spotted all of the differences!")
            
            win(playerName)
        }
    }
    
    
    
    func win(_ winner:String)
    {
        //displays alert controller
        let alert = UIAlertController(title: winner + " has spotted all of the differences!", message: nil,
                                      preferredStyle: UIAlertControllerStyle.alert)
        let resetButton = UIAlertAction(title: "play again", style: .default, handler:
            {
                (sender) in
                for labels in self.labelsArray
                {
                    labels.text = ""
                    labels.canTap = true
                }
                
                self.myPic.count = 0
                
        })
        
        alert.addAction(resetButton)
        present(alert, animated: true, completion: nil)
    }
    
   

}
