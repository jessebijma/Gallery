var score:int= 0;
var myTimer:Timer;
var myHitSound:Ding = new Ding();


init(); 
function init(): void {	
    Mouse.hide();
    addEventListener( Event.ENTER_FRAME, update );
    addEventListener( MouseEvent.CLICK, checkIfHit );
	myTimer = new Timer(5000);
    myTimer.addEventListener( TimerEvent.TIMER, onGameOver);
    myTimer.start();
}

function update( myEvent:Event ):void {
    gunSight_mc.x = this.mouseX;
    gunSight_mc.y = this.mouseY;
	 score_txt.text = String(score);
}

function checkIfHit( myEvent:MouseEvent ):void {
	 var hitSomething:Boolean = false;
    for (var i:int = 1; i < 4; ++i) {
        var myClip:MovieClip = MovieClip(getChildByName("duckMove" + i));
        if (myClip.hitTestPoint(mouseX,mouseY,true)) {
            myClip.duckSequence.gotoAndPlay( 2 );
			 score++;
			 myHitSound.play();
			hitSomething = true;
        }
    }
	 if (!hitSomething) {
       // myMissSound.play();
    }
}

function onGameOver(myEvent:TimerEvent):void {
    Mouse.show();
    myTimer.stop();
    removeEventListener( Event.ENTER_FRAME, update );
    this.nextFrame();
}