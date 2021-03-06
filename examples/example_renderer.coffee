###
This defines a basic renderer for use with antigallery. All callbacks mandatory unless stated otherwise.
###
class self.ExampleRenderer
  constructor: (@container_div) ->
    ###
    (Optional) You can get creative here with your own constructor, but ours will just take a div id.
    ###

  paginateThreshold: 5
    ###
    When to paginate
    ###

  container: ->
    ###
    (Optional) Convinience function for returning a jquery object of the container div.
    ###
    $("##{@container_div}")

  select: (sel) ->
    ###
    (Optional) Convinience function for returning a jquery selector scoped to a container.
    ###
    $(sel, @container())

  thumbIndexName: ->
    ###
    The name of the data element that holds the thumb index (how configurable is that?!).
    ###
    "thumb-index"

  thumbSetIndexName: ->
    ###
    The name of the data element that holds the thumbset index.
    ###
    "thumbset-index"

  renderThumbs: (thumbs, direction) ->
    ###
    Takes an array of thumb urls (paged by paginatedThreshold), and pagination direction, expects to be drawn with an index.
    ###
    @select('#thumbs').empty()
    $(thumbs).each (index, url) =>
      @select('#thumbs').append("<img class=\"thumb\" src=\"#{url}\" data-thumb-index=\"#{index}\"/>")

  renderNavForPages: (length) ->
    ###
    Takes a length, its up to you to draw the numbers and link them, uses thumbSetIndexName to find the index.
    ###
    @select('#page_nav').append("<li class=\"page\" data-thumbset-index=\"#{i}\">Page</li>") for i in [0...length]

  setActiveThumb: (index) ->
    ###
    Takes the index of the currently displayed image, used for styling the active thumb.
    ###
    @select("#thumbs img").css('border', '0px solid black')
    @select("#thumbs img[data-thumb-index=\"#{index}\"]").css('border', '1px solid black')

  setActivePage: (index) ->
    ###
    Takes the index of the currently displayed page, used for styling the active page.
    ###
    @select("#page_nav li").css('color', 'black')
    @select("#page_nav li[data-thumbset-index=\"#{index}\"]").css('color', 'red')


  renderMainImage: (image) ->
    ###
    Takes a full image url, called on page load, during prev/next, and when a thumb is clicked.
    ###
    @select('#main_image').empty()
    @select('#main_image').append("<img src=\"#{image}\"/>")

  nextButton: ->
    ###
    Needs to return a scoped selector to that gallerys next button.
    ###
    @select("#next")

  previousButton: ->
    ###
    Needs to return a scoped selector to that gallerys previous button.
    ###
    @select('#prev')

  nextPageButton: ->
    ###
    Needs to return a scoped selector to that gallerys next thumbset button.
    ###
    @select("#next_thumb")

  previousPageButton: ->
    ###
    Needs to return a scoped selector to that gallerys previous thumbset button.
    ###
    @select('#prev_thumb')

  thumbElement: ->
    ###
    Needs to return a scoped selector to all of the thumb img elements for the gallery.
    ###
    @select('.thumb')

  mainImage: ->
    ###
    Needs to return a scoped selector of the main image.
    ###
    @select('#main_image')

  pageElement: ->
    ###
    Needs to return a scoped selector to all of the direct page link elements for the gallery.
    ###
    @select('.page')

