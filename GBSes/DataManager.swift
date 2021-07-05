//
//  DataManager.swift
//  GBSes
//
//  Created by 박찬웅 on 2021/06/30.
//

import Foundation

var Asckpw = ""
var Adelay = 1.0
var Bdelay = 0.5

func loadData(){
    if(!(UserDefaults.standard.string(forKey:"Asckpw")==nil))
    {
        Asckpw = UserDefaults.standard.string(forKey:"Asckpw")!
    }
}
