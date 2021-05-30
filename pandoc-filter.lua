--[[
 CDDL HEADER START

 The contents of this file are subject to the terms of the
 Common Development and Distribution License (the "License").
 You may not use this file except in compliance with the License.

 You can obtain a copy of the license at https://illumos.org/license/
 
 When distributing Covered Code, include this CDDL HEADER in each
 file and include the License file at https://illumos.org/license/
 If applicable, add the following below this CDDL HEADER, with the
 fields enclosed by brackets "[]" replaced with your own identifying
 information: Portions Copyright [yyyy] [name of copyright owner]

 CDDL HEADER END


 Copyright 2021 J. Madgwick.  All rights reserved.
--]]

if FORMAT:match 'latex' then
    -- Wrap 'Div' block content with a tcolorbox (resembling the website)
    function Div(elem)
      if (elem.classes[1] == "well") then
          elem.content:insert(1,pandoc.RawBlock('latex', '\\begin{tcolorbox}'))
          elem.content:insert(pandoc.RawBlock('latex', '\\end{tcolorbox}'))
        return elem
      end
    end

    -- Replace image tags with a representative character (symbolfont ensures appropraitre font is used)
    function RawInline(elem)
      if (elem.text == "<i class=\"fa fa-info-circle fa-lg\" aria-hidden=\"true\">") then
        return pandoc.RawInline('latex', '{\\symbolfont 🛈}')
      elseif (elem.text == "<i class=\"fa fa-exclamation-triangle fa-lg\" aria-hidden=\"true\">") then
        return pandoc.RawInline('latex', '{\\symbolfont 🛆}')
      end
    end

    -- Use the top Header (which is actually the title) as a LaTex title + TOC, reduce other 'Header' levels by one
    function Header(elem)
      if (elem.level == 1) then
        elem.content:insert(1,pandoc.RawInline('latex', '\\title{'))
        elem.content:insert(pandoc.RawInline('latex', '}\\maketitle\\setcounter{tocdepth}{3}\\tableofcontents\\newpage'))
        return pandoc.Plain(elem.content)
      else
        elem.level = elem.level - 1
        return elem
      end
    end
end
