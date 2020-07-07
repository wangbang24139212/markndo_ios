//
//  ViewController.swift
//  markndo
//
//  Created by venus on 7/6/20.
//  Copyright © 2020 venus. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var activity: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadWebsite()
    }
    
    private func loadWebsite() {
        let webURL = URL(string: "http://jonathane3.sg-host.com/crm")
        let requestURL = URLRequest(url: webURL!)
        webView.load(requestURL)
        
        webView.addSubview(activity)
        activity.startAnimating()
        webView.navigationDelegate = self
        activity.hidesWhenStopped = true
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        activity.startAnimating()
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activity.stopAnimating()
    }

    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        activity.stopAnimating()
    }

}

