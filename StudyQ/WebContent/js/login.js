'use strict';

document.getElementById('form').onsubmit = function(event) {
event.preventDefault();
const id = document.getElementById('form').s_id.value;
const pw = document.getElementById('form').s_pw.value;
  if (id === "" && pw === "") {
    document.getElementById('output').textContent = ('IDとPWを入力してください');
  } else if(id === "") {
    document.getElementById('output').textContent = ('IDを入力してください');
  } else if(pw === "") {
    document.getElementById('output').textContent = ('PWを入力してください');
  }
}; /**
 *
 */