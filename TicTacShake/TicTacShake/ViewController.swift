//
//  ViewController.swift
//  Tic Tac Test
//
//  Created by sharon mcdermott on 2/21/17.
//  Copyright © 2017 sharon mcdermott. All rights reserved.
//

import UIKit



class ViewController: UIViewController, UITextFieldDelegate {
    
    var activePlayer = 1  // Ex
    
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    let winningCombiniations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    
    var gameIsActive = true

    
    // IF Shake to Start button is checked, then upon shaking the phone
    // Maybe it would be better if you just have it as a one player game, where you shake to place the opponents piece.
    
    
    @IBOutlet weak var outcomeLabel: UILabel!

    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBAction func action(_ sender: AnyObject)


    {
        if (gameState[sender.tag-1] == 0 && gameIsActive == true)

        {
            gameState[sender.tag-1] = activePlayer
        }
        if (activePlayer == 1)

        {
            sender.setImage(UIImage(named: "LimeEx.png"), for: UIControlState())
            activePlayer = 2
        }
        else
        {
 
 
            
/*
            // need to check for shake action
            // once shake action detected, select a random location for "Oh"
            //select a random location from the array that has not already been used
            
            let appendedArray = [0, 0, 0, 0, 0, 0, 0, 0, 0]
            let index = []
            index = Int(arc4random_uniform(UIInt32(array.count)))
            print(array[randomIndex])
            
            
            // It better to append the array of spots on the board before or after you pick our random location.  This way you only pick from the available spots
            // the instance of the array as appended with the taken spots removed from the array, so that you can place a random "Oh" in an available spot.
 */
            
            sender.setImage(UIImage(named: "LimeOh.png"), for: UIControlState())
            activePlayer = 1
        }

        
        
        for combination in winningCombiniations
        {
            if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]
            {
                gameIsActive = false
                
                if gameState[combination[0]] == 1 {
 
                    outcomeLabel.text = "X Won!"
                    
                } else {
                    outcomeLabel.text = "O Won!"
                }
                
                playAgainButton.isHidden = false;
                outcomeLabel.isHidden = false
                
                break
            }
        }
    }
    
    @IBOutlet weak var playAgainButton: UIButton!
    
    @IBAction func playAgain(_ sender: AnyObject)
    {
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        gameIsActive = true
        activePlayer = 1
        
        playAgainButton.isHidden = true
        outcomeLabel.isHidden = true
        
        for i in 1...9 {
        let button = view.viewWithTag(i) as! UIButton
        button.setImage(nil, for: UIControlState())
        }
    }
   
    
    @IBOutlet weak var infoButton: UIButton!
    
    @IBAction func showInfo(_ sender: Any) {
        let _: String
        title = "Touch on the board to place an X. Shake your device to place your opponents piece."
    }
   
   
    let message = "Touch on the board to place an X. Shake your device to place your opponents piece."
    /*
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    
    let action = UIAlertAction(title: "OK", style: .default, handler: { action in self.startNewRound()
    */
    

    //Close iOS Keyboard by touching anywhere using Swift
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        // Do any additional setup after loading the view, typically from a nib.
    }
    func dismissKeyboard() {
        //Causes the view (or one of it's embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

