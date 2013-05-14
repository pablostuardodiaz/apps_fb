    function validatxt(e){
       key = e.keyCode || e.which;
       tecla = String.fromCharCode(key).toLowerCase();
       letras = " áéíóúabcdefghijklmnñopqrstuvwxyz";
       especiales = [8,37,39,46];

       tecla_especial = false
       for(var i in especiales){
            if(key == especiales[i]){
                tecla_especial = true;
                break;
            }
        }

        if(letras.indexOf(tecla)==-1 && !tecla_especial){
            return false;
        }
    }

    function validanum(e) {
      tecla = (document.all) ? e.keyCode : e.which;
      if (tecla==8) return true;
      patron =/\d/;
      te = String.fromCharCode(tecla);
      return patron.test(te);
    }
  /*  $.validator.addMethod(
      "valrut",
      function(rutvalue) {
      return validarut(rutvalue);
      },
      "Rut incorrecto"
    );
    */
    function validarut(rut){
      if (rut.length<9)
      return(false)
      
      i1=rut.indexOf("-");
      dv=rut.substr(i1+1);
      dv=dv.toUpperCase();
      nu=rut.substr(0,i1);
      
      cnt=0;
      suma=0;
      for (i=nu.length-1; i>=0; i--)
      {
      dig=nu.substr(i,1);
      fc=cnt+2;
      suma += parseInt(dig)*fc;
      cnt=(cnt+1) % 6;
      }
      dvok=11-(suma%11);
      if (dvok==11) dvokstr="0";
      if (dvok==10) dvokstr="K";
      if ((dvok!=11) && (dvok!=10)) dvokstr=""+dvok;
      
      if (dvokstr==dv)
      return(true);
      else
      return(false);
    }
    
    function formato_rut(texto, activo) { 
      var invertido = ""; 
      var dtexto = ""; 
      var cnt = 0; 
      var i=0; 
      var j=0; 
      var largo = "";     
      if (activo) { 
        texto = formato_rut(texto, false) 
        largo = texto.length; 
        for ( i=(largo-1),j=0; i>=0; i--,j++ ) 
        invertido = invertido + texto.charAt(i);           
        dtexto = dtexto + invertido.charAt(0); 
        dtexto = dtexto + '-';           
        for ( i=1,j=2; i<largo; i++,j++ ) { 
        if ( cnt == 3 ) { 
        dtexto = dtexto + ''; 
        j++; 
        dtexto = dtexto + invertido.charAt(i); 
        cnt = 1; 
        } else {  
        dtexto = dtexto + invertido.charAt(i); 
        cnt++; 
        } 
      } 
      invertido = ""; 
      for ( i=(dtexto.length-1),j=0; i>=0; i--,j++ ) 
      invertido = invertido + dtexto.charAt(i); 
      if (invertido == '-') invertido = "" 
      texto = invertido; 
      } else { 
      var tmpstr = ""; 
      for ( i=0; i < texto.length ; i++ ) 
      if ( texto.charAt(i) != ' ' && texto.charAt(i) != '.' && texto.charAt(i) != '-' ) 
      tmpstr = tmpstr + texto.charAt(i); 
      texto = tmpstr; 
      } 
      return texto;
    }
    //////////////////////////////
    
    $(document).ready(function() {
      //$('input, textarea').placeholder();
      $("#registro").validate({
        rules: {
          name:   { required: true },
          email:  { required: true,email: true },
          address:{ required: true },
          phone:  { required: true },
          rut:    { required: true, valrut: $('#rut').val()}
        }
      });
    });