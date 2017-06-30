//
//  CollapsableCellViewController.swift
//  Test
//
//  Created by Steve Cochran on 6/29/17.
//  Copyright © 2017 Example, Inc. All rights reserved.
//

import UIKit

class CollapsableCellViewController: UITableViewController {

  var data = [DataItem]()
  var isExpanded = [Bool]()
  
  // Random Data
  var titles = ["Roka Bioscience, Inc.","Pure Storage, Inc.","Iridium Communications Inc"]
  var subtitles = ["Prinza","Bobai","Wangren"]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    // set up sample data
    let st = SampleText()
    for i in 0..<3 {
      var item = DataItem()
      item.title = titles[i]
      item.price = "$\(Int(arc4random_uniform(UInt32(9999))))"
      item.subTitle1 = subtitles[i]
      item.detail1 = st.getText(ofLength: Int(arc4random_uniform(UInt32(350))) + 50)

      data.append(item)
      
      // random number to determine if cell is initially expanded
      isExpanded.append(Int(arc4random_uniform(UInt32(2))) == 0 ? true : false)
    }
    
    // settings for dynamic resizing table cells
    tableView.rowHeight = UITableViewAutomaticDimension
    tableView.estimatedRowHeight = 50
  }

  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return data.count
  }
  
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "collapsableCell", for: indexPath) as! CollapsableCell
    let item = data[indexPath.row]
    
    cell.titleLabel?.text = item.title
    cell.priceLabel?.text = item.price
    
    // update fields
    cell.detailLabel.text = self.isExpanded[indexPath.row] ? item.detail1 : ""
    cell.subtitleLabel.text = self.isExpanded[indexPath.row] ? item.detail1 : ""
    cell.disclosureImage.image = self.isExpanded[indexPath.row] ? #imageLiteral(resourceName: "chevron-down") : #imageLiteral(resourceName: "chevron-right")
    
    return cell
  }
  
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    guard let cell = tableView.cellForRow(at: indexPath) as? CollapsableCell else { return }
    let item = data[indexPath.row]
    
    // update fields
    cell.detailLabel.text = self.isExpanded[indexPath.row] ? item.detail1 : ""
    cell.subtitleLabel.text = self.isExpanded[indexPath.row] ? item.detail1 : ""
    cell.disclosureImage.image = self.isExpanded[indexPath.row] ? #imageLiteral(resourceName: "chevron-down") : #imageLiteral(resourceName: "chevron-right")

    // update table
    tableView.beginUpdates()
    tableView.endUpdates()
 
    // toggle hidden status
    isExpanded[indexPath.row] = !isExpanded[indexPath.row]
    
  }
}
