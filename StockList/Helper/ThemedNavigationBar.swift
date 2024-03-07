//
//  ThemedNavigationBar.swift
//  StockList
//
//  Created by Maruf Memon on 07/03/24.
//

import SwiftUI

extension View {
  func themedNavigationBar(_ background: Color = .purple) -> some View {
    return self
      .modifier(ThemedNavigationBar(background: background))
  }
}

struct ThemedNavigationBar: ViewModifier {
  var background: Color
  
  func body(content: Content) -> some View {
    content
      .toolbarBackground(
        background,
        for: .navigationBar
      )
      .toolbarColorScheme(.dark, for: .navigationBar)
      .toolbarBackground(.visible, for: .navigationBar)
  }
}
