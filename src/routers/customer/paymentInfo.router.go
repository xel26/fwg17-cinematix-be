package customerRouters

import (
	"github.com/gin-gonic/gin"
	customerControllers "github.com/putragabrielll/fwg17-cinematix-be/src/controllers/customer"
)

func PaymentInfoRouter(r *gin.RouterGroup){
	r.GET("", customerControllers.GetPaymentInfo)
}