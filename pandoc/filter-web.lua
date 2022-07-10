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
    documentTitle = ""

    -- Use the top Header (which is actually the title) as a LaTex title + TOC, reduce other 'Header' levels by one
    function Header(elem)
      if (elem.level == 1) then
        documentTitle = pandoc.utils.stringify(elem.content) -- Extract text as a string to use in the metadata
        table.insert(elem.content,1,pandoc.RawInline('latex', '\\title{'))
        table.insert(elem.content,pandoc.RawInline('latex', '}\\maketitle\\tableofcontents\\newpage'))
        return pandoc.Plain(elem.content)
      else
        elem.level = elem.level - 1
        return elem
      end
    end

    -- Set the PDF title metadata
    function Meta(m)
      m['title-meta'] = documentTitle
      return m
    end

    -- Wrap 'Div' block content with a tcolorbox (resembling the website), Replace image tags with a representative character (symbolfont ensures appropriate font is used)
    function Pandoc(thedoc)
      local blocks = thedoc.blocks
      local i = 1
      local noteBegin = pandoc.RawBlock('latex', '\\begin{tcolorbox}{\\symbolfont 🛈} \\textbf{NOTE:}')
      local cautionBegin = pandoc.RawBlock('latex', '\\begin{tcolorbox}{\\symbolfont 🛆} \\textbf{CAUTION:}')
      local noteEnd = pandoc.RawBlock('latex', "\\end{tcolorbox}")
      while i <= #blocks do
        if (blocks[i].t == "Div" and (blocks[i].classes[1] == "note" or blocks[i].classes[1] == "info")) then
          table.insert(blocks[i].content,1,noteBegin)
          table.insert(blocks[i].content,noteEnd)
        elseif (blocks[i].t == "Div" and (blocks[i].classes[1] == "warning" or blocks[i].classes[1] == "caution")) then
          table.insert(blocks[i].content,1,cautionBegin)
          table.insert(blocks[i].content,noteEnd)
        end
        i = i + 1
      end
      return thedoc
    end
end
