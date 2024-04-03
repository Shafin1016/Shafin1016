//
//  ContentView.swift
//  Council Elections
//
//  Created by Shafin Chaudhri on 2/9/24.
//
import SwiftUI
import FirebaseCore

struct ContentView: View {
    @State private var name = ""
    @State private var grade = ""
    @State private var role = ""
    @State private var isSignedIn = false
    @State private var selectedOption: String?
    @State private var voted = false
    @State private var voteCounts: [String: Int] = [:]
    @State private var voteTitle = "" // Default title
    @State private var isActive = false // Example isActive variable
    
    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)
            
            if isActive {
                VoteView(selectedOption: $selectedOption, voted: $voted, voteCounts: $voteCounts, isSignedIn: $isSignedIn, role: $role.wrappedValue, voteTitle: voteTitle)
            } else {
                // Show popup and return to sign-in screen
                VStack {
                    Text("No Vote Active")
                        .font(.title)
                        .foregroundColor(.red)
                        .padding()
                    Button("OK") {
                        // Reset variables and return to sign-in screen
                        isSignedIn = false
                        selectedOption = nil
                        voted = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
