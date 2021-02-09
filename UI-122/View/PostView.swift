//
//  PostView.swift
//  UI-122
//
//  Created by にゃんにゃん丸 on 2021/02/09.
//

import SwiftUI

struct PostView: View {
    @Binding var offset : CGFloat
    var body: some View {
        ZStack{
            Color.black
            
            CameraView(offset: $offset)
        
            
            VStack{
                
                HStack{
                    
                    
                    Button(action: {}) {
                        
                        Image(systemName: "gear")
                            .font(.title)
                            
                        
                        
                    }
                    Spacer()
                    
                    Button(action: {
                        
                        offset = rect.width
                        
                    }) {
                        
                        Image(systemName: "xmark")
                            .font(.title)
                        
                        
                    }
                    
                    
                }
                .padding()
                .foregroundColor(.white)
                
                Spacer()
                
                Button(action: {}) {
                    Image(systemName: "photo")
                        .font(.title)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity,alignment: .trailing)
                    
                }
                .padding()
                
                
                
            }
            .padding(.top,edges?.top ?? 15)
            .padding(.bottom,edges?.bottom)
        }
    }
}


