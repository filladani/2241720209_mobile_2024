void main(){
  for(int prima = 0; prima <= 201; prima++){
    if(prima == 0) {
      continue;
    }else if((prima % 2 == 0) && (prima != 2)){
      continue;
    }else if(prima == 1){
      continue;
    }else if((prima % 3 == 0) && (prima != 3)){
      continue;
    }else if(prima % 5 == 0 && prima != 5){
      continue;
    }else if(prima % 7 == 0 && prima != 7){
      continue;
    }else if(prima % 11 == 0 && prima != 11){
      continue;
    }else if(prima % 13 == 0 && prima != 13){
      continue;
    }
    print("$prima :Filla Ramadhani Utomo - 2241720209");
  }
}