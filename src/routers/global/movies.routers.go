package globalRouters

import (
	"github.com/gin-gonic/gin"
	customerControllers "github.com/putragabrielll/fwg17-cinematix-be/src/controllers/customer"
)

func MovieRouter(r *gin.RouterGroup) {
	r.GET("", customerControllers.ListAllMovies)
	r.GET("/:id", customerControllers.DetailMovie)
}
