//
//  ContentView.swift
//  AnotherChallenge
//
//  Created by Tomislav Tomic on 12.01.2021..
//

import SwiftUI

struct ContentView: View {
    
    
    @ObservedObject var activity = Lists()
    @State private var show = false
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(activity.list) { item in
                        VStack {
                            HStack {
                                Text(String("\(item.name)"))
                                Spacer()
                                Text(String("\(item.duration)"))
                                    .foregroundColor(.green)
                            }
                        }
                    }
                    .onDelete(perform: removeIt)
                }
                .padding()
                
                
                
                
                 
                 
                
                
                
                Button("New Activity") {
                    self.show = true
                }
                .padding()
                .sheet(isPresented: $show) {
                    Add(activity: self.activity) }
                
                
            }
            .navigationBarTitle("Activity Tracker")
            .navigationBarItems(leading: EditButton())
            
        }
        
    }
    
    func removeIt(at offsets: IndexSet) {
        activity.list.remove(atOffsets: offsets)
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
