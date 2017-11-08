//
//  MainTableViewController.swift
//  Pass
//
//  Created by Eno Reyes on 10/26/17.
//  Copyright © 2017 Eno Reyes. All rights reserved.
//

import UIKit
import FoldingCell

class MainTableViewController: UITableViewController {
  
  let kCloseCellHeight: CGFloat = 179
  let kOpenCellHeight: CGFloat = 488
  let kRowsCount = 10
  var cellHeights: [CGFloat] = []
  var colors = [Colors.flatRed, Colors.flatBlue, Colors.flatGreen, Colors.flatYellow, Colors.flatPurple, Colors.flatDarkGreen]
  var titles = ["Tiger Inn", "Ivy Club", "Tower Club", "Chi Phi Rager", "Dave's BDay", "Pub Night"]
  
  var descriptions = ["Tiger Inn is one of eleven active eating clubs at Princeton.",
                      "Ivy Club is one of eleven active eating clubs at Princeton.",
                      "Tower Club is one of eleven active eating clubs at Princeton.",
                      "Chi Phi is having a rager today. Don't miss out #fraternity",
                      "You already know who it is. Your boy dave is throwing down.",
                      "Alpha Dog Brewery is hosting a pub crawl for fine food and drink."]
    
    
  override func viewDidLoad() {
    super.viewDidLoad()
    setup()
  }
  
  private func setup() {
    cellHeights = Array(repeating: kCloseCellHeight, count: kRowsCount)
    tableView.estimatedRowHeight = kCloseCellHeight
    tableView.rowHeight = UITableViewAutomaticDimension
    tableView.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "background"))
  }
    
    @IBAction func unwindToPasses(segue:UIStoryboardSegue) {
         
    }

}

// MARK: - TableView
extension MainTableViewController {
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 6
  }
  
  override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    guard case let cell as DemoCell = cell else {
      return
    }
    
    cell.backgroundColor = .clear
    cell.titleText = titles[indexPath.row]
    cell.openBarColo.backgroundColor = colors[indexPath.row]
    cell.bigBGColor.backgroundColor = colors[indexPath.row]
    cell.closedBGColor.backgroundColor = colors[indexPath.row]
    cell.descLabel.text = descriptions[indexPath.row]

    
    if cellHeights[indexPath.row] == kCloseCellHeight {
      cell.unfold(false, animated: false, completion:nil)
    } else {
      cell.unfold(true, animated: false, completion: nil)
    }
    
    cell.number = indexPath.row
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "FoldingCell", for: indexPath) as! FoldingCell
    let durations: [TimeInterval] = [0.26, 0.2, 0.2]
    cell.durationsForExpandedState = durations
    cell.durationsForCollapsedState = durations
    return cell
  }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return cellHeights[indexPath.row]
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    let cell = tableView.cellForRow(at: indexPath) as! FoldingCell
    
    if cell.isAnimating() {
      return
    }
    
    var duration = 0.0
    let cellIsCollapsed = cellHeights[indexPath.row] == kCloseCellHeight
    if cellIsCollapsed {
      cellHeights[indexPath.row] = kOpenCellHeight
      cell.unfold(true, animated: true, completion: nil)
      duration = 0.5
    } else {
      cellHeights[indexPath.row] = kCloseCellHeight
      cell.unfold(false, animated: true, completion: nil)
      duration = 0.8
    }
    
    UIView.animate(withDuration: duration, delay: 0, options: .curveEaseOut, animations: { () -> Void in
      tableView.beginUpdates()
      tableView.endUpdates()
    }, completion: nil)
    
  }
  
}
