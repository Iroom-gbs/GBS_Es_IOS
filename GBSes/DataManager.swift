//
//  DataManager.swift
//  GBSes
//
//  Created by 박찬웅 on 2021/06/30.
//

import Foundation

var Asckpw = ""
var SlowMode = false
var Adelay = 1.0
var Bdelay = 0.5
var FirstAsck = false

func loadData(){
    if(!(UserDefaults.standard.string(forKey:"Asckpw")==nil))
    {
        Asckpw = UserDefaults.standard.string(forKey:"Asckpw")!
    }
    SlowMode = !UserDefaults.standard.bool(forKey:"Slowmode")
    
    if(!SlowMode)
    {
        Adelay = 3.0
        Bdelay = 2.0
    }
    else
    {
        Adelay = 1.0
        Bdelay = 0.5
    }
    FirstAsck = UserDefaults.standard.bool(forKey:"firstAsck")
}
