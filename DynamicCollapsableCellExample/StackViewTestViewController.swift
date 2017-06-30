//
//  StackViewTestViewController.swift
//  Test
//
//  Created by Steve Cochran on 6/29/17.
//  Copyright © 2017 Example, Inc. All rights reserved.
//

import UIKit

class StackViewTestViewController: UIViewController {

  let st = SampleText()
  
  @IBOutlet weak var title1Label: UILabel!
  @IBOutlet weak var detail1Label: UILabel!
  @IBOutlet weak var title2Label: UILabel!
  @IBOutlet weak var detail2Label: UILabel!
  @IBOutlet weak var title3Label: UILabel!
  @IBOutlet weak var detail3Label: UILabel!
  
  
  @IBAction func didClick(_ sender: UITapGestureRecognizer) {
    // reset the details to test resizing
    
    let i = Int(arc4random_uniform(UInt32(3)))
    
    switch i {
    case 0:
      UIView.animate(withDuration: 0.4, animations: {
        self.detail1Label.text = self.st.getText(ofLength: Int(arc4random_uniform(UInt32(250))) + 10)
      })
    case 1:
      UIView.animate(withDuration: 0.4, animations: {
        self.detail2Label.text = self.st.getText(ofLength: Int(arc4random_uniform(UInt32(250))) + 10)
      })
    case 2:
      UIView.animate(withDuration: 0.4, animations: {
        self.detail3Label.text = self.st.getText(ofLength: Int(arc4random_uniform(UInt32(250))) + 10)
      })
    default:
      UIView.animate(withDuration: 0.4, animations: {
        self.detail3Label.text = self.st.getText(ofLength: Int(arc4random_uniform(UInt32(250))) + 10)
      })
    }
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    title1Label.text = "One"
    title2Label.text = "Two"
    title3Label.text = "Three"
    
    detail1Label.text = st.getText(ofLength: Int(arc4random_uniform(UInt32(250))) + 10)
    detail2Label.text = st.getText(ofLength: Int(arc4random_uniform(UInt32(250))) + 10)
    detail3Label.text = st.getText(ofLength: Int(arc4random_uniform(UInt32(250))) + 10)
    
  }


  override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
  }
}

