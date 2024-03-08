package globalRouters

import (
	"github.com/gin-gonic/gin"
	globalControllers "github.com/putragabrielll/fwg17-cinematix-be/src/controllers/customer"
)

func MovieTimeRouter(r *gin.RouterGroup){
	r.GET("", globalControllers.GetMovieTime)
}