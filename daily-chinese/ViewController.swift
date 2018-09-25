//
//  ViewController.swift
//  daily-chinese
//
//  Created by Simon Richards on 24/09/2018.
//  Copyright © 2018 Simon Richards. All rights reserved.
//

import UIKit
import ATHMultiSelectionSegmentedControl


class ViewController: UIViewController, MultiSelectionSegmentedControlDelegate {
    // MARK: Properties
   
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

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        multiSegmentedControl.insertSegmentsWithTitles(["Title 1"])
//        multiSegmentedControl.delegate = self
    }

    @IBAction func insertSegment(_ sender: UIButton) {
        
        let title = "Title \(String(multiSegmentedControl.numberOfSegments + 1))"
        
        multiSegmentedControl.insertSegmentWithTitle(title, atIndex: multiSegmentedControl.numberOfSegments, animated: true)
        
    }
    
    @IBAction func removeSegment(_ sender: UIButton) {
        multiSegmentedControl.removeSegmentAtIndex(multiSegmentedControl.numberOfSegments, animated: true)
    }
    
    @IBAction func removeAllSegments(_ sender: UIButton) {
        multiSegmentedControl.removeAllSegments()
    }
    
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

