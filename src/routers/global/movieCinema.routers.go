package globalRouters

import (
	"github.com/gin-gonic/gin"
	globalControllers "github.com/putragabrielll/fwg17-cinematix-be/src/controllers/global"
)

func MovieCinemaIdRouter(r *gin.RouterGroup) {
	r.GET("/:movieId", globalControllers.GetMovieCinemaId)
}
