//
//  disclaimer.swift
//  autoApp
//
//  Created by Tabita Sadiq on 10/10/24.
//

import SwiftUI



struct DisclaimerView: View {
    @State private var isChecked: Bool = false // State for checkbox
    @State private var showingAlert = false // State to trigger the alert
    
    var body: some View {
        ZStack {
            // Background color
            Color(red: 253/255, green: 186/255, blue: 49/255)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                // Top navigation with back button and bell icon
                HStack {
                    // Back button with arrow
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
                    
                    // Bell icon
                    Button(action: {
                        // Action for bell icon
                    }) {
                        Image(systemName: "bell")
                            .font(.system(size: 25))
                            .foregroundColor(.black)
                    }
                    .padding(.trailing, 20)
                }
                .padding(.top, 40) // Adjust for safe area
                
                // Disclaimer text
                Text("""
                I hereby authorize the above repair work to be done along with the necessary material, and hereby grant you and/or your students permission to operate the vehicle herein described on streets, highways, or elsewhere for the purpose of testing and/or inspection. An express mechanic’s lien is hereby acknowledged on the above car or truck to secure the amount of repairs thereto. I have been informed that diagnosis and repairs to my vehicle will be performed by automotive students, which might result in a longer repair period and/or non-completion of the repair. Additionally, I understand that there will be a non-refundable fee of $15 for all repairs to cover shop materials, regardless of the extent of the repair.
                """)
                .padding()
                .foregroundColor(.black)
                .multilineTextAlignment(.leading)
                .lineSpacing(4)
                .font(.body)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
                .padding(.horizontal, 20)
                
                // Checkbox and label
                HStack {
                    Button(action: {
                        isChecked.toggle() // Toggle checkbox state
                    }) {
                        Image(systemName: isChecked ? "checkmark.square.fill" : "square")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.black)
                    }
                    Text("I agree to the terms and conditions")
                        .foregroundColor(.black)
                }
                .padding(.vertical, 20)
                
                // Submit Button
                Button(action: {
                    showingAlert = true // Trigger the alert
                }) {
                    Text("Ok")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 150, height: 50)
                        .background(isChecked ? Color(red: 74/255, green: 49/255, blue: 144/255) : Color.gray) // Button color depends on checkbox
                        .cornerRadius(20)
                }
                .disabled(!isChecked) // Disable the button if checkbox is not checked
                .alert(isPresented: $showingAlert) {
                    Alert(
                        title: Text("The automotive department will contact you shortly to confirm the next steps."),
                        dismissButton: .default(Text("OK")) {
                            // Navigate back to CalendarView here
                            
                
                        }
                    )
                }
                
                Spacer()
                
                // Bottom toolbar with Home and Calendar buttons
                HStack {
                    // Home Button
                    Button(action: {
                        // Action for home button
                    }) {
                        Image(systemName: "house.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                    }
                    .foregroundColor(.black)
                    .padding()
                    
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
                    
                    // Inbox Button
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
                        
                    
                    // Calendar Button
                    Button(action: {
                        // Action for calendar button
                    }) {
                        Image(systemName: "calendar")
                            .resizable()
                            .frame(width: 30, height: 30)
                    }
                    .foregroundColor(.blue)
                    .padding()
                }
                .padding(.bottom, 20)
            }
        }
    }
}

struct DisclaimerView_Previews: PreviewProvider {
    static var previews: some View {
        DisclaimerView()
    }
}
