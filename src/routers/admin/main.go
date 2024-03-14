package adminRouters

import (
	"github.com/gin-gonic/gin"
	"github.com/putragabrielll/fwg17-cinematix-be/src/middlewares"
)

func AdminRouter(r *gin.RouterGroup) {
	authMiddleware, _ := middlewares.Auth()
	r.Use(authMiddleware.MiddlewareFunc())

	listmoviesRouter(r.Group("/list-movies"))
	listmoviesRouter(r.Group("/movies"))
}
