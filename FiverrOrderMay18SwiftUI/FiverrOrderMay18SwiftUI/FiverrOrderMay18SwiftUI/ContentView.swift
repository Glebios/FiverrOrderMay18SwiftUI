//
//  ContentView.swift
//  FiverrOrderMay18SwiftUI
//
//  Created by Gleb Serediuk on 21.05.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var sections: [SectionData] = [SectionData(sectionTitle: "My Voice Selector Converse",
                                                          items: [CellData(title: "Serial number",
                                                                           value: "123fesfFSA2"),
                                                                  CellData(title: "Hardware version",
                                                                           value: "0.0.0.1"),
                                                                  CellData(title: "Filrmware version",
                                                                           description: "You have the latest version",
                                                                           value: "1.2.4")]),
                                              SectionData(sectionTitle: "My Bluethooth Earphones",
                                                          items:[CellData(title: "Name", value: "ERFS20C")]),
                                              SectionData(sectionTitle: "My iPhone",
                                                          items: [CellData(title: "Model name",
                                                                           value: "\(UIDevice.modelName)"),
                                                                  CellData(title: "iOS version",
                                                                           value: UIDevice.current.systemVersion),
                                                                  CellData(title: "App version",
                                                                           value: Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "0.0.0")]),
                                              SectionData(sectionTitle: "Support",
                                                          items: [CellData(title: "User manual",
                                                                           icon: "userManual"),
                                                                  CellData(title: "How to videos",
                                                                           icon: "playVideo"),
                                                                  CellData(title: "Contact us",
                                                                           icon: "contactUs")])]
   
    var body: some View {
       
        VStack {
            
            ScrollView {
             
                VStack {
                    ForEach(sections, id: \.id) { section in
                        
                        HStack {
                            Button {
                                sections = refreshSections(title: section.sectionTitle)
                            } label: {
                                Text(section.sectionTitle)
                                    .font(.title2)
                                    .fontWeight(.bold)
                                
                                if section.sectionTitle == sections[0].sectionTitle {
                                    Image("notify")
                                }
                                Spacer()
                                Image(systemName: section.isCollapsed ? "chevron.up" : "chevron.down")
                            }
                            .accentColor(.white)
                            
                            Spacer()
                        }
                        .padding(.horizontal, 20)
                        
                        if section.isCollapsed {
                            
                            ForEach(section.items, id: \.title) { cell in
                                ListCell(title: cell.title,
                                         description: cell.description ?? "",
                                         value: cell.value ?? "",
                                         icon: cell.icon,
                                         action: {
                                    print(cell.title)
                                })
                                
                                .padding(.top, 10)
                                
                                if section.sectionTitle == sections[0].sectionTitle &&
                                    cell.title == sections[0].items[2].title {
                                    Button {
                                        print("Forget device")
                                    } label: {
                                        HStack {
                                            Spacer()
                                            Text("FORGET MY DEVICE")
                                                .font(.title2)
                                                .fontWeight(.bold)
                                                .foregroundColor(.blue)
                                                .padding()
                                                .border(.blue, width: 2.0)
                                                .cornerRadius(3)
                                            Spacer()
                                        }
                                    }
                                    
                                }
                            } //: Loop
                        } else {
                            EmptyView()
                        }
                        Divider()
                            .frame(height: 1)
                            .background(.white)
                            .padding()
                    } //: Loop
                }
            }
        } //: VStack
        .background(Color("background"))
    } //: Body
}


extension ContentView {
   fileprivate func refreshSections(title: String) -> [SectionData] {
        var newSections: [SectionData] = []
        
        for index in 0..<(sections.count) {
            var item = sections[index]
            
            if item.sectionTitle == title && item.isCollapsed == false {
                item.isCollapsed = true
            } else {
                item.isCollapsed = false
            }
            newSections.append(item)
        }
        
        return newSections
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 13 Pro Max")
    }
}
#endif


//
//List {
//    ForEach(sections, id: \.id) { section in
//
//        Section(section.sectionTitle) {
//
//            ForEach(section.items, id: \.title) { cell in
//                ListCell(title: cell.title,
//                         description: cell.description ?? "",
//                         value: cell.value ?? "",
//                         icon: cell.icon ?? "", action: {
//                    print(cell.title)
//                })
//
//                if section.sectionTitle == sections[0].sectionTitle && cell.title == sections[0].items[2].title {
//                    Button {
//                        print("Forget device")
//                    } label: {
//                        HStack {
//                            Spacer()
//                            Text("FORGET MY DEVICE")
//                                .font(.title2)
//                                .fontWeight(.bold)
//                                .foregroundColor(.blue)
//                                .padding()
//                                .border(.blue, width: 2.0)
//                                .cornerRadius(3)
//                            Spacer()
//                        }
//                    }
//
//                }
//            } //: Loop
//        } //: Section
//
//        Divider()
//            .frame(height: 1)
//            .background(.white)
//
//    } //: Loop
//} //: List
//.listStyle(.sidebar)
//.accentColor(.white)
//.foregroundColor(.white)
//.onAppear {
//    // Set the default to clear
//    UITableView.appearance().backgroundColor = .clear
//}
