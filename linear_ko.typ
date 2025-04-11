#import "@local/korange-book:0.1.0": book, part, chapter, my-bibliography, appendices, make-index, index, theorem, definition, notation,remark,corollary,proposition,example,exercise, problem, vocabulary, scr, thmbox
//#set text(font: "TeX Gyre Pagella")
//#set text(font: "Lato")
//#show math.equation: set text(font: "Fira Math")
//#show math.equation: set text(font: "Lato Math")
//#show raw: set text(font: "Fira Code")
// 
#let autosize(img, scale: 1) = context {
  let size = measure(img)
  set image(width: size.width*scale, height: size.height*scale)
  img
}

#let autoimg(path, scale: 0.8) = autosize(image(path), scale: scale)

#let main-color = rgb("#999999")

#let outlinebox(title: [], width: 100%, body) = block(
  fill: none, stroke: 0.5pt + main-color, radius: 0pt, width: width, body, inset: 10pt)

#let exercisebox(body) = outlinebox[
  #align(center)[*추천 연습과제*]
  
  #body
]

#let fb(body) = box(width: 100%, body)

#let padbox(body) = block(inset: (x: 20pt, y: 10pt), body)

#let sans(body) = text(font: ("Helvetica", "KoPubDotum"), body)
// #let sans(body) = text(font: ("Bookk Gothic OTF"), body)

#let note(notestr) = {
  // set text(fill: cmyk(0%, 100%, 0%, 20%))

  let pat = regex("([A-Ga-g]|[IViv]+)(#|b|nat)?")
  let match = notestr.match(pat)
  assert(match != none, message: "Invalid note string")

  let (root, root_fs) = match.captures

  root_fs = if root_fs == "#" { $sharp$ } else if root_fs == "b" { $flat$ } else if root_fs == "nat" { $natural$ } else { $$ }

  if root_fs == $$ { // needed because empty sub/superscript causes horizontal space
    $upright(#root)$
  } else {
    $upright(#root)^#root_fs$
  }
}

#let chord(chordstr, jazz: true) = {
  // set text(fill: cmyk(0%, 100%, 0%, 20%))

  let pat = regex("((?:[A-G]|[IViv]+)(?:#|b)?)(M|m|dim|aug|halfdim|sus2|sus4)?((?:[#b]?\d+)*)?(sus)?(?:\/((?:[A-G]|[IViv]+)(?:#|b)?))?(?:\|(.+))?")
  let match = chordstr.match(pat)
  assert(match != none, message: "Invalid chord string")

  let (root, quality, extalt_str, sus, slash, denom) = match.captures

  root = note(root)

  if jazz {
    quality = if quality == "M" { $triangle.small$ } else if quality == "m" { $-$ } else if quality == "dim" { $circle.small$ } else if quality == "aug" { $+$ } else if quality == "halfdim" { $ø$ } else if quality == "sus2" { $upright(sus2)$ } else if quality == "sus4" { $upright(sus4)$ } else { $$ }
  } else {
    quality = if quality == "M" { $upright(M)$ } else if quality == "m" { $upright(m)$ } else if quality == "dim" { $degree$ } else if quality == "aug" { $+$ } else if quality == "halfdim" { $ø$ } else if quality == "sus2" { $upright(sus2)$ } else if quality == "sus4" { $upright(sus4)$ } else { $$ }
  }
  
  let extalt = extalt_str.matches(regex("([#b])?(\d+)")).map(x => (x.captures.at(0), x.captures.at(1))).map(x => (if x.at(0) == "#" { $sharp$ } else if x.at(0) == "b" { $flat$ } else { $$ }, x.at(1))).map(x => $#x.at(0) #x.at(1)$)
  
  slash = if slash != none { $\/#note(slash)$ } else { $$ }

  sus = if sus == "sus" { $upright("sus")$ } else { $$ }
  
  let denom_chord = if denom != none { chord(denom) } else { $$ }

  let num_chord = if quality == $$ and extalt.len() == 0 { // needed because empty sub/superscript causes horizontal space
    $root slash$
  } else if jazz { 
    $root_(quality extalt.join()sus) slash$
  } else {
    $root quality extalt.join()sus slash$
  }

  if denom != none {
    $frac(#num_chord, #denom_chord)$
  } else {
    $#num_chord$
  }
}

#let prog(..chords, jazz: true) = {
  // set text(fill: cmyk(0%, 100%, 0%, 20%))

  chords.pos().map(ch => chord(ch, jazz: jazz)).join($thin-thin$)
}

#let pageref(label) = context {
  let loc = locate(label)
  let nums = counter(page).at(loc)
  link(loc, numbering("1", ..nums))
}

#let example-counter = counter("example")
#example-counter.update(1)
#let example(title, image-code, subtitle: none, should-index: true, c: example-counter) = context {
  box(width: 100%, {
    c.step()
    enum(
      enum.item(c.get().at(0), {
        if (subtitle == none) {
          title
        } else {
          [#title: #subtitle]
        }
      })
    )
    if should-index { index(title) }
    let svg-path = "figures/fig_" + ("0000000" + str(image-code)).slice(-3) + ".svg"
    let path-label = label(svg-path)
    let first-time = query((context {}).func()).len() == 0
    if first-time or query(path-label).len() > 0 {
      [#autoimg(path)#path-label]
    } else {
      
    }
    if image-code != 205 and 15 <= image-code and image-code <= 217 {
      align(center)[#autoimg("figures/fig_" + ("0000000" + str(image-code)).slice(-3) + ".svg")]
    } else {
      align(center)[#autoimg("figures/fig_" + ("0000000" + str(image-code)).slice(-3) + ".jpg", scale: 2)]
    }
  })
}

#let maj25 = prog("ii", "V7")
#let min25 = prog("iihalfdim7", "V7")
#let maj251 = prog("ii", "V7", "I")
#let min251 = prog("iihalfdim7", "V7", "I")
#let maj36 = prog("iii", "V7/ii")
#let maj362 = prog("iii", "V7/ii", "ii")

// #set text(font: ("Times New Roman", "KoPubBatang"), lang: "ko")
#set text(font: ("Tex Gyre Termes", "KoPubBatang"), lang: "ko")
// #set text(font: ("Tex Gyre Termes", "Bookk Myungjo OTF"), lang: "ko")
#show math.equation: set text(font: ("New Computer Modern Math", "KoPubBatang"))

#set outline(title: [목차])

#show: book.with(
  title: "선형 화성을 통한 화성 연결",
  author: "버트 라이곤",
  main-color: main-color,
  paper-size: "a4",
  lang: "en",
  font-size: 11pt,
  // list-of-figure-title: "List of Figures",
  // list-of-table-title: "List of Tables",
  supplement-chapter: "",
  supplement-part: "",
  part-style: 0,
  copyright: [
    © 1996 Houston Publishing, Inc.

    224 South Lebanon Street, Lebanon, IN, 46052, USA

    All Rights Reserved International Copyright Secured Printed In The USA

    비공식 번역 : 양희성(`devonnuri@gmail.com`)
  ],
  lowercase-references: false
)

#set sub(size: 0.9em)
#set heading(supplement: none)

#show footnote.entry: set par(leading: 0.7em)
#set footnote.entry(gap: 0.7em)

#counter(footnote).update(0) // this is for

#show list: set par(first-line-indent: 0pt)
#show enum: set par(first-line-indent: 0pt)

#set math.equation(numbering: none)

#chapter("개요", l: "chap1")

재즈 즉흥연주를 가르치는 목표 중 하나는 학생들이 리듬적으로 일관되고 조화적으로 구체적인 라인을 연주할 수 있도록 하는 것이다. 대부분의 즉흥연주 학생들은 화성학적으로나 리듬적으로 모호한 라인을 연주하는 능력을 가지고 수업에 참여한다. 훌륭한 재즈 솔로 중 많은 경우, 리듬 섹션이 제거되더라도 즉흥 연주 라인에서 박자, 형식, 화성을 여전히 들을 수 있다. 그러나 초보 즉흥 연주자들은 리듬 섹션이 조화와 리듬을 제공하기를 기대하면서, 자신은 그 위를 가볍게 스케이팅하듯 연주하는 경우가 많다.

많은 재즈 교재와 수업에서는 개별 화음과 관련된 재즈 이론 자료를 다룬다. 소니 롤린스는 디지 길레스피가 어떻게 화음을 연결하는지 이야기한 바 있다. 이 책은 롤린스가 언급한 훌륭한 재즈 솔로에서의 화음의 선형적인 연결, 즉 화음 간의 연결을 다룬다. 이 텍스트는 뛰어난 재즈 아티스트들의 솔로 발췌를 기반으로 즉흥적인 재즈 멜로디 라인의 선형적-수평적 연결을 상세히 탐구함으로써 다른 교재를 보완하려는 목적을 가지고 있다.

== 즉흥연주의 접근법

재즈 스탠다드 곡에서 즉흥 연주를 하는 데는 기본적으로 세 가지 접근 방식이 있다. 선율의 변주, 화성을 활용한 즉흥 연주, 그리고 앞의 두 가지와 중첩될 수 있는 동기적 전개#sub[motivic development]다. 이 책은 두 번째 영역인 화성을 활용한 즉흥 연주를 다룬다. 여기서 논의되는 화성적 윤곽을 확장하는 기술은 선율 변주에 적용될 수 있다.

== 화성을 활용한 즉흥 연주의 접근법

재즈 문헌에서 선율적·화성적 자료를 다루는 방법은 다양하다. 수백 개의 재즈 솔로를 채보하고 분석한 결과, 훌륭한 재즈 음악가들은 화성이 가진 함의를 세 가지 방식으로 접근한다는 것을 발견했다. 화성적 구체성, 화성적 일반화, 또는 화성적 함의의 무시다.

- #sans[화성적 구체성]: 화성의 함의에 세심한 주의를 기울임. 적절한 3도와 알맞게 해결하는#sub[resolving] 7도에 의존함. 곡의 화음 기호나 선율이 가진 의미의 변화에 따라감.

- #sans[화성적 일반화]: 함의하는 화성을 구체적으로 다루는 대신, 블루스 아이디어와 스케일에 의존함. 예컨대, #maj25 진행의 경우 이를 종종 #chord("I") 화음으로 일반화함. 예를 들면, 다음과 같은 진행이 있을 때,

  // #align(center)[#image("figures/fig_004.jpg", width: 34%)]

  #align(center)[
    #set text(size: 0.9em)
    #table(
      columns: (2.2em, ) * 12,
      inset: (y: 2pt),
      align: left + horizon,
      row-gutter: 3pt,
      stroke: (x, y) => if (calc.rem(x, 4) == 0) { (left: 0.8pt) } else if (x == 11) { (right: 0.8pt) },
      chord("Dm7"), [/], [/], [/],
      chord("G7"), [/], [/], [/],
      chord("CM"), [/], [/], [/]
    )
  ]

  다음 악구 전체에서 #note("C") 메이저 3화음과 #note("C") 메이저 블루스 스케일이 사용된다.

  #align(center)[#image("figures/fig_005.jpg", width: 50%)]

- #sans[화성적 함의의 무시]: 이는 즉흥 연주 라인이 동기 기반의 즉흥 연주 방향을 따를 때 발생할 수 있음. 즉흥 연주자가 기존 화성 위에 다른 대체 화성을 도입하고자 하거나, 함의된 화음과 관련 없는 음을 의도적으로 연주하여 긴장을 만들어내기로 결정한 경우에도 나타날 수 있음.

경험 많은 재즈 즉흥 연주자들은 위에서 언급한 영역을 자유롭게 오가며 연주한다. 이들은 항상 화성학적으로 구체적인 연주를 할 수 있으며, 일반적이거나 모호한 상태로 연주한 후에도 종종 구체성으로 돌아온다. 경험 많은 즉흥 연주자가 의도적으로 모호하게 연주할 때는 화성적 함의를 잘 이해하고 있기 때문에 피해야 할 음을 정확히 알고 연주한다.

반면, 초보 즉흥 연주자는 일반적으로 구체성과는 반대로 나아간다. 처음에는 주로 잘못된 음을 연주하며 시작하고, 점차 곡 전반에 블루스 릭과 화성적 일반화를 삽입하는 방법을 발견한다. 그리고 연주 경험, 연습, 학습을 통해 화음적 함의를 더 구체적으로 대하는 방법을 익히며, 궁극적으로 화성의 명확성과 모호성 사이에서 균형을 맞추고 이를 통합하게 된다.

이 책은 초보자와 경험 있는 재즈 즉흥 연주자 모두가 즉흥 라인에서 화성적 명확성을 달성할 수 있도록 돕는 것을 목표로 한다. 필자는 여러 위대한 재즈 아티스트의 솔로에서 수백 개의 예시 선율를 가져와 분석하고, 그 기본적인 구조와 골격을 파악하여 세 가지 기본 윤곽으로 나누었다. 이 윤곽은 바흐에서 마이클 브레커, 캐넌볼 애덜리에서 조 자비눌에 이르기까지 거의 모든 작곡가와 즉흥 연주자가 화성적 구조 안에서 통용하는 선율이다. 각 윤곽에 대해, 여러 재즈 아티스트들이 이 윤곽을 어떻게 음악적으로 흥미롭게 만드는지에 대한 기법을 논의할 것이다.

이 윤곽들이 화성적으로 구체적인 재즈 즉흥 연주에서 존재하는 모든 것을 포괄한다고 주장하지는 않는다. 그러나 이 윤곽은 매우 다양한 곳에서 긴 재즈 역사를 아우르며 발견될 만큼 풍부하여 간단명료한 즉흥 연주의 기초를 제공한다. 이 윤곽은 창의성을 제한하거나 경직시키려는 것이 아니다. 여기서 다룬 폭넓은 재즈 즉흥 연주자들은 각자의 개성과 창의성을 감추지 않은 채 화성의 본질을 개별화할 수 있는 수많은 방법을 발견했다.

이 윤곽을 제시하고 이를 설명하기 위해 예시를 새로 창작하는 대신, 필자는 재즈 아티스트들의 연주에서 원칙을 추출하고 실제 발췌을 예시로 삼는 방식을 선택했다. 이러한 관점에서 이 책의 개념은 규범주의적#sub[prescriptive]이라기보다는 기술주의적#sub[descriptive]이다. 이 즉흥 연주자들이 라인을 구상할 때 무엇을 생각했는지 알 방법은 없지만, 그 결과를 면밀히 분석하고 검토할 수는 있다. 재즈 창작자들과 그들의 음악이 최종 권한을 갖는다.

== 기본 이론

=== 온음계 화음과 로마 숫자 <sec_diatonic_roman>

이 책 전반에서, 화음은 으뜸음#sub[tonic]$$(또는 조성 중심#sub[tonal center])과의 관계를 기준으로 설명된다. 이 관계를 나타내기 위해 로마 숫자가 사용된다. 장조의 화성을 다룰 때, 화음은 기본적으로 장음계#sub[major scale]에서 파생된 것으로 간주된다. 반면, 단조의 화성을 다룰 때는 화음이 #sans[화성] 단음계#sub[_harmonic_ minor scale]에서 파생된 것으로 간주된다. 다른 단음계도 존재하지만, 이 책에서는 화성 단음계만 논의한다. 화성 단음계는 3도와 6도가 낮아져 있지만, 이끎음#sub[leading tone]은 유지되어 5도 음 위에 형성된 화음이 딸림화음#sub[dominant chord]가 되도록 한다. 이 7도 음은 또한 3도와 7도 음 위에 형성된 화음에도 영향을 미친다.

장조와 단조 음계 모두에서 7개의 음이 있으므로, 각 음에 기반한 화음은 1부터 7까지의 로마 숫자로 표시된다. 대문자 로마 숫자는 장화음에 할당되며, 소문자 로마 숫자는 단화음 및 감화음에 할당된다. 감화음의 경우 숫자 뒤에 "$degree$" 기호가 추가된다. 반감화음은 $-7flat 5$로 표현하지 #sans[않는다]. 이는 변화($flat 5$)가 일어났음을 의미하지만, 실제로는 그렇지 않기 때문이다. (이 화음은 장조 및 화성 단음계 모두에서 자연스럽게 나타난다.) 반감화음은 소문자 로마 숫자 뒤에 “$ø$” 기호를 붙여 표기한다.

모든 장조 영역에서 간격적 관계(온 온 반 온 온 온 반)가 동일하듯이, 온음계적 화음과 그 성질도 그러하다. 예를 들어, 으뜸화음#sub[tonic chord]은 항상 장화음이고, 위으뜸화음#sub[supertonic chord]은 항상 단화음이다. 만약 위으뜸화음이 장화음처럼 보인다면, 그것은 위으뜸화음이 아니다. 이 화음은 다른 으뜸음을 나타내기 위해 기능하는 것이다. 예를 들어, 단조인 같은으뜸음조#sub[parallel minor] 등 다른 조성에서 빌려왔거나, 전조#sub[modulating]하거나, 어떤 코드를 그것의 딸림화음으로 으뜸화음화#sub[tonicizing]하기 위해 사용된 것일 수 있다.

다음은 #note("C")장조의 온음계적 화음과 각각을 로마 숫자로 나타낸 것이다.

#align(center)[#image("figures/fig_006.jpg", width: 50%)]

다음은 #note("C") (화성) 단조의 온음계적 화음과 각각을 로마 숫자로 나타낸 것이다.

#align(center)[#image("figures/fig_007.jpg", width: 50%)]

=== 전조와 부딸림화음 <sec_modulation>

바로크 시대부터 현대의 팝과 재즈 스타일에 이르기까지의 조화로운 음악에서 전조는 거의 항상 온음 한 개 위나 아래로만 이동하는 경우가 많다. 예를 들어 곡이 #note("C")장조에 있다면 1개의 올림표(#note("G")장조/#note("E")단조) 또는 1개의 내림표(#note("F")장조/#note("D")단조)으로 전조하거나, 나란한조인 단조#sub[relative minor]로 전조할 가능성이 높다. 새로운 조를 으뜸음화하기 위해 딸림화음이 사용되는데, 이러한 화음들을 부딸림화음#sub[secondary dominant]이라고 한다. 이는 새로운 조를 가리키는 역할을 하기 때문이다. 이러한 부딸림화음 위에서 즉흥 연주를 하려면 새로운 조의 음들을 고려해야 한다. 예를 들어, #note("C")장조에서 다음과 같은 부딸림화음과 그것이 가리키는 조, 그리고 필수 임시표#sub[accidentals]를 볼 수 있다. 이를 완전히 이해하기 위해 모든 조에 대한 부딸림화음을 목록으로 만들어 보아야 한다.

부딸림화음, 또는 차용화음#sub[borrowed chords]는 그 기능과의 관계에서 설명된다. 예를 들어, #note("C")장조에서 #note("D")단조의 딸림화음인 #chord("A7") 화음이 진행에 나타난다면, 이는 #chord("V7/ii")로 표시된다. 이 화음은 #note("C")장조에서 #chord("VI") 화음으로 나타나지 않는다. 왜냐하면 #note("C")장조의 #chord("vi") 화음은 단화음이기 때문이다. #chord("A7")은 #note("D")단조의 딸림화음이고, #note("D")단조는 주어진 #note("C")장조에서 #chord("ii") 화음에 해당하므로, #chord("A7")은 #chord("ii") 화음의 딸림화음, 즉 #chord("V7/ii")이다.

처음 조성인 #note("C")장조에서 나타나는 대표적인 전조 또는 으뜸음화#sub[tonicization]를 부딸림화음, 로마 숫자 표기법, 그리고 필수 임시표와 함께 나타내면 다음과 같다.

#align(center)[#table(
  columns: (auto, auto, auto),
  inset: 10pt,
  align: horizon,
  stroke: 0.5pt,
  table.header(
    [*으뜸음화될 새로운 조성 영역*], [*부딸림화음*], [*필수 임시표*],
  ),
  [#chord("ii") $=$ #note("D")단조], [#chord("A7") (#chord("V7/ii"))], [#note("Bb"), #note("C#")],
  [#chord("iii") $=$ #note("E")단조], [#chord("B7") (#chord("V7/iii"))], [#note("F#"), #note("D#")],
  [#chord("IV") $=$ #note("F")장조], [#chord("C7") (#chord("V7/IV"))], [#note("Bb")],
  [#chord("V") $=$ #note("G")장조], [#chord("D7") (#chord("V7/V"))], [#note("F#")],
  [#chord("vi") $=$ #note("A")단조], [#chord("E7") (#chord("V7/vi"))], [#note("G#")],
)]

=== 협화와 불협화 <sec_consonance>

협화#sub[consonance]과 불협화#sub[dissonance]이라는 용어는 화성적 틀 안에서의 안정성이나 불안정성을 나타낸다. 이 용어는 미적으로 듣기 좋은지 또는 불쾌한지와는 아무런 관련이 없다. 협화음정은 안정적으로 들리며, 불협화음정은 협화음으로 해결되기를 원한다. 역설적이게도 재즈 음악가들은 종종 불협화음을 더 매력적으로 여긴다. 이는 불협화음이 움직이려는 경향성을 띠기 때문이다.

=== 화성 리듬과 재즈 연주

화성 리듬#sub[harmonic rhythm]은 화성 변화의 리듬을 말한다. 화음이 두 박자마다 바뀐다면, 화성 리듬은 2분음표이다. 화음이 네 박자마다 바뀐다면, 화성 리듬은 온음표이다. 재즈 연주에서는 다양한 화성 리듬이 존재하며, 이 모든 것이 박자나 악보에 쓰인 위치와 일치하지는 않는다. 예를 들어, $4/4$ 박자에서 한 마디에 하나의 화음이 있을 경우, 베이스는 일반적으로 첫 번째 박자에서 화음의 근음을 연주하며, 이는 악보에 표시된 화음 기호와 일치한다. 그러나 피아니스트나 기타리스트는 화음 기호를 약박#sub[upbeat]에 예상하여 연주할 수 있다. 이것이 재즈 리듬 섹션의 폴리리듬 에너지의 일부이다. 선율이나 즉흥 솔로는 베이스와 함께 연주하거나, 반주 악기와 함께 연주하거나, 화음 변화를 더 일찍 예상하여 연주하거나, 다음 마디로의 해결을 지연시킬 수 있다. 이를 작성된 솔로를 분석할 때 염두에 두는 것이 중요하다. 우리는 쓰인 선율의 음표를 마디에 제한하지만, 화성적 함의는 항상 마디에 한정되지 않는다. 음들을 수직으로 배열했을 때 그것이 종종 무의미해 보일 수 있지만, 더 큰 화성적 틀에서 보면 솔로 연주자가 한 화음의 선율 재료를 다른 화음 위에서 미리 연주하거나 지연시켰을 수 있다. 이것은 재즈에만 국한된 것이 아니다. 교회 찬송가에서도 이러한 계류#sub[suspension]를 자주 볼 수 있다. 재즈에서의 계류는 많은 음표를 포함할 수 있다. 음악을 수직적 배열만으로 분석하려는 함정에 빠지지 말아야 한다. 음악은 선형적으로 들리고 구상되며, 따라서 그러한 방식으로 연구되어야 한다.

#exercisebox[
  + 오선지에 (#note("F#")와 #note("Gb")를 사용해서) 13개의 장조의 온음계적 화음을 적어라. 각 화음을 대소문자를 구별하고 뒤에 붙일 기호를 포함하여 로마 숫자로 나타내라.
  + 오선지에 (#note("D#")와 #note("Eb")를 사용해서) 13개의 단조의 온음계적 화음을 적어라. 화성 단음계가 사용되도록 해라. 임시표에 유의하라. 올린 7도는 #chord("iM7"), #chord("IIIM7#5"), #chord("viidim"), #chord("V7") 화음에 영향을 미친다. 각 화음을 대소문자를 구별하고 뒤에 붙일 기호를 포함하여 로마 숫자로 나타내라.
  + 앞서 보이는 것처럼 모든 장조 영역에 대해 표를 만들어라. 으뜸음화될 새로운 조성 영역과 부딸림화음, 필수 임시표를 나타내라.
  + 임시표를 소리 내어 보는 연습을 해라. #note("C")에서 그와 밀접한 조성으로 전조하는 선율을 만들어 내 보아라. 다음 조성으로 넘어갈 때에 필수 임시표를 사용해라. #note("C")조로 돌아오는 선율을 노래 불러라.
  + 흔한 재즈와 대중 가요를 가지고, 조성 영역을 파악할 수 있도록 로마 숫자를 활용하여 화성 진행을 분석해라.
]

#chapter("선형 화성", l: "chap2")

학생들은 종종 화성을 엄격히 수직적인 것으로만 이해한다. 즉, 화음을 위로 쌓거나 아래로 쌓은 형태로 생각한다. 화음은 수직적이지만, 화성과 선율은 선형적이며 시간이 지나면서 발생한다. 화성의 원리를 선율 발전에 적용하면 화성과 선율을 하나의 통합된 개념으로 이해하는 데 도움이 된다.

재즈 즉흥 연주는 종종 주어진 화성 진행에서 대위법으로 선율을 창조하는 것을 의미한다. 즉, 베이스 선율에 대한 대위선율#sub[counter melody]을 짓는 것이다. 대위법을 위한 최적의 음을 선택하는 것이 중요하다. 숙련된 재즈 즉흥 연주자는 그의 선율이 논리적으로 들리게 하는 데에 화음을 연주하는 피아노에 의존하지 않는다. 선율은 베이스 라인과 관계하여 잘 선택되고 잘 배치된 음들 덕분에 논리적으로 들린다.

== 12개의 반음 중 음 선택 좁히기

베이스 연주자의 역할은 근음 진행을 기반으로 선율을 만드는 것이다. 즉흥 연주자가 베이스 라인에 대해 대위선율을 만들 때 선율에서 근음을 강조하는 것은 최선의 선택이 아니다. 근음이 베이스에서 울리고 멜로디에서도 울리면, 대위법이 아니라 단순히 나란한 옥타브만 들린다. 근음을 제거하면 11개의 음이 남으며, 재즈 연주자들은 이 음들을 모두 사용한다. 이 남은 11개의 음은 화성적 구체성의 상대적 정도를 가진다.

조 중심을 결정하면 선택 범위를 더 좁힐 수 있다. 조 중심에는 7개의 음이 있다. 이미 근음은 제외했으므로(베이스가 이를 다루니까), 6개의 음이 남는다. 대부분의 경우 이 6개의 음 중 어느 것을 사용해도 괜찮지만, 항상 화성적으로 명확하지 않을 수 있다. 예를 들어, #note("C")장조에서 F는 조의 음이지만, 화성적 명확성을 위해 #chord("C") 화음 위에서 강조할 첫 번째 선택은 아니다.

화음 기호는 보통 3\~4개의 음을 제안한다. 예를 들어, #chord("Dm7")은 #note("D")-#note("F")-#note("A")-#note("C")를 제안한다. 이러한 음들은 화성적으로 명확하며, 대위선율을 위한 선택으로 고려해야 한다. #note("D")는 베이스가 이미 처리하고 있다. #note("A")는 화음의 특성을 알려주지 않는다. #note("C")는 불안정한 음으로, 자연스럽게 #note("B")로 끌려 내려가기를 원한다. #note("F")는 화음의 단조 특성을 드러내며, 베이스의 #note("D") 위에서 화성적으로 명확한 대위법을 위한 최고의 선택이다. 베이스의 #note("D") 위에 #note("F")만 연주해도, 두 음만으로도 완전한 단조 화음처럼 들린다.

#note("C")장조에서의 #maj251 진행(#prog("Dm7", "G7", "C"))의 경우, 베이스는 #note("D")에서 시작하여 #note("G")로 이어지는 선율을 즉흥 연주한다. #note("F")$$(화음의 3도)는 대위선율을 시작하기 위한 좋은 선택이다. #note("D") 위에서 #note("F")가 울리면, 단조 화음이 들린다. 같은 이유로, #chord("G") 화음에서는 #note("B")가 가장 명확한 선택이며, #chord("C") 화음에서는 #chord("E")가 가장 명확하다. 이러한 목표음을 결정한 뒤에는, 이 음들을 흥미로운 방식으로 연결하는 것이 남은 과제이다.

#align(center)[#image("figures/fig_009.jpg", width: 44%)]

우리의 귀는 7도 음정이 불안정하며 아래로 해결되기를 원한다는 것을 알려준다. 전통적인 화성학을 공부하면, 이러한 진행에서 화음의 7도 음이 다음 화음의 3도로 순차적으로 해결된다는 것을 알 수 있다. 7도 음은 방향을 제시하는 역할을 한다. #chord("Dm7")의 7도 음인 #note("C")는 순차적으로 내려가 #chord("G") 화음의 #note("B")로 해결된다. #chord("G") 화음의 7도 음인 #note("F")는 순차적으로 내려가 #chord("C") 화음의 #note("E")로 해결된다. 이러한 선율 구조는 이전보다 더 부드럽고 덜 각져있다.

#align(center)[#image("figures/fig_010.jpg", width: 44%)]

7도 음은 긴장감을 형성하며, 다음 화음의 3도로 해결되기를 원하는 욕구를 만들어낸다. 이러한 이유로, 7도 음은 종종 다음 화음으로 이동하기 직전에 연주되는 마지막 음이 된다. 때로는 해결이 다음 마디로의 계류를 형성하기도 한다.

#sans[선형 화성]#sub[linear harmony]은 주요 음들을 사용하여 화음들을 부드럽게 연결하는 선율을 말하며, 이는 신중한 리듬적 배치를 포함한다. 좋은 성부 진행#sub[voice leading]이 관찰되며, 7도는 3도로, 9도는 5도로 해결된다. 3도는 더 협화적인 음이며, 일반적으로 멜로디 라인에서 7도와 같은 불협화음보다 먼저 나타난다. 7도는 일반적으로 마디선을 넘어 다음 화음의 3도로 해결되며, 다시 사이클을 시작한다. 협화/불협화/해결의 순환이다.

이 협화음과 불협화음, 3도에서 7도로, 다시 3도로 연결하는 방식은 몇 가지가 있을까? 즉흥 연주 수업에서, 학생들은 재즈 솔로에서 짧은 예시를 가져오라는 과제를 받았다. 수업에서는 이러한 예시에서 음악의 기본 원리를 추출하였다. 짧은 시간 내에, 모든 예시가 세 가지 범주에 속한다는 것을 알게 되었다. 이들은 동일한 세 가지 기본적인 골격에 기반하고 있었다. 모든 예시는 선형 화성의 원칙을 따랐다. 즉, 리듬적으로 중요한 위치에 협화음(주로 3도)을 배치하고, 이를 불협화음(7도)으로 이끌며, 다시 협화음으로 해결하는 방식이었다. 이는 일반적으로 마디선을 넘어 발생했다.

이 세 가지 골격 또는 윤곽은 화성 시스템에 기반한 많은 음악의 핵심에 존재한다. 이러한 윤곽을 아는 것이 창의성을 억제해서는 안 된다. 오히려, 이를 아는 것이 창의성을 고취해야 한다. 이 윤곽은 뼈대일 뿐이다. 우리의 몸은 모두 비슷한 뼈대를 가지고 있지만, 겉으로는 모두 독특하게 보인다. 모든 집은 비슷한 구조를 가지지만, 서로 다르게 보인다. 많은 문장이 동일한 문법 구조를 공유하지만, 다양한 아이디어를 표현할 수 있다. 수백 개의 음악 예시가 동일한 기본 윤곽을 가질 수 있지만, 여전히 고유한 음악적 정체성을 유지한다.

== 기본 윤곽 만들기

=== 제1윤곽

#padbox[
  3도를 첫 번째 박자에 배치하고 7도를 네 번째 박자에 연주하면, 베이스 워킹 라인에 대위하는 4분음표 워킹 선율을 만들기 위해 채울 박자가 두 개 남게 된다. 음계에서 내려가며 움직이면, #chord("ii") 화음의 3도에서 #chord("V7") 화음을 거쳐 #chord("I") 화음의 3도로 이어지는 순차적 선율이 만들어진다.

  #align(center)[#image("figures/fig_011.jpg", width: 47%)]
]

이는 제1윤곽의 기본이다. 이 윤곽은 명확한 베이스 라인과 잘 어울리며, 아래에 제시된 바와 같다. 다른 윤곽보다 더 자주 발견되는데, 이는 그 화성적 명확성과 듣기 좋은 하강 순차 진행 때문일 수 있다.

제1윤곽에는 몇 가지 변형이 있다.

#padbox[
  첫 번째 번형은 옥타브 이동이다. 주로 목표음 이후에 이루어진다.

  #align(center)[#image("figures/fig_012.jpg", width: 47%)]

  또 다른 번형은 #chord("V7") 화음 위에서 상행하는 아르페지오 (3-5-7-9)를 사용하여 으뜸화음의 5도로 해결시키는 것이다.

  #align(center)[#image("figures/fig_013.jpg", width: 47%)]

  모든 변형은 단조에서도 적용할 수 있다. 조표와 #chord("V7") 화음을 만들기 위해 이끎음을 올리는 것을 염두에 두어라. #chord("ii7")은 #chord("iihalfdim7")이 되고 #chord("V7") 화음은 #chord("V7b9")가 된다.

  #align(center)[#image("figures/fig_014.jpg", width: 47%)]

  모든 변형은 화성 리듬이 줄어들어도 (온음표에서 2분음표로 바뀌어도) 적용 가능하다.

  #align(center)[#autoimg("figures/fig_015.svg")]
]

=== 제2윤곽

필자는 제2윤곽을 “'Round Midnight” 윤곽이라고 부른다. 이는 _'Round Midnight_의 A섹션에서 두 번 등장한다. 제2윤곽은 #chord("ii") 코드(1-3-5)와 그 코드 위에 불안정한 음(7)을 추가한 상행 아르페지오이며, 추가한 음은 #chord("V7") 화음의 3도로 해결된다. 윤곽은 목표인 으뜸음의 3도에 도착하기 위해 음계를 계속해서 내려갈 수 있다.

#align(center)[#autoimg("figures/fig_016.svg")]

아니면, 계속해서 내려가지만 옥타브 이동을 포함할 수도 있다.

#align(center)[#autoimg("figures/fig_017.svg")]

아니면, #chord("V7") 화음의 3도에 도달한 후, #chord("V7") 화음(3-5-7-9)을 아르페지오로 만들 수도 있다.

#align(center)[#autoimg("figures/fig_018.svg")]

제2윤곽의 모든 형태는 단조에서도 적용 가능하다.

#align(center)[#autoimg("figures/fig_019.svg")]
#align(center)[#autoimg("figures/fig_020.svg")]

=== 제3윤곽

제2윤곽은 #chord("ii") 화음의 상행 아르페지오(1-3-5)로 시작하지만, 제3윤곽은 #chord("ii") 화음의 하강 아르페지오(5-3-1)로 시작한다. 여기에 화음 아래에 불안정한 음(7)을 추가하며, 이는 #chord("V7") 화음의 3도로 해결된다. 7도는 보통 약박에 나타나고, 목표음인 3도는 강박에 위치한다. 딸림화음에 도달한 후, 선율은 종종 방향을 바꾸어 3도에서 시작해 아르페지오 형태로 상승(3-5-7-9)하며, 결국 으뜸화음의 5도로 해결된다.

#align(center)[#autoimg("figures/fig_021.svg")]

변형 중 하나는 선율이 음계를 따라 하강하여 으뜸화음의 3도에 도달하는 것이다.

#align(center)[#autoimg("figures/fig_022.svg")]

또 다른 변형은 음계의 방향을 옥타브 이동으로 바꾸는 것이다.

#align(center)[#autoimg("figures/fig_023.svg")]

제3윤곽의 모든 변형은 단조에서도 적용 가능하다.

#align(center)[#autoimg("figures/fig_024.svg")]

#exercisebox[
  + 기본 윤곽은 #note("C")장조에서 가장 일반적인 진행인 #maj251 진행(#prog("Dm7", "G7", "C")) 위에 표시된다. 오선지에 제1윤곽을 모든 장조에서 작성하라. 화음을 위에 이름으로 식별하라 (예: #prog("Dm7", "G7", "C")).
	+ 오선지에 제2윤곽을 모든 장조에서 작성하라. 화음을 위에 이름으로 식별하라 (예: #prog("Dm7", "G7", "C")).
	+ 오선지에 제3윤곽을 모든 장조에서 작성하라. 화음을 위에 이름으로 식별하라 (예: #prog("Dm7", "G7", "C")).
	+ 세 가지 윤곽을 모두 연습하며 노래하라. 윤곽을 사용해 밀접한 조로 전조하고 다시 돌아오며, 필수 임시표를 정확히 부르도록 주의하라.
]

#chapter("꾸밈 기법", l: "chap3")

이 책의 음악 예제를 보기 전에 재즈 음악가들이 사용하는 다양한 꾸밈 기법들을 정의하는 것이 도움이 될 것이다. 음악 예제는 세 가지 윤곽으로 나뉘고, 이후 기본 윤곽을 발전시키는 데 사용된 꾸밈 기법의 유형에 따라 나뉜다. 일부 윤곽은 아무런 꾸밈이나 장식 없이 발견되는 경우가 많다. 때로는 리듬적 배치만이 이들을 흥미롭게 만들기도 한다. 또 다른 경우, 이 윤곽들은 반음계적 진행과 꾸밈으로 가려져 있는 것처럼 보이기도 한다. 다음은 꾸밈 기법, 용어 및 이를 명확히 하는 예제에 대한 설명이다. 이 기법들은 책을 진행하면서 점점 더 친숙해질 것이다.

== 단순한 경우

윤곽은 종종 꾸밈이 거의 혹은 전혀 없이 나타난다. 이는 추가적인 음표 없이 단순한 리듬적 이동만 포함한다.

== 경과음 <sec_passing_tone>

#sans[경과음]#sub[passing tone]은 필수음들 사이의 반음계적 또는 온음계적 단계이다. 화음에서는 화음 구성원들 사이의 온음계 음을 말한다. (예: #chord("CM")의 경과음 = #note("C") $underline(note("D"))$ #note("E") $underline(note("F"))$ #note("G") $underline(note("A"))$ $underline(note("B"))$ #note("C")) 음계에서는 인접 음정 사이의 반음계 음을 말한다. (예: #note("C") $underline(note("C#"))$ #note("D") $underline(note("D#"))$ ...) 반음계적 경과음은 온음 간격으로 인접한 온음계 음 사이에 배치될 수 있다. 모든 온음계 음은 반음계적 이끎음#sub[chromatic leading tone]을 가질 수 있다. 예를 들어, #note("C#")은 #note("D")의 반음계적 이끎음이며, #note("Cnat")과 #note("D") 사이의 반음계적 경과음이다. #note("Db")은 #note("Dnat")과 #note("Cnat") 사이의 반음계적 경과음이다. #note("C#")과 #note("Db")의 차이는 임시표가 암시하는 방향에 있다. 반음계적으로 변화된 음은 변화된 방향으로 계속 진행되는 경향이 있다. 내림표가 붙은 음은 내려가는 경향이 있고, 올림표가 붙은 음은 올라가는 경향이 있다.

'Round Midnight 윤곽은 아르페지오 윤곽이기 때문에, 화성음#sub[chord tones] 사이에 경과음을 넣기에 적합하다. 그러나 #chord("ii") 화음의 5도와 7도 사이에는 거의 경과음이 나타나지 않는다. #chord("ii") 화음의 5도와 7도 사이의 음은 #chord("V7") 화음의 필수음이다. 이 음은 보통 #chord("V7") 화음을 위해 남겨둔다. 이는 이야기의 핵심, 결말, 또는 중요한 순간으로, 이를 미리 경과음으로 사용하여 결론을 드러내지 않는다.

== 이웃음 <sec_neighbor_tone>

필수음 위와 아래의 음을 #sans[이웃음]#sub[Neighbor Tones]이라 한다. (모차르트에서 찰리 파커까지) 일반적인 관행은 #sans[온음계적 상위 이웃음]$$(Diatonic Upper Neighbor Tone, 이하 UNT)과 #sans[반음계적 하위 이웃음]$$(Chromatic Lower Neighbor Tone, 이하 LNT)을 사용하는 것이다.

#note("F") #sans[장조]에서의 #note("C") 3화음에서 #note("C"), #note("E"), #note("G")는 필수음이다. #note("Dnat")는 #note("C")의 UNT이고, #note("Bnat")는 LNT이다. #note("Fnat")은 #note("E")의 UNT이고, #note("D#")는 LNT이다. #note("Anat")은 G의 UNT이고, #note("F#")는 LNT이다.

#align(center)[#autoimg("figures/fig_025.svg")]

#note("F") #sans[단조]에서의 #note("C") 3화음에서 #note("C"), #note("E"), #note("G")는 필수음이다. #note("Db")는 #note("C")의 UNT이고, #note("Bnat")는 LNT이다. #note("Fnat")은 #note("E")의 UNT이고, #note("D#")는 LNT이다. #note("Ab")은 G의 UNT이고, #note("F#")는 LNT이다.

#align(center)[#autoimg("figures/fig_026.svg")]

== 아르페지오 음

화음의 다른 음으로 도약함으로써 단순한 선율에 더 큰 각진 느낌과 흥미를 유발하는 꾸밈이다.

#align(center)[#autoimg("figures/fig_027.svg")]

#align(center)[흔한 아르페지오 음은 낮은 옥타브에서 연주되는 #chord("ii") 코드의 5도이다.]

#align(center)[#autoimg("figures/fig_028.svg")]

== 확장음

제2윤곽에서는 아르페지오가 종종 9도까지 확장되며, 때로는 11도까지 확장된 후 #chord("V7") 화음의 3도로 하강한다.

_'Round Midnight_ 윤곽은 일반적으로 #chord("ii") 화음의 근음에서 시작한다. 그러나 빌 에반스, 클리포드 브라운 등은 같은 아이디어를 사용하지만 #chord("ii") 화음의 3도에서 시작하기도 한다.

== 반음계적 접근

#sans[반음계적 접근]#sub[chromatic approaches]는 일반적으로 온음계 음과 반음계적으로 변화된 음이 필수음으로 이어지는 형태를 말한다. 온음계 음으로 시작하여 반음계 음을 경과음으로 사용해 필수음으로 이어질 수도 있고, 반대로 반음계 음으로 시작하여 온음계 이웃음을 통해 필수음으로 이어질 수도 있다. 반음계적 요소는 선율에 색채를 더하고, 추가된 음정이 리듬적으로 흥미롭게 만든다. 목표음은 종종 마디에서 강박에 위치한다. 목표음은 위아래에서 반음계적 접근으로 둘러싸일#sub[encircled] 수 있다. (#link(<sec_encircled_tones>, [둘러싼음]) 참조)

#padbox[
  #chord("ii") 코드의 3도는 온음 위로부터 반음계적으로 접근될 수 있다.

  #align(center)[#autoimg("figures/fig_029.svg")]

  혹은 온음 밑으로부터,

  #align(center)[#autoimg("figures/fig_030.svg")]

  혹은 둘 다에서,

  #align(center)[#autoimg("figures/fig_031.svg")]

  #chord("V") 화음의 3도는 종종 밑의 온음계 음으로부터 반음계적 경과음을 이어 접근된다.

  #align(center)[#autoimg("figures/fig_032.svg")]

  #chord("V") 화음의 3도는 종종 위와 아래에서 반음계적으로 접근된다. (후술할 #link(<sec_cesh>, [C.E.S.H.])에 대한 논의 참조)

  #align(center)[#autoimg("figures/fig_033.svg")]

  #chord("I") 화음의 3도는 보통 반음계적 경과음으로 접근된다.

  #align(center)[#autoimg("figures/fig_034.svg")]
]

== 옥타브 이동

#sans[옥타브 이동]#sub[octave displacement]은 한 음 또는 여러 음을 다른 옥타브로 위치시키는 기법이다. 이는 도약을 도입함으로써 선율을 더욱 흥미롭게 만드는 경우가 많다. 옥타브 이동은 종종 악기의 음역 때문에 필요하며, 극적인 흥미는 부수적인 결과로 나타난다. 도약은 주로 주요 가이드음#sub[main guide-tone] 뒤에 발생하며, 강박에서 약박로 도약하는 경우가 많다. 도약은 마디선을 넘지 않으며, 약박에서 강박로 도약하는 경우는 드물다. 도약은 예상치 못한 움직임으로 아르페지오 음을 포함할 수 있다. 아르페지오 도약은 한 화성음에서 다른 화성음으로 이동하면서 중간의 화성음을 건너뛸 때 발생한다. 예를 들어, 화음의 3도에서 5도로 올라가는 경우는 한 단계보다 큰 움직임이지만, 다른 화성음을 건너뛰지는 않는다. 반면, 화음의 3도에서 5도로 #sans[내려가는] 경우에는 6도의 도약이 발생하며, 화음의 근음을 건너뛰게 된다.

#align(center)[#autoimg("figures/fig_035.svg")]

예시 음악에는 여러 옥타브 이동 사례가 포함되어 있다. 가장 일반적인 세 가지 사례는 화음의 3도에 도달한 후 도약이 발생하는 경우이다.

#padbox[
  
  3도에서 9도 또는 감9도로 상행: 단순한 하행 음계 단계(3-2)에서 2도의 하강 대신 7도의 도약으로 대체되면 극적인 효과를 낸다. 이때 5도와 7도가 건너뛰어진다. 도약 후에는 음계가 보통 하강을 계속한다. 때로는 3도에서 9도로 도약할 때 화성음을 건너뛰지 않기도 한다. 단순한 선율은 3-5-7-9 아르페지오를 사용하여 옥타브 이동으로 처리된다.

  #align(center)[#autoimg("figures/fig_036.svg")]
  
  3도에서 5도로 하행: 상행 아르페지오 3 $arrow.tr.filled$ 5 $arrow.tr.filled$ 7 $arrow.tr.filled$ 9 대신, 6도 아래로 도약한 뒤, 화음의 3도에서 화음의 5도로 근음을 건너뛰어 넘고, 아르페지오의 상행을 계속한다. 즉, 3 $arrow.br.filled$ 5 $arrow.tr.filled$ 7 $arrow.tr.filled$ 9이다.
  
  #align(center)[#autoimg("figures/fig_037.svg")]
  
  3도에서 근음으로 상행: 화음의 3도에서 근음으로의 하향 도약을 5도를 건너뛴 상행 도약으로 대체한다. 이는 보통 라인을 끝마치게 한다. 으뜸화음의 근음을 들은 뒤 움직임이 멈추려 하기 때문이다.

  #align(center)[#autoimg("figures/fig_038.svg")]
]

== 둘러싼음 <sec_encircled_tones>

#sans[둘러싼음]#sub[encircled tones]은 필수음 전에 두 이웃음을 사용하는 것이다. 떄로는 필수 음이 위아래에서 여러 반음계적 접근 단계에 의해 도달된다. (반음계적 접근에 대한 예시 참조)

== C.E.S.H. <sec_cesh>

C.E.S.H.는 '정적 화성의 반음계적 발전(Chromatic Elaboration of Static Harmony)'을 뜻하는 제리 코커#sub[Jerry Coker]의 약어이다. #maj25 진행에서 가장 일반적인 예는 #chord("ii") 화음의 근음에서 #chord("V7") 화음의 3도로 하강하는 움직임이다. #note("C")장조($chord("Dm")-chord("G7")$)에서는 #note("D")-#note("C#")-#note("C")-#note("B")의 움직임을 말한다. 다른 음들(정적 화성)이 이 반음계적 하행 음들 사이에 연주되며, 때로는 복합선율#footnote[하나의 선율이 두 개 이상의 독립적인 선율을 암시하는 경우를 #sans[복합선율]#sub[compound melodies]이라고 한다.]을 암시하기도 한다. 문헌, 특히 바흐의 솔로 첼로 소나타에서 복합선율의 훌륭한 예들을 찾아볼 수 있다. (찰리 파커의 예시 113 등 이후 예제 참조)

#align(center)[#autoimg("figures/fig_039.svg")]

== 선행음

선행음#sub[anticipation]은 다음 화음에 미리 도달하여 종종 작은 불협화를 만들어내며, 이 불협화는 화성이 선율을 따라잡을 때 해결된다.

== 해결 지연

해결 지연#sub[delayed resolution]은 한 화음의 해결을 다음 화음으로 미루는 기법이다. 목표 화음에 늦게 도달하여, 화성이 선율을 따라잡을 때 불협화가 해결된다.

== 톱니형 <sec_sawtooth>

톱니형#sub[sawtooth]은 톱니 모양처럼 일관된 상승과 하강 움직임이다. 종종 중심축음#sub[pivot note]이나 아르페지오 음을 포함한다. 예를 들면, #note("G")-#note("D")-#note("F")-#note("D")-#note("E")가 있다.

#align(center)[#autoimg("figures/fig_040.svg")]

== 반복

반복된 음은 윤곽이 4분음표로만 나타날 때 8분음표 움직임을 만들어 낼 수 있다. 작곡가들은 수세기 동안 이 기법을 사용해왔다. (바흐의 #note("D")장조 브란덴부르크 협주곡을 들어보라.)

#align(center)[#autoimg("figures/fig_041.svg")]

== 리듬적 기법

리듬적 기법에는 이동#sub[displacement], 확대#sub[augmentation], 축소#sub[diminution], 선행음#sub[anticipation], 그리고 세분화#sub[subdivision]의 복잡한 조합이 포함되며, 기본 윤곽에 흥미를 더한다.

== 음의 추가

윤곽이나 어떤 동기의 앞뒤나 그 안에 음을 추가할 수 있다. 픽업음#sub[pick-up notes]은 윤곽이 시작되기 전에 한두 개의 음으로 시작한다. 추가된 음은 온음계적이거나 반음계적일 수 있으며, 위나 아래에서 추가될 수도, 아르페지오 음일 수도 있다.

== 하나의 예시에서 두 개 이상의 윤곽 사용

때때로 선율은 두 개 이상의 윤곽을 포함한다. 동일한 윤곽이 연속적으로 두 번 사용되거나, 하나의 윤곽이 다른 윤곽으로 이어질 수 있다.

== 차용화음과 차용음

(#link(<sec_diatonic_roman>, [온음계 화음과 로마 숫자])를 참조하라.) 일부 온음계 화음은 다른 조에서 '차용한' 음으로 바꿀 수 있다. 화성이 바뀌면 선율도 같은 방식으로 변한다. 화음은 종종 단조인 같은으뜸음조#sub[parallel minor]에서 차용된다. #chord("iihalfdim7")가 #chord("ii7")로, #chord("iv")가 #chord("IV")로 바뀌는 식이다. 단조인 같은으뜸음조의 음은 종종 딸림화음에 적용되어, 온음계 음보다 더 큰 긴장을 만들어내고, 장화음인 으뜸화음에 도달할 때 더 큰 해소를 만들어낸다. 예를 들어, #note("C")장조의 딸림화음인 #chord("G7") 위에서 재즈 음악가들은 같은으뜸음조인 #note("C")단조에서 #note("Ab") ($flat 9$), #note("Bb") ($sharp 9$), #note("Eb") ($flat 13$)을 자주 사용한다. 이러한 차용음, 즉 낮아진 온음계 음은 온음계 음보다 더 강한 하향성을 가지고 있다. 전조할 때, 화음은 도착하는 조에서 차용된다. 예를 들어 #note("C")장조에서 #note("D")단조로 이동할 때, 종종 #note("D")단조를 가리키는 진행이 #note("D")단조 화음에 앞서 나타난다. 예컨대 $chord("V7")=chord("A7")$이나 $min25 = chord("Ehalfdim7")-chord("A7")$, $chord("viidim7") = chord("C#dim7")$ 등이 사용된다. #note("Bb")과 이끎음 #note("C#")과 같이 전조에 필요한 음은 보통 이러한 변화 위의 선율에서 나타난다.

== 방향 전환

제2윤곽은 #chord("ii") 화음의 7도를 연주하기 전에 보통 상행 아르페지오(1-3-5)를 연주한다. 때로는 극적인 변화를 위해 아르페지오를 하행(7-5-3-1)으로 연주한 후 #chord("V7") 화음의 3도로 해결한다. #chord("ii") 화음의 7도에서 #chord("V7") 화음의 3도로의 해결은 보통 아르페지오 위에서 같은 옥타브에서 발생한다. 아르페지오는 상승하거나 하강하는 대신 "끊어질" 수도, 즉 다른 순서로 연주될 수도 있다.

#padbox[
제2윤곽은 보통 #chord("ii") 화음의 7도를 연주하기 전에 상행(1-3-5)한다. 그러나 아르페지오가 하강하는 경우도 있다. 이 경우 아르페지오 위의 같은 옥타브에서 #chord("ii") 화음의 7도가 #chord("V7") 화음의 3도로 해결된다.

#align(center)[#autoimg("figures/fig_042.svg")]

제3윤곽은 보통 #chord("ii") 화음의 7도를 연주하기 전에 하행(5-3-1)한다. 그러나 아르페지오가 상승하는 경우도 있다. 이 경우 아르페지오 아래의 같은 옥타브에서 #chord("ii") 화음의 7도가 #chord("V7") 화음의 3도로 해결된다.

#align(center)[#autoimg("figures/fig_043.svg")]
]

#chapter("제1윤곽", l: "chap4")

== 간단한 형태의 제1윤곽

다음은 이 패턴의 가장 단순한 형태 중 하나이다. #chord("ii") 화음(#chord("Gm"))의 3도에서 시작하여 #chord("V7") 화음(#chord("C7"))의 3도로 내려가고, 아르페지오를 따라 상승하면서 진행한다. 선율은 으뜸화음의 3도에서 멈춘다.

#example("찰리 파커", 044)

셋잇단음은 이와 유사한 패턴에 리듬적 흥미를 제공한다.

#example("찰리 파커", 045)

톰 하렐은 #note("F")장조에서의 #prog("iii", "V7/ii") 진행에서 이 패턴을 사용한다. 이 #chord("Am7") 화음은 #note("G")장조의 #chord("ii") 화음이 아니라, #note("F")장조의 #chord("iii") 화음이다. 조표에 플랫 하나가 있기 때문에 두 번째 음은 #note("Bb")이다. #chord("D7") 화음은 #note("G")단조(즉, #note("F")장조의 #chord("ii") 화음)를 향하는 부딸림화음이다. #note("G")단조로 가기 위해 그는 내림표 하나(#note("Eb"))를 추가하고, #note("G")단조의 이끎음인 #note("F#")을 추가할 필요가 있었다. 이 과정에서 그는 $flat 9$이 포함된 #chord("D7") 화음을 완성하였다. 새로운 조로 향하는 두 개의 반음계적 음이 선율에 모두 포함되어 있다.

#example("톰 하렐", 046)

리듬적 선행음이 포함된 기본 윤곽이다.

#example("톰 하렐", 047)

다음 다섯 개의 예시에서는 리듬적 기법이 사용되어 흥미롭게 만든다.

파커는 윤곽의 일부에서 축소#sub[diminution]를 사용한다. #note("F")조이고, #note("F")조에서 #maj36$$의 진행을 따른다. (위에서의 논의를 참조)

#example("찰리 파커", 048)

허버드의 선율에서는 4분음표와 8분음표를 혼합하여 멈췄다 가는 느낌을 준다.

#example("프레디 허버드", 049)

스팃은 선율의 시작을 늘리고 끝을 줄인다.

#example("소니 스팃", 050)

하렐은 #chord("Gm7") 화음을 미리 연주하며, 단조인 같은으뜸음조에서 차용한 딸림화음의 9도를 내린 음을 사용한다.

#example("톰 하렐", 051)

에반스의 선율은 그의 특징적인 첫 박의 약박에서 시작하는 8분음표와 이어지는 셋잇단음표를 포함하지만, 윤곽은 여전히 단순하다.

#example("빌 에반스", 052)

클리포드 브라운은 #chord("ii")의 3도에서 시작해서 옥타브 도약을 한 뒤, #chord("V")의 3도에 가기 위해 나머지 윤곽을 압축시킨다.

#example("클리포드 브라운", 053)

다음 두 윤곽은 거의 꾸밈이 없이 단순하게 유지되어 있다. 덱스터 고든은 첫 두 음의 순서를 바꿔 연주한다. 허버드는 #chord("ii") 화음의 3도 주변에서 연주한 후 음계를 따라 내려온다. #chord("V7") 화음의 3도는 세번째 박자까지 지연되고, #chord("I") 화음으로의 해결은 정확히 첫 박자에서 이루어진다. #chord("C7") 화음의 $flat 9$인 #note("Db")의 사용에 주목하라. 이 음은 같은으뜸음조인 #note("F")단조(내림표 4개)에서 '차용'한 것이다.

#example("덱스터 고든", 054)

#example("프레디 허버드", 055)

소니 스팃은 #chord("ii") 화음에서 상행하는 음계로 시작해서 #chord("V7") 화음 위에서 순수한 윤곽을 연주한다.

#example("소니 스팃", 056)

블루 미첼은 3도에서 시작하여 상승했다가 다시 3도로 돌아오고, #chord("D7") 화음의 3도로 내려간다. 미첼은 아래에 #chord("Am")의 5도(아르페지오 음)를 추가하여 #chord("D7") 화음의 3도가 첫 박에 위치하도록 하고, 선율에 더 각진 형태를 부여한다.

#example("블루 미첼", 057)

4분음표 값으로 된 윤곽에서 8분음표 움직임을 얻는 쉬운 방법은 음을 되풀이하는 것으로, 이를 반복#sub[iteration]이라고 부르기도 한다. 또 다른 방법은 선율의 일부를 반복하는 것이다. 예시 15에서 애슐리 알렉산더는 반복된 음을 사용하며, 예시 16에서는 윤곽의 두 음, 세 음, 다섯 음을 순서대로 연주한다. #chord("F7") 화음에서 3도에서 근음으로의 도약에 주목하라.

#example("애슐리 알렉산더", 058)

#example("애슐리 알렉산더", 059)

단순한 윤곽은 흥미로운 측면 진행#sub[side maneuvers]으로 인해 중간에 끊긴다. 윤곽은 8분음표(#note("Bb")에서 #note("E")로 하행)으로 시작한다. 첫 번째 마디의 세 번째 박자에서는 길이가 2분음표(#note("E")와 #note("D"))로 바뀐다. 두 번째 마디의 세 번째 박자에는 #note("C")가, 네 번째 박자에는 #note("Bb")가 4분음표 값으로 연주된다. 첫 번째 박자에 선율은 으뜸화음의 3도에 도달한다.

#example("캐넌볼 애덜리", 060)

파커는 이 단순한 윤곽에 흥미를 더하기 위해 두 가지를 사용한다. 8분음표만큼 박자를 앞당겨#sub[anticipating] 연주하여 선율에 추진력을 더한다. #note("F")는 위와 아래 이웃음으로 둘러싸인 후 하행 선율을 이어간다. #note("Bb") 화음의 3도로의 해결은 지연되며, 첫 번째 박자가 아닌 두 번째 박자의 약박에 도달한다.

#example("찰리 파커", 061, subtitle: ["Ornithology" (헤드), "Anthropology" (헤드)])

다음 세 가지 예제는 많은 픽업음으로 시작한다. 윤곽이 시작되기 전에 선율 재료가 추가되었다. 하렐은 #chord("ii") 화음의 근음에서 시작하여 상행 음계를 사용한 후 11도까지 아르페지오로 연주하고, 단순한 하행 음계 윤곽을 통해 으뜸화음의 3도로 이어진다. 허버드는 매우 유사한 방식으로 하렐이 사용한 동일한 재료의 상부를 사용하여 같은 방식으로 하행한다. 예시 21에서 하렐은 #chord("ii") 화음의 3도에서 시작하지만 하강하지 않고 7도로 상승한다. 그는 세 번째 박자의 #note("D")로 #chord("V7") 화음에 도달하는 것으로 보인다. 단순한 패턴은 두 번째 마디에서 #note("Ab")으로 시작한다. 윤곽은 #note("Bb")을 반음계적 이웃음 #note("A")와 #note("Bnat")로 둘러싸고, 돈꾸밈음#sub[turns]을 추가하여 확장되며, 마지막으로 으뜸화음의 3도인 G에 도달한다.

#example("톰 하렐", 062)

#example("프레디 허버드", 063)

#example("톰 하렐", 064)

다음 두 예제에서는 한 음이 추가되었다. #chord("ii") 화음의 3도는 네 번째 박자의 약박에 위치하며, 첫 번째 박자에 반음계적 하위 이웃음이 연주된 후, 윤곽이 끊김 없이 이어져 으뜸화음의 3도로 해결된다.

#example("부커 리틀", 065)

#example("톰 하렐", 066)

이 하렐의 예시는 예시 23과 유사하다. 반음계적 음의 자리에 쉼표가 자리한다. 9도가 낮춰졌는데, 이는 같은으뜸음조(내림표 4개)인 #note("F")단조에서 차용한 것이다.

#example("톰 하렐", 067)

이 하렐의 예시 또한 예시 23과 유사하다. 반음계적 음의 자리에 한 화성음(#chord("Gm")의 5도인 #note("D")) 밑으로의 아르페지오적 도약이 자리한다.

#example("톰 하렐", 068)

J. J. 존슨은 예시 26에서 이와 유사한 화성음으로의 도약을 사용한다. 이 진행에서 #chord("Am7") 
(#chord("iii"))은 #chord("F") (#chord("I"))를 대체한다. #chord("D7")은 #chord("ii")의 #chord("V7")이다. #chord("Gm")를 으뜸화음화하기 위해 필요한 필수 임시표(#note("F#")과 #note("Eb"))은 #chord("D7") 화음의 3-5-7-9 아르페지오에 있다.

#example("J. J. 존슨", 069)

다음 예제들은 단순한 윤곽에 간단한 반음계적 요소를 추가하여 더 흥미롭게 만든 것이다.

패츠 나바로는 윤곽의 첫 부분을 압축한 뒤, 두 번째 마디에서 #note("Eb")에 반음계적 상·하위 이웃음만을 추가하여 선율을 이어간다. 예시 21의 이와 유사한 반음계적 둘러싼음과 비교해 보라.

#example("패츠 나바로", 070)

파커는 두 개의 픽업음을 사용한다. #chord("ii") 화음의 근음과 그 반음계적 이끎음이 그것이다. 그리고 그 아래의 또다른 화성음인 #note("D")를 더해 단순한 윤곽을 풍부하게 만든다. #chord("C7") 화음에서 3도에서 근음으로 이어지는 극적인 도약에 주목하라.

#example("찰리 파커", 071, subtitle: ["Scrapple from the Apple" (헤드)])

허버드는 돈꾸밈음으로 시작한 후 반음계적 이끎음으로 건너뛰고 나서 윤곽을 이어간다. 마지막에 하향 도약을 사용한다.

#example("프레디 허버드", 072)

클라크 테리는 두 개의 반음계적 음을 사용한다. 반음계적 경과음(#note("Gb"))과 #note("E")로 가는 반음계적 이끎음(#note("D#"))이 그것이다. 만약 테리가 이 두 음을 추가하지 않았다면, 윤곽은 단순하게 유지되었을 것이고, #note("Enat")은 첫 번째 박자에 나왔을 것이다. 그러나 이러한 음들을 추가함으로써 선율에 반음계적 흥미를 더할 뿐만 아니라 #chord("C7") 화음으로의 해결을 지연시켰다. 우리는 첫 번째 박자에 #note("E")가 나올 것으로 예상하지만, 대신 “잘못된” 음인 #note("F")가 나오고, 이어서 또 다른 “잘못된” 음인 #note("D#")이 나온 후 두 번째 박자에 #note("E")로 해결된다.

#example("클라크 테리", 073)

파커는 기본 윤곽에 셋잇단음과 돈꾸밈음을 추가하며, 차용된 두 음(G7 화음의 변형된 9도#footnote[$sharp 9$과 $flat 9$이 모두 쓰였다. (역주)])을 사용한다.

#example("찰리 파커", 074)

== 단조 진행에서의 제1윤곽

#note("F")장조에서 #prog("Ahalfdim7", "D7") 진행은 #chord("ii") 화음(#chord("Gm"))을 으뜸화음화한다. 이 예제가 실제로 #note("G")단조의 조성에 속하지는 않지만, 잠시 #note("G")단조로 전조하며 #min25 단조 진행에서 제1윤곽을 소개한다. 첫 번째 예시에서는 윤곽이 꾸밈 없이 단순하게 나타난다. 두 번째 예제에서는 윤곽이 단순하지만 #note("G")단조로 두 박자 일찍 해결되며, 세 음(#note("A")-#note("C")-#note("A"))을 통해 다시 딸림화음(#chord("D7"))으로 돌아간 후 세 번째 마디의 두 번째 박자에 #note("G")단조 화음의 3도(#note("Bb"))로 지연되어 해결된다. #note("A")-#note("C")-#note("A")는 #chord("D7") 화음(#note("G")단조의 딸림화음)의 일부로 볼 수 있으며, 동시에 #note("Bb")$$(#note("G")단조의 3도)의 상·하위 이웃음으로 해석할 수도 있다.

#example("찰리 파커", 075)

#example("찰리 파커", 076)

이 익숙한 비밥 곡#footnote[대부분 이 #note("Ab")장조 비밥 곡의 작곡자를 파커로 본다. 그러나 마일스 데이비스는 자서전에서 자신이 작곡했다고 주장했으며, 길 에반스가 마일스에게 공을 돌렸다는 이야기도 있다.]의 마지막 부분에 가까운 선율에서 #note("Ab")장조의 진행은 #prog("iii", "V7/ii", "ii")으로 나타난다. 윤곽은 가장 단순한 형태로 제시된다.

#example("찰리 파커", 077, subtitle: ["Donna Lee" (헤드)])

앞의 여러 예제에서는 제1윤곽의 하행 음계/상행 아르페지오 형태를 보여주었다. 여기에서는 골격이 되는 형태의 하행 음계를 제시한다. 선율은 3도에서 시작하여 7도로 하강하며, 7도는 다음 3도로 해결된다. 이어서 7도로 진행한 후, 으뜸화음의 3도로 해결된다. 3도는 모두 강박에 위치하며, 7도는 마지막 약박에 나타나고 예상되는 방식으로 해결된다.

#example("찰리 파커", 078)

다음은 재키 맥린의 #note("A")단조에서의 발췌이다. #chord("iihalfdim7") 화음의 3도는 네 번째 박자에 나타난다. 전위된 3-5-7-9 아르페지오가 선율의 하강 진행을 중단시키며, #chord("Fm") 화음의 3도로 강박에 확실하게 해결한다.

#example("재키 맥린", 079)

이 빌 에반스 발췌는 다른 많은 예제들과 마찬가지로 윤곽이 온전하게 유지되지만, 픽업음과 함께 나타나며 오직 #chord("V7") 화음 위에서만 연주된다.

#example("빌 에반스", 080)

동일한 진행 위에서 쳇 베이커가 연주한 세 가지 예제를 비교해 보자. 예시 38은 약간의 리듬적 축소와 이동을 포함한 단순한 형태이다. 예시 39는 음계에서 두 개의 픽업음으로 시작하여 #chord("C7") 화음에 한 박자 일찍 도달하며, #chord("C7") 화음의 7도와 근음 사이에 반음계적 경과음을 사용해 #note("C")를 둘러싼다. 예제 40은 픽업음들로 시작하며, 여기에는 반음계적 경과음(#note("Anat"))이 포함된다. 이후 선율은 두 박자 일찍 #note("F")단조의 3도로 이어지며 하강한다. 이 선율은 "Gone, But Not Forgotten"에서 온 자주 들을 수 있는 재즈 인용구으로 끝난다. 선율에서 가장 낮은 음과 마지막 마디의 가장 높은 음은 모두 #note("F")단조의 3도인 #note("Ab")이며, 두 #note("Ab") 사이의 음은 옥타브를 채우는 역할을 한다.

#example("쳇 베이커", 081)

#example("쳇 베이커", 082)

#example("쳇 베이커", 083)

다음은 톰 하렐의 비교적 단순한 두 가지 예시이다. 첫 번째 예시는 매우 단순하다. 두 번째 예시에서는 #chord("iihalfdim7") 화음과 #chord("V7") 화음을 미리 예고#sub[anticipating]하며, #note("Bb")과 #note("C") 사이에 반음계적 경과음을 사용한다. 이는 예시 39와 유사한 방식이다.

#example("톰 하렐", 084)

#example("톰 하렐", 085)

자비눌은 예상대로 #chord("iihalfdim7") 화음의 3도에서 윤곽을 시작하여 #chord("V7") 화음의 3도로 하강한 뒤, 네 번째 박자에 아르페지오 음을 사용하여 방향을 바꾼다. 마지막 두 음은 #note("Gnat")의 상위 및 하위 이웃음이다. 상위 이웃음은 반음계적 음이지만, #note("C")단조에서는 온음계적 음이다. 하위 이웃음은 G로 가는 반음계적 이끎음이다.

#example("조세프 자비눌", 086)

하렐은 하행 음계 음들 사이에 음을 추가하여 예측 가능성과 직선적인 느낌을 깨뜨리는 경우가 많다. 예시 44에서 #chord("C7") 화음의 7도(#note("Ab")으로 해결되기를 원하는 음인 #note("Bb"))를 연주한 후, 세 개의 다른 음(#note("C"), #note("G"), #note("Bb"))을 연주하는데, 이들은 모두 딸림화음의 화성음이다. 이를 통해 #note("F")단조로의 해결을 지연시킨다. 예시 45에서 하렐은 #chord("iihalfdim") 화음의 3도 위에서 시작하여 #chord("V7") 화음의 3도로 내려간다. 이후 #note("Gb")으로 계속 진행하거나 아르페지오(3-5-7-9)로 상승하는 대신, #chord("V7") 화음의 5도를 옥타브 이동하여 연주한 후 세 번째 박자에 #note("Gb")으로 돌아온다. 하렐은 #chord("F7") 화음을 마지막 마디까지 확장하며, 두 개의 딸림화음 음을 사용한 후 #note("Db")으로 해결한다. (예시 32에 대한 논의를 참조하라.)

#example("톰 하렐", 087)

#example("톰 하렐", 088)

== 다른 진행에서의 제1윤곽

=== 일반적인 진행

*근음이 5도 하강(또는 4도 상승)하는 진행:* 가장 일반적인 근음 진행은 5도 하강 또는 4도 상승 형태이다. #note("D")단조는 #chord("G7")로 해결되기를 원하며, #chord("G7")은 #chord("CM")로 해결되기를 원한다. 장조 으뜸화음으로 이어지는 가장 빈번한 진행은 #prog("ii", "V", "I")이고, 단조에서는 #prog("iihalfdim", "V", "I")이다. 이 책에 나오는 대부분의 예제는 재즈와 화성 음악에서 매우 자주 등장하기 때문에 #prog("ii", "V", "I") 또는 #prog("iihalfdim", "V", "I") 진행에 기반하고 있다.

*근음이 3도 하강하는 진행:* 두 번째로 흔한 근음 진행이다. (#chord("CM")에서 #chord("Am")로 진행하는 경우) 많은 즉흥 연주자들은 윤곽을 사용할 때 #chord("CM") 화음을 #chord("Em")처럼 다루어 #chord("iii") 화음을 #chord("I") 화음으로 대체#sub[substitute]하여 연주한다.

#align(center)[#autoimg("figures/fig_089.svg")]

*근음이 온음 1개씩 이동하는 진행:* 가장 드물게 나타나는 근음 진행이다. (#chord("FM")에서 #chord("GM")로 진행하는 경우) 많은 즉흥 연주자들은 윤곽을 사용할 때 #chord("FM") 화음을 #chord("Dm") 화음처럼 다루어 #chord("G")로 진행하며, #chord("IV") 화음을 #chord("ii") 화음으로 대체하여 연주한다.

#align(center)[#autoimg("figures/fig_090.svg")]

이 윤곽들은 다른 많은 진행에서도 활용할 수 있다. 근음이 5도 하강하는 경우라면 화음의 성질#footnote[quality of a chord. 장화음, 단화음, 감화음, 반감화음 등의 코드의 주요한 특징을 말한다. (역주)]과 관계없이 언제든지 이 윤곽들을 사용할 수 있다. 위의 예시에는 #maj251, #min251, #maj362 진행이 포함되어 있다. 아래는 이러한 윤곽을 적용할 수 있는 전통적인 화성 진행의 일부 목록이다.

장조:

#align(center)[
  #maj25, #prog("V7", "I"), #prog("I", "IV"), #prog("IV", "viihalfdim"), [#prog("viihalfdim", "iii")], #prog("iii", "vi"), #prog("vi", "ii")
]

단조:

#align(center)[
  #prog("iihalfdim", "V"), #prog("V7", "i"), #prog("i", "iv"), #prog("VI", "iihalfdim")
]

다음은 제1윤곽의 두 확장된 예시이다. 첫 예시는 $display(chord("ii") - chord("V7") - chord("I") - chord("IV") - frac(chord("iihalfdim") - chord("V7") - chord("i"), chord("vi")))$ 진행 위에서 연주된다. 이 진행은 전통 음악 문헌 전반에서 찾아볼 수 있다. 재즈 레퍼토리 중에서는 "Autumn Leaves", "Spain", "Alice in Wonderland", "A Day in the Life of a Fool"과 같은 곡에서 등장한다. 이는 주어진 조성 중심#sub[key center]에서 모든 화음을 순차적으로 순환하는 조성 중심 순환#sub[key center cycle] 진행이다. 이 진행은 장조의 #maj251 종지#sub[cadence], 단조인 나란한조의 #chord("VI") 화음에 해당하는 #chord("IV") 화음, 그리고 단조인 나란한조의 #min251 종지로 이루어진다. 바흐는 첫 음 이후 상위 이웃음을 사용하여 하강 음계를 중단시킨다. 이후 음계는 계속 하강하지만, 베이스 성부로 바뀐다. 소프라노 성부는 두 번째 화음의 3도에서 5도로 도약한 후 다시 순차적으로 진행한다. 두 번째 예제는 느린 블루스의 턴어라운드#sub[turn-around]에서 비롯된 일련의 딸림화음으로 구성되어 있다. #chord("G7") 화음 위의 #note("Bnat")에서 시작하여 모든 음이 순차적으로 하강하지만, 지속적으로 옥타브 이동으로 중단된다. 여러 연주자에게서 이러한 예제를 찾아볼 수 있지만, 이렇게 확장된 형태는 드물다.

#example("J. S. 바흐", 092, subtitle: [영국 모음곡 #note("G")단조 중 프렐류드])

#example("마이크 스턴", 093)
#align(center)[#autoimg("figures/fig_094.svg")]

== 제1윤곽과 옥타브 이동

즉흥 연주자는 흥미를 더하기 위해 예상하지 못한 음역에 음을 배치하는 경우가 많다. 이는 창의적 발상에 의한 것이거나, 관악기의 극단적인 음역에서 연주할 때 필요에 의해 이루어질 수 있다. 옥타브 이동과 도약에 대한 앞선 논의를 참조하라.

제1윤곽의 옥타브 이동을 활용한 최고의 예는 바흐에서 찾을 수 있다. 이는 많은 학생들이 좋아하는 예제이며, 이렇게 재즈적인 느낌의 음악 예제가 바흐에서 나왔다는 사실에 놀라곤 한다. 하강 선율은 강박 이후 도약(3도에서 9도로의 도약)으로 중단된다. 도약은 마디선을 넘어 발생하는 경우가 드물며, 예시 47과 같이 도약이 강박 이후에 나타나는 경우가 많다.

#example("J. S. 바흐", 095, subtitle: [3성부 신포니아 #note("D")장조])

이 예시는 #chord("ii") 화음의 3도에서 시작하며, 쉼표 후 도약하여 나머지 하행 선율을 시작한다.

#example("덱스터 고든", 096)

이 예제에서는 경과음과 아르페지오 음이 사용되어서 옥타브 이동이 다소 감춰져 있다. 모든 꾸밈이 더해진 상태임에도 각 화음의 3도는 매번 정확히 강박에 위치한다.

#example("블루 미첼", 097)

#chord("ii") 화음의 3도로 이어지는 몇 개의 반음계적 음이 있다. #note("Gb")은 예시 50과 같이 #note("Fnat")로 도약한 후, 온음계 음계를 따라 하강하며 #chord("V7") 화음의 근음과 7도 사이에 하나의 반음계적 경과음을 포함한다. 두 번째 마디에서 #note("Gb")에서 #note("F")로의 도약은 이전 마디에서 채워졌던 옥타브 이동을 상기시킨다.

#example("클리포드 브라운", 098)

이 예시에는 두 번의 도약이 있다. 첫 번째 도약은 #chord("F7")에서의 하행 아르페지오(3-5-7-9)를 끊는다. 이 아르페지오는 3도로 하향 도약한 후 7도와 플랫 9도로 계속 상승하는 옥타브 이동을 보여준다. #note("Gb")은 하강하여 #chord("Bbm") 화음의 3도로 해결된다. 선율은 옥타브 도약한 후 하강을 이어가며 #chord("Eb7") 화음의 3도에 도달한다. 이 진행은 #note("Ab")장조에서 #prog("V7/ii", "ii", "V7")진행이다.

#example("클리포드 브라운", 099, subtitle: ["Valse Hot" (_Plus 4_)])

톰 하렐은 옥타브 이동을 포함한 비슷한 아르페지오를 사용하지만, 이번에는 #chord("ii") 코드 위에서 나타난다.

#example("톰 하렐", 100)

다음 예시에서 3도에서 5도로의 하향 도약이 분명하게 나타난다. 파커는 낮은 #note("F")에서 다시 방향을 바꾸어 #chord("Eb7") 화음을 아르페지오로 연주한다. 3도는 박자에 맞게 위치하며, 첫 번째 마디에서는 강세가 있는 상위 이웃음으로 시작하는 것을 제외하고는 모두 강박에 놓여 있다. 7도는 마지막 박자에 나타난다. 딸림화음에서의 변형된 9도는 같은으뜸음조인 #note("Ab")단조(내림표 7개) 또는 #note("G#")단조(올림표 5개)에서 차용된 음이다.

#example("찰리 파커", 101, subtitle: ["Donna Lee" (헤드)])

다음 예제들은 이와 유사한 아르페지오를 사용하지만, 화음의 5도에 대한 하위 이웃음을 포함하고 있다. 비화성음#sub[non-harmonic tone]으로의 도약은 더욱 극적이며, 이 비화성음은 상행으로 해결되어 아르페지오를 계속 이어간다. 두 예시 모두에서 3도는 강박에 위치하여 도약과 반음계적 비화성음이 포함된 나머지 선율과 균형을 이룬다.

#example("프레디 허버드", 102)

#example("클리포드 브라운", 103)

이 두 예시는 #chord("ii") 화음의 3도에서 시작하여 윤곽의 다음 음 전에 하위 음을 추가하고, 음계 진행과 아르페지오로 상승한 후 높은 옥타브에서 #chord("V7") 화음의 3도로 지연되어 해결된다. 상행 음계가 다가오는 목표음을 피하기 위해 끊기는 점에 주목하라. 예시 57에서는 세 번째 박자에 #note("C")에서 시작하는 음계가 #note("G")로 이어지며, #chord("F7") 화음의 목표음인 #note("Anat")을 건너뛴다. 예시 58에서는 #chord("D7") 화음의 목표음인 #note("F#")을 건너뛴다.

#example("클리포드 브라운", 104)

#example("클리포드 브라운", 105)

이 예제에서 롤린스는 많은 하위 화성음과 그것들의 반음계적 이끎음을 사용한다. 선율의 상부는 윤곽을 명확히 따르며, 하부는 각진 느낌을 더하고 리듬적 흥미를 제공하며 일종의 대위 복합선율을 형성한다.

#example("소니 롤린스", 106)

#note("Anat")에 대한 반음계적 하위 이웃음과 마지막 두 마디의 진행이 예시 59와 유사하다.

#example("소니 스팃", 107)

클리포드는 #chord("V") 화음의 3도로 지연되어 해결하며, 처음 시작했던 것보다 한 옥타브 높게 해결한다.

#example("클리포드 브라운", 108)

== 제1윤곽과 아르페지오 음

앞의 여러 예제는 아르페지오 음을 사용하여 더욱 풍부하게 만들어졌다. 다음 예시들에서는 윤곽을 따라 진행하기 전에 화성음을 통해 목표음에 접근하거나 목표음이 화성음에 뒤따른다.

디지는 여러 개의 반음계적 음을 사용하여 #chord("V7") 화음의 3도로의 해결을 지연시킨다. #chord("D7") 화음의 3도(#note("F#")) 앞에 두 개의 이웃음이 배치되어 있다. #note("F#")이 연주된 후에는 근음으로 도약이 이루어진다.

#example("디지 길레스피", 109)

파커는 앞의 예시와 동일한 아르페지오 형태로 시작하며, #note("G")음 하나만 추가하여 윤곽을 잠시 중단한 후 #chord("F7b9") 화음을 아르페지오로 이어간다.

#example("찰리 파커", 110, subtitle: ["Confirmation" (_Charlie Parker_)])

다음 브라운의 예시는 앞의 예시들보다 더 많은 반음계적 꾸밈음을 포함하고 있다. 목표음 이후 아르페지오 음으로 도약이 이루어진다. #note("Gnat")은 반음계적 경과음이다. #chord("B7")과 #chord("EM")의 목표음은 아래에서 반음계적으로 접근한다. 두 경우 모두 반음계적 음에서 목표음으로 가기 전에 화성음에서 화성음으로 도약한다. #chord("ii") 화음과 #chord("V") 화음의 목표음은 첫 번째 박자에 위치하고, #chord("I") 화음은 두 번째 박자에 도달한다. #chord("B7") 화음의 7도는 두 번째 마디의 마지막 음이며, 첫 번째 박자에 #note("G#")이 나올 것으로 예상된다. 그러나 브라운은 반음계적 접근음을 추가하여 해결을 지연시키는 효과를 만들었다.

#example("클리포드 브라운", 111)

== 제1윤곽과 반음계적 접근음

다음은 기본적인 하행 음계 윤곽을 가진 여러 예시로, 목표음보다 온음 위에서 시작하는 반음계적 픽업음이 앞에 배치된 형태이다. 목표음보다 온음 위에서 시작하면 반음계적 음이 #chord("ii") 화음 위에서 장3도가 되지만, 장3도로 들리지는 않는다. 대신 두 개의 온음계 음 사이의 경과음으로 들린다. 다음은 세 가지 간단한 예시이다. 첫 번째는 장조에서, 두 번째는 단조에서, 세 번째는 축소된 형태로 #note("F")장조에서 #chord("ii") 화음을 으뜸음화하는 예시이다.

#example("부커 리틀", 112)

#example("프레디 허버드", 113)

#example("찰리 파커", 114)

허버드는 #note("Bb")까지 하강하는 윤곽을 연주한 후, 세 개의 음(경과음을 포함한 아르페지오)을 삽입하여 음역을 옮긴 뒤 #note("A")와 #note("G")로 하강을 이어간다.

#example("프레디 허버드", 115)

버드는 #note("Ab")장조의 확장된 진행(#prog("iii", "V7/ii", "ii", "V")) 위에서 두 개의 윤곽을 사용한다. 그는 반음계적 접근음으로 시작한 후 #prog("iii", "V7/ii") 위에서 단순한 윤곽을 연주한다. 두 번째 윤곽은 옥타브 이동으로 바로 시작한 후 계속 진행된다.

#example("도널드 버드", 116)

브라운은 아르페지오 음을 사용하여 세 번째와 네 번째 박자에 윤곽을 확장함으로써 목표음이 제시간에 도달하도록 하고, 선율에 더 톱니형의 각진 느낌을 부여한다.

#example("클리포드 브라운", 117)

스팃과 하렐은 첫 번째 목표음에는 위로부터 접근하고, 두 번째 목표음에는 아래에서 접근한다.

#example("소니 스팃", 118)

#example("톰 하렐", 119)

브라운은 반음계적 접근음으로 시작하여 #note("G")를 이웃음으로 둘러싸고, 예시 70과 유사한 톱니형 선율을 사용하여 #chord("C7") 화음의 목표음 도달을 지연시킨다.

#example("클리포드 브라운", 120)

다음 두 예시는 서로 다른 리듬적 접근과 여러 반음계적 음을 포함한다. 여기에는 차용음과 반음계적 이웃음이 사용된다.

#example("도널드 버드", 121)

#example("리 모건", 122)

캐넌볼은 세 번째 박자에 #chord("C7") 화음에 도달하고 네 번째 박자의 약박에 #note("F")로 도약한 후, 다시 돌아와 #note("A")로 하강을 이어간다. 마지막 #note("A")는 #chord("F") 화음을 두 박자 앞서 예고한다.

#example("캐넌볼 애덜리", 123)

다음 두 예시는 비교적 단순하다. 클라크 테리는 서로 다른 음역에서 두 개의 윤곽을 사용하여 연주한다.

#example("톰 하렐", 124)

#example("클라크 테리", 125)

클리포드 브라운과 케니 배런의 예시에서 반음계적 접근이 너무 많아 단순한 윤곽이 보이거나 들리기 어려울 수 있다. 브라운의 첫 번째 마디에서 모든 강박은 순차적 선율을 암시한다. 선율은 두 번째 마디의 첫 번째 박자에서 계속되다가 두 개의 8분음표로 중단된 후 #note("Bnat")으로 이어진다. 배런의 경우 16분음표로 세분화된 리듬을 사용하기 때문에 온음계 윤곽의 음은 8분음표의 강박에 위치한다.

#example("클리포드 브라운", 126)
#example("케니 배런", 127)

다음은 브라운의 또 다른 두 개의 예시이다.

#example("클리포드 브라운", 128)

#example("클리포드 브라운", 129)

도약은 다음 두 예시를 흥미롭게 만든다. 에반스는 #chord("V7") 화음의 $flat 9$으로 도약하며, 캐넌볼은 #chord("ii") 화음의 3도에서 9도로 도약한다.

#example("빌 에반스", 130)

#example("캐넌볼 애덜리", 131)

하렐은 반음계적 접근 전에 #chord("ii") 화음의 아르페지오(5-7-9-11)를 사용한다. 이러한 확장된 아르페지오 음은 #chord("ii") 화음에 앞서 중첩된 #chord("vi") 화음으로 해석될 수 있으며, 9도와 11도는 #chord("ii") 화음의 3도에 대한 상·하위 이웃음으로 설명될 수 있다.

#example("톰 하렐", 132)

하렐은 극적인 효과를 위해 도약을 사용한다. 첫 번째 예시에서는 옥타브 도약을, 두 번째 예시에서는 #chord("E7") 화음의 3도에서 5도로 내려가는 도약을 사용한다. 두 번째 예시에서는 목표음이 첫 번째 마디의 세 번째 박자, 두 번째와 세 번째 마디의 첫 번째 박자에 나타난다. 마지막 마디에서는 목표음이 첫 번째 음과 마지막 음에 위치하지만 서로 다른 음역에서 연주된다.

#example("톰 하렐", 133)

#example("톰 하렐", 134)

== 제1윤곽과 이중 반음계적 접근음

처음 보기에는 #chord("Cm7") 위에서 #chord("C#")과 #chord("Enat")이 잘 어울린다는 것이 설명하기 어려워 보일 수 있다. 화성을 수직적으로만 본다면 이러한 음들은 어울리지 않을 수 있다. 그러나 화성을 선형적으로 바라보면, 이 음들이 목표음을 가리키며 긴장과 해소를 만들어 선율을 더욱 흥미롭게 만든다는 것을 알 수 있다. 다음 세 가지 예시는 #chord("ii") 화음의 목표음보다 온음 위와 아래에서 반음계적 접근음을 사용하는 예시를 보여준다. #chord("Cm7") 위에서 #note("C#")은 #note("D")를 거쳐 #note("Eb")으로 이끌고, #note("Fnat")은 #note("Enat")을 거쳐 #note("Eb")으로 하강한다. 브라운이 목표음인 #note("Eb")에 도달한 후 #chord("Cm7") 화음을 아르페지오(3-5-7-9)로 연주하는 부분에 주목하라. 이는 하행 음계 아이디어를 중단시키고, 두 번째 마디의 두 번째 박자까지 #chord("F7") 화음으로의 해결을 지연시킨다.

#example("클리포드 브라운", 135)

#example("소니 롤린스", 136)

#example("톰 하렐", 137)

== 제1윤곽과 C.E.S.H.

다음 예시들은 모두 유사한 반음계적 발전을 공유한다. 온음계 음만 사용하면 제1윤곽은 #chord("ii") 화음의 3도에서 시작하여 7도로 하강한 후, #chord("V") 화음의 3도로 이어진다. 이 예시들(그리고 앞선 몇몇 예시)은 하나의 반음계적 음을 추가로 포함하는데, 그것은 #chord("ii") 화음의 이끎음이다. #note("C")장조의 #prog("ii", "V") 진행에서 반음계적 진행은 #note("D")-#note("C#")-#note("C")-#note("B")가 된다.

#align(center)[#autoimg("figures/fig_138.svg")]

반음계적으로 변형한 음은 선율의 하강을 멈추게 한다. 이는 #chord("ii") 화음의 이끎음이기 때문에 상행으로 끌어당기는 역할을 한다. 이 음은 종종 순간적으로 선율의 방향을 바꾸며, #chord("ii") 화음의 근음을 둘러싼 후(온음계적 상위 이웃음과 반음계적 하위 이웃음을 사용하여) 온음계 음을 따라 하강하고, 마지막으로 #chord("V") 화음의 3도로 해결된다. 제리 코커와 다른 이들은 이러한 선율을 #sans[정적 화성의 반음계적 발전]#sub[C.E.S.H.]이라고 부른다. 이러한 유형의 반음계적 발전은 세 가지 윤곽 모두에서 발견된다.

이 예시는 #chord("Bm") 화음으로의 반음계적 이끎음을 도입하여 선율의 방향을 바꾸고, #note("B")를 온음계적 상위 이웃음과 반음계적 하위 이웃음으로 둘러싼 후 음들을 따라 #note("G#")으로 하강하는 과정을 보여준다.

#example("부커 리틀", 139)

버드는 목표음인 3도를 강박에 정확히 연주한다. #note("F") 앞의 음은 #chord("Abm")의 7도이며, #note("Cb") 이후에 #note("Gnat")을 사용하여 #note("Ab")을 예시 91과 같이 둘러싼다.

#example("도널드 버드", 140)

다음은 부커 리틀의 연관된 두 개의 예시이다. 예시 93에서 그는 첫 번째 목표음으로 올라가기 전에 온음계를 사용한다. 이후 반음계적 7도(#note("Bnat"))를 중심축음으로 사용한다. 온음계적 7도(#note("Bb"))는 예상되는 #note("Anat") 대신 나타나 해결을 지연시키며 계류를 만든다. #note("Bb")은 온음계적 상위 이웃음이며, #note("G#")은 #note("A")에 대한 반음계적 하위 이웃음이다. 선율은 하행하여 으뜸화음의 목표음으로 해결된다. 예시 94는 목표음에서 시작하여 거의 동일한 방식으로 하강한다. 단, 리듬이 변경되어 #note("Dnat")이 첫 번째 박자에 위치한다.

#example("부커 리틀", 141)

#example("부커 리틀", 142)

예시 95의 목표음은 모두 첫 번째 박자에 위치하며, 7도가 그 전에 나타난다. 파머는 #note("Bnat")을 사용하여 방향을 잠시 바꾸며 #note("C")를 둘러싸고, (#note("Bb")단조에서 차용한) #note("Gb")과 #note("Enat")$$(LNT)을 사용하여 #note("F")를 둘러싼 후 목표음인 #note("D")로 하강한다.

#example("아트 파머", 143)

하렐은 예시 96을 예시 93과 유사한 픽업음으로 시작한다. 첫 번째 마디의 마지막 음은 목표음 #note("A")로 이어지는 온음계적 7도이다. #note("A")는 #chord("F7") 화음에서 두 번 등장하며, 첫 번째와 세 번째 박자의 강박에 위치한다. 다시 한 번 7도(#note("Eb"))가 3도(#note("D")) 앞에 나타나 첫 번째 박자에 도달한다. 예시 97의 첫 번째 마디에서 각 강박에 위치한 음들은 단순한 온음계 윤곽을 형성한다. 하렐이 #note("F#")을 사용하여 #note("G")를 가리키고, #note("Dnat")을 중심축음으로 사용하는 방식에 주목하라. 예시 98은 예시 97과 유사하지만, 이번에는 #chord("C7") 화음으로의 해결이 지연된다.

#example("톰 하렐", 144)

#example("톰 하렐", 145)

#example("톰 하렐", 146)

하렐의 이 예시에서는 #chord("ii") 화음을 미리 연주한다. #chord("Db7") 화음 위에서는 같은으뜸음조인 #note("F#")단조에서 차용한 음(#note("A"), #note("E"), #note("Dnat"))을 사용한다.

#example("톰 하렐", 147)

처음 보기에는 예시 100이 복잡해 보일 수 있지만, 제1윤곽에 기반하고 있다. 목표음에서 시작하여 상승한 후 목표음을 한 옥타브 위에서 다시 연주한다. 선율의 나머지 상부 음들은 윤곽을 따른다. 하부 음들은 #note("D")로 가는 반음계적 이끎음과 7도 주변에서 움직이며 마침내 #chord("V7") 화음의 목표음인 #note("Bnat")로 해결된다.

#example("랜디 브레커", 148)

예시 101에서 끊어진 3도들은 이웃음들의 연속처럼 보인다. 첫 번째 음들은 아마도 앞선 #chord("GM") 화음에 속할 것이다. 첫 번째 마디의 마지막 두 음은 #chord("Cm")$$(#chord("ii"))의 3도와 7도로 가장 명확하다. 7도(#note("Bb"))는 예상치 못하게 #note("Bnat")으로 해결되며, 이것이 길게 지속되는 것은 그 의외로움을 더한다. 이후 #note("C")를 둘러싸며 음계를 따라 하강한다. 첫 번째와 두 번째 박자의 음들은 #chord("F7") 화음의 비화성음이지만, 다음 세 개의 강박 음들은 명확하게 하강하는 #chord("F") 삼화음을 이룬다.

#example("클리포드 브라운", 149)

허버드는 #chord("ii") 화음을 미리 예고하며, #note("Bnat")을 사용하여 선율의 방향을 바꾸고 #note("Bb")을 연주한 후 #chord("I") 화음의 3도로 하강을 이어간다. #chord("F7") 화음의 목표음은 세 번째 박자에, #chord("Bb") 화음의 목표음은 첫 번째 박자에 위치한다. #note("Gb")은 같은으뜸음조인 #note("Bb")단조에서 차용한 음으로, 익숙한 증2도 소리를 만들어낸다. #note("G")를 내림으로써 선율에 더 강한 하강하려는 힘을 부여하여, #note("Gb")은 #note("F")로 강하게 끌어당긴다. 이 선율에서는 두 개의 반음계적 음 사이에 흥미로운 균형이 있다. 올려진 #note("Bnat")은 선율을 상승시키고, 내려진 #note("Gb")은 선율을 하강시킨다.

#example("프레디 허버드", 150)

== 제1윤곽과 반음계적·리듬적 복잡성

다음에 살펴볼 여러 예시들은 앞선 예시들보다 더 많은 반음계적 요소를 포함하고 있다. 이러한 반음계적 요소는 이전에 논의된 전통적인 범주에 속하며, 일부는 리듬적으로 더 복잡할 뿐이다.

먼저, 이 예시는 목표음을 가리키며 시작하고, 마지막 음인 7도가 다음 강박에서 예상대로 #chord("V7") 화음의 3도, 즉 다음 목표음으로 해결된다는 점에 주목하라. (내림표로 기보된) 두 개의 변형된 음은 온음계 음들 사이에서 하강하며, 온음 간격을 메우는 반음계적 경과음이다.

#example("디지 길레스피", 151)

배런은 목표음에 대한 상·하위 이웃음으로 시작한다. #chord("F7") 화음 위의 내림표가 붙은 음들은 다음에 나올 #chord("Bbm")를 예고한다. #note("Ab")과 #note("Gb")은 선율에 더 강한 하강 동력을 부여한다. 목표음들은 여전히 강박이나 강박 근처에 위치한다.

#example("케니 배런", 152)


잭슨은 이 두 유사한 예시에서 목표음으로 시작하여 아르페지오 음으로 채운다. 예시 105는 두 번째 목표음(#note("B"))을 둘러싸고 마지막 목표음(#note("E"))에 반음계적으로 접근한다. 모든 목표음은 강박에 위치한다. 예시 106은 더 많은 반음계적 요소를 포함하고 목표음 #note("B")의 등장을 지연시킨 뒤, 7도에서 마지막 음으로 하강한다. 두 예시 모두에서 잭슨은 딸림화음의 9도를 변형하였다.

#example("밀트 잭슨", 153)

#example("밀트 잭슨", 154)

예시 107의 첫 번째 마디에는 반복 구절이 있다. 선율은 목표음(#note("Bb"))에서 시작하여 한 음 내려가고, 아래에서 반음계적으로 접근하여 다음 음에 도달한 후 같은 방식으로 진행하여 두 번째 마디의 강박에서 목표음 #note("E")에 도달한다. 다음 마디는 반음계 음계이지만 여전히 화성적으로 명확하다. 모든 강박에 위치한 음들은 딸림9화음의 아르페지오(#note("E")-#note("G")-#note("Bb")-#note("Db"), 3-5-7-$flat$9)를 형성한다. 이 예시에서는 12개의 반음계 음이 모두 사용되었지만 여전히 화성적으로 명확하다. 무작위적인 반음계가 아니라는 것이다. 목표음은 리듬적으로 중요한 위치에 있고, 반음계 비화성음은 예상된 시간과 장소에서 해결된다.

#example("도널드 버드", 155)

예시 108의 첫 번째 음은 목표음이다. 하렐은 이를 한 옥타브 위에서 다시 연주하고, 반음계적 음(#note("C#")) 하나만 추가한 후 7도를 거쳐 딸림화음의 3도로 하강한다. 두 번째 마디에서 한 음씩 건너뛰면서 보면, 8분음표가 모두 화성음이기에 선율은 여전히 잘 들린다.

#example("톰 하렐", 156)

예시 109는 예시 108과 동일한 곡에서 나온 유사한 선율이다. 진행은 유사하지만 이번에는 #chord("CM")으로 해결된다. 첫 번째 마디의 네 번째 박자에서 (#chord("Cm")를 구성하는 #note("Eb")는 제외하고) 변형되지 않은 윤곽이 시작된다. 이 윤곽은 두 번째 마디의 두 번째 박자의 약박에서 반복된다. 마지막 음은 #note("C")장조의 목표음이며 #chord("G7")의 7도를 통해 위에서 접근한다.

#example("톰 하렐", 157)

하렐은 목표음에 상·하위 이웃음으로 둘러싸며 접근한다. 윤곽의 다음 음은 옥타브 이동되어 두 번째 마디의 강박에 위치한다. 강박에 위치한 첫 번째 목표음은 두 번째 마디의 세 번째 박자에 나타난다. 마지막 마디에서는 윤곽이 바뀌지 않은 형태로 나타나며, 이전의 모호한 구절과 균형을 이룬다.

#example("톰 하렐", 158)

에반스는 #note("F")장조에서 #prog("V7/V","V7") 진행 위에 윤곽을 사용한다. 그는 목표음인 3도에서 시작하여 #chord("C7")의 3-5-7-9 아르페지오에 일찍 도달한다. 캐넌볼은 #chord("C7")과 #chord("F7")에서 목표음에 늦게 도달한다.

#example("빌 에반스", 159)

#example("캐넌볼 애덜리", 160)

반음계적 음을 추가하면 선율에 색채가 더해지고 리듬적으로 더욱 풍부해진다. 이러한 음들은 목표음의 해결을 지연시키거나 예고하여 재즈 스타일에 고유한 흥미로운 강세를 만든다. 다음 두 예시는 단순한 윤곽에 반음계적 꾸밈음을 추가하여 선율을 어떻게 생동감 있게 만드는지 보여준다. 예시의 핵심은 단순한 온음계 하강 윤곽이다. 4분음표로 구성된 윤곽만 연주한 후 두 예시 중 하나를 연주하면 그 관계가 명확하게 들린다.

파커는 윤곽을 시작하고 다시 시작하여 두 번째 박자의 약박에 악센트를 만든다. 그는 #chord("ii") 화음 위에서 C.E.S.H.를 연주하며 #note("Bnat")로 #note("Bb")과 #note("A")로의 해결을 지연시킨다. 두 번째 마디의 강박에서 목표음을 피하고 목표음을 가리키는 두 음을 연주한다. 목표음은 상·하위 이웃음 이후에 들리며 두 번째 마디의 두 번째 박자에 악센트를 만든다. 두 번째 마디의 네 번째 박자에는 아래로부터 반음계적으로 접근됨으로써 딸림화음의 근음이 악센트를 받는다. 세 음이 마지막 목표음 #note("D")를 가리키며, 이는 세 번째 마디의 세 번째 박자에 이르러서야 나타난다. #note("Eb")은 상위 이웃음이고 #note("C")와 #note("C#")은 아래에서 접근한다. 오선 위에 화살표로 표시한 선율의 상위 음들은 단순한 온음계 윤곽을 형성한다. 오선 아래에 화살표로 표시한 하위 음들은 일부 낮은 음들에 의해 암시된 대위선율을 형성하여 복합선율이 된다. 첫 번째 마디의 마지막 음 #note("G")는 #note("G#")으로 상승한 후 두 번째 마디에서 목표음 #note("A")로 이어진다. 두 번째 마디의 마지막 음 #note("A")는 #note("Bb")-#note("C")-#note("C#")으로 상승하여 목표음 #note("D")로 이어진다. 하위 대위선율은 네 번째 박자의 약박에서 시작하여 목표인 3도로 올라가며, 나머지 선율은 내려가는 대칭을 보인다.

#example("찰리 파커", 161)

갈랜드는 확장된 반음계 선율에서 #prog("ii", "V7", "I", "V7/ii", "ii") 진행의 각 화음의 3도를 목표로 한다. 12개의 음이 모두 사용되었으나 선율은 여전히 화성적으로 명확하다. 선율은 동일한 목표음에서 시작하여 끝난다. 여섯 번 온음계 음이 반음계적 경과음을 통해 온음 아래에서 접근된다. #chord("F7"), #note("Bb"), #chord("G7")의 목표음(각각 #note("A"), #note("D"), #note("Bnat"))은 동일한 방식으로 접근된다. 선두의 7도는 아르페지오 음으로 하강한 후 반음계적으로 상승하여 목표음에 도달한다. 목표음 이후 세 번의 극적인 도약이 발생한다. #chord("Cm")의 3도는 5도를 향해 아래로 도약하며, #chord("F7")의 3도는 5도를 향해 아래로 도약한 후 아르페지오로 상승한다(3-5-7-9). #chord("G7")의 3도는 $flat 9$로 도약하며 하강 음계를 옥타브 이동(#note("B")-#note("A"))시킨다.

#example("레드 갈랜드", 162)

새롭게 윤곽의 리듬이 배치된 예시 113과 114에서 단순한 윤곽의 음들만을 연주해도, 반음계적 요소가 추가되지 않은 상태에서도 흥미롭게 들린다. 지금까지는 꾸밈음과 추가 요소를 통해 단순한 윤곽이 어떻게 더 흥미로워지는지를 보았다. 반대로, 삽입된 음, 장식음, 꾸밈음을 들어낸 채로, 원래 윤곽의 음들을 재배열하는 것만으로도 흥미로운 선율을 만들어낼 수 있다는 것도 사실이다. 반음계적 요소가 제거된 갈랜드의 선율은 그 리듬이 펑크 스타일에 더 잘 어울린다.

#align(center)[#autoimg("figures/fig_163.svg")]

== 제1윤곽과 여러 윤곽의 조합

윤곽이 재즈 즉흥 연주에서 매우 흔하게 사용되므로, 여러 윤곽이 결합된 경우를 보는 것은 드문 일이 아니다. 예시 115에서 찰리 파커는 동일한 윤곽을 두 개의 음역에서 연주한다. 목표음은 강박에 위치하지 않지만, 선율에서 가장 높고 가장 낮은 음이 주요 목표음이다.

#example("찰리 파커", 164)

테너 4대를 위한 이 곡의 브릿지에서 나온 이 예시는 윤곽을 순차적으로 사용한 예시이다. 진행은 다음과 같다.

$ prog("ii", "V7", "iii", "V7/ii", "ii") $

첫 번째 마디에는 추가한 음이나 꾸밈음이 없다. #chord("V7") 화음을 아르페지오(3-5-7-9)로 연주한 윤곽 변형이다. 두 번째 마디는 옥타브 이동을 포함한 하강 음계 변형이다. 한 음(#note("E"))과 아르페지오 음이 추가되어 마지막 목표음 #note("F")로의 해결이 리듬적으로 지연된다.

#example("지미 주프리", 165, subtitle: ["Four Brothers" (헤드)])

이 예시는 파커의 대표적인 선율이다. 이 예시는 다른 여러 파커의 솔로에서도 찾을 수 있다. 첫 번째 마디는 옥타브 이동을 포함한 하강 음계 변형(3도에서 $flat 9$으로 도약)이다. 두 번째 마디에서는 #chord("Cm") 화음을 3도에서 아르페지오(3도에서 5도를 향해 아래로 도약)로 연주한 후 목표음 #note("A")로 하강하고, #chord("F7") 화음을 아르페지오로 연주한다. 네 번째 박자에서 추가된 #note("Bb")과 #note("G") 음을 보상하기 위해 리듬이 압축된다. 진행은 다음과 같다.

$ underbracket(prog("iii"), upright("I")text("의 대체"))#h(-8pt)-prog("V7/ii", "ii", "V7", "I") $

#chord("ii") 화음(#chord("Cm7"))으로 전조하고 으뜸음화하기 위해 #chord("G7"), 즉 부딸림화음이 사용되었다. #note("Bb")$$(내림표 2개)에서 #note("C")단조(내림표 3개)로 전조하려면 두 개의 반음계적 변화가 필요하다. #note("A")를 #note("Ab")으로, #note("Bb")을 #note("C")단조의 이끎음인 #note("Bnat")로 바꾸는 것이 그것이다. 이 두 반음계적 음이 파커가 #chord("G7") 화음 위에서 처음 연주하는 음이다.

#example("찰리 파커", 166)

예시 118에서는 두 가지 다른 화성 리듬으로 제1윤곽을 순차적으로 사용한 예시가 있다. 첫 번째 마디는 두 개의 단순한 돈꾸밈음을 더한 기본 윤곽이다. 두 번째 마디는 목표음에서 한 옥타브 위의 음으로 도약하여 시작된다. #note("G#")을 사용한 반음계적 돈꾸밈음이 윤곽을 길게 늘려 더 긴 화성 리듬에 맞춘다. 모든 화음의 3도는 강박에 위치하며, 각각 약박에서의 7도에 뒤따른다.

#example("클리포드 브라운", 167)

재즈 왈츠에서 한 마디에 두 개의 화음이 있을 때 두 번째 화음을 어디에 연주할지에 대한 문제가 있다. 이를 세 번째 박자에 연주할 수 있지만, 재즈에서는 종종 두 번째 박자의 약박에 연주된다. 두 번째 화음이 두 번째 박자의 약박에 도달하면 마디가 절반으로 나뉜다. 이렇게 나눌 경우 한 마디가 세 박자 대신 두 박자로 이루어져 있음을 암시한다. 이는 $3/4$의 단순 3박자#sub[simple triple] 위에 복합 2박자#sub[compound duple] $6/8$가 겹쳐지는 것을 의미한다. 에반스는 첫 번째 마디를 절반으로 나누고 #chord("C7") 화음을 두 번째 박자의 약박에 위치시킨다. 두 번째 마디에서는 #chord("Bb") 화음이 세 번째 박자에 도달한다.

#example("빌 에반스", 168)

다음 예시들은 특히 서로 다른 유형의 두 윤곽이 등장한다.

나바로는 두 개의 반음계적 #maj25 진행 위에 제1윤곽을 연주한 후 경과음을 포함한 제2윤곽을 연주한다.

#example("패츠 나바로", 169)

같은 #maj25 진행 위에서 파커는 반음계적 픽업음으로 시작하여 제2윤곽을 연주한 후 제1윤곽을 연주한다.

#example("찰리 파커", 170)

브라운은 첫 번째 단순한 (제1)윤곽을 첫 번째 목표음에 대한 상·하위 이웃음으로 시작하여 리듬적으로 이동시킨다. 두 번째 마디에서 (제3윤곽이 시작되는) #note("G")로의 반음계적 픽업음이 선율을 제자리에 돌려 놓아 #chord("Cm7")의 7도와 #chord("F7") 화음의 목표음 #note("A")가 예상한 위치에 도달하도록 한다. 더 많은 반음계적 픽업음이 마디를 채워 #note("Eb")이 네 번째 박자의 약박에 도달하고 #note("D")가 강박에 위치하도록 한다. 리듬적 이동은 이 선율을 흥미롭게 만드는 요소 중 하나이다. 추가된 음들이 리듬적 흥미를 만든 것인가, 아니면 리듬적 이동이 추가적인 음을 필요로 한 것인가?

#example("클리포드 브라운", 171)

이 마지막 조합은 파커가 #note("Ab")장조에서 잘 알려진 비밥 곡에서 연주한 솔로의 일부이다. 진행은 #note("Ab")장조에서 #prog("iii7", "V7/ii", "ii7", "V7", "I")이다. 첫 번째는 제1윤곽, 두 번째는 제3윤곽이다. 딸림화음들은 3도에서 $flat 9$으로 도약한 후 다음 화음의 5도로 반음계적으로 접근한다는 동일한 패턴을 가진다.

#example("찰리 파커", 172, subtitle: ["Donna Lee" (_The Complete Savoy Sessions_)])

#exercisebox[
  + 위의 예제에서 사용된 유사한 기법을 활용하여 자신만의 선율을 만들어보라.
	+	위의 예제 중 일부를 모든 조에서 연주할 수 있도록 학습하라.
	+	스탠다드 재즈 진행에 대한 솔로를 작성하고 위의 예제를 일부 포함하라. 솔로를 연습곡처럼 연습하라.
	+	스탠다드 진행 위에서 즉흥 연주를 시도하며, 솔로에 위의 예제를 활용하라.
	+	위의 예제를 변형해 보라. 더 많은 음을 추가하거나, 리듬을 이동시키거나, 분절화#sub[fragmenting]하는 등으로 자신만의 선율을 만들어 보라.
	+	제1윤곽을 반복하며, 모든 장조와 단조에서 마디선을 넘어 3도를 미리 연주#sub[anticipating]하는 연습을 하라.

    #align(center)[#autoimg("figures/fig_173.svg")]
]

#chapter("제2윤곽", l: "chap5")

== 간단한 형태의 제2윤곽

다음은 잘 알려진 재즈 곡에서 제2윤곽이 사용된 예시이며, 이어서 같은 곡에 대한 웨스 몽고메리의 연주에서 나온 꾸밈이 예시로 제시된다. 몽고메리는 픽업음으로 화성음을 사용하고, 셋잇단음표와 목표음 #note("C")로의 반음계적 접근을 활용한다.

#example("텔로니어스 몽크", 174)

#example("웨스 몽고메리", 175)

다음은 여러 아티스트가 연주한 단순한 형태의 제2윤곽이다.

#example("클리포드 브라운", 176)

#example("클리포드 브라운", 177)

#example("폴 챔버스", 178)

#example("소니 스팃", 179)

#example("존 콜트레인", 180, subtitle: ["Giant Steps" (_Giant Steps_)])

#example("톰 하렐", 181)

이 둘은 반음계적 경과음을 통해 #chord("V7") 화음의 7도까지 하강한다.

#example("찰리 파커", 182)

#example("톰 하렐", 183)

다음은 단순한 형태로 제시된 제2윤곽의 추가 예시들이다.

#example("클리포드 브라운", 184)

#example("빌 에반스", 185)

#example("캐넌볼 애덜리", 186)

#example("톰 하렐", 187)

예시 137의 톰 하렐처럼 애덜리는 #chord("ii") 화음을 미리 예고한다.

#example("캐넌볼 애덜리", 188)

파커는 목표음 #note("B")를 겨냥하기 전에 아르페지오를 7도 너머 9도까지 확장하여 두 번째 마디의 세 번째 박자에 목표음에 도달한다.

#example("찰리 파커", 189)

== 단조에서의 제2윤곽

모든 윤곽은 단조에서의 #min25 진행에서도 장조에서와 마찬가지로 잘 작동한다. 앞서 설명한 것처럼, 이러한 윤곽은 근음이 완전 5도로 하강하는 모든 진행에 적용할 수 있다. 예시 140은 #note("C")단조를 가리키지만 #note("C")장조로 해결된다. 히스는 #chord("C")의 장3도에 도달한 후 화음을 아르페지오(3-5-7-9)로 연주하지만, 상행하기 전에 5도로 하강한다.

#example("지미 히스", 190)

#example("아트 파머", 191)

== 제2윤곽과 음의 추가

모든 음악적 동기는 음을 추가함으로써 꾸밀 수 있다. 음은 동기 이전, 동기 내에, 그리고 동기 이후에 추가할 수 있다.

톰 하렐의 다음 세 가지 예시는 모두 윤곽 내에 추가된 음을 포함한다. 추가된 음은 #chord("ii") 화음의 3도에 대한 상·하위 이웃음이다. 이는 선율에 리듬적, 선율적 에너지를 더한다. 그는 목표음을 둘러싸는 방식을 선택하여 약간의 긴장감과 모호함을 만들어낸다. 예시 144에서 아르페지오는 먼저 하행하는 형태로 나타난 후 첫 번째 마디 네 번째 박자부터 상행 형태로 시작되며, 추가된 음이 포함된다. #note("C")와 #note("A")가 #note("Bb")을 둘러싸고, #note("C")는 #note("Bb")과 #note("D") 사이의 경과음 역할을 한다. 나머지 윤곽은 변형되지 않았다.

#example("톰 하렐", 192)

#example("톰 하렐", 193)

#example("톰 하렐", 194)

다음 예시들은 윤곽 이전에 추가된 픽업 노트로 시작한다. 애덜리와 스팃은 반음계적 이끎음으로 시작한다. 롤린스는 아르페지오 음과 #chord("F7") 화음의 3도의 반음계적 접근음들로 시작한다. 브라운은 #chord("Bm")에 대해 흥미로운 색채 음을 사용한다. #note("G#")은 전체 선율이 #chord("Bm")보다 #chord("E7")과 더 관련이 있는 것처럼 보이게 한다.

#example("캐넌볼 애덜리", 195)

#example("소니 스팃", 196)

#example("클리포드 브라운", 197)

#example("소니 롤린스", 198)

스팃은 반음계적 이끎음으로 시작한다. 두 번째 마디의 윤곽 음들은 온음 아래에서 반음계적으로 접근한다.

#example("소니 스팃", 199)

길레스피는 화성적으로 명확하지 않은 몇 개의 반음계적 픽업음으로 시작한 후, #chord("ii") 화음을 두 번 아르페지오로 연주하고, 마침내 #chord("V7") 화음의 목표 음(#note("B"))으로 해결한다.

#example("디지 길레스피", 200)

== 제2윤곽과 경과음

=== 단순 경과음

제2윤곽은 아르페지오 윤곽이기 때문에 화성음 사이에 온음계 경과음을 사용하는 데에 적합하다. 그러나 #chord("ii") 화음의 5도와 7도 사이에는 거의 경과음이 사용되지 않는다. #chord("ii") 화음의 5도와 7도 사이의 음은 #chord("V7") 화음의 목표 음이다. 이 음은 보통 #chord("V7") 화음을 위해 남겨둔다. 이는 이야기의 결말을 미리 알려주지 않고 마지막에 드러내는 펀치라인이다. 이 예시들이 마디 내에 어디에서 시작하느냐에 따라 유사성과 차이가 어떻게 결정되는지 주목하라.

#example("클리포드 브라운", 201)

#example("클리포드 브라운", 202)

#example("리 모건", 203)

#example("소니 스팃", 204)

#example("패츠 나바로", 205)

#example("톰 하렐", 206)

#example("톰 하렐", 207)

#example("톰 하렐", 208)

하렐은 예시 130에서 콜트레인이 사용한 것과 동일한 윤곽을 사용하지만, 경과음을 추가하였다.

#example("톰 하렐", 209)

=== 경과음과 픽업음

다음 윤곽들은 모두 경과음을 포함하며 추가된 픽업음으로 시작한다. 한 개의 온음계 음이 추가된 경우:

#example("캐넌볼 애덜리", 210)

두 개의 온음계 음이 추가된 경우:

#example("클리포드 브라운", 211)

하위 이웃음이 추가된 경우:

#example("클리포드 브라운", 212)

#example("톰 하렐", 213)

도피음#sub[escape tone]이 추가된 경우:

#example("빌 에반스", 214)

상하위 이웃음으로 둘러싸는 경우:

#example("캐넌볼 애덜리", 215)

#example("톰 하렐", 216)

브라운은 화성음으로 시작하여 #note("C")단조의 딸림화음(#chord("G7"): 셋온음#sub[tritone] #note("F")와 #note("Bnat")로 암시됨)을 제시한 후, 경과음을 포함한 제2윤곽을 연주한다. #chord("F7") 화음의 목표음은 세 번째 박자까지 지연된다. #chord("Bb") 화음이 예상될 때 #note("Enat")이 얼마나 효과적인지, 그리고 그 '잘못된' 음이 바로 삼화음으로 이어지는 것에 주목하라.

#example("클리포드 브라운", 217)

=== 경과음과 제2윤곽의 아르페지오 확장

다음 두 예시는 클리포드 브라운의 유사한 예시이다. 둘 다 픽업음으로 시작한다. 첫 두 박자의 음은 온음계 음이며, 이는 예시 168에서는 아르페지오 음으로, 예시 169에서는 아르페지오 음과 반음계적 이끎음으로 끊어진다. 예시 168은 아르페지오를 #chord("ii") 화음의 9도까지 확장한다.

#example("클리포드 브라운", 218)

#example("클리포드 브라운", 219)

톰 하렐의 같은 솔로에서 나온 세 개의 예시는 유사한 소재가 어떻게 다른 방식으로 반복될 수 있는지를 보여준다. 처음 두 개의 예시는 #chord("ii") 화음의 근음에서 시작하여 경과음과 함께 윤곽을 따라 진행한 후, #chord("ii") 화음의 이끎음(#note("G#"))을 지나 9도까지 확장한 후 #chord("D7") 화음의 3도로 다시 하강한다. 세 번째 예시는 목표 음을 일찍 연주하지 않는 '규칙'을 깨뜨린다. #note("F#")은 #chord("D7") 화음 이전에 경과음으로 나타나지만, 선율이 #chord("ii") 화음의 9도까지 확장되면서 부정적인 효과가 줄어든다.

#example("톰 하렐", 220)

#example("톰 하렐", 221)

#example("톰 하렐", 222)

이 예시에서 하렐은 #chord("ii") 화음의 근음에서 9도까지 음계를 따라 올라가며 #chord("F7") 화음의 목표 음(#note("Anat"))을 사용한다. 9도(#note("D"))는 근음(#note("C"))의 상위 이웃음이 되어 이를 둘러싼 후, 윤곽이 높은 음역에서 연주된다. 윤곽은 높은 음역에서 #note("Anat")을 제외한 모든 온음계 경과음을 사용하며, #note("Anat")은 마지막에 사용된다.

#example("톰 하렐", 223, subtitle: [Amazon])

== 제2윤곽과 여러 윤곽의 조합

파커는 제2윤곽으로 시작하여 제1윤곽으로 끝맺는다. 파커의 여러 솔로에서 이 선율이 다양한 형태로 자주 등장하며, 파커의 제자인 소니 스팃의 솔로(예시 149)에서도 발견할 수 있다. 반음계적 접근음을 추가함으로써 상위 온음계 진행은 점4분음표마다 암시된 강세를 갖게 된다. 추가된 음들로 인해 두 번째 윤곽(제1윤곽)이 #chord("F") 마디까지 넘어가게 되며, 파커는 세 번째 박자에서야 #chord("C7")을 다룬다.

#example("찰리 파커", 224)

클리포드 브라운과 조세프 자비눌은 잇따르는 예시에서 제2윤곽을 사용한다. 세 가지 예시 모두 다음 진행을 따른다.

$ prog("iii", "V7/ii", "ii", "V7", "I") $

자비눌은 강박에 3도를 위치시키고, 이전 화음의 7도를 그 앞에 위치시킨다. 단 한 번을 제외하고 모든 경우에 이 패턴이 유지된다.

#example("클리포드 브라운", 225)

#example("조세프 자비눌", 226)

#example("클리포드 브라운", 227)

자비눌은 #prog("ii", "V") 진행 위에서 제2윤곽을 연주한 후 #prog("iii", "V7/ii") 위에서 제1윤곽을 연주한다.

#example("조세프 자비눌", 228)

브라운은 #note("Bb")장조에서 #maj36 위에서 제2윤곽을, #maj25 위에서 제3윤곽을 사용한다. #note("Bnat")에서 #note("Ab")으로의 도약(3도에서 $flat 9$)은 (특히 트럼펫에서) 음계를 내려가는 것보다 훨씬 극적인 효과를 준다. 각 딸림7화음의 3도는 상·하위 이웃음으로 둘러싸여 있다. #chord("F7") 화음은 해결이 지연된다.

#example("클리포드 브라운", 229)

예시 180은 제2윤곽으로 시작한다. #chord("A7") 화음의 3-5-7-9 아르페지오는 첫 번째 마디의 네 번째 박자에서 시작하지만, 3도에서 5도로 아래로 도약한 후 상행한다. #chord("Dm")의 목표음이 등장하지 않더라도 #maj25 위에 제1윤곽이 암시된다. #chord("V7")은 두 박자 일찍 도달한다. 마지막 두 마디에서는 #prog("V7", "I") 진행 위에 제1윤곽이 나타나며 #note("Bnat")에서 시작하여 #note("E")로 내려가고 #chord("CM")의 3-5-7-9 아르페지오로 확장된다. 이 예시에는 #chord("Em"), #chord("A7")과 #chord("C")의 3-5-7-9, #chord("G7")의 전위, 이렇게 총 네 개의 아르페지오가 있다. 이 중 #chord("A7"), #chord("G7"), #chord("CM") 아르페지오 세 개는 일찍 연주된다.

#example("클리포드 브라운", 230)

에반스는 빠른 화성 리듬이 있는 이 구절에서 세 개의 윤곽을 사용한다. #maj25 위에 제2윤곽, #maj36 위에 제3윤곽, #chord("Gm")를 세 개의 8분음표 앞당겨 예고하면서 #prog("ii", "V7/vi", "vi") 위에 제3윤곽을 사용한다.

#example("빌 에반스", 231)

제2윤곽은 보통 #chord("ii") 화음의 근음에서 시작하여 7도까지 아르페지오로 구성된다(1-3-5-7). 이 두 예시는 "'Round Midnight" 윤곽이 근음 대신 3도에서 시작하여 3-5-7-9로 아르페지오화되는 것을 보여준다.

#example("클리포드 브라운", 232)

#example("빌 에반스", 233)

== 제2윤곽과 방향 전환

"'Round Midnight" 윤곽의 방향이 바뀌는 여러 예시가 있다. #chord("ii") 화음의 아르페지오를 상행하는 대신, 아르페지오가 뒤집혀 하행 형태로 나타난다.

롤린스는 방향을 바꾸고 C.E.S.H.을 추가하여 이 예시에서 V7 화음의 해결을 지연시킨다. 이 예시는 자주 연주되는 블루스 헤드 선율에서 가져온 것이다.

#example("소니 롤린스", 234)

다음 예시들은 윤곽의 방향 변화가 특징이지만, 7도는 같은 옥타브에서 3도로 해결된다.

#example("톰 하렐", 235)

#example("빌 에반스", 236)

#example("프레디 허버드", 237)

해밀턴은 뒤집힌 윤곽을 순차적으로 사용한다. 진행은 원래 #prog("iii", "V7/ii", "ii", "V7", "I")였을 것이다. #chord("C#m7") 화음 자체는 #chord("G7") 대신 사용된 반음계적 경과화음이다.

#example("스콧 해밀턴", 238)

뒤집힌 윤곽은 반음계적 픽업음 이후에 나타난다. 챔버스는 이 솔로의 다른 부분에서 일반적인 버전의 윤곽을 연주하였다(예시 128 참조).

#example("폴 챔버스", 239)

이 두 예시는 양방향으로 진행한다. #chord("ii") 화음의 7도에서 시작하여 하행한 후 아르페지오로 상행한다. 미첼은 같은으뜸음조(#note("Bb") 단조)의 조표에서 가져온 변형된 9도를 #chord("F7") 화음 위에서 사용한다. 허버드는 #chord("Db7") 화음 위에서 윤곽을 엄밀하게 연주한다.

#example("블루 미첼", 240)

#example("프레디 허버드", 241)

“'Round Midnight” 윤곽은 이 확장된 C.E.S.H.의 핵심에 있다. 이는 #chord("ii") 화음 아르페지오의 (장7도[#note("E#")]와 단7도[#note("Enat")]을 모두 포함하는) 여러 상행 및 하행 구절 이후 두 번째 마디에서 간단한 형태로 나타난다.

#example("웨스 몽고메리", 242)

== 제2윤곽 조각

다음 예시들은 완전한 윤곽으로 간주하기에는 몇 개의 음이 빠져 있지만, 형상과 특성이 충분히 남아 있어 논의에 포함할 수 있다.

다음 세 예시에서는 첫 번째 음이 생략되었다. #chord("ii") 화음의 근음이 빠져 있다. 하렐은 아마도 #note("F")로 향하는 이끎음으로 들릴 다른 음을 연주한다. 에반스와 롤린스는 첫 번째 음을 생략하고 3도에서 시작한다. 이러한 생략은 선율의 명확성을 전혀 손상시키지 않으며, 오히려 모두 목표음(#chord("ii") 화음의 3도)을 더욱 강조하고 화음의 근음은 베이스가 담당한다. 7도는 약박에 나타나고, 그 뒤에 강박에서 3도가 등장한다.

#example("톰 하렐", 243)

#example("빌 에반스", 244)

#example("소니 롤린스", 245)

다음 세 예시는 윤곽의 첫 두 음이 없다. 하렐은 제2윤곽의 조각으로 시작하고 제1윤곽으로 마무리한다.

#example("톰 하렐", 246)

브라운은 이 조각을 두 가지 방식으로 연주한다. 첫 번째에서는 4분음표와 두 개의 8분음표로 만들어진 멈췄다 가는 느낌을 주며, 두 번째는 반음계적 하위 이웃음을 사용하여 연주한다.

#example("클리포드 브라운", 247)

#example("클리포드 브라운", 248)

#exercisebox[
  + 위의 예제에서 사용된 유사한 기법을 활용하여 자신만의 선율을 만들어보라.
  +	위의 예제 중 일부를 모든 조에서 연주할 수 있도록 학습하라.
  +	스탠다드 재즈 진행에 대한 솔로를 작성하고 위의 예제를 일부 포함하라. 솔로를 에뛰드처럼 연습하라.
  +	스탠다드 진행 위에서 즉흥 연주를 시도하며, 솔로에 위의 예제를 활용하라.
  +	위의 예제를 변형해 보라. 더 많은 음을 추가하거나, 리듬을 이동시키거나, 분절화#sub[fragmenting]하는 등으로 자신만의 선율을 만들어 보라.
  +	제2윤곽을 반복하며, 모든 장조와 단조에서 마디선을 넘어 3도를 미리 연주#sub[anticipating]하는 연습을 하라.

    #align(center)[#image("figures/fig_249.jpg", width: 56%)]
]

#chapter("제3윤곽", l: "chap6")

== 단순한 형태의 제3윤곽

이 두 예시는 제3윤곽의 가장 단순한 형태로, 조만 다를 뿐 동일한 윤곽이다. 하렐은 (같은으뜸음조인 #note("F")단조에서 차용한) 딸림화음 위에서 $flat 9$을 사용하며, 이 윤곽을 연주한다.

#example("지미 주프리", 250)

#example("톰 하렐", 251)

다음 예시와 같은 화음 진행은 많은 재즈 곡에서 발견된다. #chord("ii") 화음이 #chord("V7")의 근음 위에서 연주되어 딸림화음이 계류하는 소리를 만들어낸다. 이 소리를 나타내는 코드의 일부를 나열하자면 다음과 같다. (#chord("C")의 딸림화음인 #chord("G")에 대해 나타냈다.)

#align(center)[
  #chord("G7sus"), #chord("G9sus"), #chord("Dm7/G"), #chord("Dm9/G"), #chord("F/G")
]

이 소리는 기본적으로 #chord("ii")와 #chord("V7") 화음이 함께 연주되는 것이기 때문에, 윤곽 중 어느 것이든 이 화음에 적합하다.

#example("톰 하렐", 252)

지금까지 살펴본 많은 예시에서 경과음, 반음계적 접근음, 이웃음, 빠른 16분음표 세분화가 추가되었다. 이 예시에서 롤린스는 간단한 리듬과 배치만으로 윤곽을 흥미롭게 만드는 방법을 보여준다.

#example("소니 롤린스", 253)

빌 에반스와 톰 하렐은 선율이 음계를 따라 계속 내려가는 윤곽 변형을 보여준다. 딸림화음 위에서 $flat 9$은 세 예시 모두에서 발견된다.

#example("빌 에반스", 254)

#example("빌 에반스", 255)

#example("톰 하렐", 256)

음계 하행과 옥타브 이동을 포함하는 제3윤곽의 두 번째 변형은 매우 일반적이며, 모든 장조 및 단조 키에서 많은 재즈 솔로에 등장한다. 아래에 표시된 예시는 콜트레인의 것으로, 다른 많은 연주자들이 연주한 것일 수도 있다. 딸림화음 위에서 3도에서 $flat 9$으로 도약하는 부분은 이 윤곽의 매력적인 요소 중 하나로, 복합선율의 특성을 부여한다. 첫 음과 마지막 네 음은 주된 선율처럼 들리며, 나머지 음들(두 번째부터 다섯 번째까지)은 보조 응답#sub[secondary answer] 또는 대위선율로 들린다.

#example("존 콜트레인", 257)

파커는 이 예시에서 리듬 변화를 추가하고 #note("F")로 향하는 반음계적 접근음을 사용한다.

#example("찰리 파커", 258)

다음에는 긴 선율 내에 단순한 형태의 제3윤곽이 등장한다. 미첼과 브라운의 두 번째 마디는 제2윤곽과 유사하다.

#example("클리포드 브라운", 259)

#example("블루 미첼", 260)

모건은 반음계적 경과음을 추가하고 더 긴 화성 리듬에 맞춰 리듬을 길게 늘린다. 모든 7도와 그 목표 3도는 예상되는 위치에 나타난다. 모건은 세 번째 마디 이전에 #note("Bnat")을 연주하는 것을 피함으로써 #chord("GM")로의 해결이 더 효과적으로 다가오게 만든다.

#example("리 모건", 261)

이 세 예시에서 #chord("ii") 화음은 미리 연주된다. 하렐은 ii 화음을 미리 연주하고 V7 화음을 마지막 마디까지 유지한다. 맥린은 #chord("Gm7") 화음을 미리 연주하고 #chord("C7")으로의 해결을 네 번째 박자까지 지연시킨다. 3-5-7-9 아르페지오가 선율을 #chord("F") 화음으로 급하게 이끌지만, 해결은 여전히 세 번째 박자까지 지연된다.

#example("빌 에반스", 262)

#example("톰 하렐", 263)

#example("재키 맥린", 264)

스팃은 상행 아르페지오로 시작하여 C.E.S.H.를 사용한 후, 두 번째 마디에서 단순한 제3윤곽을 연주한다. 방향 전환, 반음계적 요소, 그로 인한 강세가 이 예시를 더욱 흥미롭게 만든다.

#example("소니 스팃", 265)

== 제3윤곽과 C.E.S.H.

제3윤곽은 다른 윤곽보다 C.E.S.H.에 더 잘 맞는 것처럼 보이며, 반음계적 움직임이 종종 복합선율을 암시한다. 다음은 제3윤곽을 기반으로 한 여러 C.E.S.H. 예시이다. 일부는 C.E.S.H.를 사용하여 #chord("V7") 화음의 해결을 지연시키며, 일부는 C.E.S.H.를 사용하면서도 제시간에 #chord("V7")에 도달한다. 몇몇 예시(215, 216, 217, 218, 219, 221)는 하위 옥타브의 #chord("ii") 화음 5도를 중심축음으로 사용하여 선율에 톱니형을 더한다. 이 구절들에 등장하는 리듬적 다양성은 기본 윤곽이나 어떤 음악적 아이디어를 개인화하는 데 있어 리듬이 얼마나 중요한지를 보여준다.

#example("캐넌볼 애덜리", 266)

#example("톰 하렐", 267)

#example("클리포드 브라운", 268)

#example("클리포드 브라운", 269)

#example("리 모건", 270)

#example("찰리 파커", 271)

#example("프레디 허버드", 272)

이 두 예시는 방향 전환이 포함된다. 두 예시 모두 상행 아르페지오로 시작하지만 제2윤곽처럼 보이는 대신 제3윤곽으로 분류된다. 이유는 7도가 아르페지오 아래의 3도로 해결되기 때문이다. 이 구절에서 반음계적 선율(#note("G")-#note("F#")-#note("F")-#note("E")와 #note("F")-#note("E")-#note("Eb")-#note("D"))은 리듬적으로 거의 동일하며, 단독으로 연주할 때 흥미롭다.

#example("덱스터 고든", 273)

#example([전형적인 라틴 피아노 오스티나토#footnote[동일한 선율의 저음 악구를 계속해서 반복하는 음악적 기법]], 274, should-index: false)

윤곽의 시작에 자주 추가 음이 픽업음으로 추가된다.

톰 하렐과 케니 배런은 #chord("ii") 화음의 3도에서 선율을 시작하여 5도까지 음계를 따라 상행한다.

#example("톰 하렐", 275)

#example("케니 배런", 276)

허버드는 3도에서 반음계적으로 하강한 후 아르페지오로 상행한 후 윤곽을 시작한다. 이 C.E.S.H.를 예시 220과 비교해보라.

#example("프레디 허버드", 277)

파커는 #chord("ii") 화음의 근음을 중심으로 선율을 감싼 후 음계를 따라 상행하며 윤곽을 시작한다.

#example("찰리 파커", 278)

하렐은 예시 228에서 픽업 노트로 #chord("ii") 화음의 7도에서 시작한다. #maj25 진행 위에서 C.E.S.H.를 연주한 후, #chord("I") 화음 위에서도 또 다른 C.E.S.H.가 암시된다. 두 번째 마디의 #note("Fnat")은 보통 첫 번째 박자의 #note("E")로 해결된다. #note("F#")은 방향을 바꾸고 해결을 세 번째 박자까지 지연시킨다.

#example("톰 하렐", 279)

#example("톰 하렐", 280)

== 제3윤곽과 낮은 중심축음 (낮은 아르페지오 음)

하위에 추가된 한 음은 이 윤곽에 각진 느낌과 리듬적 흥미를 더한다. 이러한 형태는 여러 C.E.S.H. 예시(215, 216, 217, 218, 219, 221, 225, 226, 227, 228, 229)에서도 볼 수 있다. 아래는 제3윤곽 첫 음보다 낮은 옥타브에서 중심축으로 사용된 #chord("ii") 화음의 5도를 활용한 몇 가지 추가 예시이다.

#example("찰리 파커", 281)

#example("찰리 파커", 282)

#example("클리포드 브라운", 283)

#example("캐넌볼 애덜리", 284)

이 선율은 두 딸림7화음 모두에서 3도에서 근음으로 도약하는 대칭성을 가진다. 제3윤곽은 #chord("Fm7") 이전에 시작되지만 #chord("Bb7")에 제시간에 해결된다.

#example("클리포드 브라운", 285)

캐넌볼은 동일한 솔로에서 두 개의 조성 영역에서 동일한 선율을 사용한다.

#example("캐넌볼 애덜리", 286)

#example("캐넌볼 애덜리", 287)

== 제3윤곽과 여러 윤곽의 조합

이 조합은 #note("Ab")조의 잘 알려진 비밥 곡에서 파커의 솔로에서 나온 것이다. 첫 번째는 제1윤곽, 두 번째는 제3윤곽이다. 딸림화음들은 동일한 패턴을 가진다: 3도에서 $flat 9$으로 도약한 후 다음 화음의 5도로 반음계적 접근이 이루어진다. (이 예시는 예시 123으로도 등장했다.)

#example("찰리 파커", 288)

브라운은 첫 번째 단순한 (제1)윤곽을 상·하위 이웃음으로 시작하여 이동시킨다. 두 번째 마디에서 #note("G")로 가는 반음계 픽업음은 제3윤곽을 시작하며 선율을 제시간에 맞추어 되돌린다. 이로 인해 #chord("Cm")의 7도와 #chord("F7") 화음의 목표음 #note("A")가 우리가 예상한 위치에 도달하게 된다. 추가된 더 많은 반음계 픽업음은 마디를 채워서 #note("Eb")이 네 번째 박자의 약박에 도달하게 하고 #note("D")는 강박에 배치된다. 리듬 이동은 이 선율을 흥미롭게 만드는 요소 중 하나이다. 추가된 음이 리듬적 흥미를 만들어냈는가, 아니면 리듬 이동이 추가적인 음을 필요로 했는가?

#example("클리포드 브라운", 289)

모건은 제3윤곽 이전에 #chord("ii") 화음의 3도와 7도를 연주하면서 시작한다. 마지막 두 마디에서 그는 제1윤곽을 사용하며 흥미로운 반음계적 음을 추가한다. #note("C#")-#note("D")는 위로, #note("F")-#note("D")는 아래로 #note("Eb")$$(#chord("Ab7")의 5도)를 지시한다.

#example("리 모건", 290)

에반스는 빠른 화성 리듬을 가진 이 구절에서 세 개의 윤곽을 사용한다. 제2윤곽은 #maj25 위에, 제3윤곽은 #maj36 위에, 그리고 #chord("Gm")를 8분음표 세 박자 미리 예고하며 제3윤곽은 #prog("ii", "V7/vi", "vi") 위에 연주된다. (이 예시는 예시 181로도 표시되었다.)

#example("빌 에반스", 291)

== 제3윤곽과 경과음

이 윤곽의 아르페지오 형태는 화성음을 잇는 온음계 경과음과 잘 어울린다. 경과음을 추가함으로써 제3윤곽과 제1윤곽 사이의 구분이 흐려진다. 다음 예시들은 두 윤곽의 요소를 모두 포함하고 있어 어느 범주에 속하는지 쉽게 결정할 수 없다. 핵심은 이들의 화성적 명확성이다. 3도와 7도가 화성을 명확히 드러낸다.

#example("클리포드 브라운", 292)

이 반음계 경과음들은 강박에 있는 온음계 음들이 화성적 명확성을 흐리지 않는다.

#example("클리포드 브라운", 293)

톱니형 선율로 인해 딸림화음으로의 해결이 세 번째 박자까지 지연된다. 선율 끝의 도약은 선율 시작의 도약과 대칭을 이룬다.

#example("클리포드 브라운", 294)

#note("Eb") 단조에서의 톰 하렐의 선율이다.

#example("톰 하렐", 295)

이 구절은 넓은 음역과 리듬적 대비를 가진다.

#example("톰 하렐", 296)

하렐의 이 두 예시에서 화음음은 항상 강박에 나타난다.

#example("톰 하렐", 297)

#example("톰 하렐", 298)

허버드는 #chord("Bb")로의 해결을 한 마디 내내 지연시킨다. 이를 파커의 예시 174와 비교해보라.

#example("프레디 허버드", 299)

#exercisebox[
  + 위의 예제에서 사용된 유사한 기법을 활용하여 자신만의 선율을 만들어보라.
  +	위의 예제 중 일부를 모든 조에서 연주할 수 있도록 학습하라.
  +	스탠다드 재즈 진행에 대한 솔로를 작성하고 위의 예제를 일부 포함하라. 솔로를 에뛰드처럼 연습하라.
  +	스탠다드 진행 위에서 즉흥 연주를 시도하며, 솔로에 위의 예제를 활용하라.
  +	위의 예제를 변형해 보라. 더 많은 음을 추가하거나, 리듬을 이동시키거나, 분절화#sub[fragmenting]하는 등으로 자신만의 선율을 만들어 보라.
  +	제3윤곽을 반복하며, 모든 장조와 단조에서 마디선을 넘어 3도를 미리 연주#sub[anticipating]하는 연습을 하라.

    #align(center)[#image("figures/fig_300.jpg", width: 56%)]
]

#chapter("윤곽 조각", l: "chap7")

화성적 명확성에 대한 논의에서 목표음은 #chord("ii") 화음의 3도에서 7도로 이동하고, #chord("V7") 화음의 3도로 해결된 후 7도로 이동하여 다시 #chord("I") 화음의 3도로 해결되는 구조였다. 이전에 제시된 윤곽의 일부 조각에서는 일부 요소가 빠져 있음에도 불구하고 화성적 명확성이 유지되었다.

예시 249에서 파커의 연속된 선율은 #chord("ii") 화음의 7도가 #chord("V7") 화음의 3도로 해결되는 것을 중심으로 화성적 명확성을 보여준다. 돈꾸밈음, 3도에서 근음으로의 도약, 리듬적 이동이 이 예시에 생동감을 더한다.

#example("찰리 파커", 301)

브라운은 이 연속된 선율에서 유사한 움직임을 사용한다. 이러한 형태는 이후에 반복되며, #chord("V7") 화음에서 아르페지오로 변형된다.

#example("클리포드 브라운", 302)

#example("클리포드 브라운", 303)

모건의 발췌에서 유일하게 누락된 음은 #chord("iihalfdim") 화음의 3도이다. #chord("V7") 화음은 미리 연주되며 아르페지오로 진행된다. 선율은 제1윤곽을 따라 내려가 #chord("Cm")의 3도에 도달한다.

#example("리 모건", 304)

하렐은 강세가 있는 상위 이웃음을 시작으로 3도를 연주한다. 도약은 5도로 이어지는 아르페지오 음이며, 약박에 7도가 연주된 후 강박에 다음 목표음이 나타난다.

#example("톰 하렐", 305)

#chapter("모달 곡에서의 윤곽", l: "chap8")

이 책에서 다룬 대부분의 음악과 예시들은 화성 진행이 있는 음악에 관한 것이다. 그러나 많은 재즈 곡과 즉흥 연주는 모달 구조에 기반을 두고 있다. 모달 음악에 대해 논의할 내용이 많으며, 이는 다른 책에서 다뤄야 할 주제일 것이다.

일부 재즈 즉흥 연주자들은 모달 곡을 연주할 때 비밥 어휘를 함께 가져오기도 한다. 다음은 랜디 브레커가 #note("G") 도리안 스케일 위에서 제1윤곽을 사용한 두 가지 예시이다. 예시 254에서는 #note("Gm") 화음의 3도가 이끎음으로 접근된다. #note("F#")과 #note("A")는 근음을 둘러싸며, #note("Enat")은 #chord("C7") 화음을 암시하며 위아래에서 접근된다. 다음 예시에서는 제1윤곽이 강박에서 명확히 들리며, 이끎음이 추가되어 선율에 톱니형 형태가 더해진다.

#example("랜디 브레커", 306, subtitle: [_Passenger_])
#example("랜디 브레커", 307, subtitle: [_Passenger_])

고전적인 모달 녹음에서 두 가지 예시를 볼 수 있다. 캐넌볼 애덜리는 이 모달 블루스 곡의 솔로에서 제3윤곽의 C.E.S.H. 버전을 여러 번 사용하여 모달적, 동기적, 그리고 블루스적 연주와 대비를 이루었다. 이 윤곽은 G 믹솔리디안 스케일 위에서 연주된다.

#example("캐넌볼 애덜리", 308)
#example("캐넌볼 애덜리", 309)

#chapter("연주에 적용하기", l: "chap9")

*윤곽 연습 방법:*

윤곽을 모든 장조와 단조에서 기본 형태로 익혀라. 단조에서 연주할 때는 화성 단음계를 사용하라(단조 조성의 조표를 사용하고 이끎음을 올려라). 이를 충분히 숙지하기 전에는 아무것도 발전시키기 어렵거나 불가능하다.

+ 윤곽을 올바른 재즈 아티큘레이션과 느낌으로 연습하라. 8분음표를 스윙 스타일로 연주하고, 약박를 강하게 강조하라. 먼저 4분음표 값으로 연주해 리듬을 확실히 고정하라. 4분음표 속도가 빨라지면 그것이 8분음표처럼 느껴질 것이다.
+ 스탠다드 곡과 진행에 기본 윤곽을 적용하라. 예를 들어 블루스에서는,
  - 블루스 진행을 여러 코러스 연주하면서, #maj25$$가 나올 때마다 반드시 제1윤곽을 연주하라.
  - 몇 개의 코러스를 연주하고 나서, 제2윤곽으로 바꾼 다음, 제3윤곽으로 바꿔라.
  - 9\~10마디와 12마디의 일반적인 #maj25 외에도, 4마디에서 #chord("IV") 화음으로 가는 #maj25, 8마디에서 #chord("ii") 화음으로 가는 $chord("iidim")-chord("V7")$을 시도하라.
  - 첫 두 마디에서도 모든 윤곽이 적용 가능하다.

  #note("F")조에서 블루스 진행은 다음과 같다.

  // #align(center)[#image("figures/fig_310.jpg", width: 60%)]

  #align(center)[
    #set text(size: 0.9em)
    #table(
      columns: (5em, 5em, 5em, 2.5em, 2.5em),
      inset: (y: 2pt),
      align: left + horizon,
      row-gutter: 3pt,
      stroke: (x, y) => if (x != 4) { (left: 0.8pt) } else { (right: 0.8pt) },
      chord("F"), chord("Bb7"), chord("F"), chord("Cm7"), chord("F7"),
      chord("Bb7"), chord("Bdim7"), chord("F"), chord("Ahalfdim7"), chord("D7"),
      chord("Gm7"), chord("C7"), chord("F"), chord("Gm7"), chord("C7"),
    )
  ]
+ 이 책이나 자신만의 컬렉션에서 좋아하는 예제를 모든 조성에서 연습하라. 모든 음이 스윙 느낌을 갖게 하고, 선율의 꼭대기와 방향 전환 부분을 강조하라. 대충 연습하면 대충 연주하게 될 것이다.
+ 좋아하는 예제를 변형하고 개인화하라.
  - 음 하나나 두 개를 바꿔라.
  - 리듬을 일부 변경하라.
  - 원래 없던 돈꾸밈음과 꾸밈음을 추가하라.
  - 꾸밈음을 제거해 보라.
  - 적절한 임시표를 사용해 단조로 연주해보라.
  - 모든 조에서 연주하라!
+ 자신만의 것을 만들어라. 각 윤곽에서 여러 예시를 만들어라. 윤곽 하나와 기법 하나(이웃음, 경과음, 아르페지오 음 등)를 조합해 창작해 보라. 다시 말하지만, 모든 조에서 연습하라.
+ 자신의, 또는 다른 이들의 예시를 곡과 스탠다드 진행에 적용하라. 미리 준비하여 그들이 잘 작동하도록 하라.
+ 윤곽에 대한 지식을 활용해 화성을 들을 수 있도록 하라. 진행 위에서 윤곽을 노래 불러라. 낯선 진행을 들을 때도 도움이 될 것이다. 대부분의 스탠다드 곡은 위로든 아래로든 한 번에 하나의 임시표를 초과해 전조하지 않는다. #note("C")장조(올림표나 내림표 없음)에서 가장 자주 전조되는 조는 #note("A")단조(올림표나 내림표 없음), #note("F")장조와 #note("D")단조(내림표 하나), #note("G")장조와 #note("E")단조(올림표 하나)이다. 이러한 조는 #note("C")장조의 온음계 삼화음과 대응한다. 즉, $chord("Dm")=chord("ii")$, $chord("Em")=chord("iii")$, $chord("F")=chord("IV")$, $chord("G")=chord("V")$, $chord("Am")=chord("vi")$이다. #chord("I")에서 #chord("ii"), #chord("iii"), #chord("IV"), #chord("V"), #chord("vi")로, 그리고 다시 #chord("I")로 전조하며 노래하는 연습을 하라.
+ 들어라! 이 페이지는 음정과 리듬의 대략적인 정보를 담고 있을 뿐이다. 강세, 실제 배치, 억양, 아티큘레이션, 음색, 이 모든 요소들이 이러한 선율에 스윙감을 부여하며, 이는 위대한 재즈 아티스트들을 듣고 모방함으로써 배울 수 있다. 이를 대체할 방법은 없다.

#chapter("윤곽 예제", l: "chap10")

모든 연습에서 메트로놈을 사용하라. 음악은 정확한 박자 안에서 연주되어야 한다. 메트로놈 클릭을 손가락으로 박자를 맞추듯 2박과 4박에 맞추어라. 처음에는 천천히 연습하라. 템포를 점진적으로 올리는 목표를 설정하되, 어떤 템포에서도 정확성을 유지하도록 노력하라. 재즈 아티큘레이션을 활용하여 좋은 리듬감을 유지하며 연습하라. 모든 조에서 연습하라. "All the Things You Are", "Cherokee", "Body and Soul", 이 세 곡의 스탠다드 재즈 곡만 연주하더라도 모든 12개 조에서 연주할 수 있어야 한다.

#set enum(numbering: n => [#context (counter(heading).get().at(1)).#n.])

== 기본 윤곽 익히기

+ 이 16마디 연습곡을 모든 장조에서 연주하라. 각 조에서 편안해질 때까지 반복하라. 목표는 어떤 조에서 시작하든 이 연습곡을 모든 12개의 장조로 전조하여 오류나 망설임 없이 멈추지 않고 연주하는 것이다.

  #fb[
    온음표 화성 리듬:

    #align(center)[#image("figures/fig_311.jpg", width: 90%)]
  ]

+ 이 8마디 연습곡을 모든 장조에서 연주하라. 각 조에서 편안해질 때까지 반복하라. 목표는 어떤 조에서 시작하든 이 연습곡을 모든 12개의 장조로 전조하여 오류나 망설임 없이 멈추지 않고 연주하는 것이다.

  #fb[
    2분음표 화성 리듬:

    #align(center)[#image("figures/fig_312.jpg", width: 90%)]
  ]

+ 연습곡 1.1을 한 번은 예시대로 연주하라. 그 다음에는 이 연습곡을 가이드로 삼아 즉흥 연주하라. 목표는 어떤 조에서 시작하든 이 연습곡을 모든 12개의 장조로 전조하여 오류나 망설임 없이 멈추지 않고 연주하는 것이다.

+ 다음은 변형된 윤곽을 활용한 연습곡이다.

  #align(center)[#image("figures/fig_313.jpg", width: 90%)]

+ 연습곡 1.1\~1.3을 단조에 적용하라. 앞서 말한 대로, 이끎음을 올린 화성 단음계를 사용하라.

  #fb[
    온음표 화성 리듬:

    #align(center)[#image("figures/fig_314.jpg", width: 90%)]
  ]
  #fb[
    2분음표 화성 리듬:

    #align(center)[#image("figures/fig_315.jpg", width: 90%)]
  ]

== 윤곽과 청각 훈련

+ 첫 번째 세트의 연습곡을 따라 부르며 연습하라.
+ 연습곡 1.1과 1.2를 가이드로 삼아 선율을 목소리로 즉흥연주하라.
+ 자신의 보컬 즉흥 연주를 기보하고 익혀라.
+ 장조에서 시작하여 밀접한 조로 전조하라. (예를 들어 #note("C")장조를 선택했다면, #note("D")단조, #note("E")단조, #note("F")장조, #note("G")장조, #note("A")단조로 변조하라.) 새로운 조로 변조할 때 해당 조의 #prog("ii7", "V7") 또는 #min25$$을 사용하라. 다음 페이지에 나와 있는 세 가지 윤곽을 활용하여 밀접한 조로 변조하는 연습을 하라.

=== 제1윤곽을 사용하여 $bold(note("C"))$장조와 밀접한 조로 전조하기

#padbox[시작 음정을 정하고 연습문제를 노래하라. 끝난 후 자신이 정확했는지를 확인하라. 이러한 연습을 숙달한 후에는 더 먼 조로 전조하는 연습을 시도하라. 예를 들면, #note("C")장조에서 #note("Eb")장조, #note("C")장조에서 #note("Ab")장조, #note("C")장조에서 #note("E")장조, #note("C")장조에서 #note("A")장조, #note("C")장조에서 #note("Bb")장조, #note("C")장조에서 #note("D")장조, #note("C")장조에서 #note("G")단조, #note("C")장조에서 #note("F")단조 등으로 전조해보라.]

#fb[#note("C")장조(#chord("I"))에서 #note("D")단조(#chord("ii"))로 전조:

#align(center)[#image("figures/fig_316.jpg", width: 90%)]]

#fb[#note("C")장조(#chord("I"))에서 #note("E")단조(#chord("iii"))로 전조:

#align(center)[#image("figures/fig_317.jpg", width: 90%)]]

#fb[#note("C")장조(#chord("I"))에서 #note("F")장조(#chord("IV"))로 전조:

#align(center)[#image("figures/fig_318.jpg", width: 90%)]]

#fb[#note("C")장조(#chord("I"))에서 #note("G")장조(#chord("V"))로 전조:

#align(center)[#image("figures/fig_319.jpg", width: 90%)]]

#fb[#note("C")장조(#chord("I"))에서 #note("A")단조(#chord("vi"))로 전조:

#align(center)[#image("figures/fig_320.jpg", width: 90%)]]

=== 제2윤곽을 사용하여 $bold(note("C"))$장조와 밀접한 조로 전조하기

#padbox[시작 음정을 정하고 연습문제를 노래하라. 끝난 후 자신이 정확했는지를 확인하라. 이러한 연습을 숙달한 후에는 더 먼 조로 전조하는 연습을 시도하라. 예를 들면, #note("C")장조에서 #note("Eb")장조, #note("C")장조에서 #note("Ab")장조, #note("C")장조에서 #note("E")장조, #note("C")장조에서 #note("A")장조, #note("C")장조에서 #note("Bb")장조, #note("C")장조에서 #note("D")장조, #note("C")장조에서 #note("G")단조, #note("C")장조에서 #note("F")단조 등으로 전조해보라.]

#fb[#note("C")장조(#chord("I"))에서 #note("D")단조(#chord("ii"))로 전조:

#align(center)[#image("figures/fig_321.jpg", width: 90%)]]
#fb[#note("C")장조(#chord("I"))에서 #note("E")단조(#chord("iii"))로 전조:

#align(center)[#image("figures/fig_322.jpg", width: 90%)]]
#fb[#note("C")장조(#chord("I"))에서 #note("F")장조(#chord("IV"))로 전조:

#align(center)[#image("figures/fig_323.jpg", width: 90%)]]
#fb[#note("C")장조(#chord("I"))에서 #note("G")장조(#chord("V"))로 전조:

#align(center)[#image("figures/fig_324.jpg", width: 90%)]]
#fb[#note("C")장조(#chord("I"))에서 #note("A")단조(#chord("vi"))로 전조:

#align(center)[#image("figures/fig_325.jpg", width: 90%)]]

=== 제3윤곽을 사용하여 $bold(note("C"))$장조와 밀접한 조로 전조하기

#padbox[시작 음정을 정하고 연습문제를 노래하라. 끝난 후 자신이 정확했는지를 확인하라. 이러한 연습을 숙달한 후에는 더 먼 조로 전조하는 연습을 시도하라. 예를 들면, #note("C")장조에서 #note("Eb")장조, #note("C")장조에서 #note("Ab")장조, #note("C")장조에서 #note("E")장조, #note("C")장조에서 #note("A")장조, #note("C")장조에서 #note("Bb")장조, #note("C")장조에서 #note("D")장조, #note("C")장조에서 #note("G")단조, #note("C")장조에서 #note("F")단조 등으로 전조해보라.]

#fb[#note("C")장조(#chord("I"))에서 #note("D")단조(#chord("ii"))로 전조:

#align(center)[#image("figures/fig_326.jpg", width: 90%)]]

#fb[#note("C")장조(#chord("I"))에서 #note("E")단조(#chord("iii"))로 전조:

#align(center)[#image("figures/fig_327.jpg", width: 90%)]]

#fb[#note("C")장조(#chord("I"))에서 #note("F")장조(#chord("IV"))로 전조:

#align(center)[#image("figures/fig_328.jpg", width: 90%)]]

#fb[#note("C")장조(#chord("I"))에서 #note("G")장조(#chord("V"))로 전조:

#align(center)[#image("figures/fig_329.jpg", width: 90%)]]

#fb[#note("C")장조(#chord("I"))에서 #note("A")단조(#chord("vi"))로 전조:

#align(center)[#image("figures/fig_330.jpg", width: 90%)]]

== 제1윤곽에 특정 기법 적용하기

단순한 윤곽을 활용하여 한 가지 이상의 기법을 적용해 더 흥미롭고 음악적인 선율을 만들어라. 모든 장조에서 연습하라. 같은 선율을 단조에서도 시도해보라. 다음은 몇 가지 예시이다. 자신만의 선율을 만들어 연습하라.

#fb[1. 마디를 채우기 위해 스케일 움직임의 사용
#align(center)[#image("figures/fig_331.jpg", width: 69%)]]
#fb[2. 아르페지오 음의 사용
#align(center)[#image("figures/fig_332.jpg", width: 69%)]]
#fb[3. 상위 이웃음(UNT)의 반복 사용
#align(center)[#image("figures/fig_333.jpg", width: 68%)]]
#fb[4. 이전 연습과 유사하지만 상위 아르페지오 음을 상위 이웃음 대신 사용. 이 선율은 바로크 음악을 연상시킨다.
#align(center)[#image("figures/fig_334.jpg", width: 69%)]]
#fb[5. 단순한 기법(둘러싼음과 아르페지오 음)의 조합
#align(center)[#image("figures/fig_335.jpg", width: 69%)]]
#fb[6. 상위 및 하위 이웃음(LNT). #chord("G7")과 #chord("CM")의 목표음이 리듬적으로 미리 연주된다.
#align(center)[#image("figures/fig_336.jpg", width: 68%)]]
#fb[7. 두 번째 마디에서 3도에서 $flat 9$으로의 도약
#align(center)[#image("figures/fig_337.jpg", width: 68%)]]
#fb[8. 픽업음이 포함된 단순한 윤곽
#align(center)[#image("figures/fig_338.jpg", width: 68%)]]
#fb[9. 옥타브 이동을 위한 아르페지오 사용, 반음계적 접근, #chord("G7") 화음에서의 이동된 아르페지오
#align(center)[#image("figures/fig_339.jpg", width: 68%)]]
#fb[10. 둘러싸기, UNT, 마지막 목표음을 미리 연주
#align(center)[#image("figures/fig_340.jpg", width: 68%)]]
#fb[11. 둘러싸기, UNT, 마지막 목표음으로의 반음계적 접근
#align(center)[#image("figures/fig_341.jpg", width: 68%)]]
#fb[12. 둘러싸기
#align(center)[#image("figures/fig_342.jpg", width: 69%)]]
#fb[13. 더 많은 반음계적 경과음(PT), 차용음, LNT를 사용한 둘러싸기
#align(center)[#image("figures/fig_343.jpg", width: 69%)]]
#fb[14. 위와 아래로부터의 반음계적 접근
#align(center)[#image("figures/fig_344.jpg", width: 69%)]]
#fb[15. 둘러싸기 (두 번째 마디의 아르페지오는 제1윤곽 중간에 제2윤곽을 암시한다)
#align(center)[#image("figures/fig_345.jpg", width: 69%)]]
#fb[16. 반음계적 경과음, C.E.S.H.
#align(center)[#image("figures/fig_346.jpg", width: 69%)]]
#fb[17. 반음계적 경과음, 아르페지오 음, C.E.S.H., 둘러싸기
#align(center)[#image("figures/fig_347.jpg", width: 69%)]]
#fb[18. 옥타브 이동, 반음계적 접근, 으뜸화음으로의 지연된 해결
#align(center)[#image("figures/fig_348.jpg", width: 68%)]]

다음은 단순한 윤곽이 더 복잡한 선율로 변형될 수 있는 방법을 보여준다.

#fb[19. 단순한 윤곽이 일부 리듬적 흥미를 더한 형태로 나타난다.
#align(center)[#image("figures/fig_349.jpg", width: 44%)]]
#fb[20. #note("F")가 옥타브 이동되었다.
#align(center)[#image("figures/fig_350.jpg", width: 44%)]]
#fb[21. 옥타브를 채우기 위해 아르페지오가 사용되었다.
#align(center)[#image("figures/fig_351.jpg", width: 44%)]]
#fb[22. #note("F")가 다시 이동되어 선율에 더 각진 형태를 부여한다.
#align(center)[#image("figures/fig_352.jpg", width: 44%)]]
#fb[23. #note("F") 위쪽에서 반음계적 픽업음, #note("B") 아래쪽에서 반음계적 픽업음이 추가되었다.
#align(center)[#image("figures/fig_353.jpg", width: 69%)]]

== 제2윤곽에 특정 기법 적용하기

단순한 윤곽을 활용하여 한 가지 이상의 기법을 적용해 더 흥미롭고 음악적인 선율을 만들어라. 모든 장조에서 연습하라. 같은 선율을 단조에서도 시도해보라. 다음은 몇 가지 예시이다. 자신만의 선율을 만들어 연습하라.

#fb[1. 두 개의 음계 음으로 시작, PT
#align(center)[#image("figures/fig_354.jpg", width: 69%)]]
#fb[2. 음계 구절
#align(center)[#image("figures/fig_355.jpg", width: 90%)]]
#fb[3. LNT의 반복 사용
#align(center)[#image("figures/fig_356.jpg", width: 69%)]]
#fb[4. LNT, 둘러싸기, 옥타브 이동
#align(center)[#image("figures/fig_357.jpg", width: 69%)]]
#fb[5. PT, 아르페지오 음
#align(center)[#image("figures/fig_358.jpg", width: 69%)]]
#fb[6. 네 음을 가지고 순환하다 첫 음으로 돌아온다.
#align(center)[#image("figures/fig_359.jpg", width: 69%)]]
#fb[7. 음계로부터 온 픽업음
#align(center)[#image("figures/fig_360.jpg", width: 69%)]]
#fb[8. 5도로부터 온 픽업음
#align(center)[#image("figures/fig_361.jpg", width: 69%)]]
#fb[9. LNT와 확장된 아르페지오, 반음계적 둘러싸기
#align(center)[#image("figures/fig_362.jpg", width: 69%)]]
#fb[10. 예기치 않은 반음계적 해결(#note("C")-#note("C#")이 #note("D")로 끌어 올리고, #note("E")-#note("Eb")은 끌어 내린다.), 반음계적 둘러싸기
#align(center)[#image("figures/fig_363.jpg", width: 90%)]]
#fb[11. 연속적인 둘러싼음
#align(center)[#image("figures/fig_364.jpg", width: 90%)]]
#fb[12. #note("ii") 화음의 근음이 그 딸림화음에 의해 앞서 둘러싸임, 확장된 아르페지오, 둘러싸인 #note("B")
#align(center)[#image("figures/fig_365.jpg", width: 68%)]]
#fb[13. 아래에서 시작하는 아르페지오, 이동된 아르페지오. 두 번째 마디에는 두 개의 #chord("G7") 아르페지오로 구성된다. 하나는 3도에서 시작하고(3-5-7-9), 나머지 하나는 근음에서 시작한다(1-3-5-7). 이동은 각진 선율을 만들고 동시에 단계적인 진행 #note("C")-#note("B")-#note("A")-#note("G")-#note("F")-#note("E")를 강조한다.
#align(center)[#image("figures/fig_366.jpg", width: 69%)]]

== 제3윤곽에 특정 기법 적용하기

단순한 윤곽을 활용하여 한 가지 이상의 기법을 적용해 더 흥미롭고 음악적인 선율을 만들어라. 모든 장조에서 연습하라. 같은 선율을 단조에서도 시도해보라. 다음은 몇 가지 예시이다. 자신만의 선율을 만들어 연습하라.

#fb[1. 반복되는 음계 구절로 시작(4.2의 전위)
#align(center)[#image("figures/fig_367.jpg", width: 90%)]]
#fb[2. LNT, 멈췄다 가는 리듬적 느낌
#align(center)[#image("figures/fig_368.jpg", width: 90%)]]
#fb[3. LNT, PT, C.E.S.H., 옥타브 이동, 둘러싸기
#align(center)[#image("figures/fig_369.jpg", width: 90%)]]
#fb[4. 픽업음, 두 번째 마디까지 지연된 윤곽
#align(center)[#image("figures/fig_370.jpg", width: 90%)]]
#fb[5. 반음계적 픽업음, 둘러싼음
#align(center)[#image("figures/fig_371.jpg", width: 90%)]]
#fb[6. 반음계적 둘러싼음
#align(center)[#image("figures/fig_372.jpg", width: 90%)]]
#fb[7. 둘러싸기, 아르페지오 음, 반음계적 접근음. 첫 마디의 #note("D")에서 #note("F")로 하행 도약이 마지막 마디에서 반복된다.
#align(center)[#image("figures/fig_373.jpg", width: 69%)]]
#fb[8. LNT. 리듬적 강세가 때때로 점4분음표 리듬을 암시한다.
#align(center)[#image("figures/fig_374.jpg", width: 68%)]]

== 일반적인 진행에서의 짧은 예제

일반적인 진행에 윤곽을 따르는 짧은 연습곡을 만들어라. 이 예시는 세 가지 윤곽을 모두 사용한다. 첫 두 마디(#maj25)는 여러 반음계적 접근음과 둘러싼음을 포함한 제3윤곽을 사용한다. 비교적 단순한 제1윤곽이 3\~4번째 마디(#prog("iii", "V7/ii"))에 나타난다. 5\~6마디(#maj25)에서는 몇 개의 픽업음과 함께 제2윤곽이 사용되었다.

#align(center)[#image("figures/fig_375.jpg", width: 90%)]

== 윤곽으로 다른 코드 연결하기 (1)

다음 진행을 모든 윤곽을 활용하여 연습하며 다양한 코드 유형을 연결하는 연습을 하라.

// #align(center)[#image("figures/fig_376.jpg", width: 23%)]

$ chord("ii")-chord("V7")-chord("I")-chord("IV")-frac(chord("iihalfdim")-chord("V7"), chord("vi"))-chord("vi") $

이 연습곡들을 천천히 시작하여 편안해질 때까지 연습한 후 점차 속도를 올려라. 목표는 어떤 템포로 시작하든 12개의 모든 장조에서 망설임이나 오류 없이 연주하는 것이다.

#fb[1. 제1윤곽을 사용하여 목표음을 연결하기
#align(center)[#image("figures/fig_377.jpg", width: 90%)]]
#fb[2. 제2윤곽 사용하기. 첫 절반에서는 홀수 마디에, 후반부에서는 짝수 마디에 윤곽이 시작된다
#align(center)[#image("figures/fig_378.jpg", width: 90%)]]
#fb[3. 제3윤곽 사용하기. 첫 절반에서는 홀수 마디에 윤곽이 시작하고, 후반부에서는 윤곽이 전위된다
#align(center)[#image("figures/fig_379.jpg", width: 90%)]]
#fb[4. 이 연습은 제1윤곽을 기반으로 한다. 각 코드의 3도는 매 마디의 첫 박자에 나타나며, 이후 아르페지오가 이어지고 음계가 하행한다. 아르페지오는 두 마디마다 옥타브가 이동된다.
#align(center)[#image("figures/fig_380.jpg", width: 90%)]]

== 윤곽으로 다른 코드 연결하기 (2)

다음에는 예제 7의 진행이 일부 꾸밈 기법이 추가된 형태로 제시되어 있다. 어떤 기법들이 사용되었는지 알아낼 수 있는가?

#fb[1. 제1윤곽
#align(center)[#image("figures/fig_381.jpg", width: 90%)]]
#fb[2. 제2윤곽
#align(center)[#image("figures/fig_382.jpg", width: 90%)]]
#fb[3. 제3윤곽
#align(center)[#image("figures/fig_383.jpg", width: 90%)]]

== 턴어라운드 진행에서 윤곽 사용하기

턴어라운드 진행 위에서 윤곽을 연습하라. 턴어라운드 진행은 블루스와 수많은 재즈 및 팝 스탠다드 곡의 마지막 두 마디에 자주 등장하며, "I Got Rhythm"과 "Heart and Soul" 같은 곡의 기초가 된다. 이 연습을 모든 12개 조에서 연습하라.

#fb[1. 전형적인 턴어라운드 진행 (#note("F")장조에서 $prog("I", "V/ii", "ii", "V")-dots.c$)
#align(center)[#image("figures/fig_384.jpg", width: 90%)]]
#fb[2. 더 많은 부딸림화음을 포함한 턴어라운드 진행 (#note("F")장조에서 $prog("I", "V7/ii", "V7/V", "V7", "V/vi")-dots.c$)
#align(center)[#image("figures/fig_385.jpg", width: 90%)]]
#fb[3. 제1윤곽의 순환 (#note("C")장조에서 $prog("iii", "V/ii", "ii", "V", "I")-$ [#chord("iii")의 딸림화음의 셋온음 대체화음#sub[tritone substitute]])
#align(center)[#image("figures/fig_386.jpg", width: 90%)]]
#fb[4. 제2윤곽의 순환 (#note("C")장조에서 $prog("iii", "V/ii", "ii", "V", "I")-$ [#chord("iii")의 딸림화음의 셋온음 대체화음])
#align(center)[#image("figures/fig_387.jpg", width: 90%)]]
#fb[5. 제3윤곽의 순환 (#note("C")장조에서 $prog("iii", "V/ii", "ii", "V", "I")-$ [#chord("iii")의 딸림화음의 셋온음 대체화음])
#align(center)[#image("figures/fig_388.jpg", width: 90%)]]
#fb[6. 더 긴 화성 리듬은 이 순환을 반음계적 이끎음으로 꾸밀 수 있도록 해준다. 진행은 #note("C")장조에서 #prog("iii", "V/ii", "ii", "V")이다.
#align(center)[#image("figures/fig_389.jpg", width: 90%)]]

== 조성 중심 순환에서의 윤곽

// key center cycle = 조성 중심 순환

더 빠른 화성 리듬으로 조성 중심 순환을 연습하라. 연습문제 7에서는 화음이 매 마디마다 바뀌었지만, 여기서는 두 박자마다 바뀐다.

#fb[1. 조성 중심 순환을 관통하는 제1윤곽
#align(center)[#image("figures/fig_390.jpg", width: 90%)]]
#fb[2. 조성 중심 순환을 관통하는 제1윤곽의 변형
#align(center)[#image("figures/fig_391.jpg", width: 90%)]]
#fb[3. 조성 중심 순환을 관통하는 제2윤곽
#align(center)[#image("figures/fig_392.jpg", width: 90%)]]
#fb[4. 조성 중심 순환을 관통하는 제2윤곽의 변형
#align(center)[#image("figures/fig_393.jpg", width: 90%)]]
#fb[5. 조성 중심 순환을 관통하는 제3윤곽
#align(center)[#image("figures/fig_394.jpg", width: 90%)]]
#fb[6. 조성 중심 순환을 관통하는 제3윤곽의 변형
#align(center)[#image("figures/fig_395.jpg", width: 90%)]]

=== 스탠다드 재즈 진행에서 윤곽 적용하기

이 윤곽들을 연주에 통합하기 위해 가장 중요한 일 중 하나는 이를 스탠다드 곡과 진행에 적용하는 것이다. 이전 연습에서는 한 번에 하나의 조에서만 이를 사용하기 시작했다. 그러나 스탠다드 곡들은 가까운 조와 먼 조로 전조하며, 화성 리듬이 다양하게 나타난다. 다음 연습에서는 윤곽을 블루스, "Rhythm Changes", 그리고 스탠다드 재즈 곡의 진행에 적용한다. 먼저 곡의 전체 형식에 대해 단순한 윤곽만 연주하는 것으로 시작하라. 악기 없이 윤곽을 노래하고 화음 변화를 들어보도록 노력하라. 변화를 듣고 실제 음정을 부를 수 있다면, 진행 위에서 좋은 선율을 듣고 즉흥 연주할 준비가 더 잘될 것이다. 단순한 윤곽을 숙달한 후, 형식 위에서 즉흥 연주를 시도하라. 연습할 때는 한 번에 하나의 윤곽으로 자신을 제한하라. 각 윤곽에 대해 형식을 여러 번 연주하며 기본 선율을 꾸미는 연습을 하라. 세 가지 윤곽 모두를 숙달한 후에는 다양한 윤곽의 조합을 시도하라.

== 스탠다드 재즈 진행 I: $bold(#note("Bb"))$ 블루스

#fb[1. 제1윤곽
#align(center)[#image("figures/fig_396.jpg", width: 90%)]]
#fb[2. 제2윤곽
#align(center)[#image("figures/fig_397.jpg", width: 90%)]]
#fb[3. 제3윤곽
#align(center)[#image("figures/fig_398.jpg", width: 90%)]]

== 스탠다드 재즈 진행 II: "Rhythm Changes"

=== A 섹션

#fb[1. 제1윤곽
#align(center)[#image("figures/fig_399.jpg", width: 90%)]]
#fb[2. 제2윤곽
#align(center)[#image("figures/fig_400.jpg", width: 90%)]]
#fb[3. 제3윤곽
#align(center)[#image("figures/fig_401.jpg", width: 90%)]]

=== B 섹션

#fb[4. 2분음표로 나타낸 제1윤곽
#align(center)[#image("figures/fig_402.jpg", width: 90%)]]
#fb[5. #prog("ii", "V")를 함의하는 제1윤곽 (1\~2마디와 5\~6마디)
#align(center)[#image("figures/fig_403.jpg", width: 90%)]]
#fb[6. #prog("ii", "V")를 함의하는 제1윤곽 (3\~4마디와 7\~8마디)
#align(center)[#image("figures/fig_404.jpg", width: 90%)]]
#fb[7. 2분음표로 나타낸 제2윤곽
#align(center)[#image("figures/fig_405.jpg", width: 90%)]]
#fb[8. #prog("ii", "V")를 함의하는 제2윤곽 (1\~2마디와 5\~6마디)
#align(center)[#image("figures/fig_406.jpg", width: 90%)]]
#fb[9. #prog("ii", "V")를 함의하는 제2윤곽 (3\~4마디와 7\~8마디)
#align(center)[#image("figures/fig_407.jpg", width: 90%)]]
#fb[10. 2분음표로 나타낸 제3윤곽
#align(center)[#image("figures/fig_408.jpg", width: 90%)]]
#fb[11. 2분음표로 나타낸 제3윤곽
#align(center)[#image("figures/fig_409.jpg", width: 90%)]]
#fb[12. #prog("ii", "V")를 함의하는 제3윤곽 (1\~2마디와 5\~6마디)
#align(center)[#image("figures/fig_410.jpg", width: 90%)]]
#fb[13. #prog("ii", "V")를 함의하는 제3윤곽 (3\~4마디와 7\~8마디)
#align(center)[#image("figures/fig_411.jpg", width: 90%)]]

== 스탠다드 재즈 진행 III: _Are You All the Outlines_#footnote[스탠다드 재즈 곡 "All the Things You Are"의 제목을 변형한 언어유희 (역주)]

#fb[1. 제1윤곽
#align(center)[#image("figures/fig_412.jpg", width: 90%)]]
#fb[2. 제2윤곽 (첫 번째 마디에서 시작)
#align(center)[#image("figures/fig_413.jpg", width: 90%)]]
#fb[3. 제2윤곽 (두 번째 마디에서 시작)
#align(center)[#image("figures/fig_414.jpg", width: 90%)]]
#fb[4. 제3윤곽 (첫 번째 마디에서 시작)
#align(center)[#image("figures/fig_415.jpg", width: 90%)]]
#fb[5. 제3윤곽 (두 번째 마디에서 시작)
#align(center)[#image("figures/fig_416.jpg", width: 90%)]]

== 스탠다드 재즈 진행 IV: _Outlines by Starlight_#footnote[스탠다드 재즈 곡 "Stella by Starlight"의 제목을 변형한 언어유희 (역주)]

#fb[1. 제1윤곽
#align(center)[#image("figures/fig_417.jpg", width: 90%)]]
#fb[2. 제2윤곽 (첫 번째 마디에서 시작)
#align(center)[#image("figures/fig_418.jpg", width: 90%)]]
#fb[3. 제2윤곽 (두 번째 마디에서 시작)
#align(center)[#image("figures/fig_419.jpg", width: 90%)]]
#fb[4. 제3윤곽 (첫 번째 마디에서 시작)
#align(center)[#image("figures/fig_420.jpg", width: 90%)]]
#fb[5. 제3윤곽 (두 번째 마디에서 시작)
#align(center)[#image("figures/fig_421.jpg", width: 90%)]]

== 스탠다드 재즈 진행 V: $bold(prog("ii", "V"))$로 대체한 $bold(note("F"))$ 블루스

#fb[1. 제1윤곽
#align(center)[#image("figures/fig_422.jpg", width: 90%)]]
#fb[2. 제2윤곽 (첫 번째 반마디에서 시작)
#align(center)[#image("figures/fig_423.jpg", width: 90%)]]
#fb[3. 제2윤곽 (두 번째 반마디에서 시작)
#align(center)[#image("figures/fig_424.jpg", width: 90%)]]
#fb[4. 제3윤곽 (첫 번째 반마디에서 시작)
#align(center)[#image("figures/fig_425.jpg", width: 90%)]]
#fb[5. 제3윤곽 (두 번째 반마디에서 시작)
#align(center)[#image("figures/fig_426.jpg", width: 90%)]]

== 스탠다드 재즈 진행 VI.: _Big Strides with Outlines_#footnote[스탠다드 재즈 곡 "Giant Steps"의 제목을 변형한 언어유희 (역주)]

#set enum(numbering: n => [16.#n.])

#fb[1. 제1윤곽
#align(center)[#image("figures/fig_427.jpg", width: 90%)]]
#fb[2. 제2윤곽
#align(center)[#image("figures/fig_428.jpg", width: 90%)]]
#fb[3. 제2윤곽
#align(center)[#image("figures/fig_429.jpg", width: 90%)]]
#fb[4. 제3윤곽
#align(center)[#image("figures/fig_430.jpg", width: 90%)]]
#fb[5. 제3윤곽
#align(center)[#image("figures/fig_431.jpg", width: 90%)]]

== 윤곽 인식하기

윤곽을 식별하고 이를 꾸미는 데 사용된 기법을 알아보는 연습을 하라. 다음은 캐넌볼 애덜리의 다섯 가지 예시이다. 각각의 예시에서 어떤 윤곽이 사용되었는지 식별하고, 선율을 더 흥미롭게 만드는 데 사용된 기법이 무엇인지 분석하라.

#fb[1. 캐넌볼 애덜리
#align(center)[#image("figures/fig_432.jpg", width: 47%)]]
#fb[2. 캐넌볼 애덜리
#align(center)[#image("figures/fig_433.jpg", width: 47%)]]
#fb[3. 캐넌볼 애덜리
#align(center)[#image("figures/fig_434.jpg", width: 47%)]]
#fb[4. 캐넌볼 애덜리
#align(center)[#image("figures/fig_435.jpg", width: 47%)]]
#fb[5. 캐넌볼 애덜리
#align(center)[#image("figures/fig_436.jpg", width: 35%)]]

재즈 문헌에서 다른 예시들을 찾아 보아라. 그것들을 모든 조성에서 연습하여 익혀라. 답은 #pageref(<sec_cannonball_answer>)쪽에 있다.

#chapter("다음에 무엇을 할 것인가?", l: "chap11")

== 들어라

이 책의 예시는 훌륭한 재즈 솔로를 구성하는 일부에 불과하다. 이와 다른 예술가들의 전체 솔로를 들어보라. 아이디어의 전개를 들어보고, 흥미로운 선율의 형태와 리듬을 찾아라. 화성적 명확성과 일반화 사이의 균형과 대비를 들어라. 모티프 전개와 화성 변화의 흐름, 복잡한 리듬과 단순한 리듬, 여백과 두껍고 복잡한 질감, 블루스 아이디어와 구체성을 들어보라.

좋아하는 음악의 일부를 발췌하라. 그 일부에서 자신이 기억하고 이해할 수 있는 무언가를 발견하라. 이 책이나 자신의 경험에서 나온 어떤 기법이라도 적용하여 그 일부를 발전시키고 개인화해 보라. 연습 시간 동안 창의력을 발휘해 보라.

== 연습하라

나는 고등학교 야구팀이 외야에서 컷오프맨에게 공을 던지고, 컷오프맨이 홈 플레이트로 공을 전달하는 루틴을 연습하는 모습을 본 적이 있다. 그들은 이 루틴을 최소 45분 동안 연습했다. 그들 모두 그 방법을 듣고 기억할 정도로 충분히 똑똑했다. 다음 주 시험에서 답변으로 말할 수도 있었을 것이다. 하지만 그들은 이 루틴을 반복적으로 연습해, 생각 없이 반응할 수 있도록 자동화했다. 팀이 경기 준비를 하기 위해서는 경기를 구성하는 모든 요소를 연습하며, 각 요소를 개별적으로 연마해야 한다. 타격, 번트, 캐치, 투구, 주루, 수비 플레이 등 모든 부분이 이에 해당한다. 이것이 즉흥 연주를 연습하는 방법이다. 전체는 구성 요소를 분해해 반복적으로 연습한 뒤 다시 합쳐지는 방식으로 배워진다.

어느 날, 내 학생 중 한 명이 레슨 중에 스케일을 제대로 연주하지 못했다. 나는 그에게 매일 스케일을 몇 번 연습하는지 물었다. 그는 적어도 한 번은 연습한다고 말했다. 나는 그가 테니스를 치는 것을 알고 있었기에, 테니스 코트에서 서브를 몇 번 연습하는지 물었다. 그는 약 800번 정도라고 답했다. 그가 왜 피아노보다 테니스를 더 잘했는지는 명백했다. 즉흥 연주를 연습하는 방법은 이와 같다. 반복적인 연습을 통해 자동으로 연주할 수 있을 때까지 연습하라.

== 귀를 훈련하라

귀를 훈련해 어떤 선율을 들었을 때 즉시 악기로 연주할 수 있도록 하라. 악보를 보았을 때 즉시 그 소리가 어떤지 상상할 수 있어야 한다. 소리, 악기에서의 운지, 악보에 적힌 음표가 모두 마음속에서 연결되어야 한다. 청각적 형태, 기보 형태(음표와 화음 기호), 악기에서 만들어내는 실제 경험, 이 세 가지는 삼각형을 형성한다. 이를 연습 루틴 속에서 통합하라. 청각 훈련은 평생 동안 이어지는 과정이며, 완료하고 끝낼 수 있는 수업이 아니다.

#align(center)[#image("figures/fig_437.jpg", width: 64%)]

== 연주하라

연주하라. 그것이 우리가 하는 일이다. 연습과 공연에 있어 놀이하듯 접근하라. 다른 연주자들의 연주를 듣고 반응할 준비를 하라. 음악적으로 무엇을 해야 하고 무엇을 할 수 있을지에 대해 충분히 연습하고 고민했다면, 자신의 본능을 신뢰할 수 있을 것이다.

#show: appendices.with("부록", hide-parent: false)

#chapter("스탠다드 진행에서의 세 연습곡")

이 세 개의 연습곡은 10장에서 다룬 표준 진행을 기반으로 창작된 즉흥 솔로의 예시이다. 윤곽과 다른 재료들을 사용하여 자신만의 솔로를 만들어 보라. 창의적으로 접근하라. 세 가지 윤곽을 모두 활용하여 음악적으로 들리도록 구성하라.

#set enum(numbering: "연습곡 1.")

#fb[1. 스탠다드 진행 II: _“Rhythm Changes”_
#align(center)[#image("figures/fig_438.jpg", width: 90%)]]
#fb[2. 스탠다드 진행 III: _Are You All the Outlines?_
#align(center)[#image("figures/fig_439.jpg", width: 90%)]]
#fb[3. 스탠다드 진행 IV: _Outlines by Starlight_
#align(center)[#image("figures/fig_440.jpg", width: 90%)]]

#chapter("스탠다드 재즈 진행에서의 루 도널드슨 솔로")

루 도널드슨은 아트 블레이키의 음반 _Live at Birdland_에서 연주한 이 솔로에서 세 가지 윤곽에 크게 의존한다. 도널드슨 이후 솔로를 연주하는 클리포드 브라운은 거의 전적으로 제1윤곽을 활용하여 솔로를 구성한다.

#align(center)[#image("figures/fig_441.jpg", width: 100%)]
#align(center)[#image("figures/fig_442.jpg", width: 100%)]
#align(center)[#image("figures/fig_443.jpg", width: 100%)]
#align(center)[#image("figures/fig_444.jpg", width: 100%)]

#chapter("스탠다드 재즈 진행에서의 톰 하렐 솔로")

하렐은 이 현대적 솔로를 흥미롭게 만들기 위해 다양한 기법을 사용하지만, 세 가지 윤곽에 여러 번 의존한다. 솔로를 분석하고, 세 가지 윤곽을 찾아내어 그것들이 전체적인 맥락에서 어떻게 연결되고 활용되는지 살펴보라.

#align(center)[#image("figures/fig_445.jpg", width: 100%)]
#align(center)[#image("figures/fig_446.jpg", width: 100%)]
#align(center)[#image("figures/fig_447.jpg", width: 100%)]
#align(center)[#image("figures/fig_448.jpg", width: 100%)]
#align(center)[#image("figures/fig_449.jpg", width: 100%)]
#align(center)[#image("figures/fig_450.jpg", width: 100%)]

#chapter("재즈 즉흥연주 수업에서 윤곽 활용 제안")

== 서면 연습

- 학생들에게 수업에서 배울 새로운 곡마다 윤곽을 작성하게 하라. 이전에 배운 스탠다드 재즈 진행에 대해 작성한 것과 같은 방식으로 작성하도록 한다.

  이는 학생들이 서면 형태로 패턴을 인식하는 데 도움을 주며, 화성 진행을 배우고 전조에 필요한 음을 식별함으로써 즉흥 연주를 준비하도록 돕는다.

- 학생들에게 각 윤곽에 대한 자신만의 변형을 작성하게 하라.

  학기 동안 각 윤곽에 대해 한두 개의 새로운 선율을 작성하면 학생들은 상당한 양의 음악적 아이디어를 갖추게 된다. 이를 연습하면 기술과 민첩성이 향상된다.

- 학생들이 윤곽, 책의 아이디어, 연습곡을 모델로 삼아 솔로를 작성하고 익히도록 하라.

  이를 통해 학생들은 지식을 창의적으로 통합하고 활용할 수 있다.

== 청음 훈련

- 수업 중 한 번에 한 윤곽씩 곡 위에서 윤곽을 부르게 하라. 모든 음을 4분음표 길이로 부르는 대신 네 번째 박자의 약박에서 강박을 미리 부르게 하라.
- 학생 개개인이 윤곽을 기반으로 한 스캣 솔로를 하게 하라. 두#sub[doo]와 닷#sub[daht]$$(재즈에서 사용하는 '가변 두#sub[variable doo]') 음절을 사용하여 재즈 아티큘레이션을 강조하도록 도와라.

  이는 학생들이 청각적으로 음을 식별할 수 있도록 준비시킨다. 음을 청각적으로 인식할 수 있게 되면 화성을 통해 선율을 만드는 것이 쉬워진다.

== 기술 연습

- 수업 중 한 번에 한 윤곽씩 곡 위에서 윤곽을 부르게 하라. 모든 음을 4분음표 길이로 부르는 대신 네 번째 박자의 약박에서 강박을 미리 부르게 하라. 각 장에서 다룬 연습 문제를 진행한다.
- 윤곽을 바탕으로 더 흥미로운 선율을 만들어 곡에 적용하게 하라.

  학생들에게 명확하고 실용적인 연습 과제를 제공한다.

== 제한된 즉흥 연주

- 학생 개개인이 한 번에 한 윤곽만을 사용하여 곡 위에서 즉흥 연주하도록 하라. 모든 학생이 제1윤곽을 연주한 뒤, 제2윤곽으로 넘어가고, 그다음 제3윤곽으로 진행한다.

  제한을 두는 것은 통제력을 배우는 방법이다. 통제력은 모든 음악가와 작곡가가 어떤 스타일이나 분야에서든 추구하는 핵심 요소이다.

== 통합된 즉흥 연주

- 학생들이 세 가지 윤곽과 다른 자료를 자유롭게 사용하여 곡 위에서 즉흥 연주하게 하라.

  윤곽은 학생들이 명확한 화성 아이디어를 선형적으로 듣고 연주할 수 있도록 튼튼한 틀을 제공한다. 기본적인 경로를 듣고 이해할 수 있게 되면, 그 경로에서 벗어나 탐색하더라도 돌아올 지점과 방향을 알고 들을 수 있어 더 쉽게 연주할 수 있다.

== 17. 윤곽 인식하기 <sec_cannonball_answer>

윤곽을 식별하고 이를 꾸미는 데 사용된 기법을 알아보는 연습을 하라. 다음은 캐넌볼 애덜리의 다섯 가지 예시이다. 각각의 예시에서 어떤 윤곽이 사용되었는지 식별하고, 선율을 더 흥미롭게 만드는 데 사용된 기법이 무엇인지 분석하라.

#set enum(numbering: n => "17." + str(n) + ".")

1. 캐넌볼 애덜리\
  제2윤곽: 픽업음과 함께 방향이 반전됨.
  
#align(center)[#image("figures/fig_451.jpg", width: 47%)]
2. 캐넌볼 애덜리\
  제3윤곽: #chord("C7") 화음에서 옥타브 이동을 포함한 3-5-7-9 아르페지오.
#align(center)[#image("figures/fig_452.jpg", width: 47%)]
3. 캐넌볼 애덜리\
  제1윤곽: 멈췄다 가는#sub[stop and go] 리듬으로 인해 #chord("E7") 화음의 해결이 세 번째 박자까지 지연됨. #chord("E7") 화음의 아르페지오(3-5-7-9)로 #chord("Am") 화음의 해결이 지연됨.
#align(center)[#image("figures/fig_453.jpg", width: 47%)]
4. 캐넌볼 애덜리\
  제2윤곽: 화성음으로 도약하여 톱니형 모양을 만들고 #chord("C7") 화음의 해결을 지연시킴. 목표음(#note("E")) 앞에 반음계적 이끎음(#note("D#"))이 위치함. #chord("C7") 화음의 3도에서 근음으로 도약함.
#align(center)[#image("figures/fig_454.jpg", width: 47%)]
5. 캐넌볼 애덜리\
  제3윤곽: 아래에서 아르페지오 음을 사용함. 목표음(#note("A"))은 상·하위 이웃음에 의해 지연됨. 목표음(#note("A"))은 위(#note("C")-#note("Bb")-#note("A"))와 아래(#note("G")-#note("G#")-#note("A"))에서 접근함.
#align(center)[#image("figures/fig_455.jpg", width: 35%)]

#make-index(title: "연주자 색인")

#chapter("음악 용어 한국어 번역 일람")

#columns(2, [
  #set text(size: 0.9em)
  #set terms(hanging-indent: 1em)

  / 장음계: major scale.
  / 단음계: minor scale.
  / 화성 단음계: harmonic minor scale.
  / 나란한조: relative key. 같은 조표를 공유하는 조성. 예를 들어, #note("C")장조와 #note("A")단조는 나란한조이다.
  / 같은으뜸음조: parallel key. 같은 으뜸음을 공유하는 조성. 예를 들어, #note("C")장조와 #note("C")단조는 같은으뜸음조이다.
  / 전조(轉調): modulation.
  / 임시표: accidental.
  / 조성 중심 순환: key center cycle.
  / 으뜸음: tonic. 조성 중심#sub[tonal(key) center]이라고도 한다.
  / 이끎음: leading tone. 온음계의 일곱 번째 음.
  / 으뜸화음: tonic chord. 으뜸음을 근음으로 하는 화음.
  / 딸림화음: dominant chord. 온음계의 다섯 번째 음을 근음으로 하는 화음.
  / 위으뜸화음: supertonic chord. 온음계의 두 번째 음을 근음으로 하는 화음.
  / 부딸림화음: secondary dominant. #pageref(<sec_modulation>)쪽 참조.
  / 으뜸(화)음화: tonicize. 곡 전체의 으뜸(화)음이 아닌 (화)음을 임시 으뜸(화)음으로 취급하는 것.
  / 차용화음: borrowed chord. #pageref(<sec_modulation>)쪽 참조.
  / 화성음: chord tone. 화음을 구성하는 각 음.
  / 비화성음: non-harmonic tone.
  / 화성 리듬: harmonic rhythm.
  / 성부 진행: voice leading.
  / 종지: cadence.
  / 셋온음: tritone. 온음 3개의 간격으로 이루어진 음정.
  / 셋온음 대체: tritone substitution. 한 딸림화음을 그것에서 셋온음 떨어진 딸림화음으로 대체하여 사용하는 것. 예를 들면 #prog("Dm7", "G7", "CM7")에서 #chord("G7")을 #chord("Db7")으로 대신하는 것을 말한다.
  / 경과음: passing tone. #pageref(<sec_passing_tone>)쪽 참조.
  / 이웃음: neighbor tone. #pageref(<sec_neighbor_tone>)쪽 참조.
    / 온음계적 상위 이웃음: diatonic upper neighbor tone (UNT).
    / 반음계적 하위 이웃음: chromatic lower neighbor tone (LNT).
  / 도피음: escape tone. 선율의 진행 방향과 반대로 한 계단 이동하여 배치한 음. 그 이후 원래 진행 방향으로 돌아가기 위해 도약한다.
  / 돈꾸밈음: turn.
  / 둘러싼음: encircled tone.
  / 대위선율: counter melody.
  / 복합선율: compound melody.
  / 가이드음: guide-tone.
  / 강박: upbeat. 이 책에서 별다른 언급이 없을 때에는 4분음표를 8분음표 두 개로 쪼갰을 때의 첫 번째 박을 의미한다.
  / 약박: downbeat. 이 책에서 별다른 언급이 없을 때에는 4분음표를 8분음표 두 개로 쪼갰을 때의 두 번째 박을 의미한다.
  / 세분화: subdivision.
  / 픽업음: pick-up note.
  / 계류(繫留): suspension.
  / 선행음: anticipation.
  / 톱니형: sawtooth. #pageref(<sec_sawtooth>)쪽 참조.
  / 중심축음: pivot note. #pageref(<sec_sawtooth>)쪽 참조.
  / 협화: consonance. #pageref(<sec_consonance>)쪽 참조.
  / 불협화: dissonance. #pageref(<sec_consonance>)쪽 참조.
])