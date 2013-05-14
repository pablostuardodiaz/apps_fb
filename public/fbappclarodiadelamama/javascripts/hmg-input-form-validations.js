    function validanum(e) {
      tecla = (document.all) ? e.keyCode : e.which;
      if (tecla==8) return true;
      patron =/\d/;
      te = String.fromCharCode(tecla);
      return patron.test(te);
    }
  

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
    
    $(document).ready(function() {
      $("#registro").validate({
        rules: {
          facebook_first_name:{ required: true },
          facebook_email:{ required: true,email: true },
          phone:{ required: true },
          nombre_mama:{ required: true },
          mail_mama:{ required: true,email: true },
        }
      });
    });