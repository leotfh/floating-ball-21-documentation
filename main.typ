#import "utils.typ": *

#show: project-layout

#include "content/0_frontmatter.typ"

// Change numbering from roman to arabic after frontmatter
#set page(numbering: "1")
#counter(page).update(1)

#include "content/1_introduction.typ"
#include "content/2_getting_started.typ"
#include "content/3_operation.typ"
#include "content/4_troubleshooting.typ"