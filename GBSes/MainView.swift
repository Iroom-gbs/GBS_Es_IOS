//
//  MainView.swift
//  메인화면
//  GBSes
//
//  Created by 박찬웅 on 2021/06/29.
//

import SwiftUI

struct MainContentView: View {
    var body: some View {
        NavigationView{
            VStack (alignment: .leading){
                NavigationLink(
                    destination: Webview())
                {
                    Text("자가진단하기") //버튼 제작시 Image로 변경 예정
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                }
                Text("최초 자가진단은 수동으로 진행해야 합니다.")
                    .font(.caption)
                    .padding(.bottom)
                NavigationLink(
                    destination: SettingView())
                {
                    Text("설정")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                }
                Text("이것저것")
                    .font(.caption)
                    .padding(.bottom)
                NavigationLink(destination: CreditView())
                {
                    Text("IROOM : GBSessential")
                        .fontWeight(.heavy)
                        .font(.title)
                        .foregroundColor(.blue)
                }
                Text("IROOM is freeRiding Our OptimuM project")
                    .font(.caption)
            }
            .navigationTitle("")
            .navigationBarHidden(true)
        }.onAppear(){loadData()}
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MainContentView()
        }
    }
}

