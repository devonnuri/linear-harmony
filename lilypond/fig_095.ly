\version "2.25.25"

\include "layout.ly"

\paper {
  system-system-spacing.minimum-distance = 12
}

\layout {
  \context {
    \Staff
    beamExceptions = #'()
    beatBase = #1/4
    beatStructure = 1,1
  }
}

\score {
  \new StaffGroup <<
    \new Staff <<
      \clef treble
      \time 2/4
      \relative c' {
        g'16 fis' e d cis b' a g fis r r8 r4
        \bar "||"
      }
    >>
    \new Staff <<
      \clef bass
      \time 2/4
      \relative c' {
        b8 g a a, d r r4
      }
    >>
  >>
}
