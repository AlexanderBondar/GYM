//
//  ImageExtension.swift
//  SwiftUITutorial
//
//  Created by dev on 14.04.2024.
//

import SwiftUI

extension Image {
  /// Resize an image with fill aspect ratio and specified frame dimensions.
  ///   - parameters:
  ///     - width: Frame width.
  ///     - height: Frame height.
  func resizedToFill(width: CGFloat, height: CGFloat)
  -> some View {
    self
      .resizable()
      .aspectRatio(contentMode: .fill)
      .frame(width: width, height: height)
  }
}
