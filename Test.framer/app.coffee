flow = new FlowComponent
flow.showNext(artboardA)

#Navigation
#nav A
nextA.onClick ->
	flow.showNext(artboardB)

#nav B
nextB.onClick ->
	flow.showNext(artboardC)
backB.onClick ->
	flow.showPrevious(artboardA)

#nav C	
nextC.onClick ->
	flow.showNext(artboardD)
backC.onClick ->
	flow.showPrevious(artboardB)

#nav D
nextD.onClick ->
	flow.showNext(artboardE)
backD.onClick ->
	flow.showPrevious(artboardC)

#nav E
backE.onClick ->
	flow.showPrevious(artboardD)

#Artboard A - Multi-State Actions
layer.states =
	one:
		scale: 1.5
		rotation: 15
		backgroundColor: "rgba(255,255,255,1)"
	two:
		scale: .75
		rotation: -15
		backgroundColor: "rgba(255,228,0,1)"
	three:
		scale: 1
		rotation: 0	
		backgroundColor: "rgba(255,255,255,1)"

layer.animationOptions =
	curve: Spring(damping: 0.5)
	
layer.onTap ->
	layer.stateCycle("one", "two", "three")

#Artboard B - Animation Physics
Button.onTap ->
	
	Time.animate
		y:80
		options: 
			time: 2
	
	Curve.animate
		y:80
		options: 
			curve: Spring
		
	Delay.animate
		y:80
		options: 
			delay: .5
		
	Repeat.animate
		y:80
		options:
			time: 1
			curve: Bezier.ease

#Artboard C - Button Event Capturing

rectangle2.states=
	oneC:
		scale: 1.5
		rotation: 15
		backgroundColor: "rgba(255,255,255,1)"
	twoC:
		scale: .75
		rotation: -15
		backgroundColor: "rgba(255,228,0,1)"
	threeC:
		scale: 1
		rotation: 0	
		backgroundColor: "rgba(255,255,255,1)"
	
rectangle2.animationOptions =
	curve: Spring(damping: 0.5)
	
Button2.onTap ->
	rectangle2.stateCycle("oneC", "twoC", "threeC")


#Artbaord D - Animation Event Capturing
ball.states.a=
	y:349
	
ball.states.b=
	y:160
	
ball.animate "a"

ball.onAnimationEnd ->
	ball.stateCycle("a","b")
	

#Artboard E - Draggable Layers
box.draggable.enabled=true

box.draggable.vertical=false

box.draggable.constraints=
	x:32
	width: 300

box.onDragStart ->
	box.animate
		scale: 1.2
		shadowBlur: 40
		
box.onDragEnd ->
	box.animate
		scale: 1
		shadowBlur: 0
		
box.draggable.overdrag=false
box.draggable.bounce=false 	

			
