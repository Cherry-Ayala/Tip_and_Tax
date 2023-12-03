//
//  ContentView.swift
//  Tip_and_Tax
//
//  Created by Charlie Ayala on 18/08/23.
//

import SwiftUI

struct ContentView: View {
    @State private var totalText = ""
    @State private var resultText = ""
    @State private var tipAmount = 0.0
    
    var body: some View {
        VStack {
            TextField("Total", text: $totalText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button(action: calculateTaxes) {
                Text("Calculate Taxes")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            
            HStack {
                TipButton(label: "5% Tip", tipPercentage: 0.05, parent: self)
                TipButton(label: "10% Tip", tipPercentage: 0.10, parent: self)
                TipButton(label: "15% Tip", tipPercentage: 0.15, parent: self)
            }
            
            Text(resultText)
                .padding()
            
            Button(action: reset) {
                Text("Reset")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.red)
                    .cornerRadius(10)
            }
        }
        .padding()
    }
    
    func calculateTaxes() {
        if let total = Double(totalText) {
            let taxes = total * 0.0625
            resultText = String(format: "Taxes: $%.2f", taxes)
        } else {
            resultText = "Enter a valid total"
        }
    }
    
    func calculateTip(tipPercentage: Double) {
        if let total = Double(totalText) {
            tipAmount = total * tipPercentage
            resultText = String(format: "Tip: $%.2f", tipAmount)
        } else {
            resultText = "Enter a valid total"
        }
    }
    
    func reset() {
        totalText = ""
        resultText = ""
        tipAmount = 0.0
    }
}

struct TipButton: View {
    let label: String
    let tipPercentage: Double
    let parent: ContentView
    
    var body: some View {
        Button(action: { calculateTip() }) {
            Text(label)
                .padding()
                .foregroundColor(.white)
                .background(Color.green)
                .cornerRadius(10)
        }
    }
    
    func calculateTip() {
        parent.calculateTip(tipPercentage: tipPercentage)
    }
}
