//
//  VoteView.swift
//  Council Elections
//
//  Created by Shafin Chaudhri on 2/21/24.
//
import SwiftUI
import FirebaseCore

struct VoteView: View {
    @Binding var selectedOption: String?
    @Binding var voted: Bool
    @Binding var voteCounts: [String: Int]
    @Binding var isSignedIn: Bool
    var role: String
    var voteTitle: String // Added variable for vote title
    @State var selected: [String: String] = [:]
    var candidates: [String: [String]] = [
        "Treasurer": ["Alice Smith", "Bob Jones"],
        "President": ["Charlie Doe", "Emily Lee"],
        "Vice President": ["Frank Miller", "Grace White"],
        "Secretary": ["Henry Brown", "Isabella Garcia"],
        "Class Representative": ["Jack Wilson", "Kayla Williams"]
    ]
    
    @State private var showConfirmation = false
    
    func submitVote() {
        print("Submitting vote: \(selected)")
        showConfirmation = true
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(candidates.keys.sorted(), id: \.self) { position in
                    Section(header: Text(position.uppercased()).font(.title3)) {
                        ForEach(candidates[position]!, id: \.self) { candidate in
                            Button(action: {
                                selected[position] = candidate
                            }) {
                                HStack {
                                    Image(systemName: selected[position] == candidate ? "checkmark.circle.fill" : "circle")
                                        .foregroundColor(.blue)
                                        .padding(.trailing)
                                    Text(candidate)
                                        .font(.body)
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle(voteTitle) // Use dynamic voteTitle for navigation title
            .toolbar {
                Button("Submit Vote") {
                    submitVote()
                }
            }
        }
        .alert(isPresented: $showConfirmation) {
            Alert(title: Text("Vote Submitted!"), message: Text("Thank you for voting!"), dismissButton: .default(Text("OK")))
        }
    }
}
