function getLaserSetting(magicWord) {
    if (magicWord === 'please') {
        return 'OFF';
} else {
    return 'ON';
}

}
const currentSetting = getLaserSetting();
console.log('The current last setting is: ' + currentSetting)