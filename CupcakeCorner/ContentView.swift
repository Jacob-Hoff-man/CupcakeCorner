//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Jacob on 10/27/20.
//  Copyright © 2020 Jacob. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var order = Order()
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Select cake type:",
                           selection: $order.type) {
                            ForEach(0..<Order.types.count, id: \.self) {
                                Text(Order.types[$0])
                            }
                    }
                    
                    Stepper(value: $order.quantity, in: 3...24) {
                        Text("Number of cakes:  \(order.quantity)")
                    }
                }
                
                Section {
                    Toggle(isOn: $order.specialRequestEnabled.animation()) {
                        Text("Special requests?")
                    }
                    
                    if order.specialRequestEnabled {
                        Toggle(isOn: $order.addSprinkles) {
                            Text("Add sprinkles?")
                        }
                        
                        Toggle(isOn: $order.extraFrosting) {
                            Text("Extra frosting?")
                        }
                    }
                }
                
                Section {
                    NavigationLink(destination: AddressView(order: order)) {
                        Text("Set up delivery")
                    }
                }
                
            }
            .navigationBarTitle("Cupcake Corner")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
