function enviar() {
    var str = document.getElementById("msg").value
    var decode = atob(str)
    alert("Mensagem decodificada!\nMensagem: " + decode)
  }
