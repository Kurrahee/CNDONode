package main

import (
	"golang.org/x/crypto/ssh/terminal"
	"fmt"
	"log"
	"os/exec"
)


func main() {
	fmt.Print("Enter password: ")
	password, err := terminal.ReadPassword(0)
	if err == nil {
		fmt.Println("Password typed: " + string(password))
	}

	cmd := exec.Command("dir", "-lah")
	err = cmd.Start()
	if err != nil {
		log.Fatal(err)
	}
	log.Printf("Waiting for command to finish...")
	err = cmd.Wait()
	log.Printf("Command finished with error: %v", err)
}