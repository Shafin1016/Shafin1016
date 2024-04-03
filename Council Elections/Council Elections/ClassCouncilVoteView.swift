//
//  ClassCouncilVoteView.swift
//  Council Elections
//
//  Created by Shafin Chaudhri on 2/29/24.
//

import SwiftUI

struct ClassCouncilVoteView: View {
  @State var selected: [String: String] = [:] // Stores selected candidate for each position
  var candidates: [String: [String]] = [ // Dictionary containing all candidates for each position
    "Treasurer": ["Alice Smith", "Bob Jones"],
    "President": ["Charlie Doe", "Emily Lee"],
    "Vice President": ["Frank Miller", "Grace White"],
    "Secretary": ["Henry Brown", "Isabella Garcia"],
    "Class Representative": ["Jack Wilson", "Kayla Williams"]
  ]

  @State private var showConfirmation = false // POPUP visible RAHHHHH

  func submitVote() {
    // Implement your logic to submit votes here, using the selected dictionary
    print("Submitting vote: \(selected)")
    showConfirmation = true // Show popup after submitting
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
      .navigationTitle("Class Council Vote")
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

struct ClassCouncilVoteView_Previews: PreviewProvider {
  static var previews: some View {
      ClassCouncilVoteView()
  }
}

