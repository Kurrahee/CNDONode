package main

import (
	"fmt"
	"io"
	"net"
)

func main() {
	ln, err := net.Listen("tcp4", ":17571")
	if err != nil {
		fmt.Println("Fail to listen on port 17571")
		panic(err)
	}

	for {
		conn, err := ln.Accept()
		if err != nil {
			fmt.Println("Fail to accept new client")
			panic(err)
		}

		fmt.Println("New client")
		go handleRequest(conn)
	}
}

func handleRequest(c net.Conn) {
	proxy, err := net.Dial("tcp", "127.0.0.1:17570")
	if err != nil {
		fmt.Println("Fail to connect deeponion")
		c.Close()
	} else {
		go copyIO(c, proxy)
		go copyIO(proxy, c)
	}
}

func copyIO(src, dest net.Conn) {
	defer src.Close()
	defer dest.Close()
	io.Copy(src, dest)
}