//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Jacob on 10/28/20.
//  Copyright © 2020 Jacob. All rights reserved.
//

import SwiftUI

struct AddressView: View {
    @ObservedObject var order: Order
    
    var body: some View {
        Form {
            Section {
                TextField("Name: ", text: $order.name)
                TextField("Street address: ", text: $order.streetAddress)
                TextField("City: ", text: $order.city)
                TextField("Zip code: ", text: $order.zipCode)
            }
            
            Section {
                NavigationLink(destination: CheckoutView(order: order)) {
                    Text("Check out!")
                }
            }
            .disabled(order.hasValidAddress == false)
        }
        .navigationBarTitle("Delivery details", displayMode: .inline)
        
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddressView(order: Order())
    }
}
