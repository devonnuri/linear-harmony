\version "2.25.25"

\include "layout.ly"

<<
  \relative {
    g'4^\markup \column {
    "simple melody:"
    " "
    } f e d c2 r
    \bar "||"

    g'8^\markup \column {
    "with UNTs and PTs:"
    " "
    } a g f e f e d c2 r
    \bar "||"

    g'8^\markup \column {
    "arpeggiated tones replace UNTs:"
    " "
    } c g f e g e d c2 r
    \bar "||"
  }
>>
