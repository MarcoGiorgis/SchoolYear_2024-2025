const secretUsername="giorgis"
const secretPassword="bellissimo"
const usernameCode="utente"
const passwordCode="qwerty"

document.getElementById('button').addEventListener('click', function (event) {
    event.preventDefault();
    const username = document.getElementById('Username').value;
    const password = document.getElementById('Password').value;
    if (username === usernameCode && password === passwordCode){
        location.href = 'index.html';
    }else if(username === secretUsername && password === secretPassword){
        location.href = 'peppone.html';
    }
    else{
        document.getElementById("correzione").innerHTML = "Inserire le credenziali corrette";
    }
});
