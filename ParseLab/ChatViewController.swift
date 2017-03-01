//
//  ChatViewController.swift
//  ParseLab
//
//  Created by Aristotle on 2017-02-28.
//  Copyright © 2017 HLPostman. All rights reserved.
//

import UIKit
import Parse

class ChatViewController: UIViewController {

    @IBOutlet weak var messageField: UITextField!
    
    @IBOutlet var sendButton: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSendButton(_ sender: AnyObject) {
        let message = PFObject(className: "Message")
        message["text"] = messageField.text!
        message.saveInBackground(block: { (success: Bool, error: Error?) -> Void in
            if (success) {
                print("The message has been saved as \"\(message["text"]!)\"")
            } else {
                print(error!.localizedDescription)
            }
        })
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
