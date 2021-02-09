//
//  ContentView.swift
//  UI-122
//
//  Created by にゃんにゃん丸 on 2021/02/09.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    var body: some View {
       MainView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

var rect = UIScreen.main.bounds
var edges = UIApplication.shared.windows.first?.safeAreaInsets
