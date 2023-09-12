//
//  QRGeneratorView.swift
//  RestauranteOfertas
//
//  Created by Camila Laura Lopez on 9/9/23.
//

import SwiftUI

struct QRGeneratorView: View {

    let uuid: UUID

    var body: some View {
        VStack {
        if let qrCodeImage = generateQRCode(from: uuid) {
            Image(uiImage: qrCodeImage)
                .resizable()
                .frame(width: 100, height: 100)
        } else {
            Text("Error generando el código QR")
        }
    }
}

private func generateQRCode(from uuid: UUID) -> UIImage? {
  let uuidString = uuid.uuidString

  if let data = uuidString.data(using: .utf8),
     let filter = CIFilter(name: "CIQRCodeGenerator") {
      filter.setValue(data, forKey: "inputMessage")

      if let ciImage = filter.outputImage {
          let transform = CGAffineTransform(scaleX: 10, y: 10)
          let scaledCIImage = ciImage.transformed(by: transform)

          if let cgImage = CIContext().createCGImage(scaledCIImage, from: scaledCIImage.extent) {
              return UIImage(cgImage: cgImage)
          }
      }
  }
  return nil
  }
}

struct QRCodeView_Previews: PreviewProvider {
static var previews: some View {
QRGeneratorView(uuid: UUID())
}
}

