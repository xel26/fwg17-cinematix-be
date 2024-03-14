package adminRouters

import (
	"github.com/gin-gonic/gin"
	adminControllers "github.com/putragabrielll/fwg17-cinematix-be/src/controllers/admin"
)

func AddNewMovieRouter(r *gin.RouterGroup){
	r.POST("", adminControllers.AddNewMovie)
}