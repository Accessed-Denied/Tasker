//
//  ContentView.swift
//  Tasker
//
//  Created by Rohit Saini on 18/10/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
    // MARK: - PROPERTIES
    
    @State var task:String = ""
    private var isSaveButtonDisable:Bool{
        task.isEmpty
    }
    
    // FETCHING DATA
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    
    // MARK: - FUNCTIONS
    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()
            newItem.task = task
            newItem.completion = false
            newItem.id = UUID()
            
            do {
                try viewContext.save()
                
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
            task = ""
            hideKeyboard()
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)
            
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            ZStack {
                VStack{
                    VStack(spacing: 16){
                        // TEXTFIELD
                        TextField("New Task", text: $task)
                            .padding()
                            .background(
                                Color(UIColor.systemGray6)
                            )
                            .cornerRadius(10)
                        // BUTTON
                        Button {
                            addItem()
                        } label: {
                            Spacer()
                            Text("SAVE")
                            Spacer()
                        }
                        .disabled(isSaveButtonDisable)
                        .padding()
                        .font(.headline)
                        .foregroundColor(.white)
                        .background(isSaveButtonDisable ? Color.gray : Color.pink)
                        .cornerRadius(10)
                    }//: VSTACK
                    .padding()
                    List {
                        ForEach(items) { item in
                            VStack(alignment: .leading){
                                Text(item.task ?? "")
                                    .font(.headline)
                                    .fontWeight(.bold)
                                Text("Item at \(item.timestamp!, formatter: itemFormatter)")
                                    .font(.footnote)
                                    .foregroundColor(.gray)
                            }//: VSTACK
                        }// LOOP
                        .onDelete(perform: deleteItems)
                    }//: LIST
                    .listStyle(.insetGrouped)
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.3), radius: 12)
                    .padding(.vertical,0)
                    .frame(maxWidth: 640)
                }//: VSTACK
            }//: ZSTACK
            .onAppear(){
                UITableView.appearance().backgroundColor = UIColor.clear
            }
            .navigationBarTitle("Daily Tasks",displayMode: .large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
            }//: TOOLBAAR
            .background(
                BackgroundImageView()
            )
            .background(
                backgroundGradient.ignoresSafeArea(.all, edges: .all)
            )
            
            
        }//: NAVIGATION
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
