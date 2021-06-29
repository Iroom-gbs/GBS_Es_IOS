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
        VStack (alignment: .leading){
            AsckButton(title: "간편 자가진단하기").padding()
            Text("IROOM : GBSessential(D)")
                .padding(.bottom, 0.0)
                .font(.title)
                .foregroundColor(.blue)
            Text("IROOM is freeRiding Our OptimuM project")
                .font(.caption)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MainContentView()
        }
    }
}

//자가진단 버튼
struct AsckButton: View {
    var title: String
    var body: some View {
        Button(action:Asck){
            ZStack{
                Color.blue
                Text(title)
                    .foregroundColor(.white)
                    .font(.title)
            }
        }
    }
}
