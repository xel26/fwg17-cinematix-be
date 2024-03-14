package adminRouters

import (
	"github.com/gin-gonic/gin"
	"github.com/putragabrielll/fwg17-cinematix-be/src/middlewares"
)

func AdminRouter(r *gin.RouterGroup) {
	authMiddleware, _ := middlewares.Auth()
	r.Use(authMiddleware.MiddlewareFunc())

	listmoviesRouter(r.Group("/list-movies"))
	AddNewMovieRouter(r.Group("/add-new-movie"))
	RatingRouter(r.Group("/rating"))
	listmoviesRouter(r.Group("/movies"))
	AiringTimeRouter(r.Group("/airing-time"))
}
