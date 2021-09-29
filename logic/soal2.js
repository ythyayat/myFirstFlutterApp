const hitungKata = kata => {
	let data = kata.split(' ');
  let hasil = 0;
  let regex = new RegExp(/^[A-Za-z]+$/g);
  let regex2 = new RegExp(/^[A-Za-z]+[,.?!]+$/g);
  let regex3 = new RegExp(/^[A-Za-z-]+$/g);
  for(let i = 0; i < data.length; i++){
    let cek = regex.test(data[i]);
    if(cek) hasil++
    else{
      cek = regex2.test(data[i])
      if (cek) hasil ++
      else{
        cek = regex3.test(data[i])
        if (cek) hasil ++
      }
    }
  }
  return hasil;
}

console.log(hitungKata('Kemarin Shopia per[gi ke mall.'));
console.log(hitungKata('Saat meng*ecat tembok, Agung dib_antu oleh Raihan.'));
console.log(hitungKata('Berapa u(mur minimal[ untuk !mengurus ktp?'));
console.log(hitungKata('Masing-masing anak mendap(atkan uang jajan ya=ng be&rbeda.'));