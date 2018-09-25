//
//  OptionsViewController.swift
//  daily-chinese
//
//  Created by Simon Richards on 25/09/2018.
//  Copyright © 2018 Simon Richards. All rights reserved.
//

import UIKit
import ATHMultiSelectionSegmentedControl


class OptionsViewController: UIViewController , MultiSelectionSegmentedControlDelegate {
    
    // MARK: - IBOutlets
    /// The multi selection segmented control
    @IBOutlet weak var multiSegmentedControl: MultiSelectionSegmentedControl!
    /// The label indicating the selected indices
    @IBOutlet weak var selectedIndicesLabel: UILabel!
    /// Button for inserting segments
    @IBOutlet weak var insertSegmentButton: UIButton!
    /// Button for removing segments
    @IBOutlet weak var removeSegmentButton: UIButton!
    /// Button for remove all segments
    @IBOutlet weak var removeAllSegments: UIButton!

    @IBOutlet weak var selectHSKLevels: MultiSelectionSegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
    func multiSelectionSegmentedControl(_ control: MultiSelectionSegmentedControl, selectedIndices indices: [Int]) {
        
        selectedIndicesLabel.text = "Selected Indices: ["
        
        for index in indices {
            selectedIndicesLabel.text?.append("\(String(index)),")
        }
        
        if indices.count != 0 {
            selectedIndicesLabel.text = String(selectedIndicesLabel.text!.characters.dropLast())
        }
        
        selectedIndicesLabel.text?.append("]")
        
    }

}
