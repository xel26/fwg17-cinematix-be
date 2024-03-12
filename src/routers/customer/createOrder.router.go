package customerRouters

import (
	"github.com/gin-gonic/gin"
	customerControllers "github.com/putragabrielll/fwg17-cinematix-be/src/controllers/customer"
)

func CreateOrderRouter(r *gin.RouterGroup){
	r.POST("/create-order", customerControllers.CreateOrder)
	r.PATCH("/update-paid-status/:orderId", customerControllers.UpdatePaidStatusOrder)
}