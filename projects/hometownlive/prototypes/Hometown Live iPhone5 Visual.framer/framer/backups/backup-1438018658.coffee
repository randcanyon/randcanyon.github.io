Home = Framer.Importer.load "imported/HTLiPhone4-Home-04"

Home.Tab_Bar.y = 1038

Content = new ScrollComponent x: 0, y: 128, width: 640, height: 560, backgroundColor: "#000"

Home.Story_1.superLayer = Content.content
Home.Story_1.x = 0
Home.Story_1.y = 0

Home.Story_2.superLayer = Content.content
Home.Story_2.x = 640
Home.Story_2.y = 0

Home.Story_3.superLayer = Content.content
Home.Story_3.x = 1280
Home.Story_3.y = 0

Home.Story_4.superLayer = Content.content
Home.Story_4.x = 1920
Home.Story_4.y = 0

Home.Story_5.superLayer = Content.content
Home.Story_5.x = 2560
Home.Story_5.y = 0

Home.Story_6.superLayer = Content.content
Home.Story_6.x = 3200
Home.Story_6.y = 0

Home.Label.placeBefore(Content)
Home.Marker_5.placeBefore(Home.Label)
Home.Marker_4.placeBefore(Home.Label)
Home.Marker_3.placeBefore(Home.Label)
Home.Marker_2.placeBefore(Home.Label)
Home.Marker_1.placeBefore(Home.Label)
Home.Active_Marker.placeBefore(Home.Label)

List = Framer.Importer.load "imported/HTLiPhone4-List"
List.List.x = 640

Back = new Layer x: 0, y: 40, height: 88, width: 88, backgroundColor: "transparent"
Back.superLayer = List.List

Content.scrollHorizontal = true
Content.scrollVertical = false

Content.on Events.Move, ->
	if Content.scrollX < 640
			Home.Active_Marker.animate
				properties:
					x: 252
				time: 0.1
		else if Content.scrollX >= 640 && Content.scrollX < 1280
			Home.Active_Marker.animate
				properties:
					x: 312
				time: 0.1
		else if Content.scrollX >= 1280 && Content.scrollX < 1920
			Home.Active_Marker.animate
				properties:
					x: 376
				time: 0.1
		else if Content.scrollX >= 1920 && Content.scrollX < 2560
			Home.Active_Marker.animate
				properties:
					x: 438
				time: 0.1
		else if Content.scrollX >= 2560 && Content.scrollX < 3200
			Home.Active_Marker.animate
				properties:
					x: 500
				time: 0.1
		else if Content.scrollX >= 3200
			Home.Active_Marker.animate
				properties:
					x: 562
				time: 0.1

Content.on Events.ScrollEnd, ->
	if Content.scrollX > 2700
		List.List.animate
			properties:
				x: 0
			curve: "spring(500,50,0)"
			
List.List.on Events.Click, ->
	List.List.animate
		properties:
			x: 640
		curve: "spring(500,50,0)"