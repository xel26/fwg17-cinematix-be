package customerRouters

import (
	"github.com/gin-gonic/gin"
	customerControllers "github.com/putragabrielll/fwg17-cinematix-be/src/controllers/customer"
)

func MovieCinemaIdRouter(r *gin.RouterGroup) {
	r.GET("/:movieId", customerControllers.GetMovieCinemaId)
}
