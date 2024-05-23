# GLOBAL VARIABLES

# Ints
TopStoriesSeattleUp = 500

# Booleans
HeaderDown = false
TopStoriesSeattleDragging = false

# Strings
CurrentCity = "Seattle"

# MAIN CONTAINER
Background = new Layer()
Background.width = 640
Background.height = 1136
Background.backgroundColor = "black"
Background.x = 0

# Background.states.add
# 	visible: { x: 0 }
# 	invisible: { x: -640 }
# Background.animationOptions = 
#     curve: "spring(2000,30,2)"

# VIDEO PLAYER CONTAINER
VideoContainer = new Layer()
VideoContainer.width = 640
VideoContainer.height = 1136
VideoContainer.backgroundColor = "white"
VideoContainer.x = 640

# VideoContainer.states.add
# 	visible: { x: 0 }
# 	invisible: { x: 640 }
# VideoContainer.animationOptions = 
#     curve: "spring(2000,30,2)"

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
Seattle.y = 200
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
	down: { y: 200, scale: 1 }
	left: { x: -260 }
	right: { x: 120 }
	appear: { opacity: 1 }
Seattle.states.animationOptions = 
    curve: "spring(500,50,0)"

# WASHINGTON TEXT
Washington = new Layer()
Washington.width = 400
Washington.x = 120
Washington.y = 270
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
	down: { y: 270, scale: 1, opacity: 0.5 }
	left: { x: -260 }
	right: { x: 120 }
Washington.states.animationOptions = 
    curve: "spring(500,50,0)"

# MIAMI TEXT
Miami = new Layer()
Miami.width = 400
Miami.y = 200
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
	down: { y: 200, scale: 1 }
	left: { x: 120 }
	right: { x: 500 }
	appear: { opacity: 1 }
Miami.states.animationOptions = 
    curve: "spring(500,50,0)"

# FLORIDA TEXT
Florida = new Layer()
Florida.ignoreEvents = true
Florida.width = 400
Florida.y = 270
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
	down: { y: 270, scale: 1, opacity: 0.5 }
	left: { x: 120 }
	right: { x: 500 }
Florida.states.animationOptions = 
    curve: "spring(500,50,0)"

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
SearchText.html = "Search for a story"
SearchText.style = {	
	"font-family": "Lato",
	"font-size": "30px",
	"text-align": "center",
	"padding": "20px"
}
SearchText.width = 300
SearchText.height = 80
SearchText.x = 640
SearchText.y = 50
SearchText.backgroundColor = "transparent"
SearchText.opacity = 0.5

# CREATES AREA TO CLICK BELOW SEARCH BAR TO CLOSE SEARCH
SearchBack = new Layer()
SearchBack.y = 133
SearchBack.width = 640
SearchBack.height = 1003
SearchBack.backgroundColor = "transparent"
SearchBack.ignoreEvents = true

# MENU OPTIONS LAYER
MenuOptionsContainer = new Layer()
MenuOptionsContainer.y = 133
MenuOptionsContainer.width = 640
MenuOptionsContainer.height = 1003
MenuOptionsContainer.backgroundColor = "transparent"

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
ActiveTab.backgroundColor = "#47b41c"
ActiveTab.x = 95
ActiveTab.y = 561

ActiveTab.states.add
	playlist: { x:95 }
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

# IMPORTED PHOTOSHOP FILES
HomeTownLive = Framer.Importer.load "imported/hometownlive-framer"
HomeTownLiveTrending = Framer.Importer.load "imported/hometownlive-trending-framer"

# MAKE ALL LAYERS AVAILABLE ON ROOT
for layerGroupName of HomeTownLive
	window[layerGroupName] = HomeTownLive[layerGroupName]

for layerGroupName of HomeTownLiveTrending
	window[layerGroupName] = HomeTownLiveTrending[layerGroupName]

for layerGroupName of HomeTownLive
	HomeTownLive[layerGroupName].originalFrame = window[layerGroupName].frame
 
for layerGroupName of HomeTownLiveTrending
	HomeTownLiveTrending[layerGroupName].originalFrame = window[layerGroupName].frame

# ORDERS OF ALL THE LAYERS IN LEVEL 1 (HOME)
MenuOptions.superLayer = MenuOptionsContainer
MenuBG.placeBehind(Background)
MenuOptionsContainer.placeBehind(Background)
MenuHeader.placeBehind(Background)
FloridaBG.superLayer = Background
SeattleBG.superLayer = Background
Trending.superLayer = Background
Recommended.superLayer = Background
RecommendedTitle.superLayer = Background
TopStoriesSeattle.superLayer = Background
Header.superLayer = Background
Seattle.superLayer = Background
Washington.superLayer = Background
Miami.superLayer = Background
Florida.superLayer = Background
HeaderMask.superLayer = Background
Menu.superLayer = Background
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
Back.superLayer = VideoContainer

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

# TOP STORIES TILE SETTINGS
TopStoriesSeattle.y = 500
TopStoriesSeattle.draggable.enabled = true
TopStoriesSeattle.draggable.speedX = 0
TopStoriesSeattle.draggable.speedY = 0.7

TopStoriesSeattle.states.add
	up: { y: 170 }
	down: { y: 500 }
TopStoriesSeattle.states.animationOptions = 
    curve: "spring(200,30,2)"

TopStoriesSeattle.on Events.Click, ->
# 	Background.states.switch("invisible")
# 	VideoContainer.states.switch("visible")
	if TopStoriesSeattleDragging is false
		Background.animate
			properties:
				x: -640
			curve: "spring(500,50,0)"
		VideoContainer.animate
			properties:
				x: 0
			curve: "spring(500,50,0)"
 		VideoFile.player.play()
		

# RECOMMENDED STORIES TITLE SETTINGS
RecommendedTitle.y = 980
RecommendedTitle.x = 30

RecommendedTitle.states.add
	up: { y: 650 }
	down: { y: 980 }
RecommendedTitle.states.animationOptions = 
    curve: "spring(200,30,2)"

# RECOMMENDED STORIES TILE SETTINGS
Recommended.y = 1024
Recommended.x = 30
Recommended.draggable.enabled = true
Recommended.draggable.speedX = 0.7
Recommended.draggable.speedY = 0

Recommended.states.add
	up: { y: 694 }
	down: { y: 1024 }
Recommended.states.animationOptions = 
    curve: "spring(200,30,2)"

# TRENDING STORIES TILE SETTINGS
Trending.y = 1504

Trending.states.add
	up: { y: 1100 }
	down: { y: 1504 }
Trending.states.animationOptions = 
    curve: "spring(200,30,2)"

# SEARCH ICON SETTINGS
Search.x = 570
Search.y = 70

# BOOKMARK ICON SETTINGS
Bookmark.x = 570
Bookmark.y = 60

Bookmark.on Events.Click, ->
	if BookmarkFilled.visible = false
		BookmarkFilled.visible = true
	else 
		BookmarkFilled.visible = false

# BOOKMARK FILLED ICON SETTINGS
BookmarkFilled.x = 570
BookmarkFilled.y = 60
BookmarkFilled.visible = false

# BOOKMARKED MESSAGE SETTINGS
BookmarkMessage = new Layer()
BookmarkMessage.width = 400
BookmarkMessage.height = 180
BookmarkMessage.backgroundColor = "rgba(0, 0, 0, 0.5)"
BookmarkMessage.borderRadius = 10
BookmarkMessage.center()
BookmarkMessage.html = "Bookmarked"
VideoText.style = {	
	"font-family": "Lato",
	"font-weight": "lighter",
	"font-size": "46px",
	"text-align": "center",
	"padding": "20px"
}

# KEYBOAARD
Keyboard.y = 1136
Keyboard.x = 0

# MENU ICON SETTINGS
Menu.x = 30
Menu.y = 70

# BACK ICON SETTINGS
Back.x = 30
Back.y = 60

Back.on Events.Click, ->
# 	Background.states.switch("visible")
# 	VideoContainer.states.switch("invisible")
	Background.animate
		properties:
			x: 0
		curve: "spring(500,50,0)"
	VideoContainer.animate
		properties:
			x: 640
		curve: "spring(500,50,0)"
	VideoFile.player.pause()

# HEADER BAR SETTINGS
Header.y = -140

Header.states.add
	up: { y: -140 }
	down: { y: 0 }
Header.states.animationOptions = 
    curve: "spring(500,50,0)"
    
# HEADER MASK BAR SETTINGS
HeaderMask.y = -140

HeaderMask.states.add
	up: { y: -140 }
	down: { y: 0 }
HeaderMask.states.animationOptions = 
    curve: "spring(500,50,0)"

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
	clear: { scale: 1, blur: 0, brightness: 100 }
	blur: { scale: 1.2, blur: 20, brightness: 70 }
	left: { opacity: 0 }
	right: { opacity: 1 }
SeattleBG.states.animationOptions = 
    curve: "ease"
	
FloridaBG.states.add
	clear: { scale: 1, blur: 0, brightness: 100 }
	blur: { scale: 1.2, blur: 20, brightness: 70 }
	left: { opacity: 1 }
	right: { opacity: 0 }
FloridaBG.states.animationOptions = 
    curve: "ease"

# ON SEATTLE DRAG MOVE
Seattle.on Events.DragMove, ->
	# If dragged to the left
	if this.draggable.calculateVelocity().x < 0
		Seattle.ignoreEvents = true
		Miami.ignoreEvents = false
		Seattle.states.switch("left")
		Washington.states.switch("left")
		Miami.states.switch("left")
		Florida.states.switch("left")
		SeattleBG.states.switch("left")
		FloridaBG.states.switch("left")
		TopStoriesSeattle.animate
			properties:
				opacity: 0
			curve: "spring(500,50,0)"
		TopStoriesSeattle.on Events.AnimationEnd, ->
			this.animate
				properties:
					opacity: 1
				curve: "spring(500,50,0)"
		RecommendedTitle.animate
			properties:
				opacity: 0
			curve: "spring(500,50,0)"
		RecommendedTitle.on Events.AnimationEnd, ->
			this.animate
				properties:
					opacity: 1
				curve: "spring(500,50,0)"
		Recommended.animate
			properties:
				opacity: 0
			curve: "spring(500,50,0)"
		Recommended.on Events.AnimationEnd, ->
			this.animate
				properties:
					opacity: 1
				curve: "spring(500,50,0)"
		Trending.animate
			properties:
				opacity: 0
			curve: "spring(500,50,0)"
		Trending.on Events.AnimationEnd, ->
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
		Miami.ignoreEvents = true
		Seattle.states.switch("right")
		Washington.states.switch("right")
		Miami.states.switch("right")
		Florida.states.switch("right")
		SeattleBG.states.switch("right")
		FloridaBG.states.switch("right")
		TopStoriesSeattle.animate
			properties:
				opacity: 0
			curve: "spring(500,50,0)"
		TopStoriesSeattle.on Events.AnimationEnd, ->
			this.animate
				properties:
					opacity: 1
				curve: "spring(500,50,0)"
		RecommendedTitle.animate
			properties:
				opacity: 0
			curve: "spring(500,50,0)"
		RecommendedTitle.on Events.AnimationEnd, ->
			this.animate
				properties:
					opacity: 1
				curve: "spring(500,50,0)"
		Recommended.animate
			properties:
				opacity: 0
			curve: "spring(500,50,0)"
		Recommended.on Events.AnimationEnd, ->
			this.animate
				properties:
					opacity: 1
				curve: "spring(500,50,0)"
		Trending.animate
			properties:
				opacity: 0
			curve: "spring(500,50,0)"
		Trending.on Events.AnimationEnd, ->
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

# ON TOP STORIES DRAG MOVE
TopStoriesSeattle.on Events.DragMove, ->
	TopStoriesSeattleDragging = true
	# If dragged down
	if this.draggable.calculateVelocity().y > 0
		HeaderDown = false
		SeattleBG.states.switch("clear")
		FloridaBG.states.switch("clear")
		Header.states.switch("up")
		HeaderMask.states.switch("up")
		Seattle.states.switch("down")
		Washington.states.switch("down")
		Miami.states.switch("down")
		Florida.states.switch("down")
		TopStoriesSeattle.states.switch("down")
		RecommendedTitle.states.switch("down")
		Recommended.states.switch("down")
		Trending.states.switch("down")
	# If dragged up
	else if this.draggable.calculateVelocity().y < 0
		HeaderDown = true
		SeattleBG.states.switch("blur")
		FloridaBG.states.switch("blur")
		Header.states.switch("down")
		HeaderMask.states.switch("down")
		Seattle.states.switch("up")
		Washington.states.switch("up")
		Miami.states.switch("up")
		Florida.states.switch("up")
		TopStoriesSeattle.states.switch("up")
		RecommendedTitle.states.switch("up")
		Recommended.states.switch("up")
		Trending.states.switch("up")
		
TopStoriesSeattle.on Events.DragEnd, ->
	TopStoriesSeattleDragging = false
			
Recommended.on Events.DragMove, ->
	if this.draggable.calculateVelocity().x < 0
		if this.x > -503
			this.animate
				properties:
					x: -503
				curve: "spring(500,50,0)"
		else if this.x > -1060
			this.animate
				properties:
					x: -1060
				curve: "spring(500,50,0)"
		else if this.x > -1620
			this.animate
				properties:
					x: -1620
				curve: "spring(500,50,0)"
		else if this.x > -2130
			this.animate
				properties:
					x: -2130
				curve: "spring(500,50,0)"
	else if this.draggable.calculateVelocity().x > 0
		if this.x < -1620
			this.animate
				properties:
					x: -1620
				curve: "spring(200,30,2)"
		else if this.x < -1060
			this.animate
				properties:
					x: -1060
				curve: "spring(200,30,2)"
		else if this.x < -503
			this.animate
				properties:
					x: -503
				curve: "spring(200,30,2)"
		else if this.x < 30
			this.animate
				properties:
					x: 30
				curve: "spring(200,30,2)"
			
TopStoriesSeattle.on Events.DragMove, ->
	if this.y > 1000
		this.animate
			properties:
				y:1000
			curve: "spring(500,50,0)"
	else if this.y < 170
		this.animate
			properties:
				y:170
			curve: "spring(500,50,0)"
			
Recommended.on Events.DragMove, ->
	if this.x > 30
		this.animate
			properties:
				x:30
			curve: "spring(500,50,0)"
	else if this.x < -2130
		this.animate
			properties:
				x: -2130
			curve: "spring(500,50,0)"
			
MenuOptions.on Events.DragMove, ->
	this.animate
		properties:
			y: 50
		curve: "spring(500,50,0)"

Menu.on Events.Click, ->
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
	Header.animate
		properties:
			y:0
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
	TopStoriesSeattle.animate
		properties:
			blur: 20
			brightness: 70
		curve: "ease"
	RecommendedTitle.animate
		properties:
			blur: 20
			brightness: 70
		curve: "ease"
	Recommended.animate
		properties:
			blur: 20
			brightness: 70
		curve: "ease"
	Trending.animate
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
		Header.animate
			properties:
				y:0
			curve: "spring(500,50,0)"
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
		TopStoriesSeattle.animate
			properties:
				blur: 0
				brightness: 100
			curve: "spring(500,50,0)"
		RecommendedTitle.animate
			properties:
				blur: 0
				brightness: 100
			curve: "spring(200,30,2)"
		Recommended.animate
			properties:
				blur: 0
				brightness: 100
			curve: "spring(200,30,2)"
		Trending.animate
			properties:
				blur: 0
				brightness: 100
			curve: "spring(200,30,2)"
	else
		Header.animate
			properties:
				y:-140
			curve: "spring(1000,50,10)"
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
		TopStoriesSeattle.animate
			properties:
				blur: 0
				brightness: 100
			curve: "ease"
		RecommendedTitle.animate
			properties:
				blur: 0
				brightness: 100
			curve: "ease"
		Recommended.animate
			properties:
				blur: 0
				brightness: 100
			curve: "ease"
		Trending.animate
			properties:
				blur: 0
				brightness: 100
			curve: "ease"
			
StatusBar.destroy()