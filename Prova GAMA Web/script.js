function fat() {
    var num = parseInt(document.getElementById("fat").value)
    var fat
    for (var i = 1; num >= 1; num--) {
        i *= num;
        fat = i
    }
    return fat
}

function fibo() {
    var num = parseInt(document.getElementById("fibo").value)
       var soma, fib1 = 1, fib2 = 1
    for (var i = 3; i <= num; i = i + 1) {
        soma = fib1 + fib2
        fib1 = fib2
        fib2 = soma
    }
    return soma
}

function soma() {
    soma = fat() + fibo()
    return soma
}

function convert() {
    num = soma
    conv = num.toString()
    if (conv.length % 2 != 0) {
        conv = 0 + conv
        conv1 = conv.match(/.{1,2}/g)
        return conv1 //c679546q
    } else {
        conv1 = conv.match(/.{1,2}/g)
        return conv1
    }
}

function enviar() {
    r1 = fat()
    r2 = fibo()
    r3 = soma()
    r4 = convert()
    alert(`Fatorial: ${r1}\nFibonacci: ${r2}\nSoma: ${r3}\nConversao: ${r4}`)
}