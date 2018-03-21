package main

import (
	"golang.org/x/crypto/ssh/terminal"
	"fmt"
)


func main() {
	fmt.Println("Enter password: ")
	password, err := terminal.ReadPassword(0)
	if err == nil {
		fmt.Println("Password typed: " + string(password))
	}
}