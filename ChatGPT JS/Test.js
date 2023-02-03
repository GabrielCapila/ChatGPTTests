const prompt = require('prompt-sync')();

function isCPFValid(cpf) {
    // Removes all non-numeric characters from the input
    cpf = cpf.replace(/[^\d]+/g,'');
  
    // Validates the input length
    if (cpf.length !== 11) {
        return false;
    }
  
    // Checks for known invalid CPFs
    const invalidCPFs = [
        "00000000000",
        "11111111111",
        "22222222222",
        "33333333333",
        "44444444444",
        "55555555555",
        "66666666666",
        "77777777777",
        "88888888888",
        "99999999999"
    ];
  
    if (invalidCPFs.includes(cpf)) {
        return false;
    }
    // Validates the first digit
    let sum = 0;
    for (let i = 0; i < 9; i++) {
        sum += parseInt(cpf.charAt(i)) * (10 - i);
    }
  
    let rev = 11 - (sum % 11);
    if (rev === 10 || rev === 11) {
        rev = 0;
    }
  
    if (rev !== parseInt(cpf.charAt(9))) {
        return false;
    }
    // Validates the second digit
    sum = 0;
    for (let i = 0; i < 10; i++) {
        sum += parseInt(cpf.charAt(i)) * (11 - i);
    }
  
    rev = 11 - (sum % 11);
    if (rev === 10 || rev === 11) {
        rev = 0;
    }
  
    if (rev !== parseInt(cpf.charAt(10))) {
        return false;
    }
  
    return true;
}

// Prompts the user for the CPF
const cpf = prompt('Enter a CPF: ');

// Validates the CPF
if (isCPFValid(cpf)) {
    console.log("Valid CPF");
} else {
    console.log("Invalid CPF");
}
