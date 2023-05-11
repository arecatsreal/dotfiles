package main

import (
  "fmt"
  "os"
  "os/exec"
  "strings"
  "log"
)

func open(mt string) {
  var opener string
  switch mt {
  case "video":
    opener = openVideo
  case "audio":
    opener = openAudio
  case "image":
    opener = openImage
  case "text":
    editor := os.Getenv("EDITOR")
    if editor != "" {
      opener = editor
    } else {
      fmt.Println("Env var EDITOR not set. Using exiting.")
      os.Exit(0)
    }
  case "spredsheet":
    opener = openSpredsheet
  case "browser":
    opener = os.Getenv("BROWSER")
    browser := os.Getenv("BROWSER")
    if browser != "" {
      opener = browser
    } else {
      opener = "xdg-open"
    }
  case "document":
    opener = openDocument
  case "torrent":
    opener = openTorrent
  case "comicbook":
    opener = openComicbook
  case "exec":
    for {
      x, err := os.Stat(filepath)
      if err != nil {
        log.Fatalln(err)
      }

      if strings.Contains(x.Mode().String(), "x"){
        fmt.Print("Would you like execute this file? [y/N] ")
        var input string
        fmt.Scan(&input)
        if strings.ToLower(input) == "y" {
          fmt.Println("Executeing", filepath)
          cmd := exec.Command(filepath)
          cmd.Stdin = os.Stdin
          cmd.Stdout = os.Stdout
          err := cmd.Run()
          if err != nil {
            log.Fatalln(err)
          }
          os.Exit(0)
        } else {
          fmt.Println("Aborting!")
          os.Exit(0)
        }
      } else {
        fmt.Print("This file is not executable would you like to make it executable? [y/N] ")
        var input string
        fmt.Scan(&input)
        if strings.ToLower(input) == "y" {
          cmd := exec.Command("chmod", "+x", filepath)
          cmd.Stdin = os.Stdin
          cmd.Stdout = os.Stdout
          err := cmd.Run()
          if err != nil {
            log.Fatalln(err)
          }
        } else {
          fmt.Println("Aborting!")
          os.Exit(0)
        }
      }
    }
  case "dir":
    filem := os.Getenv("FILEM")
    if filem != "" {
      opener = filem
    }
  }
  cmd := exec.Command(opener, filepath)
  cmd.Stdin = os.Stdin
  cmd.Stdout = os.Stdout
  err := cmd.Run()
  if err != nil {
    log.Fatalln(err)
  }
  os.Exit(0)
}
