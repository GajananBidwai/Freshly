//
//  ToastModifier.swift
//  Freshly
//
//  Created by Neosoft on 18/07/25.
//

import SwiftUI

struct ToastModifier: ViewModifier {
    let message: String
    @Binding var isPresented: Bool
    let duration: TimeInterval

    func body(content: Content) -> some View {
        ZStack {
            content

            if isPresented {
                VStack {
                    Spacer()

                    Text(message)
                        .font(.system(size: 14, weight: .semibold))
                        .padding(.horizontal, 20)
                        .padding(.vertical, 12)
                        .background(Color.black.opacity(0.85))
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .padding(.bottom, 10)
                        .transition(.move(edge: .bottom).combined(with: .opacity))
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                                withAnimation {
                                    isPresented = false
                                }
                            }
                        }
                }
                .animation(.easeInOut, value: isPresented)
            }
        }
    }
}

//#Preview {
//    var isPresent = true
//    ToastModifier(message: "Hello", isPresented: isPresent, duration: 4.0)
//}
