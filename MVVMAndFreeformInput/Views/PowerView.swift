//
//  ContentView.swift
//  MVVMAndFreeformInput
//
//  Created by Harshan Dhindsa on 2025-03-26.
//

import SwiftUI

import SwiftUI
 
struct PowerView: View {
    
    // MARK: Stored properties
    
    // Holds the view model, to track current state of
    // data within the app
    @State var viewModel = PowerViewModel()
 
    // MARK: Computed properties
    var body: some View {
        VStack {
            
            // Extra space at top
            Spacer()
            
            // OUTPUT
            // When the power can be unwrapped, show the result
            if let power = viewModel.power {
                
                // Show the provided base, exponent, and result
                // in an arrangement that looks the same as how
                // we write a power on paper in math class
                HStack(alignment: .center) {
                    HStack(alignment: .top) {
                        
                        if power.base >= 0 {
                            // No brackets when base is zero or positive
                        Text("\(power.base.formatted())")
                            .font(.system(size: 96))
                        } else {
                            // Show brackets when base is negative
                            Text("(\(power.base.formatted()))")
                                .font(.system(size: 96))
                        }
                            
                        Text("\(power.exponent)")
                            .font(.system(size: 44))
                    }
                    HStack {
 
                        Text("=")
                            .font(.system(size: 96))
                        
                        // Look for positive exponents
                        if power.exponent >= 0 {
                            Text("\(power.result.formatted())")
                                .font(.system(size: 96))
                        } else {
                           
                            //When the exponent is negative, present the result as a
                            //fraction
                            VStack(spacing: 0) {
                                Text("1")
                                    .font(.system(size: 96))
                                Rectangle()
                                    .frame(height:3)
                                Text("\(power.result.formatted())")
                                    .font(.system(size: 96))
                            }
                        }
                    }
                }
                .lineLimit(1)
                .minimumScaleFactor(0.5)
                .frame(height: 300)
 
            } else {
                
                // Show a message indicating that we are
                // awaiting reasonable input
                ContentUnavailableView(
                    "Unable to evaluate power",
                    systemImage: "gear.badge.questionmark",
                    description: Text(viewModel.recoverySuggestion)
                )
                .frame(height: 300)
            }
            
            // INPUT
            TextField("Base", text: $viewModel.providedBase)
                .textFieldStyle(.roundedBorder)
            
            TextField("Exponent", text: $viewModel.providedExponent)
                .textFieldStyle(.roundedBorder)
 
            // Extra space at bottom
            Spacer()
        }
        .padding()
    }
 
}
 
#Preview {
    PowerView()
}
