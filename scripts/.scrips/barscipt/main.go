package main

import (
	"flag"
	"fmt"
	"os"
	"os/exec"
	"strings"
	"time"
)

var date, vpnStatus, cpuUseage, ramUseage string

func main() {
	var stdout, dwm, help bool
	flag.BoolVar(&stdout, "stdout", true, "Output bar contents to standerd out.")
	flag.BoolVar(&dwm, "dwm", false, "Output bar contents to xsetroot name for dwm.")
	flag.BoolVar(&help, "help", false, "Print usage info.")
	flag.Parse()

	if help {
		flag.PrintDefaults()
		os.Exit(0)
	}

	dateChan := make(chan string)
	go func(out chan string) {
		for {
			out <- getDate()
			time.Sleep(time.Second)
		}
	}(dateChan)

	vpnStatusChan := make(chan string)
	go func(out chan string) {
		for {
			out <- runShellCmd("vpnStatus.sh")
			time.Sleep(time.Minute)
		}
	}(vpnStatusChan)

	cpuUseageChan := make(chan string)
	go func(out chan string) {
		for {
			out <- runShellCmd("cpu_useage.sh")
			time.Sleep(5 * time.Second)
		}
	}(cpuUseageChan)

	ramUseageChan := make(chan string)
	go func(out chan string) {
		for {
			out <- runShellCmd("ram_useage.sh")
			time.Sleep(5 * time.Second)
		}
	}(ramUseageChan)

	for {
		select {
		case date = <-dateChan:
		case vpnStatus = <-vpnStatusChan:
		case cpuUseage = <-cpuUseageChan:
		case ramUseage = <-ramUseageChan:
		}

		setBar(fmt.Sprintf("Ram: %s | Cpu: %s | Vpn: %s | %s", ramUseage, cpuUseage, vpnStatus, date), stdout, dwm)
	}
}
func runShellCmd(c string) string {
	cmd := exec.Command(c)
	stdout, err := cmd.Output()

	if err != nil {
		fmt.Println(err.Error())
		return ""
	}
	output := strings.TrimSuffix(string(stdout), "\n")
	return (output)
}

func getDate() string {
	t := time.Now()

	// Get Short Week day
	weekday := ""
	switch t.Weekday() {
	case 1:
		weekday = "Mon"
	case 2:
		weekday = "Tue"
	case 3:
		weekday = "Wed"
	case 4:
		weekday = "Thr"
	case 5:
		weekday = "Fri"
	case 6:
		weekday = "Sat"
	case 7:
		weekday = "Sun"
	}

	// This block of "Code™" make soure that all date a dubble diggets.
	month := ""
	if int(t.Month()) < 10 {
		month = fmt.Sprintf("%v%v", 0, int(t.Month()))
	} else {
		month = fmt.Sprint(int(t.Month()))
	}

	day := ""
	if int(t.Day()) < 10 {
		day = fmt.Sprintf("%v%v", 0, int(t.Day()))
	} else {
		day = fmt.Sprint(int(t.Day()))
	}

	hour := ""
	if int(t.Hour()) < 10 {
		hour = fmt.Sprintf("%v%v", 0, int(t.Hour()))
	} else {
		hour = fmt.Sprint(int(t.Hour()))
	}

	minute := ""
	if int(t.Minute()) < 10 {
		minute = fmt.Sprintf("%v%v", 0, int(t.Minute()))
	} else {
		minute = fmt.Sprint(int(t.Minute()))
	}

	second := ""
	if int(t.Second()) < 10 {
		second = fmt.Sprintf("%v%v", 0, int(t.Second()))
	} else {
		second = fmt.Sprint(int(t.Second()))
	}

	// Date: Wday YYYY/MM/DD HH:MM:SS
	return (fmt.Sprintf("%s %v/%s/%s %s:%s:%s", weekday, t.Year(), month, day, hour, minute, second))
}

func setBar(content string, stdout bool, dwm bool) {

	if !dwm {
		// Stdout Mode
		fmt.Println(content)
	} else if stdout {
		// Dwm Mode
		app, arg1, arg2 := "xsetroot", "-name", content

		cmd := exec.Command(app, arg1, arg2)
		output, err := cmd.Output()

		if err != nil {
			fmt.Println(err.Error())
			fmt.Println(string(output))
			return
		}
	}
}
