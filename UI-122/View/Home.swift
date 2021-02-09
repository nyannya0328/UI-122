//
//  Home.swift
//  UI-122
//
//  Created by にゃんにゃん丸 on 2021/02/09.
//

import SwiftUI

struct Home: View {
    @State var selectedTab = "house.fill"
    @Environment(\.colorScheme) var schem
    @Binding var offset : CGFloat
   
    
    var body: some View {
        TabView(selection:$selectedTab){
            
          FeedView(offset: $offset)
                .padding(.top,edges?.top)
                .tag("house.fill")
            Text("H")
                .tag("clock.fill")
            Text("me")
                .tag("bandage.fill")
            Text("Hom")
                .tag("sum")
            Text("Hoe")
                .tag("macpro.gen2.fill")
            
        }
        .overlay(
            VStack(spacing:15){
                
                Divider()
                    .padding(.horizontal,-15)
                
                HStack{
                    
                    TabBarButton(image: "house.fill", selectedTab: $selectedTab)
                        .frame(maxWidth: .infinity)
                    
                    TabBarButton(image: "clock.fill", selectedTab: $selectedTab)
                        .frame(maxWidth: .infinity)
                    
                    TabBarButton(image: "bandage.fill", selectedTab: $selectedTab)
                        .frame(maxWidth: .infinity)
                    
                    TabBarButton(image: "sum", selectedTab: $selectedTab)
                        .frame(maxWidth: .infinity)
                    
                    TabBarButton(image: "macpro.gen2.fill", selectedTab: $selectedTab)
                        .frame(maxWidth: .infinity)
                    
                }
                .padding(.horizontal)
            }
            .padding(.bottom,edges?.bottom ?? 15)
            .background(schem == .dark ? Color.black : Color.white)
            ,alignment: .bottom
        )
        .ignoresSafeArea(.all, edges: .bottom)
        
    }
}


struct TabBarButton : View {
    var image : String
    @Binding var selectedTab : String
    var body: some View{
        
        Button(action: {
            withAnimation(.easeOut){
                
                selectedTab = image
            }
            
        }, label: {
            Image(systemName: image)
                .font(.title)
                .foregroundColor(selectedTab == image ? .primary : .gray)
            
            
            
        })
      
    
    
        .background(Color.red.offset(y: selectedTab == image ? 0 : 100))
        
        
    }
}
