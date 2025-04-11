\version "2.25.25"

\include "layout.ly"

\paper {
  system-system-spacing.minimum-distance = 12
}

\layout {
  \context {
    \Staff
    beamExceptions = #'()
    beatBase = #3/8
    beatStructure = 1
  }
}

\score {
  \new StaffGroup <<
    \new Staff \with {
      \consists Merge_rests_engraver
    } <<
      \accidentalStyle StaffGroup.voice
      \clef treble
      \new Voice {
        \voiceOne
        \time 3/8
        \relative c' {
          es'16 f es d c bes
          a8 f' f
          d16 es d c bes a
          g8 es' es
          c16 d c bes a g
          fis8 d' d
          bes r r
          \bar "||"
        }
      }
      \new Voice {
        \voiceTwo
        \relative c' {
          c'8 r r
          r <a c> <a c>
          b r r
          r <g b> <g b>
          g r r
          r <fis a> <fis a>
          g r r
        }
      }
    >>
    \new Staff <<
      \clef bass
      \time 3/8
      \relative c' {
        c16 d c bes aes g f g' f es d c bes c bes a g f es f' es d c bes a bes a g fis e! d es d c bes a g r r8 r8
      }
    >>
  >>
}
