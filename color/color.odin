package color

import "core:fmt"

ResetAll :: 0

ColorANSI :: enum {
    Black         = 30,
    Red           = 31,
    Green         = 32,
    Yellow        = 33,
    Blue          = 34,
    Magenta       = 35,
    Cyan          = 36,
    White         = 37,
    Default       = 39,
    BrightBlack   = 90,
    BrightRed     = 91,
    BrightGreen   = 92,
    BrightYellow  = 93,
    BirhgtBlue    = 94,
    BrightMagenta = 95,
    BrightCyan    = 96,
    BrightWhite   = 97,
}

Color256 :: distinct u8

ColorRGB :: [3]int

Color :: union #no_nil {
    ColorANSI,
    Color256,
    ColorRGB,
}

Reset :: int(ColorANSI.Default)

fg :: proc {
    fg_ansi,
    fg_256,
    fg_rgb,
}

fg_ansi :: proc(s: string, c: ColorANSI) -> string {
    return fmt.tprintf(F_ANSI, c, s, Reset)
}

fg_256 :: proc(s: string, c: Color256) -> string {
    return fmt.tprintf(F_256, FG_256, c, s, Reset)
}

fg_rgb :: proc(s: string, c: ColorRGB) -> string {
    return fmt.tprintf(F_RGB, FG_RGB, c.r, c.g, c.b, s, Reset)
}

bg :: proc {
    bg_ansi,
    bg_256,
    bg_rgb,
}

bg_ansi :: proc(s: string, c: ColorANSI) -> string {
    return fmt.tprintf(F_ANSI, int(c) + 10, s, Reset)
}

bg_256 :: proc(s: string, c: Color256) -> string {
    return fmt.tprintf(F_256, BG_256, c, s, Reset)
}

bg_rgb :: proc(s: string, c: ColorRGB) -> string {
    return fmt.tprintf(F_RGB, BG_RGB, c.r, c.g, c.b, s, Reset)
}
