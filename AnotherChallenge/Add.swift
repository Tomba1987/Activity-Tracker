//
//  Add.swift
//  AnotherChallenge
//
//  Created by Tomislav Tomic on 12.01.2021..
//

import SwiftUI

struct Add: View {
    
    @ObservedObject var activity: Lists
    @State var duration = ""
    var activityList = ["Guitar", "Violin", "Piano", "Coding", "Singing", "Dancing"]
    @State var selection = 0
    @Environment(\.presentationMode) var presentationMode
    
    var info: String {
        switch self.activityList[selection] {
            case "Guitar":
                return "This isn't some air guitar nonsense, this is the real thing."
            case "Violin":
                return "Wanna feel fancy? You got it!"
            case "Piano":
                return "Bravo, bravo maestro! Watch those fingers though."
            case "Coding":
                return "This isn't hacking you know....or is it?"
            case "Singing":
                return "You sure? Maybe save it for your shower sessions?"
            case "Dancing":
                return "You, mister \"Two Left Feet\"? Ok."
            default:
                return "Please select something"
        }
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Select your activity")) {
                    
                    Picker( "Select", selection: $selection) {
                        ForEach(0 ..< activityList.count) {
                            Text(self.activityList[$0])
                        }
                    }
                    .padding()
                    
                }
                
                Section(header: Text("How many lessons did you do today?")) {
                    TextField("Number of lessons", text: $duration)
                        .keyboardType(.numberPad)
                        .padding()
                }
                
                Section(header: Text("INFO")) {
                    
                    Text(self.info)
                        .multilineTextAlignment(.leading)
                    
                    /*if self.activityList[selection] == "guitar" {
                        Text("Sviranje gitare je fora!")
                    }
                    else {
                        Text("Bla bla bla")
                    }*/
                }
            }
            .navigationBarTitle(Text("New Activity"), displayMode: .inline)
            .navigationBarItems(trailing: Button("Add") {
                
                let item = Activity(name: activityList[selection], duration: duration)
                
                activity.list.append(item)
                
                self.presentationMode.wrappedValue.dismiss()
            })
            
        }
    }
}


struct Add_Previews: PreviewProvider {
    static var previews: some View {
        Add(activity: Lists())
    }
}
