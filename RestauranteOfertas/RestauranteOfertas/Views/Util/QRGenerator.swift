//
//  QRGenerator.swift
//  RestauranteOfertas
//
//  Created by Camila Laura Lopez on 9/9/23.
//

import Foundation
import CoreImage.CIFilterBuiltins


let context = CIContext()
let filter = CIFilter.qrCodeGenerator()


struct GenerateQRCode : CIImage {
func generateQRCode(from string: String) -> UIImage {
    filter.message = Data(string.utf8)

    if let outputImage = filter.outputImage {
        if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
            return UIImage(cgImage: cgimg)
        }
    }

    return UIImage(systemName: "xmark.circle") ?? UIImage()
}
