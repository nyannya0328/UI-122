//
//  FeedView.swift
//  UI-122
//
//  Created by にゃんにゃん丸 on 2021/02/09.
//

import SwiftUI

struct FeedView: View {
    @State var select = false
    @Binding var offset : CGFloat
    var body: some View {
        VStack{
            
            HStack{
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "plus.app")
                        .font(.title)
                        .foregroundColor(.blue)
                    
                    
                })
                
                Spacer()
                
                Button(action: {
                    offset = rect.width * 2
                    
                }, label: {
                    Image(systemName: "paperplane.fill")
                        .font(.title2)
                        .foregroundColor(.primary)
                })
                
            }
            .overlay(
            Text("InstaGram")
                .font(.title)
                .font(.system(size: 50, weight: .heavy))
                .foregroundColor(.purple)
                .shadow(radius: 5)
                
                
            
                
            )
            .padding()
            ScrollView(.vertical, showsIndicators: false, content: {
                ScrollView(.horizontal, showsIndicators: false, content: {
                    
                    HStack(spacing:10){
                        Button(action: {
                            select.toggle()
                            
                        }, label: {
                            Image(select ? "p1" : "logo")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                        })
                            .overlay(
                            
                            Image(systemName: "plus")
                                .font(.title)
                                .aspectRatio(contentMode: .fit)
                                .clipShape(Circle())
                                .foregroundColor(.black)
                                .background(Color.white.clipShape(Circle()))
                                .offset(x: 8, y: 5)
                                
                                
                                ,alignment: .bottomTrailing
                                
                            )
                        Button(action: {
                            select.toggle()
                            
                        }, label: {
                            Image(select ? "logo" : "p1")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                        })
                            .overlay(
                            
                            Image(systemName: "plus")
                                .font(.title)
                                .aspectRatio(contentMode: .fit)
                                .clipShape(Circle())
                                .foregroundColor(.black)
                                .background(Color.white.clipShape(Circle()))
                                .offset(x: 8, y: 5)
                                
                                
                                ,alignment: .bottomTrailing
                                
                            )
                        
                    }
                    .padding()
                })
                Divider()
                    .padding(.horizontal,-15)
                
                VStack(spacing:15){
                    
                    ForEach(posts){post in
                        
                        PostCardView(post: post)
                        
                        
                    }
                    
                }
                .padding(.bottom,65)
               
            })
          
            
            
        }
    }
}



struct PostCardView : View {
    var post :post
    @State var text = ""
    var body: some View{
        
        
        VStack{
            
            HStack{
                
                Image(post.profile)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                
                Text(post.user)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Spacer()
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "wifi")
                        .font(.title)
                        .foregroundColor(.primary)
                })
                
                
            }
            .padding()
            Image(post.postImage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: rect.width - 30)
                .cornerRadius(10)
            
            HStack(spacing:15){
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "heart.fill")
                        .font(.system(size: 25))
                })
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "iphone.homebutton")
                        .font(.system(size: 25))
                })
                
                Spacer()
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "books.vertical.fill")
                        .font(.system(size: 25))
                })
                
                
                
            }
            .padding()
            .foregroundColor(.primary)
            
            (
                Text("\(post.user)  ")
                
                +
                
                    Text(post.postTitle)
            
            )
            .frame(maxWidth: .infinity,alignment: .leading)
            .padding(6)
            
            HStack{
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 55, height: 55)
                    .clipShape(Circle())
                
                TextField("Enter", text: $text)
                
                
            }
            
            Text(post.time)
                .font(.caption)
                .fontWeight(.bold)
                .foregroundColor(.gray)
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding(6)
                
            
        }
        
       
    }
}
