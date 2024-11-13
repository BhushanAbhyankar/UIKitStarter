//
//  WebPageViewController.swift
//  FirstUIKitProj
//
//  Created by Bhushan Abhyankar on 12/11/2024.
//

import UIKit
import WebKit

class WebPageViewController: UIViewController,WKNavigationDelegate {

    @IBOutlet weak var myWebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        loadMyWebPage()
        myWebView.navigationDelegate = self
    }
    private func loadMyWebPage(){
        guard let url = URL(string: "https://www.apple.com/") else{return}
        let requet = URLRequest(url: url)
        myWebView.load(requet)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: any Error) {
        print(error.localizedDescription)
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction) async -> WKNavigationActionPolicy {
        if webView.url?.absoluteString == "https://www.apple.com/"{
            return .allow
        }
        return .allow
    }
}
