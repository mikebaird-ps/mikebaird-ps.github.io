
Framer.Device.deviceType = "fullscreen"
document.body.style.cursor = "auto" 
Utils.insertCSS("@import url(//cloud.typography.com/6966154/7885752/css/fonts.css);")

flow = new FlowComponent

flow.showNext(searchPage)

searchBtn.onClick ->
	flow.showNext(searchResultPage, {animate: false})

data = JSON.parse Utils.domLoadDataSync "data.json"

searchPageSearchText.text = data.searchPhrase
searchResultPageSearchTerm.text = data.searchPhrase
	
nextY = 0
for result in data.results
	newSearchResult = exampleSearchResult.copy()
	(newSearchResult.children.find (x) -> x.name == 'searchResultTitle').text = result.title
	(newSearchResult.children.find (x) -> x.name == 'searchResultUrl').text = result.link
	(newSearchResult.children.find (x) -> x.name == 'searchResultBody').text = result.description
	newSearchResult.y = nextY
	textHeight = (newSearchResult.children.find (x) -> x.name == 'searchResultBody').height
	textY = (newSearchResult.children.find (x) -> x.name == 'searchResultBody').y
	paddingHeightFromGoogle = 26
	nextY += textY + textHeight + paddingHeightFromGoogle
	
	if (result.id == 'python-datetime-code')
		newSearchResult.onClick ->
			flow.showNext(ResultJSReactForm)
			flow.scroll.mouseWheelEnabled = true
	if (result.id == 'python-datetime-clip')
		newSearchResult.onClick ->
			flow.showNext(clipResult)
			flow.scroll.mouseWheelEnabled = true
	
	newSearchResult.parent = searchResultsList

exampleSearchResult.destroy()