let windwosHeight = 400
let windwosWidth = 900

class Config{
    constructor() {
        this.controls_size = 20;
        this.bg_blur_effect = true;
        this.bg_effect_transparent_num = 0.85
        this.bg_effect_transparent = Qt.rgba(255,255,255, this.bg_effect_transparent_num);
        this.bg_blur_num = 64;
    }
}

var config = new Config()

function changeBgEffect(flag) {

    if(flag){
        return transparentImage;
    }
    else{
        return blurImage;
    }

}
