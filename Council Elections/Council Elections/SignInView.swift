// SignInView.swift
import SwiftUI
import FirebaseCore


struct SignInView: View {
  @Binding var name: String
  @Binding var role: String
  @Binding var isSignedIn: Bool
  @Binding var selectedOption: String?
  @Binding var voted: Bool
  @Binding var grade: String // Added binding

  let roles = ["Admin", "Teacher", "Student"]

  var body: some View {
    NavigationView {
      VStack {
        TextField("Name", text: $name)
          .textFieldStyle(RoundedBorderTextFieldStyle())
          .padding()

        TextField("Grade", text: $grade) // Use the binding
          .textFieldStyle(RoundedBorderTextFieldStyle())
          .padding()

        Picker("Role", selection: $role) {
          ForEach(roles, id: \.self) { role in
            Text(role)
          }
        }
        .pickerStyle(MenuPickerStyle())
        .padding()

       /*   NavigationLink(destination: VoteView(selectedOption: self.$selectedOption, voted: self.$voted, voteCounts: self.$voteCounts, isSignedIn: self.$isSignedIn, role: self.role)) {
              Text("Vote")
                  .padding()
                  .foregroundColor(.white)
                  .background(Color.blue)
                  .cornerRadius(10)
          
          }*/
        }
      }
      .padding()
    }
    
  }

