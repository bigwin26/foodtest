
(function($){
    function Reslider(){
        this.defaults = {
            speed:1000,  //페이드속도
            delay:5000,  //자동전환 속도
            imgCount:4,  //이미지갯수
            autoPlay:true//자동재생
        }
        this.count = 0;//회전 카운터
        this.timer = null;//회전 타이머
    }

    var _repro = Reslider.prototype;

    _repro.init = function(){

        this.doEvent();
        this.setBackground();
        setTimeout(this.autoPlay(),this.defaults.delay);

               this.setUrl(this.count);

    }

    _repro.setBackground = function(){

        $('.main-info-slide-image').eq(0).css({
            'z-index':'1',
            'opacity':'1'            
        })

    }

    _repro.doEvent = function(){

    }

    _repro.nextNormal = function(position){

        var _self = this;
        _self.setUrl(position);

        $('.main-info-slide-image').eq(position).animate({
            'opacity':'1'
        },_self.defaults.speed)

        $('.main-info-slide-image').eq(position).siblings('.main-info-slide-image').animate({
            'opacity':'0'
        },_self.defaults.speed)

    }

    _repro.next = function(){

        var _self = this;

        _self.nextNormal(_self.count+1)

        if(_self.count>=(_self.defaults.imgCount-1)) {
            _self.count = 0;

            $('.main-info-slide-image').eq(0).animate({
                'opacity':'1'
            },1000)
        }
        else if(_self.count>=0 && (_self.defaults.imgCount-1)){
            _self.count++;
        }
    }

    _repro.autoPlay = function(){
        var _self = this;

        if(_self.defaults.autoPlay){
            _self.timer=setInterval(function(){
                _self.next()
            },_self.defaults.delay)
        }
        else{
            clearInterval(_self.timer);
        }

    }

    _repro.setUrl = function(index){
        var $url = $('.main-info-slide-image').eq(index).attr('style');

        $('.main-info-slide-image').eq(index).css({
            'background-image':'url('+$url+')'
        })
    }

    $.fn.reSlider = function(options){
        var reSlider = new Reslider();
        $.extend(reSlider.defaults,options)
        reSlider.init()
    }
})(jQuery)