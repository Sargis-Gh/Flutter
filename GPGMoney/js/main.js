let coinsCount = document.getElementById('coinsCount');
let imgBtn = document.getElementById('immgButton');
let energyCount = document.getElementById('energyCount');

let viewBtn = document.getElementById('viewBtn');
let reklam = document.getElementById('reklam');

viewBtn.addEventListener('click', showReklam);

function showReklam() {
    if(reklam.classList.toggle('hiden')) {
        viewBtn.innerHTML = 'Full Energy';
    }
    else {
        viewBtn.innerHTML = 'Close'
    }
}

imgBtn.addEventListener('click', counter);

function counter() {
    let string = Number(coinsCount.innerText);
    let enCount = Number(energyCount.innerText);
    enCount -= 1;
    string += 1;
    if (enCount <= 0) {
        remove();
    }
    coinsCount.innerText = string;
    energyCount.innerText = enCount;
}

function remove() {
    imgBtn.removeEventListener('click', counter);
}