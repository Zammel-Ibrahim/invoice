function generateUniqueNumber(uniqueId, numberLength = 13) {
  const currentDate = new Date();
  const year = (currentDate.getFullYear() % 100).toString().padStart(2, '0');
  const month = (currentDate.getMonth() + 1).toString().padStart(2, '0');
  const day = currentDate.getDate().toString().padStart(2, '0');
  const randomNumber = Math.floor(Math.random() * 900) + 100;
  const number = (uniqueId + 1).toString().padStart(numberLength - 9, '0'); // numberLength - 9 , 9 is length day + month + year + randomNumber
  return day + month + year + randomNumber + number;
}

function generateSomeString() {
  console.info("develop some function here !!!!!!!!!!");
  const initalString = "12345";
  let resultString = '';
  const initialStringLenth = initalString.length;
  for (let i = 0; i < initialStringLenth; i++) {
    resultString += initalString.charAt(Math.floor(Math.random() * initialStringLenth));
  }
  return resultString;
}

module.exports = generateUniqueNumber,generateSomeString;
