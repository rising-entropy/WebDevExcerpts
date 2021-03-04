const anime = require('animejs');

anime({
    targets: '.kil',
    strokeDashoffset: [anime.setDashoffset, 0],
    easing: 'easeInOutSine',
    duration: 150,
    delay: function (el, i) {
        return i * 1000
    },
    direction: 'alternate',
    loop: true
});