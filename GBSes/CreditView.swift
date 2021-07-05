//
//  CreditView.swift
//  GBSes
//
//  Created by 박찬웅 on 2021/07/05.
//

import SwiftUI

struct CreditView: View {
    var body: some View {
        VStack(alignment:.center)
        {
            Text("Team IROOM").font(.largeTitle).foregroundColor(.blue).fontWeight(.heavy)
            Text("GBSessential IOS v0.2").padding(.bottom)
            Text("프론트엔드 개발").font(.callout).fontWeight(.heavy)
            Button(action: {
                guard let url = URL(string: "https://www.github.com/zlfn"), UIApplication.shared.canOpenURL(url) else { return }
                 UIApplication.shared.open(url, options: [:], completionHandler: nil)
                        }) {
                Text("박찬웅(1307)").padding(.bottom).foregroundColor(.black)
                        }
            Text("백엔드 개발").font(.callout).fontWeight(.heavy)
            Button(action: {
                guard let url = URL(string: "https://www.github.com/dayo05"), UIApplication.shared.canOpenURL(url) else { return }
                 UIApplication.shared.open(url, options: [:], completionHandler: nil)
                        }) {
                Text("김지민(1408)").foregroundColor(.black)
                        }
            Button(action: {
                guard let url = URL(string: "https://www.github.com/hegelty"), UIApplication.shared.canOpenURL(url) else { return }
                 UIApplication.shared.open(url, options: [:], completionHandler: nil)
                        }) {
                Text("나태양(1203)").padding(.bottom).foregroundColor(.black)
                        }
            Text("디자인(게으름)").font(.callout).fontWeight(.heavy)
            Button(action: {
                guard let url = URL(string: "https://www.instagram.com/dlfnal_05/"), UIApplication.shared.canOpenURL(url) else { return }
                 UIApplication.shared.open(url, options: [:], completionHandler: nil)
                        }) {
                Text("이루미(1213)").padding(.bottom).foregroundColor(.black)
                        }
        }.padding(.bottom,200).padding(.horizontal)
    }
}

struct CreditView_Previews: PreviewProvider {
    static var previews: some View {
        CreditView()
    }
}
