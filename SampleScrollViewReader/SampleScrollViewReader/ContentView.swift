//
//  ContentView.swift
//  SampleScrollViewReader
//
//  Created by giiiita on 2020/06/23.
//

import SwiftUI

struct ContentView: View {

    @State var value: ScrollViewProxy?
    var body: some View {
        ZStack {
            ScrollView {
                ScrollViewReader { value in
                    LazyVStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 16) {
                        ForEach(0..<100) { index in
                            Text("\(index)")
                                .frame(width: 200, height: 200)
                                .background(Color.green)
                                .id(index)
                        }
                    }.onAppear {
                        self.value = value
                    }
                }
            }
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        withAnimation {
                            self.value?.scrollTo(0, anchor: .top)
                        }
                    }, label: {
                        ZStack {
                            Circle()
                                .foregroundColor(Color.yellow)
                                .frame(width: 60, height: 60)
                            Text("top")
                                .foregroundColor(Color.black)
                        }
                    }).padding(.trailing, 16)
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView(value: nil)
        }
    }
}
