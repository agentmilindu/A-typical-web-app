// +build !appengine,!appenginevm

package main

import (
	"github.com/labstack/echo"
	"github.com/labstack/echo/middleware"
	"github.com/joho/godotenv"
	"log"
)

func createMux() *echo.Echo {
	e := echo.New()

	e.Use(middleware.Recover())
	e.Use(middleware.Logger())
	e.Use(middleware.Gzip())

	e.Static("/", "public")

	return e
}

func main() {

	err := godotenv.Load()
        if err != nil {
			log.Print("Error loading .env file")
		}
	
	e.Logger.Fatal(e.Start(":8080"));

}
