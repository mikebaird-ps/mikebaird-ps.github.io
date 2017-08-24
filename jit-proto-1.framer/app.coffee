flow = new FlowComponent

flow.showNext(searchPage)

searchBtn.onClick ->
	flow.showNext(searchResultPage, {animate: false})