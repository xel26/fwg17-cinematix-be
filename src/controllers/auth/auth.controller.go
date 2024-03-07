package auth

import (
	// "math/rand"
	"net/http"
	// "strings"

	"github.com/KEINOS/go-argonize"
	"github.com/gin-gonic/gin"
	"github.com/putragabrielll/fwg17-cinematix-be/src/helpers"
	"github.com/putragabrielll/fwg17-cinematix-be/src/models"
	"github.com/putragabrielll/fwg17-cinematix-be/src/services"
)

func Register(c *gin.Context) {
	usersData := services.RLUsers{}
	err := c.ShouldBind(&usersData) // untuk memasukkan data dari form ke struck Person{}
	if err != nil {
		msg := "Invalid Email"
		helpers.Utils(err, msg, c) // Error Handle
		return
	}

	paswdhash := []byte(usersData.Password) // proses hashing password
	hasedPasswd, _ := argonize.Hash(paswdhash)

	usersData.Password = hasedPasswd.String()

	createUser, err := models.RegisterUsers(usersData)
	// fmt.Println(err)
	if err != nil {
		msg := "Email Already exists"
		helpers.Utils(err, msg, c) // Error Handler
		return
	}
	c.JSON(http.StatusOK, &services.Response{
		Success: true,
		Message: "Create users successfully",
		Results: createUser,
	})
}

// func ForgotPassword(c *gin.Context){
// 	userReset := services.FormReset{}
// 	c.ShouldBind(&userReset) // untuk memasukkan data dari form ke struck Person{}
// 	if userReset.Email != "" {
// 		finduser, err := models.FindUsersByEmail(userReset.Email)
// 		if err != nil {
// 			msg := "Email not register!"
// 			helpers.Utils(err, msg, c) // Error Handler
// 			return
// 		}
// 		if finduser.Id != 0 {
// 			getOTP := rand.Perm(9)
// 			userReset.Otp = strings.Trim(strings.Replace(fmt.Sprint(getOTP[0:6]), " ", "", -1), "[]") // make otp
// 			models.CreateRP(userReset)
// 			// START SEND OTP TO EMAIL
// 				fmt.Println(userReset) // get otp
// 			// END SEND EMAIL
// 			c.JSON(http.StatusOK, &services.ResponseBack{
// 				Success: true,
// 				Message: "OTP success send to your email!",
// 			})
// 			return
// 		}
// 	}
// 	if userReset.Otp != "" {
// 		findEmail, _ := models.FindRPByOTP(userReset.Otp) // pengecekan apakah OTP nya valid
// 		if findEmail.Id != 0 {
// 			if (userReset.Password == userReset.ConfirmPassword) {

// 				paswdhash := []byte(userReset.Password) // proses hashing password
// 				hasedPasswd, _ := argonize.Hash(paswdhash)

// 				findUser, _ := models.FindUsersByEmail(findEmail.Email)
// 				dataUpdate := services.Person{
// 					Id: findUser.Id,
// 					Password: hasedPasswd.String(),
// 				}
// 				updatedUsers, _ := models.UpdateUsers(dataUpdate)
// 				message := fmt.Sprintf("Reset password for %v success!", updatedUsers.Email)
// 				c.JSON(http.StatusOK, &services.ResponseBack{
// 					Success: true,
// 					Message: message,
// 				})
// 				models.DeleteOTP(findEmail.Id)
// 				return
// 			} else {
// 				// msg := "confirmPassword"
// 				// var err error
// 				// helpers.Utils(err, msg, c) // Error Handler
// 				// return
// 				c.JSON(http.StatusBadRequest, &services.ResponseBack{
// 					Success: false,
// 					Message: "Confirm password does not match!",
// 				})
// 				return
// 			}
// 		}
// 	} else {
// 		// msg := ""
// 		// var err error
// 		// helpers.Utils(err, msg, c) // Error Handler
// 		// return
// 		c.JSON(http.StatusInternalServerError, &services.ResponseBack{
// 			Success: false,
// 			Message: "Internal Server Error",
// 		})
// 		return
// 	}
// }
