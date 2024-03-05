package routers

import (
	"github.com/gin-gonic/gin"
	customerRouters "github.com/putragabrielll/fwg17-cinematix-be/src/routers/customer"
)

func Combine(r *gin.Engine){
	customerRouters.CustomerRouter(r.Group("/customer"))
	// adminRouters.AdminRouter(r.Group("/admin"))
}