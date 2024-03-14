package adminRouters

import (
	"github.com/gin-gonic/gin"
	adminControllers "github.com/putragabrielll/fwg17-cinematix-be/src/controllers/admin"
)

func TicketSalesRouter(r *gin.RouterGroup) {
	r.GET("", adminControllers.TicketSales)
}
