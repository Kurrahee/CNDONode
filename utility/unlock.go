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

	cmd := exec.Command("/usr/bin/DeepOniond", "walletpassphrase", string(password), "1000000")
	stdoutStderr, err := cmd.CombinedOutput()
	if err != nil {
		log.Fatal(err)
	}

	err = cmd.Run()
	log.Printf("Unlock wallet command finished with error: %v", err)
	fmt.Printf("%s\n", stdoutStderr)
}