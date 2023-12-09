//
//  ContentView.swift
//  For Makers Only
//
//  Created by xcodeday on 12/8/23.
//

import SwiftUI

extension Color {
    init(hex:UInt) {
        self.init(
            .sRGB,
            red: Double((hex & 0xFF0000) >> 16) / 255.0, green: Double((hex & 0xFF0000) >> 8) / 255.0, blue: Double(hex & 0xFF0000) / 255.0, opacity: 1.0
        )
    }
}





let havanaWax = "https://www.candlemakingsupplies.net/shop/vessel/14-oz-havana-champagne-candle-jar"
    
let monticianoWax = "https://www.candlemakingsupplies.net/shop/vessel/monticiano-clear-candle-vessel"
    
struct FontNameManager {
    struct Montserrat {
        static let light = "Montserrat-Light"
        static let regular = "Montserrat-Regular"
        static let bold = "Montserrat-ExtraBold"
    }
}

let headerfont = Font.custom(FontNameManager.Montserrat.bold, size: UIFont.preferredFont(forTextStyle:.largeTitle).pointSize)

let bodyFont = Font.custom(FontNameManager.Montserrat.regular, size: UIFont.preferredFont(forTextStyle:.largeTitle).pointSize)

let lightFont = Font.custom(FontNameManager.Montserrat.light, size: UIFont.preferredFont(forTextStyle:.largeTitle).pointSize)

//@State private var text: String = ""
//@State private var selection = "California"

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 0.934, green: 0.906, blue: 0.876)
                    .ignoresSafeArea()
                VStack {
                    Text("TAYLOR CANDLE & CO")
                        .font(.largeTitle)
                        .font(lightFont)
                        .padding(20)
                        .foregroundColor(Color(red: 0.732, green: 0.714, blue: 0.693))
                        
                    Text("FOR")
                        .font(bodyFont)
                        .foregroundColor(Color(red: 0.264, green: 0.255, blue: 0.245))
                    Text("MAKERS")
                        .font(bodyFont)
                        .foregroundColor(Color(red: 0.264, green: 0.255, blue: 0.245))
                    Text("ONLY")
                        .font(bodyFont)
                        .foregroundColor(Color(red: 0.264, green: 0.255, blue: 0.245))
                    Text("WHEN LIFE GIVES YOU WAX, WICK IT")
                        .font(lightFont)
                        .foregroundColor(Color(red: 0.732, green: 0.714, blue: 0.693))
                        .multilineTextAlignment(.center)
                        .padding(25.0)
                        NavigationLink(destination: StateView()){
                            Text("Next")
                                .padding()
                                .foregroundColor(.white)
                                .background(Color.black)
                                .cornerRadius(8)
                                .frame(width: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
                        }
                    
                }
                
                .padding(.bottom, 100)
            }
            
        }
    }
    struct StateView: View {
        let stateOptions = ["Select State", "California", "Michigan", "Nevada", "New York"]
        
        @State private var selectedStateIndex = 0
        
        var body: some View {
            VStack{
                Text("Products by State")
                    .font(.title)
                    .padding()
                Picker("Select a state", selection: $selectedStateIndex) {
                    ForEach(0..<stateOptions.count, id: \.self) { index in
                        Text(self.stateOptions[index])
                    }
                }
                .pickerStyle(MenuPickerStyle())
                
                if selectedStateIndex != 0 {
                    NavigationLink(destination: destinationViewForSelectedState()) {
                        Text("Go to product page")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.green)
                            .cornerRadius(8)
                    }
                    .padding(.top, 20)
                } else {
                    Text("Please select a state first.")
                        .foregroundColor(.red)
                        .padding(.top, 20)
                }
            }
        }
        func destinationViewForSelectedState() -> some View {
            switch selectedStateIndex {
            case 1:
                return AnyView(PageCalifornia())
            case 2:
                return AnyView(Page_Michigan())
            case 3:
                return AnyView(page_Nevada())
            case 4:
                return AnyView(page_New_York())
            default:
                return AnyView(EmptyView())
            }
        }
    }
        //DESTINATIONS
        
        // NotesView
            struct NotesView: View {
                @State var text: String = ""
                
                var body: some View {
                    VStack {
                        Text("")
                        
                        TextEditor(text: $text)
                            .frame(minHeight: 100)
                            .padding()
                            .border(Color.gray, width: 1)
                    }
                    .padding()
                }
            } //end of notes
           
    struct PageProducts: View {
        var body: some View {
            ZStack {
                Color(red: 0.934, green: 0.906, blue: 0.876)
                    .ignoresSafeArea()
                HStack{
                    VStack(alignment: .leading) {
                        Image("new_monticiano_vessel")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width:150, height: 150)
                        Text("         9.5 OZ Vessel")
                            .font(.footnote)
                            .foregroundColor(Color.black)
                            .padding(3.0)
                        Image("image1")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width:150, height: 150)
                        Text("         Coconut")
                            .font(.footnote)
                            .foregroundColor(Color.black)
                            .padding(3.0)
                        Image("image1")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width:150, height: 150)
                        Text("         Cotton Wicks")
                            .font(.footnote)
                            .foregroundColor(Color.black)
                            .padding(3.0)
                        
                    }
                    VStack{
                        Image("new_havana_vessel")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width:150, height: 150)
                        Text("14 OZ Vessel")
                            .font(.footnote)
                            .foregroundColor(Color.black)
                            .padding(3.0)
                        Image("image1")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width:150, height: 150)
                        Text("     Soy")
                            .font(.footnote)
                            .foregroundColor(Color.black)
                            .padding(3.0)
                        Image("image1")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width:150, height: 150)
                        Text("         Wood Wicks")
                            .font(.footnote)
                            .foregroundColor(Color.black)
                            .padding(3.0)
                        
                    }
                    
                    
                }
                .padding()
            }
        }
    } // end of Page California
            
            
            // Page California
            struct PageCalifornia: View {
                var body: some View {
                    VStack {
                        Text("This is page california")
                        NavigationLink(destination: PageProducts()){
                            Text("Products")
                                .padding(7)
                                .foregroundColor(Color.white)
                                .background(Color.black)
                                .cornerRadius(6)
                        }
                    }
                    }
                }
            } // end of Page California
            
            
            // Page Michigan
            struct Page_Michigan: View {
                var body: some View {
                    VStack {
                        Text("This is page michigan")
                        
                        
                    }
                    .padding()
                }
            } // end of Page Michigan
            
            
            // Page Nevada
            struct page_Nevada: View {
                var body: some View {
                    VStack {
                        Text("This is page nevada")
                        
                        
                    }
                    .padding()
                }
            } // end of Page Nevada
            
            
            // Page New York
            struct page_New_York: View {
                var body: some View {
                    VStack {
                        Text("This is page new york")
                        
                        
                    }
                    .padding()
                }
            } // end New York
#Preview {
    ContentView()
}
