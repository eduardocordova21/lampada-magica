//
//  ContentView.swift
//  lampada-magica
//
//  Created by Eduardo Matheus Oliveira de Córdova on 23/07/22.
//

import SwiftUI

struct ContentView: View {
        
    @State var stateLightBuld: Bool = false
    @State var potenciaLightBuld: Double = 0
    @State var disablePotenciaSlider: Bool = true
    @State var lightBulbYellow: Color = Color.yellow
    
    var body: some View {
        
        VStack(){
            Text("Lâmpada Mágica")
                .font(.largeTitle)
            
            Spacer()
            
            Image(systemName: "lightbulb")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            
            Spacer()
            
            HStack(){
                Text("Lâmpada: ")
                
                Toggle(isOn: $stateLightBuld) {
                    if(stateLightBuld){
                        Text("Desligar");
                    }else{
                        Text("Ligar")
                    }
                }.onChange(of: stateLightBuld) { state in
                    potenciaLightBuld = state ? 100.0 : 0
                    disablePotenciaSlider = !state
                }
            }
            
            HStack(){
                Text("Potência: ")
                
                HStack(){
                        Slider(
                            value: $potenciaLightBuld,
                            in: 0...100,
                            step: 1
                        )
                        .disabled(disablePotenciaSlider)
                        .onChange(of: potenciaLightBuld) { value in
                            lightBulbYellow.opacity(value)
                        }
                    
                        Text(String(format: "%.0f", potenciaLightBuld) + "%")
                }
            }
        }
        .padding()
        .background(stateLightBuld ? lightBulbYellow : Color.white)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
