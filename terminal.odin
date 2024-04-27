package terminal

import "color"
import "core:fmt"

main :: proc() {
    fmt.printf("%s\n", color.bg(color.fg("hello", color.ColorRGB{255, 0, 127}), color.ColorANSI.Yellow))
}
