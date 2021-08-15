function fat() { // Função Fatorial
    let num = parseInt(document.getElementById("fat").value)
    let fat
    for (let i = 1; num >= 1; num--) {
        i *= num
        fat = i
    }
    return fat
}

function fibo() { // Função Fibonacci
    let num = parseInt(document.getElementById("fibo").value)
    let soma, fib1 = 1,
        fib2 = 1
    for (let i = 3; i <= num; i = i + 1) {
        soma = fib1 + fib2
        fib1 = fib2
        fib2 = soma
    }
    return soma
}

function soma() {
    soma = fat() + fibo()
    if (fibo() == undefined) { // Sem valor para fibo retorna apenas fat
        return fat()
    } else if (fat() == undefined) { // Sem valor para fat retorna apenas fibo
        return fibo()
    } else
        return soma
}

function convert() {
    if (fibo() == undefined) { // Caso não declarado valor de fibo 
        num = fat()
    } else if (fat() == undefined) { // Caso não declarado valor de fat
        num = fibo()
    } else { // Caso os dois valores declarados
        num = soma
    }
    conv = num.toString()
    if (conv.length % 2 != 0) { // Separar o valor em pares
        conv = 0 + conv
        conv1 = conv.match(/.{1,2}/g)
        return conv1
    } else {
        conv1 = conv.match(/.{1,2}/g)
        return conv1
    }
}

function enviar() { // Pop-up retornando os resultados armazenados nas variaveis
    r1 = fat()
    r2 = fibo()
    r3 = soma()
    r4 = convert()
    alert(`Fatorial: ${r1}\nFibonacci: ${r2}\nSoma: ${r3}\nConversao: ${r4}`)
}