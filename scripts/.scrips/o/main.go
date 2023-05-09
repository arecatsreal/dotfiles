package main

import (
	"flag"
	"fmt"
	"log"
	"os"
	"os/exec"
	"strings"
  "syscall"

	mime "github.com/gabriel-vasile/mimetype"
)

var openVideo, openAudio, openImage, openSpredsheet, openDocument, openComicbook, openTorrent, filepath string

func main () {
  var help, printType, doRootEditor bool
  flag.BoolVar(&help, "help", false, "Prints This.")
  flag.BoolVar(&printType, "print_type", false, "Prints mime type and exits.")
  flag.BoolVar(&doRootEditor, "do_root_editor", true, "Opens files not owend by user with sudoedit or doasedit")

  flag.StringVar(&openVideo, "open_video", "mpv", "Application to open video files with.")
  flag.StringVar(&openAudio, "open_audio", "mpv", "Application to open audio files with.")
  flag.StringVar(&openImage, "open_image", "feh", "Application to open image files with.")
  flag.StringVar(&openSpredsheet, "open_ss", "sc-im", "Application to open spreadsheet files with.")
  flag.StringVar(&openDocument, "open_doc", "zathura", "Application to open document files with.")
  flag.StringVar(&openComicbook, "open_comic", openDocument, "Application to open comicbook files with. Default is same as open_doc.")
  flag.StringVar(&openTorrent, "open_torrent", "qbittorrent", "Application to open torrent files with.")
  flag.Parse()

	if help {
    fmt.Println("Useage: [flags] [file]\n\nFlags:")
		flag.PrintDefaults()
		os.Exit(0)
	}

  // Test if fileopenrs ar in path.
  var openers []string
  openers = append(openers, openVideo, openAudio, openImage, openSpredsheet, openDocument, openComicbook, openTorrent)
  for i := 0; i <= len(openers) - 1; i++ {
    if !inpath(openers[i]) {
      fmt.Println(openers[i], "Not found in path!")
      os.Exit(1)
    }
  }

  // If file is not porvided will open EDITOR env var.
  if len(flag.Args()) == 0 {
    editor := os.Getenv("EDITOR")
    if editor == "" {
      fmt.Println("Env var EDITOR not set. Using exiting.")
      os.Exit(0)
    }
    cmd := exec.Command(editor)
    cmd.Stdin = os.Stdin
    cmd.Stdout = os.Stdout
    err := cmd.Run()
    if err != nil {
      log.Fatalln(err)
    }
    os.Exit(0)
  }

  // Get filepath and bacic file info.
  filepath = flag.Args()[0]
  file, err := os.Stat(filepath)

  // Test if Exists.
  if os.IsNotExist(err) {
    fmt.Println(filepath, "does not exist!")
    os.Exit(1)
  }

  // Test if dir, and if so open with env var FILEM.
  if file.IsDir() {
    open("dir")
  }

  // Test to see if root is the owner if the current file, and if so opens it with
  // doas or sudo edit.
  if doRootEditor {
    if x, ok := file.Sys().(*syscall.Stat_t); ok {
      if int(x.Uid) == 0 {
        editor := os.Getenv("EDITOR")
        if editor == "" {
          fmt.Println("Env var EDITOR not set. Using exiting.")
          os.Exit(0)
        }
        var cmd *exec.Cmd
        if inpath("doasedit") {
          cmd = exec.Command("doasedit", filepath)
        } else if inpath("sudoedit") {
          cmd = exec.Command("sudoedit", filepath)
        } else {
          fmt.Println("Neither sudoedit nor doasedit found in path.")
          os.Exit(1)
        }
        cmd.Stdin = os.Stdin
        cmd.Stdout = os.Stdout
        err := cmd.Run()
        if err != nil {
          log.Fatalln(err)
        }
        os.Exit(0)
      }
    } else {
      log.Fatalln("Stop useing windows!")
    }
  }

  // Gets file mimetyep and comverts it to and slice.
  mtype, err := mime.DetectFile(filepath)
  if err != nil {
    log.Fatalln(err)
  }
  if printType {
    fmt.Println(mtype)
    os.Exit(0)
  }
  mt := strings.Split(mtype.String(), "/")

  // Open by the first part of the mime type.
  switch mt[0] {
  case "video":
    open("video")
  case "audio":
    open("audio")
  case "image":
    open("image")
  case "text":
    switch mt[1] {
    case "csv", "tsv", "ods":
      open("spredsheet")
    case "html":
      open("browser")
    default:
      open("text")
    }
  // Open by the second part of the mime type
  default:
    switch mtype.String() {
      case "application/epub", "application/epub+zip":
        open("document")
      case "application/pdf":
        open("document")
      case "application/ps":
        open("document")
      case "application/x-sc":
        open("spredsheet")
      case "application/x-bittorrent":
        open("torrent")
      case "application/octet-stream": // mp3
        open("audio")
      case "application/x-executable":
        open("exec")
      case "application/zip", "application/x-rar", "application/zip-compressed", "application/x-rar-compressed":
        x := strings.ToLower(filepath)
        if strings.Contains(x, "cbz") || strings.Contains(x, "cbr") {
          open("comicbook")
        } else {
          open("text")
        }
      default:
        open("text")
    }
  }
}

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
        fmt.Println("Would you like execute this file? [y/N] ")
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
        fmt.Println("This file is not executable would you like to make it executable? [y/N]")
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

func inpath(opener string) bool {
	_, err := exec.LookPath(opener)
	return err == nil
}
