const cekKaoskaki = (arr) => {
  let tamp = [[arr[0], 1]];
  let result = 0;
  for (let i = 1; i < arr.length; i++) {
    let cek = false;
    for (let j = 0; j < tamp.length; j++) {
      if (arr[i] == tamp[j][0]) {
        tamp[j][1] ++
        if (tamp[j][1]%2 == 0) {
          result ++
        }
        cek = true;
      }
    }
    if (!cek) {
      tamp[tamp.length] = [arr[i],1]
    }
  }
  return result;
}

console.log(cekKaoskaki([5, 7, 7, 9, 10, 4, 5, 10, 6, 5]));
console.log(cekKaoskaki([10, 20, 20, 10, 10, 30, 50, 10, 20]));
console.log(cekKaoskaki([6, 5, 2, 3, 5, 2, 2, 1, 1, 5, 1, 3, 3, 3, 5]));
console.log(cekKaoskaki([1, 1, 3, 1, 2, 1, 3, 3, 3, 3]));