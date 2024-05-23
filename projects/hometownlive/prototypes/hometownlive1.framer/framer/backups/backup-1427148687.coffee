# GLOBAL VARIABLES

# Ints
TopStoriesUp = 500

# Booleans
HeaderDown = false
TopStoriesDragging = false
Bookmarked = false

# Strings
CurrentCity = "Seattle"

# MAIN CONTAINER
Background = new Layer()
Background.width = 640
Background.height = 1136
Background.backgroundColor = "black"
Background.x = 0

# VIDEO PLAYER CONTAINER
VideoContainer = new Layer()
VideoContainer.width = 640
VideoContainer.height = 1136
VideoContainer.backgroundColor = "white"
VideoContainer.x = 640

# VIDEO TEXT
VideoText = new Layer()
VideoText.width = 400
VideoText.y = 42
VideoText.x = 120
VideoText.backgroundColor = "transparent"
VideoText.html = "Car Accident on..."
VideoText.style = {	
	"font-family": "Lato",
	"font-weight": "lighter",
	"font-size": "46px",
	"text-align": "center",
	"padding": "20px"
}

# SEATTLE TEXT
Seattle = new Layer()
Seattle.width = 400
Seattle.y = 300
Seattle.x = 120
Seattle.backgroundColor = "transparent"
Seattle.html = "Seattle"
Seattle.style = {	
	"font-family": "Lato",
	"font-weight": "lighter",
	"font-size": "92px",
	"text-align": "center",
	"padding": "20px"
}

Seattle.draggable.enabled = true
Seattle.draggable.speedX = 0.7
Seattle.draggable.speedY = 0

Seattle.states.add
	up: { y: 42, scale: 0.5 }
	down: { y: 300, scale: 1 }
	left: { x: -260 }
	right: { x: 120 }
	appear: { opacity: 1 }
Seattle.states.animationOptions = 
    curve: "spring(500,50,0)"

# WASHINGTON TEXT
Washington = new Layer()
Washington.width = 400
Washington.x = 120
Washington.y = 370
Washington.opacity = 0.5
Washington.backgroundColor = "transparent"
Washington.html = "WASHINGTON"
Washington.style = {	
	"font-family": "Lato",
	"font-weight": "800",
	"font-size": "22px",
	"text-align": "center",
	"padding": "20px"
}

Washington.states.add
	up: { y: 0, scale: 0.5, opacity: 0 }
	down: { y: 370, scale: 1, opacity: 0.5 }
	left: { x: -260 }
	right: { x: 120 }
Washington.states.animationOptions = 
    curve: "spring(500,50,0)"

# MIAMI TEXT
Miami = new Layer()
Miami.width = 400
Miami.y = 300
Miami.x = 500
Miami.backgroundColor = "transparent"
Miami.html = "Miami"
Miami.style = {	
	"font-family": "Lato",
	"font-weight": "lighter",
	"font-size": "92px",
	"text-align": "center",
	"padding": "20px"
}
Miami.draggable.enabled = true
Miami.draggable.speedX = 0.7
Miami.draggable.speedY = 0

Miami.states.add
	up: { y: 42, scale: 0.5 }
	down: { y: 300, scale: 1 }
	left: { x: 120 }
	right: { x: 500 }
	appear: { opacity: 1 }
Miami.states.animationOptions = 
    curve: "spring(500,50,0)"

# FLORIDA TEXT
Florida = new Layer()
Florida.ignoreEvents = true
Florida.width = 400
Florida.y = 370
Florida.x = 620
Florida.opacity = 0.5
Florida.backgroundColor = "transparent"
Florida.html = "FLORIDA"
Florida.style = {	
	"font-family": "Lato",
	"font-weight": "800",
	"font-size": "22px",
	"text-align": "center",
	"padding": "20px"
}

Florida.states.add
	up: { y: 0, scale: 0.5, opacity: 0 }
	down: { y: 370, scale: 1, opacity: 0.5 }
	left: { x: 120 }
	right: { x: 500 }
Florida.states.animationOptions = 
    curve: "spring(500,50,0)"

# MENU HOTSPOT SETTINGS
MenuButton = new Layer()
MenuButton.x = 0
MenuButton.y = 30
MenuButton.backgroundColor = "transparent"

MenuButton.on Events.Click, ->
	Background.animate
		properties:
			x: 300
			scale: 0.6
			blur: 10
		curve: "spring(500,50,0)"
	MenuHeader.animate
		properties:
			x: 0
		curve: "spring(500,50,0)"
	MenuOptions.animate
		properties:
			x: 0
		curve: "spring(500,50,0)"
	MenuBack.ignoreEvents = false

# CREATES AREA TO CLICK TO LEAVE MENU
MenuBack = new Layer()
MenuBack.y = 200
MenuBack.x = 400
MenuBack.height = 750
MenuBack.width = 240
MenuBack.backgroundColor = "transparent"
MenuBack.ignoreEvents = true

#SEARCH TEXT 
SearchText = new Layer()
SearchText.html = "Search for a story in " + CurrentCity
SearchText.style = {	
	"font-family": "Lato",
	"font-size": "30px",
	"text-align": "left",
	"padding-left": "50px"
	"padding-top": "20px"
}
SearchText.width = 640
SearchText.height = 80
SearchText.x = 640
SearchText.y = 50
SearchText.backgroundColor = "transparent"
SearchText.opacity = 0.5

# CREATES AREA TO CLICK BELOW SEARCH BAR TO CLOSE SEARCH
SearchBack = new Layer()
SearchBack.y = 215
SearchBack.width = 640
SearchBack.height = 921
SearchBack.backgroundColor = "transparent"
SearchBack.ignoreEvents = true

# MENU OPTIONS LAYER
MenuOptionsContainer = new Layer()
MenuOptionsContainer.y = 133
MenuOptionsContainer.width = 640
MenuOptionsContainer.height = 1003
MenuOptionsContainer.backgroundColor = "transparent"

# BACK HOTSPOT
BackButton = new Layer()
BackButton.x = 0
BackButton.y = 30
BackButton.backgroundColor = "transparent"

BackButton.on Events.Click, ->
	Background.animate
		properties:
			x: 0
		curve: "spring(500,50,0)"
	VideoContainer.animate
		properties:
			x: 640
		curve: "spring(500,50,0)"
	VideoFile.player.pause()

# PLAYLIST HOTSPOT
PlaylistButton = new Layer()
PlaylistButton.x = 95
PlaylistButton.y = 490
PlaylistButton.width = 160
PlaylistButton.height = 80
PlaylistButton.backgroundColor = "transparent"

# COMMENTS HOTSPOT
CommentsButton = new Layer()
CommentsButton.x = 386
CommentsButton.y = 490
CommentsButton.width = 160
CommentsButton.height = 80
CommentsButton.backgroundColor = "transparent"

# ACTIVE TAB LAYER
ActiveTab = new Layer()
ActiveTab.height = 7
ActiveTab.width = 160
ActiveTab.backgroundColor = "#40434b"
ActiveTab.x = 95
ActiveTab.y = 561

ActiveTab.states.add
	playlist: { x: 95 }
	comments: { x: 386 }
ActiveTab.states.animationOptions = 
    curve: "spring(500,50,0)"

# VIDEO FILE
VideoFile = new VideoLayer({video: "video/storm.mp4"})
VideoFile.width = 640
VideoFile.height = 360
VideoFile.y = 129
Events.wrap(VideoFile.player).on "ended", ()->
     VideoFile.player.play()
     
# BOOKMARKED MESSAGE SETTINGS
BookmarkMessage = new Layer()
BookmarkMessage.width = 400
BookmarkMessage.height = 120
BookmarkMessage.opacity = 0
BookmarkMessage.backgroundColor = "rgba(0, 0, 0, 0.75)"
BookmarkMessage.borderRadius = 10
BookmarkMessage.center()
	
BookmarkMessage.style = {	
	"font-family": "Lato",
	"font-weight": "bold",
	"font-size": "30px",
	"text-align": "center",
	"padding": "50px"
}

StoriesContainer = new Layer()
StoriesContainer.y = 700
StoriesContainer.width = 640
StoriesContainer.height = 921
StoriesContainer.backgroundColor = "transparent"
StoriesContainer.clip = true
    
StoriesContainer.states.add	
	up: { y: 215 }
	down: { y: 700 }   
StoriesContainer.states.animationOptions = 
    curve: "spring(500,50,0)"
    
StoriesContainerBG = new Layer()
StoriesContainerBG.y = 0
StoriesContainerBG.width = 640
StoriesContainerBG.height = 921
StoriesContainerBG.opacity = 0
StoriesContainerBG.backgroundColor = "#eeeeee"

StoriesContainerBG.states.add	
	up: { opacity: 1 }
	down: { opacity: 0 }
StoriesContainerBG.states.animationOptions = 
    curve: "ease"

# IMPORTED PHOTOSHOP FILES
HomeTownLive = Framer.Importer.load "imported/hometownlive-framer"
TopStoriesPSD = Framer.Importer.load "imported/hometownlive-top-stories"
TabsPSD = Framer.Importer.load "imported/hometownlive-tabs-framer"

# MAKE ALL LAYERS AVAILABLE ON ROOT
for layerGroupName of HomeTownLive
	window[layerGroupName] = HomeTownLive[layerGroupName]

for layerGroupName of HomeTownLive
	HomeTownLive[layerGroupName].originalFrame = window[layerGroupName].frame
	
for layerGroupName of TopStoriesPSD
	window[layerGroupName] = TopStoriesPSD[layerGroupName]

for layerGroupName of TopStoriesPSD
	TopStoriesPSD[layerGroupName].originalFrame = window[layerGroupName].frame
	
for layerGroupName of TabsPSD
	window[layerGroupName] = TabsPSD[layerGroupName]

for layerGroupName of TabsPSD
	TabsPSD[layerGroupName].originalFrame = window[layerGroupName].frame

# ORDERS OF ALL THE LAYERS IN STORIES SECTION
StoriesContainerBG.superLayer = StoriesContainer
TopStories.superLayer = StoriesContainer

# ORDERS OF ALL THE LAYERS IN LEVEL 1 (HOME)
MenuOptions.superLayer = MenuOptionsContainer
MenuBG.placeBehind(Background)
MenuOptionsContainer.placeBehind(Background)
MenuHeader.placeBehind(Background)
FloridaBG.superLayer = Background
SeattleBG.superLayer = Background
StoriesContainer.superLayer = Background
Tabs.superLayer = Background
Seattle.superLayer = Background
Washington.superLayer = Background
Miami.superLayer = Background
Florida.superLayer = Background
Menu.superLayer = Background
MenuButton.superLayer = Background
Search.superLayer = Background
StatusBar.superLayer = Background

# ORDERS OF ALL THE LAYERS IN LEVEL 2 (VIDEO PLAYER)
WhiteBackground.superLayer = VideoContainer
Comments.superLayer = VideoContainer
Playlist.superLayer = VideoContainer
VideoTabs.superLayer = VideoContainer
ActiveTab.superLayer = VideoContainer
Video.superLayer = VideoContainer
VideoFile.superLayer = VideoContainer
VideoHeader.superLayer = VideoContainer
VideoText.superLayer = VideoContainer
Bookmark.superLayer = VideoContainer
BookmarkFilled.superLayer = VideoContainer
BookmarkMessage.superLayer = VideoContainer
Back.superLayer = VideoContainer
BackButton.superLayer = VideoContainer

# PLAYLIST SETTINGS
Playlist.x = 0
Playlist.draggable.enabled = true
Playlist.draggable.speedX = 0
Playlist.draggable.speedY = 0.7

Playlist.states.add
	visible: { x:0 }
	invisible: { x: -640 }
Playlist.states.animationOptions = 
    curve: "spring(500,50,0)"

Playlist.on Events.DragMove, ->
	this.animate
		properties:
			y: 598
		curve: "spring(200,30,2)"

# COMMENTS SETTINGS
Comments.x = 640
Comments.draggable.enabled = true
Comments.draggable.speedX = 0
Comments.draggable.speedY = 0.7

Comments.states.add
	visible: { x:0 }
	invisible: { x: 640 }
Comments.states.animationOptions = 
    curve: "spring(500,50,0)"

Comments.on Events.DragMove, ->
	this.animate
		properties:
			y: 598
		curve: "spring(200,30,2)"
		
# VIDEO TABS
PlaylistButton.on Events.Click, ->
	ActiveTab.states.switch("playlist")
	Playlist.states.switch("visible")
	Comments.states.switch("invisible")

CommentsButton.on Events.Click, ->
	ActiveTab.states.switch("comments")
	Playlist.states.switch("invisible")
	Comments.states.switch("visible")

# STORIES TABS
Tabs.y = 620
Tabs.x = 21
Tabs.draggable.enabled = true
Tabs.draggable.speedX = 0.7
Tabs.draggable.speedY = 0

Tabs.on Events.DragEnd, ->
	if this.x > 21
		this.animate
			properties:
				x: 21
			curve: "spring(500,50,0)"
	else if this.x < -509
		this.animate
			properties:
				x: -509
			curve: "spring(500,50,0)"

Tabs.states.add
	up: { y: 135 }
	down: { y: 620 }
Tabs.states.animationOptions = 
    curve: "spring(500,50,0)"

# STORIES CONTAINER
StoriesContainer.draggable.enabled = true
StoriesContainer.draggable.speedX = 0
StoriesContainer.draggable.speedY = 0.7
 		
StoriesContainer.on Events.DragMove, ->
	TopStoriesDragging = true
	# If dragged down
# 	if this.draggable.calculateVelocity().y > 0
# 		HeaderDown = false
# 		SeattleBG.states.switch("clear")
# 		FloridaBG.states.switch("clear")
# 		Seattle.states.switch("down")
# 		Washington.states.switch("down")
# 		Miami.states.switch("down")
# 		Florida.states.switch("down")
# 		StoriesContainer.states.switch("down")
# 		StoriesContainerBG.states.switch("down")
# 		StoriesContainer.draggable.enabled = true
# 		TopStories.draggable.enabled = false
	# If dragged up
	if this.draggable.calculateVelocity().y < 0
		HeaderDown = true
		SeattleBG.states.switch("blur")
		FloridaBG.states.switch("blur")
		Tabs.states.switch("up")
		Seattle.states.switch("up")
		Washington.states.switch("up")
		Miami.states.switch("up")
		Florida.states.switch("up")
		StoriesContainer.states.switch("up")
		StoriesContainerBG.states.switch("up")
		StoriesContainer.draggable.enabled = false
		
StoriesContainer.on Events.DragEnd, ->
	if this.y > 700
		this.animate
			properties:
				y:700
			curve: "spring(500,50,0)"
	if HeaderDown is true
		TopStories.draggable.enabled = true
		TopStories.ignoreEvents = false

# TOP STORIES
TopStories.draggable.enabled = false
TopStories.draggable.speedX = 0
TopStories.draggable.speedY = 0.7

TopStories.on Events.DragMove, ->
	TopStoriesDragging = true
			
TopStories.on Events.Click, ->
	if TopStoriesDragging is false
		Background.animate
			properties:
				x: -640
			curve: "spring(500,50,0)"
		VideoContainer.animate
			properties:
				x: 0
			curve: "spring(500,50,0)"
 		VideoFile.player.play()
 		
TopStories.on Events.DragEnd, ->
	TopStoriesDragging = false
	if TopStories.y > 30
		this.animate
			properties:
				y:30
			curve: "spring(500,50,0)"
		HeaderDown = false
		SeattleBG.states.switch("clear")
		FloridaBG.states.switch("clear")
		Tabs.states.switch("down")
		Seattle.states.switch("down")
		Washington.states.switch("down")
		Miami.states.switch("down")
		Florida.states.switch("down")
		StoriesContainer.states.switch("down")
		StoriesContainerBG.states.switch("down")
		StoriesContainer.draggable.enabled = true
		TopStories.draggable.enabled = false
		TopStories.ignoreEvents = true
	else if this.y < -858
		this.animate
			properties:
				y: -858
			curve: "spring(500,50,0)"
					
# SEARCH ICON SETTINGS
Search.x = 570
Search.y = 70

# BOOKMARK ICON SETTINGS
Bookmark.x = 570
Bookmark.y = 60

Bookmark.on Events.Click, ->
	if BookmarkFilled.visible is false
		BookmarkMessage.html = "Saved"
		BookmarkFilled.visible = true
		BookmarkMessage.animate
			properties:
				opacity: 1
			curve: "ease"
		BookmarkMessage.on Events.AnimationEnd, ->
			this.animate
				properties:
					opacity: 0
				curve: "ease"
	else 
		BookmarkMessage.html = "Unsaved"
		BookmarkFilled.visible = false
		BookmarkMessage.animate
			properties:
				opacity: 1
			curve: "ease"
		BookmarkMessage.on Events.AnimationEnd, ->
			this.animate
				properties:
					opacity: 0
				curve: "ease"

# BOOKMARK FILLED ICON SETTINGS
BookmarkFilled.x = 570
BookmarkFilled.y = 60
BookmarkFilled.visible = false

# KEYBOAARD
Keyboard.y = 1136
Keyboard.x = 0

# MENU ICON SETTINGS
Menu.x = 30
Menu.y = 70

# BACK ICON SETTINGS
Back.x = 30
Back.y = 60

# MENU OPTIONS SETTINGS
MenuOptions.y = 50
MenuOptions.draggable.enabled = true
MenuOptions.draggable.speedX = 0
MenuOptions.draggable.speedY = 0.7

# MENU HEADER + OPTIONS SETTINGS
MenuHeader.x = -640
MenuOptions.x = -640

# BACKGROUND PICUTRE SETTINGS
SeattleBG.x = 0
FloridaBG.x = 0

SeattleBG.states.add
	clear: { y: 0, scale: 1, blur: 0, brightness: 100 }
	blur: { y: -500, scale: 1.2, blur: 2, brightness: 100 }
	left: { opacity: 0 }
	right: { opacity: 1 }
SeattleBG.states.animationOptions = 
    curve: "spring(500,50,0)"
	
FloridaBG.states.add
	clear: { y: 0, scale: 1, blur: 0, brightness: 100 }
	blur: { y: -500, scale: 1.2, blur: 2, brightness: 100 }
	left: { opacity: 1 }
	right: { opacity: 0 }
FloridaBG.states.animationOptions = 
    curve: "spring(500,50,0)"

# ON SEATTLE DRAG MOVE
Seattle.on Events.DragMove, ->
	# If dragged to the left
	if this.draggable.calculateVelocity().x < 0
		Seattle.ignoreEvents = true
		SearchText.html = "Search for a story in Miami"
		Miami.ignoreEvents = false
		Seattle.states.switch("left")
		Washington.states.switch("left")
		Miami.states.switch("left")
		Florida.states.switch("left")
		SeattleBG.states.switch("left")
		FloridaBG.states.switch("left")
		TopStories.animate
			properties:
				opacity: 0
			curve: "spring(500,50,0)"
		TopStories.on Events.AnimationEnd, ->
			this.animate
				properties:
					opacity: 1
				curve: "spring(500,50,0)"
	# else dragged right
	else
		this.animate
			properties:
				x:120
			curve: "spring(500,50,0)"

# ON FLORIDA DRAG MOVE
Miami.on Events.DragMove, ->
	# If dragged to the right
	if this.draggable.calculateVelocity().x > 0
		Seattle.ignoreEvents = false
		SearchText.html = "Search for a story in Seattle"
		Miami.ignoreEvents = true
		Seattle.states.switch("right")
		Washington.states.switch("right")
		Miami.states.switch("right")
		Florida.states.switch("right")
		SeattleBG.states.switch("right")
		FloridaBG.states.switch("right")
		TopStories.animate
			properties:
				opacity: 0
			curve: "spring(500,50,0)"
		TopStories.on Events.AnimationEnd, ->
			this.animate
				properties:
					opacity: 1
				curve: "spring(500,50,0)"
	# else dragged left
	else
		this.animate
			properties:
				x:120
			curve: "spring(500,50,0)"				
MenuOptions.on Events.DragMove, ->
	this.animate
		properties:
			y: 50
		curve: "spring(500,50,0)"
		
MenuBack.on Events.Click, ->
	MenuBack.ignoreEvents = true
	Background.animate
		properties:
			x: 0
			scale: 1
			blur: 0
		curve: "spring(500,50,0)"
	MenuHeader.animate
		properties:
			x: -640
		curve: "spring(500,50,0)"
	MenuOptions.animate
		properties:
			x: -640
		curve: "spring(500,50,0)"
	
Search.on Events.Click, ->
	SearchBack.ignoreEvents = false
	Keyboard.animate
		properties:
			y: 704
		curve: "spring(1000,50,10)"
	SeattleBG.animate
		properties:
			scale: 1.2
			blur: 20
			brightness: 70
		curve: "ease"
	FloridaBG.animate
		properties:
			scale: 1.2
			blur: 20
			brightness: 70
		curve: "ease"
	Seattle.animate
		properties:
			scale: 1.2
			blur: 20
			brightness: 70
		curve: "ease"
	Washington.animate
		properties:
			scale: 1.2
			blur: 20
			brightness: 70
		curve: "ease"
	Miami.animate
		properties:
			scale: 1.2
			blur: 20
			brightness: 70
		curve: "ease"
	Florida.animate
		properties:
			scale: 1.2
			blur: 20
			brightness: 70
		curve: "ease"
	TopStories.animate
		properties:
			blur: 20
			brightness: 70
		curve: "ease"
	Search.animate
		properties:
			x: 30
		curve: "spring(500,50,0)"
	SearchText.animate
		properties:
			x: 50
		curve: "spring(500,50,0)"
	Seattle.animate
		properties:
			opacity: 0
		curve: "ease"
	Miami.animate
		properties:
			opacity: 0
		curve: "ease"
	Menu.animate
		properties:
			x: -50
		curve: "spring(500,50,0)"
	StoriesContainer.animate
		properties:
			opacity: 0
		curve: "spring(500,50,0)"
	Tabs.states.switch("up")

SearchBack.on Events.Click, ->
	SearchBack.ignoreEvents = true
	Search.animate
		properties:
			x: 570
		curve: "spring(500,50,0)"
	SearchText.animate
		properties:
			x: 640
		curve: "spring(500,50,0)"
	Seattle.animate
		properties:
			opacity: 1
		curve: "ease"
	Miami.animate
		properties:
			opacity: 1
		curve: "ease"
	Menu.animate
		properties:
			x: 30
		curve: "spring(500,50,0)"
	Keyboard.animate
		properties:
			y: 1136
		curve: "spring(1000,50,10)"
	StoriesContainer.animate
		properties:
			opacity: 1
		curve: "spring(500,50,0)"
	if HeaderDown is true
		SeattleBG.animate
			properties:
				scale: 1.2
				blur: 20
				brightness: 70
			curve: "ease"
		FloridaBG.animate
			properties:
				scale: 1.2
				blur: 20
				brightness: 70
			curve: "ease"
		Seattle.animate
			properties:
				y:42
				scale:0.5
				opacity: 1
				blur: 0
				brightness: 100
			curve: "spring(500,50,0)"
		Washington.animate
			properties:
				y: 30
				opacity: 0
				blur: 0
			curve: "spring(500,50,0)"
		Miami.animate
			properties:
				y:42
				scale:0.5
				opacity: 1
				blur: 0
				brightness: 100
			curve: "spring(500,50,0)"
		Florida.animate
			properties:
				y: 30
				opacity: 0
				blur: 0
			curve: "spring(500,50,0)"
		TopStories.animate
			properties:
				blur: 0
				brightness: 100
			curve: "spring(500,50,0)"
	else
		SeattleBG.animate
			properties:
				scale: 1
				blur: 0
				brightness: 100
			curve: "ease"
		FloridaBG.animate
			properties:
				scale: 1
				blur: 0
				brightness: 100
			curve: "ease"
		Seattle.animate
			properties:
				scale: 1
				blur: 0
				brightness: 100
			curve: "ease"
		Washington.animate
			properties:
				scale: 1
				blur: 0
				brightness: 100
			curve: "ease"
		Miami.animate
			properties:
				scale: 1
				blur: 0
				brightness: 100
			curve: "ease"
		Florida.animate
			properties:
				scale: 1
				blur: 0
				brightness: 100
			curve: "ease"
		TopStories.animate
			properties:
				blur: 0
				brightness: 100
			curve: "ease"
		Tabs.states.switch("down")
			
StatusBar.destroy()