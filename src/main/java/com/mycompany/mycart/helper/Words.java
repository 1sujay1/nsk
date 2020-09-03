/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mycart.helper;

public class Words {
    public  String get10words(String pDesc){
        
        String str[]=pDesc.split(" ");
                if(str.length>10){
                String out="";
                    for(int i=0;i<10;i++){
                       out=out + str[i]+" "; 
                    }
                     return out+"...";   
                }else{
                    
                    return pDesc+"...";
                }
    
}  
}
