function setCookie(cname,cvalue,exdays) {
    const d = new Date();
    d.setTime(d.getTime() + (exdays*24*60*60*1000));
    let expires = "expires=" + d.toUTCString();
    document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
}
  
function getCookie(cname) {
    let name = cname + "=";
    let decodedCookie = decodeURIComponent(document.cookie);
    let ca = decodedCookie.split(';');
    for(let i = 0; i < ca.length; i++) {
      let c = ca[i];
      while (c.charAt(0) == ' ') {
        c = c.substring(1);
      }
      if (c.indexOf(name) == 0) {
        return c.substring(name.length, c.length);
      }
    }
    return "";
  }
  function checkCookie() {
    let user = getCookie("username");
    if (user != "") {
      alert("Welcome again " + user);
    } else {
       user = prompt("Please enter your name: ","");
       if (user != "" && user != null) {
         setCookie("username", user, 30);
       }
    }
}


const url = "https://v2.jokeapi.dev/joke/Any?blacklistFlags=nsfw,religious,political,racist,sexist,explicit&type=single"
const btn1 = document.getElementById("btn-1")
const btn2 = document.getElementById("btn-2")
const jokeContent = document.getElementById("joke")

let getJoke = () => {
    fetch(url)
    .then(data => data.json())
    .then(item => {
        jokeContent.textContent = `${item.joke}`;
    })
}

btn1.addEventListener("click", getJoke);
btn2.addEventListener("click", getJoke);
getJoke();

