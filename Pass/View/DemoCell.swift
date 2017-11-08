//
//  DemoCell.swift
//  FoldingCell
//
//  Created by Alex K. on 25/12/15.
//  Copyright © 2015 Alex K. All rights reserved.
//

import UIKit
import FoldingCell

class DemoCell: FoldingCell {
  
  @IBOutlet weak var closeNumberLabel: UILabel!
  @IBOutlet weak var openNumberLabel: UILabel!
    @IBOutlet weak var closeTitle: UILabel!
    @IBOutlet weak var openTitle: UILabel!
    @IBOutlet weak var openBarColo: UIView!
    @IBOutlet weak var bigBGColor: UIView!
    @IBOutlet weak var closedBGColor: UIView!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var descLabel: UILabel!
    
    var titleText = ""
    
    var number: Int = 0 {
    didSet {
      closeNumberLabel.text = titleText
      openNumberLabel.text = titleText
        
    }
  }
    
  
  override func awakeFromNib() {
    foregroundView.layer.cornerRadius = 10
    foregroundView.layer.masksToBounds = true
    super.awakeFromNib()
  }
  
  override func animationDuration(_ itemIndex: NSInteger, type: FoldingCell.AnimationType) -> TimeInterval {
    let durations = [0.26, 0.2, 0.2]
    return durations[itemIndex]
  }
  
}

// MARK: - Actions ⚡️
extension DemoCell {
  
  @IBAction func buttonHandler(_ sender: AnyObject) {
    print("tap")
  }
  
}
