'use strict';

document.getElementById('form').onsubmit = function(event) {
const id = document.getElementById('form').s_id.value;
const pw = document.getElementById('form').s_pw.value;
  if (id === "" && pw === "") {
    event.preventDefault();
    document.getElementById('output').textContent = ('IDとPWを入力してください');
  } else if(id === "") {
    event.preventDefault();
    document.getElementById('output').textContent = ('IDを入力してください');
  } else if(pw === "") {
    event.preventDefault();
    document.getElementById('output').textContent = ('PWを入力してください');
  }
}; /**
 *
 */