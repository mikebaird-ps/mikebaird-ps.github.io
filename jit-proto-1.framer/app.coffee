# Import file "JIT Web Layout - 8-17-17"
sketch = Framer.Importer.load("imported/JIT Web Layout - 8-17-17@1x", scale: 1)

flow = new FlowComponent
	scroll:
		scrollHorizontal: false

flow.showNext(searchPage)

searchBtn.onClick ->
	flow.showNext(searchResultPage, {animate: false})

data = JSON.parse Utils.domLoadDataSync "data.json"

searchPageSearchText.text = data.searchPhrase

nextY = 0
for result in data.results
	newSearchResult = exampleSearchResult.copy()
	(newSearchResult.children.find (x) -> x.name == 'searchResultTitle').text = result.title
	(newSearchResult.children.find (x) -> x.name == 'searchResultUrl').text = result.url
	(newSearchResult.children.find (x) -> x.name == 'searchResultBody').template = result
	newSearchResult.y = nextY
	nextY += 100
	
	if (result.id == 'python-datetime')
		newSearchResult.onClick ->
			flow.showNext(sketch.Examples_Related_Copy_5)
	
	newSearchResult.parent = searchResultsList

exampleSearchResult.destroy()