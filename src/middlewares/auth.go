package middlewares

import (
	"net/http"
	"os"
	"strings"
	"time"

	"github.com/KEINOS/go-argonize"
	jwt "github.com/appleboy/gin-jwt/v2"
	"github.com/gin-gonic/gin"
	"github.com/pkg/errors"
	"github.com/putragabrielll/fwg17-cinematix-be/src/models"
	"github.com/putragabrielll/fwg17-cinematix-be/src/services"
)

// 2) PAYLOAD(membuat JWT) memperoleh data dari AUTHENTICATOR
func payload(data interface{}) jwt.MapClaims {
	user := data.(*services.PersonNet)
	return jwt.MapClaims{
		"id":   user.Id,
		"roleId": user.RoleId,
	}
}

// 3) IdentityHandler membaca dari PAYLOAD
func identity(c *gin.Context) interface{} {
	claims := jwt.ExtractClaims(c)
	return &services.PersonNet{
		Id:   int(claims["id"].(float64)),
		RoleId: int(claims["roleId"].(float64)),
	}
}

// 1) AUTHENTICATOR mengembalikan data dari "models.FindUsersByEmail"
func authenticator(c *gin.Context) (interface{}, error) {
	loginauth := services.RLUsers{}
	err := c.ShouldBind(&loginauth)
	if err != nil {
		return nil, errors.New("Format Email not Support!")
	}

	finduser, err := models.FindUsersByEmail(loginauth.Email)
	if err != nil {
		return nil, errors.New("Email not register!")
	}

	checkpas, _ := argonize.DecodeHashStr(finduser.Password)
	paswdcheck := []byte(loginauth.Password)
	if !checkpas.IsValidPassword(paswdcheck) {
		return nil, errors.New("Password wrong!")
	
	}
	return &services.PersonNet{
		Id:   finduser.Id,
		RoleId: finduser.RoleId,
	}, nil
}

// 4) Authorizator membaca dari IdentityHandler
func authorizator(data interface{}, c *gin.Context) bool {
	userRoleCheck := data.(*services.PersonNet)
	if strings.HasPrefix(c.Request.URL.Path, "/admin") {
		if userRoleCheck.RoleId == 2 {
			return true
		}
	} else if strings.HasPrefix(c.Request.URL.Path, "/customer") {
		if userRoleCheck.RoleId == 1 || userRoleCheck.RoleId == 2 {
			return true
		}
	}
	return false // Untuk role
}

func unauth(c *gin.Context, code int, message string) {
	c.JSON(http.StatusUnauthorized, &services.ResponseBack{
		Success: false,
		Message: message,
	})
}

func loginresp(c *gin.Context, code int, token string, time time.Time) {
	c.JSON(http.StatusOK, &services.Response{
		Success: true,
		Message: "Login success!",
		Results: services.TokenTemp{
			Token: token,
		},
	})
}





func Auth() (*jwt.GinJWTMiddleware, error) {
	// godotenv.Load()

	authMiddleware, err := jwt.New(&jwt.GinJWTMiddleware{
		Realm:           "cinematix-be",
		Key:             []byte(os.Getenv("APP_SECRET")),
		Timeout:         30 * 24 * time.Hour,
		IdentityKey:     "id",
		PayloadFunc:     payload,
		IdentityHandler: identity,
		Authenticator:   authenticator,
		Authorizator:    authorizator,
		Unauthorized:    unauth,
		LoginResponse:   loginresp,
	})
	if err != nil {
		return nil, err
	}
	return authMiddleware, err
}