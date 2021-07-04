//
//  AsckView.swift
//  GBSes
//
//  Created by 박찬웅 on 2021/06/30.
//

import SwiftUI
import WebKit

struct AsckContentView: View {
    var body: some View {
            Webview(url: URL(string: "https://hcs.eduro.go.kr/#/loginHome")!)
    }
}

struct Webview: UIViewRepresentable
{ //자가진단 사이트 띄우는 WebView
    var url:URL
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> WKWebView
    {
        print("maked UI")
        let preferences = WKPreferences()
            preferences.javaScriptCanOpenWindowsAutomatically = true
        
        let configuration = WKWebViewConfiguration()
        configuration.preferences = preferences
        
    
        let webview = WKWebView()
        webview.navigationDelegate = context.coordinator
        let request = URLRequest(url: self.url, cachePolicy: .returnCacheDataElseLoad)
        webview.load(request)

        return webview
    }
        
    func updateUIView(_ webview: WKWebView, context: Context)
    {
        print("Updated UI")
    }
    
    
    class Coordinator: NSObject, WKNavigationDelegate {
        var parent: Webview
        
        init(_ uiWebView:Webview) {
            self.parent = uiWebView
        }
        
        func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Swift.Void) {
                decisionHandler(.allow)
        }

        
        func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
            print("Start loading")
        }
        
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            print("Finish loading")
            let currentURL = webView.url?.absoluteString
            switch currentURL
            {
            case "https://hcs.eduro.go.kr/#/relogin",
                "https://hcs.eduro.go.kr/#/loginWithUserInfo":
                webView.evaluateJavaScript("document.getElementsByTagName(\"input\")[0].setRangeText(\"1102\")")
                webView.evaluateJavaScript("document.getElementById(\"btnConfirm\").click()")
               
            case "https://hcs.eduro.go.kr/#/main":
                webView.evaluateJavaScript("document.getElementsByTagName(\"a\")[1].click()")
                
            case "https://hcs.eduro.go.kr/#/survey":
                webView.evaluateJavaScript("document.getElementById(\"survey_q1a1\").click()")
                webView.evaluateJavaScript("document.getElementById(\"survey_q2a1\").click()")
                webView.evaluateJavaScript("document.getElementById(\"survey_q3a1\").click()")
                webView.evaluateJavaScript("document.getElementById(\"btnConfirm\").click()")
                
            default:
                print("Swift는 귀찮게도 switch문에 default를 요구합니다.")
            }
        }
    }
}





struct AsckView_Previews: PreviewProvider {
    static var previews: some View {
        Webview(url: URL(string: "https://hcs.eduro.go.kr/#/loginHome")!)
    }
}
