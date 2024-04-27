package color

import "core:fmt"

ResetAll :: 0

ColorANSI :: enum {
    Black   = 30,
    Red     = 31,
    Green   = 32,
    Yellow  = 33,
    Blue    = 34,
    Magenta = 35,
    Cyan    = 36,
    White   = 37,
    Default = 39,
}

Color256 :: distinct u8

ColorRGB :: [3]int

Color :: union #no_nil {
    ColorANSI,
    Color256,
    ColorRGB,
}

Reset :: int(ColorANSI.Default)


fg :: proc(s: string, c: Color, bright := false) -> (res: string) {
    switch t in c {
    case ColorANSI:
        id := int(t)
        if bright {
            id += 60
        }
        res = fmt.tprintf(F_ANSI, id, s, Reset)

    case Color256:
        res = fmt.tprintf(F_256, FG_256, t, s, Reset)

    case ColorRGB:
        res = fmt.tprintf(F_RGB, FG_RGB, t.r, t.g, t.b, s, Reset)
    }

    return
}

bg :: proc(s: string, c: Color, bright := false) -> (res: string) {
    switch t in c {
    case ColorANSI:
        id := int(t) + 10
        if bright {
            id += 60
        }
        res = fmt.tprintf(F_ANSI, id, s, Reset)

    case Color256:
        res := fmt.tprintf(F_256, BG_256, t, s, Reset)

    case ColorRGB:
        res := fmt.tprintf(F_RGB, BG_RGB, t.r, t.g, t.b, s, Reset)
    }

    return
}
