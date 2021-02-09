//
//  MainView.swift
//  UI-122
//
//  Created by にゃんにゃん丸 on 2021/02/09.
//

import SwiftUI

struct MainView: View {
    @State var offset : CGFloat = rect.width
    var body: some View {
        GeometryReader{reader in
            
            let frame = reader.frame(in: .global)
            
            Scrollabletab(tabs: ["","",""], rect: frame, offset: $offset) {
                
                
                PostView(offset: $offset)
                
                
                Home(offset: $offset)
                
                DirectView(offset : $offset)
                
            }
            .ignoresSafeArea()
            
            
            
            
        }
        .ignoresSafeArea()
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
