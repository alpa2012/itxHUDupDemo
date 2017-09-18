# itxHUDup

A introduction about this open source project. 
Because Animated HUD up allows user to get an better 
User Experience. Thuis enable to recognize what the 
smarphone ist currently doing. 


Like animiated gifs, allows this little solution an
animation in cooparation with Graphic Designers.
The Look & Feel is easily adaptable to different requirements.
feel free to enhance this framework.

Drop me a line to make it with more features.

Just rename your pics in sequence numbers, starting with
0.See the demo how to confiq.
Here an sample:

 func initHUDup(_ hud: itxHUDup)
 {
        lblProzessDef.text = "Keep Cool"
        
        images = ["0","1","2","3","4","5"]
        
        imgView.image = UIImage(named: images[0])
        
        timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(onTransition), userInfo: nil, repeats: true)
        
  }
