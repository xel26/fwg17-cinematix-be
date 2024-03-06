package routers

import (
	"github.com/gin-gonic/gin"
	authRouters "github.com/putragabrielll/fwg17-cinematix-be/src/routers/auth"
	customerRouters "github.com/putragabrielll/fwg17-cinematix-be/src/routers/customer"
)

func Combine(r *gin.Engine){
	//------------ AUTH ------------
	authRouters.AuthRouter(r.Group("/auth"))

	//------------ CUSTOMER ------------
	customerRouters.CustomerRouter(r.Group("/customer"))

	//------------ ADMIN ------------
	// adminRouters.AdminRouter(r.Group("/admin"))
}