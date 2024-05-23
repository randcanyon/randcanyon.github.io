Home = Framer.Importer.load "imported/HTLiPhone5-Home"
Profile = Framer.Importer.load "imported/HTLiPhone5-Profile"

Home.Popular.x = 640
Home.Recent.x = 1280

Profile.Content.y = 1136

MyFeedButton = new Layer width: 180, height: 86, x: 50, y: 128,  backgroundColor: "transparent", opacity: 1.0
MyFeedButton.html = "MY FEED"
MyFeedButton.style = {
	"text-align":"center"
	"font-size":"25px"
	"padding-top":"30px"
	"color":"#000"
}

PopularButton = new Layer width: 180, height: 86, x: 230, y: 128, backgroundColor: "transparent", opacity: 0.2
PopularButton.html = "POPULAR"
PopularButton.style = {
	"text-align":"center"
	"font-size":"25px"
	"padding-top":"30px"
	"color":"#000"
}

RecentButton = new Layer width: 180, height: 86, x: 410, y: 128, backgroundColor: "transparent", opacity: 0.2
RecentButton.html = "RECENT"
RecentButton.style = {
	"text-align":"center"
	"font-size":"25px"
	"padding-top":"30px"
	"color":"#000"
}

ProfileButton = new Layer width: 90, height: 88, x: 0, y: 40, backgroundColor: "transparent"
CloseProfileButton = new Layer width: 90, height: 88, x: 0, y: 40, backgroundColor: "transparent"

MyFeedButton.superLayer = Home.Header
PopularButton.superLayer = Home.Header
RecentButton.superLayer = Home.Header
ProfileButton.superLayer = Home.Header
CloseProfileButton.superLayer = Profile.Content

MyFeedContainer = new Layer width: 640, height: 827, y: 211, backgroundColor: "transparent"
MyFeedContainer.placeBefore(Home.Background)

Content1Control = new Layer width: 640, height: 827, backgroundColor: "transparent"
Content2Control = new Layer width: 640, height: 827, backgroundColor: "transparent"
Content3Control = new Layer width: 640, height: 827, backgroundColor: "transparent"
Content4Control = new Layer width: 640, height: 827, backgroundColor: "transparent"

Home.Content4.superLayer = MyFeedContainer
Content4Control.superLayer = MyFeedContainer
Home.Content3.superLayer = MyFeedContainer
Content3Control.superLayer = MyFeedContainer
Home.Content2.superLayer = MyFeedContainer
Content2Control.superLayer = MyFeedContainer
Home.Content1.superLayer = MyFeedContainer
Content1Control.superLayer = MyFeedContainer

Home.Content1.y = 0
Home.Content2.y = 0
Home.Content3.y = 0
Home.Content4.y = 25

Home.Status_bar_black.placeBefore(Profile.Content)


# TAB BUTTON EVENTS
MyFeedButton.on Events.Click, ->
	MyFeedContainer.animate
		properties:
			x: 0
		curve: "spring(500,50,0)"
	Home.Popular.animate
		properties:
			x: 640
		curve: "spring(500,50,0)"
	Home.Recent.animate
		properties:
			x: 1280
		curve: "spring(500,50,0)"
	MyFeedButton.animate
		properties:
			opacity: 1.0
		curve: "ease"
	PopularButton.animate
		properties:
			opacity: 0.2
		curve: "ease"
	RecentButton.animate
		properties:
			opacity: 0.2
		curve: "ease"

PopularButton.on Events.Click, ->
	MyFeedContainer.animate
		properties:
			x: -640
		curve: "spring(500,50,0)"
	Home.Popular.animate
		properties:
			x: 0
		curve: "spring(500,50,0)"
	Home.Recent.animate
		properties:
			x: 640
		curve: "spring(500,50,0)"
	MyFeedButton.animate
		properties:
			opacity: 0.2
		curve: "ease"
	PopularButton.animate
		properties:
			opacity: 1.0
		curve: "ease"
	RecentButton.animate
		properties:
			opacity: 0.2
		curve: "ease"
		
RecentButton.on Events.Click, ->
	MyFeedContainer.animate
		properties:
			x: -1280
		curve: "spring(500,50,0)"
	Home.Popular.animate
		properties:
			x: -640
		curve: "spring(500,50,0)"
	Home.Recent.animate
		properties:
			x: 0
		curve: "spring(500,50,0)"
	MyFeedButton.animate
		properties:
			opacity: 0.2
		curve: "ease"
	PopularButton.animate
		properties:
			opacity: 0.2
		curve: "ease"
	RecentButton.animate
		properties:
			opacity: 1.0
		curve: "ease"


# PROFILE BUTTON EVENT	
ProfileButton.on Events.Click, ->
	Profile.Content.animate
		properties:
			y: 0
		curve: "spring(500,50,0)"
		
CloseProfileButton.on Events.Click, ->
	Profile.Content.animate
		properties:
			y: 1136
		curve: "spring(500,50,0)"


# CONTENT 1 EVENTS
Content1Control.draggable.enabled = true
Content1Control.draggable.speedX = 0
Content1Control.draggable.speedY = 1

# When the user is moving "Content1" Control
Content1Control.on Events.DragMove, ->
	# If "Content1" Control moving up, follow the drag movement, otherwise don't move "Content1"
	if Content1Control.y < 0
		Home.Content1.animate
			properties:
				y: Content1Control.y
			time: 0

# When the user ends moving "Content1" Control
Content1Control.on Events.DragEnd, ->
	# If the user is moving up
	if Content1Control.draggable.calculateVelocity().y < 0
		# Move "Content1" up
		Home.Content1.animate
			properties:
				y: -827
			curve: "spring(200,20,0)"
		# Move "Content1" Control up
		Content1Control.animate
			properties:
				y: -827
			curve: "spring(200,20,0)"
	else 
		# Reset "Content1" Control back into position
		Content1Control.animate
			properties:
				y: 0
			curve: "spring(200,20,0)"
			
			
# CONTENT 2 EVENTS
Content2Control.draggable.enabled = true
Content2Control.draggable.speedX = 0
Content2Control.draggable.speedY = 1

# When the user is moving "Content2" Control
Content2Control.on Events.DragMove, ->
	# If the user is moving up
	if Content2Control.y < 0
		Home.Content2.animate
			properties:
				y: Content2Control.y
			time: 0
	# If the user is moving down
	else
		# Move "Content1" along with drag movement
		Home.Content1.animate
			properties:
				y: Content2Control.y - 827
			time: 0

# When the user ends moving "Content2" Control
Content2Control.on Events.DragEnd, ->
	# If the user is swiping up
	if Content2Control.draggable.calculateVelocity().y < 0
		Home.Content2.animate
			properties:
				y: -827
			curve: "spring(200,20,0)"
		# Move "Content2" Control up
		Content2Control.animate
			properties:
				y: -827
			curve: "spring(200,20,0)"
	# If the user is swiping down
	else 
		# Move "Content1" down
		Home.Content1.animate
			properties:
				y: 0
			curve: "spring(200,20,0)"
		# Move "Content1" Control down
		Content1Control.animate
			properties:
				y: 0
			curve: "spring(200,20,0)"
		# Move "Content2" back into position
		Content2Control.animate
			properties:
				y: 0
			curve: "spring(200,20,0)"
			
			
# CONTENT 3 EVENTS
Content3Control.draggable.enabled = true
Content3Control.draggable.speedX = 0
Content3Control.draggable.speedY = 1

# When the user is moving "Content3" Control
Content3Control.on Events.DragMove, ->
	# If the user is moving up
	if Content3Control.y < 0
		Home.Content3.animate
			properties:
				y: Content3Control.y
			time: 0
	# If the user is moving down
	else
		# Move "Content2" along with drag movement
		Home.Content2.animate
			properties:
				y: Content3Control.y - 827
			time: 0

# When the user ends moving "Content3" Control
Content3Control.on Events.DragEnd, ->
	# If the user is swiping up
	if Content3Control.draggable.calculateVelocity().y < 0
		# Move "Content3" up
		Home.Content3.animate
			properties:
				y: -827
			curve: "spring(200,20,0)"
		# Move "Content3" Control up
		Content3Control.animate
			properties:
				y: -827
			curve: "spring(200,20,0)"
	# If the user is swiping down
	else 
		# Move "Content2" down
		Home.Content2.animate
			properties:
				y: 0
			curve: "spring(200,20,0)"
		# Move "Content2" Control down
		Content2Control.animate
			properties:
				y: 0
			curve: "spring(200,20,0)"
		# Move "Content3" back into position
		Content3Control.animate
			properties:
				y: 0
			curve: "spring(200,20,0)"
			

# CONTENT 4 EVENTS
Content4Control.draggable.enabled = true
Content4Control.draggable.speedX = 0
Content4Control.draggable.speedY = 1

# When the user is moving "Content4" Control
Content4Control.on Events.DragMove, ->
	# If the user is moving down
	if Content4Control.y > 0
		# Move "Content3" along with drag movement
		Home.Content3.animate
			properties:
				y: Content4Control.y - 827
			time: 0

# When the user ends moving "Content4" Control
Content4Control.on Events.DragEnd, ->
	# If the user is swiping up
	if Content4Control.draggable.calculateVelocity().y < 0
		# Reset "Content4" Control back into position
		Content4Control.animate
			properties:
				y: 0
			curve: "spring(200,20,0)"
	# If the user is swiping down
	else 
		# Move "Content3" down
		Home.Content3.animate
			properties:
				y: 0
			curve: "spring(200,20,0)"
		# Move "Content3" Control down
		Content3Control.animate
			properties:
				y: 0
			curve: "spring(200,20,0)"
		# Move "Content4" back into position
		Content4Control.animate
			properties:
				y: 0
			curve: "spring(200,20,0)"