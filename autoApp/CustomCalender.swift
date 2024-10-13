//
//  Calender.swift
//  autoApp
//
//  Created by Tabita Sadiq on 10/3/24.
//
import SwiftUI

let mccAutoDpt: String = "(815) 479-7521" // MCC automotive department phone number

struct CustomCalendar: View {
    @State private var availableDates: [Date] = []
    @State private var selectedDate: Date?
    @State private var showingBookingForm = false
    
    @State private var currentMonth: Date = Date()
    @State private var showOnlyFutureDates = true
    
    var body: some View {
        ZStack {
            // Background Color
            Color(red: 253/255, green: 186/255, blue: 49/255)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                // Top Navigation (Back Arrow and Bell Icon)
                HStack {
                    // Back Button with Arrow
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
                    
                    // Bell Icon (Notification)
                    Button(action: {
                        // Action for bell icon
                    }) {
                        Image(systemName: "bell")
                            //.font(.headline)
                            .font(.system(size: 25))
                            .foregroundColor(.black)
                    }
                    .padding(.trailing, 20)
                }
                .padding(.top, 40) // Adjust for safe area
                
                Spacer()
                
                // Calendar and Toggle for Future Dates
                VStack {
                    Toggle("Show Only Future Dates", isOn: $showOnlyFutureDates)
                        .padding()
                    
                    Text("Select a Date")
                        .font(.largeTitle)
                        .padding()
                    
                    // Adding padding around the calendar
                    VStack {
                        // Calendar Header with Month Navigation
                        HStack {
                            Button(action: { moveMonth(-1) }) {
                                Image(systemName: "chevron.left")
                            }
                            Spacer()
                            Text(currentMonthTitle)
                                .font(.headline)
                            Spacer()
                            Button(action: { moveMonth(1) }) {
                                Image(systemName: "chevron.right")
                            }
                        }
                        .padding()
                        
                        // Calendar Grid with padding around it
                        LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 7), spacing: 10) {
                            ForEach(1...30, id: \.self) { day in
                                Text("\(day)")
                                    .frame(maxWidth: .infinity, maxHeight: 40)
                                    .background(Color.blue) //this is an option as well: .background(Color(red: 74/255, green: 49/255, blue: 144/255))
                                    .foregroundColor(.white)
                                    .cornerRadius(8)
                            }
                        }
                        .padding([.leading, .trailing], 20) // padding around grid
                        
                        // OK Button for calender
                        Button(action: {
                            // OK Button action
                        }) {
                            Text("OK")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .frame(width: 100, height: 50)
                                .background(Color(red: 74/255, green: 49/255, blue: 144/255))
                                .cornerRadius(20)
                        }
                        .padding(.top, 20)
                    }
                    .padding([.leading, .trailing], 20) // Padding around calender
                }
                
                Spacer()
                
                // Bottom Toolbar (Home and Calendar Buttons)
                HStack {
                    // Home Button
                    Button(action: {
                        // Action for home button
                    }) {
                        HStack {
                            Image(systemName: "house.fill")
                                .resizable()
                                .frame(width: 30, height: 30)
                        }
                        .font(.headline)
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
                        
                    
                    // Calendar Button
                    Button(action: {
                        // Action for calendar button
                    }) {
                        HStack {
                            Image(systemName: "calendar")
                                .resizable()
                                .frame(width: 30, height: 30)
                        }
                        .font(.headline)
                        .foregroundColor(.blue)
                        .padding()
                    }
                    .padding(.trailing, 20)
                }
                .padding(.bottom, 20)
            }
        }
    }
    
    // Move to the next/previous month
    private func moveMonth(_ offset: Int) {
        currentMonth = Foundation.Calendar.current.date(byAdding: .month, value: offset, to: currentMonth)!
    }
    
    // Display the current month and year
    private var currentMonthTitle: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM yyyy"
        return formatter.string(from: currentMonth)
    }
}

struct CustomCalendar_Previews: PreviewProvider {
    static var previews: some View {
        CustomCalendar()
    }
}


