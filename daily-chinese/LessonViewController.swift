//
//  LessonViewController.swift
//  daily-chinese
//
//  This view presents a ChinesePod lesson to be studied.
//  For now the prototype just displays a WKWebView frame showing a lesson on the
//  ChinesePod site but thios should probably implement the lessons in a
//  more native way for the final app.
//
//  Created by Simon Richards on 25/09/2018.
//  Copyright © 2018 Simon Richards. All rights reserved.
//

import UIKit
import WebKit

class LessonViewController: UIViewController, WKUIDelegate {
    
    var webView: WKWebView!

    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let myURL = URL(string:"https://chinesepod.com/lessons/no-bargaining")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
