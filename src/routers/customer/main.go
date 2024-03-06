package customerRouter

import "github.com/gin-gonic/gin"

func CustomerRouter(r *gin.RouterGroup) {
	MovieRouter(r.Group("/movies"))
}
