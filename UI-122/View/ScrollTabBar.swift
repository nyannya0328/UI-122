//
//  ScrollTabBar.swift
//  UI-122
//
//  Created by にゃんにゃん丸 on 2021/02/09.
//

import SwiftUI

struct Scrollabletab<Content:View>: UIViewRepresentable {
   
    
    var content : Content
    let scrollview = UIScrollView()
    
    var rect : CGRect
    @Binding var offset : CGFloat
    
    var tabs : [Any]
    
    init(tabs:[Any],rect : CGRect,offset : Binding<CGFloat>,@ViewBuilder content : ()-> Content) {
        self.content = content()
        self._offset = offset
        self.rect = rect
        self.tabs = tabs
    }
    func makeCoordinator() -> Coordinator {
        return Scrollabletab.Coordinator(parent: self)
    }
    
    func makeUIView(context: Context) -> UIScrollView {
        setUpscrollView()
        scrollview.contentSize = CGSize(width: rect.width * CGFloat(tabs.count), height: rect.height)
        
        scrollview.contentOffset.x = offset
        scrollview.addSubview(extractview())
        scrollview.delegate = context.coordinator
        return scrollview
        
    }
    
    func updateUIView(_ uiView: UIScrollView, context: Context) {
        if uiView.contentOffset.x != offset{
            uiView.delegate = nil
            
            UIView.animate(withDuration: 0.5) {
                uiView.contentOffset.x = offset
            } completion: { (status) in
                if status{uiView.delegate = context.coordinator}
            }

            
        }
        
    }
    
    
    func setUpscrollView(){
    
       scrollview.isPagingEnabled = true
       scrollview.bounces = false
       scrollview.showsVerticalScrollIndicator = false
       scrollview.showsHorizontalScrollIndicator = false

        
    }
    
    func extractview() -> UIView{
        
        let controller = UIHostingController(rootView: HStack(spacing:0){content}.ignoresSafeArea())
        controller.view.frame = CGRect(x: 0, y: 0, width: rect.width * CGFloat(tabs.count), height: rect.height)
        
        return controller.view!
        
        
    }
    
    class Coordinator : NSObject,UIScrollViewDelegate{
        
        var parent : Scrollabletab
        
        init(parent:Scrollabletab) {
            self.parent = parent
        }
        
        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            parent.offset = scrollView.contentOffset.x
            
        
            
            
        }
        
        
    }
    
    
}
