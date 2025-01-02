#import "@preview/orange-book:0.4.0": book, part, chapter, my-bibliography, appendices, make-index, index, theorem, definition, notation,remark,corollary,proposition,example,exercise, problem, vocabulary, scr, update-heading-image, thmbox
//#set text(font: "TeX Gyre Pagella")
//#set text(font: "Lato")
//#show math.equation: set text(font: "Fira Math")
//#show math.equation: set text(font: "Lato Math")
//#show raw: set text(font: "Fira Code")

#let main-color = rgb("#999999")

#let outlinebox(title: [], width: 100%, body) = block(
  fill: none, stroke: 0.5pt + main-color, radius: 0pt, width: width, body, inset: 10pt)

#let exercisebox(body) = outlinebox[
  #align(center)[*추천 연습과제*]
  
  #body
]

#let fb(body) = box(width: 100%, body)

#let padbox(body) = block(inset: (x: 20pt, y: 20pt), body)

#let sans(body) = text(font: ("Helvetica", "KoPubDotum"),body)

#let note(notestr) = {
  let pat = regex("([A-Ga-g]|[IViv]+)(#|b|nat)?")
  let match = notestr.match(pat)
  assert(match != none, message: "Invalid note string")

  let (root, root_fs) = match.captures

  root_fs = if root_fs == "#" { $sharp$ } else if root_fs == "b" { $flat$ } else if root_fs == "nat" { $natural$ } else { $$ }

  $upright(#root)^#root_fs$
}


#let chord(chordstr) = {
  let pat = regex("((?:[A-G]|[IViv]+)(?:#|b)?)(M|m|dim|aug|halfdim|sus2|sus4|sus)?((?:[#b]?\d+)*)?(?:\/((?:[A-G]|[IViv]+)(?:#|b)?))?(?:\|(.+))?")
  let match = chordstr.match(pat)
  assert(match != none, message: "Invalid chord string")

  let (root, quality, extalt_str, slash, denom) = match.captures

  root = note(root)
  
  quality = if quality == "M" { $upright(M)$ } else if quality == "m" { $upright(m)$ } else if quality == "dim" { $degree$ } else if quality == "aug" { $+$ } else if quality == "halfdim" { $ø$ } else if quality == "sus2" { $upright(sus2)$ } else if quality == "sus4" { $upright(sus4)$ } else if quality == "sus" { $upright(sus)$ } else { none }

  quality = if quality != none { $#h(-0.05em)#quality$ } else { $$ }
  
  let extalt = extalt_str.matches(regex("([#b])?(\d+)")).map(x => (x.captures.at(0), x.captures.at(1))).map(x => (if x.at(0) == "#" { $sharp$ } else if x.at(0) == "b" { $flat$ } else { $$ }, x.at(1))).map(x => $#x.at(0) #x.at(1)$).join("")
  
  slash = if slash != none { $\/ #note(slash)$ } else { $$ }
  
  let denom_chord = if denom != none { chord(denom) } else { $$ }

  let num_chord = $#root quality #h(-0.05em)#extalt #slash$

  if denom != none {
    $#num_chord / #denom_chord$
  } else {
    $#num_chord$
  }
}
#set text(font: ("Times New Roman", "KoPubBatang"), lang: "ko")

#show: book.with(
  title: "선형적 화성을 통한 화성 연결",
  author: "버트 라이곤",
  main-color: main-color,
  paper-size: "a4",
  lang: "en",
  font-size: 11pt,
  // list-of-figure-title: "List of Figures",
  // list-of-table-title: "List of Tables",
  supplement-chapter: "Chapter",
  supplement-part: "Part",
  part-style: 0,
  copyright: [
    © 1996 Houston Publishing, Inc.

    224 South Lebanon Street, Lebanon, IN, 46052, USA

    All Rights Reserved International Copyright Secured Printed In The USA
  ],
  lowercase-references: false
)

#set text(font: ("Times New Roman", "KoPubBatang"), lang: "ko")
#set par(leading: 0.9em, spacing: 1.2em)
#set sub(size: 0.9em)

#chapter("개요", l: "chap1")

재즈 즉흥연주를 가르치는 목표 중 하나는 학생들이 리듬적으로 일관되고 조화적으로 구체적인 라인을 연주할 수 있도록 하는 것이다. 대부분의 즉흥연주 학생들은 화성학적으로나 리듬적으로 모호한 라인을 연주하는 능력을 가지고 수업에 참여한다. 훌륭한 재즈 솔로 중 많은 경우, 리듬 섹션이 제거되더라도 즉흥 연주 라인에서 박자, 형식, 화성을 여전히 들을 수 있다. 그러나 초보 즉흥 연주자들은 리듬 섹션이 조화와 리듬을 제공하기를 기대하면서, 자신은 그 위를 가볍게 스케이팅하듯 연주하는 경우가 많다.

많은 재즈 교재와 수업에서는 개별 화음과 관련된 재즈 이론 자료를 다룬다. 소니 롤린스#sub[Sonny Rollins]는 디지 길레스피#sub[Dizzy Gillespie]가 어떻게 화음을 연결하는지 이야기한 바 있다. 이 책은 롤린스가 언급한 훌륭한 재즈 솔로에서의 화음의 선형적인 연결, 즉 화음 간의 연결을 다룬다. 이 텍스트는 뛰어난 재즈 아티스트들의 솔로 발췌를 기반으로 즉흥적인 재즈 멜로디 라인의 선형적-수평적 연결을 상세히 탐구함으로써 다른 교재를 보완하려는 목적을 가지고 있다.

== 즉흥연주의 접근법

재즈 스탠다드 곡에서 즉흥 연주를 하는 데는 기본적으로 세 가지 접근 방식이 있다. 선율의 변주, 화성을 활용한 즉흥 연주, 그리고 앞의 두 가지와 중첩될 수 있는 동기적 전개#sub[motivic development]다. 이 책은 두 번째 영역인 화성을 활용한 즉흥 연주를 다룬다. 여기서 논의되는 화성적 윤곽을 확장하는 기술은 선율 변주에 적용될 수 있다.

== 화성을 활용한 즉흥 연주의 접근법

재즈 문헌에서 선율적·화성적 자료를 다루는 방법은 다양하다. 수백 개의 재즈 솔로를 채보하고 분석한 결과, 훌륭한 재즈 음악가들은 화성이 가진 함의를 세 가지 방식으로 접근한다는 것을 발견했다. 화성적 구체성, 화성적 일반화, 또는 화성적 함의의 무시다.

- *화성적 구체성*: 화성의 함의에 세심한 주의를 기울임. 적절한 3도와 알맞게 해결하는#sub[resolving] 7도에 의존함. 곡의 화음 기호나 선율이 가진 의미의 변화에 따라감.

- *화성적 일반화*: 함의하는 화성을 구체적으로 다루는 대신, 블루스 아이디어와 스케일에 의존함. 예컨대, $chord("ii")-chord("V")$ 진행의 경우 이를 종종 #chord("I") 화음으로 일반화함. 예를 들면, 다음과 같은 진행이 있을 때,

  #align(center)[#image("figures/fig_004.jpg", width: 34%)]

  다음 악구 전체에서 #note("C") 메이저 3화음과 #note("C") 메이저 블루스 스케일이 사용된다.

  #align(center)[#image("figures/fig_005.jpg", width: 50%)]

- *화성적 함의의 무시*: 이는 즉흥 연주 라인이 동기 기반의 즉흥 연주 방향을 따를 때 발생할 수 있음. 즉흥 연주자가 기존 화성 위에 다른 대체 화성을 도입하고자 하거나, 함의된 화음과 관련 없는 음을 의도적으로 연주하여 긴장을 만들어내기로 결정한 경우에도 나타날 수 있음.

경험 많은 재즈 즉흥 연주자들은 위에서 언급한 영역을 자유롭게 오가며 연주한다. 이들은 항상 화성학적으로 구체적인 연주를 할 수 있으며, 일반적이거나 모호한 상태로 연주한 후에도 종종 구체성으로 돌아온다. 경험 많은 즉흥 연주자가 의도적으로 모호하게 연주할 때는 화성적 함의를 잘 이해하고 있기 때문에 피해야 할 음을 정확히 알고 연주한다.

반면, 초보 즉흥 연주자는 일반적으로 구체성과는 반대로 나아간다. 처음에는 주로 잘못된 음을 연주하며 시작하고, 점차 곡 전반에 블루스 릭과 화성적 일반화를 삽입하는 방법을 발견한다. 그리고 연주 경험, 연습, 학습을 통해 화음적 함의를 더 구체적으로 대하는 방법을 익히며, 궁극적으로 화성의 명확성과 모호성 사이에서 균형을 맞추고 이를 통합하게 된다.

이 책은 초보자와 경험 있는 재즈 즉흥 연주자 모두가 즉흥 라인에서 화성적 명확성을 달성할 수 있도록 돕는 것을 목표로 한다. 필자는 여러 위대한 재즈 아티스트의 솔로에서 수백 개의 예시 선율를 가져와 분석하고, 그 기본적인 구조와 골격을 파악하여 세 가지 기본 윤곽으로 나누었다. 이 윤곽은 바흐에서 브레커#footnote[미국의 재즈 색소포니스트 마이클 브레커(Michael Brecker, 1949-2007). (역주)], 애덜리에서 자비눌#footnote[오스트리아의 재즈 키보디스트 조 자비눌(Joe Zawinul, 1932-2007). 캐넌볼 애덜리와 함께 연주하며 유명해졌고, 재즈 퓨전 밴드인 웨더 리포트를 공동으로 창단했다. (역주)]에 이르기까지 거의 모든 작곡가와 즉흥 연주자가 화성적 구조 안에서 통용하는 선율이다. 각 윤곽에 대해, 여러 재즈 아티스트들이 이 윤곽을 어떻게 음악적으로 흥미롭게 만드는지에 대한 기법을 논의할 것이다.

이 윤곽들이 화성적으로 구체적인 재즈 즉흥 연주에서 존재하는 모든 것을 포괄한다고 주장하지는 않는다. 그러나 이 윤곽은 매우 다양한 곳에서 긴 재즈 역사를 아우르며 발견될 만큼 풍부하여 간단명료한 즉흥 연주의 기초를 제공한다. 이 윤곽은 창의성을 제한하거나 경직시키려는 것이 아니다. 여기서 다룬 폭넓은 재즈 즉흥 연주자들은 각자의 개성과 창의성을 감추지 않은 채 화성의 본질을 개별화할 수 있는 수많은 방법을 발견했다.

이 윤곽을 제시하고 이를 설명하기 위해 예시를 새로 창작하는 대신, 필자는 재즈 아티스트들의 연주에서 원칙을 추출하고 실제 발췌문을 예시로 삼는 방식을 선택했다. 이러한 관점에서 이 책의 개념은 규범주의적#sub[prescriptive]이라기보다는 기술주의적#sub[descriptive]이다. 이 즉흥 연주자들이 라인을 구상할 때 무엇을 생각했는지 알 방법은 없지만, 그 결과를 면밀히 분석하고 검토할 수는 있다. 재즈 창작자들과 그들의 음악이 최종 권한을 갖는다.

== 기본 이론

=== 온음계 화음과 로마 숫자

이 책 전반에서, 화음은 으뜸음#sub[tonic]$$(또는 음조 중심#sub[tonal center])과의 관계를 기준으로 설명된다. 이 관계를 나타내기 위해 로마 숫자가 사용됩니다. 장조의 화성을 다룰 때, 화음은 기본적으로 장조 음계(major scale)에서 파생된 것으로 간주된다. 반면, 단조의 화성을 다룰 때는 화음이 #sans[화성] 단음계#sub[_harmonic_ minor scale]에서 파생된 것으로 간주된다. 다른 단음계도 존재하지만, 이 책에서는 화성 단음계만 논의한다. 화성 단음계는 3도와 6도가 낮아져 있지만, 이끎음#sub[leading tone]은 유지되어 5도 음 위에 형성된 화음이 딸림화음#sub[dominant chord]가 되도록 한다. 이 7도 음은 또한 3도와 7도 음 위에 형성된 화음에도 영향을 미친다.

장조와 단조 음계 모두에서 7개의 음이 있으므로, 각 음에 기반한 화음은 1부터 7까지의 로마 숫자로 표시됩니다. 대문자 로마 숫자는 장화음에 할당되며, 소문자 로마 숫자는 단화음 및 감화음에 할당된다. 감화음의 경우 숫자 뒤에 "$degree$" 기호가 추가된다. 반감화음은 $-7flat 5$로 표현하지 #sans[않는다]. 이는 변화($flat 5$)가 일어났음을 의미하지만, 실제로는 그렇지 않기 때문이다. (이 화음은 장조 및 화성 단음계 모두에서 자연스럽게 나타난다.) 반감화음은 소문자 로마 숫자 뒤에 “$ø$” 기호를 붙여 표기한다.

모든 장조 영역에서 간격적 관계(온 온 반 온 온 온 반)가 동일하듯이, 온음계적 화음과 그 성질도 그러하다. 예를 들어, 으뜸화음#sub[tonic chord]은 항상 장화음이고, 위으뜸화음#sub[supertonic chord]은 항상 단화음이다. 만약 위으뜸화음이 장화음처럼 보인다면, 그것은 위으뜸화음이 아니다. 이 화음은 다른 으뜸음을 나타내기 위해 기능하는 것이다. 예를 들어, 평행단조#sub[parallel minor] 등 다른 조성에서 빌려왔거나, 전조#sub[modulating]하거나, 어떤 코드를 그것의 딸림화음으로 으뜸화음화#sub[tonicizing]하기 위해 사용된 것일 수 있다.

다음은 #note("C") 장조의 온음계적 화음과 각각을 로마 숫자로 나타낸 것이다.

#align(center)[#image("figures/fig_006.jpg", width: 50%)]

다음은 #note("C") (화성) 단조의 온음계적 화음과 각각을 로마 숫자로 나타낸 것이다.

#align(center)[#image("figures/fig_007.jpg", width: 50%)]

=== 전조와 부딸림화음

바로크 시대부터 현대의 팝과 재즈 스타일에 이르기까지의 조화로운 음악에서 전조는 거의 항상 한 계단 위나 아래로만 이동하는 경우가 많다. 예를 들어 곡이 #note("C")장조에 있다면 1개의 올림표(G장조/E단조) 또는 1개의 내림표(F장조/D단조)으로 전조하거나, 나란한조인 단조#sub[relative minor]로 전조할 가능성이 높다. 새로운 조를 으뜸음화하기 위해 딸림화음이 사용되는데, 이러한 화음들을 부딸림화음#sub[secondary dominants]이라고 한다. 이는 새로운 조를 가리키는 역할을 하기 때문이다. 이러한 부딸림화음 위에서 즉흥 연주를 하려면 새로운 조의 음들을 고려해야 한다. 예를 들어, C장조에서 다음과 같은 부딸림화음과 그것이 가리키는 조, 그리고 필요한 임시표#sub[accidentals]를 볼 수 있다. 이를 완전히 이해하기 위해 모든 조에 대한 부딸림화음을 목록으로 만들어 보아야 한다.

부딸림화음, 또는 차용화음#sub[borrowed chords]는 그 기능과의 관계에서 설명된다. 예를 들어, #note("C")장조에서 #note("D")단조의 딸림화음인 #chord("A7") 화음이 진행에 나타난다면, 이는 #chord("V7/ii")로 표시된다. 이 화음은 #note("C")장조에서 #chord("VI") 화음으로 나타나지 않는다. 왜냐하면 #note("C")장조의 #chord("vi") 화음은 단조 화음이기 때문이다. #chord("A7")은 #note("D")단조의 딸림화음이고, #note("D")단조는 주어진 #note("C")장조에서 #chord("ii") 화음에 해당하므로, #chord("A7")은 #chord("ii") 화음의 딸림화음, 즉 #chord("V7/ii")이다.

처음 조성인 C장조에서 나타나는 대표적인 전조 또는 으뜸음화#sub[tonicization]를 부딸림화음, 로마 숫자 표기법, 그리고 필요한 임시표와 함께 나타내면 다음과 같다.

#align(center)[#table(
  columns: (auto, auto, auto),
  inset: 10pt,
  align: horizon,
  stroke: 0.5pt,
  table.header(
    [*으뜸음화될 새로운 조성 영역*], [*부딸림화음*], [*필요한 임시표*],
  ),
  [#chord("ii") $=$ #note("D")단조], [#chord("A7") (#chord("V7/ii"))], [#note("Bb"), #note("C#")],
  [#chord("iii") $=$ #note("E")단조], [#chord("B7") (#chord("V7/iii"))], [#note("F#"), #note("D#")],
  [#chord("IV") $=$ #note("F")장조], [#chord("C7") (#chord("V7/IV"))], [#note("Bb")],
  [#chord("V") $=$ #note("G")장조], [#chord("D7") (#chord("V7/V"))], [#note("F#")],
  [#chord("vi") $=$ #note("A")단조], [#chord("E7") (#chord("V7/vi"))], [#note("G#")],
)]

=== 협화와 불협화

협화#sub[consonance]과 불협화#sub[dissonance]이라는 용어는 화성적 틀 안에서의 안정성이나 불안정성을 나타낸다. 이 용어는 미적으로 듣기 좋은지 또는 불쾌한지와는 아무런 관련이 없다. 협화음정은 안정적으로 들리며, 불협화음정은 협화음으로 해결되기를 원한다. 역설적이게도 재즈 음악가들은 종종 불협화음을 더 매력적으로 여긴다. 이는 불협화음이 가지고 있는 움직임의 경향성 때문이다.

=== 화성 리듬과 재즈 연주

화성 리듬#sub[harmonic rhythm]은 화성 변화의 리듬을 말한다. 화음이 두 박자마다 바뀐다면, 화성 리듬은 2분음표이다. 화음이 네 박자마다 바뀐다면, 화성 리듬은 온음표이다. 재즈 연주에서는 다양한 화성 리듬이 존재하며, 이 모든 것이 박자나 악보에 쓰인 위치와 일치하지는 않는다. 예를 들어, $4\/4$ 박자에서 한 마디에 하나의 화음이 있을 경우, 베이스는 일반적으로 첫 번째 박자에서 화음의 근음을 연주하며, 이는 악보에 표시된 화음 기호와 일치한다. 그러나 피아니스트나 기타리스트는 화음 기호를 업비트#sub[upbeat]에 예상하여 연주할 수 있다. 이것이 재즈 리듬 섹션의 폴리리듬 에너지의 일부이다. 선율이나 즉흥 솔로는 베이스와 함께 연주하거나, 반주 악기와 함께 연주하거나, 화음 변화를 더 일찍 예상하여 연주하거나, 다음 마디로의 해결을 지연시킬 수 있다. 이를 작성된 솔로를 분석할 때 염두에 두는 것이 중요하다. 우리는 쓰인 선율의 음표를 마디에 제한하지만, 화성적 함의는 항상 마디에 한정되지 않는다. 음들을 수직으로 배열했을 때 그것이 종종 무의미해 보일 수 있지만, 더 큰 화성적 틀에서 보면 솔로 연주자가 한 화음의 선율 재료를 다른 화음 위에서 미리 연주하거나 지연시켰을 수 있다. 이것은 재즈에만 국한된 것이 아니다. 교회 찬송가에서도 이러한 계류#sub[suspension]를 자주 볼 수 있다. 재즈에서의 계류는 많은 음표를 포함할 수 있다. 음악을 수직적 배열만으로 분석하려는 함정에 빠지지 말아야 한다. 음악은 선형적으로 들리고 구상되며, 따라서 그러한 방식으로 연구되어야 한다.

#exercisebox[
  + 오선지에 (#note("F#")와 #note("Gb")를 사용해서) 13개의 장조의 온음계적 화음을 적어라. 각 화음을 대소문자를 구별하고 뒤에 붙일 기호를 포함하여 로마 숫자로 나타내라.
  + 오선지에 (#note("D#")와 #note("Eb")를 사용해서) 13개의 단조의 온음계적 화음을 적어라. 화성 단음계가 사용되도록 해라. 임시표에 유의하라. 올린 7도는 #chord("iM7"), #chord("IIIM7#5"), #chord("viidim"), #chord("V7") 화음에 영향을 미친다. 각 화음을 대소문자를 구별하고 뒤에 붙일 기호를 포함하여 로마 숫자로 나타내라.
  + 앞서 보이는 것처럼 모든 장조 영역에 대해 표를 만들어라. 으뜸음화될 새로운 조성 영역과 부딸림화음, 필요한 임시표를 나타내라.
  + 임시표를 소리 내어 보는 연습을 해라. #note("C")에서 밀접한 관계에 있는 조성으로 전조하는 선율을 만들어 내 보아라. 다음 조성으로 넘어갈 때에 필요한 임시표를 사용해라. #note("C")조로 돌아오는 선율을 노래 불러라.
  + 흔한 재즈와 대중 가요를 가지고, 조성 영역을 파악할 수 있도록 로마 숫자를 활용하여 화성 진행을 분석해라.
]

#chapter("선형 화성", l: "chap2")

학생들은 종종 화성을 엄격히 수직적인 것으로만 이해한다. 즉, 화음을 위로 쌓거나 아래로 쌓은 형태로 생각한다. 화음은 수직적이지만, 화성과 선율은 선형적이며 시간이 지나면서 발생한다. 화성의 원리를 선율 발전에 적용하면 화성과 선율을 하나의 통합된 개념으로 이해하는 데 도움이 된다.

재즈 즉흥 연주는 종종 주어진 화성 진행에서 대위법으로 선율을 창조하는 것을 의미한다. 즉, 베이스 라인에 대한 대위선율#sub[counter melody]을 짓는 것이다. 대위법을 위한 최적의 음을 선택하는 것이 중요하다. 숙련된 재즈 즉흥 연주자는 그의 선율이 논리적으로 들리게 하는 데에 화음을 연주하는 피아노에 의존하지 않는다. 선율은 베이스 라인과 관계하여 잘 선택되고 잘 배치된 음들 덕분에 논리적으로 들린다.

== 12개의 반음 중 음 선택 좁히기

베이스 연주자의 역할은 근음 진행을 기반으로 선율을 만드는 것이다. 즉흥 연주자가 베이스 라인에 대해 대위선율을 만들 때 선율에서 근음을 강조하는 것은 최선의 선택이 아니다. 근음이 베이스에서 울리고 멜로디에서도 울리면, 대위법이 아니라 단순히 나란한 옥타브만 들린다. 근음을 제거하면 11개의 음이 남으며, 재즈 연주자들은 이 음들을 모두 사용한다. 이 남은 11개의 음은 화성적 구체성의 상대적 정도를 가진다.

조 중심을 결정하면 선택 범위를 더 좁힐 수 있다. 조 중심에는 7개의 음이 있다. 이미 근음은 제외했으므로(베이스가 이를 다루니까), 6개의 음이 남는다. 대부분의 경우 이 6개의 음 중 어느 것을 사용해도 괜찮지만, 항상 화성적으로 명확하지 않을 수 있다. 예를 들어, C장조에서 F는 조의 음이지만, 화성적 명확성을 위해 C 화음 위에서 강조할 첫 번째 선택은 아니다.

화음 기호는 보통 3\~4개의 음을 제안한다. 예를 들어, #chord("Dm7")은 $chord("D")-chord("F")-chord("A")-chord("C")$를 제안한다. 이러한 음들은 화성적으로 명확하며, 대선율을 위한 선택으로 고려해야 한다. D는 베이스가 이미 처리하고 있다. #note("A")는 화음의 특성을 알려주지 않는다. #note("C")는 불안정한 음으로, 자연스럽게 #note("B")로 끌려 내려가기를 원한다. #note("F")는 화음의 단조 특성을 드러내며, 베이스의 #note("D") 위에서 화성적으로 명확한 대위법을 위한 최고의 선택이다. 베이스의 #note("D") 위에 #note("F")만 연주해도, 두 음만으로도 완전한 단조 화음처럼 들린다.

C장조에서의 $chord("ii") - chord("V7") - chord("I")$ 진행($chord("Dm7") - chord("G7") - chord("C")$)의 경우, 베이스는 #note("D")에서 시작하여 #note("G")로 이어지는 선율을 즉흥 연주한다. #note("F")$$(화음의 3도)는 대위선율을 시작하기 위한 좋은 선택이다. #note("D") 위에서 #note("F")가 울리면, 단조 화음이 들린다. 같은 이유로, #chord("G") 화음에서는 #note("B")가 가장 명확한 선택이며, #chord("C") 화음에서는 #chord("E")가 가장 명확하다. 이러한 목표음을 결정한 뒤에는, 이 음들을 흥미로운 방식으로 연결하는 것이 남은 과제이다.

#align(center)[#image("figures/fig_009.jpg", width: 44%)]

우리의 귀는 7도 음정이 불안정하며 아래로 해결되기를 원한다는 것을 알려준다. 전통적인 화성학을 공부하면, 이러한 진행에서 화음의 7도 음이 다음 화음의 3도로 순차적으로 해결된다는 것을 알 수 있다. 7도 음은 방향을 제시하는 역할을 한다. #chord("Dm7")의 7도 음인 #note("C")는 순차적으로 내려가 #chord("G") 화음의 #note("B")로 해결된다. #chord("G") 화음의 7도 음인 #note("F")는 순차적으로 내려가 #chord("C") 화음의 #note("E")로 해결된다. 이러한 선율 구조는 이전보다 더 부드럽고 덜 각져있다.

#align(center)[#image("figures/fig_010.jpg", width: 44%)]

7도 음은 긴장감을 형성하며, 다음 화음의 3도로 해결되기를 원하는 욕구를 만들어낸다. 이러한 이유로, 7도 음은 종종 다음 화음으로 이동하기 직전에 연주되는 마지막 음이 된다. 때로는 해결이 다음 마디로의 계류를 형성하기도 한다.

*선형 화성#sub[linear harmony]*은 주요 음들을 사용하여 화음들을 부드럽게 연결하는 선율을 말하며, 이는 신중한 리듬적 배치를 포함한다. 좋은 성부 진행#sub[voice leading]이 관찰되며, 7도는 3도로, 9도는 5도로 해결된다. 3도는 더 협화적인 음이며, 일반적으로 멜로디 라인에서 7도와 같은 불협화음보다 먼저 나타난다. 7도는 일반적으로 마디선을 넘어 다음 화음의 3도로 해결되며, 다시 사이클을 시작한다. 협화/불협화/해결의 순환이다.

이 협화음과 불협화음, 3도에서 7도로, 다시 3도로 연결하는 방식은 몇 가지가 있을까? 즉흥 연주 수업에서, 학생들은 재즈 솔로에서 짧은 예시를 가져오라는 과제를 받았다. 수업에서는 이러한 예시에서 음악의 기본 원리를 추출하였다. 짧은 시간 내에, 모든 예시가 세 가지 범주에 속한다는 것을 알게 되었다. 이들은 동일한 세 가지 기본적인 골격에 기반하고 있었다. 모든 예시는 선형 화성의 원칙을 따랐다. 즉, 리듬적으로 중요한 위치에 협화음(주로 3도)을 배치하고, 이를 불협화음(7도)으로 이끌며, 다시 협화음으로 해결하는 방식이었다. 이는 일반적으로 마디선을 넘어 발생했다.

이 세 가지 골격 또는 윤곽은 화성 시스템에 기반한 많은 음악의 핵심에 존재한다. 이러한 윤곽을 아는 것이 창의성을 억제해서는 안 된다. 오히려, 이를 아는 것이 창의성을 고취해야 한다. 이 윤곽은 뼈대일 뿐이다. 우리의 몸은 모두 비슷한 뼈대를 가지고 있지만, 겉으로는 모두 독특하게 보인다. 모든 집은 비슷한 구조를 가지지만, 서로 다르게 보인다. 많은 문장이 동일한 문법 구조를 공유하지만, 다양한 아이디어를 표현할 수 있다. 수백 개의 음악 예시가 동일한 기본 윤곽을 가질 수 있지만, 여전히 고유한 음악적 정체성을 유지한다.

== 기본 윤곽 만들기

=== 제1윤곽

#padbox[
  3도를 첫 번째 박자에 배치하고 7도를 네 번째 박자에 연주하면, 베이스 워킹 라인에 대위하는 워킹 4분음표 선율을 만들기 위해 채울 박자가 두 개 남게 된다. 음계에서 내려가며 움직이면, #chord("ii") 화음의 3도에서 #chord("V7") 화음을 거쳐 #chord("I") 화음의 3도로 이어지는 순차적 선율이 만들어진다.

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

  #align(center)[#image("figures/fig_015.jpg", width: 38%)]
]

=== 제2윤곽

나는 제2윤곽을 "'Round Midnight" 윤곽이라고 부른다. 이는 _'Round Midnight_의 A섹션에서 두 번 등장한다. 제2윤곽은 #chord("ii") 코드(1-3-5)와 그 코드 위에 불안정한 음(7)을 추가한 상행 아르페지오이며, 추가한 음은 #chord("V7") 화음의 3도로 해결된다. 윤곽은 목표인 으뜸음의 3도에 도착하기 위해 음계를 계속해서 내려갈 수 있다.

#align(center)[#image("figures/fig_016.jpg", width: 47%)]

아니면, 계속해서 내려가지만 옥타브 이동을 포함할 수도 있다.

#align(center)[#image("figures/fig_017.jpg", width: 47%)]

아니면, #chord("V7") 화음의 3도에 도달한 후, #chord("V7") 화음(3-5-7-9)을 아르페지오로 만들 수도 있다.

#align(center)[#image("figures/fig_018.jpg", width: 47%)]

제2윤곽의 모든 형태는 단조에서도 적용 가능하다.

#align(center)[#image("figures/fig_019.jpg", width: 47%)]

#align(center)[#image("figures/fig_020.jpg", width: 47%)]

=== 제3윤곽

제2윤곽은 #chord("ii") 화음의 상행 아르페지오(1-3-5)로 시작하지만, 제3윤곽은 #chord("ii") 화음의 하강 아르페지오(5-3-1)로 시작한다. 여기에 화음 아래에 불안정한 음(7)을 추가하며, 이는 #chord("V7") 화음의 3도로 해결된다. 7도는 보통 업비트에 나타나고, 목표음인 3도는 강한 다운비트에 위치한다. 딸림화음에 도달한 후, 선율은 종종 방향을 바꾸어 3도에서 시작해 아르페지오 형태로 상승(3-5-7-9)하며, 결국 으뜸 화음의 5도로 해결된다.

#align(center)[#image("figures/fig_021.jpg", width: 47%)]

변형 중 하나는 선율이 음계를 따라 하강하여 으뜸화음의 3도에 도달하는 것이다.

#align(center)[#image("figures/fig_022.jpg", width: 47%)]

또 다른 변형은 음계의 방향을 옥타브 이동으로 바꾸는 것이다.

#align(center)[#image("figures/fig_023.jpg", width: 47%)]

제3윤곽의 모든 변형은 단조에서도 적용 가능하다.

#align(center)[#image("figures/fig_024.jpg", width: 47%)]

#exercisebox[
  + 기본 윤곽은 C장조에서 가장 일반적인 진행인 $chord("ii")-chord("V7")-chord("I")$ 진행($chord("Dm7")-chord("G7")-chord("C")$) 위에 표시된다. 오선지에 제1윤곽을 모든 장조에서 작성하라. 화음을 위에 이름으로 식별하라 (예: $chord("Dm7")-chord("G7")-chord("C")$).
	+ 오선지에 제2윤곽을 모든 장조에서 작성하라. 화음을 위에 이름으로 식별하라 (예: $chord("Dm7")-chord("G7")-chord("C")$).
	+ 오선지에 제3윤곽을 모든 장조에서 작성하라. 화음을 위에 이름으로 식별하라 (예: $chord("Dm7")-chord("G7")-chord("C")$).
	+ 세 가지 윤곽을 모두 연습하며 노래하라. 윤곽을 사용해 서로 밀접한 관계에 있는 조로 전조하고 다시 돌아오며, 필요한 임시표를 정확히 부르도록 주의하라.
]

#chapter("꾸밈 기법", l: "chap3")

이 책의 음악 예제를 보기 전에 재즈 음악가들이 사용하는 다양한 꾸밈 기법들을 정의하는 것이 도움이 될 것이다. 음악 예제는 세 가지 윤곽으로 나뉘고, 이후 기본 윤곽을 발전시키는 데 사용된 꾸밈 기법의 유형에 따라 나뉜다. 일부 윤곽은 아무런 꾸밈이나 장식 없이 발견되는 경우가 많다. 때로는 리듬적 배치만이 이들을 흥미롭게 만들기도 한다. 또 다른 경우, 이 윤곽들은 반음계적 진행과 꾸밈으로 가려져 있는 것처럼 보이기도 한다. 다음은 꾸밈 기법, 용어 및 이를 명확히 하는 예제에 대한 설명이다. 이 기법들은 책을 진행하면서 점점 더 친숙해질 것이다.

== 단순한 경우

윤곽은 종종 꾸밈이 거의 혹은 전혀 없이 나타난다. 이는 추가적인 음표 없이 단순한 리듬적 이동만 포함한다.

== 경과음

경과음#sub[passing tone]은 필수음들 사이의 반음계적 또는 온음계적 단계이다. 화음에서는 화음 구성원들 사이의 온음계 음을 말한다. (예: C장화음 = C (d) E (f) G (a b) C) 음계에서는 인접 음정 사이의 반음계 음을 말한다. (예: #note("C") (#note("c#")) #note("D") (#note("d#")) ...) 반음계 경과음은 온음 간격으로 인접한 온음계 음 사이에 배치될 수 있다. 모든 온음계 음은 반음계 이끎음#sub[chromatic leading tone]을 가질 수 있다. 예를 들어, #note("C#")은 D의 반음계 이끎음이며, #note("Cnat")과 D 사이의 반음계 경과음이다. #note("Db")은 #note("Dnat")과 #note("Cnat") 사이의 반음계 경과음이다. #note("C#")과 #note("Db")의 차이는 임시표가 암시하는 방향에 있다. 반음계적으로 변화된 음은 변화된 방향으로 계속 진행되는 경향이 있다. 내림표가 붙은 음은 내려가는 경향이 있고, 올림표가 붙은 음은 올라가는 경향이 있다.

'Round Midnight 윤곽은 아르페지오 윤곽이기 때문에, 화성음#sub[chord tones] 사이에 경과음을 넣기에 적합하다. 그러나 #chord("ii") 화음의 5도와 7도 사이에는 거의 경과음이 나타나지 않는다. #chord("ii") 화음의 5도와 7도 사이의 음은 #chord("V7") 화음의 필수음이다. 이 음은 보통 V7 화음을 위해 남겨둔다. 이는 이야기의 핵심, 결말, 또는 중요한 순간으로, 이를 미리 경과음으로 사용하여 결론을 드러내지 않는다.

== 이웃음

필수음 위와 아래의 음을 이웃음#sub[Neighbor Tones]이라 한다. (모차르트에서 찰리 파커까지) 일반적인 관행은 온음계적 상행 이웃음(Diatonic Upper Neighbor Tone, 이하 UNT)과 반음계적 하행 이웃음(Chromatic Lower Neighbor Tone, 이하 LNT)을 사용하는 것이다.

F #sans[장조]에서의 #note("C") 3화음에서 #note("C"), #note("E"), #note("G")는 필수음이다. #note("Dnat")는 #note("C")의 UNT이고, #note("Bnat")는 LNT이다. #note("Fnat")은 #note("E")의 UNT이고, #note("D#")는 LNT이다. #note("Anat")은 G의 UNT이고, #note("F#")는 LNT이다.

#align(center)[#image("figures/fig_025.jpg", width: 47%)]

F #sans[단조]에서의 #note("C") 3화음에서 #note("C"), #note("E"), #note("G")는 필수음이다. #note("Db")는 #note("C")의 UNT이고, #note("Bnat")는 LNT이다. #note("Fnat")은 #note("E")의 UNT이고, #note("D#")는 LNT이다. #note("Ab")은 G의 UNT이고, #note("F#")는 LNT이다.


#align(center)[#image("figures/fig_026.jpg", width: 47%)]

== 아르페지오 음

화음의 다른 음으로 도약함으로써 단순한 선율에 더 큰 각진 느낌과 흥미를 유발하는 꾸밈이다.

#align(center)[#image("figures/fig_027.jpg", width: 71%)]

#align(center)[흔한 아르페지오 음은 낮은 옥타브에서 연주되는 #chord("ii") 코드의 5도이다.]

#align(center)[#image("figures/fig_028.jpg", width: 65%)]

== 확장음

제2윤곽에서는 아르페지오가 종종 9도까지 확장되며, 때로는 11도까지 확장된 후 #chord("V7") 화음의 3도로 하강한다.

_'Round Midnight_ 윤곽은 일반적으로 #chord("ii") 화음의 근음에서 시작한다. 그러나 빌 에반스, 클리포드 브라운 등은 같은 아이디어를 사용하지만 #chord("ii") 화음의 3도에서 시작하기도 한다.

== 반음계적 접근

반음계적 접근#sub[chromatic approaches]는 일반적으로 온음계 음과 반음계적으로 변화된 음이 필수음으로 이어지는 형태를 포함한다. 온음계 음으로 시작하여 반음계 음을 경과음으로 사용해 필수음으로 이어질 수도 있고, 반대로 반음계 음으로 시작하여 온음계 이웃음을 통해 필수음으로 이어질 수도 있다. 반음계적 요소는 선율에 색채를 더하고, 추가된 음정이 리듬적으로 흥미롭게 만든다. 목표음은 종종 마디에서 강박에 위치한다. 목표음은 위아래에서 반음계적 접근으로 둘러싸일#sub[encircled] 수 있다. (둘러싼음#sub[encircling tones] 참조)

#padbox[
  #chord("ii") 코드의 3도는 온음 위로부터 반음계적으로 접근될 수 있다.

  #align(center)[#image("figures/fig_029.jpg", width: 22%)]

  혹은 온음 밑으로부터,

  #align(center)[#image("figures/fig_030.jpg", width: 22%)]

  혹은 둘 다에서,

  #align(center)[#image("figures/fig_031.jpg", width: 22%)]

  #chord("V") 화음의 3도는 종종 밑의 온음계 음으로부터 반음계적 경과음을 이어 접근된다.

  #align(center)[#image("figures/fig_032.jpg", width: 22%)]

  #chord("V") 화음의 3도는 종종 위와 아래에서 반음계적으로 접근된다. (후술할 C.E.S.H.에 대한 논의 참조)

  #align(center)[#image("figures/fig_033.jpg", width: 35%)]

  #chord("I") 화음의 3도는 보통 반음계적 경과음으로 접근된다.

  #align(center)[#image("figures/fig_034.jpg", width: 35%)]
]

== 옥타브 이동

One or more tones placed in another octave. This often makes the line more interesting by introducing a leap. Octave displacement is often necessary due to the ranges of the instruments, dramatic interest becoming a serendipitous result. Leaps most often occur after the main guide-tone, leap from down beat to upbeat; never over the barline and rarely from a weak beat to a strong beat. Leaps may involve arpeggiated tones in unexpected moves. Arpeggiated leaps occur when a moving from a chord tone to another chord tone skipping over a chord tone. Moving from the third of a chord up to its fifth is a movement larger than a step, but does not involve skipping over another chord tone. Moving from the third of a chord _down_ to its fifth involves a leap of a sixth, skipping over the root of the chord.

옥타브 이동#sub[octave displacement]은 한 음 또는 여러 음을 다른 옥타브로 위치시키는 기법이다. 이는 도약을 도입함으로써 선율을 더욱 흥미롭게 만드는 경우가 많다. 옥타브 이동은 종종 악기의 음역 때문에 필요하며, 극적인 흥미는 부수적인 결과로 나타난다. 도약은 주로 주요 가이드음#sub[main guide-tone] 뒤에 발생하며, 다운비트에서 업비트로 도약하는 경우가 많다. 도약은 마디선을 넘지 않으며, 업비트에서 다운비트로 도약하는 경우는 드물다. 도약은 예상치 못한 움직임으로 아르페지오 음을 포함할 수 있다. 아르페지오 도약은 한 화성음에서 다른 화성음으로 이동하면서 중간의 화성음을 건너뛸 때 발생한다. 예를 들어, 화음의 3도에서 5도로 올라가는 경우는 한 단계보다 큰 움직임이지만, 다른 화성음을 건너뛰지는 않는다. 반면, 화음의 3도에서 5도로 내려가는 경우에는 6도의 도약이 발생하며, 화음의 근음을 건너뛰게 된다.

#align(center)[#image("figures/fig_035.jpg", width: 35%)]

There are several instances of octave displacement included in the musical examples. The three most common occurrences leap after the arriving on the third of the chord.

예시 음악에는 여러 옥타브 이동 사례가 포함되어 있다. 가장 일반적인 세 가지 사례는 화음의 3도에 도달한 후 도약이 발생하는 경우이다.

#padbox[
  
  3도에서 9도 또는 감9도로 상행: 단순한 하행 음계 단계(3-2)에서 2도의 하강 대신 7도의 도약으로 대체되면 극적인 효과를 낸다. 이때 5도와 7도가 건너뛰어진다. 도약 후에는 음계가 보통 하강을 계속한다. 때로는 3도에서 9도로 도약할 때 화음 음을 건너뛰지 않기도 한다. 단순한 선율은 3-5-7-9 아르페지오를 사용하여 옥타브 이동으로 처리된다.

  #align(center)[#image("figures/fig_036.jpg", width: 77%)]
  
  3도에서 5도로 하행: 상행 아르페지오 3 $arrow.tr.filled$ 5 $arrow.tr.filled$ 7 $arrow.tr.filled$ 9 대신, 6도 아래로 도약한 뒤, 화음의 3도에서 화음의 5도로 근음을 건너뛰어 넘고, 아르페지오의 상행을 계속한다, 즉 3 $arrow.br.filled$ 5 $arrow.tr.filled$ 7 $arrow.tr.filled$ 9이다.
  
  #align(center)[#image("figures/fig_037.jpg", width: 35%)]
  
  3도에서 근음으로 상행: 화음의 3도에서 근음으로의 하행 도약을 5도를 건너뛴 상행 도약으로 대체한다. 이는 보통 라인을 끝마치게 한다. 으뜸화음의 근음을 들은 뒤 움직임이 멈추려 하기 때문이다.

  #align(center)[#image("figures/fig_038.jpg", width: 23%)]
]

== 둘러싼음

둘러싼음#sub[encircled tones]은 필수음 전에 두 이웃음을 사용하는 것이다. In some cases the essential tone is approached by several chromatic approach steps above and below. (See examples under chromatic approaches)

== C.E.S.H.

Jerry Coker's acronym for Chromatic Elaboration of Static Harmony. The most common example in a ii - V progression is the descending movement from the root of the ii chord to the third of the V7 chord. In the key of C (D minor - G7), the movement of D-#note("C#")-C-B. Other notes (the static harmony) are played in between the chromatic descending tones, sometimes implying compound melodies#footnote[A single melody line that implies two or more independent lines within is a compound melody.]. There are excellent examples of compound melodies throughout the literature, especially Bach solo cello sonatas. (See later examples in this book: Parker: ex.113)

#align(center)[#image("figures/fig_039.jpg", width: 35%)]

== Anticipation

Arriving at the next chord ahead of time, often creating a small dissonance resolved when the harmony catches up with the melody.

== Delayed Resolution

Suspending the resolution of one chord into the next chord. Arriving at the target chord late creating dissonance resolved when the melody catches up with the harmony.

== Sawtooth

A consistent up and down movement like the teeth on a saw. Often involves a pivot note or arpeggiated note: G-D-F-D-E.
#align(center)[#image("figures/fig_040.jpg", width: 69%)]

== Iteration

Repeated notes can create eighth note motion where the outline may only imply quarter notes. Composers have used this device for centuries. (Listen to the Brandenburg concerto in D, by Bach.)
#align(center)[#image("figures/fig_041.jpg", width: 68%)]

== Rhythmic Devices

Includes displacement, augmentation, diminution, anticipation, complex combinations of subdivision to add interest to the basic outlines.

== Adding Notes

Notes can be added before, within, and after the outline or any motive. Pick up notes begin with one or two notes before the outline begins. The notes can be diatonic or chromatic above or below, or arpeggiated tones.

== Use of Two or More Outlines within Example

Sometimes the melody includes two or more outlines. The same outline can be used twice sequentially, or one outline can lead into another.

== Borrowed Chords and Notes

(See the discussion on Diatonic chords and Roman numerals.) Some diatonic chords may be altered with tones “borrowed” from another key signature. When the harmony is altered, the lines are altered in the same way. Chords are often borrowed from the parallel minor key. iiø7 for a ii7, iv for IV, etc. Notes from the parallel minor key are often imposed on the dominant, creating more tension that diatonic tones, and therefore creating more release when arriving at the tonic major. Over G7, the dominant of C major, jazz musicians often use A-flat (flat 9) , B-flat (sharp 9) and E-flat (flat 13) from the parallel key of C minor. These borrowed tones, lowered diatonic pitches, have a greater downward pull than their diatonic counterparts. When modulating, chords are borrowed from the destination key. When moving from C major chord to a D minor chord, progressions pointing to the key of D minor often precede the D minor chord: V7 = A7, iiø7 - V7 = Eø7 - A7, or vii°7 = #chord("C#dim7"). The necessary notes to make the key change usually occur in the melodies over these changes: B flat and the leading tone C sharp.

== Change of Direction

제2윤곽 typically ascends (1-3-5) the ii chord before playing the seventh. Sometimes a dramatic change is to play the arpeggio descending, 7-5-3-1, before continuing its typical resolution to the 3rd of the V7 chord. The resolution of the seventh of ii to the third of V7 usually occurs in the same octave above the arpeggio. The arpeggio, rather than either ascending or descending, can be “broken”, i.e. played in a different order.

#padbox[
제2윤곽 typically ascends (1-3-5) before playing the seventh of the ii chord. There are times when the arpeggio descends. The resolution of the seventh of ii to the third of V7 occurs in the same octave above the arpeggio.

#align(center)[#image("figures/fig_042.jpg", width: 68%)]

제3윤곽 typically descends (5-3-1) before playing the seventh of the ii chord. There are times when the arpeggio ascends. The resolution of the seventh of ii to the third of V7 occurs in the same octave below the arpeggio.

#align(center)[#image("figures/fig_043.jpg", width: 68%)]
]

#chapter("제1윤곽", l: "chap4")


== 제1윤곽 in Simple Form


Here is the pattern in one of its simplest forms: beginning on the 3rd of the ii chord (G minor) down to the 3rd of the V7 chord (C7) and continuing up the arpeggio. The line comes to rest on the 3rd of the tonic chord.

1. 찰리 파커:

#align(center)[#image("figures/fig_044.jpg", width: 41%)]

The triplet gives rhythmic interest to this similar pattern.

2. 찰리 파커:

#align(center)[#image("figures/fig_045.jpg", width: 41%)]

Tom Harrell uses the pattern on a iii - V7/ii progression in the key of F. This Am7 chord is not the ii chord of the key of G major, rather the iii of the key of F major. Because of the key signature of one flat, the second note is B flat. The D7 chord is the secondary dominant to G minor the ii chord of F major. To get to G minor he needed to add one flat (E Flat) and add the leading tone to G minor (F sharp). In doing so he spelled out a D7 with a flat nine. Both chromatic tones pointing to the new key are included in the line.

3. 톰 하렐:

#align(center)[#image("figures/fig_046.jpg", width: 29%)]

The basic outline with rhythmic anticipation.

4. 톰 하렐:

#align(center)[#image("figures/fig_047.jpg", width: 47%)]

The next five examples use rhythmic devices to create interest.

Parker uses diminution of part of the outline. The key is F. The progression is iii - V7/ii in the key of F (see the discussion above).

5. 찰리 파커:

#align(center)[#image("figures/fig_048.jpg", width: 32%)]

Hubbard's line has a stop and go feeling with the mixture of quarter and eighth notes.

6.  Freddie Hubbard:
#align(center)[#image("figures/fig_049.jpg", width: 41%)]

Stitt elongates the beginning and compresses the end of his line.

7. Sonny Stitt:

#align(center)[#image("figures/fig_050.jpg", width: 41%)]

Harrell anticipates the Gm7 and’ flats the ninth of the dominant, borrowed from the parallel minor key.

8. 톰 하렐:

#align(center)[#image("figures/fig_051.jpg", width: 41%)]

Evans’ line has his signature eighth note on the up beat of one followed by a triplet, but the outline remains simple.

9. Bill Evans:

#align(center)[#image("figures/fig_052.jpg", width: 32%)]

Clifford Brown begins on the third of the ii, octave jumps and compresses the rest of the outline to get to the third of the V.

10. 클리포드 브라운

#align(center)[#image("figures/fig_053.jpg", width: 41%)]

These two outlines are almost completely unembellished. Dexter Gordon reverses the first two notes. Hubbard plays around the third of the ii chord before coming down the scale. The third of the V7 is delayed until beat three; the resolution to the I chord is right on beat one. Note the use of D flat, the flat nine of the C7 chord. This note is “borrowed” from the parallel key of F minor (four flats).

11. Dexter Gordon:

#align(center)[#image("figures/fig_054.jpg", width: 41%)]

12. Freddie Hubbard:

#align(center)[#image("figures/fig_055.jpg", width: 50%)]

Sonny Stitt begins with an ascending scale on the ii chord before playing the bare outline over just the V7 chord.

13. Sonny Stitt:

#align(center)[#image("figures/fig_056.jpg", width: 50%)]

Blue Mitchell starts on the third ascends and returns to the third, continues down to the third of the D7. Mitchell adds the fifth of A minor below ( an arpeggiated tone) which allows the third of D7 to land on beat one and gives the line a more angular shape.

14. Blue Mitchell:

#align(center)[#image("figures/fig_057.jpg", width: 44%)]

With the outline in quarter note values, an easy way to get eighth note motion is to repeat notes, sometimes called iteration. Another way to get motion is repeating part of the line. In ex.15, Ashley Alexander uses repeated notes; in ex.16, he plays two notes of the outline, then three, then five. Note the leap of the third to the root of the F7 chord.

15. Ashley Alexander:
#align(center)[#image("figures/fig_058.jpg", width: 69%)]

16. Ashley Alexander:
#align(center)[#image("figures/fig_059.jpg", width: 56%)]

The simple outline is interrupted by some interesting side maneuvers. The outline begins with eighth note values (B flat down to the E). On beat three of the first measure the values change to half notes (for the E and D). The C is on beat three of the second measure; the B flat on beat four (quarter note values). On beat one the line arrives on the third of the tonic.

17. 캐넌볼 애덜리:
#align(center)[#image("figures/fig_060.jpg", width: 62%)]

Parker does two things to add interest to this simple outline. Anticipating the beat by an eighth note gives it momentum. The F is encircled with upper and lower neighbor tones before continuing down. The resolution to the third of B flat is delayed; not arriving on beat one, but on the up beat of two.

18. 찰리 파커:
#align(center)[#image("figures/fig_061.jpg", width: 56%)]

These next three examples begin with many pick up notes. Material has been added before the outline begins. Harrell uses ascending scale material from the root of the ii chord then arpeggiates out to the eleventh before the simple descending scale outline leading to the third of the tonic. Hubbard, in a very similar manner, uses the upper part of the same material Harrell used and descends in the same manner. In ex.21 Harrell begins on the third of the ii chord, but ascends to the seventh rather than descends. He appears to land on the V7 chord on beat three with the D. The simple pattern begins in the second measure with the A flat. The outline is extended by encircling the B flat with its chromatic neighbors A and B natural, and the turn before finally landing on the G, the third of tonic chord.

19. 톰 하렐:
#align(center)[#image("figures/fig_062.jpg", width: 63%)]

20. Freddie Hubbard:
#align(center)[#image("figures/fig_063.jpg", width: 63%)]

21. 톰 하렐:
#align(center)[#image("figures/fig_064.jpg", width: 63%)]

One note is added to the next two examples. The third of the ii chord is on the upbeat of four, a chromatic lower neighbor tone is played on beat one, followed by the uninterrupted continuation of the outline to the third of the tonic chord.

22. Booker Little:
#align(center)[#image("figures/fig_065.jpg", width: 56%)]
23. 톰 하렐:
#align(center)[#image("figures/fig_066.jpg", width: 56%)]

This Harrell example is similar to Ex.23. In place of the chromatic tone is a rest. The ninth is lowered, borrowed from the parallel key of F minor (four flats).

24. 톰 하렐:
#align(center)[#image("figures/fig_067.jpg", width: 56%)]

This Harrell example is also similar to ex.23. In place of the chromatic tone is an arpeggiated leap to a chord tone (the fifth of G minor: D) below. This one device made a descending scale idea into an angular line.

25. 톰 하렐:
#align(center)[#image("figures/fig_068.jpg", width: 56%)]

J. J. Johnson uses a similar leap to a chord tone in ex.26. In this progression, the Am7 (iii) is substituting for the F (I). The D7 is the V7 of ii. The necessary accidentals (F sharp and E flat) needed to tonicize G minor are in the 3-5-7-9 arpeggio of the D7 chord:

26. J. J. Johnson:
#align(center)[#image("figures/fig_069.jpg", width: 44%)]

The following are simple outlines made more interesting with some simple chromaticism.

Fats Navarro compresses the first part of the outline and continues adding only the chromatic upper and lower neighbor tones to the E flat in the second measure. Compare this with similar chromatic encircling tones in ex.21.

27. Fats Navarro;
#align(center)[#image("figures/fig_070.jpg", width: 44%)]

Parker uses two pick up notes, the root of the ii chord and its chromatic leading tone, one extra lower chord tone, the D, to enhance the bare outline. Note the dramatic leap of the third to the root of the C7 chord.

28. 찰리 파커:
#align(center)[#image("figures/fig_071.jpg", width: 44%)]

Hubbard begins with a turn, skips to the chromatic leading tone before continuing the outline. Hubbard uses a downward leap at the end.

29. Freddie Hubbard:
#align(center)[#image("figures/fig_072.jpg", width: 44%)]

Clark Terry uses two chromatic tones: the chromatic passing tone (g flat) and the chromatic leading tone to E (D sharp). If Terry had not added these two notes, the outline would have been simple, and the E natural would have occurred on beat one. By adding these tones, it not only gave the line chromatic interest, but delayed the resolution to the C7 chord. We expect to hear the E on beat one. Instead we hear the “wrong” note F, and then another “wrong” note D sharp before the resolution to E on beat two.

30. Clark Terry:
#align(center)[#image("figures/fig_073.jpg", width: 44%)]

Parker adds a triplet and a turn on two borrowed tones (the altered ninths to the G7) to the essential outline.

31. 찰리 파커:
#align(center)[#image("figures/fig_074.jpg", width: 47%)]

== 제1윤곽 in a Minor Progression


In the key of F, the Aø7 - D7 tonicizes the ii chord (G minor). While not actually in the key of G minor, this excerpt modulates briefly to G minor, and provides an introduction to Outline No. 1 in a minor iiø7 - V7 progression. The outline is unadorned in the first example. In the second, the outline is simple, but resolves to G minor two beats early, returns to the dominant chord for three notes (A - C - A) then to the third of the G minor chord delayed until the second beat of the third measure. The A - C - A can be viewed either as part of the D7 chord (the dominant of G minor) or as the upper and lower neighbor tones to the B flat (the third of G minor).

32. 찰리 파커:
#align(center)[#image("figures/fig_075.jpg", width: 32%)]

33. 찰리 파커:
#align(center)[#image("figures/fig_076.jpg", width: 56%)]

In this line from near the end of a familiar bop tune#footnote[Most credit Parker with composing this bop tune in A flat. In his autobiography, Miles Davis claims authorship, and I've heard that Gil Evans credited Miles.]: in the key of A Flat, the progression shown is iii - V7 /ii - ii. The outline is in its simplest form.

34. Charlie Parker
#align(center)[#image("figures/fig_077.jpg", width: 44%)]

Many of the previous examples showed the descending scale/ascending arpeggio form of 제1윤곽. Here is the skeletal descending scale form. The line begins on the third, descends to the seventh; the seventh resolves to the next third, continues to the seventh, and resolves to the third of the tonic. The thirds occur on all strong beats; the sevenths occur on the last upbeat and resolve in the expected manner.

35. 찰리 파커:
#align(center)[#image("figures/fig_078.jpg", width: 53%)]

Here is a Jackie McLean excerpt in A minor. The third of the iiø7 chord occurs on beat four. An inverted 3-5-7-9 arpeggio breaks up the downward motion of the line which resolves soundly with the third of Fm on the downbeat.

36. Jackie McClean:
#align(center)[#image("figures/fig_079.jpg", width: 57%)]

This Bill Evans excerpt, like many others, has the outline intact, but occurs with pick-up notes, and occurs over just the V7 chord.

37. Bill Evans:
#align(center)[#image("figures/fig_080.jpg", width: 60%)]

Compare the three examples of Chet Baker’s over the same progression. Ex.38 is simple with some slight rhythmic diminution and displacement. Ex.39 begins with two pick-up notes from the scale, arrives at the C7 a beat soon, and uses a chromatic passing tone between the seventh and root of C7, encircling the C. Ex.40 begins with pick-up notes, including a chromatic passing tone (A natural), then continues down the scale to the third of F minor two beats early. The line ends with an often heard jazz quote from “Gone, But Not Forgotten.” Notice the low note in the line and the highest note in the last measure are both the target note A flat, the third of F minor. The notes between the two A flats are a way of filling out the octave.

38. Chet Baker:
#align(center)[#image("figures/fig_081.jpg", width: 41%)]

39. Chet Baker:
#align(center)[#image("figures/fig_082.jpg", width: 44%)]

40. Chet Baker:
#align(center)[#image("figures/fig_083.jpg", width: 62%)]

These two are straight forward examples from Tom Harrell. The first is quite simple. The second anticipates the iiø7 and the V7 chord and has the chromatic passing tone between B flat and C, like Ex.39.

41. 톰 하렐:
#align(center)[#image("figures/fig_084.jpg", width: 41%)]

42. 톰 하렐:
#align(center)[#image("figures/fig_085.jpg", width: 53%)]

Zawinul begins the outline expectedly on the third of the iiø7 chord, descends to the third of the V7 chord, then changes direction on beat four using an arpeggiated tone. The last two notes are the upper and lower neighbor tones to the G natural. The upper neighbor tone, while being a chromatic tone, is a diatonic note in C minor. The lower neighbor tone is a chromatic leading tone to G.

43. Josef Zawinul:
#align(center)[#image("figures/fig_086.jpg", width: 44%)]

Harrell often adds notes in between the descending scale tones which break up the predictability and straight-line feeling. After sounding the seventh of the C7 chord (B flat which wants to resolve to A flat) in ex.44, he plays three other notes (C, G, B flat), all chord tones of the dominant, and delays the resolution to F minor. In ex.45. Harrell begins above the third of the iiø chord and works his way down to the third of the V7 chord. Instead of continuing to the G flat, or ascending up the arpeggio (3-5-7-9) he octave displaces the fifth of the V7 chord then comes back to the G flat on beat three. Harrell extends the F7 into the last measure using two notes from the dominant before resolving to the D flat. (See the discussion for Ex.32.)

44. 톰 하렐:
#align(center)[#image("figures/fig_087.jpg", width: 53%)]

45. 톰 하렐:
#align(center)[#image("figures/fig_088.jpg", width: 53%)]

== 제1윤곽 in Other Progressions

=== TYPICAL PROGRESSIONS

*Root movement down a fifth (or up a fourth):* The most typical root progression is downward in fifths or upwards in fourths. D minor wants to resolve to G7; G7 wants to resolve to C major. The most frequent progression to lead to a major tonic: ii - V - I; for minor: iiø - V - i. Most of the examples in this book are from a ii - V - I or iiø - V - i progression because of their prevalence in jazz and harmonic music.

*Root movement down a third:* The second most common root movement. (C major to A minor.) Many improvisers will use an outline and treat the C major chord like an E minor, substituting the iii chord for the I chord.

#align(center)[#image("figures/fig_089.jpg", width: 80%)]

*Root movement in steps:* The least common root movement. (F major to G major.) many improvisers will use an outline and treat the F major chord like a D minor chord and progress to G, substituting the ii chord for the IV chord.

#align(center)[#image("figures/fig_090.jpg", width: 80%)]

These outlines will work with many other progressions. Anytime the root movement is down in fifths any of theses outlines will work, regardless of the quality of the chord. The above examples include ii - V7 - I, iiø - V7 - i, iii - V7/ii - ii. Here is list of some progressions from traditional harmony where these outlines can function.

In Major Keys:

ii — V7, V7 — I, I — IV, [IV — viiø], [viiø — iii] , iii — vi, vi — ii.

In Minor Keys:

iiø — V, V7 — i, i — iv, VI — iiø,

Here are two extended examples of Outline No. 1. The first example is over the progression ii — V7 — I — IV — $(upright("ii")ø - upright(V)7 - upright(i)) / upright("vi")$

This progression can be found throughout traditional literature. Some occurrences in jazz repertoire include: _Autumn Leaves, Spain, Alice in Wonderland,_ and _A Day in the Life of a Fool._ It is a key center cycle because it cycles through all the chords in sequence in a given key center: the ii - V7 - I cadence in major, the IV chord, which is also the VI chord in the relative minor, and then the iiø - V7 - i cadence in the relative minor. Bach interrupts the descending scale with an upper neighbor tone after the first note. The scale continues to descend, but changes to the bass voice. The soprano leaps from the third to the fifth of the second chord before continuing the sequence. The second example is constructed on a series of dominant chords from a turn-around on slow blues. Starting with the B natural over the G7 chord, every note descends stepwise, interrupted consistently with octave displacement. There are several examples of this from many players, but rarely this extended.

46. J. S. Bach: Prelude, English Suite in G Minor
#align(center)[#image("figures/fig_092.jpg", width: 80%)]

47. Mike Stern:
#align(center)[#image("figures/fig_093.jpg", width: 80%)]
#align(center)[#image("figures/fig_094.jpg", width: 53%)]

== 제1윤곽 with Octave Displacements


Often to add interest, the improviser will place a pitch in another register than the listener expects. This may be the result of invention or necessity if the player is in the extreme ranges of the horn. Refer to the earlier discussion of octave displacement and leaps.

The best example of 제1윤곽 with octave displacement is from Bach. It is many student’s favorite example, and they are surprised to discover the source of such a jazzy sounding musical example. The descending line is broken by a leap after the downbeats, (third to nine leaps). Leaps rarely occur over the barline. Leaps usually occur after the downbeat like Ex.47.

48. J. S. Bach: Three Part Sinfonia in D major
#align(center)[#image("figures/fig_095.jpg", width: 41%)]

This begins with the third of the ii chord and after a rest leaps to begins the rest of the descent.

49. Dexter Gordon:
#align(center)[#image("figures/fig_096.jpg", width: 41%)]

Through the use of passing tones and arpeggio tones, the octave displacement is somewhat disguised in this example. Still, with all the elaboration, the third of each chord occurs squarely on the downbeat every time.

50. Blue Mitchell:
#align(center)[#image("figures/fig_097.jpg", width: 56%)]

There are some chromatic notes leading to the third of the ii chord. The G flat reaches up to the F natural, like ex.50 and then descends down the diatonic scale with one chromatic passing tone between the root and seventh of the V7 chord. The leap from G flat to F in the second measure echoes the filled in octave displacement from the previous measure.

51. 클리포드 브라운
#align(center)[#image("figures/fig_098.jpg", width: 59%)]

There are two leaps in this example. The first breaks up the descending scale with an arpeggio (3-5-7-9) on the F7 chord. The arpeggio exhibits octave displacement by leaping down to the third before continuing up to the seventh and flatted ninth. The G flat descends to the third of B flat minor. The line leaps an octave before continuing the descent to the third of the E flat 7. The progression is in the key of A flat: V7/ii - ii - V7.

52. 클리포드 브라운
#align(center)[#image("figures/fig_099.jpg", width: 53%)]

Tom Harrell uses a similar arpeggio with octave displacement this time on the ii chord.

53. 톰 하렐:
#align(center)[#image("figures/fig_100.jpg", width: 56%)]

The 3-5 downward leap is evident in the following example. Parker pivots again on the low F before arpeggiating the E flat 7 chord. The thirds are on the beat, except in the first measure which begins with an accented upper nieghbor tone. The sevenths occur within the last beat. The altered ninths on the dominant are borrowed from the parallel key of A flat minor (seven flats) or G sharp minor (Five sharps).

54. 찰리 파커:
#align(center)[#image("figures/fig_101.jpg", width: 56%)]

The following use a similar arpeggio but include a lower neighbor tone to the fifth of the chord. The leap is even more dramatic jumping to a non-harmonic tone which resolves upwards continuing the arpeggio. In both examples, the thirds occur on the downbeats balancing the leaps and chromatic non-harmonic tones in the rest of the line.

55. Freddie Hubbard:
#align(center)[#image("figures/fig_102.jpg", width: 57%)]

56. 클리포드 브라운
#align(center)[#image("figures/fig_103.jpg", width: 45%)]

These two begin on the third of the ii chord, add a lower note before the next note in the outline, ascend up scale passages and arpeggios before the delayed resolution to the third of the V7 chord in the upper octave. Notice that the ascending scale breaks to avoid the upcoming target note. In ex.57, the scale that starts on beat three from C, goes to G, skips the A natural because it is the target note for the F7 chord. In ex.58, the F sharp is skipped because it is the target note for the D7 chord.

57. 클리포드 브라운
#align(center)[#image("figures/fig_104.jpg", width: 47%)]

58. 클리포드 브라운
#align(center)[#image("figures/fig_105.jpg", width: 55%)]

Rollins in this example uses many lower chord tones with their chromatic leading tones. The top of the line clearly follows the outline, the lower part provides angularity, rhythmic interest, and a kind of counterpoint compound melody line.

59. Sonny Rollins:
#align(center)[#image("figures/fig_106.jpg", width: 55%)]

The use of the chromatic lower neighbor tone to A natural and the last two measures resemble ex.59.

60. Sonny Stitt:
#align(center)[#image("figures/fig_107.jpg", width: 55%)]

Clifford resolves to the third of the V chord late and an octave higher than he first started.

61. 클리포드 브라운
#align(center)[#image("figures/fig_108.jpg", width: 32%)]

== 제1윤곽 with Arpeggiated Tones


Several of the previous examples were enhanced with the use of arpeggiated tones. In the following examples the target note is approached or followed by chord tones before moving through the outline.

Dizzy uses several chromatic notes which hold off the resolution to the third of the V7 chord. Two neighbor tones precede the third of D7. Once the F sharp is sounded there is the leap to the root.

62. Dizzy Gillespie:
#align(center)[#image("figures/fig_109.jpg", width: 44%)]

Parker begins with the same arpeggio form as the previous example; interrupts the outline with only one extra note (the G) and continues arpeggiating the F7 flat 9 chord.

63. 찰리 파커:
#align(center)[#image("figures/fig_110.jpg", width: 53%)]

The following Brown example has more chromatic embellishment than the preceding examples. The target tone is followed by a skip to a arpeggiated tone. The G natural is a chromatic passing tone. The target notes for B7 and E major are approached chromatically from below. In both cases, the line jumps from a chord tone to a chord tone before the chromatic tone leads to the target note. The ii and the V have their target notes on beat one. The I chord arrives on beat two. The seventh of B7 is the last note of the second measure and you would expect the G sharp on beat one. By adding the chromatic approach tones Brown created a delayed resolution.

64. 클리포드 브라운
#align(center)[#image("figures/fig_111.jpg", width: 60%)]

== 제1윤곽 with Chromatic Approach Tones


Several examples were found that have a basic descending scale outline, but were preceded with chromatic pick-up notes beginning a whole step above the target note. Starting a whole step above the target note means the chromatic note will be the major third over the ii chord. It is never heard as a major third; it is heard as a passing tone between two diatonic scale tones. Here are three simple examples: the first in major; the second in minor; the third, in diminution, tonicizing the ii chord in F major.

65. Booker Little:
#align(center)[#image("figures/fig_112.jpg", width: 60%)]

66. Freddie Hubbard:
#align(center)[#image("figures/fig_113.jpg", width: 59%)]

67. 찰리 파커:
#align(center)[#image("figures/fig_114.jpg", width: 32%)]

Hubbard plays the descending outline to the B flat, He then inserts three notes (an arpeggio with a passing tone) making the register shift and continues the descent with A and G.

68. Freddie Hubbard:
#align(center)[#image("figures/fig_115.jpg", width: 56%)]

Byrd uses two outlines over an extended progression in A flat: iii - V7/ii - ii - V. He begins with the chromatic approach tones and plays the simple outline over the iii - V7/ii. The second outline begins immediately with a octave displacement before continuing.

69. Donald Byrd:
#align(center)[#image("figures/fig_116.jpg", width: 68%)]

Brown uses an arpeggiated tone to extend the outline on the third and fourth beats making the target note arrive on time and the line have more sawtooth angularity.

70. 클리포드 브라운
#align(center)[#image("figures/fig_117.jpg", width: 50%)]

Stitt and Harrell approach the first target note from above, the second target from below.

71. Sonny Stitt:
#align(center)[#image("figures/fig_118.jpg", width: 50%)]

72. 톰 하렐:
#align(center)[#image("figures/fig_119.jpg", width: 56%)]

Brown begins with chromatic approach notes, circles the G with neighbor tones, uses sawtooth shapes similarly to ex.70 to delay the target note for C7.

73. 클리포드 브라운
#align(center)[#image("figures/fig_120.jpg", width: 56%)]

The next two involve different rhythmic approaches and several chromatic tones; borrowed tones, and chromatic neighbor tones.

74. Donald Byrd:
#align(center)[#image("figures/fig_121.jpg", width: 57%)]

75. 리 모건:
#align(center)[#image("figures/fig_122.jpg", width: 57%)]

Cannonball seems to get to the C7 on beat three and the F on the up beat of four, then returns to continue the descent to A. The last A anticipates the F chord by two beats.

76. 캐넌볼 애덜리:
#align(center)[#image("figures/fig_123.jpg", width: 56%)]

These two are straight forward. Clark Terry manages to get in two outlines in different registers.

77. 톰 하렐:
#align(center)[#image("figures/fig_124.jpg", width: 44%)]

78. Clark Terry:
#align(center)[#image("figures/fig_125.jpg", width: 60%)]

There are so many chromatic approaches it may be difficult to see and hear the simple outline at the core of these examples from Clifford Brown and Kenny Barron. In Brown’s first complete, measure, all of the downbeats suggest a stepwise line. The line continues on beat one of the second measure, is interrupted by two eighth notes and continues to the B natural. Since Barron is playing in sixteenth subdivisions the diatonic outline notes fall on the eighth note downbeats.

79. 클리포드 브라운
#align(center)[#image("figures/fig_126.jpg", width: 59%)]
80. Kenny Barron:
#align(center)[#image("figures/fig_127.jpg", width: 41%)]

Here are two more examples from Brown.

81. 클리포드 브라운
#align(center)[#image("figures/fig_128.jpg", width: 44%)]

82. 클리포드 브라운
#align(center)[#image("figures/fig_129.jpg", width: 68%)]

Leaps make these next two interesting. Evans leaps from the third to the flat nine of the V7 chord; Cannonball from the third to the ninth of the ii chord.

83. Bill Evans:
#align(center)[#image("figures/fig_130.jpg", width: 68%)]

84. 캐넌볼 애덜리:
#align(center)[#image("figures/fig_131.jpg", width: 44%)]

Harrell precedes the chromatic approaches with an arpeggio (5-7-9-11) of the ii chord. These extended arpeggiated notes could be viewed as a superimposed vi chord preceding the ii chord; or the 9th and 11th could be described as upper and lower neighbor tones to the third of the ii chord.

85. 톰 하렐:
#align(center)[#image("figures/fig_132.jpg", width: 44%)]

Harrell uses leaps for a dramatic effect. In the first, an octave leap; in the second a leap down from the third to the fifth of the E7 chord. In the second example, the target tones appear on beat three of the first measure, beat one of the second and third measure. In the last measure the target note is the first and last note, but in different registers.

86. 톰 하렐:
#align(center)[#image("figures/fig_133.jpg", width: 80%)]

87. 톰 하렐:
#align(center)[#image("figures/fig_134.jpg", width: 68%)]

== 제1윤곽 with Double Chromatic Approach Tones


At first glance, it may seem inexplicable that a C sharp and an E natural would sound good over a C minor 7. Viewing harmony as strictly vertical, these notes would not sound good; but when viewing them in a linear context we see and hear how these notes point to the target notes and make the line more interesting by creating and releasing tension. These next three examples exhibit chromatic approach tones a whole step above and below the target note for the ii chord. Over the C minor 7, the C sharp leads through D to the E flat, the F natural descends through the E natural to E flat. Note that Brown's arpeggiating the Cm7 chord (3-5-7-9) after arriving at the target note E flat breaks the descending scale idea and delays the F7 until beat two of the second measure.

88. 클리포드 브라운
#align(center)[#image("figures/fig_135.jpg", width: 56%)]

89. Sonny Rollins:
#align(center)[#image("figures/fig_136.jpg", width: 56%)]

90. 톰 하렐:
#align(center)[#image("figures/fig_137.jpg", width: 56%)]

== 제1윤곽: C.E.S.H.


The following examples all share similar chromatic elaboration. With only diatonic notes, 제1윤곽 moves downward from the third of the ii chord to the seventh of the ii chord and on to the third of the V chord. These examples (and some previously shown) have one added chromatic tone: the leading tone to the ii chord. In a ii - V progression in the key of C, the chromatic movement would be: D - #note("C#") - C - B.

#align(center)[#image("figures/fig_138.jpg", width: 35%)]

The chromatic altered tone stops the descent of the line; since it is a leading tone to the ii chord it pulls upwards. Often this momentarily changes the direction of the line, encircling the root of the ii chord before descending through the diatonic tones and finally resolving to the third of the V chord. Jerry Coker and others refer to this type of line as a _chromatic elaboration of static harmony,_ or C.E.S.H. This type of chromatic elaboration is found with all three outlines.

This example shows how the introduction of the chromatic leading tone to the B minor chord changes the direction of the line, encircles the B (with its diatonic upper neighbor and chromatic lower neighbor) before moving down through the tones to the G sharp.

91. Booker Little:
#align(center)[#image("figures/fig_139.jpg", width: 44%)]

Byrd plays the target thirds right on the downbeats. The note preceding the F is the seventh of A flat minor. After the C flat, he using the G natural and encircles the A flat like in ex.91.

92. Donald Byrd:
#align(center)[#image("figures/fig_140.jpg", width: 44%)]

Here are two related examples from Booker Little. In ex.93, he leads up to the first target note with diatonic scale steps. He then pivots off the chromatic seventh (B natural). The diatonic seventh (B flat) comes in where you would expect the A natural, creating a suspension delaying the resolution. The B flat is the diatonic upper neighbor, the G sharp the chromatic lower neighbor to A. The line descends to the target note for the tonic chord. Ex.94 begins on the target note and descends to the target note in almost the same way; the rhythm is changed so that the D natural occurs on beat one.

93. Booker Little:
#align(center)[#image("figures/fig_141.jpg", width: 57%)]

94. Booker Little:
#align(center)[#image("figures/fig_142.jpg", width: 57%)]

The target notes in ex.95 all occur on beat one with the sevenths preceding them. Farmer uses the B natural to change the direction briefly encircling the C. He uses a similar device with the G flat (borrowed from B flat minor) and E natural (LNT) encircling the F before continuing down to the target note D.

95. Art Farmer:
#align(center)[#image("figures/fig_143.jpg", width: 57%)]

Harrell begins ex.96 with pick up notes like those in ex.93. The last note of the first measure is the diatonic seventh leading to the target A on beat one. Notice that the A occurs twice in the F7 measure; on the strong beats one and three. Again the seventh (E flat) precedes the third (D) landing on beat one. The notes on each downbeat in the first measure of ex.97 form the bare diatonic outline. Note how Harrell uses the F sharp to point to the G, and uses the D natural as a pivot in the first measure of ex.97. Ex.98 resembles ex.97, however this time the resolution to C7 is delayed.

96. 톰 하렐:
#align(center)[#image("figures/fig_144.jpg", width: 69%)]

97. 톰 하렐:
#align(center)[#image("figures/fig_145.jpg", width: 69%)]

98. 톰 하렐:
#align(center)[#image("figures/fig_146.jpg", width: 56%)]

The ii chord is anticipated in this Harrell example. On the D flat 7 chord, tones are borrowed from the parallel key of F sharp minor (the A, E and D naturals from 3 sharps).

99. 톰 하렐:
#align(center)[#image("figures/fig_147.jpg", width: 56%)]

At first glance ex.100 looks complicated, but it is based on 제1윤곽. It begins on the target note, ascends and plays the target note again up the octave. The top notes of the rest of the line follow the outline. The lower notes play around the chromatic leading tone to D and the seventh which finally resolves to the B natural, the target note of the V7 chord.

100. 랜디 브레커:
#align(center)[#image("figures/fig_148.jpg", width: 53%)]

In ex.101 the broken thirds seem to be a string of neighbor tones. The first notes probably belong to the preceding G major chord. The last two notes in the first measure are the clearest; the third and seventh of C minor (ii). The seventh (B flat) resolves unexpectedly, made more so by the length it is held, to the B natural, before encircling C and continuing down the scale. Beats one and two are non-harmonic tones of the F7, but the next three down beats clearly spell a descending F triad.

101. 클리포드 브라운
#align(center)[#image("figures/fig_149.jpg", width: 54%)]

Hubbard anticipates the ii chord, uses the B natural to change the direction of the line, plays the B flat and continues to descend to the third of the I chord. The target note for F7 occurs on beat three, the target note for B flat occurs on beat one. The G flat is borrowed from the parallel key of B flat minor, with the recognizable augmented second sound. Lowering the G provides the line with more downward thrust; G flat pulls strongly into the F. There is an interesting balance with the two chromatic tones in this line. The raised tone (B natural) made the line move up, the lowered tone helped it move down.

102. Freddie Hubbard:
#align(center)[#image("figures/fig_150.jpg", width: 66%)]

== 제1윤곽: Chromatic and Rhythm Complexity


Several of the next group of examples have more chromaticism than previous examples. The types of chromaticism fall into the traditional categories discussed before. Some are just more complicated rhythmically.

First, notice that this example begins by pointing to the target note, the seventh is the last note and it resolves on the next downbeat, as we expect, to the third of the V7 chord, the next target note. The two altered tones are descending (notated as flatted notes) chromatic passing tones between diatonic tones a whole step apart.

103. Dizzy Gillespie:
#align(center)[#image("figures/fig_151.jpg", width: 44%)]

Barron begins with the upper and lower neighbor tones to the target note. The flatted notes over the F7 anticipate the B flat minor. The A flat and G flat give the line more downward momentum. The target notes are still on or near the strong downbeats.

104. Kenny Barron:
#align(center)[#image("figures/fig_152.jpg", width: 57%)]

Jackson begins these two similar examples on the target note and fills in with arpeggiated tones. Ex.105 encircles the second target note (B) and chromatically approaches the last target note (E); all target notes occur on the downbeats. Ex.106 includes a little more chromaticism, delays the target note B, and descends to the last note from the seventh. In both examples, Jackson altered the ninths on the dominant chord.

105. Milt Jackson:
#align(center)[#image("figures/fig_153.jpg", width: 57%)]

106. Milt Jackson:
#align(center)[#image("figures/fig_154.jpg", width: 57%)]

Within the first measure of ex.107 is a sequence. The line begins on the target note (B flat), descends one step, chromatic approaches from below to the next note and does the same thing to get to the target note E on the downbeat of the second measure. The next measure is a chromatic scale, but is still harmonically clear: the notes on every down beat spell out the arpeggio of the dominant ninth chord from the third: E - G - B flat - D flat (3-5-7-flat 9). All twelve chromatic pitches are used in this example, yet it remains harmonically clear; it is not random chromaticism. Target notes occur in rhythmically significant spots, non-harmonic chromatic notes resolve when and where we expect them.

107. Donald Byrd:
#align(center)[#image("figures/fig_155.jpg", width: 56%)]

The first note is the target note of ex.108. Harrell restates it an octave higher, adds only one chromatic note (#note("C#")) before moving down through the seventh to the third of the dominant. Take away every other note in the second measure, and the line still sounds good; all the eighth note values are chord tones.

108. 톰 하렐:
#align(center)[#image("figures/fig_156.jpg", width: 68%)]

Ex.109 is a similar line from the same tune as ex.108. The progression is similar but resolves to C major this time. Starting on beat four of the first measure is the outline without alteration (except for the E flat establishing C minor). The outline recurs beginning on the upbeat of two in the second measure. The last note is the target note for C major, and is approached from above through the seventh of G7.

109. 톰 하렐:
#align(center)[#image("figures/fig_157.jpg", width: 69%)]

Harrell approaches the target note encircling it with its upper and lower neighbor tones. The next note of the outline is octave shifted and occurs on the downbeat of the second measure. The first target note on a strong beat occurs in the second measure on beat three. In the last measure the outline appears unmodified, perhaps to balance the ambiguous previous statement.

110. 톰 하렐:
#align(center)[#image("figures/fig_158.jpg", width: 75%)]

Evans uses the outline on the progression V7/V - V7 in the key of F major. He starts on the target third and arrives at the 3-5-7-9 arpeggio of the C7 early. Cannonball arrives at the target notes late on the C7 and F7.

111. Bill Evans:
#align(center)[#image("figures/fig_159.jpg", width: 41%)]

112. 캐넌볼 애덜리:
#align(center)[#image("figures/fig_160.jpg", width: 69%)]

The addition of chromatic notes add color and make lines richer rhythmically. They help delay and anticipate target notes, which set up interesting accents, accents indigenous to the jazz style. The next two examples illustrate how adding chromatic embellishment can enliven a simple outline. At the heart of these examples is the simple diatonic descending outline. Play the bare outline with quarter note values and then either of the two examples and you can clearly hear their relationship.

Parker starts and restarts the outline, creating an accent the up beat of two. He plays a C.E.S.H. on the ii chord; the B natural delaying the resolution to the B flat and to the A. On the downbeat of the second measure he avoids the target note but plays two notes that point to the target note. The target note is sounded after its upper and lower neighbor tones, creating an accent on beat two, measure two. Beat four, measure two is accented by the root of the dominant approached chromatically from below. Three notes point to the final target note D, which does not occur until beat three of the third measure. E flat is the upper neighbor tone; C and C sharp approach from below. The top notes of the line spell the simple diatonic outline (indicated by the arrows above the staff). There is a counterline (indicated by the arrows below the staff) implied by some of the lower tones making this a compound melody. G, the last pitch of measure one, ascends to #note("G#") and then to the target note A in measure two. A, the last pitch of measure two ascends to B flat - C - C sharp and the target note D. There is a symmetry in the lower counter line beginning on the upbeat of four and leading up to the target thirds as the rest of the line leads down.

113. 찰리 파커:
#align(center)[#image("figures/fig_161.jpg", width: 62%)]

Garland aims for the third of each chord: ii - V7 - I - V7/ii - ii in this extended and chromatic line. All twelve pitches are used; yet the line is harmonically specific. The line begins and ends on the same target note. Six times diatonic notes are approached from whole step below with a chromatic passing tone. The target notes for F7 (A), B flat (D) and G7 (B natural) are approached in the same way: the preceding seventh leaps down to an arpeggiated note and then chromatically ascends to the target note. Three dramatic leaps occur after the target tone: the third of C minor leaps down to the fifth; the third of F7 leaps down to the fifth and then up the arpeggio (3-5-7-9); and the third of G7 leaps up to the flat nine, octave displacing the descending scale step B - A.

114. Red Garland:
#align(center)[#image("figures/fig_162.jpg", width: 72%)]

Playing just the notes of the simple outline, with their new rhythmic placement in ex.113. and ex 114 is interesting even without the chromatic additions. Up to now, we have seen how with additions the simple outline becomes more interesting. The opposite is true: taking away the insertions, ornaments, and embellishments also reveals interesting lines by the realignment of the original notes of the outline. Garland’s lines, with chromaticism removed, sound rhythmically more at home in a funk idiom.

#align(center)[#image("figures/fig_163.jpg", width: 71%)]

== 제1윤곽 in Combinations of More Than One Outline


The outlines are so common in jazz improvisation it is not unusual to see combinations of several outlines. On ex.115, Parker plays the same outline in two registers. The target notes do not occur on the strong beats; however, the highest and lowest notes in the line are the primary target notes.

115. 찰리 파커:
#align(center)[#image("figures/fig_164.jpg", width: 60%)]

From the bridge of a tune written for four tenors is an example of the outlines as a sequence. The progression is: ii - V7 - iii - V7/ii - ii. The first measure has no additional notes or embellishments. It is the outline variation that arpeggiates the V7 chord (3-5-7-9). The second measure is the descending scale variation with octave displacement. One note (E), and arpeggiated tone, is added displacing rhythmically the resolution to the last target note F.

116. Jimmy Giuffre:
#align(center)[#image("figures/fig_165.jpg", width: 59%)]

This is a classic sequence from Parker. The example can be found in many other Parker solos. Measure one is the descending scale variation with octave displacement (a third up to flat nine leap). Measure two arpeggiates the C minor from the third (with a third down to five leap), then descends to the target note A, and arpeggiates the F7 chord. The rhythm is compressed on the fourth beat to compensate for the extra inserted notes B flat and G. The progression is:

iii (substituting for I) - V7/ii - ii - V7 - I.

In order to modulate and tonicize the ii chord (Cm7), the G7, a secondary dominant, was used. To modulate from B flat (2 flats) to C minor (3 flats) two chromatic alterations are needed: A to A flat, B flat to B natural (the leading tone in C minor.) These two chromatic tones are the first pitches Parker plays on the G7 chord.

117. 찰리 파커:
#align(center)[#image("figures/fig_166.jpg", width: 60%)]

There is a sequence in ex.118 of 제1윤곽 with two different harmonic rhythms. The first measure is the fundamental outline embellished with two simple turns. The second measure begins with a leap from the target note to the note an octave higher. The chromatic turn using the G sharp help elongate the outline to account for the longer harmonic rhythm. Every chord has its third on a downbeat. Each third is preceded by the previous seventh on an upbeat.

118. 클리포드 브라운
#align(center)[#image("figures/fig_167.jpg", width: 80%)]

When there are two chords per measure in a jazz waltz, there is a question as to where to play the second chord. It can occur on beat three; but in jazz, often occurs on the upbeat of two. The second chord landing on the upbeat of two divides the measure in half. This kind of subdivision suggests two beats per measure rather than three. The implied time signature is 6/8, compound duple, superimposed over the 3/4 simple triple. Evans divides the first measure in half; the C7 lands on the upbeat of beat two. In the second measure, the B flat chord arrives on beat three.

119. Bill Evans:
#align(center)[#image("figures/fig_168.jpg", width: 80%)]

The next examples feature two outlines of different types.

Navarro uses 제1윤곽, followed by 제2윤곽 (with passing tones) over two chromatic ii - V7 progressions.

120. Fats Navarro:
#align(center)[#image("figures/fig_169.jpg", width: 74%)]

Over the same ii -V7 progression, Parker begins with 제2윤곽 (with a chromatic pick up note) and then plays 제1윤곽.

121. 찰리 파커:
#align(center)[#image("figures/fig_170.jpg", width: 75%)]

Brown displaces the first simple outline (no.1) beginning with the upper and lower neighbor tones to the first target note. Chromatic pickups to the G (which begins 제3윤곽) in the second measure gets the line back on time so the seventh of C minor and the target note A on the F7 chord arrive where we expect them. More chromatic pick up notes fill out the measure so that the E flat arrives on the upbeat of four placing the D on the downbeat. The rhythmic displacement is one element that makes this line interesting. Did the addition of extra notes create the rhythmic interest, or did the rhythmic displacement require the addition of extra notes?

122. 클리포드 브라운
#align(center)[#image("figures/fig_171.jpg", width: 75%)]

This final combination is from Parker’s solo on a well-known bop tune in A flat major. The progression is iii7 - V7/ii - ii7 - V7 - I in A flat major. The first is 제1윤곽, the second 제3윤곽. The dominant chords have the same pattern: a leap from the third to the flat nine and the chromatic approach to the fifth of the next chord.

123. 찰리 파커:
#align(center)[#image("figures/fig_172.jpg", width: 69%)]

#exercisebox[
  + Create your own lines using similar devices from the above examples.
  + Learn some of the above examples in all keys.
  + Write out solos on 스탠다드 재즈 진행s and incorporate some of the above examples. Practice the solos like any etude.
  + Try improvising over standard progressions and use some of the above examples in your solos.
  + Alter some of the above examples either by adding more notes, rhythmic displacing, fragmenting, etc. to come up with lines of you own.
  + Practice 제1윤곽 with iteration anticipating the thirds over the barline in all major and minor keys.

    #align(center)[#image("figures/fig_173.jpg", width: 56%)]
]

#chapter("제2윤곽", l: "chap5")

== 제2윤곽 in Simple Form


Here is an occurrence of 제2윤곽 from a well known jazz composition, followed by and example of a Wes Montgomery embellishment from his recording of the same tune. Montgomery uses a chord tone for a pick up note, triplets, and a chromatic approach to the target note C.

124. Thelonious Monk:
#align(center)[#image("figures/fig_174.jpg", width: 32%)]

125. Wes Montgomery:
#align(center)[#image("figures/fig_175.jpg", width: 32%)]

Here are several artists and the bare 제2윤곽.

126. 클리포드 브라운
#align(center)[#image("figures/fig_176.jpg", width: 41%)]

127. 클리포드 브라운
#align(center)[#image("figures/fig_177.jpg", width: 28%)]

128. Paul Chambers:
#align(center)[#image("figures/fig_178.jpg", width: 41%)]

129. Sonny Stitt:
#align(center)[#image("figures/fig_179.jpg", width: 41%)]

130. John Coltrane:
#align(center)[#image("figures/fig_180.jpg", width: 41%)]

131. 톰 하렐:
#align(center)[#image("figures/fig_181.jpg", width: 32%)]

These two descend to the seventh of the V7 chord through a chromatic passing tone.

132. 찰리 파커:
#align(center)[#image("figures/fig_182.jpg", width: 44%)]

133. 톰 하렐:
#align(center)[#image("figures/fig_183.jpg", width: 44%)]

The following are more examples of 제2윤곽 in a simple form.

134. 클리포드 브라운
#align(center)[#image("figures/fig_184.jpg", width: 47%)]

135. Bill Evans:
#align(center)[#image("figures/fig_185.jpg", width: 44%)]

136. 캐넌볼 애덜리:
#align(center)[#image("figures/fig_186.jpg", width: 44%)]

137. 톰 하렐:
#align(center)[#image("figures/fig_187.jpg", width: 56%)]

Like Tom Harrell in ex.137, Adderley anticipates the ii chord.

138. 캐넌볼 애덜리:
#align(center)[#image("figures/fig_188.jpg", width: 56%)]

Parker extends the arpeggio past the seventh to the ninth before aiming for the target note B occurring on beat three of the second measure.

139. 찰리 파커:
#align(center)[#image("figures/fig_189.jpg", width: 57%)]

== 제2윤곽 in Minor


All the outlines work as well for iiø - V7 in minor as they do in major. As shown before, they work for any progression with root movement downward in fifths. Ex.140 points to C minor, but resolves to C major. Heath arrives on the major third of C and arpeggiates the chord (3-5-7-9), but leaps down to the fifth before ascending.

140. Jimmy Heath:
#align(center)[#image("figures/fig_190.jpg", width: 44%)]

141. Art Farmer:
#align(center)[#image("figures/fig_191.jpg", width: 44%)]

== 제2윤곽 With Notes Added


Any musical motive can be embellished by adding notes. Notes can be added before, within, and after the motive.

These three from Tom Harrell all include notes added within the outline. The added notes are the upper and lower neighbor tones to the third of the ii chord. This adds rhythmic and melodic energy to the line. He chooses to encircle the target note, creating a slight tension and ambiguity. In ex.144, the arpeggio occurs first in a descending form, and then, beginning on beat four of the first-measure, begins the ascending form with additional notes: the C and A encircle the B flat; the C a passing tone between B flat and D. The rest of the outline is unaltered.

142. 톰 하렐:
#align(center)[#image("figures/fig_192.jpg", width: 35%)]

143. 톰 하렐:
#align(center)[#image("figures/fig_193.jpg", width: 56%)]

144. 톰 하렐:
#align(center)[#image("figures/fig_194.jpg", width: 57%)]

The next examples begin with pick up notes added before the outline. Adderley and Stitt begin with a chromatic leading tone. Rollins begins with arpeggiated notes and chromatic approach tones to the third of F7. Brown uses an interesting color tone for the B minor; the #note("G#") almost suggests the entire line relates more to E7 than to Bm.

145. 캐넌볼 애덜리:
#align(center)[#image("figures/fig_195.jpg", width: 59%)]

146. Sonny Stitt:
#align(center)[#image("figures/fig_196.jpg", width: 32%)]

147. 클리포드 브라운
#align(center)[#image("figures/fig_197.jpg", width: 44%)]

148. Sonny Rollins:
#align(center)[#image("figures/fig_198.jpg", width: 56%)]

Stitt starts with a chromatic leading tone. The outline notes in the second measure are chromatically approached from a whole step below.

149. Sonny Stitt:
#align(center)[#image("figures/fig_199.jpg", width: 56%)]

Gillespie begins with several chromatic pick up notes exhibiting nothing harmonically specific, then plays the ii chord arpeggio twice before finally resolving it to the target note of the V7 chord (B).

150. Dizzy Gillespie:
#align(center)[#image("figures/fig_200.jpg", width: 56%)]

== 제2윤곽 With Passing Tones

=== SIMPLE PASSING TONES


Passing tones: Since 제2윤곽 is an arpeggiated outline, it lends itself to diatonic passing tones between the chord tones. However, there is rarely a passing tone between the 5th and 7th of the ii chord. The tone between the 5th and 7th of the ii chord is the target note of the V7 chord. This tone is usually saved for the V7 chord. It is the punch line, the denouement of the story, that is not given away by using it ahead of time as a passing tone. Notice the similarity of these examples and the differences determined by when in the measure they begin.

151. 클리포드 브라운
#align(center)[#image("figures/fig_201.jpg", width: 44%)]

152. 클리포드 브라운
#align(center)[#image("figures/fig_202.jpg", width: 53%)]

153. 리 모건:
#align(center)[#image("figures/fig_203.jpg", width: 59%)]

154. Sonny Stitt:
#align(center)[#image("figures/fig_204.jpg", width: 53%)]

155. Fats Navarro:
#align(center)[#image("figures/fig_205.jpg", width: 44%)]

156. 톰 하렐:
#align(center)[#image("figures/fig_206.jpg", width: 56%)]

157. 톰 하렐:
#align(center)[#image("figures/fig_207.jpg", width: 44%)]

158. 톰 하렐:
#align(center)[#image("figures/fig_208.jpg", width: 32%)]

Harrell uses the same outline as Coltrane from Ex.130, but with passing tones.

159. 톰 하렐:
#align(center)[#image("figures/fig_209.jpg", width: 44%)]
=== PASSING TONES WITH PICK UP NOTES


The following outlines all include passing tones and all begin with added pick up notes. They range from one added diatonic note:

160. 캐넌볼 애덜리:
#align(center)[#image("figures/fig_210.jpg", width: 69%)]

two added diatonic notes:

161. 클리포드 브라운
#align(center)[#image("figures/fig_211.jpg", width: 56%)]

lower neighbor tones:

162. 클리포드 브라운
#align(center)[#image("figures/fig_212.jpg", width: 57%)]

163. 톰 하렐:
#align(center)[#image("figures/fig_213.jpg", width: 57%)]

an escape tone:

164. Bill Evans:
#align(center)[#image("figures/fig_214.jpg", width: 60%)]

and encircling upper and lower neighbor tones:

165. 캐넌볼 애덜리:
#align(center)[#image("figures/fig_215.jpg", width: 44%)]

166. 톰 하렐:
#align(center)[#image("figures/fig_216.jpg", width: 47%)]

Brown begins this one with chord tones, suggests the dominant of C minor (G7: implied by the tritone F and B natural), then 제2윤곽 with passing tones. The target note for F7 is delayed until the third beat. Notice how effective the E natural is when the B flat chord is expected, and that the “wrong” note is immediately followed by the triad

167. 클리포드 브라운
#align(center)[#image("figures/fig_217.jpg", width: 56%)]
=== PASSING TONES WITH 제2윤곽 ARPEGGIO EXTENSION


These next two are similar Clifford Brown examples. They both begin with pick up notes. The tones on the first two beats are diatonic scale tones interrupted by arpeggiated tones in ex.168 and an arpeggiated and chromatic leading tone in ex.169. Ex.168 extends the arpeggio out to the ninth of the ii chord.

168. 클리포드 브라운
#align(center)[#image("figures/fig_218.jpg", width: 44%)]

169. 클리포드 브라운
#align(center)[#image("figures/fig_219.jpg", width: 57%)]

These three examples from the same Tom Harrell solo show how similar material can recur in different ways. The first two begin on the root of the ii chord, move through the outline with passing tones, extend through the leading tone of the ii chord (G sharp) to the ninth and back down to the third of D7. The third example breaks the “rule” of playing the target note early: The F sharp appears as a passing tone before the D7 chord, but the negative effect is diminished by the extension of the line to the ninth of the ii chord.

170. 톰 하렐:
#align(center)[#image("figures/fig_220.jpg", width: 44%)]

171. 톰 하렐:
#align(center)[#image("figures/fig_221.jpg", width: 63%)]

172. 톰 하렐:
#align(center)[#image("figures/fig_222.jpg", width: 44%)]

On this example, Harrell plays up the scale from the root to the ninth of the ii chord, using the F7 target note (A natural). The ninth (D) becomes the upper neighbor tone to the root (C) which is encircled before the outline is played in the higher register. The outline uses all the diatonic passing tones in the higher register except for the A natural, which is saved for last.

173. 톰 하렐: Amazon
#align(center)[#image("figures/fig_223.jpg", width: 50%)]

== 제2윤곽 in Combinations of More Than One Outline


Parker begins with 제2윤곽 and ends with 제1윤곽. There are many occurrences of this line in different guises throughout Parker solos. They can be found in solos of disciples of Parker, like Sonny Stitt (ex.149). With the addition of chromatic approach tones, the top diatonic step progression has implied accents every dotted quarter note. The additional notes cause the second outline (no.1) to spill over into the F measure; Parker is not through with the C7 until beat three.

174. 찰리 파커:
#align(center)[#image("figures/fig_224.jpg", width: 59%)]

Clifford Brown and Josef Zawinul use 제2윤곽 in these sequential examples. The progression for all three is: iii - V7/ii - ii - V7 - I. Zawinul lands on thirds on strong beats preceded by the seventh of the previous chord every time but one.

175. 클리포드 브라운
#align(center)[#image("figures/fig_225.jpg", width: 60%)]

176. Josef Zawinul:
#align(center)[#image("figures/fig_226.jpg", width: 69%)]

177. 클리포드 브라운
#align(center)[#image("figures/fig_227.jpg", width: 80%)]

Zawinul plays 제2윤곽 on the ii - V, followed by 제1윤곽 on the iii - V7/ii.

178. Josef Zawinul:
#align(center)[#image("figures/fig_228.jpg", width: 69%)]

Brown uses 제2윤곽 on iii - V7/ii, 제3윤곽 on ii - V7 in the key of B flat. The leap from B natural up to the A flat (third to flat nine) is much more dramatic (especially on the trumpet) than stepping down. Notice the third of each dominant seventh is encircled with upper and lower neighbor tones. The F7 chord has a delayed resolution.

179. 클리포드 브라운
#align(center)[#image("figures/fig_229.jpg", width: 57%)]

제2윤곽 begins ex.180. The 3-5-7-9 arpeggio of A7 begins on beat four, but skips down from the third to the fifth before continuing up. 제1윤곽 is implied over the ii - V7, even though the target note for D minor is missing. The V7 arrives two beats early. 제1윤곽 occurs in the last two measure over V7 - I starting on the B natural, stepping down to the E and extending out the 3-5-7-9 arpeggio of C major. There are four arpeggios in this example: E minor, 3-5-7-9 of A7 and C, and an inversion of G7. Three of the arpeggios occur early: the A7, G7, and C major.

180. 클리포드 브라운
#align(center)[#image("figures/fig_230.jpg", width: 80%)]

Evans uses three outlines over this passage with rapid harmonic rhythm. 제2윤곽 over the ii - V7; 제3윤곽 over the iii - V7/ii; and anticipating the G minor by three eighth notes, 제3윤곽 over ii - V7 /vi - vi.

181. Bill Evans:
#align(center)[#image("figures/fig_231.jpg", width: 69%)]

제2윤곽 usually begins on the root of the ii chord and spells the arpeggio to the seventh: 1-3-5-7. These two examples demonstrate the “’Round Midnight” outline starting on the third, instead of the root, and arpeggiating 3-5-7-9.

182. 클리포드 브라운
#align(center)[#image("figures/fig_232.jpg", width: 44%)]

183. Bill Evans:
#align(center)[#image("figures/fig_233.jpg", width: 44%)]

== 제2윤곽 with a Change of Direction


There are several occurrences of the “’Round Midnight” outline with the direction changed. Instead of ascending the arpeggio of the ii chord, the arpeggio is turned upside down and descends in some way.

Rollins changes the direction, adds a C.E.S.H. and delays the resolution of the V7 chord in this example from the melody to an often played blues head.

184. Sonny Rollins:
#align(center)[#image("figures/fig_234.jpg", width: 44%)]

The following examples feature a change in the direction of the outline, but the seventh resolves to the third in the same octave.

185. 톰 하렐:
#align(center)[#image("figures/fig_235.jpg", width: 44%)]

186. Bill Evans:
#align(center)[#image("figures/fig_236.jpg", width: 44%)]

187. Freddie Hubbard:
#align(center)[#image("figures/fig_237.jpg", width: 56%)]

Hamilton uses the upside down outline in a sequence. The progression normally would have been: iii - V7 /ii - ii - V7 - I. The #chord("C#m7") chord itself is a chromatic passing chord used in place of the G7.

188. Scott Hamilton:
#align(center)[#image("figures/fig_238.jpg", width: 56%)]

The upside down outline occurs after chromatic pick ups. Chambers played the usual version of this outline elsewhere in this solo. (see Ex.128)

189. Paul Chambers:
#align(center)[#image("figures/fig_239.jpg", width: 44%)]

These two examples go both directions. Beginning on the seventh of the ii chord, they descend before ascending the arpeggio. Mitchell uses the altered ninths over the F7, borrowed from the key signature of the parallel minor (B flat minor). Hubbard plays the outline in a strict form over the D flat 7 chord.

190. Blue Mitchell:
#align(center)[#image("figures/fig_240.jpg", width: 57%)]

191. Freddie Hubbard:
#align(center)[#image("figures/fig_241.jpg", width: 56%)]

The “’Round Midnight” outline is at the heart of this extended C.E.S.H. It occurs in a simple form in the second measure after several ascending and descending statements (with both major [E sharp] and minor [E natural] sevenths) of the ii chord arpeggio.

192. Wes Montgomery:
#align(center)[#image("figures/fig_242.jpg", width: 69%)]

== 제2윤곽 Fragments


There are a few notes missing in these next examples to be complete outlines, but enough remains of the shape and character to include in this discussion.

The first note is omitted in these next three examples. The root of the ii chord is left off. Harrell plays another note which is heard probably heard as the leading tone to the F. Evans and Rollins leave of the first note and begin on the third. These omissions take none of the clarity away from the lines. They all emphasize the target note (third of ii) even more, and the root of the chord is covered by the bass. The sevenths occur on weak beats followed by the thirds on strong beats.

193. 톰 하렐:
#align(center)[#image("figures/fig_243.jpg", width: 38%)]

194. Bill Evans:
#align(center)[#image("figures/fig_244.jpg", width: 32%)]

195. Sonny Rollins:
#align(center)[#image("figures/fig_245.jpg", width: 50%)]

The next three do not have the first two notes of the outline. Harrell begins with a fragment of 제2윤곽 and ends with a statement of 제1윤곽.

196. 톰 하렐:
#align(center)[#image("figures/fig_246.jpg", width: 50%)]

Brown plays this fragment in two ways. The first time with a stop and go feeling created by the quarter and two eighths; the second time with the chromatic lower neighbor tones.

197. 클리포드 브라운
#align(center)[#image("figures/fig_247.jpg", width: 41%)]

198. 클리포드 브라운
#align(center)[#image("figures/fig_248.jpg", width: 41%)]


#exercisebox[
  + Create your own lines using similar devices from the above examples.
  + Learn some of the above examples in all keys.
  + Write out solos on 스탠다드 재즈 진행s and incorporate some of the above examples. Practice the solos like any etude.
  + Try improvising over standard progressions and use some of the above examples in your solos.
  + Alter some of the above examples either by adding more notes; rhythmic displacing, fragmenting, etc. to come up with lines of you own.
  + Practice 제2윤곽 anticipating the thirds over the barline in all major and minor keys.
    #align(center)[#image("figures/fig_249.jpg", width: 56%)]
]

#chapter("제3윤곽", l: "chap6")

== 제3윤곽 in Simple Form


These two identical (except for the key) examples of 제3윤곽 in its simplest form. Harrell uses the flatted ninth over the dominant chord (borrowed from the parallel minor key of F minor).

199. Jimmy Giuffre:
#align(center)[#image("figures/fig_250.jpg", width: 41%)]

200. 톰 하렐:
#align(center)[#image("figures/fig_251.jpg", width: 41%)]

Many jazz compositions include chords like in the following example. The ii chord is played over the root of the V7 creating a dominant suspension sound. Here is a partial list of chord symbols found to describe this sound (shown for the dominant of C = G): G7 sus, G9 sus, Dm7/G, Dm9/G, F/G. Since this sound is essentially the ii and V7 chord together, any of the outlines will work for this harmony.

201. 톰 하렐:
#align(center)[#image("figures/fig_252.jpg", width: 32%)]

So many of the examples have added passing tones, chromatic approaches, neighbor tones, and rapid sixteenth subdivisions. In this example, Rollins demonstrates how simple rhythms and placement can make the outline interesting.

202. Sonny Rollins:
#align(center)[#image("figures/fig_253.jpg", width: 44%)]

Bill Evans and Tom Harrell illustrate the outline variation where the line continues down the scale. The flatted ninth over the dominant occurs in all three.

203. Bill Evans:
#align(center)[#image("figures/fig_254.jpg", width: 44%)]

204. Bill Evans:
#align(center)[#image("figures/fig_255.jpg", width: 44%)]

205. 톰 하렐:
#align(center)[#image("figures/fig_256.jpg", width: 44%)]

The second variation of 제3윤곽 that continues down the scale with octave displacement is very common. It can be found in many jazz solos in every major and minor key. The credit listed below is from Coltrane, but any number of artists could have been used. The leap from the third to the flat nine on the dominant is one of its attractive elements; giving it characteristics of a compound melody. The first and last four notes sound like the primary melody; the remaining (second through the fifth notes) sound like a secondary answer, or counter melody.

206. John Coltrane:
#align(center)[#image("figures/fig_257.jpg", width: 44%)]

Parker adds some rhythmic variation and a chromatic approach to F in this example.

207. 찰리 파커:
#align(center)[#image("figures/fig_258.jpg", width: 62%)]

제3윤곽 in simple form within longer lines. Both Mitchell and Brown’s second measures resemble 제2윤곽.

208. 클리포드 브라운
#align(center)[#image("figures/fig_259.jpg", width: 53%)]

209. Blue Mitchell:
#align(center)[#image("figures/fig_260.jpg", width: 54%)]

Morgan adds chromatic passing tones and elongates the rhythm to account for the longer harmonic rhythm. All the sevenths and their target thirds occur where we expect them. Morgan avoids playing any type of B natural before the third measure, making the surprise resolution to G major more effective.

210. 리 모건:
#align(center)[#image("figures/fig_261.jpg", width: 60%)]

The ii chord is anticipated in these three examples. Harrell anticipates the ii and holds on to the V7 chord into the last measure. McLean anticipates the Gm7 chord, delays the resolution to C7 until beat four, the triplet 3-5-7 9 arpeggio hurries the line to the F chord, but its resolution is still delayed until beat three.

211. Bill Evans:
#align(center)[#image("figures/fig_262.jpg", width: 44%)]

212. 톰 하렐:
#align(center)[#image("figures/fig_263.jpg", width: 50%)]

213. Jackie McLean:
#align(center)[#image("figures/fig_264.jpg", width: 56%)]

Stitt begins with an ascending arpeggio, moves down with a C.E.S.H., and then plays the simple 제3윤곽 in the second measure. The change of direction, chromaticism, and resulting accents make this example stimulating.

214. Sonny Stitt:
#align(center)[#image("figures/fig_265.jpg", width: 59%)]

== 제3윤곽: C.E.S.H.


제3윤곽 seems to lend itself to the C.E.S.H. more than the other outlines, the chromatic motion often suggesting a compound melody. The following are several examples of the C.E.S.H. based on 제3윤곽. Some use the C.E.S.H. to delay the resolution of the V7 chord; some manage to use the C.E.S.H. and arrive at the V7 on time. Several (ex.215, 216, 217, 218, 219, 221) use the fifth of the ii chord below as a pivot note to give the line more of a sawtooth shape. The range of rhythmic variety in these passages illustrate how much rhythm has to do with personalizing the basic outlines or any musical idea.

215. 캐넌볼 애덜리:
#align(center)[#image("figures/fig_266.jpg", width: 50%)]

216. 톰 하렐:
#align(center)[#image("figures/fig_267.jpg", width: 44%)]

217. 클리포드 브라운
#align(center)[#image("figures/fig_268.jpg", width: 56%)]

218. 클리포드 브라운
#align(center)[#image("figures/fig_269.jpg", width: 44%)]

219. 리 모건:
#align(center)[#image("figures/fig_270.jpg", width: 53%)]

220. 찰리 파커:
#align(center)[#image("figures/fig_271.jpg", width: 53%)]

221. Freddie Hubbard:
#align(center)[#image("figures/fig_272.jpg", width: 59%)]

These two examples involve a change of direction. Even though they both begin with an _ascending_ arpeggio, like 제2윤곽, they are included with 제3윤곽 because the seventh resolves to the third below the arpeggio. The chromatic line (G-#note("F#")-F-E and F-E-Eb-D) in these passages are rhythmically almost identical and are interesting when played by themselves.

222. Dexter Gordon:
#align(center)[#image("figures/fig_273.jpg", width: 44%)]

223. Typical Latin Piano Ostinato:
#align(center)[#image("figures/fig_274.jpg", width: 45%)]

Notes are often added to the beginning of the outline as pick up notes.

Tom Harrell and Kenny Barron begin their lines on the third and move up the scale to the fifth of the ii chord.

224. 톰 하렐:
#align(center)[#image("figures/fig_275.jpg", width: 44%)]

225. Kenny Barron:
#align(center)[#image("figures/fig_276.jpg", width: 57%)]

Hubbard moves down chromatically from the third, ascends the arpeggio before the outline begins. Compare this C.E.S.H. to ex.220.

226. Freddie Hubbard:
#align(center)[#image("figures/fig_277.jpg", width: 57%)]

Parker begins with a wind up around the root of the ii chord and up the scale before the outline begins.

227. 찰리 파커:
#align(center)[#image("figures/fig_278.jpg", width: 69%)]

Harrell begins ex.228 with the seventh of ii as a pick up. After the C.E.S.H. over the ii - V7, another C.E.S.H. is implied over the I chord. The F natural from the second measure usually moves to the E on beat one. The F sharp changes the direction and delays the resolution to the E until beat three.

228. 톰 하렐:
#align(center)[#image("figures/fig_279.jpg", width: 60%)]

229. 톰 하렐:
#align(center)[#image("figures/fig_280.jpg", width: 65%)]

== 제3윤곽 Using a Lower Pivot Note (Arpeggiated Tone Below)


One note added below adds angularity and rhythmic interest to this outline. It was seen in several of the C.E.S.H. examples (ex.215, 216, 217, 218, 219, 221, 225, 226, 227, 228, 229). Here are several more using the fifth of the ii chord, as a pivot in a lower octave than the first note of the outline.

230. 찰리 파커:
#align(center)[#image("figures/fig_281.jpg", width: 56%)]

231. 찰리 파커:
#align(center)[#image("figures/fig_282.jpg", width: 44%)]

232. 클리포드 브라운
#align(center)[#image("figures/fig_283.jpg", width: 44%)]

233. 캐넌볼 애덜리:
#align(center)[#image("figures/fig_284.jpg", width: 44%)]

This line has symmetry with the third to root leap on both of the dominant seventh chords. 제3윤곽 begins before the Fm7, but resolves to the Bb7 on time.

234. 클리포드 브라운
#align(center)[#image("figures/fig_285.jpg", width: 44%)]

Cannonball uses the same line in the same solo in two key areas.

235. 캐넌볼 애덜리:
#align(center)[#image("figures/fig_286.jpg", width: 32%)]

236. 캐넌볼 애덜리:
#align(center)[#image("figures/fig_287.jpg", width: 45%)]

== 제3윤곽 in Combinations of More Than One Outline


This combination is from Parker’s solo on a well-known bop tune in A flat. The first is 제1윤곽, the second 제3윤곽. The dominant chords have the same pattern: a leap from the third to the flat nine and the chromatic approach to the fifth of the next chord. (This example was also shown as ex.123.)

237. 찰리 파커:
#align(center)[#image("figures/fig_288.jpg", width: 69%)]

Brown displaces the first simple outline (no.1) beginning with the upper and lower neighbor tones to the first target note. Chromatic pickups to the G (which begins 제3윤곽) in the second measure gets the line back on time so the seventh of C minor and the target note A on the F7 chord arrive where we expect them. More chromatic pick up notes fill out the measure so that the E flat arrives on the upbeat of four placing the D on the downbeat. The rhythmic displacement is one element that makes this line interesting. Did the addition of extra notes create the rhythmic interest, or did the rhythmic displacement require the addition of extra notes? (This example was also shown as ex.122.)

238. 클리포드 브라운
#align(center)[#image("figures/fig_289.jpg", width: 68%)]

Morgan begins stating the third and seventh of the ii chord before 제3윤곽. In the last two measures he uses 제1윤곽 with some interesting added chromatic tones. The #note("C#") — D point up to and the F — D point down to the E flat, the fifth of A flat 7.

239. 리 모건:
#align(center)[#image("figures/fig_290.jpg", width: 68%)]

Evans uses three outlines over this passage with rapid harmonic rhythm. 제2윤곽 over the ii - V7; 제3윤곽 over the iii - V7/ii; and anticipating the G minor by three eighth notes 제3윤곽 over ii - V7 /vi - vi. (This example was also shown as ex.181.)

240. Bill Evans:
#align(center)[#image("figures/fig_291.jpg", width: 68%)]

== 제3윤곽 with Passing Tones


The arpeggiated form of this outline lends itself to diatonic passing tones between the chord tones. Adding passing tones blurs the distinction between 제3윤곽 and 제1윤곽. Into which category these next examples fall is anybody’s call as they have elements of both no.1 and no.3. The central point is their harmonic clarity; thirds and seventh delineate the harmony.

241. 클리포드 브라운
#align(center)[#image("figures/fig_292.jpg", width: 44%)]

These chromatic passing tones do not blur the distinct harmonic clarity as the diatonic notes fall on strong beats..

242. 클리포드 브라운
#align(center)[#image("figures/fig_293.jpg", width: 44%)]

The resolution to the dominant chord is delayed until beat three by the sawtooth shape. The leap at the end of the line mirrors the leap at the beginning of the line.

243. 클리포드 브라운
#align(center)[#image("figures/fig_294.jpg", width: 44%)]

Tom Harrell in E flat minor.

244. 톰 하렐:
#align(center)[#image("figures/fig_295.jpg", width: 44%)]

This passage has a wide range and rhythmic contrasts..

245. 톰 하렐:
#align(center)[#image("figures/fig_296.jpg", width: 35%)]

The chord tones always occur on the strong beats in these two examples from Harrell.

246. 톰 하렐:
#align(center)[#image("figures/fig_297.jpg", width: 44%)]

247. 톰 하렐:
#align(center)[#image("figures/fig_298.jpg", width: 44%)]

Hubbard delays the resolution to the B flat for an entire measure. Compare this to Ex.174 of Parker.

248. Freddie Hubbard:
#align(center)[#image("figures/fig_299.jpg", width: 56%)]

#exercisebox[
+ Create your own lines using similar devices from the above examples.
+ Learn some of the above examples in all keys.
+ Write out solos on 스탠다드 재즈 진행s and incorporate some of the above examples. Practice the solos like any etude.
+ Try improvising over standard progressions and use some of the above examples in your solos.
+ Alter some of the above examples either by adding more notes, rhythmic displacing, fragmenting, etc. to come up with lines of you own.
+ Practice 제3윤곽 anticipating the thirds over the barline in all major and minor keys.
  #align(center)[#image("figures/fig_300.jpg", width: 56%)]
]

#chapter("Outline Fragments", l: "chap7")

In the discussion of harmonic clarity, the target notes were the third of ii moving to the seventh of ii, resolving to the third of V7 moving to the seventh of V7, resolving to the third of I. Fragments of outlines have been previously shown where harmonic clarity was still present with some of the elements missing.

Parker’s sequence in ex.249 relies on the seventh of ii resolving to the third of V7 for clarity. The turn, the leap from third to the root, and the rhythmic displacement give life to this example.

249. 찰리 파커:
#align(center)[#image("figures/fig_301.jpg", width: 80%)]

Brown uses similar motion in this sequence. The shape is echoed later, but with an arpeggio on the V7 chord.

250. 클리포드 브라운
#align(center)[#image("figures/fig_302.jpg", width: 44%)]

251. 클리포드 브라운
#align(center)[#image("figures/fig_303.jpg", width: 44%)]

The only note missing from Morgan’s excerpt is the third of the iiø chord. The V7 chord is anticipated and arpeggiated. The line follows 제1윤곽 one down to the third of C minor.

252. 리 모건:
#align(center)[#image("figures/fig_304.jpg", width: 45%)]

Harrell begins with an accented upper neighbor tone followed by the third. The leap is an arpeggiated tone to the fifth, The seventh on the upbeat is followed by the next target note on the downbeat.

253. 톰 하렐:
#align(center)[#image("figures/fig_305.jpg", width: 29%)]

#chapter("Outlines In Modal Tunes", l: "chap8")
Most of the music and examples discussed in this book refer to music with harmonic progressions. Many jazz compositions and improvisations are based on modal structures. There are many things to discuss regarding modal music, which will be the topic of another book.

Some jazz improvisers bring some of the be-bop vocabulary with them when playing on modal pieces. Here are two examples of 제1윤곽 used over G dorian from Randy Brecker. In the ex.254, the third of the G minor chord is approached by its leading tone. The #note("F#") and A encircle the root. E natural implies C7 and is approached from above and below. In the next example, 제1윤곽 can be clearly heard on the downbeats; leading tones have been added giving the line more of a sawtooth shape.

254. 랜디 브레커: _Passenger_
#align(center)[#image("figures/fig_306.jpg", width: 44%)]

255. 랜디 브레커: _Passenger_
#align(center)[#image("figures/fig_307.jpg", width: 56%)]

Here are two examples from a classic modal recording. Cannonball Adderley uses this C.E.S.H. version of 제3윤곽 several times in the solo to contrast with his modal, motivic, and down and dirty blues playing on this modal blues tune. The outline is played over G mixolydian.

256. 캐넌볼 애덜리:
#align(center)[#image("figures/fig_308.jpg", width: 44%)]

257. 캐넌볼 애덜리:
#align(center)[#image("figures/fig_309.jpg", width: 44%)]


#chapter("Get It In Your Playing", l: "chap9")

*How to Practice the Outlines:*

Learn the outlines in their bare form in _all_ major and minor keys. To play them in minor, use harmonic minor (the key signature for the minor key and raise the leading tone). It is difficult or impossible to elaborate on anything until you know it well.
+ Practice the outlines with the proper jazz articulations and feel. Swing the eighth notes; accent the up beats. Begin by playing them with quarter note values to get them locked in. When you speed up the quarter notes they will feel like eighth notes.
+ Take standards tunes and progressions and plug in the bare outlines. For example, on Blues:
  // TODO: should be smaller text
  - Play several choruses of a blues progression and every time you get to a ii - V7 make yourself play Outline #1.
  - After several choruses switch to Outline #2, and then #3.
  - Besides the typical ii - V7 in measures 9-10 and 12, try a ii - V7 to the IV chord in measure 4, a iio - V7 to the ii chord in measure 8.
  - All of the outlines work for the first two measures.

  In the key of F:
  
    #align(center)[#image("figures/fig_310.jpg", width: 60%)]
+ Practice some favorites from this anthology or your own collection in all keys. Try to make every note swing, accent the tops of lines and changes of direction. Do not practice sloppy or you will play sloppy.
+ Manipulate and personalize some of your favorites:
  - Change a note or two
  - Change some of the rhythms
  - Add some turns and ornaments where there weren’t any
  - Take some ornaments away
  - Try it in a minor key with the appropriate accidentals, etc.
  - Play in all keys!
+ Make up your own. Take each outline and invent several examples. Start with an outline and one device (neighbor tones, passing tones, arpeggiation tones, etc.) and invent. Again, practice in all keys.
+ Take examples of your own and others and plug into tunes and standards progressions. Prepare ahead of time to make them work.
+ Use your knowledge of these outlines to help you hear harmony. Sing the outlines over progressions. Listen to them to help you hear unfamiliar progressions. Most standard tunes never modulate more than one accidental up or down. The keys most frequently modulated to from the key of C (no sharps or flats) are: A minor (no sharps or flats), F and D minor (one flat), G and E minor (one sharp). These other keys correspond to the diatonic triads of the key of C: Dm = ii, Em = iii, F = IV, G = V, Am = vi. Practice singing modulations from the key of I to the key of ii, iii, IV, V, vi, and back again to I.
+ LISTEN! These pages just contain pitches and timing approximations. The accents, actual placement, inflections, articulations, timbre: the elements that make these lines swing, are learned by listening and imitating the great jazz artists. There is no substitute.</ol>


#chapter("Outline Exercises", l: "chap10")

For all practice use the metronome. Music is to be played in time. Put the clicks on 2 &amp; 4, as you would snap your fingers. Practice slowly at first. Set goals to increase the tempos, but strive for accuracy at any tempo. Practice playing the exercises with good rhythmic feel using jazz articulations. Practice in every key. You would have to be able to play in all 12 keys if you only played these three standard jazz tunes: _All the Things You Are, Cherokee, and Body and Soul._

#set enum(numbering: n => [#context (counter(heading).get().at(1)).#n.])


== LEARN THE BASIC OUTLINES:

+ Play through this 16 measure exercise in each major key. Repeat in each key until comfortable. Your goal should be to start in any key, play non-stop without error or hesitation through this exercise modulating through all twelve major keys.

  Whole-note harmonic rhythm:

  #align(center)[#image("figures/fig_311.jpg", width: 80%)]

+ Play through this 8 measure exercise in each major key. Repeat in each key until comfortable. Your goal should be to start in any key, play non-stop without error or hesitation through this exercise modulating through all twelve major keys.

  Half-note harmonic rhythm:

  #align(center)[#image("figures/fig_312.jpg", width: 80%)]
+ Play through exercise no. 1.1 one time as shown. The second time, improvise using the exercise as a guide. Your goal should be to start in any key, play non-stop without error or hesitation through this exercise modulating through all twelve major keys.

+ Here is an exercise using some variations on the outlines.
  #align(center)[#image("figures/fig_313.jpg", width: 80%)]

+ Take exercises 1.1—1.3 and apply to minor keys. As shown, use harmonic minor with a raised leading tone.

  Whole-note harmonic rhythm:

  #align(center)[#image("figures/fig_314.jpg", width: 80%)]

  Half-note harmonic rhythm:

  #align(center)[#image("figures/fig_315.jpg", width: 80%)]

== OUTLINES AND EAR TRAINING:

+ Sing through the first set of exercises.

+ Vocally improvise lines using exercises 1.1 and 1.2 as your guide.

+ Write down and learn some of your vocal improvisations.

+ Start in a major key and modulate to the closely related keys. (If you choose C major, modulate to D minor, E minor, F major, G major, and A minor.) Use ii7 - V7 or iiø7 - V7 of the new key to get there. Practice singing modulations to closely related keys using all three outlines as shown on the following pages.

=== USING 제1윤곽 TO MODULATE TO THE CLOSELY RELATED KEYS OF C MAJOR:

#padbox[Give yourself a starting pitch and sing the exercises. At the end check yourself for accuracy. After mastering these, try modulating to more remote keys: C to E flat, C to A flat, C to E, C to A, C to B flat, C to D, C to Gm, C to Fm, etc.]

Modulate from C major (I) to the key of D minor (ii):

#align(center)[#image("figures/fig_316.jpg", width: 80%)]

Modulate from C major (I) to the key of E minor (iii):

#align(center)[#image("figures/fig_317.jpg", width: 80%)]

Modulate from C major (I) to the key of F major (IV):

#align(center)[#image("figures/fig_318.jpg", width: 80%)]

Modulate from C major (I) to the key of G major (V):

#align(center)[#image("figures/fig_319.jpg", width: 80%)]

Modulate from C major (I) to the key of A minor (vi):

#align(center)[#image("figures/fig_320.jpg", width: 80%)]

=== USING 제2윤곽 TO MODULATE TO THE CLOSELY RELATED KEYS OF C MAJOR:

#padbox[>Give yourself a starting pitch and sing the exercises. At the end check yourself for accuracy. After mastering these, try modulating to more remote keys: C to E flat, C to A flat, C to E, C to A, C to B flat, C to D, C to Gm, C to Fm, etc.]

Modulate from C major (I) to the key of D minor (ii):

#align(center)[#image("figures/fig_321.jpg", width: 80%)]

Modulate from C major (I) to the key of E minor (iii):

#align(center)[#image("figures/fig_322.jpg", width: 80%)]

Modulate from C major (I) to the key of F major (IV):

#align(center)[#image("figures/fig_323.jpg", width: 80%)]

Modulate from C major (I) to the key of G major (V):

#align(center)[#image("figures/fig_324.jpg", width: 80%)]

Modulate from C major (I) to the key of A minor (vi):

#align(center)[#image("figures/fig_325.jpg", width: 80%)]
=== USING 제3윤곽 TO MODULATE TO THE CLOSELY RELATED KEYS OF C MAJOR:

#padbox[Give yourself a starting pitch and sing the exercises. At the end check yourself for accuracy. After mastering these, try modulating to more remote keys: C to E flat, C to A flat, C to E, C to A, C to B flat, C to D, C to Gm, C to Fm, etc.]

Modulate from C major (I) to the key of D minor (ii):

#align(center)[#image("figures/fig_326.jpg", width: 80%)]

Modulate from C major (I) to the key of E minor (iii):

#align(center)[#image("figures/fig_327.jpg", width: 80%)]

Modulate from C major (I) to the key of F major (IV):

#align(center)[#image("figures/fig_328.jpg", width: 80%)]

Modulate from C major (I) to the key of G major (V):

#align(center)[#image("figures/fig_329.jpg", width: 80%)]

Modulate from C major (I) to the key of A minor (vi):

#align(center)[#image("figures/fig_330.jpg", width: 80%)]

== APPLYING SPECIFIC DEVICES TO 제1윤곽:

Take the simple outline and apply one or more devices to create a more interesting, more musical line. Practice them in all major keys. Try doing the same lines in the minor keys. Here are a few examples. Invent and practice several of your own.

1. Scale motion used to fill out the measure:
#align(center)[#image("figures/fig_331.jpg", width: 69%)]
2. Using arpeggiated tones:
#align(center)[#image("figures/fig_332.jpg", width: 69%)]
3. Upper neighbor tones (UNT) used to create a sequence:
#align(center)[#image("figures/fig_333.jpg", width: 68%)]
4. Similar to the previous exercise, but with upper arpeggiated tones instead of upper neighbors. This line is reminiscent of Baroque music.
#align(center)[#image("figures/fig_334.jpg", width: 69%)]
5. Combination of simple devices. Encircling and arpeggiated tones.
#align(center)[#image("figures/fig_335.jpg", width: 69%)]
6. Upper and lower neighbor tones (LNT). The target notes for G7 and C major are rhythmically anticipated.
#align(center)[#image("figures/fig_336.jpg", width: 68%)]
7. Third to flat-nine leap in the second measure:
#align(center)[#image("figures/fig_337.jpg", width: 68%)]
8. Simple outline with pick up notes:
#align(center)[#image("figures/fig_338.jpg", width: 68%)]
9. Arpeggio used for octave displacement, chromatic approaches, displaced arpeggio on the G7 chord:
#align(center)[#image("figures/fig_339.jpg", width: 68%)]
10. Encircling, UNT, anticipated last target note:
#align(center)[#image("figures/fig_340.jpg", width: 68%)]
11. Encircling, UNT, chromatic approach to last target note:
#align(center)[#image("figures/fig_341.jpg", width: 68%)]
12. Encircling:
#align(center)[#image("figures/fig_342.jpg", width: 69%)]
13. Encircling using many more chromatic passing tones (PT), borrowed tones, and LNT:
#align(center)[#image("figures/fig_343.jpg", width: 69%)]
14. Chromatic approach from below and above:
#align(center)[#image("figures/fig_344.jpg", width: 69%)]
15. Encircling. (The arpeggio in the second measure suggests 제2윤곽 in the middle of 제1윤곽):
#align(center)[#image("figures/fig_345.jpg", width: 69%)]
16. Chromatic passing tones, C.E.S.H.:
#align(center)[#image("figures/fig_346.jpg", width: 69%)]
17. Chromatic passing tones, arpeggiated tones, C.E.S.H., and encircling:
#align(center)[#image("figures/fig_347.jpg", width: 69%)]
18. Octave displacement, chromatic approaches, delayed resolution to tonic:
#align(center)[#image("figures/fig_348.jpg", width: 68%)]

Here is how a simple outline can be transformed into a more complex line.

19. The simple outline is first shown with some added rhythmic interest:
#align(center)[#image("figures/fig_349.jpg", width: 44%)]
20. The F is octave displaced:
#align(center)[#image("figures/fig_350.jpg", width: 44%)]
21. An arpeggio is used to fill in the octave:
#align(center)[#image("figures/fig_351.jpg", width: 44%)]
22. The F is displaced again, giving the line a more angular shape:
#align(center)[#image("figures/fig_352.jpg", width: 44%)]
23. Chromatic pick-ups are added from above to the F, from below to the B.
#align(center)[#image("figures/fig_353.jpg", width: 69%)]

== APPLYING SPECIFIC DEVICES TO 제2윤곽:


Take the simple outline and apply one or more devices to create a more interesting, more musical line. Practice them in all major keys. Try doing the same lines in the minor keys. Here are a few examples. Invent and practice several of your own.

1. Begins with two scale steps, PT:
#align(center)[#image("figures/fig_354.jpg", width: 69%)]
2. Scalar passages:
#align(center)[#image("figures/fig_355.jpg", width: 80%)]
3. LNT sequence:
#align(center)[#image("figures/fig_356.jpg", width: 69%)]
4. LNT, encircling, octave displacement:
#align(center)[#image("figures/fig_357.jpg", width: 69%)]
5. PT, arpeggiated tone:
#align(center)[#image("figures/fig_358.jpg", width: 69%)]
6. Four-note cycle returns to the first note.
#align(center)[#image("figures/fig_359.jpg", width: 69%)]
7. Pick up notes from the scale:
#align(center)[#image("figures/fig_360.jpg", width: 69%)]
8. Pickup notes from the fifth:
#align(center)[#image("figures/fig_361.jpg", width: 69%)]
9. LNT with extended arpeggio, chromatic encircling:
#align(center)[#image("figures/fig_362.jpg", width: 69%)]
10. Unexpected chromatic resolution (The C — #note("C#") pulls up to the D, the E — E flat pull down), chromatic encircling:
#align(center)[#image("figures/fig_363.jpg", width: 80%)]
11. Series of encircled notes:
#align(center)[#image("figures/fig_364.jpg", width: 80%)]
12. Root of the ii chord preceded and encircled by its dominant, extended arpeggio, encircled B:
#align(center)[#image("figures/fig_365.jpg", width: 68%)]
13. Arpeggio begins from below, displaced arpeggios. The second measure is two arpeggios: G7 from the third (3-5-7-9) and from the root (1-3-5-7). The displacement creates a jagged line and at the same time emphasizes the step progression C — B — A — G — F — E.
#align(center)[#image("figures/fig_366.jpg", width: 69%)]

== APPLYING SPECIFIC DEVICES TO 제3윤곽:

Take the simple outline and apply one or more devices to create a more interesting, more musical line. Practice them in all major keys. Try doing the same lines in the minor keys. Here are a few examples. Invent and practice several of your own.

1. Begins with scalar passages (inversion of 4.2) sequenced:
#align(center)[#image("figures/fig_367.jpg", width: 80%)]
2. LNT, stop and go rhythmic feel:
#align(center)[#image("figures/fig_368.jpg", width: 80%)]
3. LNT, PT, C.E.S.H., octave displacement, encircling:
#align(center)[#image("figures/fig_369.jpg", width: 80%)]
4. Pick up notes, outline delayed until the second measure:
#align(center)[#image("figures/fig_370.jpg", width: 80%)]
5. Chromatic pick up notes, encircling tones:
#align(center)[#image("figures/fig_371.jpg", width: 80%)]
6. Chromatic encircling tones:
#align(center)[#image("figures/fig_372.jpg", width: 80%)]
7. Encirling, arpeggiated tone, chromatic approaches. The leap from D down to F in m.1 is mirrored in the last measure:
#align(center)[#image("figures/fig_373.jpg", width: 69%)]
8. LNTs. The rhythmic accents sometimes suggest a dotted quarter rhythm:
#align(center)[#image("figures/fig_374.jpg", width: 68%)]

== SHORT EXERCISES OVER TYPICAL PROGRESSIONS:


Invent short exercises over typical progressions and follow the outlines. This example uses all three outlines. The first two measures (ii - V7) use 제3윤곽 with many chromatic approaches and encircling tones. A fairly simple 제1윤곽 is in the second two measures (iii - V7/ii). In mm.5—6 (ii - V7) is 제2윤곽 with some pick up notes.

#align(center)[#image("figures/fig_375.jpg", width: 80%)]

== USING OUTLINES TO CONNECT OTHER CHORDS

Practice this progression with all of the outlines for practice connecting all chord types. The progression is:

#align(center)[#image("figures/fig_376.jpg", width: 23%)]

Practice these exercises slowly until comfortable, then speed them up. Practice goal should be to play them in all twelve major keys without hesitation or error at any tempo you begin.

1. Using 제1윤곽 to connect the target notes:
#align(center)[#image("figures/fig_377.jpg", width: 80%)]
2. Using 제2윤곽. The outline starts on the odd measures in the first half, and the even measures on the last half of this exercise:
#align(center)[#image("figures/fig_378.jpg", width: 80%)]
3. Using 제3윤곽. The outline starts on the odd measures in the first half, and is inverted on the last half of this exercise:
#align(center)[#image("figures/fig_379.jpg", width: 80%)]
4. This exercise is based on 제1윤곽. The third of each chord occurs on the downbeat of every measure followed by an arpeggio, before continuing down the scale. The arpeggio is octave displaced in every other measure.
#align(center)[#image("figures/fig_380.jpg", width: 80%)]

== USING OUTLINES TO CONNECT OTHER CHORDS


The progression from exercise 7 is shown here with some elaboration. Can you determine what devices are used?

+ 8.1 제1윤곽:
#align(center)[#image("figures/fig_381.jpg", width: 80%)]
+ 8.2 제2윤곽:
#align(center)[#image("figures/fig_382.jpg", width: 80%)]
+ 8.3 제3윤곽:
#align(center)[#image("figures/fig_383.jpg", width: 80%)]

== USING OUTLINES OVER TURNAROUND PROGRESSIONS


Practice the outlines over turnaround progressions.. Turnaround progressions occur as the last two measures of the blues and countless jazz and pop standard tunes, and as the basis for tunes like _I Got Rhythm_ and _Heart and Soul._ Practice these exercises in all twelve keys.

1.  Typical turnaround progression (I - V/ii - ii - V etc., in the key of F major):
#align(center)[#image("figures/fig_384.jpg", width: 80%)]
2.  Turnaround progression with more secondary dominants (I - V7/ii - V7/V - V7 - V/vi etc., in the key of F major):
#align(center)[#image("figures/fig_385.jpg", width: 80%)]
3.  제1윤곽 in a cycle (iii - V/ii - ii - V - I - [tritone substitute dominant of iii] in the key of C major):
#align(center)[#image("figures/fig_386.jpg", width: 80%)]
4.  제2윤곽 in a cycle (iii - V/ii - ii - V - I - [tritone substitute dominant of iii] in the key of C major):
#align(center)[#image("figures/fig_387.jpg", width: 80%)]
5.  제3윤곽 in a cycle (iii - V/ii - ii - V - I - [tritone substitute dominant of iii] in the key of C major):
#align(center)[#image("figures/fig_388.jpg", width: 80%)]
6.  The longer harmonic rhythm makes it possible to embellish this cycle with chromatic leading tones. The progression is iii - V/ii - ii - V in the key of C major:
#align(center)[#image("figures/fig_389.jpg", width: 80%)]

== OUTLINES IN KEY CENTER CYCLES

Practice the key center cycle with a faster harmonic rhythm. In exercise 7, the chords changed every measure; here they change every two beats.

1. 제1윤곽 through key center cycle:
#align(center)[#image("figures/fig_390.jpg", width: 80%)]
2. 제1윤곽 variation through cycle:
#align(center)[#image("figures/fig_391.jpg", width: 80%)]
3. 제2윤곽 through cycle:
#align(center)[#image("figures/fig_392.jpg", width: 80%)]
4. 제2윤곽 variation through cycle:
#align(center)[#image("figures/fig_393.jpg", width: 80%)]
5. 제3윤곽 through cycle:
#align(center)[#image("figures/fig_394.jpg", width: 80%)]
6. 제3윤곽 variation through cycle:
#align(center)[#image("figures/fig_395.jpg", width: 80%)]

=== 스탠다드 재즈 진행에의 윤곽 적용

이 윤곽들을 연주에 통합하기 위해 가장 중요한 일 중 하나는 이를 스탠다드 곡과 진행에 적용하는 것이다. 이전 연습에서는 한 번에 하나의 조에서만 이를 사용하기 시작했다. 그러나 스탠다드 곡들은 가까운 조와 먼 조로 전조하며, 화성 리듬이 다양하게 나타난다. 다음 연습에서는 윤곽을 블루스, "Rhythm Changes", 그리고 스탠다드 재즈 곡의 진행에 적용한다. 먼저 곡의 전체 형식에 대해 단순한 윤곽만 연주하는 것으로 시작하라. 악기 없이 윤곽을 노래하고 화음 변화를 들어보도록 노력하라. 변화를 듣고 실제 음정을 부를 수 있다면, 진행 위에서 좋은 선율을 듣고 즉흥 연주할 준비가 더 잘될 것이다. 단순한 윤곽을 숙달한 후, 형식 위에서 즉흥 연주를 시도하라. 연습할 때는 한 번에 하나의 윤곽으로 자신을 제한하라. 각 윤곽에 대해 형식을 여러 번 연주하며 기본 선율을 꾸미는 연습을 하라. 세 가지 윤곽 모두를 숙달한 후에는 다양한 윤곽의 조합을 시도하라.

== STANDARD PROGRESSION I: BLUES IN B FLAT

=== A SECTION

1. 제1윤곽:
#align(center)[#image("figures/fig_396.jpg", width: 80%)]
2. 제2윤곽:
#align(center)[#image("figures/fig_397.jpg", width: 80%)]
3. 제3윤곽:
#align(center)[#image("figures/fig_398.jpg", width: 80%)]

== STANDARD PROGRESSION II: “RHYTHM CHANGES”

=== A SECTION

1. 제1윤곽:
#align(center)[#image("figures/fig_399.jpg", width: 80%)]
2. 제2윤곽:
#align(center)[#image("figures/fig_400.jpg", width: 80%)]
3. 제3윤곽:
#align(center)[#image("figures/fig_401.jpg", width: 80%)]

=== “RHYTHM CHANGES” B SECTION

12.4 제1윤곽 with half note values:
#align(center)[#image("figures/fig_402.jpg", width: 80%)]
5. 제1윤곽 implying a ii - V in mm.1—2, and mm.5—6:
#align(center)[#image("figures/fig_403.jpg", width: 80%)]
6. 제1윤곽 implying a ii - V in mm.3—4, and mm.7—8:
#align(center)[#image("figures/fig_404.jpg", width: 80%)]
7. 제2윤곽 with half notes values:
#align(center)[#image("figures/fig_405.jpg", width: 80%)]
8. 제2윤곽 implying a ii - V in mm.1—2, and mm.5—6:
#align(center)[#image("figures/fig_406.jpg", width: 80%)]
9. 제2윤곽 implying a ii - V in mm.3—4, and mm.7—8:
#align(center)[#image("figures/fig_407.jpg", width: 80%)]
10. 제3윤곽 with half note values:
#align(center)[#image("figures/fig_408.jpg", width: 80%)]
11. 제3윤곽 with half note values:
#align(center)[#image("figures/fig_409.jpg", width: 80%)]
12. 제3윤곽 implying a ii - V in mm.1—2, and mm.5—6:
#align(center)[#image("figures/fig_410.jpg", width: 80%)]
13. 제3윤곽 implying a ii - V in mm.3—4, and mm.7—8:
#align(center)[#image("figures/fig_411.jpg", width: 80%)]

== 스탠다드 재즈 진행 III: Are You All the Outlines#footnote[스탠다드 재즈 곡 "All the Things You Are"의 변형 (역주)]

#fb[
  1. 제1윤곽:
  #align(center)[#image("figures/fig_412.jpg", width: 80%)]
]

#fb[
  Outlines to 스탠다드 재즈 진행 III. _Are You All the Outlines_에 윤곽 적용하기

  2. 제2윤곽 beginning in m.1:
  #align(center)[#image("figures/fig_413.jpg", width: 80%)]
]

#fb[
  스탠다드 재즈 진행 III. _Are You All the Outlines_에 윤곽 적용하기

  3. 제2윤곽 beginning in m.2:
  #align(center)[#image("figures/fig_414.jpg", width: 80%)]
]

#fb[
  스탠다드 재즈 진행 III. _Are You All the Outlines_에 윤곽 적용하기

  4. 제3윤곽 beginning in m.1:
  #align(center)[#image("figures/fig_415.jpg", width: 80%)]
]

#fb[
  스탠다드 재즈 진행 III. _Are You All the Outlines_에 윤곽 적용하기

  5. 제3윤곽 beginning in m.2:
  #align(center)[#image("figures/fig_416.jpg", width: 80%)]
]

== 스탠다드 재즈 진행 IV: _Outlines by Starlight_

#fb[
  1. 제1윤곽:
  #align(center)[#image("figures/fig_417.jpg", width: 80%)]
]

#fb[
  스탠다드 재즈 진행 _IV.,Outlines by Starlight_에 윤곽 적용하기

  2. 제2윤곽 beginning in m.1:
  #align(center)[#image("figures/fig_418.jpg", width: 80%)]
]

#fb[
  스탠다드 재즈 진행 IV. _Outlines by Starlight_에 윤곽 적용하기

  3. 제2윤곽 beginning in m.2:
  #align(center)[#image("figures/fig_419.jpg", width: 80%)]
]

#fb[
  스탠다드 재즈 진행 IV. _Outlines by Starlight_에 윤곽 적용하기

  4. 제3윤곽 beginning in m.1:
  #align(center)[#image("figures/fig_420.jpg", width: 80%)]
]

#fb[
  스탠다드 재즈 진행 IV. _Outlines by Starlight_에 윤곽 적용하기

  5. 제3윤곽 beginning in m.2:
  #align(center)[#image("figures/fig_421.jpg", width: 80%)]
]

== 스탠다드 재즈 진행 V: BLUES WITH ii - V SUBSTITUTIONS

1. 제1윤곽:
#align(center)[#image("figures/fig_422.jpg", width: 80%)]

스탠다드 재즈 진행 V. Blues with ii - V substitutions에 윤곽 적용하기

2. 제2윤곽 beginning in first half of measure:
#align(center)[#image("figures/fig_423.jpg", width: 80%)]

스탠다드 재즈 진행 V. Blues with ii - V substitutions에 윤곽 적용하기

3. 제2윤곽 beginning in second half of measure:
#align(center)[#image("figures/fig_424.jpg", width: 80%)]

스탠다드 재즈 진행 V. Blues with ii - V substitutions에 윤곽 적용하기

4. 제3윤곽 beginning in first half of measure:
#align(center)[#image("figures/fig_425.jpg", width: 80%)]

스탠다드 재즈 진행 V. Blues with ii - V substitutions에 윤곽 적용하기

5. 제3윤곽 beginning in second half of measure:
#align(center)[#image("figures/fig_426.jpg", width: 80%)]

== 스탠다드 재즈 진행 VI.: _BIG STRIDES WITH OUTLINES_

#set enum(numbering: n => [16.#n.])

1. 제1윤곽:
#align(center)[#image("figures/fig_427.jpg", width: 80%)]

스탠다드 재즈 진행 VI. _Big Strides with Outlines_에 윤곽 적용하기

2. 제2윤곽:
#align(center)[#image("figures/fig_428.jpg", width: 80%)]

스탠다드 재즈 진행 VI, _Big Strides with Outlines_에 윤곽 적용하기

3. 제2윤곽:
#align(center)[#image("figures/fig_429.jpg", width: 80%)]

스탠다드 재즈 진행 VI. _Big Strides with Outlines_에 윤곽 적용하기

4. 제3윤곽:
#align(center)[#image("figures/fig_430.jpg", width: 80%)]

스탠다드 재즈 진행 VI. _Big Strides with Outlines_에 윤곽 적용하기

5. 제3윤곽:
#align(center)[#image("figures/fig_431.jpg", width: 80%)]

== IDENTIFYING OUTLINES

Learn to identify outlines and recognize the devices used to embellish them. Here are five examples from Cannonball Adderley. Identify which outline is shown, and what devices are used to make them interesting.

1. 캐넌볼 애덜리:
#align(center)[#image("figures/fig_432.jpg", width: 47%)]
2. 캐넌볼 애덜리:
#align(center)[#image("figures/fig_433.jpg", width: 47%)]
3. 캐넌볼 애덜리:
#align(center)[#image("figures/fig_434.jpg", width: 47%)]
4. 캐넌볼 애덜리:
#align(center)[#image("figures/fig_435.jpg", width: 47%)]
5. 캐넌볼 애덜리:
#align(center)[#image("figures/fig_436.jpg", width: 35%)]

Find other examples in jazz literature. Practice and learn them in all keys. Answers on page 145.


#chapter("다음에 무엇을 할 것인가?", l: "chap11")

== 들어라

이 책의 예시는 훌륭한 재즈 솔로를 구성하는 일부에 불과하다. 이와 다른 예술가들의 전체 솔로를 들어보라. 아이디어의 전개를 들어보고, 흥미로운 선율의 형태와 리듬을 찾아라. 화성적 명확성과 일반화 사이의 균형과 대비를 들어라. 모티프 전개와 화성 변화의 흐름, 복잡한 리듬과 단순한 리듬, 여백과 두껍고 복잡한 질감, 블루스 아이디어와 구체성을 들어보라.

좋아하는 음악의 일부를 발췌하라. 그 일부에서 자신이 기억하고 이해할 수 있는 무언가를 발견하라. 이 책이나 자신의 경험에서 나온 어떤 기법이라도 적용하여 그 일부를 발전시키고 개인화해 보라. 연습 시간 동안 창의력을 발휘해 보라.

== 연습하라

나는 고등학교 야구팀이 외야에서 컷오프맨에게 공을 던지고, 컷오프맨이 홈 플레이트로 공을 전달하는 루틴을 연습하는 모습을 본 적이 있다. 그들은 이 루틴을 최소 45분 동안 연습했다. 그들 모두 그 방법을 듣고 기억할 정도로 충분히 똑똑했다. 다음 주 시험에서 답변으로 말할 수도 있었을 것이다. 하지만 그들은 이 루틴을 반복적으로 연습해, 생각 없이 반응할 수 있도록 자동화했다. 팀이 경기 준비를 하기 위해서는 경기를 구성하는 모든 요소를 연습하며, 각 요소를 개별적으로 연마해야 한다. 타격, 번트, 캐치, 투구, 주루, 수비 플레이 등 모든 부분이 이에 해당한다. 이것이 즉흥 연주를 연습하는 방법이다. 전체는 구성 요소를 분해해 반복적으로 연습한 뒤 다시 합쳐지는 방식으로 배워진다.

어느 날, 내 학생 중 한 명이 레슨 중에 스케일을 제대로 연주하지 못했다. 나는 그에게 매일 스케일을 몇 번 연습하는지 물었다. 그는 적어도 한 번은 연습한다고 말했다. 나는 그가 테니스를 치는 것을 알고 있었기에, 테니스 코트에서 서브를 몇 번 연습하는지 물었다. 그는 약 800번 정도라고 답했다. 그가 왜 피아노보다 테니스를 더 잘했는지는 명백했다. 즉흥 연주를 연습하는 방법은 이와 같다. 반복적인 연습을 통해 자동으로 연주할 수 있을 때까지 연습하라.

== 귀를 훈련하라

귀를 훈련해 어떤 선율을 들었을 때 즉시 악기로 연주할 수 있도록 하라. 악보를 보았을 때 즉시 그 소리가 어떤지 상상할 수 있어야 한다. 소리, 악기에서의 운지, 악보에 적힌 음표가 모두 마음속에서 연결되어야 한다. 이 세 가지는 삼각형을 형성한다: 청각적 형태, 기보 형태(음표와 화음 기호), 악기에서 만들어내는 실제 경험. 이를 연습 루틴 속에서 통합하라. 귀 훈련은 평생 동안 이어지는 과정이며, 완료하고 끝낼 수 있는 수업이 아니다.

#align(center)[#image("figures/fig_437.jpg", width: 64%)]

== 연주하라

연주하라. 그것이 우리가 하는 일이다. 연습과 공연에 있어 놀이하듯 접근하라. 다른 연주자들의 연주를 듣고 반응할 준비를 하라. 음악적으로 무엇을 해야 하고 무엇을 할 수 있을지에 대해 충분히 연습하고 고민했다면, 자신의 본능을 신뢰할 수 있을 것이다.