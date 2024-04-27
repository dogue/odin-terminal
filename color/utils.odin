//+private
package color

// escape fstring for ANSI colors
F_ANSI :: "\x1b[%dm%s\x1b[%dm"

// for 256 color
F_256 :: "\x1b[%d;5;%dm%s\x1b[%dm"
FG_256 :: 38
BG_256 :: 48

// RGB
F_RGB :: "\x1b[%d;2;%d;%d;%dm%s\x1b[%dm"
FG_RGB :: 38
BG_RGB :: 48
