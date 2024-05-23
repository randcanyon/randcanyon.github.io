# IMPORT FILES
MAIN = Framer.Importer.load "imported/hometownlive-story-08"
NUMBERS = Framer.Importer.load "imported/numbers"


# MAKE ALL LAYERS AVAILABLE ON ROOT
for layerGroupName of MAIN
	window[layerGroupName] = MAIN[layerGroupName]

for layerGroupName of MAIN
	MAIN[layerGroupName].originalFrame = window[layerGroupName].frame
	
for layerGroupName of NUMBERS
	window[layerGroupName] = NUMBERS[layerGroupName]

for layerGroupName of NUMBERS
	NUMBERS[layerGroupName].originalFrame = window[layerGroupName].frame


# DEFAULT STATES

# City
City.opacity = 1
City.y = 250

# Weather
Weather.opacity = 0

# Numbers
Number1.opacity = 1
Number2.opacity = 0.2
Number3.opacity = 0.2
Number4.opacity = 0.2
Number5.opacity = 0.2
Number6.opacity = 0.2
Number7.opacity = 0.2
Number8.opacity = 0.2
Number9.opacity = 0.2
Number10.opacity = 0.2
AllNumbers.visible = false


# STORY GROUPS

Stories = new Layer
	width: 640, height: 1136, backgroundColor: "transparent"

# STORY LAYERS

# 2nd Story
Background2.superLayer = Stories

Story2Group = new Layer
	width: 640, height: 1136, backgroundColor: "transparent"
Story2Group.superLayer = Stories
Story2Group.draggable.enabled = true
Story2Group.draggable.speedX = 0
Story2Group.y = 1136
Story2.superLayer = Story2Group

Story2Drag = new Layer
	width: 640, height: 1136, backgroundColor: "transparent"
Story2Drag.draggable.enabled = true
Story2Drag.draggable.speedX = 0
Story2Drag.superLayer = Stories

# 1st Story
Background1.superLayer = Stories
# Story1Video = new VideoLayer({video: "alaska-clip.mp4"})
# Story1Video.player.autoplay = true
# Story1Video.player.loop = true
# Story1Video.width = 640
# Story1Video.height = 1136
# Story1Video.superLayer = Background1
Story1Group = new Layer
	width: 640, height: 1136, backgroundColor: "transparent"
Story1Group.superLayer = Stories
Story1Group.draggable.enabled = true
Story1Group.draggable.speedX = 0
Story1Group.y = 1136
Story1.superLayer = Story1Group

Story1Drag = new Layer
	width: 640, height: 1136, backgroundColor: "transparent"
Story1Drag.draggable.enabled = true
Story1Drag.draggable.speedX = 0
Story1Drag.superLayer = Stories

# Numbers
Number = new Layer
	x: -200, y: 500, width: 140, height: 1473, backgroundColor: "transparent"
Number.style.overflow = "visible"
AllNumbers.superLayer = Number
Number10.superLayer = Number
Number9.superLayer = Number
Number8.superLayer = Number
Number7.superLayer = Number
Number6.superLayer = Number
Number5.superLayer = Number
Number4.superLayer = Number
Number3.superLayer = Number
Number2.superLayer = Number
Number1.superLayer = Number

# Home
Home = new Layer
	width: 640, height: 1136, backgroundColor: "transparent"
Background0.visible = true
Background0.superLayer = Home
# HomeVideo = new VideoLayer({video: "home.mp4"})
# HomeVideo.player.autoplay = true
# HomeVideo.player.loop = true
# HomeVideo.width = 640
# HomeVideo.height = 1136
# Home.originY = 0
# HomeVideo.superLayer = Home
City.superLayer = Home
Weather.superLayer = Home
CTA.superLayer = Home

CityDrag = new Layer
	width: 640, height: 1136, backgroundColor: "transparent"
CityDrag.draggable.enabled = true
CityDrag.draggable.speedX = 0


# CONTROLS

# When dragging on home screen...
CityDrag.on Events.DragMove, ->
	# up
	if CityDrag.y < 0
		Home.animate
			properties:
		    	y: CityDrag.y
		    time: 0
	# down
	if CityDrag.y > 0
		City.animate
			properties:
		    	opacity: (500 - CityDrag.y) / 500
		    time: 0
		CTA.animate
			properties:
		    	opacity: (500 - CityDrag.y) / 500
		    time: 0
		Weather.animate
			properties:
				opacity: (CityDrag.y) / 500
			time: 0
# 		HomeVideo.animate
# 			properties:
# 				brightness: 100 - (CityDrag.y / 20)
# 				blur: 5 + CityDrag.y / 50
# 				scale: 1 + (CityDrag.y / 2000)
# 			time: 0
		Background0.animate
			properties:
				brightness: 100 - (CityDrag.y / 20)
				blur: CityDrag.y / 50
				scale: 1 + (CityDrag.y / 2000)
			time: 0

CityDrag.on Events.DragEnd, ->
	# If dragged down
	if this.y > 0
		CityDrag.animate
			properties:
				y: 0
			curve: "spring(200,20,0)"
		City.animate
			properties:
				opacity: 1
			curve: "spring(200,20,0)"
		CTA.animate
			properties:
				opacity: 1
			curve: "spring(200,20,0)"
		Weather.animate
			properties:
				opacity: 0
			curve: "spring(200,20,0)"
		Home.animate
			properties:
				y: 0
			curve: "spring(200,20,0)"
		Background0.animate
			properties:
				brightness: 100
				blur: 0
				scale: 1
			curve: "ease"
# 		HomeVideo.animate
# 			properties:
# 				brightness: 100
# 				blur: 0
# 				scale: 1
# 			curve: "ease"
	
	# If dragged down and
	if this.y < 0 and this.draggable.calculateVelocity().y > 0
		CityDrag.animate
			properties:
				y: 0
			curve: "spring(200,20,0)"
		City.animate
			properties:
				opacity: 1
			curve: "spring(200,20,0)"
		CTA.animate
			properties:
				opacity: 1
			curve: "spring(200,20,0)"
		Weather.animate
			properties:
				opacity: 0
			curve: "spring(200,20,0)"
		Home.animate
			properties:
				y: 0
			curve: "spring(200,20,0)"
		Background0.animate
			properties:
				brightness: 100
				blur: 0
				scale: 1
			curve: "spring(200,20,0)"
	
	# If dragged up
	if this.draggable.calculateVelocity().y < 0
		CityDrag.animate
			properties:
				y: -1136
			curve: "spring(200,20,0)"
		Home.animate
			properties:
				y: -1136
			curve: "spring(200,20,0)"
		Number.animate
			properties:
				x: 30
			curve: "spring(200,20,0)"
		Story1Group.animate
			properties:
				y: 0
			curve: "spring(200,20,0)"
		
Story1Drag.on Events.DragMove, ->
	# If dragging down
	if Story1Drag.y > 0
		Home.animate
			properties:
				y: -1136 + Story1Drag.y
			time: 0
	
	# If dragging up
	if Story1Drag.y < 0
# 		Background1.animate
# 			properties:
# 				y: Story1Drag.y
# 			time: 0
		Story1Group.animate
			properties:
				y: Story1Drag.y
			time: 0
		
Story1Drag.on Events.DragEnd, ->
	# If dragged up
	if this.draggable.calculateVelocity().y < 0
		Story1Group.animate
			properties:
				y: -1136
			curve: "spring(200,20,0)"	
		Story1Drag.animate
			properties:
				y: -1136
			curve: "spring(200,20,0)"	
		Story2Group.animate
			properties:
				y: 0
			curve: "spring(200,20,0)"
		Number.animate
			properties:
				x: 30
				y: 330
			curve: "spring(200,20,0)"
# 		Background1.animate
# 			properties:
# 				y: -1136
# 			curve: "spring(200,20,0)"
		Background1.animate
			properties:
				opacity: 0
			curve: "ease"
		Number1.animate
			properties:
				opacity: 0
				y: -100
			curve: "ease"
		Number2.opacity = 1
	
	# If dragged down
	if this.draggable.calculateVelocity().y > 0
		Home.animate
			properties:
				y: 0
			curve: "spring(200,20,0)"
		CityDrag.animate
			properties:
				y: 0
			curve: "spring(200,20,0)"
		Number.animate
			properties:
				x: -200
			curve: "spring(200,20,0)"
		Story1Group.animate
			properties:
				y: 0
			curve: "spring(200,20,0)"
		Story1Drag.animate
			properties:
				y: 0
			curve: "spring(200,20,0)"
		CurrentPage = "home"
				
Story2Drag.on Events.DragMove, ->
	# If dragging down
		Story2Group.animate
			properties:
				y: Story2Drag.y
			time: 0
		
Story2Drag.on Events.DragEnd, ->
	# If dragged down		
	if this.draggable.calculateVelocity().y > 0
		Story1Group.animate
			properties:
				y: 0
			curve: "spring(200,20,0)"
		Story1Drag.animate
			properties:
				y: 0
			curve: "spring(200,20,0)"
		Story2Group.animate
			properties:
				y: 1136
			curve: "spring(200,20,0)"
		Story2Drag.animate
			properties:
				y: 0
			curve: "spring(200,20,0)"
		Number.animate
			properties:
				y: 500
			curve: "spring(200,20,0)"
		Background1.animate
			properties:
				opacity: 1
			curve: "ease"
# 		Background1.animate
# 			properties:
# 				y: 0
# 			curve: "spring(200,20,0)"
		Number1.animate
			properties:
				opacity: 1
				y: 0
			curve: "ease"
		Number2.opacity = 0.2
		
	if this.y < 0
		this.animate
			properties:
				y: 0
			curve: "spring(200,20,0)"
		Story2Group.animate
			properties:
				y: 0
			curve: "spring(200,20,0)"