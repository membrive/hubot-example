# Description:
#	Display random quotes
#
# Commands:
#	hubot random - Print a random quote
#

quotes	= [
	"Random quote 1",
	"Random quote 2",
	"Random quote 3"
]

module.exports = (robot) ->
	robot.hear /random/i, (msg) ->
		msg.send msg.random quotes
