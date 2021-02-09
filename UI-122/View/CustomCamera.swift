//
//  CustomCamera.swift
//  UI-122
//
//  Created by にゃんにゃん丸 on 2021/02/09.
//

import SwiftUI
import AVFoundation

struct CameraView : View {
    @StateObject var camera = CameraModel()
    @Binding var offset : CGFloat
    var body: some View{
        
        ZStack{
           Camerapreview(camera: camera)
                
                .ignoresSafeArea(.all, edges: .all)
            
            
            VStack{
                
              
                
                Spacer()
                
                HStack{
                    if camera.istaken{
                        
                        Button(action: camera.retake, label: {
                            Image(systemName: "arrow.triangle.2.circlepath.camera")
                                .foregroundColor(.black)
                                .padding()
                                .background(Color.white)
                                .clipShape(Circle())
                        })
                        .padding(.trailing,10)
                        
                       
                    }
                    else{
                        
                        Button(action: camera.takepic, label: {
                            ZStack{
                                Circle()
                                    .fill(Color.white)
                                    .frame(width: 70, height: 70)
                                
                                Circle()
                                    .stroke(Color.white,lineWidth: 2)
                                    .frame(width: 75, height: 75)
                            }
                        })
                    }
                    
                }
                .frame(height: 75)
                .padding(.bottom,edges?.bottom ?? 15)
            }
        }
        .onAppear(perform: {
            camera.Check()
        })
        .onChange(of: offset) { (value) in
            if value == 0 && !camera.session.isRunning{
                
                camera.session.startRunning()
            }
            else{
                
                if camera.session.isRunning{
                    
                    camera.session.startRunning()
                }
            }
        }
    }
}
class CameraModel : NSObject, ObservableObject,AVCapturePhotoCaptureDelegate{
    
    @Published var istaken = false
    @Published var session = AVCaptureSession()
    @Published var alert = false
    @Published var output = AVCapturePhotoOutput()
    @Published var preview : AVCaptureVideoPreviewLayer!
    @Published var isSaved = false
    @Published var  picdata = Data(count: 0)
    
    func Check(){
        
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized:
            setup()
            return
            
        case .notDetermined :
            AVCaptureDevice.requestAccess(for: .video) { (statas) in
                if statas{
                    self.setup()//coloの場合selfが必要みたい
                }
            }
        case.denied:
            
            self.alert.toggle()
            return
            
        default:
            return
        }
        
    }
    func setup(){
        
        do{
            self.session.beginConfiguration()
            
            let device = AVCaptureDevice.default(.builtInDualCamera, for: .video, position: .back)
            
            let input = try AVCaptureDeviceInput(device: device!)
            
            if self.session.canAddInput(input){
                
                self.session.addInput(input)
                
            }
            
            if self.session.canAddOutput(self.output){
                
                self.session.addOutput(self.output)
            }
            
            self.session.commitConfiguration()
            
        }
        catch{
            
            print(error.localizedDescription)
             
        }
        
    }
    
    func retake(){
        
        
        DispatchQueue.global(qos: .background).async {
            
            self.session.startRunning()
            DispatchQueue.main.async {
                withAnimation{self.istaken.toggle()
                    self.isSaved = false
                }
            }
        }
    }
    func takepic(){
        DispatchQueue.global(qos: .background).async{
            
            self.output.capturePhoto(with: AVCapturePhotoSettings(), delegate: self )
            self.session.stopRunning()
            
            DispatchQueue.main.async {
                withAnimation{self.istaken.toggle()}
        }
    }
}
    
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        if error != nil{ return}
               
                    print("phto pic")
        guard let imagedata = photo.fileDataRepresentation()else {return}
        self.picdata = imagedata
           
    }
//    func savePick(){
//        let image = UIImage(data: self.picdata)!
//
//        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
//
//        self.isSaved = true
//
//        print("SavedSuccess")
//    }
    
}

struct Camerapreview : UIViewRepresentable {
    @ObservedObject var  camera : CameraModel
    
    func makeUIView(context: Context) -> UIView {
        let view = UIView(frame: UIScreen.main.bounds)
        camera.preview = AVCaptureVideoPreviewLayer(session: camera.session)
        camera.preview.frame = view.frame
        
        camera.preview.videoGravity = .resizeAspectFill
        
        view.layer.addSublayer(camera.preview)
        
      
        
        return view
    }
    func updateUIView(_ uiView: UIView, context: Context) {
        
    }
}
