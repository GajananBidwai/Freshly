//
//  CountryPicker.swift
//  Freshly
//
//  Created by Neosoft on 30/06/25.
//

import SwiftUI
import CountryPicker
struct CountryPickerUI: UIViewControllerRepresentable {
    @Binding var country: Country?
    
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    class Coordinator: NSObject, CountryPickerDelegate{
        var  parent: CountryPickerUI
        
        init(parent: CountryPickerUI) {
            self.parent = parent
        }
        
        func countryPicker(didSelect country: CountryPicker.Country) {
            parent.country = country
        }
        
        
    }
    func makeUIViewController(context: Context) -> some UIViewController {
        let countryPicker = CountryPickerViewController()
        countryPicker.selectedCountry = "IN"
        countryPicker.delegate = context.coordinator
        
        return countryPicker
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
}
