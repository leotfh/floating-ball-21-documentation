#import "utils.typ": *

#show: project-layout

#include "content/0_frontmatter.typ"

// Change numbering from roman to arabic after frontmatter
#set page(numbering: "1")
#counter(page).update(1)

#include "content/1_introduction.typ"
#pagebreak()
#include "content/2_getting_started.typ"
#pagebreak()
#include "content/4_operation.typ"
#pagebreak()
#include "content/3_simulink_model.typ"
#pagebreak()
#include "content/5_troubleshooting.typ"
#pagebreak()
#include "content/6_future_development.typ"
//#pagebreak()