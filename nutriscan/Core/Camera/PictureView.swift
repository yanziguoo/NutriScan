//
//  PictureView.swift
//  nutriscan
//
//  Created by Simra Khan on 2024-01-13.
//

import Foundation

import SwiftUI
import PhotosUI

struct PictureView: View {
    @State private var showCamera = false
    @State private var selectedImage: UIImage?
    @State private var navigateToEditView = false

    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(
                    destination: EditView(image: selectedImage),
                    isActive: $navigateToEditView
                ) {
                    EmptyView()
                }
                
                Button("Open camera") {
                    self.showCamera.toggle()
                }
                .fullScreenCover(isPresented: self.$showCamera) {
                    accessCameraView(selectedImage: self.$selectedImage, navigateToEditView: self.$navigateToEditView)
                }
            }
            .navigationBarTitle("Main View")
        }
    }
}


struct accessCameraView: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage?
    @Binding var navigateToEditView: Bool
    @Environment(\.presentationMode) var isPresented

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .camera
        imagePicker.allowsEditing = true
        imagePicker.delegate = context.coordinator
        return imagePicker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        return Coordinator(picker: self)
    }
}

class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    var picker: accessCameraView

    init(picker: accessCameraView) {
        self.picker = picker
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.originalImage] as? UIImage else {
            self.picker.isPresented.wrappedValue.dismiss()
            return
        }
        self.picker.selectedImage = selectedImage
        self.picker.navigateToEditView = true
        self.picker.isPresented.wrappedValue.dismiss()
    }
}

struct PictureView_Previews: PreviewProvider {
    static var previews: some View {
        PictureView()
    }
}
