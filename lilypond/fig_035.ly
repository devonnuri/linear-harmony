\version "2.25.25"

\include "layout.ly"

<<
  \chords {
    \set Timing.measureLength = #2/4
    c2:maj7
    \set Timing.measureLength = #3/4
    c2.:maj7
  }
  \relative {
    \set Timing.measureLength = #2/4
    e''4 g
    \bar "||"
    \set Timing.measureLength = #3/4
    e
    \override NoteHead.style = #'cross
    \override Stem.stencil = ##f
    \parenthesize
    c
    \revert NoteHead.style
    \revert Stem.stencil
    g
    \bar "||"
  }
>>
