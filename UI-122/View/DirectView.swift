//
//  DirectView.swift
//  UI-122
//
//  Created by にゃんにゃん丸 on 2021/02/09.
//

import SwiftUI

struct DirectView: View {
    @Binding var offset : CGFloat
    @State var search = ""
    var body: some View {
        VStack{
            
            HStack(spacing:10){
                
                Button(action: {
                    offset = rect.width
                    
                }) {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                    
                    Text("Direct")
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                        .shadow(radius: 10)
                    
                }
                
                Spacer()
                
                HStack{
                    Button(action: {}) {
                        
                        Image(systemName: "video")
                            .font(.title)
                            .foregroundColor(.gray)
                        
                        
                    }
                    
                    Button(action: {}) {
                        
                        Image(systemName: "square.and.pencil")
                            .font(.title)
                            .foregroundColor(.black)
                        
                        
                    }
                }
                
                
            }
            
            .padding()
            ScrollView{
                
                VStack(spacing:15){
                    
                    HStack(spacing:10){
                        
                        Image(systemName: "magnifyingglass")
                            .font(.title2)
                        
                        
                        TextField("Search", text: $search)
                        
                        
                    }
                    .padding(.vertical,10)
                    .padding(.horizontal)
                    .background(Color.primary.opacity(0.03))
                    .shadow(color: Color.black.opacity(0.3), radius: 8, x: 8, y: 8)
                    .shadow(color: Color.white.opacity(0.3), radius: -8, x: -8, y: -8)
                    .clipShape(Capsule())
                    
                    ForEach(posts){post in
                        
                        HStack{
                            
                            Image(post.profile)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 56, height: 56)
                                .clipShape(Circle())
                            
                            Text(post.user)
                                .fontWeight(.light)
                            
                            Spacer()
                            
                            
                            Button(action: {}) {
                                
                                Image(systemName: "laptopcomputer")
                                    .font(.title)
                                
                            }
                            .foregroundColor(.gray)
                            
                            
                        }
                        .padding(.top,5)
                        .padding(.horizontal)
                    
                        
                        
                    }
                    
                    
                }
                
                
            }
            
        }
        .frame(maxWidth: .infinity)
        .padding(.top,edges?.top ?? 15)
        .padding(.bottom,edges?.bottom ?? 15)
    }
}

struct DirectView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
