//
//  bookingForm.swift
//  autoApp
//
//  Created by Tabita Sadiq on 10/10/24.
//

import SwiftUI

// MARK: - BookingFormView (UI-Only)
struct BookingFormViewUI: View {
    let selectedDate: Date  // Date selected by the user for the booking
    
    
    @State private var name: String = ""
    @State private var address: String = ""
    @State private var city: String = ""
    @State private var phoneNumber: String = ""
    @State private var vehicleMake: String = ""
    @State private var vehicleModel: String = ""
    @State private var vehicleYear: String = ""
    @State private var vinNumber: String = ""
    @State private var mileage: String = ""
    @State private var complaint: String = ""
    
    let mccAutoDpt: String = "(815) 479-7521" // MCC automotive department phone number
    
    var body: some View {
        NavigationView {
            
            
            ZStack {
                // Background color
                Color(red: 253/255, green: 186/255, blue: 49/255)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    // Top navigation with back button and bell icon
                    HStack {
                        Button(action: {
                            // Action for going back
                        }) {
                            HStack {
                                Image(systemName: "arrow.left")
                                Text("Back")
                            }
                            .font(.headline)
                            .foregroundColor(.black)
                        }
                        .padding(.leading, 20)
                        
                        Spacer()
                        
                        Button(action: {
                            // Action for bell icon
                        }) {
                            Image(systemName: "bell")
                                .font(.system(size: 25))
                                .foregroundColor(.black)
                        }
                        .padding(.trailing, 20)
                    }
                    .padding(.top, 40)
                    
                    // Title for the screen
                    Text("Booking Form") //NEED TO IMPORT FROM CALENDER FILE
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.black)
                        .padding(.bottom, 3)
                    
                    
                    
                    
                    VStack(spacing: 20) {
                        // Customer Information Section
                        VStack {
                            Text("Customer Information")
                                .bold()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundColor(.black)
                                .padding([.leading, .top], 10)
                            
                            VStack(spacing: 10) {
                                TextField("Name", text: $name)
                                Divider().background(Color.gray)
                                TextField("Address", text: $address)
                                Divider().background(Color.gray)
                                TextField("City", text: $city)
                                Divider().background(Color.gray)
                                TextField("Phone Number", text: $phoneNumber)
                                    .keyboardType(.phonePad)
                            }
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                        }
                        
                        // Vehicle Information Section
                        VStack {
                            Text("Vehicle Information")
                                .bold()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundColor(.black)
                            //.padding([.leading, .top], 10)
                            
                            VStack(spacing: 10) {
                                TextField("Make", text: $vehicleMake)
                                Divider().background(Color.gray)
                                TextField("Model", text: $vehicleModel)
                                Divider().background(Color.gray)
                                TextField("Year", text: $vehicleYear)
                                    .keyboardType(.numberPad)
                                Divider().background(Color.gray)
                                TextField("VIN#", text: $vinNumber)
                                Divider().background(Color.gray)
                                TextField("Mileage", text: $mileage)
                                    .keyboardType(.numberPad)
                            }
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                        }
                        
                        // Complaint Section
                        VStack {
                            Text("Complaint")
                                .bold()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundColor(.black)
                            //.padding([.leading, .top], 2)
                            
                            TextField("Describe the issue", text: $complaint)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(10)
                        }
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                    
                    // Submit Button
                    Button(action: {
                        // Submit button action
                    }) {
                        Text("Submit")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 150, height: 50)
                            .background(Color(red: 74/255, green: 49/255, blue: 144/255))
                            .cornerRadius(20)
                    }
                    //.padding(.top, 20) // Space between the submit button and the complaint text field
                    
                    // Bottom toolbar with Home, Phone, and Calendar buttons
                    HStack {
                        Button(action: {
                            // Action for home button
                        }) {
                            Image(systemName: "house.fill")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.black)
                                .padding()
                        }
                        .padding(.leading, 20)
                        Spacer()
                        
                        Button(action: {
                            // this will make a call to the MCC auto department
                            if let url = URL(string: "tel:\(mccAutoDpt)") {
                                UIApplication.shared.open(url)
                            }
                        }) {
                            Image(systemName: "phone.fill")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(Color(red: 74/255, green: 49/255, blue: 144/255))
                                .padding()
                        }
                        
                        Spacer()
                        
                        // Inbox Button (Newly Added)
                        Button(action: {
                            // Action for inbox button
                        }) {
                            Image(systemName: "envelope.fill")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.black)
                                .padding()
                        }
                        
                        Spacer() // Adds space between Inbox and Calendar buttons
                        
                        
                        Button(action: {
                            // Action for calendar button
                        }) {
                            Image(systemName: "calendar")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.blue)
                                .padding()
                        }
                        .padding(.trailing, 20)
                    }
                    .padding(.bottom, 20)
                }
            }
        }
    }
}


struct BookingFormViewUI_Previews: PreviewProvider {
    static var previews: some View {
        BookingFormViewUI(selectedDate: Date())
    }
}
